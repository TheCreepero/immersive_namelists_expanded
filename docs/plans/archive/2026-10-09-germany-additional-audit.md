# Germany-Additional (GER_ADDITIONAL) Namelist Audit - 2026-10-09

Status: DONE

File: `common/units/names_divisions/INEX_GER_ADDITIONAL_names_divisions.txt`

Apply after: `docs/superpowers/plans/2026-10-09-germany-namelist.md` has been applied and committed. That plan adds five groups to this file (`GER_STUG_01`, `GER_BRIG_01`, `GER_PEN_01`, `GER_STURM_01`, `GER_LANDWEHR_01`) and edits the same wiki page; this plan edits none of those groups. Sister plans: `2026-10-09-germany-audit.md`, `2026-10-09-germany-waffen-ss-audit.md`. ADD-5 here and G-7 in the GER plan are one move (Legion Condor); apply both plans or neither.

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GER_ADDITIONAL`)
- AUDIT SUMMARY GER_ADDITIONAL: GROUPS=19 AUTHORED=521/734 FLAGS=19
- [GER_SCHWERE_PANZERABTEILUNG_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_SCHWERE_PANZERABTEILUNG_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_ARM_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_PANZERARTILLERIE_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_RESERVE_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_VOLKSGRENADIER_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, POLITICAL_ENTRY
- [GER_GRENADIER_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_LUFTWAFFEN_FELD_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_FLAK_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- Found on manual review:
  - `GER_RESERVE_DIVISION_01` 157: "157. Reserve-Gebirgs-Division" never existed under that name (ADD-1).
  - `GER_SA_01` 917, 933, 934: 'Ostsee', 'Sudetenland', 'Danzig' are not attested SA-Gruppen (ADD-2).
  - `GER_FORT_01` 32: doubled apostrophe in `Festungs-Division ''s-Hertogenbosch'` (ADD-3).
  - `GER_MIL_01` 30: "Schlesischer Selbstschutz" is not the attested name (ADD-4).
  - `GER_LEG_01` 901: Legion Condor was German, not a foreign legion (ADD-5).
  - `GER_PANZERARTILLERIE_DIVISION_01`: selector and fallback say "Panzer-Artillerie", every name is an Artillerie-Division or Volks-Artillerie-Korps (ADD-6).
  - `GER_FLAK_DIVISION_01`: the header promises a home "where verified"; 3 of 33 have one (ADD-7).
  - Checked and clean: no duplicate inside `GER_KAMPFGRUPPE_01` and none shared with `GER_SS_09`.

## User decisions
Checkpoint answered on 2026-10-09 through the orchestrating session.
- **Approved:** ADD-1, ADD-2, ADD-3, ADD-4, ADD-5, ADD-6, ADD-7.
- **ADD-8:** the three commanders stay in `GER_KAMPFGRUPPE_01`; no edit.
- **Engine model** (in-game test by the user, 2026-10-09): an INEX group that reuses a vanilla tag replaces the vanilla group whole. `GER_MIL_01`, `GER_MIL_02` and `GER_MIL_03` therefore hold exactly the entries of this file.
- **Defaults confirmed:** `can_use = { is_ai = no }` stays on `GER_PANZERARTILLERIE_DIVISION_01`; the Volksgrenadier list, "78. Volks-Sturm-Division" included, stays open to every government; the numbered series stay numbered; no action on battalion- and regiment-level lists.

## Research
- Shared with the GER audit: one `inex-audit-researcher` dispatch for all three German files, 25 web calls. Sources for this file: de-academic "157. Gebirgs-Division (Wehrmacht)" and the Bundesarchiv catalogue entry "157. Reserve-Division / 157. Gebirgs-Division / 8. Gebirgs-Division" (Deutsche Digitale Bibliothek); en.wikipedia "Flak division" and the pages of the 4th, 5th and 8th Flak Division; Instytut Pileckiego catalogue ("Okręgi SA") and Bundesarchiv NS 23 "SA-Gruppen (1939)"; IPN on the Selbstschutz Oberschlesien; en.wikipedia "Herzogenbusch concentration camp".
- Vanilla: `-InspectVanilla GER`; `common/units/*.txt` for the sub-unit ids.
- Legacy verification: `docs/superpowers/plans/2026-09-30-germany-namelist.md`.
- `inex-code-reviewer`: one dispatch covering the names of all three audit plans (see Review).

