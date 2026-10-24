# France (FRA) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_FRA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit FRA`)
- AUDIT SUMMARY FRA: GROUPS=20 AUTHORED=326/355 FLAGS=11
- [FRA_MOT_01] flags: LOW_DEPTH
- [FRA_MEC_01] flags: LOW_DEPTH, UNLINKED_MOBILE
- [FRA_DLC_01] flags: LOW_DEPTH
- [FRA_ARM_01] flags: LOW_DEPTH
- [FRA_ARM_02] flags: LOW_DEPTH
- [FRA_ARM_03] flags: LOW_DEPTH
- [FRA_PAR_01] flags: LOW_DEPTH
- [FRA_MAR_01] flags: LOW_DEPTH
- [FRA_COL_01] flags: STALE_COMMENT
- [FRA_MIL_COM_01] flags: NAME_LONG
- Vanilla leftovers (planner comparison of every vanilla key): 4 INEX groups on vanilla tags leave 94 vanilla keys in the game whose text differs from the INEX fallback ([NAM-020]). The plain `FRA_INF_01` still shows vanilla's `Div. Légère d`Infanterie` stubs, which have a backtick for the apostrophe. Two `%dère` entries at key 1 are correct and stay.

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
| `FRA_INF_01` | 42 (17, 59, 235-241; 81-90, 180-200; 303, 353) | Plain variant: vanilla's `%dème Div. Légère d`Infanterie` (with a backtick for the apostrophe) and `%dème Div. d'Infanterie d'Afrique` stubs, and the literals `3ème` and `53ème Div. Légère d`Infanterie` under keys 303 and 353 | `%dème Division d'Infanterie` |
| `FRA_PAR_01` | 1 (801) | `Division Légère d'Intervention`, which INEX keeps as 11 `11ème Division Légère d'Intervention` | `%dème Division Parachutiste` |
| `FRA_GAR_01` | 49 (106-110, 141-150, 201-234) | `%dème Div. d'Inf. de Forteresse` filler past the five fortress infantry divisions INEX writes in full (101-105) | `%dème Division de Forteresse` |

Kept: `FRA_ARM_02` 1 `%dère Brigade Cuirassée` and `FRA_PAR_01` 1 `%dère Division Parachutiste`. Both have the correct feminine ordinal for key 1, where the fallback would read "1ème". Also kept: vanilla stubs whose text is identical to the INEX fallback, which read the same either way.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's fallback text. The file's authored names are unchanged.

## Author confirmation
None.

## Kept on judgment
Expected `-Check FRA` flags after the batch (12, compared with 11 before):
- `PLACEHOLDER_ENTRIES` on `FRA_GAR_01` (new): it writes its fallback over vanilla's filler keys, which is the purpose of the batch.
- `LOW_DEPTH` on `FRA_MOT_01`, `FRA_MEC_01`, `FRA_DLC_01`, `FRA_ARM_01`, `FRA_ARM_02`, `FRA_ARM_03`, `FRA_PAR_01`, `FRA_MAR_01`; `UNLINKED_MOBILE` on `FRA_MEC_01`; `STALE_COMMENT` on `FRA_COL_01`; `NAME_LONG` on `FRA_MIL_COM_01` (as before): out of scope.
- `Vanilla:` lines: exactly two `leaves out 1 vanilla name(s)` lines (`1=%dère Brigade Cuirassée`, `1=%dère Division Parachutiste`, kept above), and `numbered key(s) past a gap` lines for stubs identical to the fallback.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (92). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames FRA -Batch docs/superpowers/plans/2026-10-17-france-audit.md`. Expect 3 green line(s), each `-0 ~0`: FRA_INF_01 +42, FRA_PAR_01 +1, FRA_GAR_01 +49. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki FRA`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check FRA`. Expect `Check passed`, with the remaining flags matching "Kept on judgment". Its diff line counts distinct names per group, so its `+N` can be smaller than the number of keys written, or equal to it; either is expected. Then run `powershell -File .\build.ps1 -Audit FRA | Select-String 'vanilla name'` and expect exactly two lines, ending `1=%dère Brigade Cuirassée` and `1=%dère Division Parachutiste`.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and namelists may show in `git status`: they are implemented in parallel by other agents; leave them alone.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged FRA entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged FRA entries"`.

## Docs payload
No docs change beyond -SyncWiki. No wiki or Workshop prose mentions these vanilla entries.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research). Every added entry is its group's `fallback_name`, generated by script. The keys come from vanilla `FRA_names_divisions.txt`: every key the INEX group does not write whose text differs from the group's fallback, minus the keeps under "Rationale". A preview on a scratch copy applied the batch, then showed the flags under "Kept on judgment" and the expected `vanilla name` output of step 3.

## Outcome
Date: 2026-10-17.

