# Romania (ROM) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_ROM_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit ROM`)
- AUDIT SUMMARY ROM: GROUPS=29 AUTHORED=348/348 FLAGS=1
- [ROM_ROY_02] flags: NAME_LONG
- Vanilla leftovers (planner comparison of every vanilla key): all 9 INEX groups on vanilla tags leave vanilla's stubs in the game, 308 keys in all ([NAM-020]). These are vanilla's grammar errors that `wiki/Romania.md` says INEX replaces: `Divizie` without the article, `Motomecanizat`, `Armura`, `Marinar`, `Paza` and `Parasutisti` without diacritics. `-Audit` counts them as numbered keys, so it lists only 4.

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
| `ROM_INF_01` | 52 (1-32, 36-55) | Plain variant: `Divizie %d Infanterie`. Also the literals `Divizia 1/2 Infanterie de Garda`, `Divizie 1 Fortificatii` and `Divizie 1 Graniceri` under 52-55, which INEX keeps in its Royal Guard, fortification and border lists | `Divizia %d Infanterie` |
| `ROM_MOT_01` | 33 | Plain variant: `Divizie %d Motomecanizat` | `Divizia %d Motorizată` |
| `ROM_MEC_01` | 33 | Plain variant: `Divizie %d Motomecanizat` | `Divizia %d Mecanizată` |
| `ROM_ARM_01` | 33 | Plain variant: `Divizie %d Armura` | `Divizia %d Blindată` |
| `ROM_CAV_01` | 41 (13-53) | `Brigada %d Cavalerie` (vanilla's fallback) | `Divizia %d Cavalerie` |
| `ROM_MTN_01` | 43 (11-53) | `Brigada %d de Munte Mixtă` | `Brigada %d Mixtă Munte` |
| `ROM_MAR_01` | 19 (12-30) | `Divizie %d Infanterie Marinar` | `Regimentul %d Infanterie Marină` |
| `ROM_PAR_01` | 20 (11-30) | `Divizie %d Parasutisti` | `Batalionul %d Parașutiști` |
| `ROM_GAR_01` | 34 (15-32, 36-51) | `Divizia %d Paza` | `Divizia %d Pază` |

Kept: nothing. After the batch every vanilla key in these groups shows INEX's text, as `wiki/Romania.md` already says.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's fallback text. The file's authored names are unchanged.

## Author confirmation
None.

## Kept on judgment
Expected `-Check ROM` flags after the batch (6, compared with 1 before):
- `PLACEHOLDER_ENTRIES` on `ROM_CAV_01`, `ROM_MTN_01`, `ROM_MAR_01`, `ROM_PAR_01`, `ROM_GAR_01` (new): these write their fallback over vanilla's merged stubs, which is the purpose of the batch.
- `NAME_LONG` on `ROM_ROY_02` (as before).
- No `Vanilla: ... vanilla name(s)` line remains.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (308). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames ROM -Batch docs/superpowers/plans/2026-10-17-romania-audit.md`. Expect 9 green line(s), each `-0 ~0`: ROM_INF_01 +52, ROM_MOT_01 +33, ROM_MEC_01 +33, ROM_ARM_01 +33, ROM_CAV_01 +41, ROM_MTN_01 +43, ROM_MAR_01 +19, ROM_PAR_01 +20, ROM_GAR_01 +34. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki ROM`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check ROM`. Expect `Check passed`, with the remaining flags matching "Kept on judgment". Its diff line counts distinct names per group, so its `+N` can be smaller than the number of keys written, or equal to it; either is expected. Then run `powershell -File .\build.ps1 -Audit ROM | Select-String 'vanilla name'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and namelists may show in `git status`: they are implemented in parallel by other agents; leave them alone.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged ROM entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged ROM entries"`.

## Docs payload
No docs change beyond -SyncWiki. `wiki/Romania.md` ("INEX replaces all nine vanilla lists") becomes accurate with this batch.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research). Every added entry is its group's `fallback_name`, generated by script. The keys come from vanilla `ROM_names_divisions.txt`: every key the INEX group does not write whose text differs from the group's fallback, minus the keeps under "Rationale". A preview on a scratch copy applied the batch, then showed the flags under "Kept on judgment" and the expected `vanilla name` output of step 3.

## Outcome
Date: 2026-10-17

`-Check ROM` summary: `AUDIT SUMMARY ROM: GROUPS=29 AUTHORED=348/656 FLAGS=6`. Flags: `PLACEHOLDER_ENTRIES` x5 (ROM_CAV_01, ROM_MTN_01, ROM_MAR_01, ROM_PAR_01, ROM_GAR_01), `NAME_LONG` x1 (ROM_ROY_02). Validate OK, tests 434 passed, 0 failed, 0 skipped. Diff vs HEAD: 9 groups changed, +308 -0 names. `Check passed`. `-Audit ROM | Select-String 'vanilla name'` returned no output.

