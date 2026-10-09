# Germany-Waffen-SS (GER_SS) Namelist Audit - 2026-10-09

Status: DONE

File: `common/units/names_divisions/INEX_GER_SS_names_divisions.txt`

Apply after: `docs/superpowers/plans/2026-10-09-germany-namelist.md` has been applied and committed. This plan does not depend on its content; the order keeps the German work in one sequence. Sister plans: `2026-10-09-germany-audit.md`, `2026-10-09-germany-additional-audit.md`.

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GER_SS`)
- AUDIT SUMMARY GER_SS: GROUPS=10 AUTHORED=619/634 FLAGS=3
- [GER_SS_04] flags: NAME_LONG
- [GER_SS_08] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- Found on manual review:
  - `GER_SS_STANDARTE_01` 901: "SS-Standarte 'Leibstandarte SS Adolf Hitler'" names the Standarte twice (SS-1).
  - `GER_SS_STANDARTE_01` 925: Polish spelling "(Płock)" inside a German designation (SS-2).
  - `GER_SS_01` to `GER_SS_07`, keys 92-94: three kept invented names read badly on an SS division (SS-3).
  - `GER_SS_01`, `GER_SS_02` key 31: "(Batschka)" is not an attested designation (SS-4).
  - `GER_SS_09`: the header calls all of keys 1-20 historical; six are not attested (SS-5).
  - Checked and clean: the shared extension 42-108 carries the same identity per number in all seven division lists (0 mismatches); no Kampfgruppe name is shared with `GER_KAMPFGRUPPE_01`.

## User decisions
Checkpoint answered on 2026-10-09 through the orchestrating session.
- **Approved:** SS-1, SS-2, SS-3, SS-4, SS-5, SS-6.
- **SS-3:** remove the three names from all seven lists. The fill-in alternative (real SS unit titles) is not taken.
- **Engine model** (in-game test by the user, 2026-10-09): an INEX group that reuses a vanilla tag replaces the vanilla group whole. `GER_SS_01` therefore holds exactly the entries of this file.
- **Defaults confirmed:** all ten groups stay `has_government = fascism`; the other kept invented nicknames stay.

## Research
- Shared with the GER audit: one `inex-audit-researcher` dispatch for all three German files, 25 web calls. The Waffen-SS topic came last and got the fewest calls. Sources: en.wikipedia "List of Waffen-SS divisions" (citation banner), axishistory (Totenkopf-Standarte entry), military-history.fandom and TracesOfWar (Latvian regiment title).
- Legacy verification: `docs/superpowers/plans/2026-09-30-germany-namelist.md`.
- `inex-code-reviewer`: one dispatch covering the names of all three audit plans (see Review).

## Rationale
Scope: the 10 existing groups. The batch touches all ten.

- **SS-1** `GER_SS_STANDARTE_01` 901: `SS-Standarte 'Leibstandarte SS Adolf Hitler'` -> `Leibstandarte SS Adolf Hitler`. "Leibstandarte" already is the Standarte; the unit was never styled "SS-Standarte 'Leibstandarte ...'".
- **SS-2** `GER_SS_STANDARTE_01` 925: `SS-Totenkopfstandarte XV (Płock)` -> `SS-Totenkopfstandarte XV (Plock)`. German usage of 1939-41 wrote the town without the Polish letter (renamed Schröttersburg in 1941). The station itself is unverified (Author confirmation).
- **SS-3** Keys 92 'Spähtrupp' (a patrol), 93 'Verfolger' (pursuer, also "persecutor") and 94 'Pfadfinder' (the Boy Scouts, which the regime dissolved) are removed from `GER_SS_01` to `GER_SS_07`: 21 entries. The 2026-09-30 rule dropped "incongruous imagery". The numbers then come from each list's fallback ("92. SS-Division"). The rule "same name per number in every SS list" still holds: the three numbers have no name in any list.
- **SS-4** Key 31: `%d. SS-Division (Batschka)` in `GER_SS_01` -> `%d. SS-Division`; `%d. SS-Freiwilligen-Grenadier-Division (Batschka)` in `GER_SS_02` -> `%d. SS-Freiwilligen-Grenadier-Division`. The parenthesis imitated the official national suffixes ("(lettische Nr. 1)"); none is attested for the 31st.
- **SS-5** `GER_SS_09`: the section "Historical Kampfgruppen of the Waffen-SS" becomes "Kampfgruppen named after Waffen-SS commanders (historical where attested)". Kraemer, Ostendorff, Becker, Lehmann, Kumm and Steiner are real commanders, but no Kampfgruppe of that name was found. No name changes.
- **SS-6** `GER_SS_08`: keys 101, 102, 103 are added as `schwere SS-Panzer-Abteilung %d`, the numbers the three battalions carried before the renumbering to 501-503. They go after key 503, inside the section "Historical (formed 1943-44 as 101-103, renumbered 501-503 in late 1944)". The group then has eight entries.

Checked, no change:
- `GER_SS_08` PLACEHOLDER_ENTRIES/LOW_DEPTH: the five older entries carry a corps attribution in brackets, and the lint counts them as placeholders because they begin with the fallback pattern. Three such battalions existed.
- `GER_SS_09`: entries read "Kampfgruppe X", the fallback "SS-Kampfgruppe %d". Kept: the Kampfgruppen are cited without the prefix, the numbered fallback needs it, and no name collides with the Heer list.
- Keys 39-41 ('Andreas Hofer', 'Feldherrnhalle', 'Kalevala'): the section header already says "Planned in 1945, never formed".
- Battalion-size names (informational): `GER_SS_08` names battalions, `GER_SS_STANDARTE_01` regiments. Nothing in the file is below battalion size.

Tooling note: PLACEHOLDER_ENTRIES treats `schwere SS-Panzer-Abteilung %d (I. SS-Panzerkorps)` as a placeholder (0 authored in `GER_SS_08`).

## Verified formations & commanders
- Legacy entries: see `docs/superpowers/plans/2026-09-30-germany-namelist.md` ("Verified formations & commanders" and "Author confirmation": Waffen-SS designations by type and SS regiment names are "well documented, not page-verified" there).
- This audit:
  - Leibstandarte SS Adolf Hitler: well documented.
  - schwere SS-Panzer-Abteilung 101, 102, 103, renumbered 501-503 in late 1944: well documented (the section header in the file states it).
  - 31. SS-Freiwilligen-Grenadier-Division, without a suffix: en.wikipedia "List of Waffen-SS divisions".
  - 39. Waffen-Gebirgs-Division der SS 'Andreas Hofer', 40. SS-Panzergrenadier-Division 'Feldherrnhalle', 41. Waffen-Grenadier-Division der SS 'Kalevala' (finnische Nr. 1), all never formed: same page (weak: citation banner).
  - Schröttersburg as the later German name of Płock: en.wikipedia "Hermann Schaper".

## Author confirmation
- "Plock" as the German spelling of 1939-41 (`GER_SS_STANDARTE_01` 925): planner's knowledge, not checked; the station of the 15. SS-Totenkopfstandarte there was not found either.
- Divisions 39-41: single weak source (unchanged entries).
- Totenkopfstandarten, unchanged entries: Roman numerals in the file, "SS-Totenkopf-Standarte 1 Oberbayern" on axishistory, neither confirmed as official; the stations of VI-XVI were not rechecked, and X and XIV both read "(Weimar)".
- Kampfgruppe Kraemer, Ostendorff, Becker, Lehmann, Kumm, Steiner (`GER_SS_09`, unchanged entries): no attestation found; the new section header says so.

## Kept on judgment
`-Check GER_SS` must show these 3 flags after the batch and no others:
- PLACEHOLDER_ENTRIES and LOW_DEPTH on `GER_SS_08`: lint false positive on a small historical series (8 entries after the batch).
- NAME_LONG on `GER_SS_04`: historical designations (for example "%d. SS-Panzergrenadier-Division 'Leibstandarte SS Adolf Hitler'", 63 characters).

Not a flag: numbers 23, 29, 30 and 33 carry two different divisions across the type lists, as they did historically (2026-09-30).

## Implementation steps
- [x] 1. Precondition: `git grep -c "^GER_PEN_01 = " HEAD -- common/units/names_divisions/INEX_GER_ADDITIONAL_names_divisions.txt`. Expect one line ending in `:1`. No output means the namelist plan is not applied and committed: stop. Then set `Status: IN PROGRESS`.
- [x] 2. Apply the batch: `powershell -File .\build.ps1 -EditNames GER_SS -Batch docs\superpowers\plans\2026-10-09-germany-waffen-ss-audit.md`. Expect ten green lines (`GER_SS_01` to `GER_SS_09`, `GER_SS_STANDARTE_01`) and no `[ERROR]`.
- [x] 3. `powershell -File .\build.ps1 -SyncWiki GER_SS`, then make the two edits listed under "Docs payload".
- [x] 4. `powershell -File .\build.ps1 -Check GER_SS`. Expect `Check passed`, `FLAGS=3` and 616 names in 10 groups; the flags must match "Kept on judgment".
- [x] 5. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 6. After the user confirms: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit GER_SS division namelists"`. One push covers all three German audit plans; if another of them is still to be applied in this session, push after the last.

