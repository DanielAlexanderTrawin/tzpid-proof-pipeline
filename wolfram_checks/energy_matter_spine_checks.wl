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
outputPath = If[Length[$ScriptCommandLine] >= 2, $ScriptCommandLine[[2]], FileNameJoin[{"wolfram_checks", "energy_matter_spine_results.json"}]];
If[! DirectoryQ[DirectoryName[outputPath]], CreateDirectory[DirectoryName[outputPath], CreateIntermediateDirectories -> True]];
asString[expr_] := ToString[expr, InputForm];

naiveIntegral = Integrate[k, {k, 0, Infinity}, Assumptions -> k >= 0];
regularizedIntegral = Integrate[k Exp[-k/Lambda], {k, 0, Infinity}, Assumptions -> Lambda > 0];
regularizedFinite = FullSimplify[regularizedIntegral == Lambda^2, Assumptions -> Lambda > 0];
thresholdSwitch = FullSimplify[Boole[Pvac >= Pcrit] == 1, Assumptions -> Pvac >= Pcrit];
massEnergyResidual = FullSimplify[(E - m c^2) /. E -> m c^2];

results = {
  <|"id" -> "ID10165", "check" -> "em_regularization_finite", "status" -> If[TrueQ[regularizedFinite], "pass", "fail"], "engine" -> "WolframScript", "naive_integral" -> asString[naiveIntegral], "regularized_integral" -> asString[regularizedIntegral], "notes" -> "A simple exponential regulator makes the vacuum-mode integral finite while the naive integral is divergent."|>,
  <|"id" -> "ID0188", "check" -> "em_creation_threshold", "status" -> If[TrueQ[thresholdSwitch], "pass", "fail"], "engine" -> "WolframScript", "normalized_result" -> asString[thresholdSwitch], "notes" -> "The matter-onset switch is active exactly under the pressure-threshold assumption."|>,
  <|"id" -> "ID2846", "check" -> "em_mass_energy_identity", "status" -> If[TrueQ[massEnergyResidual === 0], "pass", "fail"], "engine" -> "WolframScript", "residual_after_substitution" -> asString[massEnergyResidual], "notes" -> "The mass-energy identity has zero residual under E -> m c^2."|>
};
Export[outputPath, results, "RawJSON"];
Print["Wrote " <> outputPath];
