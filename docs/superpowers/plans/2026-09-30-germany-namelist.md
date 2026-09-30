# Germany (GER) Namelist Overhaul - 2026-09-30

Full overhaul of the three German files (`INEX_GER_names_divisions.txt`, `INEX_GER_ADDITIONAL_names_divisions.txt`, `INEX_GER_SS_names_divisions.txt`).

Baseline: 34 groups.
- Main file: 340 of 923 entries authored; 11 groups placeholder-only.
- ADDITIONAL: most groups placeholder-only.
- SS: extensions invented or English.
- Gating: SS, Volkssturm and Nazi honorifics were open to every government.

Result: 51 groups.
- Main file: 22 groups, 770 of 1262 entries authored.
- ADDITIONAL: 19 groups, 521 of 734 authored.
- SS: 10 groups, 619 of 634 authored.

## User decisions
- **Ideology: split and add suites.**
  - Basic plain and Named lists are non-political (`always = yes`).
  - Nazi honorifics, SA, Volkssturm, foreign legions and all SS groups are fascism-only.
  - New guard and militia suites cover the monarchist, republican and communist paths.
  - The three duplicate vanilla ideology tags (`GER_Arm_01_ANTIFASCIST`, `GER_MEC_01_COMMUNIST`, `GER_MEC_01_MONARNCHIST`) are overridden to carry them.
- **Invented nicknames: keep the best, replace the rest.**
  - Keep: correct German singular-noun compounds with heraldic or martial imagery, used once across the suite.
  - Drop: English or anglicised words, weapon or vehicle names, non-nouns and plurals, incongruous imagery, Blitzkrieg/Blitzkrieger, duplicates.
  - A verified identity always takes its real division number; kept names fill numbers without one and the expansion sections.
- **Named infantry identity:** verified nickname or tradition first, else a verified home garrison or region.
- **Plain lists keep the historical raising order** (ordered placeholder entries). This is a deliberate exception to R4/R10; the resulting flags are recorded under Kept on judgment.

