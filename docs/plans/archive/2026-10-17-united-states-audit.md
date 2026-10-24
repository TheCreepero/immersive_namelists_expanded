# United States (USA) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_USA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit USA`)
- AUDIT SUMMARY USA: GROUPS=36 AUTHORED=834/1017 FLAGS=1
- [USA_GAR_01] flags: UNGATED_POLITICAL
- Vanilla leftovers (`Vanilla: leaves out` lines, plus a planner comparison of every vanilla key): 9 INEX groups on vanilla tags leave 428 vanilla entries in the game, because vanilla USA groups merge into INEX's ([NAM-020]). 369 of them are names that the 2026-10-01 audit meant to drop. 59 are vanilla ordinal stubs in the file's own form.
- Found on manual review: every ordinal stub left in vanilla has the correct suffix for its key (0 mismatches).

## Scope
Narrow follow-up to the engine-model correction (d47fee0): only vanilla entries that still show in the game under an INEX group (R12). Every other flag stays as it is (see "Kept on judgment").

## User decisions
- 2026-10-17, before the audit: narrow scope (R12); default "keep unless wrong" for vanilla names in authored groups; no online research; one Haiku implementer per nation.
- 2026-10-17, checkpoint: proposal approved as reported, including replacing the `USA_MOT_01`/`USA_MEC_01` nicknames at 23-108 and all seven `USA_MNT_01` names.

## Research
None (user: no online research). Every replacement is the group's fallback in the file's ordinal form (`%dth Infantry Division`, suffix matched to the key), so no name is new.

## Rationale
The 2026-10-01 audit removed vanilla's HOI3 sports-team filler, corrupted entries (`'Billy  Johnny' DivisionÜ`) and the renamed mountain series. The 2026-10-15 audit recorded the resulting `Vanilla: leaves out` lines as "dropped on purpose", under the old model. With the merge rule all of them still show. The batch writes the group's own designation in ordinal form over each one. This follows the file's number style: the real number is the key, the ordinal is in the name, and the fallback uses the bare number as vanilla does (2026-10-15).

| Group | Keys written again | What still showed | Written text |
|:---|---:|:---|:---|
| `USA_INF_01` | 70 (158-369) | HOI3 filler nicknames: `'Green Clovers'`, `'Lakers'`, `'Fighting Irish'`, `'Billy  Johnny' DivisionÜ` ... | `%d<ord> Infantry Division` |
| `USA_GAR_01` | 204 (23, 39, 52, 61-370) | vanilla's copy of the infantry list in the National Guard group: infantry nicknames, `'Americal'`, `%dth Infantry Division` stubs and the same filler | `%d<ord> National Guard Division` |
| `USA_MOT_01` | 44 (23-108) | infantry nicknames without a branch word (`80th 'Blue Ridge' Division`) and `%dth Infantry Division` (44, 75, 79). INEX's motorized list writes `'<nickname>' Motorized Div.` for its 30 lineages | `%d<ord> Motorized Division` |
| `USA_MEC_01` | 44 (23-108) | the same as MOT_01 | `%d<ord> Mechanized Division` |
| `USA_MNT_01` | 7 (48, 49, 52, 54, 56, 58, 204) | vanilla's mountain series in a form without "Mountain" (`'Stone Mountain'`, `'Granite'`, `'Catskills'`, `'Wasatch Mountains'`, `'Yellowstone'`, `'Yosemite'`; two repeat INEX's `'Catskill'` 23 and `'Wasatch'` 14) and the filler `'Mountain Lions'` | `%d<ord> Mountain Division` |

Kept (correct ordinal stubs in the file's own form; vanilla's historical gaps): `USA_INF_01` 163, 176, 182, 184, 237, 246; `USA_CAV_01` 25-30; `USA_ARM_01` 15; `USA_PAR_01` 15, 274-278; `USA_MAR_01` 26-49; `USA_MNT_01` 50, 51, 53, 55, 57, 59, 279-288.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched: in this file a blank line separates them from their groups, so `comment` would add a second block (tooling backlog, Editing).

## Verified formations & commanders
No name is added: every added entry is its group's designation in ordinal form. The file's authored names are unchanged; see the 2026-10-01 and 2026-10-15 plans.

## Author confirmation
None.

