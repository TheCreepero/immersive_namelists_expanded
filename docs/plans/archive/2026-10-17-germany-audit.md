# Germany (GER) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_GER_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GER`)
- AUDIT SUMMARY GER: GROUPS=22 AUTHORED=768/1260 FLAGS=7
- [GER_GAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_MEC_01_MONARNCHIST] flags: UNLINKED_MOBILE
- [GER_MONINF_01] flags: NAME_LONG
- [GER_MONMOB_01] flags: NAME_LONG
- [GER_MEC_01_COMMUNIST] flags: UNLINKED_MOBILE
- File-level `IDENTITY_REPEAT` (1) is also printed by `-Audit GER`.
- Vanilla leftovers (`Vanilla: leaves out` lines, plus a planner comparison of every vanilla key): 11 INEX groups on vanilla tags leave 178 vanilla entries in the game, because vanilla GER groups merge into INEX's ([NAM-020]). Every one of them is an entry that the 2026-09-30 overhaul moved to another group or dropped. The 2026-10-09 audit took those removals as working, after an in-game test that was later disproved (2026-10-15).
- Found on manual review: the leftovers put fascist-only honour titles (Großdeutschland, Feldherrnhalle, Hermann Göring, Führer-Begleit/-Grenadier) into ungated lists and into the monarchist Guard list, and the SS name 'Germania' into the democratic Republican list. They also show `157. Reserve-Division` under garrison key 8, i.e. with the wrong number.

## Scope
Narrow follow-up to the engine-model correction (d47fee0): only vanilla entries that still show in the game under an INEX group (R12, R10). Every other flag stays as it is (see "Kept on judgment"). Covers `zz_INEX_GER_names_divisions.txt` only: `GER_SS` and `GER_ADDITIONAL` leave nothing out.

## User decisions
- 2026-10-17, before the audit: narrow scope (R12, R10); default "keep unless wrong" for vanilla names in authored groups; no online research; one Haiku implementer per nation.
- 2026-10-17, checkpoint: proposal approved as reported.

## Research
None (user: no online research). Every replacement is the group's own fallback text, so no name is new.

## Rationale
The 2026-09-30 overhaul moved these vanilla entries out on purpose: honour titles to the fascist-only `GER_ELI_01`; Volksgrenadier, Grenadier, Reserve, Festung and Luftwaffe field divisions to their own lists in the ADDITIONAL file; Marine-Infanterie divisions to `GER_MAR_01`; Garde and Leib entries to the Guard list; 'Kavallerie-Division Nord' was dropped as unverified. Under the merge rule all of them still show in their old groups. The batch writes the group's own fallback over each one:

| Group | Keys | What still showed | Where INEX keeps it |
|:---|---:|:---|:---|
| `GER_Inf_01` (plain) | 54 | Leichte Infanterie 97-101, Grenadier 153/541-563, named 303-324 and 900-907 (Döberitz, Schill, Schlageter ...), Luftwaffen-Feld-Division 1-21 (909-929), Lw-Ausbildungs 930, Marine-Infanterie 947-949 | `GER_LTINF_01` (97, 100, 101 as Jäger-Divisionen, their 1942 designation), ADDITIONAL series, `GER_ELI_01`, `GER_MAR_01` |
| `GER_ALTINF_01` | 55 | `%d. Volks-Grenadier-Division` | `GER_VOLKSGRENADIER_01` (ADDITIONAL) |
| `GER_MOT_02` | 1 (932) | Infanterie-Division (mot.) Großdeutschland | `GER_ELI_01` (fascist) |
| `GER_MEC_01` (plain) | 6 | Feldherrnhalle, Brandenburg, HG 2, Kurmark, Führer-Grenadier, Führer-Begleit | `GER_MEC_02`, `GER_ELI_01` |
| `GER_Arm_01` (plain) | 7 | FHH 1/2, Holstein, Müncheberg, Panzer-Lehr, Clausewitz, HG | `GER_Arm_02`, `GER_ELI_01` |
| `GER_Cav_01` | 1 (900) | Kavallerie-Division 'Nord' | dropped (unverified, 2026-09-30) |
| `GER_GAR_01` | 28 | literal `157. Reserve-Division` etc. under other keys, `%d. Reserve-Division`, `%d. Festungs-Division`, Festungs-Division Danzig/Frankfurt/Gotenhafen/Stettin/Swinemünde | `GER_RESERVE_DIVISION_01`, `GER_FORT_01` (ADDITIONAL) |
| `GER_MEC_01_MONARNCHIST` | 7 | `%d. Panzer-Grenadier-Division`, Feldherrnhalle (60) | not a guard name |
| `GER_MONINF_01` | 9 | Leib and Garde divisions 100-119, 901-904 | Guard list (`GER_MEC_01_MONARNCHIST` 901-936) |
| `GER_Arm_01_ANTIFASCIST` | 5 | `%d. Panzer-Division`, Panzer-Lehr, Clausewitz, Fallschirm-Pz-Div. 'Germania' (SS name) | 'Clausewitz' at 26 in INEX form |
| `GER_MEC_01_COMMUNIST` | 5 | Panzer-Grenadier-Division Die Rote Fahne, Walter Ulbricht, Spartakus, Ernst Thälmann, `%d. Panzer-Grenadier-Division` | all four at 1, 4, 5, 29 in INEX form (`%d. Rote Division '...'`) |