## Docs payload
Find each place by its text, not by a line number. If a "current text" below is not in the file exactly as shown, stop and report. `2026-10-09-germany-namelist.md` does not touch this wiki page.

### README.md and WORKSHOP_DESCRIPTION_GUIDELINES.md
No change.

### wiki/Germany-Waffen-SS.md
No table row changes (`-SyncWiki GER_SS` should report nothing to update). Two prose edits.

1. Under the heading for `GER_SS_08`. Current text:

```
*schwere SS-Panzer-Abteilung 501–503*, formed as 101–103 and each attached to its SS Panzer corps. The plausible expansion adds battalions for the IV. and XI. SS-Panzerkorps.
```

New text:

```
*schwere SS-Panzer-Abteilung 501–503*, each attached to its SS Panzer corps, and the same three battalions under their 1943–44 numbers *101–103*. The plausible expansion adds battalions for the IV. and XI. SS-Panzerkorps.
```

2. Under the heading for `GER_SS_09`. Current text:

```
Historical Waffen-SS Kampfgruppen (*Kampfgruppe Peiper*, *Hansen*, *Knittel*), then SS division commanders.
```

New text:

```
Kampfgruppen named after Waffen-SS commanders, the attested ones first (*Kampfgruppe Peiper*, *Hansen*, *Knittel*), then SS division commanders.
```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the precondition in step 1 is not met; the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
- `inex-code-reviewer`: the batch adds or changes 7 names, below the 25-name threshold, but the names were included in the one run dispatched for the GER plan. Result: `No issues found`. It made no web lookups, so the verdict is a read for spelling, case and wording, not a source check.
- Self-check: every added or changed name is in "Verified formations & commanders" or "Author confirmation" (901 and 101-103 verified; 31 verified; 925 author confirmation). The batch adds no extrapolated name. Keys were taken from `-NamesOnly -Keys` and from a key listing of `GER_SS_03` to `GER_SS_07`; keys 92-94 exist in all seven lists.