## Rationale
Scope: the 19 groups the file held on 2026-10-09. The batch touches seven of them.

- **ADD-1** `GER_RESERVE_DIVISION_01` 157: `%d. Reserve-Gebirgs-Division` -> `%d. Reserve-Division`. The 157. was a Reserve-Division (Wehrkreis VII) until it became the 157. Gebirgs-Division in autumn 1944; only the 188. was a Reserve-Gebirgs-Division.
- **ADD-2** `GER_SA_01`: 917 `SA-Gruppe 'Ostsee'` -> `SA-Gruppe 'Tannenberg'`; 933 `SA-Gruppe 'Sudetenland'` -> `SA-Gruppe 'Sudeten'`; 934 `SA-Gruppe 'Danzig'` -> `SA-Gruppe 'Südmark'`. "Ostsee" was an SS-Oberabschnitt, not an SA-Gruppe; Danzig belonged to SA-Gruppe 'Weichsel', which is already on key 936; 'Tannenberg' and 'Südmark' are attested SA-Gruppen the list lacked.
- **ADD-3** `GER_FORT_01` 32: `Festungs-Division ''s-Hertogenbosch'` -> `Festungs-Division 'Herzogenbusch'`. The Dutch name begins with an apostrophe and broke the quoting; "Herzogenbusch" is the German name in use in 1943-44.
- **ADD-4** `GER_MIL_01` 30: `Schlesischer Selbstschutz` -> `Selbstschutz Oberschlesien` (the formation of 1921, SSOS).
- **ADD-5** `GER_LEG_01` 901: `Legion Condor` is removed. The list is "foreign divisions in German service"; the Legion Condor was German personnel sent to Spain. It moves to `GER_ELI_01` (GER plan, G-7).
- **ADD-6** `GER_PANZERARTILLERIE_DIVISION_01`: selector `Panzer Artillery Divisions` -> `Artillery Divisions`; fallback `%d. Panzer-Artillerie-Division` -> `%d. Artillerie-Division`. All 16 names are the real 18., 309.-312. Artillerie-Divisionen and Volks-Artillerie-Korps; no "Panzer-Artillerie-Division" existed (the attested unit of that name is the Panzer-Artillerie-Regiment). Tag, `division_types` and gate stay. The comment above the group now says why the gate is there: the group is typed as armour, and `is_ai = no` keeps the automatic choice from giving an AI Panzer template artillery names.
- **ADD-7** `GER_FLAK_DIVISION_01`: the home station is added where one is verified, as the section header promises: 2 -> `%d. Flak-Division 'Leipzig'`, 3 'Hamburg', 4 'Düsseldorf', 8 'Bremen', 22 'Dortmund', 24 'Wien', 26 'München', 28 'Stuttgart'. Eight entries. Not added: 30 (Berlin, already on key 1), 27 (East Prussia, a region), 14 and 21 (unverified), the field divisions (no fixed station).

No extrapolated name is added: every new name is an attested formation, town or SA-Gruppe.

Numbered series, kept numbered (decision per group):
- `GER_SCHWERE_PANZERABTEILUNG_01`/`_02`: 501-510, 511, 424, (Fkl) 301, Panzerjäger 653, 654, 512. The battalions had numbers, not names; the two honour titles (Feldherrnhalle, Großdeutschland) are fascist-only and sit in `GER_ELI_01`.
- `GER_ARM_03`: Panzer-Brigade 10, 101-113, 150, 'Norwegen'. Same reason (106 'Feldherrnhalle' is in `GER_ELI_01`).
- `GER_RESERVE_DIVISION_01`, `GER_VOLKSGRENADIER_01`, `GER_GRENADIER_DIVISION_01`: real, non-sequential numbers in raising order. The entries are required: the fallback alone would count 1, 2, 3.
- `GER_LUFTWAFFEN_FELD_DIVISION_01`: 1-21 and Division Meindl; the divisions had no names.
- `GER_PANZERARTILLERIE_DIVISION_01`: numbers only.
- `GER_FLAK_DIVISION_01`: numbered, with stations where verified (ADD-7).