Deviations from this plan: none.

## Edit batch
Applied by `build.ps1 -EditNames ROM -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=Divizia %d Infanterie", "2=Divizia %d Infanterie", "3=Divizia %d Infanterie", "4=Divizia %d Infanterie", "5=Divizia %d Infanterie", "6=Divizia %d Infanterie", "7=Divizia %d Infanterie", "8=Divizia %d Infanterie",
    "9=Divizia %d Infanterie", "10=Divizia %d Infanterie", "11=Divizia %d Infanterie", "12=Divizia %d Infanterie", "13=Divizia %d Infanterie", "14=Divizia %d Infanterie", "15=Divizia %d Infanterie", "16=Divizia %d Infanterie",
    "17=Divizia %d Infanterie", "18=Divizia %d Infanterie", "19=Divizia %d Infanterie", "20=Divizia %d Infanterie", "21=Divizia %d Infanterie", "22=Divizia %d Infanterie", "23=Divizia %d Infanterie", "24=Divizia %d Infanterie",
    "25=Divizia %d Infanterie", "26=Divizia %d Infanterie", "27=Divizia %d Infanterie", "28=Divizia %d Infanterie", "29=Divizia %d Infanterie", "30=Divizia %d Infanterie", "31=Divizia %d Infanterie", "32=Divizia %d Infanterie",
    "36=Divizia %d Infanterie", "37=Divizia %d Infanterie", "38=Divizia %d Infanterie", "39=Divizia %d Infanterie", "40=Divizia %d Infanterie", "41=Divizia %d Infanterie", "42=Divizia %d Infanterie", "43=Divizia %d Infanterie",
    "44=Divizia %d Infanterie", "45=Divizia %d Infanterie", "46=Divizia %d Infanterie", "47=Divizia %d Infanterie", "48=Divizia %d Infanterie", "49=Divizia %d Infanterie", "50=Divizia %d Infanterie", "51=Divizia %d Infanterie",
    "52=Divizia %d Infanterie", "53=Divizia %d Infanterie", "54=Divizia %d Infanterie", "55=Divizia %d Infanterie"
  ] }
```

```json batch
{ "group": "MOT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=Divizia %d Motorizată", "2=Divizia %d Motorizată", "3=Divizia %d Motorizată", "4=Divizia %d Motorizată", "5=Divizia %d Motorizată", "6=Divizia %d Motorizată", "7=Divizia %d Motorizată", "8=Divizia %d Motorizată",
    "9=Divizia %d Motorizată", "10=Divizia %d Motorizată", "11=Divizia %d Motorizată", "12=Divizia %d Motorizată", "13=Divizia %d Motorizată", "14=Divizia %d Motorizată", "15=Divizia %d Motorizată", "16=Divizia %d Motorizată",
    "17=Divizia %d Motorizată", "18=Divizia %d Motorizată", "19=Divizia %d Motorizată", "20=Divizia %d Motorizată", "21=Divizia %d Motorizată", "22=Divizia %d Motorizată", "23=Divizia %d Motorizată", "24=Divizia %d Motorizată",
    "25=Divizia %d Motorizată", "26=Divizia %d Motorizată", "27=Divizia %d Motorizată", "28=Divizia %d Motorizată", "29=Divizia %d Motorizată", "30=Divizia %d Motorizată", "31=Divizia %d Motorizată", "32=Divizia %d Motorizată",
    "33=Divizia %d Motorizată"
  ] }
```

```json batch
{ "group": "MEC_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=Divizia %d Mecanizată", "2=Divizia %d Mecanizată", "3=Divizia %d Mecanizată", "4=Divizia %d Mecanizată", "5=Divizia %d Mecanizată", "6=Divizia %d Mecanizată", "7=Divizia %d Mecanizată", "8=Divizia %d Mecanizată",
    "9=Divizia %d Mecanizată", "10=Divizia %d Mecanizată", "11=Divizia %d Mecanizată", "12=Divizia %d Mecanizată", "13=Divizia %d Mecanizată", "14=Divizia %d Mecanizată", "15=Divizia %d Mecanizată", "16=Divizia %d Mecanizată",
    "17=Divizia %d Mecanizată", "18=Divizia %d Mecanizată", "19=Divizia %d Mecanizată", "20=Divizia %d Mecanizată", "21=Divizia %d Mecanizată", "22=Divizia %d Mecanizată", "23=Divizia %d Mecanizată", "24=Divizia %d Mecanizată",
    "25=Divizia %d Mecanizată", "26=Divizia %d Mecanizată", "27=Divizia %d Mecanizată", "28=Divizia %d Mecanizată", "29=Divizia %d Mecanizată", "30=Divizia %d Mecanizată", "31=Divizia %d Mecanizată", "32=Divizia %d Mecanizată",
    "33=Divizia %d Mecanizată"
  ] }
```