## Groups
| File | Tag | Selector | Gate | Entries | Change |
|---|---|---|---|---|---|
| main | `GER_Inf_01` | Infantry Divisions | always | 254 | plain; raising order kept |
| main | `GER_INF_02` (new) | Infantry Divisions (Named) | always | 135 | nickname/emblem, else formation city or training ground |
| main | `GER_ALTINF_01` | Special Infantry Divisions | always | 23 | VGD moved out; Luftlande, Sturm, HuD, Marine-Infanterie, 1944-45 named divisions |
| main | `GER_LTINF_01` | Light Infantry Divisions | always | 31 | 11 Jäger divisions + 20 forest/upland expansion |
| main | `GER_MOT_01` | Motorized Divisions | always (was neutrality/democratic) | 14 | plain; GD removed |
| main | `GER_MOT_02` | Motorized Divisions (Named) | always (was fascism) | 42 | vanilla tag repurposed as the Named variant; first-wave expansion |
| main | `GER_MEC_01` | Panzergrenadier Divisions | always | 9 | plain; honorifics moved out |
| main | `GER_MEC_02` (new) | Panzergrenadiers (Named) | always | 43 | Sizilien, Sardinien, Brandenburg, Kurmark; expansion |
| main | `GER_Arm_01` | Panzer Divisions | always | 29 | plain; named entries moved out |
| main | `GER_Arm_02` | Panzer Divisions (Named) | always | 84 | rewritten; 1945 named divisions; 31 kept names; training-ground expansion |
| main | `GER_LTARM_01` | Light Divisions | always | 5 | fallback fixed ("leichte Division") |
| main | `GER_Cav_01` | Cavalry Divisions | always | 23 | 'Kavallerie-Division Nord' dropped (unverified); stud/cavalry-school expansion |
| main | `GER_Mnt_01` | Mountain Divisions | always | 33 | emblems; Steiermark, Volks-Gebirgs; Alpine expansion |
| main | `GER_PAR_01` | Paratrooper Divisions | always | 25 | 7. Flieger-Division; commanders/battle honours; 9 kept names; airborne operations |
| main | `GER_MAR_01` | Marine Divisions | always | 37 | Marinekorps Flandern; naval tradition names; 10 kept names |
| main | `GER_GAR_01` | Garrison Divisions | always | 56 | Reserve and Festung entries and mismatched keys removed |
| main | `GER_ELI_01` (new) | Elite Formations | fascism | 16 | GD, FHH, HG, Führer-Begleit/-Grenadier, Schlageter |
| main | `GER_MEC_01_MONARNCHIST` | Guard Divisions | neutrality/democratic | 33 | vanilla override without focus lock; Garde-Korps, Leib regiments |
| main | `GER_MONINF_01` | Imperial Infantry Divisions | neutrality/democratic | 200 | polish; guard/Leib entries moved to Guard |
| main | `GER_MONMOB_01` | Imperial Mobile Divisions | neutrality/democratic | 111 | polish; Garde-Kavallerie-Division added |
| main | `GER_Arm_01_ANTIFASCIST` | Republican Divisions | democratic | 28 | vanilla override; Reichswehr with 1813/1848/Weimar names |
| main | `GER_MEC_01_COMMUNIST` | Red Army Divisions | communism | 31 | vanilla override; Volksmarinedivision, revolutionaries |
| add | `GER_SCHWERE_PANZERABTEILUNG_01/_02` | Heavy Panzer Battalions / (Abbr.) | always | 16 each | 501-510, 1945 renumberings, (Fkl) 301, 653/654/512 |
| add | `GER_ARM_03` (new) | Panzer Brigades | always | 16 | Panzer-Brigade 10, 101-113, 150, Norwegen |
| add | `GER_PANZERARTILLERIE_DIVISION_01` | Panzer Artillery Divisions | is_ai = no | 16 | 18., 309-312 Artillerie-Divisionen, Volks-Artillerie-Korps |
| add | `GER_RESERVE_DIVISION_01` | Reserve Divisions | always | 22 | real numbers (moved from GAR_01) |
| add | `GER_VOLKSGRENADIER_01` | Volksgrenadier Divisions | always | 57 | real numbers in raising order (from ALTINF); 78. Volks-Sturm-Division |
| add | `GER_GRENADIER_DIVISION_01` | Grenadier Divisions | always | 18 | 541-562 (29th/30th waves) |
| add | `GER_LUFTWAFFEN_FELD_DIVISION_01` | Luftwaffe Field Divisions | always | 22 | unlinked from Inf_01 (collision fix); Division Meindl |
| add | `GER_FLAK_DIVISION_01` | Flak Divisions | always | 33 | 1-31, Flakscheinwerfer 1-2 |
| add | `GER_GAR_02` | City Garrisons | always | 47 | Stadtkommandantur + period exonyms; fallback Feldkommandantur |
| add | `GER_FORT_01` | Fortress Divisions | always | 114 | real Festungen first; Iceland/Siberia/postwar names dropped |
| add | `GER_KAMPFGRUPPE_01` | Kampfgruppen | always | 166 | extended A-E to A-Z |
| add | `GER_VOLKSSTURM_BATAILLONS_01` | Volkssturm Battalions | fascism (was always) | 43 | Freikorps 'Adolf Hitler', Standschützen, one per Gau |
| add | `GER_SA_01` (new) | SA Formations | fascism | 29 | SA-Standarten, SA-Gruppen |
| add | `GER_MIL_01` (vanilla override) | Freikorps | neutrality | 30 | 1918-23 Freikorps |
| add | `GER_MIL_02` (vanilla override) | Schutztruppe | vanilla gate | 17 | colonial forces; Mittelafrika and commanders |
| add | `GER_MIL_04` (new) | Reichsbanner | democratic | 23 | Schufo, Eiserne Front, Gaue |
| add | `GER_MIL_03` (vanilla override) | Red Front Fighters | communism (focus OR dropped) | 26 | RFB, Rote Marine, Rote Ruhrarmee, Gaue |
| add | `GER_LEG_01` (new) | Foreign Legions | fascism | 23 | Azul, Croatian, Cossack, Ostlegionen, Condor, LVF |
| ss | `GER_SS_01`-`GER_SS_05` | SS Divisions / Infantry / Motorized / Panzergrenadier / Panzer | fascism (was always) | 108/86/71/81/74 | historical 1-41 by type; shared extension 42-108 |
| ss | `GER_SS_06`, `GER_SS_07` (new) | SS Mountain / Cavalry Divisions | fascism | 74/71 | historical + shared extension |
| ss | `GER_SS_08`, `GER_SS_09` (new) | SS Heavy Panzer Battalions / SS Kampfgruppen | fascism | 5/40 | 501-503; SS commanders |
| ss | `GER_SS_STANDARTE_01` | SS Standarten | fascism (was always) | 24 | SS-VT and Totenkopf Standarten, 'Julius Schreck' |