Checked, no change:
- `GER_VOLKSGRENADIER_01` POLITICAL_ENTRY `%d. Volks-Sturm-Division` (key 78): the designation the 78. Sturm-Division received in 1945, not a militia.
- `GER_MIL_02` gate `neutrality OR democratic OR fascism`: vanilla's gate; vanilla colonial focuses create divisions with `division_names_group = GER_MIL_02` (10 references in `common/national_focus/germany.txt`). `has_government` only, so R11 is met.
- `GER_SCHWERE_PANZERABTEILUNG_01` and `_02` link to each other (not self-links): the full and the abbreviated list share one number pool.
- `GER_FLAK_DIVISION_01` 9 'Stalingrad': a fate, not a station; kept by the 2026-09-30 decision.
- `GER_KAMPFGRUPPE_01` (ADD-8): Burgdorf (35), Dostler (51), Schörner (142) stay by the user's decision; a surname is not a party name.
- Battalion-size names (informational): `GER_SCHWERE_PANZERABTEILUNG_01`/`_02` and `GER_VOLKSSTURM_BATAILLONS_01` name battalions, as does `Kamelreiter-Abteilung` (`GER_MIL_02` 10). Regiment-level entries: the two SA-Standarten, `Infanterie-Regiment 638 (franz.)`, `Infanterie-Regiment 950 (ind.)`, `Freiwilligen-Regiment von Oven`. `GER_GAR_02` names headquarters (Kommandanturen), not units. Nothing in the 19 audited groups is below battalion size.

Tooling notes:
- PLACEHOLDER_ENTRIES and LOW_DEPTH fire on every numbered series here although the keys are real, non-sequential numbers.
- `$ValidDivisionTypes` accepts `artillery`, `anti_air`, `anti_tank` and `rocket_artillery`, which are support-company ids in vanilla (`common/units/artillery.txt`, `anti-air.txt`); the line battalions are `artillery_brigade`, `anti_air_brigade` and so on, and vanilla uses none of them in a names group. That is why ADD-6 does not retype the artillery group.
- `-Check GER_ADDITIONAL` refreshes the change table at the end of this plan against `HEAD`. If the namelist plan were applied but not committed, the table would list its five groups as new. The precondition in step 1 prevents that.

## Verified formations & commanders
- Legacy entries: see `docs/superpowers/plans/2026-09-30-germany-namelist.md` ("Verified formations & commanders").
- This audit:
  - 157. Reserve-Division -> 157. Gebirgs-Division (autumn 1944) -> 8. Gebirgs-Division (27 Feb 1945): de-academic "157. Gebirgs-Division (Wehrmacht)"; Bundesarchiv via Deutsche Digitale Bibliothek. 188. Reserve-Gebirgs-Division: en.wikipedia "188th Reserve Mountain Division".
  - Flak-Divisionen: 1 Berlin, 3 Hamburg, 8 Bremen, 22 Dortmund, 24 Wien, 26 München, 28 Stuttgart, 29 Oslo, 30 Berlin; 2 Leipzig until January 1942; 4 Essen, Düsseldorf, Ratingen, Duisburg in turn: en.wikipedia "Flak division" and the 4th, 5th, 8th Flak Division pages.
  - SA-Gruppen Sudeten, Südmark, Tannenberg, Warthe, Weichsel, Schlesien, Thüringen, Westfalen: Instytut Pileckiego catalogue ("Okręgi SA"). Hochland, Südwest, Hansa, Bayerische Ostmark: Bundesarchiv NS 23 "SA-Gruppen (1939)". Nordsee, Ostland: single documents. "Ostsee" as an SS-Oberabschnitt: en.wikipedia "Allgemeine-SS regional commands".
  - Selbstschutz Oberschlesien: IPN.
  - Herzogenbusch as the German name of 's-Hertogenbosch in 1943-44: en.wikipedia "Herzogenbusch concentration camp".
  - 18., 310., 311., 312. Artillerie-Division and Artillerie-Division z.b.V. 309: 2026-09-30 plan (the fallback `%d. Artillerie-Division` repeats the designation of entries already in the list).
  - Legion Condor: well documented.

