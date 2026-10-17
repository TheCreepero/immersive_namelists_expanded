# Greece (GRE) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_GRE_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GRE`)
- AUDIT SUMMARY GRE: GROUPS=28 AUTHORED=364/382 FLAGS=3
- [GRE_PAR_01] flags: LOW_DEPTH
- [GRE_EVZ_01] flags: LOW_DEPTH
- [GRE_FAS_01] flags: LOW_DEPTH
- Vanilla leftovers (planner comparison of every vanilla key): 6 INEX groups on vanilla tags leave 76 vanilla keys in the game in vanilla's Roman-numeral form (`%s Merarchía ...`), which `wiki/Greece.md` says INEX replaces ([NAM-020]). This includes the swapped motorized and mechanized terms, and the infantry stub that vanilla reused in the mountain and garrison lists. `-Audit` counts them as numbered keys and lists no names.

## Scope
Narrow follow-up to the engine-model correction (d47fee0): only vanilla entries that still show in the game under an INEX group (R12), including plain variants whose vanilla text differs from the INEX fallback (R10). Every other flag stays as it is (see "Kept on judgment"). A full modernization of this file is out of scope.

## User decisions
- 2026-10-17, before the follow-up: narrow scope (R12 and plain-variant text); default "keep unless wrong" for vanilla names in authored groups; no online research; one Haiku implementer per nation.
- 2026-10-17: after JAP, USA, GER and ENG, the user handed the remaining nations to the orchestrating session, to run in parallel with no checkpoint until all are done ("you do not need to ask me for verification until every remaining nation ... is done"). The decisions below apply the rules used for those four.

## Research
None (user: no online research). Every replacement is the group's own fallback text, so no name is new.

## Rationale
Groups on vanilla tags merge into vanilla's groups ([NAM-020], CLAUDE.md §6), so every vanilla `ordered` key the INEX group does not write still shows. The batch writes the group's own text over each key whose vanilla text is in another format, out of category, or a repeat of an identity INEX keeps elsewhere.

| Group | Keys | What still showed | Written text |
|:---|---:|:---|:---|
| `GRE_INF_01` | 30 (1-30) | Plain variant: `%s Merarchía Pezikoú` (Roman numerals) | `%di Merarchía Pezikoú` |
| `GRE_MOT_01` | 11 (1-10, 19) | Plain variant: `%s Michanopoiiméni Merarchía Pezikoú` (vanilla swapped the motorized and mechanized terms) | `%di Michanokíniti Merarchía` |
| `GRE_MEC_01` | 11 (1-10, 19) | Plain variant: `%s Michanokíniti Merarchía` | `%di Michanopoiiméni Merarchía` |
| `GRE_ARM_01` | 11 (1-10, 20) | Plain variant: `%s Tethorakisméni Merarchía` (Roman numerals) | `%di Tethorakisméni Merarchía` |
| `GRE_MNT_01` | 10 (21-30) | `%s Merarchía Pezikoú` (vanilla reused the infantry stub) | `%di Oreiní Merarchía` |
| `GRE_GAR_01` | 3 (28-30) | `%s Merarchía Pezikoú` (vanilla reused the infantry stub) | `%di Merarchía Frourás` |

Kept: nothing. After the batch every vanilla key in these groups shows INEX's text, as `wiki/Greece.md` already says.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's fallback text. The file's authored names are unchanged.

## Author confirmation
None.

## Kept on judgment
Expected `-Check GRE` flags after the batch (3, as before):
- `LOW_DEPTH` on `GRE_PAR_01`, `GRE_EVZ_01`, `GRE_FAS_01` (as before; out of scope).
- No `Vanilla: ... vanilla name(s)` line.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (76). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GRE -Batch docs/superpowers/plans/2026-10-17-greece-audit.md`. Expect 6 green line(s), each `-0 ~0`: GRE_INF_01 +30, GRE_MOT_01 +11, GRE_MEC_01 +11, GRE_ARM_01 +11, GRE_MNT_01 +10, GRE_GAR_01 +3. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki GRE`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check GRE`. Expect `Check passed`, with the remaining flags matching "Kept on judgment". Its diff line counts distinct names per group, so its `+N` can be smaller than the number of keys written, or equal to it; either is expected. Then run `powershell -File .\build.ps1 -Audit GRE | Select-String 'vanilla name'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and namelists may show in `git status`: they are implemented in parallel by other agents; leave them alone.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged GRE entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged GRE entries"`.

## Docs payload
No docs change beyond -SyncWiki. `wiki/Greece.md` ("INEX replaces all nine vanilla lists") becomes accurate with this batch.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research). Every added entry is its group's `fallback_name`, generated by script. The keys come from vanilla `GRE_names_divisions.txt`: every key the INEX group does not write whose text differs from the group's fallback, minus the keeps under "Rationale". A preview on a scratch copy applied the batch, then showed the flags under "Kept on judgment" and the expected `vanilla name` output of step 3.