```json batch
{ "group": "ARM_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=Divizia %d Blindată", "2=Divizia %d Blindată", "3=Divizia %d Blindată", "4=Divizia %d Blindată", "5=Divizia %d Blindată", "6=Divizia %d Blindată", "7=Divizia %d Blindată", "8=Divizia %d Blindată",
    "9=Divizia %d Blindată", "10=Divizia %d Blindată", "11=Divizia %d Blindată", "12=Divizia %d Blindată", "13=Divizia %d Blindată", "14=Divizia %d Blindată", "15=Divizia %d Blindată", "16=Divizia %d Blindată",
    "17=Divizia %d Blindată", "18=Divizia %d Blindată", "19=Divizia %d Blindată", "20=Divizia %d Blindată", "21=Divizia %d Blindată", "22=Divizia %d Blindată", "23=Divizia %d Blindată", "24=Divizia %d Blindată",
    "25=Divizia %d Blindată", "26=Divizia %d Blindată", "27=Divizia %d Blindată", "28=Divizia %d Blindată", "29=Divizia %d Blindată", "30=Divizia %d Blindată", "31=Divizia %d Blindată", "32=Divizia %d Blindată",
    "33=Divizia %d Blindată"
  ] }
```

```json batch
{ "group": "CAV_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "13=Divizia %d Cavalerie", "14=Divizia %d Cavalerie", "15=Divizia %d Cavalerie", "16=Divizia %d Cavalerie", "17=Divizia %d Cavalerie", "18=Divizia %d Cavalerie", "19=Divizia %d Cavalerie", "20=Divizia %d Cavalerie",
    "21=Divizia %d Cavalerie", "22=Divizia %d Cavalerie", "23=Divizia %d Cavalerie", "24=Divizia %d Cavalerie", "25=Divizia %d Cavalerie", "26=Divizia %d Cavalerie", "27=Divizia %d Cavalerie", "28=Divizia %d Cavalerie",
    "29=Divizia %d Cavalerie", "30=Divizia %d Cavalerie", "31=Divizia %d Cavalerie", "32=Divizia %d Cavalerie", "33=Divizia %d Cavalerie", "34=Divizia %d Cavalerie", "35=Divizia %d Cavalerie", "36=Divizia %d Cavalerie",
    "37=Divizia %d Cavalerie", "38=Divizia %d Cavalerie", "39=Divizia %d Cavalerie", "40=Divizia %d Cavalerie", "41=Divizia %d Cavalerie", "42=Divizia %d Cavalerie", "43=Divizia %d Cavalerie", "44=Divizia %d Cavalerie",
    "45=Divizia %d Cavalerie", "46=Divizia %d Cavalerie", "47=Divizia %d Cavalerie", "48=Divizia %d Cavalerie", "49=Divizia %d Cavalerie", "50=Divizia %d Cavalerie", "51=Divizia %d Cavalerie", "52=Divizia %d Cavalerie",
    "53=Divizia %d Cavalerie"
  ] }
```

```json batch
{ "group": "MTN_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "11=Brigada %d Mixtă Munte", "12=Brigada %d Mixtă Munte", "13=Brigada %d Mixtă Munte", "14=Brigada %d Mixtă Munte", "15=Brigada %d Mixtă Munte", "16=Brigada %d Mixtă Munte", "17=Brigada %d Mixtă Munte", "18=Brigada %d Mixtă Munte",
    "19=Brigada %d Mixtă Munte", "20=Brigada %d Mixtă Munte", "21=Brigada %d Mixtă Munte", "22=Brigada %d Mixtă Munte", "23=Brigada %d Mixtă Munte", "24=Brigada %d Mixtă Munte", "25=Brigada %d Mixtă Munte", "26=Brigada %d Mixtă Munte",
    "27=Brigada %d Mixtă Munte", "28=Brigada %d Mixtă Munte", "29=Brigada %d Mixtă Munte", "30=Brigada %d Mixtă Munte", "31=Brigada %d Mixtă Munte", "32=Brigada %d Mixtă Munte", "33=Brigada %d Mixtă Munte", "34=Brigada %d Mixtă Munte",
    "35=Brigada %d Mixtă Munte", "36=Brigada %d Mixtă Munte", "37=Brigada %d Mixtă Munte", "38=Brigada %d Mixtă Munte", "39=Brigada %d Mixtă Munte", "40=Brigada %d Mixtă Munte", "41=Brigada %d Mixtă Munte", "42=Brigada %d Mixtă Munte",
    "43=Brigada %d Mixtă Munte", "44=Brigada %d Mixtă Munte", "45=Brigada %d Mixtă Munte", "46=Brigada %d Mixtă Munte", "47=Brigada %d Mixtă Munte", "48=Brigada %d Mixtă Munte", "49=Brigada %d Mixtă Munte", "50=Brigada %d Mixtă Munte",
    "51=Brigada %d Mixtă Munte", "52=Brigada %d Mixtă Munte", "53=Brigada %d Mixtă Munte"
  ] }
```

