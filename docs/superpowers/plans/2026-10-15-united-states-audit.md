# United States (USA) Namelist Audit - 2026-10-15

Status: DONE

File: `common/units/names_divisions/zz_INEX_USA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit USA`)
- AUDIT SUMMARY USA: GROUPS=25 AUTHORED=614/776 FLAGS=1
- [USA_GAR_01] flags: UNGATED_POLITICAL
- Found on manual review:
  - Nine group comments claim "Overrides vanilla USA_<X>" for tags vanilla does not define (vanilla USA has only INF, CAV, MOT, MEC, ARM, PAR, MAR, MNT, GAR, RGR): `USA_ARMORED_DETACHMENTS_01`, `USA_RANGER_FORCE_01`, `USA_COMPOSITE_UNITS_01`, `USA_DEF_01`, `USA_MIL_01`, `USA_SHOCK_01`, `USA_COM_GUARD_01`, `USA_FASCIST_01`, `USA_PARAMILITARY_01` (R2, misleading).
  - File header (R1) says "Separate Tank & TD Battalions" although no TD group exists, and "48 WWII State Guards" although `USA_DEF_01` has 38; it must also name the eleven new groups.
  - `Vanilla: leaves out` lines on `USA_INF_01`, `USA_GAR_01`, `USA_CAV_01`, `USA_MOT_01`, `USA_MEC_01`, `USA_PAR_01`, `USA_MNT_01` are the result of the 2026-10-01 audit, which dropped vanilla's HOI3 sports-team filler and corrupted entries on purpose (see "Kept on judgment").

