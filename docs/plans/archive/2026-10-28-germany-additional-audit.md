# Germany-Additional (GER_ADDITIONAL) Namelist Audit - 2026-10-28

Status: DONE

File: `common/units/names_divisions/zz_INEX_GER_ADDITIONAL_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GER_ADDITIONAL`)
- AUDIT SUMMARY GER_ADDITIONAL: GROUPS=25 AUTHORED=653/987 FLAGS=16
- File: IDENTITY_REPEAT: 'Baden' (GER_MIL_04, GER_MIL_03); 'Berlin' (GER_FLAK_DIVISION_01, GER_FORT_01, GER_VOLKSSTURM_BATAILLONS_01); 'Düsseldorf' (GER_FLAK_DIVISION_01, GER_VOLKSSTURM_BATAILLONS_01); 'Franken' (GER_VOLKSSTURM_BATAILLONS_01, GER_SA_01, GER_MIL_04); 'Halle-Merseburg' (GER_VOLKSSTURM_BATAILLONS_01, GER_MIL_03); 'Hamburg' (GER_FLAK_DIVISION_01, GER_FORT_01, GER_VOLKSSTURM_BATAILLONS_01, GER_MIL_04); 'Hessen-Nassau' (GER_VOLKSSTURM_BATAILLONS_01, GER_MIL_04); 'Magdeburg-Anhalt' (GER_VOLKSSTURM_BATAILLONS_01, GER_MIL_04, GER_MIL_03); 'Mecklenburg' (GER_VOLKSSTURM_BATAILLONS_01, GER_MIL_03); 'Oberschlesien' (GER_VOLKSSTURM_BATAILLONS_01, GER_MIL_04, GER_MIL_03); 'Ostpreußen' (GER_VOLKSSTURM_BATAILLONS_01, GER_MIL_04, GER_MIL_03); 'Pommern' (GER_VOLKSSTURM_BATAILLONS_01, GER_SA_01, GER_MIL_04, GER_MIL_03); 'Sachsen' (GER_VOLKSSTURM_BATAILLONS_01, GER_SA_01, GER_MIL_04, GER_MIL_03); 'Schlesien' (GER_SA_01, GER_MIL_04, GER_MIL_03); 'Thüringen' (GER_VOLKSSTURM_BATAILLONS_01, GER_SA_01, GER_MIL_04, GER_MIL_03); 'Wien' (GER_FLAK_DIVISION_01, GER_FORT_01, GER_VOLKSSTURM_BATAILLONS_01); 'Württemberg' (GER_MIL_04, GER_MIL_03)
- [GER_SCHWERE_PANZERABTEILUNG_01] flags: PLACEHOLDER_ENTRIES
- [GER_SCHWERE_PANZERABTEILUNG_02] flags: PLACEHOLDER_ENTRIES
- [GER_ARM_03] flags: PLACEHOLDER_ENTRIES
- [GER_STUG_01] flags: PLACEHOLDER_ENTRIES
- [GER_RESERVE_DIVISION_01] flags: PLACEHOLDER_ENTRIES
- [GER_VOLKSGRENADIER_01] flags: PLACEHOLDER_ENTRIES, POLITICAL_ENTRY
- [GER_LUFTWAFFEN_FELD_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_FLAK_DIVISION_01] flags: PLACEHOLDER_ENTRIES
- [GER_PEN_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_STURM_01] flags: PLACEHOLDER_ENTRIES
- [GER_MONRES_01] flags: PLACEHOLDER_ENTRIES
- [GER_LANDWEHR_01] flags: PLACEHOLDER_ENTRIES
- Found on manual review: `division_types` wiring. `GER_KAMPFGRUPPE_01` (166 names, ungated, lists motorized, mechanized and armour) wins the automatic pick for every German motorized, mechanized and armoured template (NAM-018). `GER_FLAK_DIVISION_01` lists only `infantry`; `GER_STUG_01` and `GER_PANZERARTILLERIE_DIVISION_01` list tank ids. No German group lists an artillery, rocket, anti-air, anti-tank, tank destroyer, SP artillery, SP anti-air, armoured car, amphibious or `marine_commando` line id, so templates of those battalions get no German specialist list automatically.

