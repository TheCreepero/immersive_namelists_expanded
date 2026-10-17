# Poland (POL) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_POL_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit POL`)
- AUDIT SUMMARY POL: GROUPS=34 AUTHORED=258/439 FLAGS=33
- [POL_GA_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_AA_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, NAME_LONG
- [POL_AA_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_MOT_02] flags: LOW_DEPTH
- [POL_ARM_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_INF_01] flags: PLACEHOLDER_ENTRIES
- [POL_PSZ_01] flags: LOW_DEPTH
- [POL_PSZ_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_PSZ_03] flags: LOW_DEPTH
- [POL_LWP_01] flags: LOW_DEPTH
- [POL_LWP_02] flags: LOW_DEPTH
- [POL_LWP_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_AWL_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_LWP_00] flags: PLACEHOLDER_ENTRIES
- [POL_LWZ_00] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_LDP_00] flags: LOW_DEPTH
- [POL_OTH_01] flags: LOW_DEPTH
- [POL_MEC_01] flags: LOW_DEPTH
- [POL_PAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_PAR_02] flags: LOW_DEPTH
- [POL_GAR_01] flags: LOW_DEPTH
- [POL_GAR_02] flags: LOW_DEPTH
- [POL_GAR_03] flags: LOW_DEPTH
- Vanilla leftovers (`Vanilla: leaves out` lines and a planner comparison of every vanilla key): 3 INEX groups on vanilla tags leave 23 vanilla names in the game ([NAM-020]). The 2026-10-01 audit removed all of them: invented regional cavalry brigades, lowland regional titles on mountain divisions, and KOP brigades in the west of Poland.

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
| `POL_CAV_01` | 8 (112-119) | `Lwowska` ... `Stanisławowska Brygada Kawalerii`. The 2026-10-01 audit moved these plausible regional brigades to 140-147 ("Plausible Regional Formations"), so they showed twice | `%d Brygada Kawalerii` |
| `POL_MNT_01` | 4 (13, 14, 15, 30) | `%d Wielkopolska Kresowa`, `Pomorska`, `Wielkopolska` and `Poleska Dywizja Piechoty Górskiej`: lowland regional titles on mountain divisions, removed by the 2026-10-01 audit | `%d Dywizja Piechoty Górskiej` |
| `POL_GAR_01` | 11 (7-17) | `Brygada KOP Modlin`, `Bydgoszcz`, `Poznań`, `Katowice` and `Sanok`. The Border Protection Corps held only the eastern border. Also unquoted copies of the six brigades INEX writes under 1-6 (`Grodno`, `Wilno`, `Nowogródek`, `Polesie`, `Wołyń`, `Podole`) | `%d Brygada KOP` |

Kept: vanilla stubs identical to the INEX fallback in `POL_INF_01`, `POL_MOT_01`, `POL_MEC_01` and `POL_MNT_01` (numbered keys, which read the same either way).
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's fallback text. The file's authored names are unchanged.

## Author confirmation
None.

## Kept on judgment
Expected `-Check POL` flags after the batch (34, compared with 33 before):
- `PLACEHOLDER_ENTRIES` on `POL_GAR_01` (new): it writes its fallback over vanilla's merged keys, which is the purpose of the batch.
- `PLACEHOLDER_ENTRIES` on 11 groups, `LOW_DEPTH` on 21 and `NAME_LONG` on `POL_AA_01` (as before; 2026-10-01 audit). Out of scope.
- No `Vanilla: ... vanilla name(s)` line remains; `numbered key(s) past a gap` lines remain for the kept stubs.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (23). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames POL -Batch docs/superpowers/plans/2026-10-17-poland-audit.md`. Expect 3 green line(s), each `-0 ~0`: POL_CAV_01 +8, POL_MNT_01 +4, POL_GAR_01 +11. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki POL`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check POL`. Expect `Check passed`, with the remaining flags matching "Kept on judgment". Its diff line counts distinct names per group, so its `+N` can be smaller than the number of keys written, or equal to it; either is expected. Then run `powershell -File .\build.ps1 -Audit POL | Select-String 'vanilla name'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and namelists may show in `git status`: they are implemented in parallel by other agents; leave them alone.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged POL entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged POL entries"`.

## Docs payload
No docs change beyond -SyncWiki. No wiki or Workshop prose mentions these vanilla entries.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research). Every added entry is its group's `fallback_name`, generated by script. The keys come from vanilla `POL_names_divisions.txt`: every key the INEX group does not write whose text differs from the group's fallback, minus the keeps under "Rationale". A preview on a scratch copy applied the batch, then showed the flags under "Kept on judgment" and the expected `vanilla name` output of step 3.

## Outcome
- Date: 2026-10-17.
- `-Check POL`: Validate OK; Tests 434 passed, 0 failed, 0 skipped; `AUDIT SUMMARY POL: GROUPS=34 AUTHORED=258/462 FLAGS=34`; Flags: LOW_DEPTH x21, PLACEHOLDER_ENTRIES x12 (11 as before plus POL_GAR_01), NAME_LONG x1; Diff vs HEAD: 3 group(s) changed, +23 -0 name(s); `Check passed`.
- `-Audit POL | Select-String 'vanilla name'`: no output.
- Deviations: none. Steps 1 and 2 were already ticked when this run started (Status was IN PROGRESS), so the run resumed at step 3.

## Edit batch
Applied by `build.ps1 -EditNames POL -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "CAV_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "112=%d Brygada Kawalerii", "113=%d Brygada Kawalerii", "114=%d Brygada Kawalerii", "115=%d Brygada Kawalerii", "116=%d Brygada Kawalerii", "117=%d Brygada Kawalerii", "118=%d Brygada Kawalerii", "119=%d Brygada Kawalerii"
  ] }
```

```json batch
{ "group": "MNT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "13=%d Dywizja Piechoty Górskiej", "14=%d Dywizja Piechoty Górskiej", "15=%d Dywizja Piechoty Górskiej", "30=%d Dywizja Piechoty Górskiej"
  ] }
```

```json batch
{ "group": "GAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "7=%d Brygada KOP", "8=%d Brygada KOP", "9=%d Brygada KOP", "10=%d Brygada KOP", "11=%d Brygada KOP", "12=%d Brygada KOP", "13=%d Brygada KOP", "14=%d Brygada KOP",
    "15=%d Brygada KOP", "16=%d Brygada KOP", "17=%d Brygada KOP"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| CAV_01 | 22 -> 30 | %d Brygada Kawalerii (x8) | - | - |
| MNT_01 | 20 -> 24 | %d Dywizja Piechoty Górskiej (x4) | - | - |
| GAR_01 | 6 -> 17 | %d Brygada KOP (x11) | - | - |

Unchanged: GA_01, AA_01, AA_02, POLIC_01, MOT_02, ON_01, ARM_01, ARM_BRIGADE_01, INF_01, PSZ_01, PSZ_02, PSZ_03, LWP_01, LWP_02, LWP_03, AWL_03, LWP_00, LWZ_00, LDP_00, OTH_01, AK_01, INF_RESERVE_01, CAV_DIVISION_01, MOT_01, MEC_01, PAR_01, PAR_02, MAR_01, GAR_02, GAR_03, BSKRZ_01
<!-- END CHANGE TABLE -->
