from __future__ import annotations

import csv
import json
import re
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parent
ISABELLE = ROOT / "isabelle_tzpid"
QUEUE = ROOT / "TZPID_THEOREM_SEMANTIC_QUEUE.csv"
OUT_CSV = ROOT / "TZPID_PHASE2_COMPLETION_MATRIX.csv"
OUT_MD = ROOT / "TZPID_PHASE2_COMPLETION_MATRIX.md"
OUT_JSON = ROOT / "TZPID_PHASE2_COMPLETION_MATRIX.json"


def count_statuses() -> Counter[str]:
    with QUEUE.open(newline="", encoding="utf-8-sig") as f:
        return Counter(row["translation_status"] for row in csv.DictReader(f))


def file_metrics(files: list[str]) -> dict[str, int | str]:
    text_parts: list[str] = []
    missing: list[str] = []
    for file_name in files:
        path = ISABELLE / file_name
        if path.exists():
            text_parts.append(path.read_text(encoding="utf-8"))
        else:
            missing.append(file_name)
    text = "\n".join(text_parts)
    forbidden_hits = re.findall(r"by simp|by \(simp|simp add|oops|sorry", text)
    return {
        "definition_count": len(re.findall(r"(?m)^definition\s+", text)),
        "theorem_or_lemma_count": len(re.findall(r"(?m)^(theorem|lemma)\s+", text)),
        "assumes_count": len(re.findall(r"\bassumes\b", text)),
        "type_or_const_count": len(re.findall(r"(?m)^(typedecl|type_synonym|consts)\b", text)),
        "forbidden_shortcut_hits": len(forbidden_hits),
        "missing_files": "; ".join(missing),
    }


def row(
    *,
    family: str,
    kind: str,
    files: list[str],
    queue_status: str,
    level: str,
    typed_carrier: str,
    assumptions: str,
    isabelle: str,
    wolfram: str,
    priority: str,
    completion: str,
    next_upgrade: str,
    status_counts: Counter[str],
) -> dict[str, str | int]:
    metrics = file_metrics(files)
    covered_rows = status_counts.get(queue_status, "n/a") if queue_status else "n/a"
    result: dict[str, str | int] = {
        "family": family,
        "kind": kind,
        "queue_status": queue_status,
        "covered_queue_rows": covered_rows,
        "isabelle_files": "; ".join(files),
        "current_level": level,
        "typed_carrier_exists": typed_carrier,
        "explicit_assumptions": assumptions,
        "isabelle_checked": isabelle,
        "wolfram_certificate": wolfram,
        "paper_priority": priority,
        "completion_state": completion,
        "next_upgrade": next_upgrade,
    }
    result.update(metrics)
    return result