- The write-overs sit in a section `# Vanilla keys written again with the fallback (vanilla group merges in)`, and each group's comment is rewritten to say so (the "Overrides vanilla ..." wording described the disproved model). Comments in this file sit directly above their groups, so `comment` replaces them.
- Keys INEX already writes (e.g. the 254 historical numbers of `GER_Inf_01`) are untouched.

## Verified formations & commanders
No name is added: every added entry is its group's existing fallback pattern. The file's authored names are unchanged; see the 2026-09-30 and 2026-10-09 plans.

## Author confirmation
None.

## Kept on judgment
Expected `-Check GER` flags after the batch (8, compared with 7 before):
- `PLACEHOLDER_ENTRIES` on `GER_ALTINF_01` (new): its 55 Volksgrenadier keys get the fallback, which is the purpose of the batch.
- `PLACEHOLDER_ENTRIES`, `LOW_DEPTH` on `GER_GAR_01`: a numbered list of historical security-division numbers (2026-10-09).
- `UNLINKED_MOBILE` on `GER_MEC_01_MONARNCHIST` and `GER_MEC_01_COMMUNIST`: the lint reads `_MEC_` in the tag; both are independent ideology series (2026-10-09).
- `NAME_LONG` on `GER_MONINF_01` and `GER_MONMOB_01`: historical honour titles (2026-10-09).
- `IDENTITY_REPEAT` (file level): 'König' and 'Prinz Karl von Bayern' name different regiments with the same patron (2026-10-09).
- No `Vanilla: leaves out` line remains.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (178). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GER -Batch docs/superpowers/plans/2026-10-17-germany-audit.md`. Expect 11 green lines, each `-0 ~0 [Comment]`: Inf_01 +54, ALTINF_01 +55, MOT_02 +1, MEC_01 +6, Arm_01 +7, Cav_01 +1, GAR_01 +28, MEC_01_MONARNCHIST +7, MONINF_01 +9, Arm_01_ANTIFASCIST +5, MEC_01_COMMUNIST +5. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki GER`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check GER`. Expect `Check passed`, with the remaining flags matching "Kept on judgment" (8 flags). Then run `powershell -File .\build.ps1 -Audit GER | Select-String 'Vanilla:  leaves'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged GER entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged GER entries"`.

## Docs payload
No docs change beyond -SyncWiki. No wiki or Workshop prose claims that these vanilla names were dropped.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research): every added entry is its group's `fallback_name`, copied by script from the file. The keys come from vanilla 1.19 `GER_names_divisions.txt`: every key the INEX group does not already write. A preview on a scratch copy showed no `Vanilla: leaves out` line and the 8 flags under "Kept on judgment".

