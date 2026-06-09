from __future__ import annotations

import csv
import json
import shutil
import subprocess
from datetime import datetime, timezone
from pathlib import Path


ROOT = Path(__file__).resolve().parent
RELEASE = ROOT / "release_phase3"
SPINE_SOURCE = Path(r"D:\00_Engine\AI_Workspaces\OpenAI2\new_gold_spines")


def rel(path: Path) -> str:
    return str(path.relative_to(ROOT)).replace("\\", "/")


def rel_from_release(path: str) -> str:
    return str(Path(path).relative_to("release_phase3")).replace("\\", "/")


def git(args: list[str]) -> str:
    return subprocess.check_output(["git", *args], text=True).strip()


def copy_file(src: Path, dst: Path) -> dict[str, str | int]:
    dst.parent.mkdir(parents=True, exist_ok=True)
    shutil.copy2(src, dst)
    return {
        "source": str(src),
        "release_path": rel(dst),
        "bytes": dst.stat().st_size,
    }


def read_matrix() -> list[dict[str, str]]:
    with (ROOT / "TZPID_PHASE2_COMPLETION_MATRIX.csv").open(
        newline="", encoding="utf-8"
    ) as handle:
        return list(csv.DictReader(handle))


def write_verification_appendix(rows: list[dict[str, str]]) -> None:
    lines = [
        "# Phase 3 Verification Appendix",
        "",
        f"Generated UTC: {datetime.now(timezone.utc).replace(microsecond=0).isoformat()}",
        f"Commit: `{git(['rev-parse', 'HEAD'])}`",
        "",
        "## Matrix Summary",
        "",
        f"- Matrix rows: `{len(rows)}`",
        f"- Clean Isabelle rows: `{sum(row['isabelle_checked'] == 'clean_build' for row in rows)}`",
        f"- Rows with certificate lane: `{sum(bool(row['wolfram_certificate']) and row['wolfram_certificate'] != 'not_attached' for row in rows)}`",
        f"- Rows with missing files: `{sum(bool(row['missing_files']) for row in rows)}`",
        "",
        "## Row-Level Status",
        "",
        "| Family | Kind | Completion | Isabelle | Certificate | Files |",
        "|---|---|---|---|---|---|",
    ]
    for row in rows:
        files = row["isabelle_files"].replace("|", "\\|")
        lines.append(
            "| {family} | {kind} | `{completion}` | `{isabelle}` | `{cert}` | {files} |".format(
                family=row["family"],
                kind=row["kind"],
                completion=row["completion_state"],
                isabelle=row["isabelle_checked"],
                cert=row["wolfram_certificate"],
                files=files,
            )
        )
    lines.append("")
    (RELEASE / "VERIFICATION_APPENDIX.md").write_text(
        "\n".join(lines), encoding="utf-8"
    )


def write_spine_pack(rows: list[dict[str, str]], copied_spines: list[dict]) -> None:
    non_batches = [row for row in rows if row["kind"] != "batch"]
    spine_files = {Path(item["release_path"]).name: item for item in copied_spines}
    lines = [
        "# Phase 3 Spine Pack",
        "",
        "This pack is the paper-facing index for the verified Phase 2 spines and domain families.",
        "",
        "## Verified Spine Families",
        "",
        "| Family | Kind | Completion | Primary Isabelle Files |",
        "|---|---|---|---|",
    ]
    for row in non_batches:
        files = row["isabelle_files"].replace("|", "\\|")
        lines.append(
            f"| {row['family']} | {row['kind']} | `{row['completion_state']}` | {files} |"
        )
    lines.extend(["", "## Copied Source Spine Documents", ""])
    for name in sorted(spine_files):
        item = spine_files[name]
        lines.append(f"- [{name}]({rel_from_release(item['release_path'])})")
    lines.extend(
        [
            "",
            "## Release Notes",
            "",
            "The Bessel residual bridge is named neutrally in this release package even where older source filenames still contain metaphorical wording. The verified matrix row is `Hyperspherical Bessel residual bridge`.",
            "",
            "Large HDF5 datasets are referenced in `HDF5_ARTIFACTS.md` instead of duplicated into this release folder.",
        ]
    )
    (RELEASE / "SPINE_PACK.md").write_text("\n".join(lines), encoding="utf-8")


def write_certificate_manifest(copied_certs: list[dict]) -> None:
    json_items = [item for item in copied_certs if item["release_path"].endswith(".json")]
    parsed = []
    for item in json_items:
        data = json.loads((ROOT / item["release_path"]).read_text(encoding="utf-8"))
        parsed.append(
            {
                "release_path": item["release_path"],
                "certificate": data.get("certificate", Path(item["release_path"]).stem),
                "status": data.get("status", "unknown"),
                "engine": data.get("engine", ""),
                "generated_utc": data.get("generated_utc", ""),
                "claim_boundary": data.get("claim_boundary", ""),
            }
        )
    manifest = {
        "generated_utc": datetime.now(timezone.utc).replace(microsecond=0).isoformat(),
        "certificate_json_count": len(parsed),
        "all_status_fields_pass": all(item["status"] != "fail" for item in parsed),
        "certificates": parsed,
    }
    (RELEASE / "CERTIFICATE_MANIFEST.json").write_text(
        json.dumps(manifest, indent=2), encoding="utf-8"
    )
    lines = [
        "# Phase 3 Certificate Manifest",
        "",
        f"Certificate JSON files: `{len(parsed)}`",
        f"All top-level statuses pass: `{manifest['all_status_fields_pass']}`",
        "",
        "| Certificate | Status | Engine | File |",
        "|---|---|---|---|",
    ]
    for item in parsed:
        lines.append(
            f"| {item['certificate']} | `{item['status']}` | {item['engine']} | [{Path(item['release_path']).name}]({rel_from_release(item['release_path'])}) |"
        )
    lines.append("")
    (RELEASE / "CERTIFICATE_MANIFEST.md").write_text(
        "\n".join(lines), encoding="utf-8"
    )