-Check FRA: `AUDIT SUMMARY FRA: GROUPS=20 AUTHORED=326/447 FLAGS=12`, Tests 434 Passed 0 Failed, Diff vs HEAD 3 group(s) changed +92 -0, `Check passed`. Flags: LOW_DEPTH x8, STALE_COMMENT x1, NAME_LONG x1, UNLINKED_MOBILE x1, PLACEHOLDER_ENTRIES x1 (FRA_GAR_01, new, expected). All are listed under "Kept on judgment". `-Audit FRA | Select-String 'vanilla name'` gave exactly the two expected lines.

Deviations: none from the plan's commands. Step 2 (`-SyncWiki FRA`) printed `France.md: 0 row(s) updated` and `wiki/Home.md: FRA group count 20 (unchanged)`; the plan gives no expected output for it, and it wrote nothing, so it was treated as consistent with "No docs edits beyond what it writes".

## Edit batch
Applied by `build.ps1 -EditNames FRA -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "17=%dème Division d'Infanterie", "59=%dème Division d'Infanterie", "81=%dème Division d'Infanterie", "82=%dème Division d'Infanterie", "83=%dème Division d'Infanterie", "84=%dème Division d'Infanterie", "85=%dème Division d'Infanterie", "86=%dème Division d'Infanterie",
    "87=%dème Division d'Infanterie", "88=%dème Division d'Infanterie", "89=%dème Division d'Infanterie", "90=%dème Division d'Infanterie", "180=%dème Division d'Infanterie", "181=%dème Division d'Infanterie", "182=%dème Division d'Infanterie", "183=%dème Division d'Infanterie",
    "184=%dème Division d'Infanterie", "185=%dème Division d'Infanterie", "186=%dème Division d'Infanterie", "187=%dème Division d'Infanterie", "188=%dème Division d'Infanterie", "189=%dème Division d'Infanterie", "190=%dème Division d'Infanterie", "191=%dème Division d'Infanterie",
    "192=%dème Division d'Infanterie", "193=%dème Division d'Infanterie", "194=%dème Division d'Infanterie", "195=%dème Division d'Infanterie", "196=%dème Division d'Infanterie", "197=%dème Division d'Infanterie", "198=%dème Division d'Infanterie", "199=%dème Division d'Infanterie",
    "200=%dème Division d'Infanterie", "235=%dème Division d'Infanterie", "236=%dème Division d'Infanterie", "237=%dème Division d'Infanterie", "238=%dème Division d'Infanterie", "239=%dème Division d'Infanterie", "240=%dème Division d'Infanterie", "241=%dème Division d'Infanterie",
    "303=%dème Division d'Infanterie", "353=%dème Division d'Infanterie"
  ] }
```

```json batch
{ "group": "PAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "801=%dème Division Parachutiste"
  ] }
```

```json batch
{ "group": "GAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "106=%dème Division de Forteresse", "107=%dème Division de Forteresse", "108=%dème Division de Forteresse", "109=%dème Division de Forteresse", "110=%dème Division de Forteresse", "141=%dème Division de Forteresse", "142=%dème Division de Forteresse", "143=%dème Division de Forteresse",
    "144=%dème Division de Forteresse", "145=%dème Division de Forteresse", "146=%dème Division de Forteresse", "147=%dème Division de Forteresse", "148=%dème Division de Forteresse", "149=%dème Division de Forteresse", "150=%dème Division de Forteresse", "201=%dème Division de Forteresse",
    "202=%dème Division de Forteresse", "203=%dème Division de Forteresse", "204=%dème Division de Forteresse", "205=%dème Division de Forteresse", "206=%dème Division de Forteresse", "207=%dème Division de Forteresse", "208=%dème Division de Forteresse", "209=%dème Division de Forteresse",
    "210=%dème Division de Forteresse", "211=%dème Division de Forteresse", "212=%dème Division de Forteresse", "213=%dème Division de Forteresse", "214=%dème Division de Forteresse", "215=%dème Division de Forteresse", "216=%dème Division de Forteresse", "217=%dème Division de Forteresse",
    "218=%dème Division de Forteresse", "219=%dème Division de Forteresse", "220=%dème Division de Forteresse", "221=%dème Division de Forteresse", "222=%dème Division de Forteresse", "223=%dème Division de Forteresse", "224=%dème Division de Forteresse", "225=%dème Division de Forteresse",
    "226=%dème Division de Forteresse", "227=%dème Division de Forteresse", "228=%dème Division de Forteresse", "229=%dème Division de Forteresse", "230=%dème Division de Forteresse", "231=%dème Division de Forteresse", "232=%dème Division de Forteresse", "233=%dème Division de Forteresse",
    "234=%dème Division de Forteresse"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 0 -> 42 | %dème Division d'Infanterie (x42) | - | - |
| PAR_01 | 4 -> 5 | %dème Division Parachutiste | - | - |
| GAR_01 | 24 -> 73 | %dème Division de Forteresse (x49) | - | - |

Unchanged: INF_02, GARDE_NAT_01, CAV_01, MOT_01, MEC_01, DLC_01, ARM_01, ARM_02, ARM_03, MAR_01, MNT_01, COL_01, DEF_01, INF_METRO_01, MIL_FAS_01, MIL_COM_01, MIL_NEU_01
<!-- END CHANGE TABLE -->
