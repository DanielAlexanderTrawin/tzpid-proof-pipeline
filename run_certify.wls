#!/usr/bin/env wolframscript
(* TZPID Algorithmic-Ambassador module certification runner.
   Usage:  wolframscript -file run_certify.wls
   Loads stubs, evaluates each extracted module, records status, exports JSON. *)
Get[FileNameJoin[{DirectoryName[$InputFileName], "tzpid_aa_stubs.wl"}]];
mods = Import[FileNameJoin[{DirectoryName[$InputFileName], "tzpid_aa_modules.json"}], "RawJSON"];
results = {};
Do[
  Module[{name, code, res, msgs, status},
    name = m["name"]; code = m["code"];
    msgs = {};
    res = TimeConstrained[
            Quiet[Check[ToExpression[code], $Failed, {Syntax::sntx, Syntax::sntxi}], msgs],
            20, $TimedOut];
    status = Which[
      res === $Failed, "syntax_error",
      res === $TimedOut, "timeout",
      NumberQ[res] || MatchQ[res, _?NumericQ] || VectorQ[res, NumericQ], "computed",
      Head[res] === Association, "evaluated_structure",
      True, "symbolic"];
    AppendTo[results, <|
      "module" -> name, "report" -> m["report"], "class" -> m["class"],
      "status" -> status, "head" -> ToString[Head[res]],
      "result_excerpt" -> StringTake[ToString[res, InputForm], UpTo[200]] |>]
  ],
  {m, mods}];
Export[FileNameJoin[{DirectoryName[$InputFileName], "wolfram_module_results.json"}], results, "JSON"];
Print["Done. ", Length[results], " modules; ",
  Counts[(#["status"]) & /@ results]];