## Kept on judgment
Expected `-Check USA` flags after the batch (5, compared with 1 before):
- `PLACEHOLDER_ENTRIES` on `USA_INF_01`, `USA_GAR_01`, `USA_MOT_01`, `USA_MEC_01` (new): these write their designation over vanilla's filler keys, which is the purpose of the batch.
- `UNGATED_POLITICAL` on `USA_GAR_01`: kept (2026-10-01). The National Guard serves every non-revolutionary government.
- `Vanilla: leaves out N numbered key(s) past a gap` on `USA_INF_01` (6), `USA_CAV_01` (6), `USA_PAR_01` (6), `USA_MNT_01` (16): the kept ordinal stubs listed under Rationale. No `leaves out N vanilla name(s)` line remains.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (369). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames USA -Batch docs/superpowers/plans/2026-10-17-united-states-audit.md`. Expect 5 green lines (`Edited USA_INF_01: +70`, `USA_GAR_01: +204`, `USA_MOT_01: +44`, `USA_MEC_01: +44`, `USA_MNT_01: +7`, each `-0 ~0`) and no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki USA`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check USA`. Expect `Check passed`, with the remaining flags matching "Kept on judgment" (5 flags). Then run `powershell -File .\build.ps1 -Audit USA | Select-String 'vanilla name'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 5. Ship, on the user's word: commit with the message `Write USA designations over vanilla's merged filler entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write USA designations over vanilla's merged filler entries"`.

## Docs payload
No docs change beyond -SyncWiki. No wiki or Workshop prose mentions the dropped filler.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research): every added entry is its group's `fallback_name` with the ordinal for its key (st/nd/rd/th, with th for 11-13), generated by script. The keys come from vanilla 1.19 `USA_names_divisions.txt`: every key the INEX group does not write whose text is not already a correct ordinal stub of the group's designation. A preview on a scratch copy showed no `leaves out N vanilla name(s)` line and the 5 flags under "Kept on judgment".

## Outcome
- Date: 2026-10-17.
- `-Check USA`: Validate OK; Tests 434 passed, 0 failed, 0 skipped; `AUDIT SUMMARY USA: GROUPS=36 AUTHORED=835/1386 FLAGS=5` (before: `AUTHORED=834/1017 FLAGS=1`); Flags: `PLACEHOLDER_ENTRIES` x4, `UNGATED_POLITICAL` x1, all listed under "Kept on judgment"; `Diff vs HEAD: 5 group(s) changed, +299 -0 name(s)`; `Check passed`.
- Batch: `USA_INF_01 +70`, `USA_GAR_01 +204`, `USA_MOT_01 +44`, `USA_MEC_01 +44`, `USA_MNT_01 +7`, each `-0 ~0`.
- `-Audit USA | Select-String 'vanilla name'`: no output.
- Deviations: none.

## Edit batch
Applied by `build.ps1 -EditNames USA -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "158=%dth Infantry Division", "159=%dth Infantry Division", "161=%dst Infantry Division", "162=%dnd Infantry Division", "172=%dnd Infantry Division", "173=%drd Infantry Division", "174=%dth Infantry Division", "177=%dth Infantry Division",
    "178=%dth Infantry Division", "179=%dth Infantry Division", "181=%dst Infantry Division", "183=%drd Infantry Division", "185=%dth Infantry Division", "186=%dth Infantry Division", "192=%dnd Infantry Division", "193=%drd Infantry Division",
    "194=%dth Infantry Division", "203=%drd Infantry Division", "204=%dth Infantry Division", "222=%dnd Infantry Division", "223=%drd Infantry Division", "225=%dth Infantry Division", "228=%dth Infantry Division", "231=%dst Infantry Division",
    "232=%dnd Infantry Division", "235=%dth Infantry Division", "236=%dth Infantry Division", "245=%dth Infantry Division", "247=%dth Infantry Division", "251=%dst Infantry Division", "252=%dnd Infantry Division", "253=%drd Infantry Division",
    "254=%dth Infantry Division", "256=%dth Infantry Division", "257=%dth Infantry Division", "258=%dth Infantry Division", "263=%drd Infantry Division", "265=%dth Infantry Division", "266=%dth Infantry Division", "267=%dth Infantry Division",
    "269=%dth Infantry Division", "322=%dnd Infantry Division", "324=%dth Infantry Division", "326=%dth Infantry Division", "330=%dth Infantry Division", "332=%dnd Infantry Division", "333=%drd Infantry Division", "334=%dth Infantry Division",
    "335=%dth Infantry Division", "337=%dth Infantry Division", "339=%dth Infantry Division", "340=%dth Infantry Division", "345=%dth Infantry Division", "346=%dth Infantry Division", "348=%dth Infantry Division", "349=%dth Infantry Division",
    "350=%dth Infantry Division", "352=%dnd Infantry Division", "353=%drd Infantry Division", "354=%dth Infantry Division", "356=%dth Infantry Division", "357=%dth Infantry Division", "358=%dth Infantry Division", "359=%dth Infantry Division",
    "361=%dst Infantry Division", "364=%dth Infantry Division", "365=%dth Infantry Division", "366=%dth Infantry Division", "368=%dth Infantry Division", "369=%dth Infantry Division"
  ] }
```