## Outcome
Date: 2026-10-17. Batch applied: 11 groups, +82 entries (Inf_01 +54, ALTINF_01 +55, MOT_02 +1, MEC_01 +6, Arm_01 +7, Cav_01 +1, GAR_01 +28, MEC_01_MONARNCHIST +7, MONINF_01 +9, Arm_01_ANTIFASCIST +5, MEC_01_COMMUNIST +5), no errors. `-SyncWiki GER`: Germany.md 0 rows updated, Home.md GER count 22 (unchanged).
`-Check GER`: Validate OK; Tests 434 Passed, 0 Failed, 0 Skipped; AUDIT SUMMARY GER: GROUPS=22 AUTHORED=768/1438 FLAGS=8 (UNLINKED_MOBILE x2, PLACEHOLDER_ENTRIES x2, NAME_LONG x2, IDENTITY_REPEAT x1, LOW_DEPTH x1), all listed under "Kept on judgment"; Diff vs HEAD: 11 group(s) changed, +82 -0; Check passed. `-Audit GER` with `Vanilla:  leaves` filter: no output.
Deviations from this plan: none.

## Edit batch
Applied by `build.ps1 -EditNames GER -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "Inf_01", "comment": "Plain variant (un-nicknamed) on vanilla GER_Inf_01 (referenced by vanilla focuses), which merges in: its other\\nkeys are written again with the fallback. Numbering anchor for every Heer infantry-type list.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "97=%d. Infanterie-Division", "99=%d. Infanterie-Division", "100=%d. Infanterie-Division", "101=%d. Infanterie-Division", "153=%d. Infanterie-Division", "303=%d. Infanterie-Division", "309=%d. Infanterie-Division", "324=%d. Infanterie-Division",
    "541=%d. Infanterie-Division", "544=%d. Infanterie-Division", "545=%d. Infanterie-Division", "547=%d. Infanterie-Division", "548=%d. Infanterie-Division", "549=%d. Infanterie-Division", "551=%d. Infanterie-Division", "553=%d. Infanterie-Division",
    "558=%d. Infanterie-Division", "559=%d. Infanterie-Division", "561=%d. Infanterie-Division", "562=%d. Infanterie-Division", "563=%d. Infanterie-Division", "900=%d. Infanterie-Division", "901=%d. Infanterie-Division", "902=%d. Infanterie-Division",
    "903=%d. Infanterie-Division", "904=%d. Infanterie-Division", "905=%d. Infanterie-Division", "906=%d. Infanterie-Division", "907=%d. Infanterie-Division", "909=%d. Infanterie-Division", "910=%d. Infanterie-Division", "911=%d. Infanterie-Division",
    "912=%d. Infanterie-Division", "913=%d. Infanterie-Division", "914=%d. Infanterie-Division", "915=%d. Infanterie-Division", "916=%d. Infanterie-Division", "917=%d. Infanterie-Division", "918=%d. Infanterie-Division", "919=%d. Infanterie-Division",
    "920=%d. Infanterie-Division", "921=%d. Infanterie-Division", "922=%d. Infanterie-Division", "923=%d. Infanterie-Division", "924=%d. Infanterie-Division", "925=%d. Infanterie-Division", "926=%d. Infanterie-Division", "927=%d. Infanterie-Division",
    "928=%d. Infanterie-Division", "929=%d. Infanterie-Division", "930=%d. Infanterie-Division", "947=%d. Infanterie-Division", "948=%d. Infanterie-Division", "949=%d. Infanterie-Division"
  ] }
```