## Author confirmation
- SA-Gruppen 'Tannenberg', 'Sudeten', 'Südmark' (`GER_SA_01` 917, 933, 934): from archive catalogue records; no full list of 1939-42 was reachable. The other SA-Gruppen in the list were not checked one by one.
- `Festungs-Division 'Herzogenbusch'` (`GER_FORT_01` 32): the German name is verified; that the town was a declared Festung or fester Platz in 1944 is not. The entry sits in the "Feste Plätze and Festungen declared 1944-45" section.
- `2. Flak-Division 'Leipzig'`: station only until January 1942, then a field division.
- `4. Flak-Division 'Düsseldorf'`: the staff sat in Essen, Düsseldorf, Ratingen and Duisburg in turn; Düsseldorf is the planner's pick.
- Unchanged entries not checked in this audit: `schwere Panzer-Abteilung (Fkl) 301`, `Legion Wallonie` (German form "Wallonische Legion"), the home stations of the 7., 9., 14., 21. and 31. Flak-Division. Everything under "Author confirmation" in the 2026-09-30 plan stays as it was.

## Kept on judgment
The 19 groups this plan audited must show these 18 flags in `-Check GER_ADDITIONAL` after the batch and no others. Flags on `GER_STUG_01`, `GER_BRIG_01`, `GER_PEN_01`, `GER_STURM_01` and `GER_LANDWEHR_01` belong to `2026-10-09-germany-namelist.md` ("Kept on judgment" there) and are not judged here.
- PLACEHOLDER_ENTRIES on `GER_SCHWERE_PANZERABTEILUNG_01`, `GER_SCHWERE_PANZERABTEILUNG_02`, `GER_ARM_03`, `GER_PANZERARTILLERIE_DIVISION_01`, `GER_RESERVE_DIVISION_01`, `GER_VOLKSGRENADIER_01`, `GER_GRENADIER_DIVISION_01`, `GER_LUFTWAFFEN_FELD_DIVISION_01`, `GER_FLAK_DIVISION_01` (9 flags): historical number series.
- LOW_DEPTH on the first eight of those groups (8 flags). `GER_FLAK_DIVISION_01` loses LOW_DEPTH: it has 11 authored entries after ADD-7. That is the one flag fewer than before the batch.
- POLITICAL_ENTRY on `GER_VOLKSGRENADIER_01` (`%d. Volks-Sturm-Division`): historical designation of 1945.

## Implementation steps
- [x] 1. Precondition: `git grep -c "^GER_PEN_01 = " HEAD -- common/units/names_divisions/INEX_GER_ADDITIONAL_names_divisions.txt`. Expect one line ending in `:1`. No output means the namelist plan is not applied and committed: stop. Then set `Status: IN PROGRESS`.
- [x] 2. Apply the batch: `powershell -File .\build.ps1 -EditNames GER_ADDITIONAL -Batch docs\superpowers\plans\2026-10-09-germany-additional-audit.md`. Expect seven green lines (`GER_PANZERARTILLERIE_DIVISION_01`, `GER_RESERVE_DIVISION_01`, `GER_FLAK_DIVISION_01`, `GER_FORT_01`, `GER_SA_01`, `GER_MIL_01`, `GER_LEG_01`) and no `[ERROR]`.
- [x] 3. `powershell -File .\build.ps1 -SyncWiki GER_ADDITIONAL`. It rewrites the table row and the `###` heading of `GER_PANZERARTILLERIE_DIVISION_01` to "Artillery Divisions" and `%d. Artillerie-Division`. Then make the four edits listed under "Docs payload".
- [x] 4. `powershell -File .\build.ps1 -Check GER_ADDITIONAL`. Expect `Check passed`. `GER_FLAK_DIVISION_01` must no longer show LOW_DEPTH and `GER_LEG_01` must show 22 entries; the flags of the 19 audited groups must match "Kept on judgment".
- [x] 5. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 6. After the user confirms: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit GER_ADDITIONAL division namelists"`. One push covers all three German audit plans; if another of them is still to be applied in this session, push after the last.

