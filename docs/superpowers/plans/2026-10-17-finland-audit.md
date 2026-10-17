# Finland (FIN) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_FIN_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit FIN`)
- AUDIT SUMMARY FIN: GROUPS=30 AUTHORED=521/549 FLAGS=3
- [FIN_LGT_01] flags: LOW_DEPTH
- [FIN_ERP_01] flags: LOW_DEPTH
- Vanilla leftovers (planner comparison of every vanilla key): 6 INEX groups on vanilla tags leave 97 vanilla keys in the game whose text differs from the INEX fallback ([NAM-020]). These are vanilla's abbreviated stubs (`PsJääkäridivisioona`, `Rannikkojääkäridiv`, `Laskuvarjojääkäridiv.`), its garrison fallback `%d. Ryhmä`, and two unnumbered entries under key 1 in plain variants.

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
| `FIN_MOT_01` | 1 (1) | Plain variant: `Jääkäridivisioona` without a number | `%d. Jääkäridivisioona` |
| `FIN_ARM_01` | 1 (1) | Plain variant: `Panssaridiv. 'Lagus'`, whose identity the Named list keeps | `%d. Panssaridivisioona` |
| `FIN_MEC_01` | 33 | Plain variant: `PsJääkäridivisioona` (1, unnumbered) and `%d. PsJääkäridivisioona` | `%d. Panssarijääkäridivisioona` |
| `FIN_GAR_01` | 22 (31-49, 51-53) | `%d. Ryhmä` (vanilla's garrison fallback; the corps-level groups have their own list) | `%d. Paikallisjoukot` |
| `FIN_MAR_01` | 20 (11-30) | `%d. Rannikkojääkäridiv` (truncated) | `%d. Rannikkojääkäridivisioona` |
| `FIN_PAR_01` | 20 (11-30) | `%d. Laskuvarjojääkäridiv.` (abbreviated) | `%d. Laskuvarjojääkäridivisioona` |

Kept: vanilla stubs identical to the INEX fallback (`FIN_INF_01`, `FIN_CAV_01`, `FIN_MOT_01`, `FIN_ARM_01`, `FIN_MTN_01`), which read the same either way.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's fallback text. The file's authored names are unchanged.

## Author confirmation
None.

## Kept on judgment
Expected `-Check FIN` flags after the batch (5, compared with 3 before):
- `PLACEHOLDER_ENTRIES` on `FIN_MAR_01`, `FIN_PAR_01` (new): these write their fallback over vanilla's merged stubs, which is the purpose of the batch.
- `LOW_DEPTH` on `FIN_LGT_01`, `FIN_ERP_01` and the file-level `IDENTITY_REPEAT` (as before; 2026-10-15 audit).
- No `Vanilla: ... vanilla name(s)` line remains.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (97). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames FIN -Batch docs/superpowers/plans/2026-10-17-finland-audit.md`. Expect 6 green line(s), each `-0 ~0`: FIN_MOT_01 +1, FIN_ARM_01 +1, FIN_MEC_01 +33, FIN_GAR_01 +22, FIN_MAR_01 +20, FIN_PAR_01 +20. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki FIN`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check FIN`. Expect `Check passed`, with the remaining flags matching "Kept on judgment". Its diff line counts distinct names per group, so its `+N` can be smaller than the number of keys written, or equal to it; either is expected. Then run `powershell -File .\build.ps1 -Audit FIN | Select-String 'vanilla name'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and namelists may show in `git status`: they are implemented in parallel by other agents; leave them alone.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged FIN entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged FIN entries"`.

## Docs payload
No docs change beyond -SyncWiki. No wiki or Workshop prose mentions these vanilla entries.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research). Every added entry is its group's `fallback_name`, generated by script. The keys come from vanilla `FIN_names_divisions.txt`: every key the INEX group does not write whose text differs from the group's fallback, minus the keeps under "Rationale". A preview on a scratch copy applied the batch, then showed the flags under "Kept on judgment" and the expected `vanilla name` output of step 3.

## Outcome
Date: 2026-10-17

`-Check FIN` summary: `AUDIT SUMMARY FIN: GROUPS=30 AUTHORED=521/646 FLAGS=5` (Flags: PLACEHOLDER_ENTRIES x2, LOW_DEPTH x2, IDENTITY_REPEAT x1). Validate OK, Tests 434 Passed 0 Failed 0 Skipped, `Check passed`. Diff vs HEAD: 6 group(s) changed, +97 -0 name(s). The `-Audit FIN | Select-String 'vanilla name'` check printed no output. All five flags are the ones listed under "Kept on judgment".

Deviations from this plan: none.

## Edit batch
Applied by `build.ps1 -EditNames FIN -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "MOT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d. Jääkäridivisioona"
  ] }
```

```json batch
{ "group": "ARM_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d. Panssaridivisioona"
  ] }
```

