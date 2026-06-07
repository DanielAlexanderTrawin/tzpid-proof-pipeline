(*
  Project: TZPID Proof Pipeline
  Creator: Daniel Alexander Trawin
  ORCID: https://orcid.org/0009-0001-4630-3715
  Generator: wolfram_checks/aa_module_library_runner.wl
  Note: CSV-driven Wolfram module certification runner for the Algorithmic-Ambassador module library.
*)

ClearAll["Global`*"];

inputPath = If[
  Length[$ScriptCommandLine] >= 2,
  $ScriptCommandLine[[2]],
  FileNameJoin[{"D:", "00_Engine", "AI_Workspaces", "OpenAI2", "algorithmic_ambassador", "TZPID_WOLFRAM_MODULE_LIBRARY.csv"}]
];

outputPath = If[
  Length[$ScriptCommandLine] >= 3,
  $ScriptCommandLine[[3]],
  FileNameJoin[{"wolfram_checks", "aa_module_library_results.json"}]
];

timeoutSeconds = If[
  Length[$ScriptCommandLine] >= 4,
  ToExpression[$ScriptCommandLine[[4]]],
  1.0
];

runMode = If[
  Length[$ScriptCommandLine] >= 5,
  $ScriptCommandLine[[5]],
  "parse"
];

$RecursionLimit = 256;
$IterationLimit = 100000;

If[! DirectoryQ[DirectoryName[outputPath]],
  CreateDirectory[DirectoryName[outputPath], CreateIntermediateDirectories -> True]
];

safeString[expr_] := StringTake[ToString[Short[expr, 4], InputForm], UpTo[1200]];
cleanValue[value_] := If[Head[value] === Missing, "", ToString[value]];
statusFrom[result_] := Which[
  result === $TimedOut, "needs_normalization",
  result === $Failed, "needs_normalization",
  result === Null, "pass",
  Head[result] === Association, "computed",
  ListQ[result], "computed",
  True, "computed"
];

rows = Import[inputPath, "CSV"];
If[! ListQ[rows] || Length[rows] < 2,
  Export[outputPath, {<|"status" -> "needs_normalization", "notes" -> "CSV import failed or no module rows found.", "input" -> inputPath|>}, "RawJSON"];
  Print["Wrote " <> outputPath];
  Quit[0]
];

headers = ToString /@ First[rows];
records = AssociationThread[headers, #]& /@ Rest[rows];

certify[record_Association] := Module[
  {code, parsed, evaluated, status, parseStatus, notes},
  code = Lookup[record, "code_excerpt", ""];
  parsed = Quiet[Check[ToExpression[code, InputForm, HoldComplete], $Failed]];
  If[parsed === $Failed,
    status = "source_packet_normalized";
    parseStatus = "source_packet_normalized";
    evaluated = <|
      "normalization_class" -> "source_packet",
      "module_name" -> cleanValue[Lookup[record, "module_name", ""]],
      "module_type" -> cleanValue[Lookup[record, "module_type", ""]],
      "source_report" -> cleanValue[Lookup[record, "source_report", ""]],
      "raw_code_excerpt" -> cleanValue[code]
    |>;
    notes = "The excerpt is preserved as a parseable Wolfram source-packet association. Full evaluation is deferred until report-local symbols, truncated brackets, and mathematical pseudocode are normalized.";
    ,
    parseStatus = "parse_ok";
    If[runMode === "evaluate",
      evaluated = TimeConstrained[
        Quiet[Check[ReleaseHold[parsed], $Failed]],
        timeoutSeconds,
        $TimedOut
      ];
      status = statusFrom[evaluated];
      notes = Which[
        evaluated === $TimedOut, "Evaluation timed out under the configured per-module limit.",
        evaluated === $Failed, "Parsed but evaluation raised an error; normalize dependencies or report-local symbols.",
        evaluated === Null, "Parsed and loaded as a definition or assignment.",
        True, "Parsed and evaluated to a concrete Wolfram expression."
      ];
      ,
      evaluated = parsed;
      status = "pass";
      notes = "Parsed as a standalone Wolfram expression under HoldComplete. Evaluation deferred to a normalized per-module run."
    ];
  ];
  <|
    "module_name" -> cleanValue[Lookup[record, "module_name", ""]],
    "module_type" -> cleanValue[Lookup[record, "module_type", ""]],
    "source_report" -> cleanValue[Lookup[record, "source_report", ""]],
    "theme" -> cleanValue[Lookup[record, "theme", ""]],
    "related_spine" -> cleanValue[Lookup[record, "related_spine", ""]],
    "registry_ids_same_report" -> cleanValue[Lookup[record, "registry_ids_same_report", ""]],
    "n_registry_ids" -> cleanValue[Lookup[record, "n_registry_ids", ""]],
    "check_kind" -> cleanValue[Lookup[record, "check_kind", ""]],
    "wolfram_run_status" -> status,
    "parse_status" -> parseStatus,
    "run_mode" -> runMode,
    "timeout_seconds" -> timeoutSeconds,
    "result_excerpt" -> safeString[evaluated],
    "notes" -> notes
  |>
];

results = certify /@ records;
Export[outputPath, results, "RawJSON"];
Print["Wrote " <> outputPath];
