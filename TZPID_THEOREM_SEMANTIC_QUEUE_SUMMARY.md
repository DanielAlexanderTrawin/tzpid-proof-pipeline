# TZPID Theorem Semantic Queue Summary

Generated: 2026-06-07

- Input rows: `397`
- Unique `(source, id, name)` rows: `397`
- Output: `TZPID_THEOREM_SEMANTIC_QUEUE.csv`

## Translation Status Counts

| Status | Count |
|---|---:|
| queued_for_triage | 89 |
| batch002_started | 60 |
| batch003_started | 51 |
| batch001_started | 50 |
| batch005_started | 38 |
| batch006_started | 30 |
| needs_semantic_translation | 26 |
| batch007_started | 23 |
| batch008_started | 17 |
| batch004_started | 7 |
| phase2_already_started | 6 |

## Translation Class Counts

| Class | Count |
|---|---:|
| unclassified | 89 |
| spectral_helicity_kk_segment | 60 |
| candidate_real_algebra_segment | 51 |
| first_master_registry_segment | 50 |
| topology_vector_segment | 38 |
| operator_spectral_segment | 30 |
| unclassified_named_theorem | 26 |
| quantum_open_system_segment | 23 |
| geometry_manifold_segment | 17 |
| remaining_candidate_real_algebra | 7 |
| existing_phase2_family | 6 |

## Source Counts

| Source | Count |
|---|---:|
| proof_obligations | 161 |
| statement_inventory | 120 |
| master_registry | 116 |

## Operating Rule

Rows marked `batch001_started` are the first master-registry segment now being translated into Isabelle/HOL.
Rows marked `phase2_already_started` are covered by the current Phase 2 family files.
Rows marked `batch005_started` are the vector/topology segment now translated through the shared topology-vector scaffold.
Rows marked `batch006_started` are the operator/spectral segment now translated through the shared operator-spectral scaffold.
Rows marked `batch007_started` are the quantum/open-system segment now translated through the shared quantum-open-system scaffold.
Rows marked `batch008_started` are the geometry/manifold segment now translated through the shared geometry-manifold scaffold.
Rows marked `needs_operator_or_spectral_semantics` should be promoted only after a domain-specific operator or spectral model is selected.
