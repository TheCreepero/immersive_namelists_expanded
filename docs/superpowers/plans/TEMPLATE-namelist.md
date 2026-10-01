# <Country> (<TAG>) Namelist Plan - <YYYY-MM-DD>

Status: PLANNING

File: `common/units/names_divisions/INEX_<TAG>_names_divisions.txt`

<!-- Template for hoi4-inex-namelist-authoring. Copy to YYYY-MM-DD-<country>-namelist.md, fill every "TODO:" section, delete this comment. Sections marked "TODO(implementer)" stay for the implementer. -->

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
<!-- TODO: what exists today (vanilla groups, an existing INEX file or none), and the goal in two or three sentences -->

## Decisions
<!-- TODO: the user's policy answers (verified only or extrapolation, ideology suites, plain/named pairs) and every design decision (script and transliteration, ordinal format, gating, merges). All final: nothing "to be settled later" -->

## Vanilla findings (`-InspectVanilla <TAG>`)
<!-- TODO: table of vanilla tag, vanilla state (entry count, fallback, scripted references), action taken in the batch -->

## Group suite
<!-- TODO: the final groups, one row each, matching the batch exactly -->
| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|

## Research record
<!-- TODO: dispatches (agent, web calls used), main sources, and what stayed unverified. The dossier in scratch/ is raw input and is not needed again -->

## Author confirmation
<!-- TODO: every extrapolated or unverified entry in the batch, per group, or "None" -->

## Kept on judgment
<!-- TODO: audit flags expected to remain after the batch (LOW_DEPTH and the like), each with its reason, or "None" -->

## Implementation steps
<!-- TODO: adjust the steps to this nation -->
- [ ] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames <TAG> -Batch <this file>`. Expect `Created INEX_<TAG>_names_divisions.txt`, one green line per group and no `[ERROR]`.
- [ ] 2. `README.md`: insert the row from "Docs payload" (validation fails without it).
- [ ] 3. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: insert the cross-reference row and the `[b]<Country>[/b]` block from "Docs payload".
- [ ] 4. Wiki: write `wiki/<Country>.md` from "Docs payload", add the `wiki/Home.md` row and the `wiki/_Sidebar.md` line, then `powershell -File .\build.ps1 -SyncWiki <TAG>`. Expect no stale or missing tags.
- [ ] 5. `powershell -File .\build.ps1 -Check <TAG>`. Expect `Check passed`; remaining flags must match "Kept on judgment".
- [ ] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 7. After the user confirms: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document <TAG> division namelists"`.

## Docs payload
<!-- TODO: verbatim text, each with the file and the line it goes after -->
### README.md row
### Workshop cross-reference row
### Workshop `[b]<Country>[/b]` block
### wiki/<Country>.md (whole page)
### wiki/Home.md row
### wiki/_Sidebar.md line

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
<!-- TODO: before hand-off: "Self-check" with its result, or the proofreader's findings and how each was handled in the batch -->

## Outcome
<!-- TODO(implementer): date, group and name counts from -Check, deviations from this plan with the reason -->

## Edit batch
Applied by `build.ps1 -EditNames <TAG> -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
<!-- TODO: the newFile block, then one block per group in file order. An "addGroup" operation carries its own names in "add" -->

```json batch
{ "newFile": true, "header": "Division template historical names system for <Country> (<TAG>).\nImmersive Namelists Expanded (INEX)\n<language and orthography notes; which vanilla groups are overridden>" }
```

```json batch
{ "addGroup": true, "group": "<TAG>_INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "%d. <Fallback>",
  "comment": "# ===== Field divisions =====\n\nOverrides vanilla <TAG>_INF_01 as the plain variant.",
  "add": ["# <Section header>", "1=<Name 1>", "2=<Name 2>"] }
```