## Docs payload
Find each place by its text, not by a line number. If a "current text" below is not in the file exactly as shown, stop and report. Every "current text" here reads the same before and after `2026-10-09-germany-namelist.md`; that plan inserts text next to edit 1 (its own note about `GER_PEN_01`, directly below) and uses the `GER_PANZERARTILLERIE_DIVISION_01` note and heading as anchors, which is why it must be applied first.

### README.md, WORKSHOP_DESCRIPTION_GUIDELINES.md, wiki/Home.md
No change.

### wiki/Germany-Additional.md
The table row and the `###` heading of `GER_PANZERARTILLERIE_DIVISION_01` are rewritten by `-SyncWiki GER_ADDITIONAL`. Four prose edits.

1. The note below the groups table. Current text:

```
> **Note:** `GER_PANZERARTILLERIE_DIVISION_01` uses `can_use = { is_ai = no }`, so only human players can use it.
```

New text:

```
> **Note:** `GER_PANZERARTILLERIE_DIVISION_01` uses `can_use = { is_ai = no }`, so only human players can use it. The group is typed as armour, and the gate keeps the game from giving AI Panzer divisions artillery names.
```

2. Under the heading for `GER_RESERVE_DIVISION_01`. Current text:

```
The real Reserve divisions of 1942–44 (*141.–191.*), including the *157.* and *188. Reserve-Gebirgs-Division*.
```

New text:

```
The real Reserve divisions of 1942–44 (*141.–191.*), including the *188. Reserve-Gebirgs-Division*.
```

3. Under the heading for `GER_FLAK_DIVISION_01`. Current text:

```
*1.–31. Flak-Division* and the two Flakscheinwerfer divisions. A home is noted where verified (*1. 'Berlin'*, *29. 'Oslo'*), and *9. 'Stalingrad'* marks the division destroyed there.
```

New text:

```
*1.–31. Flak-Division* and the two Flakscheinwerfer divisions. A home is noted where verified (*1. 'Berlin'*, *3. 'Hamburg'*, *26. 'München'*, *29. 'Oslo'*), and *9. 'Stalingrad'* marks the division destroyed there.
```

4. Under the heading for `GER_LEG_01`. Current text:

```
- The *Ostlegionen*, *Legion Condor*, *Legion Wallonie*, the LVF and the Indian Legion.
```

New text:

```
- The *Ostlegionen*, *Legion Wallonie*, the LVF and the Indian Legion.
```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the precondition in step 1 is not met; the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears on one of the 19 audited groups that "Kept on judgment" does not list; the change table at the end of this plan lists `GER_STUG_01`, `GER_BRIG_01`, `GER_PEN_01`, `GER_STURM_01` or `GER_LANDWEHR_01` as new after `-Check` (the namelist plan was not committed first).

## Review
- `inex-code-reviewer`: the batch adds or changes 14 names, below the 25-name threshold, but the names were included in the one run dispatched for the GER plan. Result: `No issues found`. It made no web lookups, so the verdict is a read for spelling, case and wording, not a source check.
- Self-check: every added or changed name is in "Verified formations & commanders" or "Author confirmation". The batch adds no extrapolated name. Keys were taken from `-NamesOnly -Keys`. No fix relies on a vanilla key: every key the batch sets or removes is defined in this file.

## Outcome
2026-10-09: batch applied (seven groups), wiki synced (`GER_PANZERARTILLERIE_DIVISION_01` row and heading) and the four prose edits made. `-Check GER_ADDITIONAL`: `Validate: OK`, 373 tests passed, `GROUPS=24 AUTHORED=556/917 FLAGS=27` (`PLACEHOLDER_ENTRIES x14, LOW_DEPTH x12, POLITICAL_ENTRY x1`), `Diff vs HEAD: 6 group(s) changed, +13 -6 name(s)`, `Check passed`. The 19 audited groups show the 18 flags listed under "Kept on judgment"; the other nine are on the five groups of `2026-10-09-germany-namelist.md`. `GER_FLAK_DIVISION_01` no longer shows LOW_DEPTH; `GER_LEG_01` has 22 entries. The change table lists none of the five new groups. No deviations from the plan. Step 6 (wiki push) waits for the user's confirmation.