```json batch
{ "group": "GAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "23=%drd National Guard Division", "39=%dth National Guard Division", "52=%dnd National Guard Division", "61=%dst National Guard Division", "62=%dnd National Guard Division", "63=%drd National Guard Division", "65=%dth National Guard Division", "66=%dth National Guard Division",
    "67=%dth National Guard Division", "68=%dth National Guard Division", "69=%dth National Guard Division", "70=%dth National Guard Division", "71=%dst National Guard Division", "72=%dnd National Guard Division", "73=%drd National Guard Division", "74=%dth National Guard Division",
    "75=%dth National Guard Division", "76=%dth National Guard Division", "77=%dth National Guard Division", "78=%dth National Guard Division", "79=%dth National Guard Division", "80=%dth National Guard Division", "81=%dst National Guard Division", "83=%drd National Guard Division",
    "84=%dth National Guard Division", "85=%dth National Guard Division", "86=%dth National Guard Division", "87=%dth National Guard Division", "88=%dth National Guard Division", "89=%dth National Guard Division", "90=%dth National Guard Division", "91=%dst National Guard Division",
    "92=%dnd National Guard Division", "93=%drd National Guard Division", "94=%dth National Guard Division", "95=%dth National Guard Division", "96=%dth National Guard Division", "97=%dth National Guard Division", "98=%dth National Guard Division", "99=%dth National Guard Division",
    "100=%dth National Guard Division", "102=%dnd National Guard Division", "103=%drd National Guard Division", "104=%dth National Guard Division", "105=%dth National Guard Division", "106=%dth National Guard Division", "107=%dth National Guard Division", "108=%dth National Guard Division",
    "110=%dth National Guard Division", "115=%dth National Guard Division", "116=%dth National Guard Division", "119=%dth National Guard Division", "125=%dth National Guard Division", "128=%dth National Guard Division", "130=%dth National Guard Division", "131=%dst National Guard Division",
    "157=%dth National Guard Division", "158=%dth National Guard Division", "159=%dth National Guard Division", "160=%dth National Guard Division", "161=%dst National Guard Division", "162=%dnd National Guard Division", "163=%drd National Guard Division", "164=%dth National Guard Division",
    "165=%dth National Guard Division", "166=%dth National Guard Division", "167=%dth National Guard Division", "168=%dth National Guard Division", "169=%dth National Guard Division", "170=%dth National Guard Division", "171=%dst National Guard Division", "172=%dnd National Guard Division",
    "173=%drd National Guard Division", "174=%dth National Guard Division", "175=%dth National Guard Division", "176=%dth National Guard Division", "177=%dth National Guard Division", "178=%dth National Guard Division", "179=%dth National Guard Division", "180=%dth National Guard Division",
    "181=%dst National Guard Division", "182=%dnd National Guard Division", "183=%drd National Guard Division", "184=%dth National Guard Division", "185=%dth National Guard Division", "186=%dth National Guard Division", "187=%dth National Guard Division", "188=%dth National Guard Division",
    "189=%dth National Guard Division", "190=%dth National Guard Division", "191=%dst National Guard Division", "192=%dnd National Guard Division", "193=%drd National Guard Division", "194=%dth National Guard Division", "195=%dth National Guard Division", "196=%dth National Guard Division",
    "197=%dth National Guard Division", "198=%dth National Guard Division", "199=%dth National Guard Division", "200=%dth National Guard Division", "201=%dst National Guard Division", "203=%drd National Guard Division", "204=%dth National Guard Division", "205=%dth National Guard Division",
    "219=%dth National Guard Division", "220=%dth National Guard Division", "221=%dst National Guard Division", "222=%dnd National Guard Division", "223=%drd National Guard Division", "224=%dth National Guard Division", "225=%dth National Guard Division", "226=%dth National Guard Division",
    "227=%dth National Guard Division", "228=%dth National Guard Division", "229=%dth National Guard Division", "230=%dth National Guard Division", "231=%dst National Guard Division", "232=%dnd National Guard Division", "233=%drd National Guard Division", "234=%dth National Guard Division",
    "235=%dth National Guard Division", "236=%dth National Guard Division", "237=%dth National Guard Division", "238=%dth National Guard Division", "239=%dth National Guard Division", "240=%dth National Guard Division", "241=%dst National Guard Division", "244=%dth National Guard Division",
    "245=%dth National Guard Division", "246=%dth National Guard Division", "247=%dth National Guard Division", "248=%dth National Guard Division", "249=%dth National Guard Division", "250=%dth National Guard Division", "251=%dst National Guard Division", "252=%dnd National Guard Division",
    "253=%drd National Guard Division", "254=%dth National Guard Division", "255=%dth National Guard Division", "256=%dth National Guard Division", "257=%dth National Guard Division", "258=%dth National Guard Division", "259=%dth National Guard Division", "260=%dth National Guard Division",
    "261=%dst National Guard Division", "262=%dnd National Guard Division", "263=%drd National Guard Division", "264=%dth National Guard Division", "265=%dth National Guard Division", "266=%dth National Guard Division", "267=%dth National Guard Division", "268=%dth National Guard Division",
    "269=%dth National Guard Division", "270=%dth National Guard Division", "319=%dth National Guard Division", "320=%dth National Guard Division", "321=%dst National Guard Division", "322=%dnd National Guard Division", "323=%drd National Guard Division", "324=%dth National Guard Division",
    "325=%dth National Guard Division", "326=%dth National Guard Division", "327=%dth National Guard Division", "328=%dth National Guard Division", "329=%dth National Guard Division", "330=%dth National Guard Division", "331=%dst National Guard Division", "332=%dnd National Guard Division",
    "333=%drd National Guard Division", "334=%dth National Guard Division", "335=%dth National Guard Division", "336=%dth National Guard Division", "337=%dth National Guard Division", "338=%dth National Guard Division", "339=%dth National Guard Division", "340=%dth National Guard Division",
    "341=%dst National Guard Division", "344=%dth National Guard Division", "345=%dth National Guard Division", "346=%dth National Guard Division", "347=%dth National Guard Division", "348=%dth National Guard Division", "349=%dth National Guard Division", "350=%dth National Guard Division",
    "351=%dst National Guard Division", "352=%dnd National Guard Division", "353=%drd National Guard Division", "354=%dth National Guard Division", "355=%dth National Guard Division", "356=%dth National Guard Division", "357=%dth National Guard Division", "358=%dth National Guard Division",
    "359=%dth National Guard Division", "360=%dth National Guard Division", "361=%dst National Guard Division", "362=%dnd National Guard Division", "363=%drd National Guard Division", "364=%dth National Guard Division", "365=%dth National Guard Division", "366=%dth National Guard Division",
    "367=%dth National Guard Division", "368=%dth National Guard Division", "369=%dth National Guard Division", "370=%dth National Guard Division"
  ] }
```

