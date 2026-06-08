from __future__ import annotations

import argparse
import csv
import json
from dataclasses import asdict, dataclass
from pathlib import Path

import matplotlib

matplotlib.use("Agg")

import matplotlib.pyplot as plt
import numpy as np
from scipy.signal import find_peaks


@dataclass(frozen=True)
class ShellComparison:
    n: int
    predicted_radius: float
    observed_radius: float
    absolute_error: float
    relative_error: float


def radial_profile(
    r_grid: np.ndarray,
    field: np.ndarray,
    domain_radius: float,
    bins: int,
) -> tuple[np.ndarray, np.ndarray]:
    r_bins = np.linspace(0.0, domain_radius, bins)
    r_centers = 0.5 * (r_bins[:-1] + r_bins[1:])
    profile = np.zeros_like(r_centers)

    for index in range(len(r_centers)):
        mask = (r_grid >= r_bins[index]) & (r_grid < r_bins[index + 1])
        if np.any(mask):
            profile[index] = float(np.mean(np.abs(field[mask])))

    return r_centers, profile


def compare_shells(
    *,
    grid_size: int,
    domain_half_width: float,
    radial_bins: int,
    oscillation_scale: float,
    peak_height_fraction: float,
    damping: float,
    profile_mode: str,
) -> tuple[dict[str, float | int], list[ShellComparison], np.ndarray, np.ndarray, np.ndarray, np.ndarray]:
    axis = np.linspace(-domain_half_width, domain_half_width, grid_size)
    x_grid, y_grid = np.meshgrid(axis, axis)
    r_grid = np.sqrt(x_grid**2 + y_grid**2)
    domain_radius = float(np.max(r_grid))

    j11 = 3.83170597
    j_half = float(np.pi)
    delta = (j11 - j_half) / j11

    # Theorem-consistent scaled phase:
    # Delta alpha_s(r) = scale * j11 * delta * r / R.
    phase = oscillation_scale * j11 * delta * (r_grid / domain_radius)
    field = np.cos(phase) * np.exp(-(r_grid**2) * damping)

    if profile_mode == "raw_abs":
        profile_field = np.abs(field)
    elif profile_mode == "envelope_corrected_abs":
        envelope = np.exp(-(r_grid**2) * damping)
        profile_field = np.abs(field) / np.maximum(envelope, np.finfo(float).eps)
    elif profile_mode == "oscillatory_abs":
        profile_field = np.abs(np.cos(phase))
    else:
        raise ValueError(
            "profile_mode must be one of: raw_abs, envelope_corrected_abs, oscillatory_abs"
        )

    r_centers, profile = radial_profile(r_grid, profile_field, domain_radius, radial_bins)
    peaks, peak_info = find_peaks(
        profile,
        height=float(np.max(profile) * peak_height_fraction),
    )
    observed = r_centers[peaks]

    n_values = np.arange(1, len(observed) + 1)
    predicted = n_values * np.pi * domain_radius / (j11 * delta * oscillation_scale)

    comparisons: list[ShellComparison] = []
    for n, predicted_radius, observed_radius in zip(n_values, predicted, observed):
        absolute_error = float(abs(predicted_radius - observed_radius))
        relative_error = float(absolute_error / predicted_radius) if predicted_radius else 0.0
        comparisons.append(
            ShellComparison(
                n=int(n),
                predicted_radius=float(predicted_radius),
                observed_radius=float(observed_radius),
                absolute_error=absolute_error,
                relative_error=relative_error,
            )
        )

    summary: dict[str, float | int] = {
        "grid_size": grid_size,
        "domain_half_width": domain_half_width,
        "domain_radius": domain_radius,
        "radial_bins": radial_bins,
        "oscillation_scale": oscillation_scale,
        "peak_height_fraction": peak_height_fraction,
        "damping": damping,
        "profile_mode": profile_mode,
        "j11": j11,
        "j_half": j_half,
        "delta": delta,
        "detected_peaks": int(len(observed)),
        "mean_absolute_error": float(np.mean([row.absolute_error for row in comparisons]))
        if comparisons
        else 0.0,
        "max_absolute_error": float(np.max([row.absolute_error for row in comparisons]))
        if comparisons
        else 0.0,
        "mean_relative_error": float(np.mean([row.relative_error for row in comparisons]))
        if comparisons
        else 0.0,
    }
    return summary, comparisons, r_centers, profile, observed, field