## User decisions
- 2026-10-15: the user asked for a moderate expansion of 5-7 new namelists, then chose a larger set at the checkpoint: 11 new groups.
  - Combat arms: Tank Destroyer Battalions (`USA_TD_01`), Regimental Combat Teams (`USA_RCT_01`), Amtrac Battalions (`USA_AMT_01`), Field Artillery Brigades (`USA_ART_01`).
  - Garrison and heritage: US Constabulary (`USA_CONST_01`), Union Army heritage (`USA_UNION_01`, democratic), Overseas Garrisons (`USA_OVS_01`).
  - Alt-history for democratic or neutral governments (the user's own request): Volunteer Legions (`USA_VOL_01`, democratic or neutrality), Color Plan expeditionary forces (`USA_PLAN_01`, democratic or neutrality), Conservation Corps Brigades (`USA_CCC_01`, democratic), Continental Army Divisions (`USA_CONT_01`, neutrality).
  - Dropped: Antiaircraft Brigades (`USA_AA_01`), at the user's word ("Drop AA only").
- Existing groups: no name changes; only the comment and header fixes found on manual review.

## Research
- Three `inex-audit-researcher` dispatches in parallel on 2026-10-15 (Sonnet):
  - A: tank destroyer battalions, amtrac battalions, US Constabulary (21 web calls). Sources: Wikipedia "List of tank destroyer units of the United States Army"; yeide.net "Tank destroyer Battalion Profiles"; tankdestroyer.net unit pages; Wikipedia "Landing Vehicle, Tracked"; HyperWar USMC monographs (Peleliu, Iwo Jima, Marianas App. A); Marine Corps "Central Pacific Drive"; usarmygermany.com Constabulary brigade pages; Wikipedia "United States Constabulary".
  - B: regiment special designations, overseas commands and Philippine Scouts, field artillery (23 web calls). Sources: Wikipedia regiment articles and "Special designation"; army.mil (Harlem Hellfighters designation); Wikipedia "Philippine Scouts", "1st Mission Support Command", "Iceland Base Command"; Wikipedia "111th Field Artillery Regiment", "333rd Field Artillery Battalion", "969th Field Artillery Battalion"; armyheritage.org brigade bibliographies.
  - C: Union formations, color-coded war plans, CCC, volunteer and Continental precedents (25 web calls). Sources: Wikipedia Union brigade and regiment articles; Wikipedia "United States color-coded war plans"; Wikipedia "Corps area" and "Civilian Conservation Corps"; NPS Yorktown (Armand's Legion); NEAM "The Kosciuszko Squadron"; Wikipedia "Finnish American Legion", "Lindley Miller Garrison"; NPS "The Maryland 400".
- Engine: `division_types` takes sub-unit ids [NAM-004]. Vanilla 1.19.3 defines line tank destroyers as `light_tank_destroyer_brigade` etc. and line artillery as `artillery_brigade` etc. (`common/units/tank_destroyer_brigade.txt`, `artillery_brigade.txt`); `-EditNames` accepts neither, and `artillery`/`anti_tank` are support-company ids (tooling backlog, Validation). `amphibious_armor` and `amphibious_mechanized` are line sub-unit ids (`common/units/amphibious_armor.txt`, `amphibious_mech.txt`).

## Rationale
- **Placement.** New groups sit next to their family: `USA_RCT_01` after the National Guard, `USA_TD_01` and `USA_ART_01` after the separate tank battalions, `USA_AMT_01` after the Marine Raiders, `USA_OVS_01` and `USA_CONST_01` after the Harbor Defense Commands, and the five gated alt-history and heritage groups after `USA_JUNTA_01` (neutrality first, then democratic, then democratic-or-neutrality). Each gets a banner in the file's own three-line style.
- **Number style.** Entries keep the file's convention: the real unit number is the key and the ordinal is written into the name (`%dst`, `%dnd`, `%drd`, `%dth`, matched to the key); fallbacks use the bare number as vanilla does. Literal entries (commands, brigades in a regiment list, corps artillery) carry their own number in the text. Battles and garrison towns go in parentheses, nicknames in single quotes, as in `USA_RANGER_FORCE_01` and `USA_GAR_01`.
- **Typing.** `USA_TD_01` and `USA_ART_01` cannot name their real line battalions (see Research), so they follow the precedent of `GER_PANZERARTILLERIE_DIVISION_01`: typed as armor and gated `can_use = { is_ai = no }`, so players pick them from the selector while AI armored templates never draw TD or artillery names. `USA_AMT_01` uses the real `amphibious_armor` and `amphibious_mechanized` ids; amphibious templates get no USA list today. `USA_CONST_01` would also want `armored_car` (vanilla id, rejected by `-EditNames`); it uses cavalry, motorized and light armor.
- **USA_TD_01** (24): the Tank Destroyer Force under real battalion numbers with one verified battle or attachment each; attachments stand in where the researcher could not confirm a battle (704th "Arracourt", 893rd "Kommerscheidt", 630th "Clervaux" and 612th/644th "Elsenborn" were not confirmed and are not used). Keys 1-2 are the provisional self-propelled mount groups of Bataan (M3 GMC), the closest thing to a TD battalion in the Philippines.
- **USA_RCT_01** (29): Regular Army regiments with their special designations or established nicknames, separate RCTs, the Hawaii National Guard regiments and the Filipino infantry regiments raised in California in 1942. Dropped after research: 12th 'Red Warriors' (battalion nickname only), 32nd 'Queen's Own' and 47th 'Raiders' (no source), 5th 'Bobcats', 23rd 'Tomahawks', 60th 'Go Devils' (unverified), 38th 'Rock of the Marne' and a quoted 31st 'Polar Bears' (both quoted identities already in `USA_INF_01`, `IDENTITY_REPEAT`); the 31st keeps "(Manila)", the 24th "(Buffalo Soldiers)" in parentheses for the same reason. 17th respelled 'Buffalos', 34th 'Leyte Dragons' (special designations).
- **USA_AMT_01** (21): USMC amphibian tractor and armored amphibian battalions and Army amphibian tractor and amphibian tank battalions, each with one verified landing. Dropped as unverified: USMC 11th Amphibian Tractor Bn and 1st Armored Amphibian Bn, Army 726th, 727th, 788th. Researcher extras taken: 9th (Okinawa), 536th, 728th, 826th, 672nd (Los Baños raid).
- **USA_ART_01** (20): European Theater brigades and groups, six corps artillery commands with their best-known campaign, National Guard heritage regiments, the Philippine Scout artillery and the 333rd and 969th battalions (Ardennes, Bastogne). Dropped: 18th FA Bn as first rocket battalion (contradicted: no rocket battalion saw combat), 'Long Tom' battalion numbers, 13th/17th/18th/35th/36th FA Brigades (35th and 36th are kept as Field Artillery Groups, which is what the sources show).
- **USA_OVS_01** (23): the overseas departments, defense and base commands of 1936-1945 and the Philippine Scout regiments. Antilles Department dates from 1 June 1943, Alaskan Department from late 1943; both are kept beside their predecessors. Dropped as unsourced: Panama Mobile Force, Northern Ireland Base Command, U.S. Army Forces in China, Task Force 5889 (Liberia). The 43rd Infantry (PS) had one battalion in 1941; the regiment name is kept.
- **USA_CONST_01** (20): the United States Constabulary (1946-1952) with its nickname, three brigades, ten regiments with their first garrison towns (the 4th in Austria) and six squadrons (the 16th in Berlin). HQ town left out: the sources disagree (Bamberg, Bad Tölz, Stuttgart).
- **USA_UNION_01** (26, democratic): Union armies, brigades and regiments as division names, the counterpart of the fascist-gated `USA_CONFED_01`. Heritage, not a historical division list; extrapolated in the same way as the Confederate group. "Kearny's Red Diamond" rather than "Red Diamond" (the 5th Infantry Division's WWI nickname has another origin).
- **USA_CONT_01** (20, neutrality): extrapolated. Garrison's 1915-16 plan for a 400,000-man federal "Continental Army" (Wikipedia: Lindley Miller Garrison) is the real basis; the divisions themselves never existed. Named after the Continental Army: the state Lines verified as names (Pennsylvania, New Jersey, Virginia) plus Maryland and Connecticut (author confirmation), units and Revolutionary battles. Massachusetts, New York and North Carolina Lines dropped as unverified; 'Delaware Regiment' instead of the unverified 'Delaware Blues'.
- **USA_CCC_01** (18, democratic): extrapolated: no armed CCC existed. Basis: the CCC (1933-1942) enrolled through the Army's nine Corps Areas and shifted to defense work in 1940-41 (Wikipedia: Civilian Conservation Corps); one brigade per Corps Area under a regional label (4th "Southeast" and 8th "Southwest" stay general because the edge states moved between areas), then CCC directors, the CCC Indian Division, and conservation figures. 'We Can Take It' and 'Happy Days' dropped (book title, newspaper).
- **USA_VOL_01** (17, democratic or neutrality): extrapolated legions for divisions sent abroad as volunteers. Named after the foreign friends of the Revolution (verified legions of Armand, Pulaski, Lauzun; well documented von Steuben, de Kalb, Rochambeau, Gálvez), American volunteer precedents (Lafayette Escadrille, Kosciuszko Squadron, Eagle Squadrons, Flying Tigers, Finnish American Legion, American Field Service) and FDR-era democratic ideals. 'Lafayette Escadrille' rather than 'Lafayette' (quoted identity of the 11th Infantry Division). Kosciuszko in its usual American spelling.
- **USA_PLAN_01** (23, democratic or neutrality): extrapolated forces named "<Color> Force (<target>)" after the interwar color-coded war plans and Rainbow 1-5 (Wikipedia: United States color-coded war plans). The pattern is the planner's; "Indigo Force" is not attested as the 1941 Iceland force's name and is used as the pattern, not as a historical claim. Gray is given its Azores target (its Caribbean meaning overlaps Purple and Violet); Silver and Citron dropped (not on the list).
- **Comments and header.** The nine wrong "Overrides vanilla" prefixes go; the header is rewritten to name all 36 groups, the language convention, the `is_ai` gates and the one vanilla group left alone (`USA_RGR_01`). `comment` cannot do the nine fixes (tooling backlog, Editing), so step 3 is a one-off replacement.

## Verified formations & commanders
- Legacy groups: as recorded in `2026-10-01-united-states-audit.md`; unchanged.
- USA_TD_01: 601st (El Guettar, DUC), 899th (El Guettar, Utah Beach), 701st (Sidi Bou Zid, 1st AD), 702nd (2nd AD), 703rd (3rd AD), 704th (4th AD), 705th (Bastogne, DUC), 609th (10th AD), 614th (Climbach, DUC to a platoon), 823rd (Mortain), 893rd (Hürtgen Forest), 636th (Salerno), 645th (Anzio), 814th (St. Vith), 630th (28th ID), 612th (Honsfeld), 644th (99th ID), 776th (Maknassy), 827th (Colmar Pocket), 632nd (New Guinea), 637th (Luzon), 640th (Bismarck Archipelago): yeide.net profiles; Wikipedia TD list; tankdestroyer.net. 2nd Provisional Group (SPM): Wikipedia "Luzon Force".
- USA_RCT_01: 3rd 'The Old Guard', 6th 'Regulars', 7th 'Cottonbalers', 9th 'Manchus', 14th 'Golden Dragons', 17th 'Buffalos', 18th 'Vanguards', 19th 'Rock of Chickamauga', 20th "Sykes' Regulars", 21st 'Gimlets' (sources write "Gimlet Regiment"; the plural is the soldiers' name), 26th 'Blue Spaders', 27th 'Wolfhounds', 34th 'Leyte Dragons', 39th 'Fighting Falcons': Wikipedia regiment articles / special designations; 9th also DVIDS. 31st 'Polar Bears' (Manila): Task & Purpose. 369th 'Harlem Hellfighters': army.mil. 442nd 'Go for Broke', 158th 'Bushmasters', 65th 'Borinqueneers', 24th (Buffalo Soldiers), 164th (Guadalcanal): well documented.
- USA_AMT_01: USMC 1st (Guadalcanal), 2nd (Tarawa), 3rd and 5th (Iwo Jima), 4th (Roi-Namur), 6th and 8th (Peleliu), 9th (Okinawa), 10th (Saipan), 2nd Armored Amphibian (Iwo Jima), 3rd Armored Amphibian (Peleliu): Wikipedia LVT; HyperWar USMC; Marine Corps "Central Pacific Drive". Army 708th (Saipan), 773rd (Tinian), 534th (Saipan/Tinian, PUC), 715th (Tinian), 536th (Okinawa), 728th (Tsugen Shima), 776th (Okinawa), 780th (Leyte), 826th (Leyte/Ormoc), 672nd (Los Baños): HyperWar Marianas App. A; "Infantry's Armor" ch. 15; army.mil; Wikipedia LVT.
- USA_ART_01: 141st 'Washington Artillery', 131st 'Lost Battalion': well documented. 111th 'Richmond Howitzers': Wikipedia 111th FA Regiment; Encyclopedia Virginia. 333rd, 969th: Wikipedia; National WWII Museum. 32nd FA Brigade (ETO): armyheritage.org; 33rd FA Brigade (ETO): curtiswrightmaps (secondary). 34th, 71st FA Brigades: armyheritage.org (existence). 35th, 36th FA Groups: researcher B. 23rd, 24th FA (PS): Wikipedia Philippine Scouts. II, V, VII, VIII, XX, XXIV Corps Artillery and their campaigns (Tunisia, Omaha, Utah, Brest, Metz, Okinawa): well documented.
- USA_OVS_01: Hawaiian Department, Hawaiian Division, Philippine Department, Philippine Division, Panama Canal Department, Caribbean Defense Command, Alaska Defense Command, Persian Gulf Command: well documented. Puerto Rican and Antilles Departments: Wikipedia 1st Mission Support Command. Trinidad Sector and Base Command: af.mil Pratt biography. Iceland Base Command: Wikipedia. Greenland Base Command: Wikipedia Northeast Air Command. Newfoundland Base Command: search snippet (15 Jan 1941). 26th Cavalry, 43rd, 45th, 57th Infantry (PS): Wikipedia Philippine Scouts.
- USA_CONST_01: brigades (Wiesbaden, Munich, Stuttgart), regiments 1st-6th, 10th, 11th, 14th, 15th with towns, squadrons 11th, 16th, 24th, 25th, 74th, 94th: usarmygermany.com brigade pages; Wikipedia US Constabulary. 'Circle C Cowboys': Wikipedia; militaryhistorynow.com.
- USA_UNION_01: armies, Iron and Irish Brigades, GAR, Berdan's Sharpshooters, Grierson's Raiders: well documented. Excelsior, Philadelphia, Vermont Brigades, Pennsylvania Reserves and Bucktails, Lightning Brigade, Fire Zouaves, Corps d'Afrique, Michigan Brigade 'Wolverines', Lincoln Cavalry, Harvard Regiment, Army of the Frontier, Garibaldi Guard: Wikipedia articles; battlefields.org. Kearny patch: Smithsonian NMAH.
- USA_CONT_01: Garrison plan: Wikipedia; Pennsylvania, New Jersey, Virginia Lines: Wikipedia Continental Army; Maryland 400: NPS; Delaware Regiment: researcher C; Legion of the United States, Commander-in-Chief's Guard, Marblehead Regiment, Morgan's Riflemen, Green Mountain Boys, Wayne's light infantry and the six battles: well documented.
- USA_CCC_01: Corps Areas and their core states: Wikipedia Corps area; 'Roosevelt's Tree Army', Robert Fechner, James McEntee, CCC Indian Division: Wikipedia CCC; John Muir, Gifford Pinchot, Johnny Appleseed, Paul Bunyan: well documented.
- USA_VOL_01: Armand's, Pulaski's Legion: NPS Yorktown; Lauzun's Legion: Fraunces Tavern Museum; Kosciuszko Squadron: NEAM; Finnish American Legion: Wikipedia; Lafayette Escadrille, von Steuben, de Kalb, Rochambeau, Gálvez, Eagle Squadrons, Flying Tigers, American Field Service, Four Freedoms, Atlantic Charter, Arsenal of Democracy, Good Neighbor policy: well documented.
- USA_PLAN_01: colors and targets, Rainbow 1-5: Wikipedia "United States color-coded war plans" (its list carries a disputed-accuracy tag).

## Author confirmation
Kept in the batch; confirm or tell the planner to drop before implementation. Planner confidence in brackets.
1. `USA_TD_01` keys 1-2: "1st/2nd Provisional SPM Group (Bataan)". Wikipedia names a "2nd Provisional Group (SPM)" and an archived page a "1st Provisional Group, Self-Propelled Mounts"; the word order is the planner's. [medium]
2. `USA_RCT_01` 15th 'Can Do' (the regiment's motto from its China service). [high]
3. `USA_RCT_01` 28th 'Black Lions'. [high]
4. `USA_RCT_01` 35th 'Cacti'. [high]
5. `USA_RCT_01` 112th Regimental Combat Team (Arawe): the dismounted 112th Cavalry at New Britain, December 1943. [high]
6. `USA_RCT_01` 298th and 299th Infantry Regiment (Hawaii). [high]
7. `USA_RCT_01` 1st and 2nd Filipino Infantry Regiment (1942). [high]
8. `USA_ART_01` 5th Field Artillery 'Alexander Hamilton Battery' (Battery D, oldest Regular Army unit). [high]
9. `USA_OVS_01` Bermuda Base Command. [medium]
10. `USA_OVS_01` Alaskan Department (Alaska Defense Command renamed, late 1943). [high]
11. `USA_OVS_01` Central Pacific Base Command and South Pacific Base Command (1944). [high]
12. `USA_OVS_01` Guam Insular Force Guard (December 1941). [high]
13. `USA_CONT_01` 'Maryland Line' and 'Connecticut Line'. [high]
14. `USA_CCC_01` 'Camp Roosevelt' (camp NF-1 near Luray, Virginia, 17 April 1933; the name was not on the page read). [high]

## Kept on judgment
- `USA_GAR_01` `UNGATED_POLITICAL`: kept (2026-10-01 audit). The National Guard serves every non-revolutionary government; the lint reads "Guard".
- `Vanilla: leaves out` lines on `USA_INF_01` (67 names, 6 numbered keys), `USA_GAR_01` (117), `USA_CAV_01` (6 keys), `USA_MOT_01` (7), `USA_MEC_01` (7), `USA_PAR_01` (6 keys), `USA_MNT_01` (7 names, 16 keys): dropped on purpose by the 2026-10-01 audit (HOI3 sports-team filler, corrupted entries, renamed mountain series). They are facts, not flags.
- New groups: none expected. The planner ran steps 1-4 on a copy of the repository (2026-10-15): `-Audit USA` gave `GROUPS=36 AUTHORED=834/1017 FLAGS=1` (only the `USA_GAR_01` flag above), no `IDENTITY_REPEAT`, Workshop `3 bullet(s), 20 [i] example(s); description 11572/17000 chars`; `-ValidateOnly` passed.
- `USA_TD_01` and `USA_ART_01` gated `is_ai = no` and typed as armor: on purpose (Rationale, "Typing").

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames USA -Batch docs/superpowers/plans/2026-10-15-united-states-audit.md`. Expect one green line per operation (11 new groups) and no `[ERROR]`.
- [x] 2. Replace the file header:
  `powershell -File .\build.ps1 -SetHeader USA -HeaderText "United States (USA) Division Namelist\nImmersive Namelists Expanded (INEX)\n\nAmerican English. Ordered entries carry their ordinal (%dst, %dnd, %drd, %dth) matched to the key;\nfallbacks use the bare number, as vanilla does.\n\nLine and mobile: Infantry (1st-106th, Fortitude deceptions, postwar reserve), National Guard, Regimental Combat Teams,\nMotorized, Mechanized, Cavalry, Armored, Armored Cavalry Regiments, Separate Tank and Tank Destroyer Battalions,\nField Artillery Brigades, Assault Divisions, Provisional Task Forces.\nSpecialists: Airborne, Marines, Marine Raiders, Amtrac Battalions, Mountain, Rangers.\nTerritorial: 38 WWII State Guards, State Militias, Harbor Defense Commands, Overseas Garrisons, US Constabulary (1946-52).\nIdeology and alternate history: Red Guards, Lincoln Brigades, Red Armored (communism); Silver Legions, Nationalist Militias,\nConfederate Divisions (fascism); Federal Emergency Forces, Continental Army (neutrality); Union Divisions,\nConservation Corps (democratic); Volunteer Legions, Expeditionary Forces (democratic or neutrality).\nTank Destroyer and Field Artillery groups are typed as armor and gated is_ai = no (players only).\n\nOverrides vanilla USA_INF_01, USA_CAV_01, USA_MOT_01, USA_MEC_01, USA_ARM_01, USA_PAR_01, USA_MAR_01,\nUSA_MNT_01 and USA_GAR_01; vanilla USA_RGR_01 (Ranger Divisions) stays as it is.\nUSA_INF_01 is named by vanilla scripted effects and the Dutch focus tree."`
  Expect a success line and no `[ERROR]`.
- [x] 3. Remove the nine wrong "Overrides vanilla" prefixes (workaround: `comment` cannot replace a comment block that a blank line separates from its group; see `docs/tooling-backlog.md`, Editing). Run in the PowerShell tool from the repo root:
  ```powershell
  $f = Join-Path (Get-Location) 'common\units\names_divisions\zz_INEX_USA_names_divisions.txt'
  $t = [IO.File]::ReadAllText($f)
  $r = [regex]'# Overrides vanilla USA_(ARMORED_DETACHMENTS|RANGER_FORCE|COMPOSITE_UNITS|DEF|MIL|SHOCK|COM_GUARD|FASCIST|PARAMILITARY)_01\. '
  $n = $r.Matches($t).Count
  if ($n -ne 9) { throw "Expected 9 stale comments, found $n" }
  [IO.File]::WriteAllText($f, $r.Replace($t, '# '), (New-Object System.Text.UTF8Encoding $false))
  "Fixed $n comments"
  ```
  Expect `Fixed 9 comments`. Any other output is a stop condition.
- [x] 4. `powershell -File .\build.ps1 -SyncWiki USA` (expect `wiki/Home.md: USA group count 25 -> 36` and a `no row in wiki table` line naming the 11 new tags), then make the edits listed under "Docs payload". Run `powershell -File .\build.ps1 -SyncWiki USA` again: it must no longer print a `no row in wiki table` line.
- [x] 5. `powershell -File .\build.ps1 -Check USA`. Expect `Check passed`; remaining flags must match "Kept on judgment".
- [x] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 7. Ship, on the user's word: commit with the message `Expand USA division namelists with eleven new groups`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Expand USA division namelists with eleven new groups"`.

## Docs payload
README.md: no change (the row exists; group counts come from `-SyncWiki`).

### wiki/United-States.md
0. `-SyncWiki` does not add table rows for new groups. In the `## Namelist Groups` table, insert each row below directly after the row named, as new lines:
   - after the `USA_GAR_01` row:
     ```
     | `USA_RCT_01` | Regimental Combat Teams | infantry | `%d Regimental Combat Team` |
     ```
   - after the `USA_ARMORED_DETACHMENTS_01` row:
     ```
     | `USA_TD_01` | Tank Destroyer Battalions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Tank Destroyer Battalion` |
     | `USA_ART_01` | Field Artillery Brigades | light_armor, medium_armor, heavy_armor, modern_armor | `%d Field Artillery Brigade` |
     ```
   - after the `USA_MAR_BGD_01` row:
     ```
     | `USA_AMT_01` | Amtrac Battalions | amphibious_armor, amphibious_mechanized | `%d Amphibian Tractor Battalion` |
     ```
   - after the `USA_COAST_01` row:
     ```
     | `USA_OVS_01` | Overseas Garrisons | infantry | `%d Base Command` |
     | `USA_CONST_01` | Constabulary Regiments | cavalry, motorized, light_armor | `%d Constabulary Regiment` |
     ```
   - after the `USA_JUNTA_01` row:
     ```
     | `USA_CONT_01` | Continental Army Divisions | infantry | `%d Continental Division` |
     | `USA_UNION_01` | Union Divisions | infantry, cavalry | `%d Union Division` |
     | `USA_CCC_01` | Conservation Corps Brigades | infantry, militia | `%d Conservation Brigade` |
     | `USA_VOL_01` | Volunteer Legions | infantry, motorized | `%d Volunteer Legion` |
     | `USA_PLAN_01` | Expeditionary Forces | infantry, motorized, mechanized, marine | `%d Expeditionary Force` |
     ```
1. In the paragraph under `## Historical Overview`, replace this sentence:
   > INEX provides an exhaustive, modernized suite of 25 distinct division namelists covering regular frontline forces, armored cavalry reconnaissance, separate tank battalions, amphibious raiders, island defense commands, coastal harbor defenses, authentic World War II State Defense Forces, and distinct ideological paths for *Man the Guns* alternate-history campaigns.

   with:
   > INEX provides a suite of 36 division namelists covering regular frontline forces and regimental combat teams, armored cavalry reconnaissance, separate tank and tank destroyer battalions, field artillery, amphibious raiders and amtracs, island defense commands, coastal harbor defenses and overseas garrisons, the postwar Constabulary, authentic World War II State Defense Forces, and ideological and alternate-history paths for *Man the Guns* campaigns.
2. Insert as a new line directly after the line that begins with ``- **`USA_MOT_01` & `USA_MEC_01` — Motorized & Mechanized Divisions**``:
   ```
   - **`USA_RCT_01` — Regimental Combat Teams**: Regular Army regiments under their special designations (*The Old Guard*, *Cottonbalers*, *Manchus*, *Golden Dragons*, *Rock of Chickamauga*, *Blue Spaders*, *Wolfhounds*, *Leyte Dragons*) and separate regimental combat teams: the 442nd (*Go for Broke*), 158th (*Bushmasters*), 112th (Arawe), 65th (*Borinqueneers*), 369th (*Harlem Hellfighters*), the Hawaii National Guard's 298th and 299th, and the 1st and 2nd Filipino Infantry Regiments.
   ```
3. Insert as a new line directly after the line that begins with ``- **`USA_ARMORED_DETACHMENTS_01` — Separate Tank Battalions**``:
   ```
   - **`USA_TD_01` — Tank Destroyer Battalions**: The Tank Destroyer Force under real battalion numbers, each with one battle or attachment: 601st (El Guettar), 701st (Sidi Bou Zid), 705th (Bastogne), 614th (Climbach), 823rd (Mortain), 893rd (Hürtgen Forest), 827th (Colmar Pocket), the Pacific battalions on New Guinea and Luzon, and the self-propelled mount groups of Bataan. Typed as armor and open to human players only (`is_ai = no`), so AI tank divisions never draw these names.
   - **`USA_ART_01` — Field Artillery Brigades**: Field artillery brigades and groups of the European Theater, corps artillery (II, V, VII, VIII, XX, XXIV), the National Guard heritage regiments 141st (*Washington Artillery*), 111th (*Richmond Howitzers*) and 131st (*Lost Battalion*), the Philippine Scout 23rd and 24th Field Artillery, and the 333rd and 969th battalions of the Ardennes and Bastogne. Typed as armor and open to human players only (`is_ai = no`).
   ```
4. Insert as a new line directly after the line that begins with ``- **`USA_MAR_BGD_01` — Marine Raider Battalions**``:
   ```
   - **`USA_AMT_01` — Amtrac Battalions**: Marine and Army amphibian tractor, amphibian tank and armored amphibian battalions for amphibious armor and amphibious mechanized templates, each with one landing: 1st (Guadalcanal), 2nd (Tarawa), 4th (Roi-Namur), 6th and 8th (Peleliu), 708th (Saipan), 773rd (Tinian), 672nd (Los Baños) and the battalions of Iwo Jima and Okinawa.
   ```
5. Insert as new lines directly after the line that begins with ``- **`USA_MIL_01` — State Militias**``:
   ```
   - **`USA_OVS_01` — Overseas Garrisons**: The overseas departments and commands of 1936-1945 (Hawaiian, Philippine, Panama Canal, Puerto Rican and Antilles Departments; Caribbean and Alaska Defense Commands; Iceland, Greenland, Newfoundland and Bermuda Base Commands; Persian Gulf Command) and the Philippine Scout regiments, among them the 26th Cavalry of the last US cavalry charge at Morong (1942).
   - **`USA_CONST_01` — Constabulary Regiments**: The United States Constabulary of occupied Germany and Austria, 1946-1952 (*Circle C Cowboys*): three brigades (Wiesbaden, Munich, Stuttgart), ten regiments with their garrison towns and six squadrons, the 16th in Berlin. For cavalry, motorized and light armor occupation templates.
   ```
6. Append after the last line of the page (the ``- `USA_JUNTA_01` (Federal Emergency Forces)`` bullet), keeping its indentation for the first bullet:
   ```
     - `USA_CONT_01` (Continental Army Divisions): Alternate history built on Secretary of War Lindley Garrison's 1915-16 plan for a federal "Continental Army" in place of the National Guard, named after the Continental Army of the Revolution (*Pennsylvania Line*, *Virginia Line*, *Commander-in-Chief's Guard*, *Morgan's Riflemen*, *Legion of the United States*) and its battles.
   - **Democratic Path (`has_government = democratic`)**:
     - `USA_UNION_01` (Union Divisions): The Union counterpart of the Confederate Divisions (*Army of the Potomac*, *Iron Brigade*, *Irish Brigade*, *Pennsylvania Reserves*, *Lightning Brigade*, *Corps d'Afrique*, *Grand Army of the Republic*).
     - `USA_CCC_01` (Conservation Corps Brigades): Alternate history: the Civilian Conservation Corps (1933-1942) under arms, one brigade per Army Corps Area, with *Roosevelt's Tree Army*, the CCC Indian Division and conservation figures (*John Muir*, *Gifford Pinchot*).
   - **Democratic or Non-Aligned (`has_government = democratic` or `neutrality`)**:
     - `USA_VOL_01` (Volunteer Legions): For divisions sent abroad as volunteers, named after the foreign friends of the Revolution (*Kosciuszko*, *Pulaski*, *von Steuben*, *Rochambeau*, *Gálvez*) and American volunteer precedents (*Lafayette Escadrille*, *Eagle Squadron*, *Flying Tigers*, *Finnish American*).
     - `USA_PLAN_01` (Expeditionary Forces): Alternate-history forces named after the interwar color-coded war plans and the Rainbow plans: Crimson Force (Canada), Orange Force (Japan), Black Force (Germany), Green Force (Mexico), Indigo Force (Iceland), Rainbow Five Force.
   ```

### WORKSHOP_DESCRIPTION_GUIDELINES.md
1. Replace the Cross-Reference row
   > | `zz_INEX_USA_names_divisions.txt` | United States | `USA` | Included (Infantry, Armor, Armored Cavalry Regiments, Separate Tank Bns, National Guard, Airborne, Marines, Marine Raiders, Rangers, Harbor Defenses, State Defense Forces, Red Guards & Lincoln Brigades, Silver Legions & Confederate, MacArthur Emergency Forces) |

   with:
   > | `zz_INEX_USA_names_divisions.txt` | United States | `USA` | Included (Infantry, Regimental Combat Teams, Armor, Armored Cavalry Regiments, Separate Tank & Tank Destroyer Bns, Field Artillery, National Guard, Airborne, Marines, Marine Raiders, Amtracs, Rangers, Harbor Defenses, Overseas Garrisons, Constabulary, State Defense Forces, Red Guards & Lincoln Brigades, Silver Legions & Confederate, MacArthur Emergency Forces & Continental Army, Union & Conservation Corps, Volunteer Legions & Color Plan Forces) |
2. Replace the three bullets under `[b]United States[/b]` (the lines beginning `- Regular Army & Mobile:`, `- Airborne, Marine & Special Forces:` and `- Territorial & Ideology Suites:`) with:
   ```
   - Regular Army & Mobile: 1st–106th Infantry, Regimental Combat Teams ([i]442nd 'Go for Broke'[/i], [i]27th 'Wolfhounds'[/i]), Armored divisions ([i]1st 'Old Ironsides'[/i], [i]2nd 'Hell on Wheels'[/i]), Armored Cavalry Regiments ([i]11th 'Blackhorse'[/i]), Separate Tank and Tank Destroyer Battalions ([i]761st 'Black Panthers'[/i], [i]705th (Bastogne)[/i]), Field Artillery ([i]141st 'Washington Artillery'[/i]), and state National Guard divisions
   - Airborne, Marine & Special Forces: Airborne divisions ([i]82nd 'All-American'[/i], [i]101st 'Screaming Eagles'[/i]), 1st–6th Marines, Marine Raiders ([i]1st 'Edson's'[/i]), Amtrac Battalions ([i]2nd (Tarawa)[/i]), Rangers ([i]1st FSSF 'The Devil's Brigade'[/i], [i]Merrill's Marauders[/i]), Mountain ([i]10th 'Climb to Glory'[/i]), Harbor Defense Commands, Overseas Garrisons ([i]26th Cavalry (Philippine Scouts)[/i]) and the 1946–52 Constabulary
   - Territorial & Ideology Suites: 38 WWII State Defense Forces; Union Divisions ([i]'Iron Brigade'[/i]) and Conservation Corps (democratic); Volunteer Legions ([i]'Lafayette Escadrille'[/i]) and Color Plan forces ([i]Crimson Force (Canada)[/i]) (democratic or non-aligned); Continental Army ([i]'Pennsylvania Line'[/i]) and Federal Emergency Forces (non-aligned); Workers' Red Guards & Lincoln Brigades (communist); Silver Legions & Confederate Divisions (fascist)
   ```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
- Self-check (2026-10-15). No proofreader dispatch: the 237 added names are English; fewer than 25 authored non-English names (Corps d'Afrique, Gálvez, place names), and the user did not ask for one.
  - Every added name is listed under "Verified formations & commanders" or "Author confirmation" (14 items): pass.
  - Every extrapolated group is named as such in the Rationale (`USA_CONT_01`, `USA_CCC_01`, `USA_VOL_01`, `USA_PLAN_01`; `USA_UNION_01` as heritage, like `USA_CONFED_01`): pass.
  - Ordinal suffix matches the key in every `%d` entry (21st, 22nd, 23rd, 111th, 112th, 131st, 141st, 442nd, 632nd, 672nd checked): pass.
  - Selectors are plural and at most 27 characters; no new quoted identity repeats an existing one (`-Audit` on the simulated file): pass.
  - Steps 1-4 dry-run on a copy of the repo: batch, header and comment steps succeeded, every docs anchor matched once, the second `-SyncWiki` reported no missing row, and the Pester suite passed 430 of 432. The two failures came from the copy (no `.git` folder; the knowledge audit read the copy's skills as a second repository).

## Outcome
- Date: 2026-10-15.
- `-Check USA`: Validate OK; Tests 432 Passed, 0 Failed, 0 Skipped; `AUDIT SUMMARY USA: GROUPS=36 AUTHORED=834/1017 FLAGS=1`; Flags: `UNGATED_POLITICAL` x1 (`USA_GAR_01`, kept on judgment); no `Docs:` warnings; Diff vs HEAD: 11 group(s) changed, +241 -0 name(s); `Check passed`.
- Deviations from the plan:
  - Step 4: the first `-SyncWiki USA` also printed `United-States.md: 0 row(s) updated`, a zero-change status line the plan did not list. It was benign: the expected `wiki/Home.md` count line and the 11-tag `no row in wiki table` line were present, and the second run printed no missing row.
  - Plan "Review" counts 237 added names; the batch adds 241 (24 + 20 + 29 + 21 + 23 + 20 + 20 + 26 + 18 + 17 + 23), as the `-Check` diff shows. The planner's count was off; nothing was changed because of it.

## Edit batch
Applied by `build.ps1 -EditNames USA -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{ "addGroup": true, "group": "TD_01", "selector": "Tank Destroyer Battalions",
  "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "%d Tank Destroyer Battalion", "canUse": "is_ai = no", "after": "ARMORED_DETACHMENTS_01",
  "comment": "# =============================================================================\n# Tank Destroyer Battalions\n# =============================================================================\nPlayers only (is_ai = no). Typed as armor, so the gate keeps the automatic choice from giving AI armored templates TD names.\nReal battalion numbers with one battle or attachment each; own number series.\n",
  "add": [
    "1=1st Provisional SPM Group (Bataan)",
    "2=2nd Provisional SPM Group (Bataan)",
    "601=%dst Tank Destroyer Battalion (El Guettar)",
    "609=%dth Tank Destroyer Battalion (10th Armored Division)",
    "612=%dth Tank Destroyer Battalion (Honsfeld)",
    "614=%dth Tank Destroyer Battalion (Climbach)",
    "630=%dth Tank Destroyer Battalion (28th Infantry Division)",
    "632=%dnd Tank Destroyer Battalion (New Guinea)",
    "636=%dth Tank Destroyer Battalion (Salerno)",
    "637=%dth Tank Destroyer Battalion (Luzon)",
    "640=%dth Tank Destroyer Battalion (Bismarck Archipelago)",
    "644=%dth Tank Destroyer Battalion (99th Infantry Division)",
    "645=%dth Tank Destroyer Battalion (Anzio)",
    "701=%dst Tank Destroyer Battalion (Sidi Bou Zid)",
    "702=%dnd Tank Destroyer Battalion (2nd Armored Division)",
    "703=%drd Tank Destroyer Battalion (3rd Armored Division)",
    "704=%dth Tank Destroyer Battalion (4th Armored Division)",
    "705=%dth Tank Destroyer Battalion (Bastogne)",
    "776=%dth Tank Destroyer Battalion (Maknassy)",
    "814=%dth Tank Destroyer Battalion (St. Vith)",
    "823=%drd Tank Destroyer Battalion (Mortain)",
    "827=%dth Tank Destroyer Battalion (Colmar Pocket)",
    "893=%drd Tank Destroyer Battalion (Hürtgen Forest)",
    "899=%dth Tank Destroyer Battalion (Normandy)"
  ] }
```

```json batch
{ "addGroup": true, "group": "ART_01", "selector": "Field Artillery Brigades",
  "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "%d Field Artillery Brigade", "canUse": "is_ai = no", "after": "TD_01",
  "comment": "# =============================================================================\n# Field Artillery Brigades\n# =============================================================================\nPlayers only (is_ai = no). Typed as armor like GER_PANZERARTILLERIE_DIVISION_01: the line artillery battalions are not valid tokens here.\nBrigades, groups, corps artillery and heritage regiments under their real numbers; own number series.\n",
  "add": [
    "5=%dth Field Artillery 'Alexander Hamilton Battery'",
    "23=%drd Field Artillery (Philippine Scouts)",
    "24=%dth Field Artillery (Philippine Scouts)",
    "32=%dnd Field Artillery Brigade",
    "33=%drd Field Artillery Brigade",
    "34=%dth Field Artillery Brigade",
    "35=%dth Field Artillery Group",
    "36=%dth Field Artillery Group",
    "71=%dst Field Artillery Brigade",
    "111=%dth Field Artillery 'Richmond Howitzers'",
    "131=%dst Field Artillery 'Lost Battalion' (Java)",
    "141=%dst Field Artillery 'Washington Artillery'",
    "202=II Corps Artillery (Tunisia)",
    "205=V Corps Artillery (Omaha Beach)",
    "207=VII Corps Artillery (Utah Beach)",
    "208=VIII Corps Artillery (Brest)",
    "220=XX Corps Artillery (Metz)",
    "224=XXIV Corps Artillery (Okinawa)",
    "333=%drd Field Artillery Battalion (Ardennes)",
    "969=%dth Field Artillery Battalion (Bastogne)"
  ] }
```

```json batch
{ "addGroup": true, "group": "RCT_01", "selector": "Regimental Combat Teams",
  "addType": ["infantry"], "fallback": "%d Regimental Combat Team", "after": "GAR_01",
  "comment": "# =============================================================================\n# Regimental Combat Teams\n# =============================================================================\nRegular Army regiments under their special designations and separate regimental combat teams; real regiment numbers, own number series.\n",
  "add": [
    "1=1st Filipino Infantry Regiment",
    "2=2nd Filipino Infantry Regiment",
    "3=%drd Infantry Regiment 'The Old Guard'",
    "6=%dth Infantry Regiment 'Regulars'",
    "7=%dth Infantry Regiment 'Cottonbalers'",
    "9=%dth Infantry Regiment 'Manchus'",
    "14=%dth Infantry Regiment 'Golden Dragons'",
    "15=%dth Infantry Regiment 'Can Do'",
    "17=%dth Infantry Regiment 'Buffalos'",
    "18=%dth Infantry Regiment 'Vanguards'",
    "19=%dth Infantry Regiment 'Rock of Chickamauga'",
    "20=%dth Infantry Regiment 'Sykes' Regulars'",
    "21=%dst Infantry Regiment 'Gimlets'",
    "24=%dth Infantry Regiment (Buffalo Soldiers)",
    "26=%dth Infantry Regiment 'Blue Spaders'",
    "27=%dth Infantry Regiment 'Wolfhounds'",
    "28=%dth Infantry Regiment 'Black Lions'",
    "31=%dst Infantry Regiment (Manila)",
    "34=%dth Infantry Regiment 'Leyte Dragons'",
    "35=%dth Infantry Regiment 'Cacti'",
    "39=%dth Infantry Regiment 'Fighting Falcons'",
    "65=%dth Infantry Regiment 'Borinqueneers'",
    "112=%dth Regimental Combat Team (Arawe)",
    "158=%dth Regimental Combat Team 'Bushmasters'",
    "164=%dth Infantry Regiment (Guadalcanal)",
    "298=%dth Infantry Regiment (Hawaii)",
    "299=%dth Infantry Regiment (Hawaii)",
    "369=%dth Infantry Regiment 'Harlem Hellfighters'",
    "442=%dnd Regimental Combat Team 'Go for Broke'"
  ] }
```

```json batch
{ "addGroup": true, "group": "AMT_01", "selector": "Amtrac Battalions",
  "addType": ["amphibious_armor", "amphibious_mechanized"], "fallback": "%d Amphibian Tractor Battalion", "after": "MAR_BGD_01",
  "comment": "# =============================================================================\n# Amtrac Battalions\n# =============================================================================\nMarine Corps and Army amphibian tractor, amphibian tank and armored amphibian battalions of the Pacific War, one landing each; own number series.\n",
  "add": [
    "1=%dst Amphibian Tractor Battalion (Guadalcanal)",
    "2=%dnd Amphibian Tractor Battalion (Tarawa)",
    "3=%drd Amphibian Tractor Battalion (Iwo Jima)",
    "4=%dth Amphibian Tractor Battalion (Roi-Namur)",
    "5=%dth Amphibian Tractor Battalion (Iwo Jima)",
    "6=%dth Amphibian Tractor Battalion (Peleliu)",
    "8=%dth Amphibian Tractor Battalion (Peleliu)",
    "9=%dth Amphibian Tractor Battalion (Okinawa)",
    "10=%dth Amphibian Tractor Battalion (Saipan)",
    "32=2nd Armored Amphibian Battalion (Iwo Jima)",
    "33=3rd Armored Amphibian Battalion (Peleliu)",
    "534=%dth Amphibian Tractor Battalion (Saipan)",
    "536=%dth Amphibian Tractor Battalion (Okinawa)",
    "672=%dnd Amphibian Tractor Battalion (Los Baños)",
    "708=%dth Amphibian Tank Battalion (Saipan)",
    "715=%dth Amphibian Tractor Battalion (Tinian)",
    "728=%dth Amphibian Tractor Battalion (Tsugen Shima)",
    "773=%drd Amphibian Tractor Battalion (Tinian)",
    "776=%dth Amphibian Tank Battalion (Okinawa)",
    "780=%dth Amphibian Tank Battalion (Leyte)",
    "826=%dth Amphibian Tractor Battalion (Ormoc)"
  ] }
```

```json batch
{ "addGroup": true, "group": "OVS_01", "selector": "Overseas Garrisons",
  "addType": ["infantry"], "fallback": "%d Base Command", "after": "COAST_01",
  "comment": "# =============================================================================\n# Overseas Garrisons\n# =============================================================================\nOverseas departments, defense and base commands of 1936-1945 and the Philippine Scout regiments.\n",
  "add": [
    "1=Hawaiian Department",
    "2=Hawaiian Division",
    "3=Philippine Department",
    "4=Philippine Division",
    "5=Panama Canal Department",
    "6=Caribbean Defense Command",
    "7=Puerto Rican Department",
    "8=Antilles Department",
    "9=Trinidad Sector and Base Command",
    "10=Bermuda Base Command",
    "11=Newfoundland Base Command",
    "12=Greenland Base Command",
    "13=Iceland Base Command",
    "14=Alaska Defense Command",
    "15=Alaskan Department",
    "16=Persian Gulf Command",
    "17=Central Pacific Base Command",
    "18=South Pacific Base Command",
    "19=Guam Insular Force Guard",
    "26=26th Cavalry (Philippine Scouts)",
    "43=43rd Infantry (Philippine Scouts)",
    "45=45th Infantry (Philippine Scouts)",
    "57=57th Infantry (Philippine Scouts)"
  ] }
```

```json batch
{ "addGroup": true, "group": "CONST_01", "selector": "Constabulary Regiments",
  "addType": ["cavalry", "motorized", "light_armor"], "fallback": "%d Constabulary Regiment", "after": "OVS_01",
  "comment": "# =============================================================================\n# United States Constabulary (1946-1952)\n# =============================================================================\nOccupation force of the US Zone of Germany and of Austria; brigades, regiments and squadrons with their garrison towns.\n",
  "add": [
    "1=%dst Constabulary Regiment (Kassel)",
    "2=%dnd Constabulary Regiment (Freising)",
    "3=%drd Constabulary Regiment (Wetzlar)",
    "4=%dth Constabulary Regiment (Austria)",
    "5=%dth Constabulary Regiment (Augsburg)",
    "6=%dth Constabulary Regiment (Bayreuth)",
    "10=%dth Constabulary Regiment (Stuttgart-Möhringen)",
    "11=%dth Constabulary Regiment (Regensburg)",
    "14=%dth Constabulary Regiment (Kitzingen)",
    "15=%dth Constabulary Regiment (Weinheim)",
    "100=United States Constabulary 'Circle C Cowboys'",
    "101=1st Constabulary Brigade (Wiesbaden)",
    "102=2nd Constabulary Brigade (Munich)",
    "103=3rd Constabulary Brigade (Stuttgart)",
    "211=11th Constabulary Squadron (Kassel)",
    "216=16th Constabulary Squadron (Berlin)",
    "224=24th Constabulary Squadron (Bad Hersfeld)",
    "225=25th Constabulary Squadron (Regensburg)",
    "274=74th Constabulary Squadron (Augsburg)",
    "294=94th Constabulary Squadron (Weiden)"
  ] }
```

```json batch
{ "addGroup": true, "group": "CONT_01", "selector": "Continental Army Divisions",
  "addType": ["infantry"], "fallback": "%d Continental Division", "canUse": "has_government = neutrality", "after": "JUNTA_01",
  "comment": "# =============================================================================\n# Continental Army Divisions (Neutrality)\n# =============================================================================\nAlternate history: the federal Continental Army of Secretary of War Lindley Garrison's 1915-16 plan, raised in place of the National Guard.\n",
  "add": [
    "1=%dst Continental Division 'Pennsylvania Line'",
    "2=%dnd Continental Division 'New Jersey Line'",
    "3=%drd Continental Division 'Virginia Line'",
    "4=%dth Continental Division 'Maryland Line'",
    "5=%dth Continental Division 'Connecticut Line'",
    "6=%dth Continental Division 'Delaware Regiment'",
    "7=%dth Continental Division 'Green Mountain Boys'",
    "8=%dth Continental Division 'Commander-in-Chief's Guard'",
    "9=%dth Continental Division 'Morgan's Riflemen'",
    "10=%dth Continental Division 'Marblehead Regiment'",
    "11=%dth Continental Division 'Maryland 400'",
    "12=%dth Continental Division 'Wayne's Light Infantry'",
    "13=%dth Continental Division 'Legion of the United States'",
    "14=%dth Continental Division 'Bunker Hill'",
    "15=%dth Continental Division 'Trenton'",
    "16=%dth Continental Division 'Saratoga'",
    "17=%dth Continental Division 'Valley Forge'",
    "18=%dth Continental Division 'Monmouth'",
    "19=%dth Continental Division 'Cowpens'",
    "20=%dth Continental Division 'Yorktown'"
  ] }
```

```json batch
{ "addGroup": true, "group": "UNION_01", "selector": "Union Divisions",
  "addType": ["infantry", "cavalry"], "fallback": "%d Union Division", "canUse": "has_government = democratic", "after": "CONT_01",
  "comment": "# =============================================================================\n# Union Divisions (Democratic Civil War)\n# =============================================================================\nUnion Army heritage for a democratic United States; counterpart of USA_CONFED_01.\n",
  "add": [
    "1=%dst 'Army of the Potomac' Division",
    "2=%dnd 'Iron Brigade' Division",
    "3=%drd 'Army of the Cumberland' Division",
    "4=%dth 'Army of the Tennessee' Division",
    "5=%dth 'Irish Brigade' Division",
    "6=%dth 'Excelsior Brigade' Division",
    "7=%dth 'Pennsylvania Reserves' Division",
    "8=%dth 'Bucktails' Division",
    "9=%dth 'Philadelphia Brigade' Division",
    "10=%dth 'Vermont Brigade' Division",
    "11=%dth 'Army of the James' Division",
    "12=%dth 'Army of the Shenandoah' Division",
    "13=%dth 'Army of the Ohio' Division",
    "14=%dth 'Army of the Gulf' Division",
    "15=%dth 'Army of the Frontier' Division",
    "16=%dth 'Lightning Brigade' Division",
    "17=%dth 'Berdan's Sharpshooters' Division",
    "18=%dth 'Fire Zouaves' Division",
    "19=%dth 'Corps d'Afrique' Division",
    "20=%dth 'Wolverines' Division",
    "21=%dst 'Grierson's Raiders' Division",
    "22=%dnd 'Lincoln Cavalry' Division",
    "23=%drd 'Harvard Regiment' Division",
    "24=%dth 'Garibaldi Guard' Division",
    "25=%dth 'Kearny's Red Diamond' Division",
    "26=%dth 'Grand Army of the Republic' Division"
  ] }
```

```json batch
{ "addGroup": true, "group": "CCC_01", "selector": "Conservation Corps Brigades",
  "addType": ["infantry", "militia"], "fallback": "%d Conservation Brigade", "canUse": "has_government = democratic", "after": "UNION_01",
  "comment": "# =============================================================================\n# Conservation Corps Brigades (Democratic)\n# =============================================================================\nAlternate history: the Civilian Conservation Corps (1933-1942) under arms, one brigade per Army Corps Area.\n",
  "add": [
    "1=%dst Conservation Brigade (New England)",
    "2=%dnd Conservation Brigade (New York & New Jersey)",
    "3=%drd Conservation Brigade (Pennsylvania & Virginia)",
    "4=%dth Conservation Brigade (Southeast)",
    "5=%dth Conservation Brigade (Ohio Valley)",
    "6=%dth Conservation Brigade (Great Lakes)",
    "7=%dth Conservation Brigade (Great Plains)",
    "8=%dth Conservation Brigade (Southwest)",
    "9=%dth Conservation Brigade (Far West)",
    "10=%dth Conservation Brigade 'Roosevelt's Tree Army'",
    "11=%dth Conservation Brigade 'Robert Fechner'",
    "12=%dth Conservation Brigade 'James McEntee'",
    "13=%dth Conservation Brigade (Indian Division)",
    "14=%dth Conservation Brigade 'Camp Roosevelt'",
    "15=%dth Conservation Brigade 'John Muir'",
    "16=%dth Conservation Brigade 'Gifford Pinchot'",
    "17=%dth Conservation Brigade 'Johnny Appleseed'",
    "18=%dth Conservation Brigade 'Paul Bunyan'"
  ] }
```

```json batch
{ "addGroup": true, "group": "VOL_01", "selector": "Volunteer Legions",
  "addType": ["infantry", "motorized"], "fallback": "%d Volunteer Legion",
  "canUse": "OR = { has_government = democratic has_government = neutrality }", "after": "CCC_01",
  "comment": "# =============================================================================\n# Volunteer Legions (Democratic / Non-Aligned)\n# =============================================================================\nAlternate history: legions for divisions sent abroad as volunteers, named after the foreign friends of the Revolution and American volunteer precedents.\n",
  "add": [
    "1=%dst Volunteer Legion 'Lafayette Escadrille'",
    "2=%dnd Volunteer Legion 'Kosciuszko'",
    "3=%drd Volunteer Legion 'Pulaski'",
    "4=%dth Volunteer Legion 'von Steuben'",
    "5=%dth Volunteer Legion 'de Kalb'",
    "6=%dth Volunteer Legion 'Rochambeau'",
    "7=%dth Volunteer Legion 'Armand'",
    "8=%dth Volunteer Legion 'Lauzun'",
    "9=%dth Volunteer Legion 'Gálvez'",
    "10=%dth Volunteer Legion 'Flying Tigers'",
    "11=%dth Volunteer Legion 'Eagle Squadron'",
    "12=%dth Volunteer Legion 'Finnish American'",
    "13=%dth Volunteer Legion 'American Field Service'",
    "14=%dth Volunteer Legion 'Four Freedoms'",
    "15=%dth Volunteer Legion 'Atlantic Charter'",
    "16=%dth Volunteer Legion 'Arsenal of Democracy'",
    "17=%dth Volunteer Legion 'Good Neighbor'"
  ] }
```

```json batch
{ "addGroup": true, "group": "PLAN_01", "selector": "Expeditionary Forces",
  "addType": ["infantry", "motorized", "mechanized", "marine"], "fallback": "%d Expeditionary Force",
  "canUse": "OR = { has_government = democratic has_government = neutrality }", "after": "VOL_01",
  "comment": "# =============================================================================\n# Color Plan Expeditionary Forces (Democratic / Non-Aligned)\n# =============================================================================\nAlternate history: forces named after the interwar color-coded war plans (target in parentheses) and the Rainbow plans.\n",
  "add": [
    "1=Black Force (Germany)",
    "2=Orange Force (Japan)",
    "3=Red Force (British Empire)",
    "4=Crimson Force (Canada)",
    "5=Scarlet Force (Australia)",
    "6=Garnet Force (New Zealand)",
    "7=Ruby Force (India)",
    "8=Emerald Force (Irish Free State)",
    "9=Green Force (Mexico)",
    "10=Gold Force (France)",
    "11=Gray Force (Azores)",
    "12=Brown Force (Philippines)",
    "13=Tan Force (Cuba)",
    "14=Yellow Force (China)",
    "15=Purple Force (South America)",
    "16=Violet Force (Latin America)",
    "17=White Force (Domestic Emergency)",
    "18=Indigo Force (Iceland)",
    "21=Rainbow One Force",
    "22=Rainbow Two Force",
    "23=Rainbow Three Force",
    "24=Rainbow Four Force",
    "25=Rainbow Five Force"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| RCT_01 | new, 29 | 1st Filipino Infantry Regiment, 2nd Filipino Infantry Regiment, %drd Infantry Regiment 'The Old Guard', %dth Infantry Regiment 'Regulars', %dth Infantry Regiment 'Cottonbalers', %dth Infantry Regiment 'Manchus', %dth Infantry Regiment 'Golden Dragons', %dth Infantry Regiment 'Can Do', %dth Infantry Regiment 'Buffalos', %dth Infantry Regiment 'Vanguards', %dth Infantry Regiment 'Rock of Chickamauga', %dth Infantry Regiment 'Sykes' Regulars', %dst Infantry Regiment 'Gimlets', %dth Infantry Regiment (Buffalo Soldiers), %dth Infantry Regiment 'Blue Spaders', %dth Infantry Regiment 'Wolfhounds', %dth Infantry Regiment 'Black Lions', %dst Infantry Regiment (Manila), %dth Infantry Regiment 'Leyte Dragons', %dth Infantry Regiment 'Cacti', %dth Infantry Regiment 'Fighting Falcons', %dth Infantry Regiment 'Borinqueneers', %dth Regimental Combat Team (Arawe), %dth Regimental Combat Team 'Bushmasters', %dth Infantry Regiment (Guadalcanal), %dth Infantry Regiment (Hawaii) (x2), %dth Infantry Regiment 'Harlem Hellfighters', %dnd Regimental Combat Team 'Go for Broke' | - | - |
| TD_01 | new, 24 | 1st Provisional SPM Group (Bataan), 2nd Provisional SPM Group (Bataan), %dst Tank Destroyer Battalion (El Guettar), %dth Tank Destroyer Battalion (10th Armored Division), %dth Tank Destroyer Battalion (Honsfeld), %dth Tank Destroyer Battalion (Climbach), %dth Tank Destroyer Battalion (28th Infantry Division), %dnd Tank Destroyer Battalion (New Guinea), %dth Tank Destroyer Battalion (Salerno), %dth Tank Destroyer Battalion (Luzon), %dth Tank Destroyer Battalion (Bismarck Archipelago), %dth Tank Destroyer Battalion (99th Infantry Division), %dth Tank Destroyer Battalion (Anzio), %dst Tank Destroyer Battalion (Sidi Bou Zid), %dnd Tank Destroyer Battalion (2nd Armored Division), %drd Tank Destroyer Battalion (3rd Armored Division), %dth Tank Destroyer Battalion (4th Armored Division), %dth Tank Destroyer Battalion (Bastogne), %dth Tank Destroyer Battalion (Maknassy), %dth Tank Destroyer Battalion (St. Vith), %drd Tank Destroyer Battalion (Mortain), %dth Tank Destroyer Battalion (Colmar Pocket), %drd Tank Destroyer Battalion (Hürtgen Forest), %dth Tank Destroyer Battalion (Normandy) | - | - |
| ART_01 | new, 20 | %dth Field Artillery 'Alexander Hamilton Battery', %drd Field Artillery (Philippine Scouts), %dth Field Artillery (Philippine Scouts), %dnd Field Artillery Brigade, %drd Field Artillery Brigade, %dth Field Artillery Brigade, %dth Field Artillery Group (x2), %dst Field Artillery Brigade, %dth Field Artillery 'Richmond Howitzers', %dst Field Artillery 'Lost Battalion' (Java), %dst Field Artillery 'Washington Artillery', II Corps Artillery (Tunisia), V Corps Artillery (Omaha Beach), VII Corps Artillery (Utah Beach), VIII Corps Artillery (Brest), XX Corps Artillery (Metz), XXIV Corps Artillery (Okinawa), %drd Field Artillery Battalion (Ardennes), %dth Field Artillery Battalion (Bastogne) | - | - |
| AMT_01 | new, 21 | %dst Amphibian Tractor Battalion (Guadalcanal), %dnd Amphibian Tractor Battalion (Tarawa), %drd Amphibian Tractor Battalion (Iwo Jima), %dth Amphibian Tractor Battalion (Roi-Namur), %dth Amphibian Tractor Battalion (Iwo Jima), %dth Amphibian Tractor Battalion (Peleliu) (x2), %dth Amphibian Tractor Battalion (Okinawa) (x2), %dth Amphibian Tractor Battalion (Saipan) (x2), 2nd Armored Amphibian Battalion (Iwo Jima), 3rd Armored Amphibian Battalion (Peleliu), %dnd Amphibian Tractor Battalion (Los Baños), %dth Amphibian Tank Battalion (Saipan), %dth Amphibian Tractor Battalion (Tinian), %dth Amphibian Tractor Battalion (Tsugen Shima), %drd Amphibian Tractor Battalion (Tinian), %dth Amphibian Tank Battalion (Okinawa), %dth Amphibian Tank Battalion (Leyte), %dth Amphibian Tractor Battalion (Ormoc) | - | - |
| OVS_01 | new, 23 | Hawaiian Department, Hawaiian Division, Philippine Department, Philippine Division, Panama Canal Department, Caribbean Defense Command, Puerto Rican Department, Antilles Department, Trinidad Sector and Base Command, Bermuda Base Command, Newfoundland Base Command, Greenland Base Command, Iceland Base Command, Alaska Defense Command, Alaskan Department, Persian Gulf Command, Central Pacific Base Command, South Pacific Base Command, Guam Insular Force Guard, 26th Cavalry (Philippine Scouts), 43rd Infantry (Philippine Scouts), 45th Infantry (Philippine Scouts), 57th Infantry (Philippine Scouts) | - | - |
| CONST_01 | new, 20 | %dst Constabulary Regiment (Kassel), %dnd Constabulary Regiment (Freising), %drd Constabulary Regiment (Wetzlar), %dth Constabulary Regiment (Austria), %dth Constabulary Regiment (Augsburg), %dth Constabulary Regiment (Bayreuth), %dth Constabulary Regiment (Stuttgart-Möhringen), %dth Constabulary Regiment (Regensburg), %dth Constabulary Regiment (Kitzingen), %dth Constabulary Regiment (Weinheim), United States Constabulary 'Circle C Cowboys', 1st Constabulary Brigade (Wiesbaden), 2nd Constabulary Brigade (Munich), 3rd Constabulary Brigade (Stuttgart), 11th Constabulary Squadron (Kassel), 16th Constabulary Squadron (Berlin), 24th Constabulary Squadron (Bad Hersfeld), 25th Constabulary Squadron (Regensburg), 74th Constabulary Squadron (Augsburg), 94th Constabulary Squadron (Weiden) | - | - |
| CONT_01 | new, 20 | %dst Continental Division 'Pennsylvania Line', %dnd Continental Division 'New Jersey Line', %drd Continental Division 'Virginia Line', %dth Continental Division 'Maryland Line', %dth Continental Division 'Connecticut Line', %dth Continental Division 'Delaware Regiment', %dth Continental Division 'Green Mountain Boys', %dth Continental Division 'Commander-in-Chief's Guard', %dth Continental Division 'Morgan's Riflemen', %dth Continental Division 'Marblehead Regiment', %dth Continental Division 'Maryland 400', %dth Continental Division 'Wayne's Light Infantry', %dth Continental Division 'Legion of the United States', %dth Continental Division 'Bunker Hill', %dth Continental Division 'Trenton', %dth Continental Division 'Saratoga', %dth Continental Division 'Valley Forge', %dth Continental Division 'Monmouth', %dth Continental Division 'Cowpens', %dth Continental Division 'Yorktown' | - | - |
| UNION_01 | new, 26 | %dst 'Army of the Potomac' Division, %dnd 'Iron Brigade' Division, %drd 'Army of the Cumberland' Division, %dth 'Army of the Tennessee' Division, %dth 'Irish Brigade' Division, %dth 'Excelsior Brigade' Division, %dth 'Pennsylvania Reserves' Division, %dth 'Bucktails' Division, %dth 'Philadelphia Brigade' Division, %dth 'Vermont Brigade' Division, %dth 'Army of the James' Division, %dth 'Army of the Shenandoah' Division, %dth 'Army of the Ohio' Division, %dth 'Army of the Gulf' Division, %dth 'Army of the Frontier' Division, %dth 'Lightning Brigade' Division, %dth 'Berdan's Sharpshooters' Division, %dth 'Fire Zouaves' Division, %dth 'Corps d'Afrique' Division, %dth 'Wolverines' Division, %dst 'Grierson's Raiders' Division, %dnd 'Lincoln Cavalry' Division, %drd 'Harvard Regiment' Division, %dth 'Garibaldi Guard' Division, %dth 'Kearny's Red Diamond' Division, %dth 'Grand Army of the Republic' Division | - | - |
| CCC_01 | new, 18 | %dst Conservation Brigade (New England), %dnd Conservation Brigade (New York & New Jersey), %drd Conservation Brigade (Pennsylvania & Virginia), %dth Conservation Brigade (Southeast), %dth Conservation Brigade (Ohio Valley), %dth Conservation Brigade (Great Lakes), %dth Conservation Brigade (Great Plains), %dth Conservation Brigade (Southwest), %dth Conservation Brigade (Far West), %dth Conservation Brigade 'Roosevelt's Tree Army', %dth Conservation Brigade 'Robert Fechner', %dth Conservation Brigade 'James McEntee', %dth Conservation Brigade (Indian Division), %dth Conservation Brigade 'Camp Roosevelt', %dth Conservation Brigade 'John Muir', %dth Conservation Brigade 'Gifford Pinchot', %dth Conservation Brigade 'Johnny Appleseed', %dth Conservation Brigade 'Paul Bunyan' | - | - |
| VOL_01 | new, 17 | %dst Volunteer Legion 'Lafayette Escadrille', %dnd Volunteer Legion 'Kosciuszko', %drd Volunteer Legion 'Pulaski', %dth Volunteer Legion 'von Steuben', %dth Volunteer Legion 'de Kalb', %dth Volunteer Legion 'Rochambeau', %dth Volunteer Legion 'Armand', %dth Volunteer Legion 'Lauzun', %dth Volunteer Legion 'Gálvez', %dth Volunteer Legion 'Flying Tigers', %dth Volunteer Legion 'Eagle Squadron', %dth Volunteer Legion 'Finnish American', %dth Volunteer Legion 'American Field Service', %dth Volunteer Legion 'Four Freedoms', %dth Volunteer Legion 'Atlantic Charter', %dth Volunteer Legion 'Arsenal of Democracy', %dth Volunteer Legion 'Good Neighbor' | - | - |
| PLAN_01 | new, 23 | Black Force (Germany), Orange Force (Japan), Red Force (British Empire), Crimson Force (Canada), Scarlet Force (Australia), Garnet Force (New Zealand), Ruby Force (India), Emerald Force (Irish Free State), Green Force (Mexico), Gold Force (France), Gray Force (Azores), Brown Force (Philippines), Tan Force (Cuba), Yellow Force (China), Purple Force (South America), Violet Force (Latin America), White Force (Domestic Emergency), Indigo Force (Iceland), Rainbow One Force, Rainbow Two Force, Rainbow Three Force, Rainbow Four Force, Rainbow Five Force | - | - |

Unchanged: INF_01, GAR_01, CAV_01, MOT_01, MEC_01, ARM_01, ACR_01, ARMORED_DETACHMENTS_01, PAR_01, MAR_01, MAR_BGD_01, MNT_01, RANGER_FORCE_01, COMPOSITE_UNITS_01, DEF_01, COAST_01, MIL_01, SHOCK_01, COM_GUARD_01, COM_BGD_01, COM_ARM_01, FASCIST_01, PARAMILITARY_01, CONFED_01, JUNTA_01
<!-- END CHANGE TABLE -->