```json batch
{ "group": "ALTINF_01", "comment": "Air-landing, assault, naval and named divisions. Vanilla GER_ALTINF_01 merges in; its Volksgrenadier keys are\\nwritten again with the fallback (Volksgrenadier divisions have their own list in the ADDITIONAL file).", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "6=%d. Infanterie-Division", "9=%d. Infanterie-Division", "12=%d. Infanterie-Division", "16=%d. Infanterie-Division", "18=%d. Infanterie-Division", "19=%d. Infanterie-Division", "26=%d. Infanterie-Division", "31=%d. Infanterie-Division",
    "36=%d. Infanterie-Division", "45=%d. Infanterie-Division", "46=%d. Infanterie-Division", "47=%d. Infanterie-Division", "61=%d. Infanterie-Division", "62=%d. Infanterie-Division", "79=%d. Infanterie-Division", "98=%d. Infanterie-Division",
    "167=%d. Infanterie-Division", "183=%d. Infanterie-Division", "211=%d. Infanterie-Division", "212=%d. Infanterie-Division", "246=%d. Infanterie-Division", "256=%d. Infanterie-Division", "257=%d. Infanterie-Division", "271=%d. Infanterie-Division",
    "272=%d. Infanterie-Division", "276=%d. Infanterie-Division", "277=%d. Infanterie-Division", "278=%d. Infanterie-Division", "320=%d. Infanterie-Division", "326=%d. Infanterie-Division", "334=%d. Infanterie-Division", "337=%d. Infanterie-Division",
    "340=%d. Infanterie-Division", "347=%d. Infanterie-Division", "349=%d. Infanterie-Division", "352=%d. Infanterie-Division", "361=%d. Infanterie-Division", "363=%d. Infanterie-Division", "462=%d. Infanterie-Division", "541=%d. Infanterie-Division",
    "542=%d. Infanterie-Division", "544=%d. Infanterie-Division", "545=%d. Infanterie-Division", "547=%d. Infanterie-Division", "548=%d. Infanterie-Division", "549=%d. Infanterie-Division", "551=%d. Infanterie-Division", "553=%d. Infanterie-Division",
    "558=%d. Infanterie-Division", "559=%d. Infanterie-Division", "560=%d. Infanterie-Division", "561=%d. Infanterie-Division", "562=%d. Infanterie-Division", "563=%d. Infanterie-Division", "708=%d. Infanterie-Division"
  ] }
```

```json batch
{ "group": "MOT_02", "comment": "Named variant on vanilla GER_MOT_02, which merges in; its Großdeutschland key is written again with the fallback\\n(the honour titles are fascist-only, in GER_ELI_01).", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "932=%d. Infanterie-Division (mot.)"
  ] }
```

```json batch
{ "group": "MEC_01", "comment": "Plain variant (un-nicknamed) on vanilla GER_MEC_01, which merges in: its honour-title keys are written again\\nwith the fallback (the titles are fascist-only, in GER_ELI_01).", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "60=%d. Panzergrenadier-Division", "931=%d. Panzergrenadier-Division", "933=%d. Panzergrenadier-Division", "934=%d. Panzergrenadier-Division", "935=%d. Panzergrenadier-Division", "936=%d. Panzergrenadier-Division"
  ] }
```

```json batch
{ "group": "Arm_01", "comment": "Plain variant (un-nicknamed) on vanilla GER_Arm_01, which merges in: its named keys are written again with the\\nfallback (named Panzer divisions are in GER_Arm_02, honour titles in GER_ELI_01). Numbering anchor for the Panzer lists.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "60=%d. Panzer-Division", "61=%d. Panzer-Division", "85=%d. Panzer-Division", "88=%d. Panzer-Division", "130=%d. Panzer-Division", "233=%d. Panzer-Division", "693=%d. Panzer-Division"
  ] }
```

```json batch
{ "group": "Cav_01", "comment": "On vanilla GER_Cav_01 (referenced by a vanilla focus), which merges in; its unverified 'Kavallerie-Division Nord'\\nkey is written again with the fallback.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "900=%d. Kavallerie-Division"
  ] }
```