def build_rows() -> list[dict[str, str | int]]:
    counts = count_statuses()
    rows: list[dict[str, str | int]] = []

    core_rows = [
        dict(
            family="Hyperspherical Bessel residual bridge",
            kind="paper_core",
            files=[
                "TZPID_HypersphericalBesselResidualBridge_Math_Checks.thy",
                "TZPID_HypersphericalBesselResidualBridge_Computational_Checks.thy",
                "TZPID_HypersphericalBesselResidualBridge_Phase2_Model.thy",
                "TZPID_Temporal_Kernel_HOL_Analysis.thy",
                "TZPID_Bessel_External_Certificates.thy",
            ],
            queue_status="phase2_already_started",
            level="hol_analysis_integral_bessel_policy_delta_alpha_phase_bridge_synthetic_shell_check",
            typed_carrier="yes",
            assumptions="yes",
            isabelle="clean_build",
            wolfram="yes",
            priority="critical",
            completion="phase2_5_synthetic_shell_check_done",
            next_upgrade="Next replace the synthetic Delta-alpha field with real simulation peak data, then lift the nested hyperspherical enclosure spine from abstract S3/projection predicates into typed projection-map semantics.",
        ),
        dict(
            family="Nested hyperspherical enclosure",
            kind="gold_spine",
            files=[
                "TZPID_NestedHypersphere_Focus.thy",
                "TZPID_NestedHypersphere_Computational_Checks.thy",
            ],
            queue_status="",
            level="focus_plus_certificate",
            typed_carrier="partial",
            assumptions="locale_level",
            isabelle="clean_build",
            wolfram="yes",
            priority="critical",
            completion="phase2_strengthen",
            next_upgrade="Replace abstract S3/projection predicates with typed topology and projection-map semantics.",
        ),
        dict(
            family="Gyromagnetic movement",
            kind="movement_spine",
            files=[
                "TZPID_GyromagneticMovement_Focus.thy",
                "TZPID_GyromagneticMovement_Computational_Checks.thy",
                "TZPID_Theorem_Semantic_Batch016_Orbital_Gyromagnetic_Followup.thy",
            ],
            queue_status="batch016_started",
            level="focus_certificate_plus_clean_followup",
            typed_carrier="partial",
            assumptions="yes",
            isabelle="clean_build",
            wolfram="yes",
            priority="critical",
            completion="phase2_strengthen",
            next_upgrade="Move legacy focus lemmas away from abstract predicates into the Batch016 algebraic gyromagnetic/orbital model.",
        ),
        dict(
            family="Phase locking resonance",
            kind="movement_spine",
            files=[
                "TZPID_PhaseLockingResonance_Focus.thy",
                "TZPID_PhaseLockingResonance_Computational_Checks.thy",
                "TZPID_Theorem_Semantic_Batch018_Resonance_Locking_Followup.thy",
            ],
            queue_status="batch018_started",
            level="focus_certificate_plus_clean_followup",
            typed_carrier="partial",
            assumptions="yes",
            isabelle="clean_build",
            wolfram="yes",
            priority="high",
            completion="phase2_strengthen",
            next_upgrade="Add coupled-oscillator stability and threshold inequalities beyond residual/guard semantics.",
        ),
        dict(
            family="Magnetic/torsion",
            kind="domain_model",
            files=[
                "TZPID_Magnetic_Torsion_Model.thy",
                "TZPID_Theorem_Semantic_Batch011_Magnetic_Torsion.thy",
            ],
            queue_status="batch011_started",
            level="typed_residual_guard",
            typed_carrier="yes",
            assumptions="yes",
            isabelle="clean_build",
            wolfram="not_attached",
            priority="high",
            completion="phase2_strengthen",
            next_upgrade="Replace scalar helicity/torsion guards with vector-calculus and MHD-style integral semantics.",
        ),
        dict(
            family="Emergence/bifurcation",
            kind="domain_model",
            files=["TZPID_Theorem_Semantic_Batch015_Emergence_Bifurcation_Followup.thy"],
            queue_status="batch015_started",
            level="typed_residual_guard",
            typed_carrier="yes",
            assumptions="yes",
            isabelle="clean_build",
            wolfram="not_attached",
            priority="high",
            completion="phase2_strengthen",
            next_upgrade="Formalize bifurcation normal forms, infinite-order transition behavior, and asymptotic emergence thresholds.",
        ),
        dict(
            family="Quantum/matter",
            kind="domain_model",
            files=[
                "TZPID_Quantum_Open_System_Model.thy",
                "TZPID_Theorem_Semantic_Batch017_Quantum_Matter_Followup.thy",
            ],
            queue_status="batch017_started",
            level="typed_residual_guard",
            typed_carrier="yes",
            assumptions="yes",
            isabelle="clean_build",
            wolfram="not_attached",
            priority="high",
            completion="phase2_strengthen",
            next_upgrade="Replace scalar quantum guards with density-operator, probability, Bell-bound, and conservation-law semantics.",
        ),
    ]

    for spec in core_rows:
        rows.append(row(**spec, status_counts=counts))

    batch_specs = [
        ("Master theorem batch 001", "batch", ["TZPID_Theorem_Semantic_Batch001.thy"], "batch001_started", "typed_residual_guard", "high"),
        ("Master theorem batch 002", "batch", ["TZPID_Theorem_Semantic_Batch002.thy"], "batch002_started", "typed_residual_guard", "high"),
        ("Master theorem batch 003", "batch", ["TZPID_Theorem_Semantic_Batch003.thy"], "batch003_started", "typed_residual_guard", "medium"),
        ("Master theorem batch 004", "batch", ["TZPID_Theorem_Semantic_Batch004.thy"], "batch004_started", "typed_residual_guard", "medium"),
        ("Topology/vector batch 005", "batch", ["TZPID_Topology_Vector_Model.thy", "TZPID_Theorem_Semantic_Batch005_Topology_Vector.thy"], "batch005_started", "typed_scaffold", "high"),
        ("Operator/spectral batch 006", "batch", ["TZPID_Operator_Spectral_Model.thy", "TZPID_Theorem_Semantic_Batch006_Operator_Spectral.thy"], "batch006_started", "typed_scaffold", "high"),
        ("Quantum/open-system batch 007", "batch", ["TZPID_Quantum_Open_System_Model.thy", "TZPID_Theorem_Semantic_Batch007_Quantum_Open_Systems.thy"], "batch007_started", "typed_scaffold", "high"),
        ("Geometry/manifold batch 008", "batch", ["TZPID_Geometry_Manifold_Model.thy", "TZPID_Theorem_Semantic_Batch008_Geometry_Manifold.thy"], "batch008_started", "typed_scaffold", "high"),
        ("Dynamics/scaling batch 009", "batch", ["TZPID_Dynamics_Scaling_Model.thy", "TZPID_Theorem_Semantic_Batch009_Dynamics_Scaling.thy"], "batch009_started", "typed_scaffold", "medium"),
        ("Meta-foundation batch 010", "batch", ["TZPID_Meta_Foundation_Model.thy", "TZPID_Theorem_Semantic_Batch010_Meta_Foundation.thy"], "batch010_started", "typed_scaffold", "medium"),
        ("Magnetic/torsion batch 011", "batch", ["TZPID_Magnetic_Torsion_Model.thy", "TZPID_Theorem_Semantic_Batch011_Magnetic_Torsion.thy"], "batch011_started", "typed_scaffold", "high"),
        ("Operator/spectral follow-up batch 012", "batch", ["TZPID_Theorem_Semantic_Batch012_Operator_Spectral_Followup.thy"], "batch012_started", "typed_residual_guard", "high"),
        ("Topology/category follow-up batch 013", "batch", ["TZPID_Theorem_Semantic_Batch013_Topology_Category_Followup.thy"], "batch013_started", "typed_residual_guard", "medium"),
        ("Dynamics/stability follow-up batch 014", "batch", ["TZPID_Theorem_Semantic_Batch014_Dynamics_Stability_Followup.thy"], "batch014_started", "typed_residual_guard", "medium"),
        ("Emergence/bifurcation follow-up batch 015", "batch", ["TZPID_Theorem_Semantic_Batch015_Emergence_Bifurcation_Followup.thy"], "batch015_started", "typed_residual_guard", "high"),
        ("Orbital/gyromagnetic follow-up batch 016", "batch", ["TZPID_Theorem_Semantic_Batch016_Orbital_Gyromagnetic_Followup.thy"], "batch016_started", "typed_residual_guard", "high"),
        ("Quantum/matter follow-up batch 017", "batch", ["TZPID_Theorem_Semantic_Batch017_Quantum_Matter_Followup.thy"], "batch017_started", "typed_residual_guard", "high"),
        ("Resonance-locking follow-up batch 018", "batch", ["TZPID_Theorem_Semantic_Batch018_Resonance_Locking_Followup.thy"], "batch018_started", "typed_residual_guard", "high"),
        ("Geometry/curvature closeout batch 019", "batch", ["TZPID_Theorem_Semantic_Batch019_Geometry_Curvature_Closeout.thy"], "batch019_started", "typed_residual_guard", "medium"),
    ]
    for family, kind, files, status, level, priority in batch_specs:
        rows.append(
            row(
                family=family,
                kind=kind,
                files=files,
                queue_status=status,
                level=level,
                typed_carrier="yes",
                assumptions="yes",
                isabelle="clean_build",
                wolfram="not_attached",
                priority=priority,
                completion="started_not_complete",
                next_upgrade="Promote from residual/guard semantics into domain-specific HOL-Analysis structures where this batch is paper-facing.",
                status_counts=counts,
            )
        )
    return rows