```json batch
{ "group": "MOT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "23=%drd Motorized Division", "39=%dth Motorized Division", "44=%dth Motorized Division", "46=%dth Motorized Division", "47=%dth Motorized Division", "48=%dth Motorized Division", "49=%dth Motorized Division", "51=%dst Motorized Division",
    "52=%dnd Motorized Division", "63=%drd Motorized Division", "65=%dth Motorized Division", "66=%dth Motorized Division", "69=%dth Motorized Division", "70=%dth Motorized Division", "71=%dst Motorized Division", "75=%dth Motorized Division",
    "76=%dth Motorized Division", "77=%dth Motorized Division", "78=%dth Motorized Division", "79=%dth Motorized Division", "80=%dth Motorized Division", "81=%dst Motorized Division", "83=%drd Motorized Division", "84=%dth Motorized Division",
    "85=%dth Motorized Division", "86=%dth Motorized Division", "87=%dth Motorized Division", "88=%dth Motorized Division", "89=%dth Motorized Division", "91=%dst Motorized Division", "92=%dnd Motorized Division", "93=%drd Motorized Division",
    "94=%dth Motorized Division", "95=%dth Motorized Division", "96=%dth Motorized Division", "97=%dth Motorized Division", "98=%dth Motorized Division", "99=%dth Motorized Division", "100=%dth Motorized Division", "102=%dnd Motorized Division",
    "103=%drd Motorized Division", "104=%dth Motorized Division", "106=%dth Motorized Division", "108=%dth Motorized Division"
  ] }
```