```json batch
{ "group": "GAR_01", "comment": "Vanilla GER_GAR_01 merges in; its Reserve and Festung keys are written again with the fallback (Reserve and\\nFestung divisions live in their own lists in the ADDITIONAL file).", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "8=%d. Sicherungs-Division", "16=%d. Sicherungs-Division", "26=%d. Sicherungs-Division", "41=%d. Sicherungs-Division", "42=%d. Sicherungs-Division", "47=%d. Sicherungs-Division", "48=%d. Sicherungs-Division", "49=%d. Sicherungs-Division",
    "68=%d. Sicherungs-Division", "70=%d. Sicherungs-Division", "133=%d. Sicherungs-Division", "143=%d. Sicherungs-Division", "148=%d. Sicherungs-Division", "151=%d. Sicherungs-Division", "154=%d. Sicherungs-Division", "159=%d. Sicherungs-Division",
    "160=%d. Sicherungs-Division", "166=%d. Sicherungs-Division", "173=%d. Sicherungs-Division", "182=%d. Sicherungs-Division", "188=%d. Sicherungs-Division", "189=%d. Sicherungs-Division", "363=%d. Sicherungs-Division", "950=%d. Sicherungs-Division",
    "951=%d. Sicherungs-Division", "952=%d. Sicherungs-Division", "953=%d. Sicherungs-Division", "954=%d. Sicherungs-Division"
  ] }
```

```json batch
{ "group": "MEC_01_MONARNCHIST", "comment": "On vanilla GER_MEC_01_MONARNCHIST (a focus-locked duplicate of the Panzergrenadier list), gated by government only:\\nthe monarchist guard. Vanilla's entries merge in and are written again with the fallback.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "16=%d. Garde-Division", "18=%d. Garde-Division", "20=%d. Garde-Division", "25=%d. Garde-Division", "29=%d. Garde-Division", "60=%d. Garde-Division", "90=%d. Garde-Division"
  ] }
```

```json batch
{ "group": "MONINF_01", "comment": "On vanilla GER_MONINF_01, without its focus lock. Guard and Leib regiments moved to the Guard list; vanilla's\\nGuard and Leib keys, which merge in, are written again with the fallback.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "100=%d. Division", "109=%d. Division", "115=%d. Division", "117=%d. Division", "119=%d. Division", "901=%d. Division", "902=%d. Division", "903=%d. Division",
    "904=%d. Division"
  ] }
```

```json batch
{ "group": "Arm_01_ANTIFASCIST", "comment": "On vanilla GER_Arm_01_ANTIFASCIST (a duplicate Panzer list); now the republican army. Vanilla's Panzer keys,\\nwhich merge in, are written again with the fallback.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "116=%d. Reichswehr-Division", "130=%d. Reichswehr-Division", "232=%d. Reichswehr-Division", "233=%d. Reichswehr-Division", "693=%d. Reichswehr-Division"
  ] }
```

```json batch
{ "group": "MEC_01_COMMUNIST", "comment": "On vanilla GER_MEC_01_COMMUNIST (a duplicate Panzergrenadier list); now the communist army. Vanilla's keys,\\nwhich merge in, are written again with the fallback (their honour names are in the list in INEX form).", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "60=%d. Rote Division", "90=%d. Rote Division", "931=%d. Rote Division", "932=%d. Rote Division", "933=%d. Rote Division"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| Inf_01 | 254 -> 308 | - | - | - |
| ALTINF_01 | 23 -> 78 | %d. Infanterie-Division (x55) | - | - |
| MOT_02 | 42 -> 43 | %d. Infanterie-Division (mot.) | - | - |
| MEC_01 | 9 -> 15 | - | - | - |
| Arm_01 | 29 -> 36 | - | - | - |
| Cav_01 | 23 -> 24 | - | - | - |
| GAR_01 | 56 -> 84 | - | - | - |
| MEC_01_MONARNCHIST | 33 -> 40 | %d. Garde-Division (x7) | - | - |
| MONINF_01 | 200 -> 209 | %d. Division (x9) | - | - |
| Arm_01_ANTIFASCIST | 28 -> 33 | %d. Reichswehr-Division (x5) | - | - |
| MEC_01_COMMUNIST | 31 -> 36 | %d. Rote Division (x5) | - | - |

Unchanged: INF_02, LTINF_01, MOT_01, MEC_02, Arm_02, LTARM_01, Mnt_01, PAR_01, MAR_01, ELI_01, MONMOB_01
<!-- END CHANGE TABLE -->
