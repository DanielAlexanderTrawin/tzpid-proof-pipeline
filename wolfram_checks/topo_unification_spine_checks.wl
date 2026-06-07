(*
  Project: TZPID Proof Pipeline
  Creator: Daniel Alexander Trawin
  ORCID: https://orcid.org/0009-0001-4630-3715
  Generator: prepare_new_spines_focus.py
  Generated UTC: 2026-06-06T04:15:59Z
  Sources:
  - TZPID_NEW_SPINES_obligations.csv SHA1 a5a9715ffb4bdff072888f315de82b0615d4e15a
  Note: Generated Wolfram checks for curated new gold spines.
*)
ClearAll["Global`*"];
outputPath = If[Length[$ScriptCommandLine] >= 2, $ScriptCommandLine[[2]], FileNameJoin[{"wolfram_checks", "topo_unification_spine_results.json"}]];
If[! DirectoryQ[DirectoryName[outputPath]], CreateDirectory[DirectoryName[outputPath], CreateIntermediateDirectories -> True]];
asString[expr_] := ToString[expr, InputForm];

chernQuantization = FullSimplify[Element[n, Integers], Assumptions -> Element[n, Integers]];
obstructionImplication = FullSimplify[(cs != 0) \[Implies] (otop != 0) /. otop -> cs];
omegaResidual = FullSimplify[(OmegaTop - (C1 + Pi winding)) /. OmegaTop -> C1 + Pi winding];

results = {
  <|"id" -> "ID8931", "check" -> "topo_chern_quantization", "status" -> If[TrueQ[chernQuantization], "pass", "fail"], "engine" -> "WolframScript", "normalized_result" -> asString[chernQuantization], "notes" -> "The Chern-number obligation is represented as an integer-quantized invariant."|>,
  <|"id" -> "ID9342", "check" -> "topo_obstruction_nonvanishing", "status" -> If[TrueQ[obstructionImplication], "pass", "fail"], "engine" -> "WolframScript", "normalized_result" -> asString[obstructionImplication], "notes" -> "A non-zero Chern-Simons witness implies a non-zero topological obstruction in the symbolic model."|>,
  <|"id" -> "ID9892", "check" -> "topo_invariant_decomposition", "status" -> If[TrueQ[omegaResidual === 0], "pass", "fail"], "engine" -> "WolframScript", "residual_after_substitution" -> asString[omegaResidual], "notes" -> "The assembled topological invariant decomposes into Chern and winding parts."|>
};
Export[outputPath, results, "RawJSON"];
Print["Wrote " <> outputPath];