```json batch
{ "group": "MEC_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "23=%drd Mechanized Division", "39=%dth Mechanized Division", "44=%dth Mechanized Division", "46=%dth Mechanized Division", "47=%dth Mechanized Division", "48=%dth Mechanized Division", "49=%dth Mechanized Division", "51=%dst Mechanized Division",
    "52=%dnd Mechanized Division", "63=%drd Mechanized Division", "65=%dth Mechanized Division", "66=%dth Mechanized Division", "69=%dth Mechanized Division", "70=%dth Mechanized Division", "71=%dst Mechanized Division", "75=%dth Mechanized Division",
    "76=%dth Mechanized Division", "77=%dth Mechanized Division", "78=%dth Mechanized Division", "79=%dth Mechanized Division", "80=%dth Mechanized Division", "81=%dst Mechanized Division", "83=%drd Mechanized Division", "84=%dth Mechanized Division",
    "85=%dth Mechanized Division", "86=%dth Mechanized Division", "87=%dth Mechanized Division", "88=%dth Mechanized Division", "89=%dth Mechanized Division", "91=%dst Mechanized Division", "92=%dnd Mechanized Division", "93=%drd Mechanized Division",
    "94=%dth Mechanized Division", "95=%dth Mechanized Division", "96=%dth Mechanized Division", "97=%dth Mechanized Division", "98=%dth Mechanized Division", "99=%dth Mechanized Division", "100=%dth Mechanized Division", "102=%dnd Mechanized Division",
    "103=%drd Mechanized Division", "104=%dth Mechanized Division", "106=%dth Mechanized Division", "108=%dth Mechanized Division"
  ] }
```

```json batch
{ "group": "MNT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "48=%dth Mountain Division", "49=%dth Mountain Division", "52=%dnd Mountain Division", "54=%dth Mountain Division", "56=%dth Mountain Division", "58=%dth Mountain Division", "204=%dth Mountain Division"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 181 -> 251 | - | - | - |
| GAR_01 | 24 -> 228 | %drd National Guard Division (x19), %dth National Guard Division (x148), %dnd National Guard Division (x17), %dst National Guard Division (x20) | - | - |
| MOT_01 | 30 -> 74 | %drd Motorized Division (x5), %dth Motorized Division (x32), %dst Motorized Division (x4), %dnd Motorized Division (x3) | - | - |
| MEC_01 | 30 -> 74 | %drd Mechanized Division (x5), %dth Mechanized Division (x32), %dst Mechanized Division (x4), %dnd Mechanized Division (x3) | - | - |
| MNT_01 | 28 -> 35 | %dth Mountain Division (x6), %dnd Mountain Division | - | - |

Unchanged: RCT_01, CAV_01, ARM_01, ACR_01, ARMORED_DETACHMENTS_01, TD_01, ART_01, PAR_01, MAR_01, MAR_BGD_01, AMT_01, RANGER_FORCE_01, COMPOSITE_UNITS_01, DEF_01, COAST_01, OVS_01, CONST_01, MIL_01, SHOCK_01, COM_GUARD_01, COM_BGD_01, COM_ARM_01, FASCIST_01, PARAMILITARY_01, CONFED_01, JUNTA_01, CONT_01, UNION_01, CCC_01, VOL_01, PLAN_01
<!-- END CHANGE TABLE -->
