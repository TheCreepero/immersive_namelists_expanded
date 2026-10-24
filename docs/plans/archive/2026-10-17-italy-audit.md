# Italy (ITA) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_ITA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit ITA`)
- AUDIT SUMMARY ITA: GROUPS=43 AUTHORED=809/909 FLAGS=23
- [ITA_INF_01] flags: POLITICAL_ENTRY
- [ITA_COL_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ITA_COL_02] flags: LOW_DEPTH
- [ITA_COL_03] flags: LOW_DEPTH
- [ITA_CAV_02] flags: LOW_DEPTH
- [ITA_CAV_03] flags: LOW_DEPTH
- [ITA_CAV_04] flags: LOW_DEPTH
- [ITA_CAV_05] flags: LOW_DEPTH
- [ITA_CAV_06] flags: LOW_DEPTH
- [ITA_FAV_01] flags: LOW_DEPTH
- [ITA_ALT_01] flags: LOW_DEPTH
- [ITA_MOT_01] flags: STALE_COMMENT
- [ITA_ARM_01] flags: STALE_COMMENT
- [ITA_MAR_01] flags: LOW_DEPTH
- [ITA_MAR_02] flags: LOW_DEPTH
- [ITA_PAR_01] flags: LOW_DEPTH
- [ITA_RGR_01] flags: LOW_DEPTH
- [ITA_ARD_01] flags: LOW_DEPTH
- [ITA_GAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- Vanilla leftovers (`Vanilla: leaves out` lines and a planner comparison of every vanilla key): 6 INEX groups on vanilla tags leave 68 vanilla keys in the game whose text differs from the INEX fallback ([NAM-020]). Of these, 53 are in vanilla's old formats or repeat an INEX identity. The other 15 are named infantry and Blackshirt divisions in the group's own format.

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
| `ITA_INF_02` | 1 (14) | `%da Divisione CC.NN. 'M'`, which INEX keeps as `ITA_ARM_01` 138 `1a Divisione Corazzata CC.NN. 'M'` | `%da Divisione CC.NN.` |
| `ITA_COL_01` | 28 (3-30) | `%da Divisione F. Coloniale` (vanilla's abbreviated fallback) | `%da Divisione Coloniale` |
| `ITA_COL_02` | 18 (3-20) | `%do Gruppo Bande Irregolari` (a letter o for the degree sign, which the 2026-09-30 audit corrected in the fallbacks) | `%d° Gruppo Bande Irregolari` |
| `ITA_CAV_04` | 3 (1-3) | `%do Gruppo Squadroni Savari` | `%d° Gruppo Squadroni Savari` |
| `ITA_CAV_05` | 3 (1-3) | `%do Gruppo Squadroni Spahis` | `%d° Gruppo Squadroni Spahis` |

Kept ("keep unless wrong"; no research, so nothing can be verified or sourced):
- `ITA_INF_01` 66-79: vanilla's named infantry divisions `'Monferrato'`, `'Monviso'`, `'Leonessa'`, `'Timavo'`, `'Montenero'`, `'Carnaro'`, `'Fossalta'`, `'Metauro'`, `'Gavinana'`, `'Curtatone e Montanara'`, `'Gran Sasso'`, `'Vespri'`, `'Peloritana'`, `'Caprera'`. They are in the group's own format, under numbers INEX leaves free. `-Audit` counts 8 of them as kept in another list, but those matches are CC.NN. legions, cover sectors and partisan units that share the place name, not the same divisions.
- `ITA_INF_02` 13: `%da Divisione CC.NN. 'Biscaccianti'`, in the group's own format.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's fallback text. The file's authored names are unchanged.

## Author confirmation
Vanilla names kept without verification (no research): `ITA_INF_01` 66-79 (14 named infantry divisions) and `ITA_INF_02` 13 `'Biscaccianti'`. If any of them should not show, a later audit can replace it with a sourced name under its number.

## Kept on judgment
Expected `-Check ITA` flags after the batch (26, compared with 23 before):
- `PLACEHOLDER_ENTRIES` on `ITA_COL_02`, `ITA_CAV_04`, `ITA_CAV_05` (new): these write their fallback over vanilla's merged keys, which is the purpose of the batch.
- `PLACEHOLDER_ENTRIES` on `ITA_COL_01`, `ITA_GAR_01`; `LOW_DEPTH` on 16 groups; `POLITICAL_ENTRY` on `ITA_INF_01`; `STALE_COMMENT` on `ITA_MOT_01`, `ITA_ARM_01`; the file-level `IDENTITY_REPEAT` and `TODO_COMMENT` (as before). Out of scope.
- `Vanilla:` lines: exactly two `vanilla name(s)` lines, for `ITA_INF_01` (6 names, 8 more counted in another list) and `ITA_INF_02` (`13=%da Divisione CC.NN. 'Biscaccianti'`), kept above.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (53). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames ITA -Batch docs/superpowers/plans/2026-10-17-italy-audit.md`. Expect 5 green line(s), each `-0 ~0`: ITA_INF_02 +1, ITA_COL_01 +28, ITA_COL_02 +18, ITA_CAV_04 +3, ITA_CAV_05 +3. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki ITA`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check ITA`. Expect `Check passed`, with the remaining flags matching "Kept on judgment". Its diff line counts distinct names per group, so its `+N` can be smaller than the number of keys written, or equal to it; either is expected. Then run `powershell -File .\build.ps1 -Audit ITA | Select-String 'vanilla name'` and expect exactly two lines: one starting `leaves out 6 vanilla name(s)` (ITA_INF_01) and one ending `13=%da Divisione CC.NN. 'Biscaccianti'`.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and namelists may show in `git status`: they are implemented in parallel by other agents; leave them alone.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged ITA entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged ITA entries"`.

## Docs payload
No docs change beyond -SyncWiki. No wiki or Workshop prose mentions these vanilla entries.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research). Every added entry is its group's `fallback_name`, generated by script. The keys come from vanilla `ITA_names_divisions.txt`: every key the INEX group does not write whose text differs from the group's fallback, minus the keeps under "Rationale". A preview on a scratch copy applied the batch, then showed the flags under "Kept on judgment" and the expected `vanilla name` output of step 3.

## Outcome
Date: 2026-10-17.

-Check ITA: `AUDIT SUMMARY ITA: GROUPS=43 AUTHORED=809/962 FLAGS=26` (LOW_DEPTH x16, PLACEHOLDER_ENTRIES x5, STALE_COMMENT x2, IDENTITY_REPEAT x1, TODO_COMMENT x1, POLITICAL_ENTRY x1). Every flag is listed under "Kept on judgment". Validate OK, Tests 434 passed, 0 failed, `Check passed`. Diff vs HEAD: 5 groups changed, +53 name(s). The `-Audit ITA` vanilla-name lines are the two expected ones (ITA_INF_01: 6 names; ITA_INF_02: `13=%da Divisione CC.NN. 'Biscaccianti'`).

Batch applied: ITA_INF_02 +1, ITA_COL_01 +28, ITA_COL_02 +18, ITA_CAV_04 +3, ITA_CAV_05 +3, all `-0 ~0`. `-SyncWiki ITA` updated 0 rows; `wiki/Home.md` ITA group count unchanged at 43.

Deviations: none.

## Edit batch
Applied by `build.ps1 -EditNames ITA -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_02", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "14=%da Divisione CC.NN."
  ] }
```

```json batch
{ "group": "COL_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "3=%da Divisione Coloniale", "4=%da Divisione Coloniale", "5=%da Divisione Coloniale", "6=%da Divisione Coloniale", "7=%da Divisione Coloniale", "8=%da Divisione Coloniale", "9=%da Divisione Coloniale", "10=%da Divisione Coloniale",
    "11=%da Divisione Coloniale", "12=%da Divisione Coloniale", "13=%da Divisione Coloniale", "14=%da Divisione Coloniale", "15=%da Divisione Coloniale", "16=%da Divisione Coloniale", "17=%da Divisione Coloniale", "18=%da Divisione Coloniale",
    "19=%da Divisione Coloniale", "20=%da Divisione Coloniale", "21=%da Divisione Coloniale", "22=%da Divisione Coloniale", "23=%da Divisione Coloniale", "24=%da Divisione Coloniale", "25=%da Divisione Coloniale", "26=%da Divisione Coloniale",
    "27=%da Divisione Coloniale", "28=%da Divisione Coloniale", "29=%da Divisione Coloniale", "30=%da Divisione Coloniale"
  ] }
```

```json batch
{ "group": "COL_02", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "3=%d° Gruppo Bande Irregolari", "4=%d° Gruppo Bande Irregolari", "5=%d° Gruppo Bande Irregolari", "6=%d° Gruppo Bande Irregolari", "7=%d° Gruppo Bande Irregolari", "8=%d° Gruppo Bande Irregolari", "9=%d° Gruppo Bande Irregolari", "10=%d° Gruppo Bande Irregolari",
    "11=%d° Gruppo Bande Irregolari", "12=%d° Gruppo Bande Irregolari", "13=%d° Gruppo Bande Irregolari", "14=%d° Gruppo Bande Irregolari", "15=%d° Gruppo Bande Irregolari", "16=%d° Gruppo Bande Irregolari", "17=%d° Gruppo Bande Irregolari", "18=%d° Gruppo Bande Irregolari",
    "19=%d° Gruppo Bande Irregolari", "20=%d° Gruppo Bande Irregolari"
  ] }
```

```json batch
{ "group": "CAV_04", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d° Gruppo Squadroni Savari", "2=%d° Gruppo Squadroni Savari", "3=%d° Gruppo Squadroni Savari"
  ] }
```

```json batch
{ "group": "CAV_05", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d° Gruppo Squadroni Spahis", "2=%d° Gruppo Squadroni Spahis", "3=%d° Gruppo Squadroni Spahis"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_02 | 12 -> 13 | %da Divisione CC.NN. | - | - |
| COL_01 | 6 -> 34 | %da Divisione Coloniale (x28) | - | - |
| COL_02 | 2 -> 20 | %d° Gruppo Bande Irregolari (x18) | - | - |
| CAV_04 | 0 -> 3 | %d° Gruppo Squadroni Savari (x3) | - | - |
| CAV_05 | 0 -> 3 | %d° Gruppo Squadroni Spahis (x3) | - | - |

Unchanged: INF_01, LEG_01, RSI_01, BRN_01, MONCH_01, COM_01, COL_03, CAV_01, CAV_02, CAV_03, CAV_06, GAL_01, GEL_01, MAT_01, AUT_01, FAV_01, ALT_01, MOT_01, MEC_01, MEC_02, ARM_01, MAR_01, MAR_02, MNT_01, PAR_01, RGR_01, ARD_01, FES_01, GAR_01, GAF_01, CAR_01, ROM_01, MIL_01, GDF_01, COL_04, REP_01, RED_01, IRR_01
<!-- END CHANGE TABLE -->