```json batch
{ "group": "MEC_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d. Panssarijääkäridivisioona", "2=%d. Panssarijääkäridivisioona", "3=%d. Panssarijääkäridivisioona", "4=%d. Panssarijääkäridivisioona", "5=%d. Panssarijääkäridivisioona", "6=%d. Panssarijääkäridivisioona", "7=%d. Panssarijääkäridivisioona", "8=%d. Panssarijääkäridivisioona",
    "9=%d. Panssarijääkäridivisioona", "10=%d. Panssarijääkäridivisioona", "11=%d. Panssarijääkäridivisioona", "12=%d. Panssarijääkäridivisioona", "13=%d. Panssarijääkäridivisioona", "14=%d. Panssarijääkäridivisioona", "15=%d. Panssarijääkäridivisioona", "16=%d. Panssarijääkäridivisioona",
    "17=%d. Panssarijääkäridivisioona", "18=%d. Panssarijääkäridivisioona", "19=%d. Panssarijääkäridivisioona", "20=%d. Panssarijääkäridivisioona", "21=%d. Panssarijääkäridivisioona", "22=%d. Panssarijääkäridivisioona", "23=%d. Panssarijääkäridivisioona", "24=%d. Panssarijääkäridivisioona",
    "25=%d. Panssarijääkäridivisioona", "26=%d. Panssarijääkäridivisioona", "27=%d. Panssarijääkäridivisioona", "28=%d. Panssarijääkäridivisioona", "29=%d. Panssarijääkäridivisioona", "30=%d. Panssarijääkäridivisioona", "31=%d. Panssarijääkäridivisioona", "32=%d. Panssarijääkäridivisioona",
    "33=%d. Panssarijääkäridivisioona"
  ] }
```

```json batch
{ "group": "GAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "31=%d. Paikallisjoukot", "32=%d. Paikallisjoukot", "33=%d. Paikallisjoukot", "34=%d. Paikallisjoukot", "35=%d. Paikallisjoukot", "36=%d. Paikallisjoukot", "37=%d. Paikallisjoukot", "38=%d. Paikallisjoukot",
    "39=%d. Paikallisjoukot", "40=%d. Paikallisjoukot", "41=%d. Paikallisjoukot", "42=%d. Paikallisjoukot", "43=%d. Paikallisjoukot", "44=%d. Paikallisjoukot", "45=%d. Paikallisjoukot", "46=%d. Paikallisjoukot",
    "47=%d. Paikallisjoukot", "48=%d. Paikallisjoukot", "49=%d. Paikallisjoukot", "51=%d. Paikallisjoukot", "52=%d. Paikallisjoukot", "53=%d. Paikallisjoukot"
  ] }
```

```json batch
{ "group": "MAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "11=%d. Rannikkojääkäridivisioona", "12=%d. Rannikkojääkäridivisioona", "13=%d. Rannikkojääkäridivisioona", "14=%d. Rannikkojääkäridivisioona", "15=%d. Rannikkojääkäridivisioona", "16=%d. Rannikkojääkäridivisioona", "17=%d. Rannikkojääkäridivisioona", "18=%d. Rannikkojääkäridivisioona",
    "19=%d. Rannikkojääkäridivisioona", "20=%d. Rannikkojääkäridivisioona", "21=%d. Rannikkojääkäridivisioona", "22=%d. Rannikkojääkäridivisioona", "23=%d. Rannikkojääkäridivisioona", "24=%d. Rannikkojääkäridivisioona", "25=%d. Rannikkojääkäridivisioona", "26=%d. Rannikkojääkäridivisioona",
    "27=%d. Rannikkojääkäridivisioona", "28=%d. Rannikkojääkäridivisioona", "29=%d. Rannikkojääkäridivisioona", "30=%d. Rannikkojääkäridivisioona"
  ] }
```

```json batch
{ "group": "PAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "11=%d. Laskuvarjojääkäridivisioona", "12=%d. Laskuvarjojääkäridivisioona", "13=%d. Laskuvarjojääkäridivisioona", "14=%d. Laskuvarjojääkäridivisioona", "15=%d. Laskuvarjojääkäridivisioona", "16=%d. Laskuvarjojääkäridivisioona", "17=%d. Laskuvarjojääkäridivisioona", "18=%d. Laskuvarjojääkäridivisioona",
    "19=%d. Laskuvarjojääkäridivisioona", "20=%d. Laskuvarjojääkäridivisioona", "21=%d. Laskuvarjojääkäridivisioona", "22=%d. Laskuvarjojääkäridivisioona", "23=%d. Laskuvarjojääkäridivisioona", "24=%d. Laskuvarjojääkäridivisioona", "25=%d. Laskuvarjojääkäridivisioona", "26=%d. Laskuvarjojääkäridivisioona",
    "27=%d. Laskuvarjojääkäridivisioona", "28=%d. Laskuvarjojääkäridivisioona", "29=%d. Laskuvarjojääkäridivisioona", "30=%d. Laskuvarjojääkäridivisioona"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| MOT_01 | 0 -> 1 | %d. Jääkäridivisioona | - | - |
| ARM_01 | 0 -> 1 | %d. Panssaridivisioona | - | - |
| MEC_01 | 0 -> 33 | %d. Panssarijääkäridivisioona (x33) | - | - |
| GAR_01 | 30 -> 52 | %d. Paikallisjoukot (x22) | - | - |
| MAR_01 | 10 -> 30 | %d. Rannikkojääkäridivisioona (x20) | - | - |
| PAR_01 | 10 -> 30 | %d. Laskuvarjojääkäridivisioona (x20) | - | - |

Unchanged: INF_01, INF_05, CAV_01, LGT_01, REG_01, BRIG_01, MOT_02, ARM_02, MEC_02, GAR_02, DET_01, DET_02, ERP_01, PEN_01, MTN_01, FRN_01, CST_01, SVFK_01, SVFK_02, MIL_01, INF_02, MIL_02, INF_04, GUA_01
<!-- END CHANGE TABLE -->