```json batch
{ "group": "MAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "12=Regimentul %d Infanterie Marină", "13=Regimentul %d Infanterie Marină", "14=Regimentul %d Infanterie Marină", "15=Regimentul %d Infanterie Marină", "16=Regimentul %d Infanterie Marină", "17=Regimentul %d Infanterie Marină", "18=Regimentul %d Infanterie Marină", "19=Regimentul %d Infanterie Marină",
    "20=Regimentul %d Infanterie Marină", "21=Regimentul %d Infanterie Marină", "22=Regimentul %d Infanterie Marină", "23=Regimentul %d Infanterie Marină", "24=Regimentul %d Infanterie Marină", "25=Regimentul %d Infanterie Marină", "26=Regimentul %d Infanterie Marină", "27=Regimentul %d Infanterie Marină",
    "28=Regimentul %d Infanterie Marină", "29=Regimentul %d Infanterie Marină", "30=Regimentul %d Infanterie Marină"
  ] }
```

```json batch
{ "group": "PAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "11=Batalionul %d Parașutiști", "12=Batalionul %d Parașutiști", "13=Batalionul %d Parașutiști", "14=Batalionul %d Parașutiști", "15=Batalionul %d Parașutiști", "16=Batalionul %d Parașutiști", "17=Batalionul %d Parașutiști", "18=Batalionul %d Parașutiști",
    "19=Batalionul %d Parașutiști", "20=Batalionul %d Parașutiști", "21=Batalionul %d Parașutiști", "22=Batalionul %d Parașutiști", "23=Batalionul %d Parașutiști", "24=Batalionul %d Parașutiști", "25=Batalionul %d Parașutiști", "26=Batalionul %d Parașutiști",
    "27=Batalionul %d Parașutiști", "28=Batalionul %d Parașutiști", "29=Batalionul %d Parașutiști", "30=Batalionul %d Parașutiști"
  ] }
```

```json batch
{ "group": "GAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "15=Divizia %d Pază", "16=Divizia %d Pază", "17=Divizia %d Pază", "18=Divizia %d Pază", "19=Divizia %d Pază", "20=Divizia %d Pază", "21=Divizia %d Pază", "22=Divizia %d Pază",
    "23=Divizia %d Pază", "24=Divizia %d Pază", "25=Divizia %d Pază", "26=Divizia %d Pază", "27=Divizia %d Pază", "28=Divizia %d Pază", "29=Divizia %d Pază", "30=Divizia %d Pază",
    "31=Divizia %d Pază", "32=Divizia %d Pază", "36=Divizia %d Pază", "37=Divizia %d Pază", "38=Divizia %d Pază", "39=Divizia %d Pază", "40=Divizia %d Pază", "41=Divizia %d Pază",
    "42=Divizia %d Pază", "43=Divizia %d Pază", "44=Divizia %d Pază", "45=Divizia %d Pază", "46=Divizia %d Pază", "47=Divizia %d Pază", "48=Divizia %d Pază", "49=Divizia %d Pază",
    "50=Divizia %d Pază", "51=Divizia %d Pază"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 0 -> 52 | Divizia %d Infanterie (x52) | - | - |
| MOT_01 | 0 -> 33 | Divizia %d Motorizată (x33) | - | - |
| MEC_01 | 0 -> 33 | Divizia %d Mecanizată (x33) | - | - |
| ARM_01 | 0 -> 33 | Divizia %d Blindată (x33) | - | - |
| CAV_01 | 12 -> 53 | Divizia %d Cavalerie (x41) | - | - |
| MTN_01 | 10 -> 53 | Brigada %d Mixtă Munte (x43) | - | - |
| MAR_01 | 11 -> 30 | Regimentul %d Infanterie Marină (x19) | - | - |
| PAR_01 | 10 -> 30 | Batalionul %d Parașutiști (x20) | - | - |
| GAR_01 | 14 -> 48 | Divizia %d Pază (x34) | - | - |

Unchanged: INF_02, MOT_02, MEC_02, ARM_02, CAV_02, CAV_03, MTN_02, FOR_01, BOR_01, JAN_01, ROY_01, ROY_02, STR_01, FAS_01, FAS_02, RED_01, RED_02, RED_03, DEM_01, DEM_02
<!-- END CHANGE TABLE -->