## User decisions
All final (2026-10-28, relayed by the coordinating session):
1. Kampfgruppen: reduce `GER_KAMPFGRUPPE_01` to `infantry` only, in this plan. The `GER_SS_01` knock-on is handled by a separate GER-file plan (plain `GER_Arm_01`, `GER_MOT_01` and `GER_MEC_01` grown past `GER_SS_01` with plain numbered entries), which ships first. Ship order: GER, then GER_ADDITIONAL (this plan), then GER_SS.
2. Both optional groups are in: naval commandos (`marine_commando`) and Sea Lion amphibious (fallback `Tauchpanzer-Abteilung %d`, extrapolated).
3. Keys 653, 654 and 512 move out of `GER_SCHWERE_PANZERABTEILUNG_01` and `_02` into the Panzerjäger group.
4. Key 78 of `GER_VOLKSGRENADIER_01` becomes `%d. Volksgrenadier-Division`; the wiki line that leads with it is fixed.
5. The nine Heeres-Artillerie-Brigaden are added to `GER_PANZERARTILLERIE_DIVISION_01`.
6. All other recommendations of the report as written below: the three retypes, the `is_ai = no` gate dropped (`can_use = { always = yes }`, the file's convention), the Werfer, Panzerjäger and reconnaissance groups, no Flak depth.

## Research
- Planner fork (no subagent; parallel run with the GER_SS planner), 20 web calls, 2026-10-28.
- Main sources: Wikipedia "List of German brigades in World War II" (Panzerjäger, artillery, rocket launcher, army AA, Flak brigade sections); Wikipedia "Nashorn", "512th Heavy Panzerjäger Battalion"; Battlefront forum "German heavy Panzerjäger battalions" (snippet; page 403); feldgrau.net (Pz.Jg.Abt. 525, 560, s.Pz.Jg.Abt. 519); warhistory.org "The MEKs – Marineeinsatzkommandos" I and II; axishistory.com "Kommando der Kleinkampfverbände"; esut.de "Tauchfähige Panzer"; military-history.fandom "18th Panzer Division (Wehrmacht)"; rommelsriposte.com DAK war diary (Aufklärungsabteilung 3); TracesOfWar "Scherer, Albrecht" (Werfer-Regiment 53); Wikipedia "Panzer Lehr Division".
- Failed: sturmvogel.orbat.com/werfer.html (certificate expired); no full Werfer-Regiment list found.
- Engine facts: register NAM-004, NAM-018, NAM-020, NAM-026, NAM-027 (Knowledge/topics/namelists.md); line ids from the game's `common/units/*.txt` (1.19.4).

## Rationale

### Automatic pick (NAM-018, NAM-026)
New and script-made templates take, among the country's available groups whose `division_types` list one of the template's line battalions, the group with the most names. Counts below are after vanilla's merge (NAM-020); every INEX group here writes all of vanilla's keys, so the merged count is the INEX count. Vanilla tokens cannot be removed by INEX (merged lists only add).

Competing groups today (merged counts): `GER_Inf_01` 308 (infantry); `GER_MONINF_01` 209 (neutrality/democratic: infantry, mechanized, mountaineers, paratrooper, marine); `GER_KAMPFGRUPPE_01` 166 (all: infantry, motorized, mechanized, light/medium/heavy armour); `GER_MONMOB_01` 111 (neutrality/democratic: cavalry, armour); `GER_SS_01` 105 (fascism: infantry, motorized, medium_armor, mechanized; vanilla tokens); `GER_Arm_02` 81; `GER_SS_04` 78; `GER_SS_05` 71; `GER_STUG_01` 66; `GER_MOT_02` 43; `GER_MEC_02` 43; `GER_MEC_01_MONARNCHIST` 40 (motorized, mechanized, armour); `GER_Arm_01` 36; `GER_MEC_01_COMMUNIST` 36; `GER_BRIG_01` 32.

| Template (line battalions) | Fascism today | Fascism after this plan | Other governments after this plan |
|---|---|---|---|
| infantry (+ any support line) | `GER_Inf_01` | `GER_Inf_01` | `GER_Inf_01` |
| motorized / mechanized / medium armour | **`GER_KAMPFGRUPPE_01`** | `GER_SS_01` (cross-file, see below) | mot.: `GER_MOT_02`; mech.: `GER_MONINF_01` (neutral/dem.) or `GER_MEC_02` (communist); armour: `GER_MONMOB_01` (neutral/dem.) or `GER_Arm_02` (communist) |
| light / heavy / modern armour only | **`GER_KAMPFGRUPPE_01`** | `GER_Arm_02` | as above |
| anti-air (towed, mot., SP) | none | `GER_FLAK_DIVISION_01` | same |
| artillery (towed, mot., SP) | none | `GER_PANZERARTILLERIE_DIVISION_01` | same |
| rocket artillery | none | new Werfer group | same |
| anti-tank, light/heavy/modern TD | none | new Panzerjäger group | same |
| medium TD (StuG) | none | `GER_STUG_01` | same |
| armoured car | none | new reconnaissance group | same |
| amphibious tanks / amph. mech. (optional) | none | new amphibious group | same |
| `marine_commando` | none | `GER_MEK_01` (typed `marine_commando` in step 2b; see Group design) | same |
| motorized or mechanized + medium TD | `GER_KAMPFGRUPPE_01` | `GER_SS_01` | **`GER_STUG_01` (66) beats `GER_MOT_02`/`GER_MEC_02` (43) for communist governments, and `GER_MOT_02` for neutral/democratic motorized ones** |
| panzer + SP art/AA/TD, mot. + mot. art/AA/AT | armour/mot. winner | armour/mot. winner | armour/mot. winner (each new or retyped specialist group stays below 43 names) |

- **Critical, existing: `GER_KAMPFGRUPPE_01` takes every mobile template.** Kampfgruppen are ad-hoc battlegroups, a list to choose, not a default. Fix: reduce its `division_types` to `infantry` only. `GER_Inf_01` (308, always available) then always outnumbers it, so it is never picked automatically and stays selectable in the designer for every template (NAM-026). A group cannot drop all its types: with none it matches every template (NAM-027). Saved templates keep it while `can_use` holds (always).
- **Cross-file consequence, out of this file's reach:** with Kampfgruppen out of the way, fascist Germany's motorized, mechanized and medium-armour templates fall to `GER_SS_01` (105), whose types come from vanilla and cannot be removed. Remedies sit in other files: grow the plain `GER_Arm_01`, `GER_MOT_01` and `GER_MEC_01` (GER file) past 105 with plain fallback-text entries on further numbers, as vanilla does for `GER_Inf_01`; or reduce `GER_SS_01` (GER_SS file; it is the group vanilla's focus tree scripts). Not in this batch. Decided: the GER-file plan (`docs/plans/2026-10-28-germany-audit.md`) grows the plain lists and ships before this one (ship order GER, GER_ADDITIONAL, GER_SS), so fascist mobile templates move from Kampfgruppen straight to the plain Heer lists and never land on `GER_SS_01`. Implementation step 0 checks it. If that plan lifts the plain motorized and mechanized lists above `GER_STUG_01` (66), it also cures the StuG mixed-template risk in the table.
- **Retypes (tags kept; existing templates keep their group, since types only steer the automatic pick):**
  - `GER_FLAK_DIVISION_01`: remove `infantry`; add `anti_air_brigade`, `mot_anti_air_brigade`, `light_sp_anti_air_brigade`, `medium_sp_anti_air_brigade`, `heavy_sp_anti_air_brigade`, `modern_sp_anti_air_brigade`. The Luftwaffe Flak divisions were towed and motorised flak; Flakpanzer units were Heer, but a pure SP anti-air template has no better German list.
  - `GER_STUG_01`: remove `light_armor`, `medium_armor`, `heavy_armor`, `modern_armor`; add `medium_tank_destroyer_brigade` (the StuG III and IV are casemate guns on medium chassis). It never won a tank template anyway (66 < 81/166).
  - `GER_PANZERARTILLERIE_DIVISION_01`: remove the four armour ids; add `artillery_brigade`, `mot_artillery_brigade`, `light_sp_artillery_brigade`, `medium_sp_artillery_brigade`, `heavy_sp_artillery_brigade`, `modern_sp_artillery_brigade`. Drop `can_use = { is_ai = no }`: the wiki gives its only reason as keeping AI Panzer divisions off artillery names while the group was typed as armour; without armour ids the AI's artillery templates should have these names too.
- **New groups** (all ungated, below 43 names so they never take a mixed motorized template):
  - Werfer (`rocket_artillery_brigade`, `mot_rocket_artillery_brigade`, `motorized_rocket_brigade`), fallback `Werfer-Brigade %d`: Werfer-Brigaden 1–9 on their numbers (1–4 and 7–9 became Volks-Werfer-Brigaden in late 1944; the list uses the first designation), Volks-Werfer-Brigaden 15–20, then regiments at keys 901+.
  - Panzerjäger (`anti_tank_brigade`, `mot_anti_tank_brigade`, `light_tank_destroyer_brigade`, `heavy_tank_destroyer_brigade`, `modern_tank_destroyer_brigade`), fallback `Panzerjäger-Abteilung %d` (divisional Panzerjäger battalions carried their division's number): the heavy army battalions on their numbers, the 1944–45 Panzerjagd-Brigaden at 901+. The split against `GER_STUG_01` is by HOI4 role: medium TD = StuG; everything else anti-tank = Panzerjäger. A template with medium and heavy TD goes to the StuG list (66 > ~15).
  - Reconnaissance (`armored_car`), fallback `Panzer-Aufklärungs-Abteilung %d` (divisional numbering like the Panzerjäger): a few named or notable battalions on their numbers.
  - Optional: naval commandos (`marine_commando`), fallback `Marine-Einsatzkommando %d`: MEKs on their numbers, K-Verband formations at 901+. Kept off `marine` so `GER_MAR_01` keeps marine templates.
  - Optional: amphibious (`amphibious_armor`, `amphibious_light_armor`, `amphibious_medium_armor`, `amphibious_heavy_armor`, `amphibious_mechanized`): the four Tauchpanzer battalions of 1940 and the two regiments formed from them. The fallback `Tauchpanzer-Abteilung %d` is extrapolated (the battalions were lettered, not numbered).
- **The three heavy tank destroyer entries** (`653`, `654`, `512`) in `GER_SCHWERE_PANZERABTEILUNG_01` (`schwere Panzerjäger-Abteilung %d`) and `_02` (`s.Pz.Jg.Abt. %d`): recommended to move to the Panzerjäger group (remove from both linked groups, add at the same keys there). They are tank destroyer battalions, and the new group lists the heavy TD id. A division holding 653/654/512 in the heavy panzer pool then shows the fallback `schwere Panzer-Abteilung 653` etc. Alternative: keep them in both places (duplicate names across two pools).
- **Optional depth for `GER_PANZERARTILLERIE_DIVISION_01`**: the Heeres-Artillerie-Brigaden that did not become a Volks-Artillerie-Korps already in the list: 70, 88, 140, 288, 732, 766, 777, 959 and leichte Heeres-Artillerie-Brigade 704 (16 → 25 names). 401–410 and 388 stay as the Volks-Artillerie-Korps they became.
- **Not proposed**: Heeres-Flakartillerie-Brigaden 501–510 and Marine-Flak-Brigaden I–V (verified) would lift `GER_FLAK_DIVISION_01` to 43+ and tie or beat `GER_MOT_02` for motorized + motorized anti-air templates under non-fascist governments. Revisit after the cross-file fix above.

### Group design (as batched)
- Tags (unique across the repository, checked 2026-10-28): `GER_PZJG_01` "Panzerjäger Battalions", `GER_AUFKL_01` "Reconnaissance Battalions", `GER_AMPH_01` "Amphibious Panzer Units" (placed after `GER_STUG_01` in that order), `GER_WERFER_01` "Rocket Artillery Brigades" (after `GER_PANZERARTILLERIE_DIVISION_01`), `GER_MEK_01` "Naval Commandos" (after `GER_BRIG_01`). All in section 1 except `GER_MEK_01`, which sits beside the Kriegsmarine brigades.
- Keys: numbered designations sit on their real numbers. Literal names (brigades, regiments, K-Verband formations) take the keys right above the highest real number of their group (Werfer 21–28, Panzerjäger 656–660, naval 91–98), so the fallback continues from there instead of jumping to 900+.
- `GER_WERFER_01` writes Werfer-Brigaden 1–9 as `Werfer-Brigade %d` (the fallback text) so new brigades take 1–9 before 15–20; this keeps PLACEHOLDER_ENTRIES, as on the other numbered series. `GER_MEK_01` does the same for its MEK numbers.
- `GER_AMPH_01`: `Panzer-Abteilung A`–`D` are the four Tauchpanzer battalions of July 1940; Panzer-Regiment 18 (18. Panzer-Division, Bug crossing June 1941) and Panzer-Regiment 28 were formed from them. `Tauchpanzer-Abteilung %d` is an extrapolated fallback.
- `GER_AMPH_01` types: `amphibious_armor` and `amphibious_mechanized` only. The game (1.19.4, `common/units/amphibious_armor.txt`) also defines `amphibious_light_armor`, `amphibious_medium_armor` and `amphibious_heavy_armor`, which the batch could not add while `-EditNames` refused them. The whitelist was fixed on 2026-10-28 (`docs/plans/2026-10-28-validation-tooling.md`), and step 2b adds the three.
- `GER_MEK_01` types: the batch wrote `marine` because `-EditNames` refused `marine_commando` at the time; step 2b replaces it with `marine_commando` (whitelist fixed on 2026-10-28). No other German group lists `marine_commando`, so a pure naval commando template takes `GER_MEK_01` automatically; a template that also carries `marine` battalions keeps `GER_MAR_01` (37 names against 20; `GER_MONINF_01` 209 for neutral/democratic). Check it with `-PickTable GER -PickTypes 'marine_commando'` and `-PickTypes 'marine; marine_commando'` after step 2b.
- `GER_AUFKL_01` stays at three authored entries: divisional reconnaissance battalions carried their division's number, which the fallback gives; only named or famous ones are written.
- Section headers that lose their heavy tank destroyers in `GER_SCHWERE_PANZERABTEILUNG_01`/`_02` are renamed to `Historical: redesignations of 1945 and the radio-control battalion`.
- Group comments (R2) are rewritten where the typing changes (`GER_STUG_01`, `GER_PANZERARTILLERIE_DIVISION_01`, `GER_FLAK_DIVISION_01`, `GER_KAMPFGRUPPE_01`), and the file header gains a "Division types" paragraph.

### Existing flags
- PLACEHOLDER_ENTRIES (12 groups): `GER_SCHWERE_PANZERABTEILUNG_01`/`_02`, `GER_ARM_03`, `GER_STUG_01`, `GER_RESERVE_DIVISION_01`, `GER_VOLKSGRENADIER_01`, `GER_LUFTWAFFEN_FELD_DIVISION_01`, `GER_FLAK_DIVISION_01`, `GER_PEN_01`, `GER_STURM_01`, `GER_MONRES_01`, `GER_LANDWEHR_01`. All are numbered series on real (WWII, or WWI for the imperial lists) numbers whose units carried no names. Keep.
- LOW_DEPTH: `GER_LUFTWAFFEN_FELD_DIVISION_01` holds all 21 Luftwaffen-Feld-Divisionen plus Division Meindl; `GER_PEN_01` covers the 500-series and 999 units. Complete; keep.
- POLITICAL_ENTRY: `GER_VOLKSGRENADIER_01` key 78 `%d. Volks-Sturm-Division`. The lint reads "Sturm" as militia vocabulary. The designation itself is not attested in the sources checked (the 78th went Sturm-Division → 78. Volksgrenadier-Division, formerly the 543rd). Recommended: `set` key 78 to `%d. Volksgrenadier-Division` (verified) and fix the wiki line that leads with it; or keep pending author confirmation.

## Verified formations & commanders
Only entries this plan adds or re-checks; the rest of the file was verified in the 2026-10-25 audit (docs/plans/archive/2026-10-25-germany-additional-audit.md).
- Werfer-Brigade 1–9; Volks-Werfer-Brigade 1–4, 7–9 (redesignations), 15–20; Stellungs-Werfer-Brigade 300: Wikipedia: List of German brigades in WWII.
- Werfer-Regiment 53 (under Werfer-Brigade 4): TracesOfWar: Scherer, Albrecht. Werfer-Regiment 71 (Medenine, March 1943), Stellungs-Werfer-Regiment 101, Werfer-Regiment 83 and 84 (Werfer-Brigade 7): search snippets (secondary). Nebelwerfer-Regiment 54 (formed Posen 1941; designation Werfer-Regiment 54 after the 1942 rename): Czech photo caption (secondary). Nebel-Lehr-Regiment (its I. Abteilung used the 10 cm Nebelwerfer 40): Wikipedia: 10 cm Nebelwerfer 40 (search snippet).
- 78. Volksgrenadier-Division (formerly the 543rd, raised after the 78. Sturm-Division was destroyed near Minsk in July 1944): Wikipedia: 78th Infantry Division (Wehrmacht).
- Heeres-Panzerjagd-Brigade 1, 2; Panzerjagd-Brigade 104; Panzerjagd-Brigade West; Panzerjäger-Brigade Oberschlesien: Wikipedia: List of German brigades in WWII. (Also listed there: Panzerjagd-Brigade Feldherrnhalle and Freie Ukraine, left out: party and foreign-volunteer names in an ungated list.)
- schwere Panzerjäger-Abteilung 88, 93, 519, 525, 559, 560, 653, 654, 655, 512: Wikipedia: Nashorn (88, 93, 519, 525, 560, 655); Battlefront forum list (559, 560, 655, 512, 519, 93, 653, 654); Wikipedia: 512th Heavy Panzerjäger Battalion; feldgrau.net (525, 560, 519).
- Heeres-Artillerie-Brigade 70, 88, 140, 288, 732, 766, 777, 959; leichte Heeres-Artillerie-Brigade 704: Wikipedia: List of German brigades in WWII.
- Panzer-Aufklärungs-Lehr-Abteilung 130: Wikipedia: Panzer Lehr Division. Aufklärungs-Abteilung 3 (mot.) (5. leichte Division, Afrika 1941, von Wechmar): rommelsriposte.com DAK war diary. Panzer-Aufklärungs-Abteilung 2 (2. Panzer-Division): Wikipedia: Aufklärungsabteilung. Aufklärungs-Abteilung 33 (15. Panzer-Division, Afrika): well documented.
- Marine-Einsatzkommando 20, 30, 35, 40, 60, 65, 70, 71, 75, 80, 85, 90: warhistory.org: The MEKs I/II. 1., 3., 4., 5. K-Division; K-Regiment (mot.): axishistory.com: Kommando der Kleinkampfverbände. Lehrkommando 600: search snippet (K-Verband training of the assault boat flotillas). Küstenjäger-Abteilung 'Brandenburg': secondary (bookseller blurb and Brandenburger history pages).
- Panzer-Abteilung A, B, C, D (Tauchpanzer, 1940); Panzer-Regiment 18 and Panzer-Regiment 28 formed from them: esut.de; military-history.fandom: 18th Panzer Division.
- Heeres-Flakartillerie-Brigade 501–510; Marine-Flak-Brigade I–V: Wikipedia: List of German brigades in WWII (not proposed for the batch).

## Author confirmation
- Lehrkommando 700 (Kampfschwimmer training detachment, from the Küstenjäger-Abteilung Brandenburg): bookseller description only.
- Aufklärungs-Abteilung 33 (mot.) (15. Panzer-Division, Afrika): the second DAK reconnaissance battalion beside AA 3; no page fetched for it.
- Fallback `Tauchpanzer-Abteilung %d` (amphibious group): extrapolated designation; the 1940 battalions were lettered A–D.
- Left out, not in the batch: K-Flottille 361 (one forum mention, UNVERIFIED). Replaced by the batch: `%d. Volks-Sturm-Division` at key 78 (UNVERIFIED; decision 4).

## Kept on judgment
Expected after the batch (dry run: `Flags: PLACEHOLDER_ENTRIES x12, LOW_DEPTH x3, IDENTITY_REPEAT x1`; per group confirmed on a scratch copy):
- PLACEHOLDER_ENTRIES (12): `GER_SCHWERE_PANZERABTEILUNG_01`, `GER_SCHWERE_PANZERABTEILUNG_02`, `GER_ARM_03`, `GER_STUG_01`, `GER_RESERVE_DIVISION_01`, `GER_LUFTWAFFEN_FELD_DIVISION_01`, `GER_FLAK_DIVISION_01`, `GER_MEK_01`, `GER_PEN_01`, `GER_STURM_01`, `GER_MONRES_01`, `GER_LANDWEHR_01`. Historical numbered series whose units carried no names (WWI numbers for the imperial lists; the MEKs on their real numbers). `GER_VOLKSGRENADIER_01` no longer carries the flag after key 78 changes.
- LOW_DEPTH (3): `GER_LUFTWAFFEN_FELD_DIVISION_01` and `GER_PEN_01` (complete historical series), `GER_AMPH_01` (four Tauchpanzer battalions and two regiments are all there were).
- IDENTITY_REPEAT (file): Gau and city names shared between militia, Volkssturm, Flak and Festung lists by design.
- Gone after the batch: POLITICAL_ENTRY on `GER_VOLKSGRENADIER_01` (key 78 replaced).

## Implementation steps
- [x] 0. Precondition: the GER plan ships first. Run `Select-String -Path docs/plans/*-germany-audit.md -Pattern '^Status:'` and `Get-ChildItem docs/plans/archive -Filter '*-germany-audit.md' | Select-Object Name`. Expect no line from the first command (or only `Status: DONE`) and, in the archive listing, a germany-audit plan dated 2026-10-28 or later (the older `2026-10-17-germany-audit.md` does not count). Otherwise stop: the GER plan must be DONE and archived before this batch is applied.
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GER_ADDITIONAL -Batch docs/plans/2026-10-28-germany-additional-audit.md`. Expect one green line per operation (13), `[WARN]` none, no `[ERROR]`.
- [x] 2. First `-SyncWiki GER_ADDITIONAL` already run (2026-10-28): it updated the rows of `GER_STUG_01`, `GER_PANZERARTILLERIE_DIVISION_01`, `GER_FLAK_DIVISION_01` and `GER_KAMPFGRUPPE_01`, added the rows of `GER_PZJG_01`, `GER_AUFKL_01`, `GER_AMPH_01`, `GER_WERFER_01` and `GER_MEK_01` itself at the positions W3–W5 give, and set the Home.md count to 30; the `GER_SCHWERE_PANZERABTEILUNG_01`/`_02` rows needed no change. Do not run it again before the hand edits. Make the edits under "Docs payload" W1, W2, W6–W12, then G1–G2 (W3–W5 are done), and run `powershell -File .\build.ps1 -SyncWiki GER_ADDITIONAL` once more: expect no group without a row.
- [x] 2b. Types the whitelist accepts since 2026-10-28 (`docs/plans/2026-10-28-validation-tooling.md`), one command each:
  - `powershell -File .\build.ps1 -EditNames GER_ADDITIONAL -Group AMPH_01 -AddType 'amphibious_light_armor; amphibious_medium_armor; amphibious_heavy_armor'`. Expect `Edited GER_AMPH_01: +0 -0 ~0 [+Types: amphibious_light_armor, amphibious_medium_armor, amphibious_heavy_armor]`.
  - `powershell -File .\build.ps1 -EditNames GER_ADDITIONAL -Group MEK_01 -AddType 'marine_commando' -RemoveType 'marine'`. Expect `Edited GER_MEK_01: +0 -0 ~0 [+Types: marine_commando; -Types: marine]`.
  - `powershell -File .\build.ps1 -SyncWiki GER_ADDITIONAL`. Expect `Germany-Additional.md: 2 row(s) updated` for `GER_AMPH_01` and `GER_MEK_01`, and no group without a row. If it reports a prose line that names the old types, fix that line with the Edit tool.
  - `powershell -File .\build.ps1 -PickTable GER -PickTypes 'marine_commando'`. Expect `GER_MEK_01 20` for every government.
- [x] 3. `powershell -File .\build.ps1 -Check GER_ADDITIONAL`. Expect `Check passed`; remaining flags must match "Kept on judgment". The `[b]Germany[/b]` block must report 2 bullets, 2 examples and at most 450 chars.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 5. Ship, on the user's word: commit with the message `Retype GER_ADDITIONAL support-arm namelists and add Panzerjäger, Werfer, reconnaissance, amphibious and naval commando groups`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Retype GER_ADDITIONAL support-arm namelists and add Panzerjäger, Werfer, reconnaissance, amphibious and naval commando groups"`.

## Docs payload
README.md: no change (no file added or removed).

### wiki/Germany-Additional.md
Rows of existing groups are updated by `-SyncWiki`; everything below is by hand, after the first `-SyncWiki`.

**W1.** Replace
```
- **Numbered series:** heavy tank battalions, Panzer and Sturmgeschütz brigades, Reserve, Volksgrenadier and Grenadier divisions, Luftwaffe field and Flak divisions.
```
with
```
- **Numbered series:** heavy tank battalions, Panzer and Sturmgeschütz brigades, Reserve, Volksgrenadier and Grenadier divisions, Luftwaffe field and Flak divisions.
- **Support arms:** Panzerjäger battalions, armoured reconnaissance battalions, artillery divisions and Werfer brigades, the amphibious Tauchpanzer battalions of 1940 and the Kriegsmarine's naval commandos.
```

**W2.** Replace
```
Reserve, Volksgrenadier and Grenadier divisions share the Heer numbering (`GER_Inf_01`) and sit on their real numbers. All other groups run their own series.
```
with
```
Reserve, Volksgrenadier and Grenadier divisions share the Heer numbering (`GER_Inf_01`) and sit on their real numbers. All other groups run their own series.

The support-arm groups list only the line battalions of their arm (anti-air, artillery, rocket artillery, anti-tank and tank destroyers, armoured cars, amphibious units, naval commandos), so a template built from those battalions takes the matching list on its own, while Panzer, motorized and infantry templates keep their main lists. Kampfgruppen list only infantry and are chosen by hand in the division designer.
```

**W3–W5: done by the first `-SyncWiki` (rows already present with this text); skip.**

**W3.** Insert these three rows directly after the row that starts `` | `GER_STUG_01` ``:
```
| `GER_PZJG_01` | Panzerjäger Battalions | anti_tank_brigade, mot_anti_tank_brigade, light_tank_destroyer_brigade, heavy_tank_destroyer_brigade, modern_tank_destroyer_brigade | `Panzerjäger-Abteilung %d` |
| `GER_AUFKL_01` | Reconnaissance Battalions | armored_car | `Panzer-Aufklärungs-Abteilung %d` |
| `GER_AMPH_01` | Amphibious Panzer Units | amphibious_armor, amphibious_mechanized | `Tauchpanzer-Abteilung %d` |
```

**W4.** Insert this row directly after the row that starts `` | `GER_PANZERARTILLERIE_DIVISION_01` ``:
```
| `GER_WERFER_01` | Rocket Artillery Brigades | rocket_artillery_brigade, mot_rocket_artillery_brigade, motorized_rocket_brigade | `Werfer-Brigade %d` |
```

**W5.** Insert this row directly after the row that starts `` | `GER_BRIG_01` ``:
```
| `GER_MEK_01` | Naval Commandos | marine | `Marine-Einsatzkommando %d` |
```
(If `-SyncWiki` rewrites the division types of a new row in another order, keep its version.)

**W6.** Replace
```
> **Note:** `GER_PANZERARTILLERIE_DIVISION_01` uses `can_use = { is_ai = no }`, so only human players can use it. The group is typed as armour, and the gate keeps the game from giving AI Panzer divisions artillery names.
```
with
```
> **Note:** `GER_KAMPFGRUPPE_01` is typed as infantry only. The Heer infantry list (`GER_Inf_01`) always has more names, so the game never gives a new template Kampfgruppe names on its own; choose the list in the division designer.
```

**W7.** Replace
```
The Tiger battalions *schwere Panzer-Abteilung 501–510* and their 1945 renumberings (511, 424). Also the radio-control battalion *(Fkl) 301* and the heavy tank destroyer battalions *653*, *654* and *512*. The second group gives the abbreviated forms (*s.Pz.Abt. 501*, *s.Pz.Jg.Abt. 653*).
```
with
```
The Tiger battalions *schwere Panzer-Abteilung 501–510* and their 1945 renumberings (511, 424), and the radio-control battalion *(Fkl) 301*. The second group gives the abbreviated forms (*s.Pz.Abt. 501*). The heavy tank destroyer battalions are in `GER_PZJG_01`.
```

**W8.** Insert directly after the paragraph under `` ### `GER_STUG_01` — Assault Gun Brigades `` (the line that ends `...and the *Sturmpanzer-Abteilungen 216–219*.`), with one blank line before each heading:
```
Typed as medium tank destroyers (StuG III and IV); the other tank destroyer and anti-tank battalions are in `GER_PZJG_01`.

### `GER_PZJG_01` — Panzerjäger Battalions
The heavy army Panzerjäger battalions on their real numbers: *schwere Panzerjäger-Abteilung 653* and *654* (Elefant), *512* (Jagdtiger), and the Nashorn and Jagdpanther battalions *88*, *93*, *519*, *525*, *559*, *560* and *655*. Then the Panzerjagd-Brigaden of 1944–45 (*Heeres-Panzerjagd-Brigade 1* and *2*, *Panzerjagd-Brigade 104*, *West*, *Panzerjäger-Brigade Oberschlesien*). Overflow uses the divisional *Panzerjäger-Abteilung*. For anti-tank and light, heavy and modern tank destroyer templates.

### `GER_AUFKL_01` — Reconnaissance Battalions
For armoured-car templates: *Aufklärungs-Abteilung 3 (mot.)* and *33 (mot.)* of the Afrikakorps and the *Panzer-Aufklärungs-Lehr-Abteilung 130* of the Panzer-Lehr-Division. Overflow uses the divisional *Panzer-Aufklärungs-Abteilung*.

### `GER_AMPH_01` — Amphibious Panzer Units
The four submersible battalions raised in July 1940 for Operation Seelöwe (*Panzer-Abteilung A*–*D*) and the two regiments formed from them, *Panzer-Regiment 18*, which crossed the Bug submerged in June 1941, and *Panzer-Regiment 28*. Overflow uses *Tauchpanzer-Abteilung*, an extrapolated designation.
```
(The first line joins the StuG paragraph as its own paragraph; it does not replace it.)

**W9.** Replace
```
Players only. Covers the *18. Artillerie-Division*, the *Artillerie-Divisionen 309–312* and the *Volks-Artillerie-Korps* of 1944–45.
```
with
```
For artillery and self-propelled artillery templates. Covers the *18. Artillerie-Division*, the *Artillerie-Divisionen 309–312*, the *Volks-Artillerie-Korps* of 1944–45 and further *Heeres-Artillerie-Brigaden* (*70*, *88*, *140*, *288*, *704*, *732*, *766*, *777*, *959*).

### `GER_WERFER_01` — Rocket Artillery Brigades
The *Werfer-Brigaden 1–9* (most renamed Volks-Werfer-Brigaden in late 1944) and the *Volks-Werfer-Brigaden 15–20*, then the *Werfer-Regimenter 53*, *54*, *71*, *83* and *84*, *Stellungs-Werfer-Regiment 101*, *Stellungs-Werfer-Brigade 300* and the *Nebel-Lehr-Regiment*. For rocket artillery templates.
```

**W10.** Replace
```
The Volksgrenadier divisions in raising order, led by the *78. Volks-Sturm-Division*. The Grenadier list holds the 29th- and 30th-wave *Grenadier-Divisionen 541–562*, which became Volksgrenadier divisions after July 1944.
```
with
```
The Volksgrenadier divisions in raising order, led by the *78. Volksgrenadier-Division*. The Grenadier list holds the 29th- and 30th-wave *Grenadier-Divisionen 541–562*, which became Volksgrenadier divisions after July 1944.
```

**W11.** Replace
```
*1.–31. Flak-Division* and the two Flakscheinwerfer divisions. A home is noted where verified (*1. 'Berlin'*, *3. 'Hamburg'*, *7. 'Köln'*, *26. 'München'*, *29. 'Oslo'*), and *9. 'Stalingrad'* marks the division destroyed there.
```
with
```
*1.–31. Flak-Division* and the two Flakscheinwerfer divisions. A home is noted where verified (*1. 'Berlin'*, *3. 'Hamburg'*, *7. 'Köln'*, *26. 'München'*, *29. 'Oslo'*), and *9. 'Stalingrad'* marks the division destroyed there. For towed, motorized and self-propelled anti-air templates.
```

**W12.** Replace
```
About 170 Kampfgruppen named after Heer commanders. They include historical ones such as *Kampfgruppe Chill* and *Kampfgruppe Scherer*. Waffen-SS Kampfgruppen are in the SS file.
```
with
```
About 170 Kampfgruppen named after Heer commanders. They include historical ones such as *Kampfgruppe Chill* and *Kampfgruppe Scherer*. Waffen-SS Kampfgruppen are in the SS file. Typed as infantry only, so the list is chosen by hand.
```
Then insert directly before the heading `` ### `GER_PEN_01` — Penal Units `` (after the line `` Armoured brigades are in `GER_ARM_03`, fortress brigades in `GER_FORT_01`. `` and its blank line):
```
### `GER_MEK_01` — Naval Commandos
For naval commando templates: the *Küstenjäger-Abteilung 'Brandenburg'*, the *Marine-Einsatzkommandos* of the Kriegsmarine's Kleinkampfverbände (*20*–*90*), the K-Verband's *Lehrkommandos 600* and *700*, the *1.*, *3.*, *4.* and *5. K-Division* and the *K-Regiment (mot.)*.

```

### WORKSHOP_DESCRIPTION_GUIDELINES.md
**G1.** In the table row that starts `` | `zz_INEX_GER_ADDITIONAL_names_divisions.txt` ``, replace
```
Included (Heavy battalions, Panzer, infantry & Sturmgeschütz brigades, Volksgrenadier/Reserve/Grenadier series,
```
with
```
Included (Heavy battalions, Panzer, infantry & Sturmgeschütz brigades, Panzerjäger, reconnaissance, artillery & Werfer units, Tauchpanzer, naval commandos, Volksgrenadier/Reserve/Grenadier series,
```

**G2.** In the `[b]Germany[/b]` block, replace
```
Luftwaffe field and Flak, heavy battalions and penal units
```
with
```
Luftwaffe field and Flak, heavy, StuG, Werfer and Panzerjäger units, penal units
```
(422 + 22 = 444 of 450 characters; `-Check` prints the count.)

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (planner fork, 2026-10-28; the proofreader could not be dispatched from a fork):
- Every added or changed name is in "Verified formations & commanders" or "Author confirmation": PZJG 15/15, AUFKL 3/3 (AA 33 under Author confirmation), AMPH 6/6, PANZERARTILLERIE 9/9, WERFER 23/23, MEK 20/20 (Lehrkommando 700 under Author confirmation), VOLKSGRENADIER key 78. Result: pass.
- Extrapolated names: only the `GER_AMPH_01` fallback `Tauchpanzer-Abteilung %d`, named in the Rationale and in the group comment. The other new fallbacks (`Panzerjäger-Abteilung %d`, `Panzer-Aufklärungs-Abteilung %d`, `Werfer-Brigade %d`, `Marine-Einsatzkommando %d`) are real designation patterns; numbers beyond the historical ones come from the fallback as in every group.
- Orthography checked by hand: `schwere` lower case in designations (as in the file's existing entries), `Küstenjäger`, `Aufklärungs`, `Panzerjäger`, `(mot.)`, `Heeres-` prefixes hyphenated.
- The batch adds 77 German entries (56 not equal to their group's fallback): above the 25-name threshold, so the coordinating session dispatches `inex-proofreader` before implementation and records its findings here.

Proofreader (`inex-proofreader`, 2026-10-28, dispatched by the coordinating session): no errors found. Findings and what was done:
- `GER_AMPH_01` Panzer-Regiment 28: confirmed (Tauchpanzer-Abteilungen C and D went to Pz.Rgt 28 of the 18. Panzer-Division, disbanded March 1941). No change.
- `GER_PZJG_01` Heeres-Panzerjagd-Brigade 1 and 2, Panzerjagd-Brigade 104, Panzerjagd-Brigade West, Panzerjäger-Brigade Oberschlesien: the proofreader could not place them and suggested "Panzerjagd-Brigade Oberschlesien". The coordinating session checked the planner's source: Wikipedia, "List of German brigades in World War II", lists all five exactly as written here, including the "Heeres-" prefix and "Panzerjäger-Brigade Oberschlesien". Kept as written. No change.
- `GER_MEK_01` K-Regiment (mot.): the proofreader could not place it. axishistory.com, "Kommando der Kleinkampfverbände", lists "K-Regiment (mot.)" among the command's units. No change.
- 1., 3., 4. and 5. K-Division and Lehrkommando 600: confirmed (axishistory.com). Lehrkommando 700 stays under Author confirmation.
- Everything else (heavy Panzerjäger battalions, Werfer entries, Heeres-Artillerie-Brigaden, Aufklärungs-Abteilungen, MEK numbers, key 78): no issues found.

## Outcome
Date: 2026-10-28.

`-Check GER_ADDITIONAL`: Validate OK; Tests 521 passed, 0 failed, 0 skipped; `AUDIT SUMMARY GER_ADDITIONAL: GROUPS=30 AUTHORED=701/1057 FLAGS=16`; `Flags: PLACEHOLDER_ENTRIES x12, LOW_DEPTH x3, IDENTITY_REPEAT x1`, all listed under "Kept on judgment"; no `Docs:` warning; diff vs HEAD 12 group(s) changed, +76 -7 name(s); `Check passed`.

Deviations: none from the plan's commands or text. Observations, no change made: the `-PickTable GER -PickTypes 'marine_commando'` output printed one line (`marine_commando: GER_MEK_01 20`) with no per-government breakdown, taken as uniform across governments; `-Check` prints no character count, so the `[b]Germany[/b]` block was counted by hand at 444 characters (2 bullets, 2 examples).

## Edit batch
Applied by `build.ps1 -EditNames GER_ADDITIONAL -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{ "header": "# Division template historical names system for Germany (GER): additional formations.\n# Immersive Namelists Expanded (INEX)\n#\n# Numbered series, specialised units, garrisons and fortresses, Kampfgruppen, militias, foreign\n# legions and the Imperial series. Period German spelling and 1939-45 exonyms (Reval, Wilna, Kiew,\n# Charkow); identities appended to a designation go in single quotes, historical proper names do not.\n#\n# Numbering: Reserve, Volksgrenadier and Grenadier divisions link to GER_Inf_01 and sit on their\n# real numbers (one Heer number series). Luftwaffe field divisions, Flak divisions, battalions,\n# brigades, garrisons, militias and the Imperial lists run their own series.\n#\n# Division types: the support-arm lists (StuG, Panzerjäger, reconnaissance, amphibious, artillery,\n# Werfer, Flak, naval commandos) list only their arm's line battalions, and Kampfgruppen list only\n# infantry, so the automatic choice keeps Panzer, motorized and infantry templates on their main lists.\n#\n# Ideology gating: Volkssturm, SA and foreign legions are fascist-only; Freikorps (neutrality),\n# Reichsbanner (democratic) and Red Front Fighters (communism) cover the other paths. The Imperial\n# Sturm-Bataillone, Reserve and Landwehr divisions serve neutrality and democratic governments.\n# Overrides vanilla GER_PEN_01, GER_MIL_01, GER_MIL_02 and GER_MIL_03 (all created by vanilla focuses)." }
```

```json batch
{ "group": "KAMPFGRUPPE_01",
  "removeType": ["motorized", "mechanized", "light_armor", "medium_armor", "heavy_armor"],
  "comment": "# Heer commanders only; Waffen-SS Kampfgruppen are in the SS file.\n# Typed as infantry only: GER_Inf_01 is always larger, so the automatic choice never picks this list; choose it in the division designer." }
```

```json batch
{ "group": "SCHWERE_PANZERABTEILUNG_01",
  "remove": ["653", "654", "512"],
  "renameSection": ["Historical: redesignations of 1945, the radio-control battalion and heavy tank destroyers=Historical: redesignations of 1945 and the radio-control battalion"] }
```

```json batch
{ "group": "SCHWERE_PANZERABTEILUNG_02",
  "remove": ["653", "654", "512"],
  "renameSection": ["Historical: redesignations of 1945, the radio-control battalion and heavy tank destroyers=Historical: redesignations of 1945 and the radio-control battalion"] }
```

```json batch
{ "group": "STUG_01",
  "addType": ["medium_tank_destroyer_brigade"],
  "removeType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "comment": "# Sturmartillerie: the Heer's independent Sturmgeschütz-Abteilungen, renamed Brigaden on 14 February 1944 (battalion strength). Real numbers, own number series.\n# Typed as medium tank destroyers (StuG III and IV); other tank destroyers and anti-tank units are in GER_PZJG_01." }
```

```json batch
{ "addGroup": true, "group": "PZJG_01", "selector": "Panzerjäger Battalions", "after": "STUG_01",
  "addType": ["anti_tank_brigade", "mot_anti_tank_brigade", "light_tank_destroyer_brigade", "heavy_tank_destroyer_brigade", "modern_tank_destroyer_brigade"],
  "fallback": "Panzerjäger-Abteilung %d",
  "comment": "# Heer anti-tank and tank destroyer units: the heavy army battalions on their real numbers, then the Panzerjagd-Brigaden of 1944-45; own number series.\n# Medium tank destroyers (StuG) are in GER_STUG_01.",
  "add": [
    "# Historical: heavy army Panzerjäger battalions (Elefant, Jagdtiger, Nashorn, Jagdpanther)",
    "653=schwere Panzerjäger-Abteilung %d",
    "654=schwere Panzerjäger-Abteilung %d",
    "512=schwere Panzerjäger-Abteilung %d",
    "88=schwere Panzerjäger-Abteilung %d",
    "93=schwere Panzerjäger-Abteilung %d",
    "519=schwere Panzerjäger-Abteilung %d",
    "525=schwere Panzerjäger-Abteilung %d",
    "559=schwere Panzerjäger-Abteilung %d",
    "560=schwere Panzerjäger-Abteilung %d",
    "655=schwere Panzerjäger-Abteilung %d",
    "# Historical: Panzerjagd-Brigaden of 1944-45",
    "656=Heeres-Panzerjagd-Brigade 1",
    "657=Heeres-Panzerjagd-Brigade 2",
    "658=Panzerjagd-Brigade 104",
    "659=Panzerjagd-Brigade West",
    "660=Panzerjäger-Brigade Oberschlesien"
  ] }
```

```json batch
{ "addGroup": true, "group": "AUFKL_01", "selector": "Reconnaissance Battalions", "after": "PZJG_01",
  "addType": ["armored_car"],
  "fallback": "Panzer-Aufklärungs-Abteilung %d",
  "comment": "# Armoured-car reconnaissance battalions; divisional numbering, own number series.",
  "add": [
    "# Historical: the Afrikakorps reconnaissance battalions and the Panzer-Lehr battalion",
    "3=Aufklärungs-Abteilung %d (mot.)",
    "33=Aufklärungs-Abteilung %d (mot.)",
    "130=Panzer-Aufklärungs-Lehr-Abteilung %d"
  ] }
```

```json batch
{ "addGroup": true, "group": "AMPH_01", "selector": "Amphibious Panzer Units", "after": "AUFKL_01",
  "addType": ["amphibious_armor", "amphibious_mechanized"],
  "fallback": "Tauchpanzer-Abteilung %d",
  "comment": "# The submersible Tauchpanzer battalions raised for Operation Seelöwe (July 1940) and the regiments formed from them;\n# own number series. The numbered fallback is extrapolated: the battalions were lettered A-D.",
  "add": [
    "# Historical: Tauchpanzer battalions of 1940 and their regiments",
    "1=Panzer-Abteilung A",
    "2=Panzer-Abteilung B",
    "3=Panzer-Abteilung C",
    "4=Panzer-Abteilung D",
    "5=Panzer-Regiment 18",
    "6=Panzer-Regiment 28"
  ] }
```

```json batch
{ "group": "PANZERARTILLERIE_DIVISION_01",
  "addType": ["artillery_brigade", "mot_artillery_brigade", "light_sp_artillery_brigade", "medium_sp_artillery_brigade", "heavy_sp_artillery_brigade", "modern_sp_artillery_brigade"],
  "removeType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "canUse": "always = yes",
  "comment": "# Artillery and self-propelled artillery templates: Heer artillery divisions, Volks-Artillerie-Korps and\n# Heeres-Artillerie-Brigaden; own number series.",
  "add": [
    "# Historical: Heeres-Artillerie-Brigaden of 1942-45",
    "70=Heeres-Artillerie-Brigade %d",
    "88=Heeres-Artillerie-Brigade %d",
    "140=Heeres-Artillerie-Brigade %d",
    "288=Heeres-Artillerie-Brigade %d",
    "704=leichte Heeres-Artillerie-Brigade %d",
    "732=Heeres-Artillerie-Brigade %d",
    "766=Heeres-Artillerie-Brigade %d",
    "777=Heeres-Artillerie-Brigade %d",
    "959=Heeres-Artillerie-Brigade %d"
  ] }
```

```json batch
{ "addGroup": true, "group": "WERFER_01", "selector": "Rocket Artillery Brigades", "after": "PANZERARTILLERIE_DIVISION_01",
  "addType": ["rocket_artillery_brigade", "mot_rocket_artillery_brigade", "motorized_rocket_brigade"],
  "fallback": "Werfer-Brigade %d",
  "comment": "# Nebel- and Werfertruppe: Werfer-Brigaden on their real numbers, then the Werfer regiments; own number series.",
  "add": [
    "# Historical: Werfer-Brigaden 1-9 (1-4 and 7-9 renamed Volks-Werfer-Brigaden in late 1944)",
    "1=Werfer-Brigade %d",
    "2=Werfer-Brigade %d",
    "3=Werfer-Brigade %d",
    "4=Werfer-Brigade %d",
    "5=Werfer-Brigade %d",
    "6=Werfer-Brigade %d",
    "7=Werfer-Brigade %d",
    "8=Werfer-Brigade %d",
    "9=Werfer-Brigade %d",
    "# Historical: Volks-Werfer-Brigaden raised in late 1944",
    "15=Volks-Werfer-Brigade %d",
    "16=Volks-Werfer-Brigade %d",
    "17=Volks-Werfer-Brigade %d",
    "18=Volks-Werfer-Brigade %d",
    "19=Volks-Werfer-Brigade %d",
    "20=Volks-Werfer-Brigade %d",
    "# Historical: Werfer regiments and the Stellungs-Werfer units",
    "21=Werfer-Regiment 53",
    "22=Werfer-Regiment 54",
    "23=Werfer-Regiment 71",
    "24=Werfer-Regiment 83",
    "25=Werfer-Regiment 84",
    "26=Stellungs-Werfer-Regiment 101",
    "27=Stellungs-Werfer-Brigade 300",
    "28=Nebel-Lehr-Regiment"
  ] }
```

```json batch
{ "group": "VOLKSGRENADIER_01",
  "set": ["78=%d. Volksgrenadier-Division"] }
```

```json batch
{ "group": "FLAK_DIVISION_01",
  "addType": ["anti_air_brigade", "mot_anti_air_brigade", "light_sp_anti_air_brigade", "medium_sp_anti_air_brigade", "heavy_sp_anti_air_brigade", "modern_sp_anti_air_brigade"],
  "removeType": ["infantry"],
  "comment": "# Luftwaffe Flak divisions for towed, motorized and self-propelled anti-air templates; own number series." }
```

```json batch
{ "addGroup": true, "group": "MEK_01", "selector": "Naval Commandos", "after": "BRIG_01",
  "addType": ["marine"],
  "fallback": "Marine-Einsatzkommando %d",
  "comment": "# Kriegsmarine Kleinkampfverbände (K-Verband, 1944-45) and the Brandenburg coastal raiders; MEKs on their real numbers, own number series.",
  "add": [
    "# Historical: the Brandenburg coastal raiders",
    "91=Küstenjäger-Abteilung 'Brandenburg'",
    "# Historical: Marine-Einsatzkommandos of the K-Verband",
    "20=Marine-Einsatzkommando %d",
    "30=Marine-Einsatzkommando %d",
    "35=Marine-Einsatzkommando %d",
    "40=Marine-Einsatzkommando %d",
    "60=Marine-Einsatzkommando %d",
    "65=Marine-Einsatzkommando %d",
    "70=Marine-Einsatzkommando %d",
    "71=Marine-Einsatzkommando %d",
    "75=Marine-Einsatzkommando %d",
    "80=Marine-Einsatzkommando %d",
    "85=Marine-Einsatzkommando %d",
    "90=Marine-Einsatzkommando %d",
    "# Historical: K-Verband training detachments and commands",
    "92=Lehrkommando 600",
    "93=Lehrkommando 700",
    "94=1. K-Division",
    "95=3. K-Division",
    "96=4. K-Division",
    "97=5. K-Division",
    "98=K-Regiment (mot.)"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| GER_SCHWERE_PANZERABTEILUNG_01 | 16 -> 13 | - | schwere Panzerjäger-Abteilung %d (x3) (to GER_PZJG_01) | - |
| GER_SCHWERE_PANZERABTEILUNG_02 | 16 -> 13 | - | s.Pz.Jg.Abt. %d (x3) | - |
| GER_STUG_01 | 66 -> 66 | - | - | division_types: [light_armor medium_armor heavy_armor modern_armor] -> [medium_tank_destroyer_brigade] |
| GER_PANZERARTILLERIE_DIVISION_01 | 16 -> 25 | Heeres-Artillerie-Brigade %d (x8), leichte Heeres-Artillerie-Brigade %d | - | division_types: [heavy_armor medium_armor light_armor modern_armor] -> [artillery_brigade mot_artillery_brigade light_sp_artillery_brigade medium_sp_artillery_brigade heavy_sp_artillery_brigade modern_sp_artillery_brigade] |
| GER_VOLKSGRENADIER_01 | 58 -> 58 | - | %d. Volks-Sturm-Division | - |
| GER_FLAK_DIVISION_01 | 33 -> 33 | - | - | division_types: [infantry] -> [anti_air_brigade mot_anti_air_brigade light_sp_anti_air_brigade medium_sp_anti_air_brigade heavy_sp_anti_air_brigade modern_sp_anti_air_brigade] |
| GER_KAMPFGRUPPE_01 | 166 -> 166 | - | - | division_types: [infantry motorized mechanized light_armor medium_armor heavy_armor] -> [infantry] |
| GER_PZJG_01 | new, 15 | schwere Panzerjäger-Abteilung %d (x10) (from GER_SCHWERE_PANZERABTEILUNG_01), Heeres-Panzerjagd-Brigade 1, Heeres-Panzerjagd-Brigade 2, Panzerjagd-Brigade 104, Panzerjagd-Brigade West, Panzerjäger-Brigade Oberschlesien | - | - |
| GER_AUFKL_01 | new, 3 | Aufklärungs-Abteilung %d (mot.) (x2), Panzer-Aufklärungs-Lehr-Abteilung %d | - | - |
| GER_AMPH_01 | new, 6 | Panzer-Abteilung A, Panzer-Abteilung B, Panzer-Abteilung C, Panzer-Abteilung D, Panzer-Regiment 18, Panzer-Regiment 28 | - | - |
| GER_WERFER_01 | new, 23 | Werfer-Brigade %d (x9), Volks-Werfer-Brigade %d (x6), Werfer-Regiment 53, Werfer-Regiment 54, Werfer-Regiment 71, Werfer-Regiment 83, Werfer-Regiment 84, Stellungs-Werfer-Regiment 101, Stellungs-Werfer-Brigade 300, Nebel-Lehr-Regiment | - | - |
| GER_MEK_01 | new, 20 | Küstenjäger-Abteilung 'Brandenburg', Marine-Einsatzkommando %d (x12), Lehrkommando 600, Lehrkommando 700, 1. K-Division, 3. K-Division, 4. K-Division, 5. K-Division, K-Regiment (mot.) | - | - |

Unchanged: GER_ARM_03, GER_RESERVE_DIVISION_01, GER_GRENADIER_DIVISION_01, GER_LUFTWAFFEN_FELD_DIVISION_01, GER_GAR_02, GER_FORT_01, GER_BRIG_01, GER_PEN_01, GER_VOLKSSTURM_BATAILLONS_01, GER_SA_01, GER_MIL_01, GER_MIL_02, GER_MIL_04, GER_MIL_03, GER_LEG_01, GER_STURM_01, GER_MONRES_01, GER_LANDWEHR_01
<!-- END CHANGE TABLE -->