## Edit batch
Applied by `build.ps1 -EditNames GER_ADDITIONAL -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{
  "group": "GER_PANZERARTILLERIE_DIVISION_01",
  "selector": "Artillery Divisions",
  "fallback": "%d. Artillerie-Division",
  "comment": "Players only (is_ai = no): artillery-heavy and self-propelled artillery templates; own number series.\nTyped as armour, so the gate keeps the automatic choice from giving AI Panzer templates artillery names."
}
```

```json batch
{ "group": "GER_RESERVE_DIVISION_01", "set": ["157=%d. Reserve-Division"] }
```

```json batch
{
  "group": "GER_FLAK_DIVISION_01",
  "set": [
    "2=%d. Flak-Division 'Leipzig'",
    "3=%d. Flak-Division 'Hamburg'",
    "4=%d. Flak-Division 'Düsseldorf'",
    "8=%d. Flak-Division 'Bremen'",
    "22=%d. Flak-Division 'Dortmund'",
    "24=%d. Flak-Division 'Wien'",
    "26=%d. Flak-Division 'München'",
    "28=%d. Flak-Division 'Stuttgart'"
  ]
}
```

```json batch
[
  { "group": "GER_FORT_01", "set": ["32=Festungs-Division 'Herzogenbusch'"] },
  { "group": "GER_SA_01", "set": ["917=SA-Gruppe 'Tannenberg'", "933=SA-Gruppe 'Sudeten'", "934=SA-Gruppe 'Südmark'"] },
  { "group": "GER_MIL_01", "set": ["30=Selbstschutz Oberschlesien"] },
  { "group": "GER_LEG_01", "remove": ["901"] }
]
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| GER_PANZERARTILLERIE_DIVISION_01 | 16 -> 16 | - | - | selector: 'Panzer Artillery Divisions' -> 'Artillery Divisions'; fallback: '%d. Panzer-Artillerie-Division' -> '%d. Artillerie-Division' |
| GER_FLAK_DIVISION_01 | 33 -> 33 | %d. Flak-Division 'Leipzig', %d. Flak-Division 'Hamburg', %d. Flak-Division 'Düsseldorf', %d. Flak-Division 'Bremen', %d. Flak-Division 'Dortmund', %d. Flak-Division 'Wien', %d. Flak-Division 'München', %d. Flak-Division 'Stuttgart' | - | - |
| GER_FORT_01 | 114 -> 114 | Festungs-Division 'Herzogenbusch' | Festungs-Division ''s-Hertogenbosch' | - |
| GER_SA_01 | 29 -> 29 | SA-Gruppe 'Tannenberg', SA-Gruppe 'Sudeten', SA-Gruppe 'Südmark' | SA-Gruppe 'Ostsee', SA-Gruppe 'Sudetenland', SA-Gruppe 'Danzig' | - |
| GER_MIL_01 | 30 -> 30 | Selbstschutz Oberschlesien | Schlesischer Selbstschutz | - |
| GER_LEG_01 | 23 -> 22 | - | Legion Condor | - |

Unchanged: GER_SCHWERE_PANZERABTEILUNG_01, GER_SCHWERE_PANZERABTEILUNG_02, GER_ARM_03, GER_STUG_01, GER_RESERVE_DIVISION_01, GER_VOLKSGRENADIER_01, GER_GRENADIER_DIVISION_01, GER_LUFTWAFFEN_FELD_DIVISION_01, GER_GAR_02, GER_KAMPFGRUPPE_01, GER_BRIG_01, GER_PEN_01, GER_VOLKSSTURM_BATAILLONS_01, GER_MIL_02, GER_MIL_04, GER_MIL_03, GER_STURM_01, GER_LANDWEHR_01
<!-- END CHANGE TABLE -->
