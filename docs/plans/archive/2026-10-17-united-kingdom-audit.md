# United Kingdom (ENG) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_ENG_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit ENG`)
- AUDIT SUMMARY ENG: GROUPS=28 AUTHORED=269/401 FLAGS=27
- [ENG_INF_02] flags: LOW_DEPTH
- [ENG_INF_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_CAV_01] flags: LOW_DEPTH
- [ENG_CAV_02] flags: LOW_DEPTH
- [ENG_MOT_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_ARM_01] flags: LOW_DEPTH
- [ENG_ARM_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_ARM_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_PAR_01] flags: LOW_DEPTH
- [ENG_PAR_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_MAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_MNT_01] flags: LOW_DEPTH
- [ENG_MNT_02] flags: LOW_DEPTH
- [ENG_DEM_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_INDEPENDENT_BRIGADES_01] flags: LOW_DEPTH
- [ENG_SSB_01] flags: LOW_DEPTH
- [ENG_FAS_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_COM_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- Vanilla leftovers (`Vanilla: leaves out` lines, plus a planner comparison of every vanilla key): 21 INEX groups on vanilla tags leave 682 vanilla keys in the game, because vanilla ENG groups merge into INEX's ([NAM-020]). 522 of them are vanilla ordinal stubs of the group's own designation with the correct suffix. 160 are names or designations that the 2026-10-01 audit purged on purpose.
- Found on manual review: some leftovers show the wrong number. Literal entries such as `1st King's African Rifles` (key 581), `12th (West Africa) Infantry Division` (812) and `1st Sudanese Colonials` (501) are written under keys that do not match their text.

## Scope
Narrow follow-up to the engine-model correction (d47fee0): only vanilla entries that still show in the game under an INEX group (R12). Every other flag stays as it is (see "Kept on judgment"). A full modernization of this file (its 18 `LOW_DEPTH` groups) is out of scope.

## User decisions
- 2026-10-17, before the audit: narrow scope (R12); default "keep unless wrong" for vanilla names in authored groups; no online research; one Haiku implementer per nation.
- 2026-10-17, checkpoint: proposal approved as reported, including writing over the regional entries in `ENG_MOT_01`, `ENG_MEC_01` and `ENG_MNT_01`.

## Research
None (user: no online research). Every replacement is the group's fallback in the file's ordinal form (`%dth Garrison Division`, suffix matched to the key), so no name is new.

## Rationale
The 2026-10-01 audit purged vanilla's lists in these groups: placeholder stubs, the anachronistic "Tanzanian Colonials", the Parachute Regiment stubs, the "placeholder Army Tank Brigades", and the regional infantry entries in the motorised, mechanised and mountain lists. Its per-group table lists each removal. Under the merge rule all of them still show. The batch writes the group's own designation in ordinal form over each one. This follows the file's style: authored entries put the ordinal in the name (`%dst (Highland) Motorised Division`).

| Group | Keys | What still showed | Written text | Where INEX keeps it |
|:---|---:|:---|:---|:---|
| `ENG_INF_01` | 5 (11, 81, 82, 801, 812) | `(East Africa)`/`(West Africa)` infantry divisions, `Guards Infantry Division`, literal `12th (West Africa) ...` at 812 | `%d<ord> Infantry Division` | `ENG_COL_01` 11, 12, 81, 82; `ENG_INF_01` 31 |
| `ENG_MOT_01` | 8 (9, 12, 15, 23, 38, 57, 58, 801) | second-line TA and deception divisions as `(Region) Infantry Division`, `Guards Infantry Division` | `%d<ord> Infantry Division` (the group's fallback) | `ENG_INF_01` |
| `ENG_MEC_01` | 8 (the same keys) | the same as MOT_01 | `%d<ord> Infantry Division` (the group's fallback) | `ENG_INF_01` |
| `ENG_ARM_02` | 11 (5, 10-19) | `%dth Army Tank Brigade` placeholders | `%d<ord> Armoured Brigade` | real Army Tank Brigades at 1, 3, 21, 25, 31, 32, 34 |
| `ENG_PAR_02` | 23 (8-30) | `%dth Parachute Regiment` (a single regiment, not a numbered series) | `%d<ord> Parachute Brigade` | - |
| `ENG_MNT_01` | 13 | first- and second-line TA divisions as `(Region) Infantry Division`, the invented `(Highland)`/`(Lowland) Infantry Mountain Div.` at 64-65, `Guards Infantry Division` | `%d<ord> Infantry Division` (the group's fallback) | `ENG_INF_01`; `ENG_MNT_01` 51, 52 |
| `ENG_GAR_01` | 51 (100-150) | `%dth Infantry Division` in the garrison list | `%d<ord> Garrison Division` | - |
| `ENG_COL_01` | 41 | `(Africa) Division` stubs 84-89; invented `Sudanese`, `Ugandan`, `Kenyan`, `Tanzanian Colonials` (501-564, 3rd twice); KAR 1st-15th as literals under 581-595; `12th (West Africa) Division` at 812 | `%d<ord> (Colonial) Division` | KAR 1-7, Tanganyika Rifles 83, Sudan Defence Force 101, the East and West Africa divisions |

Kept (vanilla ordinal stubs of the group's own designation, suffix checked, 522 keys in 17 groups, e.g. `ENG_INF_01` 70, `ENG_MOT_01` 61, `ENG_AIR_01` 38, `ENG_MAR_01` 29): they read as the file's own style and fill numbers INEX leaves to the fallback. The 2026-10-01 purge of these stubs was cosmetic: under that model the bare fallback (`100 Infantry Division`) would have shown, which reads worse.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are section banners that stay true, so they are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's designation in ordinal form. The file's authored names are unchanged; see the 2026-10-01 plan.

## Author confirmation
None.

## Kept on judgment
Expected `-Check ENG` flags after the batch (31, compared with 27 before):
- `PLACEHOLDER_ENTRIES` on `ENG_INF_01`, `ENG_MNT_01`, `ENG_GAR_01`, `ENG_COL_01` (new): these write their designation over vanilla's purged keys, which is the purpose of the batch.
- `PLACEHOLDER_ENTRIES` on `ENG_INF_03`, `ENG_MOT_02`, `ENG_ARM_02`, `ENG_ARM_03`, `ENG_PAR_02`, `ENG_MAR_01`, `ENG_DEM_01`, `ENG_FAS_02`, `ENG_COM_02` (9, as before): numbered entries in brigade and volunteer suites (2026-10-01).
- `LOW_DEPTH` on 18 groups (as before): small historical arms (2026-10-01). Out of scope here.
- `Vanilla: leaves out N numbered key(s) past a gap` lines remain for the kept ordinal stubs. No `leaves out N vanilla name(s)` line remains.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (160). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames ENG -Batch docs/superpowers/plans/2026-10-17-united-kingdom-audit.md`. Expect 8 green lines, each `-0 ~0`: INF_01 +5, MOT_01 +8, MEC_01 +8, ARM_02 +11, PAR_02 +23, MNT_01 +13, GAR_01 +51, COL_01 +41. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki ENG`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check ENG`. Expect `Check passed`, with the remaining flags matching "Kept on judgment" (31 flags). Then run `powershell -File .\build.ps1 -Audit ENG | Select-String 'vanilla name'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 5. Ship, on the user's word: commit with the message `Write ENG designations over vanilla's merged entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write ENG designations over vanilla's merged entries"`.

## Docs payload
No docs change beyond -SyncWiki. No wiki or Workshop prose mentions the purged vanilla entries.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research): every added entry is its group's `fallback_name` with the ordinal for its key (st/nd/rd/th, with th for 11-13), generated by script. The keys come from vanilla 1.19 `ENG_names_divisions.txt`: every key the INEX group does not write whose text is not already a correct ordinal stub of the group's designation. A preview on a scratch copy showed no `leaves out N vanilla name(s)` line and the 31 flags under "Kept on judgment".

## Outcome
- Date: 2026-10-17
- `-Check ENG`: `AUDIT SUMMARY ENG: GROUPS=28 AUTHORED=271/561 FLAGS=31`; Flags: LOW_DEPTH x18, PLACEHOLDER_ENTRIES x13; Validate OK; Tests 434 passed, 0 failed; `Check passed`. Diff vs HEAD: 8 groups changed, +121 -0 names.
- Batch: 8 groups written as planned (INF_01 +5, MOT_01 +8, MEC_01 +8, ARM_02 +11, PAR_02 +23, MNT_01 +13, GAR_01 +51, COL_01 +41), no `[ERROR]`.
- `-Audit ENG | Select-String 'vanilla name'`: no output.
- Deviations from this plan: none.

## Edit batch
Applied by `build.ps1 -EditNames ENG -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "11=%dth Infantry Division", "81=%dst Infantry Division", "82=%dnd Infantry Division", "801=%dst Infantry Division", "812=%dth Infantry Division"
  ] }
```

```json batch
{ "group": "MOT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "9=%dth Infantry Division", "12=%dth Infantry Division", "15=%dth Infantry Division", "23=%drd Infantry Division", "38=%dth Infantry Division", "57=%dth Infantry Division", "58=%dth Infantry Division", "801=%dst Infantry Division"
  ] }
```

```json batch
{ "group": "MEC_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "9=%dth Infantry Division", "12=%dth Infantry Division", "15=%dth Infantry Division", "23=%drd Infantry Division", "38=%dth Infantry Division", "57=%dth Infantry Division", "58=%dth Infantry Division", "801=%dst Infantry Division"
  ] }
```

```json batch
{ "group": "ARM_02", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "5=%dth Armoured Brigade", "10=%dth Armoured Brigade", "11=%dth Armoured Brigade", "12=%dth Armoured Brigade", "13=%dth Armoured Brigade", "14=%dth Armoured Brigade", "15=%dth Armoured Brigade", "16=%dth Armoured Brigade",
    "17=%dth Armoured Brigade", "18=%dth Armoured Brigade", "19=%dth Armoured Brigade"
  ] }
```

```json batch
{ "group": "PAR_02", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "8=%dth Parachute Brigade", "9=%dth Parachute Brigade", "10=%dth Parachute Brigade", "11=%dth Parachute Brigade", "12=%dth Parachute Brigade", "13=%dth Parachute Brigade", "14=%dth Parachute Brigade", "15=%dth Parachute Brigade",
    "16=%dth Parachute Brigade", "17=%dth Parachute Brigade", "18=%dth Parachute Brigade", "19=%dth Parachute Brigade", "20=%dth Parachute Brigade", "21=%dst Parachute Brigade", "22=%dnd Parachute Brigade", "23=%drd Parachute Brigade",
    "24=%dth Parachute Brigade", "25=%dth Parachute Brigade", "26=%dth Parachute Brigade", "27=%dth Parachute Brigade", "28=%dth Parachute Brigade", "29=%dth Parachute Brigade", "30=%dth Parachute Brigade"
  ] }
```

```json batch
{ "group": "MNT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "12=%dth Infantry Division", "38=%dth Infantry Division", "42=%dnd Infantry Division", "43=%drd Infantry Division", "44=%dth Infantry Division", "46=%dth Infantry Division", "48=%dth Infantry Division", "49=%dth Infantry Division",
    "53=%drd Infantry Division", "54=%dth Infantry Division", "64=%dth Infantry Division", "65=%dth Infantry Division", "801=%dst Infantry Division"
  ] }
```

```json batch
{ "group": "GAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "100=%dth Garrison Division", "101=%dst Garrison Division", "102=%dnd Garrison Division", "103=%drd Garrison Division", "104=%dth Garrison Division", "105=%dth Garrison Division", "106=%dth Garrison Division", "107=%dth Garrison Division",
    "108=%dth Garrison Division", "109=%dth Garrison Division", "110=%dth Garrison Division", "111=%dth Garrison Division", "112=%dth Garrison Division", "113=%dth Garrison Division", "114=%dth Garrison Division", "115=%dth Garrison Division",
    "116=%dth Garrison Division", "117=%dth Garrison Division", "118=%dth Garrison Division", "119=%dth Garrison Division", "120=%dth Garrison Division", "121=%dst Garrison Division", "122=%dnd Garrison Division", "123=%drd Garrison Division",
    "124=%dth Garrison Division", "125=%dth Garrison Division", "126=%dth Garrison Division", "127=%dth Garrison Division", "128=%dth Garrison Division", "129=%dth Garrison Division", "130=%dth Garrison Division", "131=%dst Garrison Division",
    "132=%dnd Garrison Division", "133=%drd Garrison Division", "134=%dth Garrison Division", "135=%dth Garrison Division", "136=%dth Garrison Division", "137=%dth Garrison Division", "138=%dth Garrison Division", "139=%dth Garrison Division",
    "140=%dth Garrison Division", "141=%dst Garrison Division", "142=%dnd Garrison Division", "143=%drd Garrison Division", "144=%dth Garrison Division", "145=%dth Garrison Division", "146=%dth Garrison Division", "147=%dth Garrison Division",
    "148=%dth Garrison Division", "149=%dth Garrison Division", "150=%dth Garrison Division"
  ] }
```

```json batch
{ "group": "COL_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "84=%dth (Colonial) Division", "85=%dth (Colonial) Division", "86=%dth (Colonial) Division", "87=%dth (Colonial) Division", "88=%dth (Colonial) Division", "89=%dth (Colonial) Division", "501=%dst (Colonial) Division", "502=%dnd (Colonial) Division",
    "503=%drd (Colonial) Division", "504=%dth (Colonial) Division", "505=%dth (Colonial) Division", "506=%dth (Colonial) Division", "521=%dst (Colonial) Division", "522=%dnd (Colonial) Division", "523=%drd (Colonial) Division", "524=%dth (Colonial) Division",
    "541=%dst (Colonial) Division", "542=%dnd (Colonial) Division", "543=%drd (Colonial) Division", "544=%dth (Colonial) Division", "545=%dth (Colonial) Division", "561=%dst (Colonial) Division", "562=%dnd (Colonial) Division", "563=%drd (Colonial) Division",
    "564=%dth (Colonial) Division", "581=%dst (Colonial) Division", "582=%dnd (Colonial) Division", "583=%drd (Colonial) Division", "584=%dth (Colonial) Division", "585=%dth (Colonial) Division", "586=%dth (Colonial) Division", "587=%dth (Colonial) Division",
    "588=%dth (Colonial) Division", "589=%dth (Colonial) Division", "590=%dth (Colonial) Division", "591=%dst (Colonial) Division", "592=%dnd (Colonial) Division", "593=%drd (Colonial) Division", "594=%dth (Colonial) Division", "595=%dth (Colonial) Division",
    "812=%dth (Colonial) Division"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 42 -> 47 | - | - | - |
| MOT_01 | 21 -> 29 | %dth Infantry Division (x6), %drd Infantry Division, %dst Infantry Division | - | - |
| MEC_01 | 21 -> 29 | %dth Infantry Division (x6), %drd Infantry Division, %dst Infantry Division | - | - |
| ARM_02 | 23 -> 34 | - | - | - |
| PAR_02 | 7 -> 30 | - | - | - |
| MNT_01 | 9 -> 22 | %dth Infantry Division (x9), %dnd Infantry Division, %drd Infantry Division (x2), %dst Infantry Division | - | - |
| GAR_01 | 19 -> 70 | %dth Garrison Division (x39), %dst Garrison Division (x4), %dnd Garrison Division (x4), %drd Garrison Division (x4) | - | - |
| COL_01 | 30 -> 71 | %dth (Colonial) Division (x23), %dst (Colonial) Division (x6), %dnd (Colonial) Division (x6), %drd (Colonial) Division (x6) | - | - |

Unchanged: INF_02, INF_03, CAV_01, CAV_02, MOT_02, ARM_01, ARM_03, PAR_01, MAR_01, MNT_02, AIR_01, DEM_01, FAS_01, HOMEGUARD_01, ROYAL_GUARD_01, INDEPENDENT_BRIGADES_01, SSB_01, FAS_02, COM_01, COM_02
<!-- END CHANGE TABLE -->
