# Sweden (SWE) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_SWE_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit SWE`)
- AUDIT SUMMARY SWE: GROUPS=29 AUTHORED=418/423 FLAGS=0
- Vanilla leftovers (planner comparison of every vanilla key): 4 INEX groups on vanilla tags leave 45 vanilla keys in the game whose text differs from the INEX fallback ([NAM-020]). These are vanilla's capitalised `Arméfördelningen`/`Fördelningen` in two plain variants, and vanilla's old fallbacks in the mountain and storm-detachment lists. `-Audit` counts them as numbered keys and lists no names.

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
| `SWE_MOT_01` | 16 (1-16) | Plain variant: `%s. Motoriserade Arméfördelningen` (capitalised) | `%s. Motoriserade arméfördelningen` |
| `SWE_MEC_01` | 15 (1-15) | Plain variant: `%s. Mekaniserade Fördelningen` (capitalised) | `%s. Mekaniserade fördelningen` |
| `SWE_MNT_01` | 12 (31-42) | `%s. Jägarfördelningen` (vanilla's fallback, which INEX changed to *Fältjägarfördelningen*) | `%s. Fältjägarfördelningen` |
| `SWE_BS_01` | 2 (11-12) | `%s. Stormtrupper` (vanilla's fallback) | `%s. Stormavdelningen` |

Kept: vanilla stubs identical to the INEX fallback (`SWE_INF_01`, `SWE_ARM_01`, `SWE_MAR_01`, `SWE_PAR_01`), which read the same either way.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's fallback text. The file's authored names are unchanged.

## Author confirmation
None.

## Kept on judgment
Expected `-Check SWE` flags after the batch: none (0, as before). `numbered key(s) past a gap` lines remain for the kept stubs; no `vanilla name(s)` line appears.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (45). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames SWE -Batch docs/superpowers/plans/2026-10-17-sweden-audit.md`. Expect 4 green line(s), each `-0 ~0`: SWE_MOT_01 +16, SWE_MEC_01 +15, SWE_MNT_01 +12, SWE_BS_01 +2. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki SWE`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check SWE`. Expect `Check passed`, with the remaining flags matching "Kept on judgment". Its diff line counts distinct names per group, so its `+N` can be smaller than the number of keys written, or equal to it; either is expected. Then run `powershell -File .\build.ps1 -Audit SWE | Select-String 'vanilla name'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and namelists may show in `git status`: they are implemented in parallel by other agents; leave them alone.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged SWE entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged SWE entries"`.

## Docs payload
No docs change beyond -SyncWiki. No wiki or Workshop prose mentions these vanilla entries.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research). Every added entry is its group's `fallback_name`, generated by script. The keys come from vanilla `SWE_names_divisions.txt`: every key the INEX group does not write whose text differs from the group's fallback, minus the keeps under "Rationale". A preview on a scratch copy applied the batch, then showed the flags under "Kept on judgment" and the expected `vanilla name` output of step 3.

## Outcome
Date: 2026-10-17. Batch applied at step 1 (earlier run); steps 2 and 3 done in this run.

`-Check SWE` summary: `AUDIT SUMMARY SWE: GROUPS=29 AUTHORED=418/468 FLAGS=0`, tests 434 passed / 0 failed, `Diff vs HEAD: 4 group(s) changed, +45 -0 name(s)`, `Check passed`. FLAGS=0 matches "Kept on judgment". The denominator moved from 423 to 468 (the 45 vanilla keys now count as numbered keys, as the plan's Initial report predicted). `-Audit SWE | Select-String 'vanilla name'` printed no output.

Deviations: none in the steps. `-Check` also refreshed the change table in this plan (script side effect, not a plan change).

## Edit batch
Applied by `build.ps1 -EditNames SWE -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "MOT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%s. Motoriserade arméfördelningen", "2=%s. Motoriserade arméfördelningen", "3=%s. Motoriserade arméfördelningen", "4=%s. Motoriserade arméfördelningen", "5=%s. Motoriserade arméfördelningen", "6=%s. Motoriserade arméfördelningen", "7=%s. Motoriserade arméfördelningen", "8=%s. Motoriserade arméfördelningen",
    "9=%s. Motoriserade arméfördelningen", "10=%s. Motoriserade arméfördelningen", "11=%s. Motoriserade arméfördelningen", "12=%s. Motoriserade arméfördelningen", "13=%s. Motoriserade arméfördelningen", "14=%s. Motoriserade arméfördelningen", "15=%s. Motoriserade arméfördelningen", "16=%s. Motoriserade arméfördelningen"
  ] }
```

```json batch
{ "group": "MEC_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%s. Mekaniserade fördelningen", "2=%s. Mekaniserade fördelningen", "3=%s. Mekaniserade fördelningen", "4=%s. Mekaniserade fördelningen", "5=%s. Mekaniserade fördelningen", "6=%s. Mekaniserade fördelningen", "7=%s. Mekaniserade fördelningen", "8=%s. Mekaniserade fördelningen",
    "9=%s. Mekaniserade fördelningen", "10=%s. Mekaniserade fördelningen", "11=%s. Mekaniserade fördelningen", "12=%s. Mekaniserade fördelningen", "13=%s. Mekaniserade fördelningen", "14=%s. Mekaniserade fördelningen", "15=%s. Mekaniserade fördelningen"
  ] }
```

```json batch
{ "group": "MNT_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "31=%s. Fältjägarfördelningen", "32=%s. Fältjägarfördelningen", "33=%s. Fältjägarfördelningen", "34=%s. Fältjägarfördelningen", "35=%s. Fältjägarfördelningen", "36=%s. Fältjägarfördelningen", "37=%s. Fältjägarfördelningen", "38=%s. Fältjägarfördelningen",
    "39=%s. Fältjägarfördelningen", "40=%s. Fältjägarfördelningen", "41=%s. Fältjägarfördelningen", "42=%s. Fältjägarfördelningen"
  ] }
```

```json batch
{ "group": "BS_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "11=%s. Stormavdelningen", "12=%s. Stormavdelningen"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| MOT_01 | 0 -> 16 | %s. Motoriserade arméfördelningen (x16) | - | - |
| MEC_01 | 0 -> 15 | %s. Mekaniserade fördelningen (x15) | - | - |
| MNT_01 | 15 -> 27 | %s. Fältjägarfördelningen (x12) | - | - |
| BS_01 | 10 -> 12 | %s. Stormavdelningen (x2) | - | - |

Unchanged: IB_01, PB_01, CYC_01, CAV_02, MNT_02, KA_01, HV_01, ART_01, AA_01, PAR_02, ROYAL_01, VOL_01, INF_01, INF_02, MOT_02, MEC_02, ARM_01, ARM_02, CAV_01, MAR_01, PAR_01, FAS_01, RG_01, LS_01, CAR_01
<!-- END CHANGE TABLE -->