## Research
- Six `inex-historical-researcher` dispatches:
  - R1a: Heer infantry garrisons
  - R1b: special infantry and numbered series
  - R2: mobile forces
  - R3: Luftwaffe, naval and fortresses
  - R4: fascist formations
  - R5: other ideologies
- Four follow-ups (F1-F4) fetched the per-division de.wikipedia pages for waves 1-35 (formation place, Wehrkreis, nicknames).
- Sources:
  - de.wikipedia `N._Infanterie-Division_(Wehrmacht)` pages (F1-F4).
  - de.wikipedia: "Liste der Divisionen der Wehrmacht", "Volksgrenadier-Division", "Luftwaffen-Felddivision", "Festung (Wehrmacht)", "Fester Platz (Wehrmacht)", "Marinekorps Flandern", "SS-Totenkopfverbände", "Volkssturm", "Reichsbanner Schwarz-Rot-Gold", "Roter Frontkämpferbund", "Kaiserliche Schutztruppe", "Freikorps", "Gardekorps", "Volksmarinedivision", "Rote Ruhrarmee", "XI. Internationale Brigade", "Schwere Panzer-Abteilung", "Truppenübungsplatz", "Panzerdivision", "97. Jäger-Division".
  - en.wikipedia: 1st Parachute Division, Ostlegionen, Großdeutschland Division, Military district (Germany), Aufstellungswelle, the 35th-wave division pages.
  - Other: austria-forum (100. Jäger-Division), ww2.dk (9. Flak-Division).
- Research economy note: many list pages returned 404, so R2, R4 and R5 are largely "well documented" rather than page-verified; see Author confirmation.

## Rationale
- **One Heer number series.**
  - All infantry-type lists link to `GER_Inf_01`.
  - A number carries one identity in every list (INF_02, MOT_02, MEC_02, LTINF), so a division keeps its name when it changes type.
  - Panzer lists link to `GER_Arm_01`.
  - SS type lists link to `GER_SS_01`.
- **Named infantry.**
  - Each identity is used once in the file.
  - When two divisions share a city, the earlier or better-known one keeps it and the other is left out: 76 and 23 Potsdam, 69 and 16 Münster, 225/269 and 20 Hamburg, 217 and 11 Allenstein, 228 and 21 Elbing, and others. Numbers without a verified identity are omitted rather than invented.
  - Omitted divisions still come from the plain list or the fallback.