## Outcome
- Date: 2026-10-17.
- `-Check GRE`: Validate OK; Tests 434 passed, 0 failed, 0 skipped; `AUDIT SUMMARY GRE: GROUPS=28 AUTHORED=364/458 FLAGS=3`; `Flags: LOW_DEPTH x3` (`GRE_PAR_01`, `GRE_EVZ_01`, `GRE_FAS_01`, all kept on judgment); no `Docs:` warning; `Diff vs HEAD: 6 group(s) changed, +76 -0 name(s)`; `Check passed`.
- Step 3 vanilla-name grep (`-Audit GRE | Select-String 'vanilla name'`): no output, as expected.
- Deviations: none. The batch and `-SyncWiki` were applied in an earlier run (steps 1 and 2 were already ticked on resume). `-Check` refreshed the plan's change table, as the script does.

## Edit batch
Applied by `build.ps1 -EditNames GRE -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%di Merarchía Pezikoú", "2=%di Merarchía Pezikoú", "3=%di Merarchía Pezikoú", "4=%di Merarchía Pezikoú", "5=%di Merarchía Pezikoú", "6=%di Merarchía Pezikoú", "7=%di Merarchía Pezikoú", "8=%di Merarchía Pezikoú",
    "9=%di Merarchía Pezikoú", "10=%di Merarchía Pezikoú", "11=%di Merarchía Pezikoú", "12=%di Merarchía Pezikoú", "13=%di Merarchía Pezikoú", "14=%di Merarchía Pezikoú", "15=%di Merarchía Pezikoú", "16=%di Merarchía Pezikoú",
    "17=%di Merarchía Pezikoú", "18=%di Merarchía Pezikoú", "19=%di Merarchía Pezikoú", "20=%di Merarchía Pezikoú", "21=%di Merarchía Pezikoú", "22=%di Merarchía Pezikoú", "23=%di Merarchía Pezikoú", "24=%di Merarchía Pezikoú",
    "25=%di Merarchía Pezikoú", "26=%di Merarchía Pezikoú", "27=%di Merarchía Pezikoú", "28=%di Merarchía Pezikoú", "29=%di Merarchía Pezikoú", "30=%di Merarchía Pezikoú"
  ] }
```

```json batch
{ "group": "MOT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%di Michanokíniti Merarchía", "2=%di Michanokíniti Merarchía", "3=%di Michanokíniti Merarchía", "4=%di Michanokíniti Merarchía", "5=%di Michanokíniti Merarchía", "6=%di Michanokíniti Merarchía", "7=%di Michanokíniti Merarchía", "8=%di Michanokíniti Merarchía",
    "9=%di Michanokíniti Merarchía", "10=%di Michanokíniti Merarchía", "19=%di Michanokíniti Merarchía"
  ] }
```

```json batch
{ "group": "MEC_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%di Michanopoiiméni Merarchía", "2=%di Michanopoiiméni Merarchía", "3=%di Michanopoiiméni Merarchía", "4=%di Michanopoiiméni Merarchía", "5=%di Michanopoiiméni Merarchía", "6=%di Michanopoiiméni Merarchía", "7=%di Michanopoiiméni Merarchía", "8=%di Michanopoiiméni Merarchía",
    "9=%di Michanopoiiméni Merarchía", "10=%di Michanopoiiméni Merarchía", "19=%di Michanopoiiméni Merarchía"
  ] }
```

```json batch
{ "group": "ARM_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%di Tethorakisméni Merarchía", "2=%di Tethorakisméni Merarchía", "3=%di Tethorakisméni Merarchía", "4=%di Tethorakisméni Merarchía", "5=%di Tethorakisméni Merarchía", "6=%di Tethorakisméni Merarchía", "7=%di Tethorakisméni Merarchía", "8=%di Tethorakisméni Merarchía",
    "9=%di Tethorakisméni Merarchía", "10=%di Tethorakisméni Merarchía", "20=%di Tethorakisméni Merarchía"
  ] }
```

```json batch
{ "group": "MNT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "21=%di Oreiní Merarchía", "22=%di Oreiní Merarchía", "23=%di Oreiní Merarchía", "24=%di Oreiní Merarchía", "25=%di Oreiní Merarchía", "26=%di Oreiní Merarchía", "27=%di Oreiní Merarchía", "28=%di Oreiní Merarchía",
    "29=%di Oreiní Merarchía", "30=%di Oreiní Merarchía"
  ] }
```

```json batch
{ "group": "GAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "28=%di Merarchía Frourás", "29=%di Merarchía Frourás", "30=%di Merarchía Frourás"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 0 -> 30 | %di Merarchía Pezikoú (x30) | - | - |
| MOT_01 | 0 -> 11 | %di Michanokíniti Merarchía (x11) | - | - |
| MEC_01 | 0 -> 11 | %di Michanopoiiméni Merarchía (x11) | - | - |
| ARM_01 | 0 -> 11 | %di Tethorakisméni Merarchía (x11) | - | - |
| MNT_01 | 20 -> 30 | %di Oreiní Merarchía (x10) | - | - |
| GAR_01 | 27 -> 30 | %di Merarchía Frourás (x3) | - | - |

Unchanged: CAV_01, PAR_01, MAR_01, INF_02, MOT_02, MEC_02, ARM_02, MNT_02, EVZ_01, LOK_01, ISL_01, FOR_01, GEN_01, ASM_01, EXP_01, ROY_01, FAS_01, RED_01, RED_02, COM_01, DEM_01, DEM_02
<!-- END CHANGE TABLE -->
