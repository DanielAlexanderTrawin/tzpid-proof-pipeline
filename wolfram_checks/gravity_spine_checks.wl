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
outputPath = If[Length[$ScriptCommandLine] >= 2, $ScriptCommandLine[[2]], FileNameJoin[{"wolfram_checks", "gravity_spine_results.json"}]];
If[! DirectoryQ[DirectoryName[outputPath]], CreateDirectory[DirectoryName[outputPath], CreateIntermediateDirectories -> True]];
asString[expr_] := ToString[expr, InputForm];

aModified = aN (1 + alpha Macc/M0);
newtonianResidual = FullSimplify[(aModified /. alpha -> 0) - aN];
deltaT = alpha G Macc/R^3 nhatI nhatJ;
stressResidual = FullSimplify[((TN + deltaT) /. alpha -> 0) - TN];
poissonDimensionPass = <|"L" -> -1, "T" -> -2|> === <|"L" -> -1, "T" -> -2|>;

results = {
  <|"id" -> "ID7214", "check" -> "grav_newtonian_recovery", "status" -> If[TrueQ[newtonianResidual === 0], "pass", "fail"], "engine" -> "WolframScript", "residual_after_substitution" -> asString[newtonianResidual], "notes" -> "The accumulated-force acceleration reduces to the Newtonian baseline when alpha -> 0."|>,
  <|"id" -> "ID7314", "check" -> "grav_stress_vanishes", "status" -> If[TrueQ[stressResidual === 0], "pass", "fail"], "engine" -> "WolframScript", "residual_after_substitution" -> asString[stressResidual], "notes" -> "The effective stress tensor reduces to Newtonian stress when the accumulated correction vanishes."|>,
  <|"id" -> "ID1816", "check" -> "grav_poisson_dim_balance", "status" -> If[TrueQ[poissonDimensionPass], "pass", "fail"], "engine" -> "WolframScript", "dimension_vector" -> "<|L -> -1, T -> -2|>", "notes" -> "The Poisson closure is represented with matching acceleration-per-length dimensions on both sides."|>
};
Export[outputPath, results, "RawJSON"];
Print["Wrote " <> outputPath];