def write_hdf5_manifest() -> None:
    rows = []
    for path in sorted(ROOT.glob("*.h5")):
        rows.append(
            {
                "path": str(path),
                "bytes": path.stat().st_size,
                "release_action": "referenced_not_duplicated",
            }
        )
    (RELEASE / "HDF5_ARTIFACTS.json").write_text(
        json.dumps({"artifacts": rows}, indent=2), encoding="utf-8"
    )
    lines = [
        "# HDF5 Artifacts",
        "",
        "Large numerical artifacts are referenced here and not duplicated into `release_phase3/`.",
        "",
        "| Path | Bytes | Release Action |",
        "|---|---:|---|",
    ]
    for row in rows:
        lines.append(
            f"| `{row['path']}` | {row['bytes']} | `{row['release_action']}` |"
        )
    lines.append("")
    (RELEASE / "HDF5_ARTIFACTS.md").write_text("\n".join(lines), encoding="utf-8")


def update_manifest(package_files: dict[str, list[dict]]) -> None:
    path = RELEASE / "MANIFEST.json"
    manifest = json.loads(path.read_text(encoding="utf-8"))
    manifest["phase3_package"] = {
        "generated_utc": datetime.now(timezone.utc).replace(microsecond=0).isoformat(),
        "package_commit_source": git(["rev-parse", "HEAD"]),
        "directories": {
            "matrices": "release_phase3/matrices",
            "certificates": "release_phase3/certificates",
            "isabelle": "release_phase3/isabelle",
            "spines": "release_phase3/spines",
            "wolfram": "release_phase3/wolfram",
        },
        "files": package_files,
    }
    path.write_text(json.dumps(manifest, indent=2), encoding="utf-8")


def main() -> None:
    RELEASE.mkdir(exist_ok=True)
    package_files: dict[str, list[dict]] = {
        "matrices": [],
        "certificates": [],
        "isabelle": [],
        "spines": [],
        "wolfram": [],
    }

    for name in [
        "TZPID_PHASE2_COMPLETION_MATRIX.csv",
        "TZPID_PHASE2_COMPLETION_MATRIX.json",
        "TZPID_PHASE2_COMPLETION_MATRIX.md",
        "TZPID_PHASE2_SEMANTIC_TRANSLATION.md",
    ]:
        src = ROOT / name
        if src.exists():
            package_files["matrices"].append(
                copy_file(src, RELEASE / "matrices" / src.name)
            )

    for src in sorted((ROOT / "phase2_checks").glob("*CERTIFICATE.*")):
        suffix_dir = src.suffix.lower().lstrip(".")
        package_files["certificates"].append(
            copy_file(src, RELEASE / "certificates" / suffix_dir / src.name)
        )
    for src in sorted((ROOT / "phase2_checks").glob("*_GRID.csv")):
        package_files["certificates"].append(
            copy_file(src, RELEASE / "certificates" / "csv" / src.name)
        )
    for src in sorted((ROOT / "phase2_checks").glob("*_ANCHORS.csv")):
        package_files["certificates"].append(
            copy_file(src, RELEASE / "certificates" / "csv" / src.name)
        )

    for src in sorted((ROOT / "isabelle_tzpid").glob("*.thy")):
        package_files["isabelle"].append(copy_file(src, RELEASE / "isabelle" / src.name))
    package_files["isabelle"].append(
        copy_file(ROOT / "isabelle_tzpid" / "ROOT", RELEASE / "isabelle" / "ROOT")
    )

    if SPINE_SOURCE.exists():
        for src in sorted(SPINE_SOURCE.glob("*.md")):
            package_files["spines"].append(copy_file(src, RELEASE / "spines" / src.name))
        for src in sorted(SPINE_SOURCE.glob("*obligations.csv")):
            package_files["spines"].append(copy_file(src, RELEASE / "spines" / src.name))
        for src in sorted((SPINE_SOURCE / "wolfram").glob("*.wl")):
            package_files["wolfram"].append(copy_file(src, RELEASE / "wolfram" / src.name))

    rows = read_matrix()
    write_verification_appendix(rows)
    write_certificate_manifest(package_files["certificates"])
    write_hdf5_manifest()
    write_spine_pack(rows, package_files["spines"])
    update_manifest(package_files)
    print("phase3 release package refreshed")


if __name__ == "__main__":
    main()