- **Panzer divisions converted from infantry divisions keep the predecessor's city:** 12 'Stettin' (2. ID mot.), 14 'Dresden' (4. ID), 15 'Darmstadt' (33. ID), 17 'Augsburg' (27. ID), 26 'Potsdam' (23. ID), 24 'Insterburg' (1. Kavallerie-Division). 116 'Windhund' continues 16. PzGren 'Windhund'.
- **`GER_MOT_02` is reused as the Named variant** (not a new tag). This overrides vanilla's fascist-only plain duplicate; otherwise it would stay visible beside the plain list.
- **Quote style:** identities appended to a designation are in single quotes. Historical proper names are unquoted (Infanterie-Division Scharnhorst, Panzer-Division Holstein, Freikorps Epp, Kampfgruppe Peiper).
- **SS shared extension (42-108):** the same honour name for the same number in all seven SS division lists, so whichever type claims a number gets its name. Verified regiment/Standarte names come first, then kept invented names.
- **The Luftwaffe field divisions keep the pre-1943 Luftwaffe form "Luftwaffen-Feld-Division %d"** (R3). The plan's suggested change to "%d. Luftwaffen-Feld-Division" was dropped.
- **Dropped as unverified or implausible:**
  - Kavallerie-Division 'Nord'.
  - The Icelandic villages and Siberian/Far-East cities in FORT_01.
  - Postwar names (Volgograd, Yekaterinburg).
  - 'Wachregiment Berlin' and 'Brandenburg' in the SS list (Heer units).
  - Lothar von Trotha as a Schutztruppe honorific.
- **Plan item not done:** the plan suggested replacing 'Stalingrad' on 9. Flak-Division only if verified. It was kept, because R3 verified that the division was destroyed at Stalingrad.
- **Monarchist polish:** hyphen misuse ("Thüringische-Division" to "Thüringische Division"), regnal periods (IV.), Große, Oberelsässische/Unterelsässische, trailing spaces. Two outlier titles were shortened (Friedrich Franz IV., Erzherzog Friedrich).
- **CLAUDE.md and GEMINI.md:** the "German Split" line was updated to the new layout (mirrored).

## Verified formations & commanders
- **Page-verified (VERIFIED):**
  - Formation places and Wehrkreise for about 150 infantry divisions (F1-F4).
  - Nicknames: 12 'Wilder Stier', 14, 24 'Eisbär', 26 'Dom-Division', 29 'Falke', 44 HuD, 46 'Springender Hirsch', 50 'Pfeil und Bogen', 56 'Gekreuzte Säbel', 62 'Mondschein', 68 'Brauner Bär', 70 'Weißbrotdivision', 71 'Kleeblatt', 72 'Gelbkreuz', 87 'Grünes Herz', 97 'Spielhahnjäger', 122 'Greif', 163 'Trabender Elch', 205 'Pilzdivision', 206 'Pique As', 252 'Schlesisches Eichenlaub', 257 'Berliner Bären-Division', 260 'Hörnle', 263 'Weintrauben', 302 'Dieppe', 320 'Grünherz', 329 'Hammer', 371 'Ähren', 416 'Schlagsahne', 719 'Sitzender Hase'.
  - Named divisions: 35th-wave divisions; Infanterie-Division Ostpreußen, Schlesien, Berlin; Panzer-Division names of 1945.
  - Series: Volksgrenadier waves 29/30/32; Reserve and Sicherungs numbers; LwFD 1-21 and Meindl; Festungs-Divisionen and Feste Plätze; Marinekorps Flandern; 7. Flieger-Division, FJD 6-8 commanders, the 'Kreta' cuff title.
  - Organisations: Totenkopfstandarten I-XVI; Gardekorps regiments; Freikorps (FK page); Schutztruppen; Reichsbanner and RFB structure; Volksmarinedivision; Rote Ruhrarmee; XI. Internationale Brigade battalions and commanders.

