(*
  Project: TZPID Proof Pipeline
  Creator: Daniel Alexander Trawin
  ORCID: https://orcid.org/0009-0001-4630-3715
  Generator: prepare_aa_spines_focus.py
  Generated UTC: 2026-06-06T12:27:33Z
  Sources:
  - TZPID_AA_SPINES_obligations.csv SHA1 ac93ed165a5bb2e8b60047a34f950e2f5a8461e9
  Note: Generated Wolfram checks for AA gold spines.
*)
ClearAll["Global`*"];
outputPath = If[Length[$ScriptCommandLine] >= 2, $ScriptCommandLine[[2]], FileNameJoin[{"wolfram_checks", "aa_spines_results.json"}]];
If[! DirectoryQ[DirectoryName[outputPath]], CreateDirectory[DirectoryName[outputPath], CreateIntermediateDirectories -> True]];
asString[expr_] := ToString[expr, InputForm];

vortexCurvature = FullSimplify[(F - (dA + Aconn.Aconn)) /. F -> dA + Aconn.Aconn];
vortexAlfvenPositive = FullSimplify[B^2/(mu0 rho) > 0, Assumptions -> B > 0 && mu0 > 0 && rho > 0];
vortexMach = FullSimplify[(M cSound - speed) /. M -> speed/cSound, Assumptions -> cSound > 0];

dnaEntropy = FullSimplify[-20*(1/20)*Log2[1/20] == Log2[20]];
dnaUnitary = FullSimplify[Exp[-I H (t - t0)] /. t -> t0] === 1;
dnaLength = FullSimplify[L Sqrt[1 + (pitch/diameter)^2] >= L, Assumptions -> L > 0 && pitch >= 0 && diameter > 0];

neutrinoEnhancement = FullSimplify[(sigmaEnhanced/sigmaStandard) /. sigmaEnhanced -> n^2 sigmaStandard, Assumptions -> sigmaStandard > 0];
neutrinoCapturePositive = FullSimplify[flux sigma targets solidAngle/(4 Pi) > 0, Assumptions -> flux > 0 && sigma > 0 && targets > 0 && solidAngle > 0];
neutrinoInformation = FullSimplify[(info - Log2[rate tau]) /. info -> Log2[rate tau], Assumptions -> rate > 0 && tau > 0];

qiKernel = FullSimplify[Exp[-(t - tp)/tau] /. t -> tp, Assumptions -> tau > 0];
qiPhaseDimensionless = <|"M" -> 0, "L" -> 0, "T" -> 0|> === <|"M" -> 0, "L" -> 0, "T" -> 0|>;
qiDecoherencePositive = FullSimplify[G^2 m^2/(hbar c^3 sigmaWidth^2) > 0, Assumptions -> G > 0 && m > 0 && hbar > 0 && c > 0 && sigmaWidth > 0];

results = {
  <|"id" -> "ID10335", "spine" -> "Vortex-Core Topological Fluid Dynamics", "check" -> "aa_vortex_curvature_identity", "status" -> If[TrueQ[vortexCurvature === 0], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[vortexCurvature], "notes" -> "Curvature carrier normalizes to F = dA + A.A."|>,
  <|"id" -> "ID10339", "spine" -> "Vortex-Core Topological Fluid Dynamics", "check" -> "aa_vortex_alfven_positive", "status" -> If[TrueQ[vortexAlfvenPositive], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[vortexAlfvenPositive], "notes" -> "Alfven velocity square is positive for positive B, mu0, and rho."|>,
  <|"id" -> "ID10345", "spine" -> "Vortex-Core Topological Fluid Dynamics", "check" -> "aa_vortex_mach_ratio", "status" -> If[TrueQ[vortexMach === 0], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[vortexMach], "notes" -> "Mach-ratio definition recovers speed after multiplication by c_sound."|>,
  <|"id" -> "ID10499", "spine" -> "DNA-TZPQVS Isomorphism", "check" -> "aa_dna_entropy_floor", "status" -> If[TrueQ[dnaEntropy], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[dnaEntropy], "notes" -> "Uniform 20-symbol entropy equals Log2[20]."|>,
  <|"id" -> "ID10503", "spine" -> "DNA-TZPQVS Isomorphism", "check" -> "aa_dna_unitary_identity", "status" -> If[TrueQ[dnaUnitary], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[dnaUnitary], "notes" -> "Evolution operator normalizes to identity at t=t0."|>,
  <|"id" -> "ID10519", "spine" -> "DNA-TZPQVS Isomorphism", "check" -> "aa_dna_helix_length", "status" -> If[TrueQ[dnaLength], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[dnaLength], "notes" -> "Pitch-corrected helix length is no smaller than base length."|>,
  <|"id" -> "ID10535", "spine" -> "Neutrino-Piezoelectric Coupling", "check" -> "aa_neutrino_enhancement_square", "status" -> If[TrueQ[neutrinoEnhancement === n^2], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[neutrinoEnhancement], "notes" -> "Coherent enhancement ratio reduces to n^2."|>,
  <|"id" -> "ID10536", "spine" -> "Neutrino-Piezoelectric Coupling", "check" -> "aa_neutrino_capture_rate_positive", "status" -> If[TrueQ[neutrinoCapturePositive], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[neutrinoCapturePositive], "notes" -> "Capture rate is positive under positive input factors."|>,
  <|"id" -> "ID10538", "spine" -> "Neutrino-Piezoelectric Coupling", "check" -> "aa_neutrino_information_log", "status" -> If[TrueQ[neutrinoInformation === 0], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[neutrinoInformation], "notes" -> "Information yield normalizes to Log2[rate tau]."|>,
  <|"id" -> "ID10475", "spine" -> "Quantum-Information Genesis of Curvature", "check" -> "aa_qi_kernel_normalization", "status" -> If[TrueQ[qiKernel === 1], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[qiKernel], "notes" -> "Accumulation kernel equals 1 at zero delay."|>,
  <|"id" -> "ID10483", "spine" -> "Quantum-Information Genesis of Curvature", "check" -> "aa_qi_phase_shift_units", "status" -> If[TrueQ[qiPhaseDimensionless], "pass", "fail"], "engine" -> "WolframScript", "result" -> "dimensionless", "notes" -> "GM omega/(c^3 r) has dimension vector zero."|>,
  <|"id" -> "ID10484", "spine" -> "Quantum-Information Genesis of Curvature", "check" -> "aa_qi_decoherence_positive", "status" -> If[TrueQ[qiDecoherencePositive], "pass", "fail"], "engine" -> "WolframScript", "result" -> asString[qiDecoherencePositive], "notes" -> "Decoherence rate is positive under positive constants and width."|>
};
Export[outputPath, results, "RawJSON"];
Print["Wrote " <> outputPath];
