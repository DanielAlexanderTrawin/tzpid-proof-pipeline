from __future__ import annotations

import csv
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parent
INPUT = ROOT / "TZPID_THEOREM_NAMES.csv"
OUT_CSV = ROOT / "TZPID_THEOREM_SEMANTIC_QUEUE.csv"
OUT_MD = ROOT / "TZPID_THEOREM_SEMANTIC_QUEUE_SUMMARY.md"

PHASE2_IDS = {
    "ID7732", "ID7733", "ID6819", "ID7257", "ID7259", "ID7177", "ID7207",
    "ID0230", "ID0256", "ID6583", "ID0362", "ID0104", "ID8796",
    "ID10786", "ID10787", "ID10788", "ID10789", "ID10790",
    "ID0353", "ID0395", "ID0470", "ID10791", "ID10792",
    "ID0285", "ID0245", "ID1837",
    "ID10146", "ID0092", "ID0093", "ID0037", "ID0085", "ID0087",
    "ID0038", "ID0039", "ID0040", "ID0044", "ID0089", "ID0090",
    "ID9758", "ID9761", "ID10130", "ID10131", "ID10145", "ID10272",
    "ID10264", "ID9513", "ID0143", "ID0105", "ID0115", "ID0117",
    "ID0120", "ID0144", "ID9955", "ID0261", "ID9492", "ID9494",
    "ID0099", "ID0097",
}

BATCH001_IDS = {
    "ID0137", "ID0234", "ID0399", "ID0522", "ID1007", "ID1009",
    "ID1010", "ID1014", "ID1024", "ID1025", "ID1204", "ID1585",
    "ID1693", "ID1829", "ID1845", "ID1918", "ID1924", "ID2045",
    "ID2306", "ID2730", "ID2741", "ID2916", "ID2990", "ID2991",
    "ID2992",
}

BATCH002_IDS = {
    "ID3286", "ID3287", "ID3288", "ID3289", "ID3303", "ID3305",
    "ID3312", "ID3314", "ID3315", "ID3316", "ID3317", "ID3378",
    "ID3606", "ID3613", "ID3616", "ID3617", "ID3642", "ID3650",
    "ID3651", "ID3653", "ID3654", "ID3662", "ID3663", "ID3668",
    "ID3677", "ID3716", "ID3872", "ID3888", "ID4191", "ID4195",
}

BATCH003_IDS = {
    "ID4201", "ID4216", "ID4217", "ID4225", "ID4231", "ID4700",
    "ID5737", "ID5751", "ID5797", "ID5813", "ID5992", "ID6000",
    "ID6092", "ID9004", "ID9005", "ID9157", "ID9291", "ID9618",
    "ID9619", "ID9633", "ID9656", "ID9827", "ID9887", "ID9931",
    "ID9989", "ID10104",
}

BATCH004_IDS = {
    "ID0006", "ID0054", "ID9999",
}

BATCH005_IDS = {
    "ID0017", "ID0041", "ID0065", "ID0170", "ID10250", "ID1802",
    "ID4215", "ID4233", "ID4252", "ID4256", "ID4708", "ID5738",
    "ID6488", "ID7754", "ID8522", "ID8523", "ID9902", "ID9990",
    "ID9999",
}

BATCH006_IDS = {
    "ID0006", "ID10072", "ID10253", "ID4202", "ID4213", "ID4710",
    "ID4711", "ID4713", "ID5743", "ID5744", "ID5806", "ID5812",
    "ID6053", "ID8521", "ID9999",
}

BATCH007_IDS = {
    "ID0001", "ID0012", "ID0015", "ID0017", "ID0019", "ID0049",
    "ID0050", "ID0053", "ID0057", "ID0060", "ID0061", "ID0062",
    "ID0063", "ID0065", "ID0070", "ID0073",
}