## Author confirmation
- **Well documented, not page-verified:**
  - Waffen-SS designations by type; SS regiment names (R4); Allgemeine-SS 'Julius Schreck'.
  - 31. SS '(Batschka)'; planned 39 'Andreas Hofer' and 41 'Kalevala' numbering; 40 'Feldherrnhalle' as Panzergrenadier.
  - SA-Standarte 'Horst Wessel'; SA-Gruppen list; NSDAP Gau list (Volkssturm).
  - Croatian division nicknames (392 'Blaue Division').
  - Panzer garrisons 4-19 (R2); 2. Pz 'Dreizack', 3. Pz 'Berliner Bär'.
  - Reichswehr 2. Kavallerie-Division (Schlesien); 3. Kavallerie-Division 'Boeselager' (from Kavallerie-Regiment Mitte).
  - 2./3. Gebirgs-Division Innsbruck/Graz; Panzer-Brigade 10; Volks-Artillerie-Korps 388 and 401-410.
  - Naval tradition names; Garde-Reserve/Ersatz divisions; Leib regiment designations.
- **Plausible expansion (names real, divisions not):**
  - LTINF forests.
  - MOT_02/MEC_02 first-wave expansion.
  - Arm_02 training grounds.
  - Cavalry studs and schools.
  - Mountain garrisons and peaks.
  - PAR operations and commanders.
  - MAR tradition names.
  - Guard residences and orders.
  - Republican and Red Army honour names.
  - Kampfgruppen F-Z (Heer commanders).
  - SS Kampfgruppen (division commanders).
  - FORT_01 expansion.
  - Reichsbanner and RFB Gaue beyond Berlin-Brandenburg and Hessen-Nassau.
  - Schutztruppe 'Mittelafrika' and commanders.

## Kept on judgment
- **PLACEHOLDER_ENTRIES and LOW_DEPTH:**
  - Plain `GER_Inf_01`, `GER_MOT_01`, `GER_MEC_01`, `GER_Arm_01` (decision 4) and `GER_LTARM_01` (5 historical light divisions).
  - Historical number series with no names: heavy battalions (Heer and SS), Panzer brigades, artillery, Reserve, Volksgrenadier, Grenadier, LwFD, Flak, `GER_GAR_01`.
- **UNLINKED_MOBILE on `GER_MEC_01_MONARNCHIST` and `GER_MEC_01_COMMUNIST`:** the lint matches the `_MEC_` tag name. These are independent ideology series (Guard, Red Army) and must not share the Heer numbers.
- **NAME_LONG on the Imperial lists:** 61-66-character historical honour titles.
- **IDENTITY_REPEAT 'König' and 'Prinz Karl von Bayern' (MONINF/MONMOB):** pre-existing; different regiments with the same patron.
- **SS numbers 23, 29, 30 and 33** carry two different divisions across type lists, as they did historically.
- **`-SyncWiki GER`** reports "no row" for the mixed-case vanilla tags (`GER_Inf_01`, `GER_Arm_01`, `GER_Arm_02`, `GER_Cav_01`, `GER_Mnt_01`, `GER_Arm_01_ANTIFASCIST`). The rows exist; the tool's row regex only matches upper-case tags (pre-existing tool limitation, not changed here).

## Review
- `inex-code-reviewer`: APPROVED, no Critical findings.
  - Verified: validation, 242/242 tests, selectors, plain/Named numbering, `has_government`-only gating, no Nazi honorific outside fascist groups, docs and the byte-identical CLAUDE.md/GEMINI.md.
  - Important #1 (78. Volks-Sturm-Division ungated): kept on judgment, see above.
  - Minor #2: 'Donnerkeil' on 11. Panzer-Division implied a link to the Luftwaffe operation. 11. Panzer-Division now takes the kept name 'Eisenkrieger'; 'Donnerkeil' moved to expansion key 28.
  - Minor #3-#4: noted, match the plan.
- Author self-review:
  - 7. Panzer-Division 'Gespenster-Division' became 'Gespenster', in line with the other "X-Division" nicknames reduced to their core word; the workshop description and wiki were updated.
  - The paratrooper expansion comment was corrected (1940-44 battles, the Eben-Emael assault leader).
- Data-only fixes, so no second reviewer was dispatched; `-ValidateOnly` and `-Test` were re-run.