## Outcome
2026-10-09: batch applied (ten groups), wiki synced and the two prose edits made. `-Check GER_SS`: `Validate: OK`, 373 tests passed, `GROUPS=10 AUTHORED=597/616 FLAGS=3` (`LOW_DEPTH x1, PLACEHOLDER_ENTRIES x1, NAME_LONG x1`, on `GER_SS_08` and `GER_SS_04`), `Diff vs HEAD: 9 group(s) changed, +7 -25 name(s)`, `Check passed`. No deviations from the plan. `-SyncWiki GER_SS` printed `Germany-Waffen-SS.md: 0 row(s) updated` and `wiki/Home.md: no GER_SS row` (the Home row carries the tag `GER`). Step 6 (wiki push) waits for the user's confirmation.

## Edit batch
Applied by `build.ps1 -EditNames GER_SS -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
[
  { "group": "GER_SS_01", "set": ["31=%d. SS-Division"], "remove": ["92", "93", "94"] },
  { "group": "GER_SS_02", "set": ["31=%d. SS-Freiwilligen-Grenadier-Division"], "remove": ["92", "93", "94"] },
  { "group": "GER_SS_03", "remove": ["92", "93", "94"] },
  { "group": "GER_SS_04", "remove": ["92", "93", "94"] },
  { "group": "GER_SS_05", "remove": ["92", "93", "94"] },
  { "group": "GER_SS_06", "remove": ["92", "93", "94"] },
  { "group": "GER_SS_07", "remove": ["92", "93", "94"] }
]
```