def write_outputs(
    *,
    output_dir: Path,
    summary: dict[str, float | int],
    comparisons: list[ShellComparison],
    r_centers: np.ndarray,
    profile: np.ndarray,
    observed: np.ndarray,
    field: np.ndarray,
    domain_half_width: float,
) -> None:
    output_dir.mkdir(parents=True, exist_ok=True)

    rows = [asdict(row) for row in comparisons]
    (output_dir / "delta_alpha_shell_comparison.json").write_text(
        json.dumps({"summary": summary, "comparisons": rows}, indent=2),
        encoding="utf-8",
    )

    with (output_dir / "delta_alpha_shell_comparison.csv").open(
        "w",
        newline="",
        encoding="utf-8",
    ) as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=[
                "n",
                "predicted_radius",
                "observed_radius",
                "absolute_error",
                "relative_error",
            ],
        )
        writer.writeheader()
        writer.writerows(rows)

    lines = [
        "# Delta Alpha Shell Radius Comparison",
        "",
        "Synthetic theorem-consistent check:",
        "",
        "`Delta alpha_s(r) = scale * j11 * delta * r / R`",
        "",
        "`r_n = n*pi*R/(scale*j11*delta)`",
        "",
        "## Summary",
        "",
    ]
    for key, value in summary.items():
        lines.append(f"- `{key}`: `{value}`")
    lines.extend(
        [
            "",
            "## Shells",
            "",
            "| n | predicted radius | observed radius | absolute error | relative error |",
            "|---:|---:|---:|---:|---:|",
        ]
    )
    for row in comparisons:
        lines.append(
            f"| {row.n} | {row.predicted_radius:.6f} | {row.observed_radius:.6f} | "
            f"{row.absolute_error:.6f} | {row.relative_error:.6%} |"
        )
    (output_dir / "delta_alpha_shell_comparison.md").write_text(
        "\n".join(lines) + "\n",
        encoding="utf-8",
    )

    fig, axes = plt.subplots(1, 2, figsize=(11, 4.5))
    axes[0].plot(r_centers, profile, label="Radial profile")
    if len(observed):
        peak_indices = [int(np.argmin(np.abs(r_centers - radius))) for radius in observed]
        axes[0].scatter(
            observed,
            profile[peak_indices],
            color="red",
            label="Detected peaks",
            zorder=3,
        )
    axes[0].set_title("Radial Profile with Peaks")
    axes[0].set_xlabel("r")
    axes[0].set_ylabel("Mean absolute field")
    axes[0].legend()

    image = axes[1].imshow(
        field,
        extent=[
            -domain_half_width,
            domain_half_width,
            -domain_half_width,
            domain_half_width,
        ],
        origin="lower",
        cmap="viridis",
    )
    axes[1].set_title("Synthetic Delta Alpha Field")
    fig.colorbar(image, ax=axes[1], fraction=0.046, pad=0.04)
    fig.tight_layout()
    fig.savefig(output_dir / "delta_alpha_shell_comparison.png", dpi=180)
    plt.close(fig)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Compare Delta-alpha Bessel shell predictions with detected synthetic radial peaks.",
    )
    parser.add_argument("--grid-size", type=int, default=500)
    parser.add_argument("--domain-half-width", type=float, default=1.0)
    parser.add_argument("--radial-bins", type=int, default=300)
    parser.add_argument("--oscillation-scale", type=float, default=10.0)
    parser.add_argument("--peak-height-fraction", type=float, default=0.1)
    parser.add_argument("--damping", type=float, default=2.0)
    parser.add_argument(
        "--profile-mode",
        choices=["raw_abs", "envelope_corrected_abs", "oscillatory_abs"],
        default="oscillatory_abs",
        help="Profile used for peak detection. raw_abs includes damping; the other modes isolate phase shells.",
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path("phase2_checks") / "delta_alpha_shell_run",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    summary, comparisons, r_centers, profile, observed, field = compare_shells(
        grid_size=args.grid_size,
        domain_half_width=args.domain_half_width,
        radial_bins=args.radial_bins,
        oscillation_scale=args.oscillation_scale,
        peak_height_fraction=args.peak_height_fraction,
        damping=args.damping,
        profile_mode=args.profile_mode,
    )
    write_outputs(
        output_dir=args.output_dir,
        summary=summary,
        comparisons=comparisons,
        r_centers=r_centers,
        profile=profile,
        observed=observed,
        field=field,
        domain_half_width=args.domain_half_width,
    )

    print("Delta alpha shell comparison")
    print(json.dumps(summary, indent=2))
    for row in comparisons:
        print(
            f"n={row.n}: pred={row.predicted_radius:.6f}, "
            f"obs={row.observed_radius:.6f}, error={row.absolute_error:.6f}, "
            f"rel={row.relative_error:.4%}"
        )


if __name__ == "__main__":
    main()
