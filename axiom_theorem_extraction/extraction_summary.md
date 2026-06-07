# Axiom/Theorem Extraction Summary

- Statements extracted: **9810**
- Dependency edges: **5285**

## Counts By Kind

- Assumption: 2
- Axiom: 75
- Definition: 9267
- Invariant: 101
- Law: 148
- Lemma: 6
- Principle: 46
- Proposition: 45
- Theorem: 120

## Files

- `statement_inventory.csv`
- `dependency_edges.csv`
- `dependency_matrix_binary.csv`
- `dependency_matrix_weighted.csv`
- `axiom_theorem_dependency_graph.md`
- `axiom_theorem_dependency_graph.dot`

## Notes

This extraction is intentionally auditable: use the source/line/confidence columns to confirm or reject candidates.
Transcript-derived material is included, but confidence is reduced for chat/planning files.
Equation-master rows are included as first-class Definition candidates unless their title/statement classifies them as an axiom, theorem, lemma, proposition, etc.
The Markdown/DOT graph files intentionally render a subset when the full graph is too large; the CSV edge and matrix files remain complete.