def classify(name: str, role: str, id_: str) -> tuple[str, str]:
    text = f"{id_} {name} {role}".lower()
    if id_ in PHASE2_IDS:
        return "phase2_already_started", "existing_phase2_family"
    if id_ in BATCH001_IDS:
        return "batch001_started", "first_master_registry_segment"
    if id_ in BATCH002_IDS:
        return "batch002_started", "spectral_helicity_kk_segment"
    if id_ in BATCH003_IDS:
        return "batch003_started", "candidate_real_algebra_segment"
    if id_ in BATCH004_IDS and any(k in text for k in [
        "vacuumenergydensity", "boundaryquantumeffects", "vacuum energy extraction",
        "information-theoretic lower bound", "dissipative energy decay",
        "local uniqueness bound", "linear dispersion relation"
    ]):
        return "batch004_started", "remaining_candidate_real_algebra"
    if id_ in BATCH005_IDS and any(k in text for k in [
        "topological", "helicity", "chern", "flux quantization",
        "linking", "dipole topological", "macroscopic flux",
        "toroidal boundary", "quantum flux"
    ]):
        return "batch005_started", "topology_vector_segment"
    if id_ in BATCH006_IDS and any(k in text for k in [
        "eigenvalue", "frequency", "kaluza", "hamiltonian",
        "intermodal", "beat", "spectral", "modal"
    ]):
        return "batch006_started", "operator_spectral_segment"
    if id_ in BATCH007_IDS and any(k in text for k in [
        "quantum", "coherence", "decoherence", "cptp", "channel",
        "measurement", "noise", "commutator", "critical", "thermo",
        "entangle", "multipartite", "qubit", "spinor", "transport",
        "superselection", "fluctuation", "continuousvariable"
    ]):
        return "batch007_started", "quantum_open_system_segment"
    if any(k in text for k in ["helicity", "chern", "linking", "hopf", "flux quantization", "topological"]):
        return "needs_vector_topology_semantics", "topology_or_helicity"
    if any(k in text for k in ["hamiltonian", "wave equation", "eigenvalue", "frequency", "modal", "kaluza"]):
        return "needs_operator_or_spectral_semantics", "operator_spectral"
    if any(k in text for k in ["relation", "scaling", "bound", "pressure", "energy"]):
        return "candidate_real_algebra", "algebra_or_inequality"
    if "needs_semantic_translation" in text:
        return "needs_semantic_translation", "unclassified_named_theorem"
    return "queued_for_triage", "unclassified"


def main() -> None:
    rows = list(csv.DictReader(INPUT.open(newline="", encoding="utf-8-sig")))
    out_rows = []
    seen = set()
    for idx, row in enumerate(rows, start=1):
        key = (row["source"], row["id"], row["name"])
        duplicate = key in seen
        seen.add(key)
        status, cls = classify(row["name"], row["obligation_role"], row["id"])
        out_rows.append({
            "queue_index": idx,
            "source": row["source"],
            "id": row["id"],
            "name": row["name"],
            "kind": row["kind"],
            "obligation_role": row["obligation_role"],
            "semantic_anchor_id": row["semantic_anchor_id"],
            "source_file": row["source_file"],
            "line": row["line"],
            "translation_status": status,
            "translation_class": cls,
            "duplicate_source_id_name": "yes" if duplicate else "no",
        })

    with OUT_CSV.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=list(out_rows[0].keys()))
        writer.writeheader()
        writer.writerows(out_rows)

    status_counts = Counter(r["translation_status"] for r in out_rows)
    class_counts = Counter(r["translation_class"] for r in out_rows)
    source_counts = Counter(r["source"] for r in out_rows)

    lines = [
        "# TZPID Theorem Semantic Queue Summary",
        "",
        "Generated: 2026-06-07",
        "",
        f"- Input rows: `{len(rows)}`",
        f"- Unique `(source, id, name)` rows: `{len(seen)}`",
        f"- Output: `{OUT_CSV.name}`",
        "",
        "## Translation Status Counts",
        "",
        "| Status | Count |",
        "|---|---:|",
    ]
    for status, count in status_counts.most_common():
        lines.append(f"| {status} | {count} |")
    lines.extend(["", "## Translation Class Counts", "", "| Class | Count |", "|---|---:|"])
    for cls, count in class_counts.most_common():
        lines.append(f"| {cls} | {count} |")
    lines.extend(["", "## Source Counts", "", "| Source | Count |", "|---|---:|"])
    for source, count in source_counts.most_common():
        lines.append(f"| {source} | {count} |")
    lines.extend([
        "",
        "## Operating Rule",
        "",
        "Rows marked `batch001_started` are the first master-registry segment now being translated into Isabelle/HOL.",
        "Rows marked `phase2_already_started` are covered by the current Phase 2 family files.",
        "Rows marked `batch005_started` are the vector/topology segment now translated through the shared topology-vector scaffold.",
        "Rows marked `batch006_started` are the operator/spectral segment now translated through the shared operator-spectral scaffold.",
        "Rows marked `batch007_started` are the quantum/open-system segment now translated through the shared quantum-open-system scaffold.",
        "Rows marked `needs_operator_or_spectral_semantics` should be promoted only after a domain-specific operator or spectral model is selected.",
    ])
    OUT_MD.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