def write_csv(rows: list[dict[str, str | int]]) -> None:
    fieldnames = list(rows[0].keys())
    with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(rows)


def write_json(rows: list[dict[str, str | int]]) -> None:
    OUT_JSON.write_text(json.dumps(rows, indent=2), encoding="utf-8")


def write_md(rows: list[dict[str, str | int]]) -> None:
    counts = count_statuses()
    triage_remaining = sum(
        count for status, count in counts.items()
        if status.startswith("triaged_")
        or status in {"queued_for_triage", "needs_semantic_translation"}
    )
    total_queue_rows = sum(counts.values())
    clean_shortcut_rows = sum(1 for row in rows if int(row["forbidden_shortcut_hits"]) == 0)
    lines = [
        "# TZPID Phase 2 Completion Matrix",
        "",
        "Generated: 2026-06-07",
        "",
        "## Summary",
        "",
        f"- Queue rows represented: `{total_queue_rows}`",
        f"- Remaining triage rows: `{triage_remaining}`",
        f"- Matrix rows: `{len(rows)}`",
        f"- Rows with no shortcut/placeholders in listed files: `{clean_shortcut_rows}` of `{len(rows)}`",
        f"- CSV: `{OUT_CSV.name}`",
        f"- JSON: `{OUT_JSON.name}`",
        "",
        "## Queue Status Counts",
        "",
        "| Status | Count |",
        "|---|---:|",
    ]
    for status, count in counts.most_common():
        lines.append(f"| {status} | {count} |")

    lines.extend([
        "",
        "## Completion Matrix",
        "",
        "| Family | Kind | Rows | Level | Isabelle | Wolfram | Priority | Completion | Next Upgrade |",
        "|---|---|---:|---|---|---|---|---|---|",
    ])
    for row in rows:
        next_upgrade = str(row["next_upgrade"]).replace("|", "\\|")
        lines.append(
            f"| {row['family']} | {row['kind']} | {row['covered_queue_rows']} | "
            f"{row['current_level']} | {row['isabelle_checked']} | {row['wolfram_certificate']} | "
            f"{row['paper_priority']} | {row['completion_state']} | {next_upgrade} |"
        )

    lines.extend([
        "",
        "## Recommended Phase 2 Upgrade Order",
        "",
        "| Rank | Family | Reason | First Upgrade |",
        "|---:|---|---|---|",
    ])
    upgrade_order = [
        (
            "Hyperspherical Bessel residual bridge",
            "Paper core with concrete algebra and certificates already present.",
            "The kernel integral is proved in HOL-Analysis; Bessel roots are an explicit external Wolfram interval-certificate policy; the drop fraction induces a HOL-proved Delta-alpha phase-gradient and shell-radius prediction; and a synthetic Python shell comparison now detects the predicted radii.",
        ),
        (
            "Gyromagnetic movement",
            "Central movement-mechanism spine and already has Wolfram-backed checks.",
            "Replace legacy abstract focus predicates with the cleaner Batch016 algebraic movement semantics.",
        ),
        (
            "Phase locking resonance",
            "Connects the rational-ratio selection mechanism to orbital and acoustic dynamics.",
            "Add coupled-oscillator threshold inequalities and stability conditions.",
        ),
        (
            "Emergence/bifurcation",
            "Core TZP emergence story; currently guard-level but high paper value.",
            "Formalize a bifurcation normal form and infinite-order transition boundary.",
        ),
        (
            "Magnetic/torsion",
            "High-value bridge between gyromagnetic motion, helicity, Elsasser balance, and matter dynamics.",
            "Move helicity and torsion from scalar guards toward vector-calculus/MHD semantics.",
        ),
        (
            "Quantum/matter",
            "Matter-facing proof lane for conservation, criticality, Bell bounds, and dark distribution claims.",
            "Introduce probability/density-operator carriers and conservation-law statements.",
        ),
    ]
    for idx, (family, reason, upgrade) in enumerate(upgrade_order, start=1):
        lines.append(f"| {idx} | {family} | {reason} | {upgrade} |")

    lines.extend([
        "",
        "## Isabelle Metrics",
        "",
        "| Family | Definitions | Theorems/Lemmas | Assumes | Types/Consts | Shortcut Hits |",
        "|---|---:|---:|---:|---:|---:|",
    ])
    for row in rows:
        lines.append(
            f"| {row['family']} | {row['definition_count']} | "
            f"{row['theorem_or_lemma_count']} | {row['assumes_count']} | "
            f"{row['type_or_const_count']} | {row['forbidden_shortcut_hits']} |"
        )
    OUT_MD.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    rows = build_rows()
    write_csv(rows)
    write_json(rows)
    write_md(rows)


if __name__ == "__main__":
    main()