```json batch
{
  "group": "GER_SS_08",
  "add": [
    "101=schwere SS-Panzer-Abteilung %d",
    "102=schwere SS-Panzer-Abteilung %d",
    "103=schwere SS-Panzer-Abteilung %d"
  ],
  "after": "schwere SS-Panzer-Abteilung %d (III. SS-Panzerkorps)"
}
```

```json batch
{
  "group": "GER_SS_09",
  "renameSection": ["Historical Kampfgruppen of the Waffen-SS=Kampfgruppen named after Waffen-SS commanders (historical where attested)"]
}
```

```json batch
{ "group": "GER_SS_STANDARTE_01", "set": ["901=Leibstandarte SS Adolf Hitler", "925=SS-Totenkopfstandarte XV (Plock)"] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| 01 | 108 -> 105 | %d. SS-Division | %d. SS-Division (Batschka), %d. SS-Division 'Spähtrupp', %d. SS-Division 'Verfolger', %d. SS-Division 'Pfadfinder' | - |
| 02 | 86 -> 83 | %d. SS-Freiwilligen-Grenadier-Division | %d. SS-Freiwilligen-Grenadier-Division (Batschka), %d. SS-Grenadier-Division 'Spähtrupp', %d. SS-Grenadier-Division 'Verfolger', %d. SS-Grenadier-Division 'Pfadfinder' | - |
| 03 | 71 -> 68 | - | %d. SS-Division (mot.) 'Spähtrupp', %d. SS-Division (mot.) 'Verfolger', %d. SS-Division (mot.) 'Pfadfinder' | - |
| 04 | 81 -> 78 | - | %d. SS-Panzergrenadier-Division 'Spähtrupp', %d. SS-Panzergrenadier-Division 'Verfolger', %d. SS-Panzergrenadier-Division 'Pfadfinder' | - |
| 05 | 74 -> 71 | - | %d. SS-Panzer-Division 'Spähtrupp', %d. SS-Panzer-Division 'Verfolger', %d. SS-Panzer-Division 'Pfadfinder' | - |
| 06 | 74 -> 71 | - | %d. SS-Gebirgs-Division 'Spähtrupp', %d. SS-Gebirgs-Division 'Verfolger', %d. SS-Gebirgs-Division 'Pfadfinder' | - |
| 07 | 71 -> 68 | - | %d. SS-Kavallerie-Division 'Spähtrupp', %d. SS-Kavallerie-Division 'Verfolger', %d. SS-Kavallerie-Division 'Pfadfinder' | - |
| 08 | 5 -> 8 | schwere SS-Panzer-Abteilung %d (x3) | - | - |
| STANDARTE_01 | 24 -> 24 | Leibstandarte SS Adolf Hitler, SS-Totenkopfstandarte XV (Plock) | SS-Standarte 'Leibstandarte SS Adolf Hitler', SS-Totenkopfstandarte XV (Płock) | - |

Unchanged: 09
<!-- END CHANGE TABLE -->
