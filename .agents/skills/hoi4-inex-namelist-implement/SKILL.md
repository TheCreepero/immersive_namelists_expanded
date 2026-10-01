---
name: hoi4-inex-namelist-implement
description: >-
  Use when carrying out a finished Immersive Namelists Expanded (INEX) plan file from docs/superpowers/plans
  (Status READY or IN PROGRESS): "implement", "apply" or "continue" a namelist or audit plan, or a plan path
  given as the argument. Applies the plan's edit batch, syncs the docs and verifies. Does no research and makes
  no naming decisions; for those use hoi4-inex-namelist-authoring or hoi4-inex-namelist-audit.
---

# INEX Namelist Plan Implementation

Carries out one plan file written by `hoi4-inex-namelist-authoring` or `hoi4-inex-namelist-audit`. The planning is done: the plan holds every decision, every name and every docs text. Your job is to run its steps exactly and report.

## Rules
- **The plan is the only source.** Do not search the web, dispatch a research or proofreading subagent, read a dossier in `scratch/`, ask policy questions, or invoke the authoring or audit skill.
- **Do not decide and do not compose.** No new names, no respellings, no regrouping, no rewording of docs text. If the plan looks wrong or incomplete, that is a stop condition, not something to fix.
- **Never open the namelist file**, and never edit it by hand. It changes only through the `build.ps1` commands the plan gives.
- **Never read the plan past `## Edit batch`.** The batch is applied by the script from the file; it is not typed out, copied or read back.
- `build.ps1`, tests, skill files, `CLAUDE.md` and `GEMINI.md` are not edited.
- The wiki push is outward-facing: run it only after the user confirms.

## 1. Open the plan
1. Take the plan path from the request. With no path, look in `docs/superpowers/plans/` for a file whose `Status:` line is `READY` or `IN PROGRESS` (`Grep -n '^Status:'`); if there is more than one or none, ask the user which plan to run.
2. `Grep -n '^## '` the plan for its headings, then `Read` it from the top with a `limit` that stops at the `## Edit batch` line.
3. Check the `Status:` line:
   - `PLANNING`: stop. Tell the user the plan is unfinished and belongs back with the planning skill.
   - `READY`: begin at step 1 of "Implementation steps".
   - `IN PROGRESS`: an earlier session got part-way. Begin at the first unticked step; ticked steps are done and are not repeated.
   - `DONE`: stop and say so. Only the wiki push may remain, if its box is unticked.

## 2. Run the steps
Work through "Implementation steps" in order. For each step:
1. Run the command exactly as written (replace `<this file>` with the plan path).
2. Compare the output with what the step says to expect.
3. Tick the box in the plan (`- [ ]` to `- [x]`) before starting the next step, so a later session can resume.

What the usual steps mean:
- **Apply the batch**: `powershell -File .\build.ps1 -EditNames <TAG> -Batch <plan path>` applies every `` ```json batch `` block, all or nothing. One summary line per group. A new nation's batch creates the file; if it reports that the file already exists, the batch was applied before: stop and report.
- **Docs payload**: insert or replace exactly the text the plan gives, at the place it names, with the Edit and Write tools. Docs are UTF-8 without BOM: never use Windows PowerShell 5.1 `Set-Content`/`Get-Content` or Git Bash `sed -i` on them (they corrupt diacritics), and do not normalize line endings.
- **`-SyncWiki <TAG>`**: brings the wiki's group rows in step with the file and reports stale or missing tags. A report the plan did not predict is a stop condition.
- **`-Check <TAG>`**: validation, the Pester suite, the audit summary with flags and `Docs:` warnings, and diff counts in about ten lines. It must end with `Check passed`. Every flag it shows must be listed in the plan's "Kept on judgment".

## 3. Stop conditions
Stop, leave the remaining boxes unticked, and report what happened with the exact output when:
- the batch fails (the error names the operation; the file is untouched);
- `-Check` fails, or shows a flag or `Docs:` warning that "Kept on judgment" does not list, and the plan describes no fix for it, or its fix did not work on the first try;
- a step is unclear, has no command for what it asks, or refers to text the plan does not contain;
- a name in any output looks wrong to you. Report it; do not change it.

The plan's own "Stop conditions" section applies as well. Do not research, guess or work around: the person who wrote the plan fixes the plan.

## 4. Finish
1. Fill the plan's "Outcome" section: the date, the `-Check` summary line (groups, authored entries, flags), and any deviation from the plan with its reason.
2. Set `Status: DONE`.
3. Run `git status` and confirm only the files the plan names have changed.
4. Report to the user: the `-Check` result, the files changed, and that the wiki push is waiting for confirmation. Do not commit unless asked.
