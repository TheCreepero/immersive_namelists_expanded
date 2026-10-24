# Spain (SPR) Namelist Plan - 2026-10-09

Status: DONE

File: `common/units/names_divisions/INEX_SPR_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Spain (SPR) has no INEX file. Vanilla ships 21 groups in `SPR_names_divisions.txt`, all `for_countries = { SPR }`: nine line and specialist groups whose entries only repeat the fallback, `SPR_GAR_01` with 18 misspelled command names, `SPA_INF_01` (Nationalist infantry, gated by a focus) and twelve political groups with an empty `ordered` block that the civil-war events and focuses assign to spawned units. Ordinals are written `1a` and `1°`. Goal: override the vanilla groups with correct Spanish and real names, so that event-spawned civil-war units are named too, and add a full suite of historical and ideology-gated lists.

## Decisions
User policy answers (2026-10-09):
- **Name policy**: verified formations first, then plausible extrapolation in the same naming pattern. Every extrapolated name is on "Author confirmation".
- **Ideology suites**: all four. Republican People's Army (with the Basque and Catalan forces), Nationalist and Falange, Carlist and monarchist, revolutionary left (anarchist, communist, POUM), each in its own lists.
- **Plain/named pairs**: infantry and armor. Motorized and mechanized stay plain.
- **Vanilla event groups**: overridden with real names; gates move from vanilla's `always = yes` to government type by side, and the security corps and the Army of Africa stay open to all.

Design decisions (all final):
- **Language and ordinals**: Castilian Spanish with full diacritics. Vanilla's `%da` and `%d°` become the Spanish ordinal abbreviations `%d.ª` (feminine: División, Brigada, Bandera, Comandancia) and `%d.º` (masculine: Tercio, Grupo); authored first and third masculine units use `1.er`, `3.er`. Regiments, post-war divisions and battalions put the number last (`Regimiento de Infantería 'Wad-Ras' n.º 1`, `División de Infantería n.º %d`). Legion and paratroop banderas use Roman numerals (`%s`). Honorifics are in single quotes, as INEX does elsewhere; columns carry their name without quotes (`Columna Durruti`). Selectors are English with INEX's American spelling.
- **Other languages**: the Basque battalions keep their Basque names in the period spelling (`Euzko`, `Euzkadi`) inside the Spanish title `Batallón '...'`, which is how the Euzko Gudarostea's orders wrote them; vanilla's `Eskuadroia` (squadron) is dropped. The Catalan list is in Catalan (`Regiment Pirinenc núm. 1 de Catalunya`). International Brigade units keep the volunteers' own spelling (`Thälmann`, `Dąbrowski`, `Đuro Đaković`); the PCE battalion keeps the period Spanish `Thaelmann`.
- **Every vanilla tag is overridden** (21 groups) and 17 new tags are added. Every group stays `for_countries = { SPR }`, as in vanilla: the civil-war tags have no namelist of their own and the events hand SPR groups to their templates.
- **Two infantry pairs**. Vanilla has two infantry lists, so each gets a plain and a named variant. `SPR_INF_01` "Republican Infantry" (plain, fallback only: vanilla's 20 entries only repeat the fallback) with `SPR_INF_07` "Republican Infantry (Named)"; `SPA_INF_01` "Nationalist Infantry" (plain, keeps vanilla's 55 numbered keys, because they follow the 1939 army's corps numbering and have gaps) with `SPA_INF_02` "Nationalist Infantry (Named)". The Republican fallback is `%d.ª División` (the People's Army numbered divisions without an arm); the Nationalist one is `División de Infantería n.º %d` (the post-war form).
- **Armor pair**: `SPR_ARM_01` plain, fallback only, `División Acorazada n.º %d` (the Spanish term; vanilla wrote Blindada); `SPR_ARM_02` named. Vanilla's one nickname, Brunete, moves to the named variant. Motorized and mechanized stay plain by the user's answer; `SPR_MEC_01` links `SPR_MOT_01` so the mobile family shares one numbering.
- **The People's Army is one tradition**: `SPR_INF_07` and `SPD_INF_03` keep the names divisions and brigades officially carried over from their columns (`Líster`, `Durruti`, `Carlos Marx`, `Ascaso`, `Lenin`, `Macià-Companys`), because that is the army's real order of battle. The party militias themselves (anarchist, communist, POUM, socialist) are separate lists and never share one.
- **Gating by government type only**. The game files the Republic as `democratic`, the Nationalist Directory and the Carlists as `neutrality`, the Falange path as `fascism`, the Stalinist and POUM paths as `communism` and the Anarchist Commune as `neutrality` (`anarchism`). Non-aligned therefore covers three opposed camps, and focus gates are banned, so:
  - Republican-side groups that vanilla's events and focuses assign (`SPR_INF_01`, `SPR_INF_07`, `SPD_INF_01` to `SPD_INF_06`) use vanilla's own Republican gate, `NOT = { has_government = fascism }`. This keeps the Anarchist Commune's own lists usable; a non-aligned Nationalist Spain sees them too.
  - Nationalist-side groups (`SPA_INF_01`, `SPA_INF_02`, `SPR_INF_02`, `SPR_INF_03`) use `OR = { has_government = fascism has_government = neutrality }`, which replaces vanilla's focus gate on `SPA_INF_01`.
  - New groups with no scripted reference are gated tightly: Falange and the volunteer divisions `fascism`; the royal regiments `neutrality`; International Brigades, Catalan columns and guerrilla groups `democratic` or `communism`; the PCE and POUM lists `communism`.
  - The army's own lists, the Army of Africa, the Legion, the Guardia Civil, the Assault Guards and the Carabineros are open to every government; vanilla's events give the Guardia Civil and Assault Guard groups to both sides.
- **Vanilla's swapped references are followed, not its labels**: the focus gives `SPD_INF_05` to the Basque template and the event gives `SPD_INF_04` to the template "Brigada Anarquista". So `SPD_INF_05` is "Basque Battalions" and `SPD_INF_04` is "Anarchist Battalions". `SPD_INF_02` is also given to vanilla's POUM youth template; it holds the socialist battalions and that template gets their names.
- **Invented vanilla terms replaced**: `Brigada Popular` by `Brigada Mixta`; `Brigada de Juventudes Sindicales` by UGT and JSU battalions; `Brigada de la Guardia Civil` by tercios; `División de la Guardia de Asalto` by `Grupo de Asalto`; `%d° Requeté` by `Tercio de Requetés`; `Guarnición Nacionalista` and `Guarnición Republicana` by the garrisons of July 1936 with the fallbacks `Batallón de Guarnición n.º %d` and `Batallón de Retaguardia n.º %d`.
- **Legion**: the banderas named after Nationalist commanders and victories (IX General Franco, XIII General Mola, XIV Ciudad de Badajoz, XVII Coronel Yagüe) are left out, because the list is open to every government.
- **Royal titles** are split from the open lists: infantry and cavalry regiments with royal names are in `SPR_ROY_01` and `SPR_ROY_02` (`neutrality`); `SPR_REG_01` holds the July 1936 regiments, whose names the Republic itself restored in 1935, and `SPR_CAV_02` the remaining cavalry regiments.
- **Two numbering eras in `SPR_REG_01`**: keys 1-32 are the July 1936 regiments; keys 41-50 are island and other regiments under their 1943 numbers.
- **Not authored**: no named motorized or mechanized lists (user's answer); no Asturian or Santander militia list (no roster was found; their divisions are in `SPR_INF_07`); no Republican armor list (the People's Army's tank units carried no names); no Italian CTV or Condor Legion units beyond the mixed Flechas divisions.
- **Tooling workaround**: `-EditNames -AddGroup` puts `SPR_` in front of a new tag that does not start with it, so the seven vanilla tags `SPA_INF_01` and `SPD_INF_01` to `SPD_INF_06`, and the new `SPA_INF_02`, are created as `SPR_SPA_INF_01` and so on. Step 2 renames them with one command. Logged in `docs/tooling-backlog.md`.

## Vanilla findings (`-InspectVanilla SPR`)
The civil-war tags SPA, SPB, SPC and SPD have no namelist file and no `history/countries` file; every vanilla group is `for_countries = { SPR }` and the events assign SPR groups to SPD templates directly. In the civil-war event the side that keeps the SPR tag gets the Nationalist templates (leader Sanjurjo, `neutrality`) and SPD gets the Republican ones.

Governments, read from `history/countries/SPR - Spain.txt`, `common/national_focus/spain.txt` and `common/ideologies/00_ideologies.txt`: the Republic is `democratic`; the Nationalist Directory and the Carlists are `neutrality`; the Falange path is `fascism` (the 1939 bookmark is `fascism`, or `neutrality` in one DLC branch); the Stalinist and POUM paths are `communism`; the Anarchist Commune is `anarchism`, a sub-ideology of `neutrality`.

| Tag | Vanilla state | Action |
|---|---|---|
| SPR_INF_01 | "Republican Infantry", `%da División de Infantería`, 20 entries that repeat the fallback (1-20), gate `NOT fascism`, scripted | plain variant, fallback only, same gate; the 20 stubs are dropped (a 1..N run) |
| SPA_INF_01 | "Nationalist Infantry", same fallback, 55 stub entries at keys 11-16, 21-26, 31-36, 41-46, 51-56, 61-66, 71-76, 81-85, 91-94, 101-104, gate `fascism` or a focus, scripted (1939 OOB) | plain variant; all 55 keys kept with the new fallback text; focus gate replaced |
| SPR_CAV_01 | `%da División de Caballería`, 10 stubs, scripted (OOB) | fallback only; stubs dropped |
| SPR_MOT_01 | `%da División Motorizada`, 10 stubs | fallback only; stubs dropped |
| SPR_MEC_01 | `%da División Mecanizada`, 10 stubs | fallback only, links SPR_MOT_01; stubs dropped |
| SPR_ARM_01 | `%da División Blindada`, 9 stubs and `1a Div. Blindada 'Brunete'` | plain variant, fallback only; Brunete moves to SPR_ARM_02 key 1 |
| SPR_PAR_01 | `%da División Aerotransportada`, 10 stubs | override with banderas; stubs dropped |
| SPR_MAR_01 | `%da Div. de Infantería de Marina`, 10 stubs | override with tercios; stubs dropped |
| SPR_MNT_01 | `%da División de Montaña`, 10 stubs, scripted (OOB) | override with named divisions; stubs dropped |
| SPR_GAR_01 | `%da División de Guarnición`, 18 command names (`Galacia`, `Coruna`, `Zaragosa`, `Circunscripción Morocco`, `Circunscripción Maestrazgo`), scripted (OOB) | all 18 kept under the same keys, corrected; key 4 (Maestrazgo, not a real command) becomes the Circunscripción Oriental de Marruecos and key 7 (Galacia, a region) becomes El Ferrol; 10 added |
| SPR_INF_02 | "Nationalist Garrisons", `%da Guarnición Nacionalista`, empty, scripted | override with 33 garrisons |
| SPR_INF_03 | "Carlist Requetés", `%d° Requeté`, empty, scripted | override with 26 tercios |
| SPR_INF_04 | "Guardia Civil", `%da Brigada de la Guardia Civil`, empty, scripted (both sides) | override with 24 tercios |
| SPR_INF_05 | "Guardia de Asalto", `%da División de la Guardia de Asalto`, empty, scripted (both sides) | override with 16 groups |
| SPR_INF_06 | "Army of Africa", `%da División del Ejército de África`, empty, scripted | override with 23 units |
| SPD_INF_01 | "Republican Garrisons", `%da Guarnición Republicana`, empty, scripted | override with 24 garrisons |
| SPD_INF_02 | "Union Youth Brigade", `%da Brigada de Juventudes Sindicales`, empty, scripted | override as "Socialist Battalions", 32 names |
| SPD_INF_03 | "Popular Brigade", `%da Brigada Popular`, empty, scripted | override as "Mixed Brigades", 36 names |
| SPD_INF_04 | "Euzko Gudarosteko Eskuadroia", `Euzko Gudarosteko %da Eskuadroia`, empty, scripted for the anarchist brigade template | override as "Anarchist Battalions", 26 names |
| SPD_INF_05 | "Anarchist Brigade", `%da Brigada Anarquista`, empty, scripted for the Basque template | override as "Basque Battalions", 31 names |
| SPD_INF_06 | "Anarchist Militia", `%da Milicia Anarquista`, empty, scripted | override as "Anarchist Columns", 21 names |

Every vanilla political group is `always = yes`. New tags avoid the 21 above; the named infantry variants take the next free numbers, `SPR_INF_07` and `SPA_INF_02`.

Scripted references (template name -> group), from `events/LAR_Spain.txt`, `common/national_focus/spain.txt`, `history/units/SPR_1936.txt`, `SPA_1939.txt`, `chile.txt`, `04_mtg_on_actions.txt` and `SOV_scripted_effects.txt`:
- `SPR_INF_01`: the 1936 and civil-war infantry, "Carabineros", "Fifth Columnist Brigade", the Chilean and Mapuche templates.
- `SPA_INF_01`: the 1939 infantry. `SPR_CAV_01`, `SPR_MNT_01`, `SPR_GAR_01`: the 1936 and 1939 orders of battle.
- `SPR_INF_02`: "Guarnición Nacionalista". `SPR_INF_03`: "Requeté Carlista". `SPR_INF_04`: "Brigada de la Guardia Civil" (both sides). `SPR_INF_05`: "División de la Guardia de Asalto" (both sides). `SPR_INF_06`: "División del Ejército de África".
- `SPD_INF_01`: "Guarnición Republicana". `SPD_INF_02`: "Brigada de Juventudes Sindicales" and "Brigada de las Juventudes del POUM". `SPD_INF_03`: "Brigada Popular". `SPD_INF_06`: "Anarchist Militia".
- Vanilla swaps two references: the template "Brigada Anarquista" is given `SPD_INF_04` (vanilla's Basque group) and the template "Euzko Gudarosteko Eskuadroia" is given `SPD_INF_05` (vanilla's "Anarchist Brigade" group).

## Group suite
In file order. "not fascism" is `NOT = { has_government = fascism }`; "fascism or neutrality" is `OR = { has_government = fascism has_government = neutrality }`; "democratic or communism" is `OR = { has_government = democratic has_government = communism }`.

| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| SPR_INF_01 | Republican Infantry | infantry | not fascism | - | `%d.ª División` | 0 |
| SPR_INF_07 | Republican Infantry (Named) | infantry | not fascism | SPR_INF_01 | `%d.ª División` | 31 |
| SPA_INF_01 | Nationalist Infantry | infantry | fascism or neutrality | - | `División de Infantería n.º %d` | 55 |
| SPA_INF_02 | Nationalist Infantry (Named) | infantry | fascism or neutrality | SPA_INF_01 | `División de Infantería n.º %d` | 36 |
| SPR_MOT_01 | Motorized Divisions | motorized | always | - | `%d.ª División Motorizada` | 0 |
| SPR_MEC_01 | Mechanized Divisions | mechanized | always | SPR_MOT_01 | `%d.ª División Mecanizada` | 0 |
| SPR_ARM_01 | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | always | - | `División Acorazada n.º %d` | 0 |
| SPR_ARM_02 | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | always | SPR_ARM_01 | `División Acorazada n.º %d` | 14 |
| SPR_REG_01 | Infantry Regiments | infantry | always | - | `Regimiento de Infantería n.º %d` | 37 |
| SPR_CAV_01 | Cavalry Divisions | cavalry | always | - | `%d.ª División de Caballería` | 0 |
| SPR_CAV_02 | Cavalry Regiments | cavalry | always | - | `Regimiento de Caballería n.º %d` | 21 |
| SPR_MNT_01 | Mountain Divisions | mountaineers | always | - | `División de Montaña n.º %d` | 12 |
| SPR_MNT_02 | Mountain Battalions | mountaineers | always | - | `Batallón de Cazadores de Montaña n.º %d` | 18 |
| SPR_MAR_01 | Marine Tercios | marine | always | - | `%d.º Tercio de Infantería de Marina` | 12 |
| SPR_PAR_01 | Paratrooper Banderas | paratrooper | always | - | `%s Bandera Paracaidista` | 7 |
| SPR_GAR_01 | Garrison Commands | infantry | always | - | `%d.ª Agrupación de Guarnición` | 28 |
| SPR_INF_06 | Army of Africa | infantry | always | - | `Grupo de Regulares n.º %d` | 23 |
| SPR_LEG_01 | Legion Banderas | infantry | always | - | `%s Bandera de La Legión` | 19 |
| SPR_INF_04 | Guardia Civil Tercios | infantry | always | - | `%d.º Tercio de la Guardia Civil` | 24 |
| SPR_INF_05 | Assault Guards | infantry | always | - | `%d.º Grupo de Asalto` | 16 |
| SPR_CAR_01 | Carabineros | infantry | always | - | `%d.ª Comandancia de Carabineros` | 20 |
| SPR_INF_02 | Nationalist Garrisons | infantry | fascism or neutrality | - | `Batallón de Guarnición n.º %d` | 33 |
| SPR_INF_03 | Requeté Tercios | infantry | fascism or neutrality | - | `%d.º Tercio de Requetés` | 26 |
| SPR_FAL_01 | Falange Banderas | infantry, militia | has_government = fascism | - | `%d.ª Bandera de Falange` | 24 |
| SPR_VOL_01 | Volunteer Divisions | infantry | has_government = fascism | - | `%d.ª División Española de Voluntarios` | 13 |
| SPR_ROY_01 | Royal Regiments | infantry | has_government = neutrality | - | `Regimiento de la Guardia Real n.º %d` | 10 |
| SPR_ROY_02 | Royal Cavalry Regiments | cavalry | has_government = neutrality | - | `Regimiento de Caballería de la Guardia Real n.º %d` | 10 |
| SPD_INF_03 | Mixed Brigades | infantry | not fascism | - | `%d.ª Brigada Mixta` | 36 |
| SPR_INT_01 | International Brigades | infantry | democratic or communism | - | `%d.ª Brigada Internacional` | 34 |
| SPD_INF_01 | Republican Garrisons | infantry | not fascism | - | `Batallón de Retaguardia n.º %d` | 24 |
| SPD_INF_02 | Socialist Battalions | infantry | not fascism | - | `Batallón UGT n.º %d` | 32 |
| SPD_INF_05 | Basque Battalions | infantry | not fascism | - | `Euzko Gudarostea, Batallón n.º %d` | 31 |
| SPR_CAT_01 | Catalan Columns | infantry, militia | democratic or communism | - | `Columna Catalana núm. %d` | 16 |
| SPR_GUE_01 | Guerrilla Groups | infantry, militia | democratic or communism | - | `%d.ª Agrupación Guerrillera` | 19 |
| SPR_RED_01 | People's Militia Battalions | infantry, militia | has_government = communism | - | `Batallón de Milicias Populares n.º %d` | 30 |
| SPR_POU_01 | POUM Columns | infantry, militia | has_government = communism | - | `Columna del POUM n.º %d` | 13 |
| SPD_INF_06 | Anarchist Columns | infantry, militia | not fascism | - | `Columna Confederal n.º %d` | 21 |
| SPD_INF_04 | Anarchist Battalions | infantry | not fascism | - | `Batallón Confederal n.º %d` | 26 |
| **Total** | | | | | | **38 groups, 771 names** |

## Research record
- **inex-historical-researcher**, three runs, about 95 web calls in all. Run 1 (38 calls): regular army, Nationalist side, Army of Africa, security corps, Falange, Carlists. Run 2 (19 calls, in parallel): People's Army, International Brigades, party militias, Basque and Catalan forces. Run 3 (38 calls): a narrow check of draft rosters.
- **Main sources**: es.wikipedia (Anexo:Divisiones and Anexo:Brigadas Mixtas del Ejército Popular de la República, Euzko Gudarostea, Brigadas Internacionales, Quinto Regimiento, Legión Española, División Azul, Milicia Nacional), en.wikipedia (Requeté, Brigades of Navarre, Confederal militias, Regulares, Spanish Army of Africa, 13th Division), es.hispanopedia.com (Anexo:Regimientos de Infantería de España), amigosdelamili.com (the eight Divisiones Orgánicas of 1936, a fan site and the only source for the 1936 regiment roster), ejercito.defensa.gob.es (paratroops), boe.es (the Nationalist decree of 2 October 1936).
- **Unreachable or unsettled**: the es.wikipedia lists of Nationalist divisions, Guardia Civil tercios, Assault Guard groups and Carabineros comandancias; the Defence ministry's cavalry index; requetes.es. So the post-war division names, the Guardia Civil numbers, the Assault Guard and Carabineros seats and the cavalry arms rest on memory or extrapolation and are listed under "Author confirmation".
- **Government mapping**: read directly from the vanilla files named under "Vanilla findings".
- **Researched and not used**: Asturian and Santander battalion names (no roster), `Batallón Alpino del Guadarrama` (unverified), the 1936 cavalry numbering (sources conflict; the pre-1931 numbering is used), the unverified Requeté names (Santiago, del Rey, Santa Gadea, Numancia, Covadonga and others).

## Author confirmation
Entries held for the author. "From memory" means well known to the planner but not found in a fetched source; "extrapolated" means built in a verified pattern.
- **SPR_INF_07**: `'La Heroica'` (43.ª) and `'El Campesino'` (46.ª) are from memory. Vasca, Santanderina and Asturiana render the divisions' former titles (1.ª División vasca and so on). Keys 78-81 are real provisional divisions that had no number.
- **SPA_INF_02**: verified are the six Divisiones de Navarra and the División de Soria. From memory: División de Ávila, `'Guadarrama' n.º 11`, `'Guzmán el Bueno' n.º 21`, `'Maestrazgo' n.º 31` (names the divisions took after 1945) and `'Mano Negra'` for the 13.ª. Every other honorific is extrapolated: corps names (Aragón, Castilla, Galicia, Turia), regiment names (San Marcial, San Quintín, Belchite, Teruel, Arapiles, Covadonga), battles, and the 1939 seats of divisions 91-93 and 101-102 (Tetuán, Larache, Xauen, Melilla, Alhucemas).
- **SPR_ARM_02**: only `'Brunete' n.º 1` is real (1943). Keys 2-14 are extrapolated from the cavalry regiments that became Spain's armored regiments.
- **SPR_REG_01**: keys 1-32 come from one fan site. Key 8 is `'Vitoria'`, the 1935 name; `'Álava'` is also attested. Keys 41-50 are verified 1943 numbers.
- **SPR_CAV_02**, **SPR_ROY_02**: the pre-1931 numbering. Numbers 5, 7-14, 18 and 23 are verified; the arms (Lanceros, Dragones, Cazadores, Húsares) and every other number are from memory.
- **SPR_MNT_01**: only `'Urgel' n.º 4` and `'Navarra' n.º 5` are real (1960s). The other ten are extrapolated from Pyrenean and mountain geography.
- **SPR_MNT_02**: keys 5-8 are verified. Keys 1-4 are from memory, names and numbers. Key 9 is verified as a later battalion (IX). Keys 10-14 are older cazadores battalion names with numbers given here. Keys 15-18 are verified.
- **SPR_MAR_01**: keys 1-4 are well known but unverified as period names. Keys 5-6 are verified groupings with an extrapolated title. Keys 7-8 date from 1968 and 1957. Keys 9-12, the founding tercios, are from memory.
- **SPR_PAR_01**: keys 1-2 are verified (1954-56), key 3 is from memory (1960), keys 4-6 are extrapolated in the almogávar tradition of the first two, key 7 is from memory.
- **SPR_GAR_01**: `Comandancia Militar` is verified for Baleares and Melilla and `Gobierno Militar` for Las Palmas and Valencia; the other plazas follow the pattern. The two Circunscripciones de Marruecos and the Comandancia Militar de Asturias are from memory.
- **SPR_INF_06**: keys 1-10 are verified names in the short title form. The Mehal-la numbers (11-15), the Tropas Nómadas title (17) and the Cazadores de África numbers (18-23) are from memory.
- **SPR_LEG_01**: every name is on the Legion's own list. Which were in use in 1936-45 is not verified. The tank bandera existed; its title is extrapolated.
- **SPR_INF_04**: seats 1 and 3-15 come from an undated roster; the Tercio Móvil is from the same roster; seats 16-24 are extrapolated provincial capitals. Numbers are left out on purpose, because the sources conflict.
- **SPR_INF_05**: every seat is extrapolated (the corps kept groups in the main cities).
- **SPR_CAR_01**: Castellón and Alicante are verified; the other seats are extrapolated coastal and frontier provinces.
- **SPR_INF_02**, **SPD_INF_01**: `Guarnición de <city>` is a descriptive title. The cities are those that joined the rising, or stayed loyal, in July 1936. The fallbacks `Batallón de Guarnición` and `Batallón de Retaguardia` are from memory.
- **SPR_INF_03**: all 26 names are verified; the short title `Tercio de ...` is one of two attested forms; the regional section headers are approximate.
- **SPR_FAL_01**: keys 1-4 and 6-8 are verified. `Bandera Móvil de Aragón` is from memory. Keys 9-21 follow the regional pattern. Keys 22-24 are extrapolated from Falange founders.
- **SPR_VOL_01**: keys 1-7 are verified; keys 8-10 are from memory; the Flechas divisions are well documented but were not looked up.
- **SPR_ROY_01**: `'Princesa' n.º 4` and `'Isabel la Católica' n.º 54` are from memory; the rest is verified.
- **SPD_INF_03**: `'Líster'` (1.ª) is from memory; `151.ª ... de Infantería de Marina` is well known; the rest is verified.
- **SPR_INT_01**: the five brigade nicknames and `'Hans Beimler'`, `'Doce de Febrero'`, `'Nueve Naciones'` are from memory. `'Six Février'` is written in French; the source gives `6 de febrero`.
- **SPD_INF_02**: keys 1, 4-11 and 18-24 are verified. Keys 2-3, 12-17 and 25-27 are from memory. Keys 28-32 are extrapolated.
- **SPD_INF_05**: every name is verified. `'Loyola'` is written for the source's `Loiola`.
- **SPR_CAT_01**: keys 1-5 are verified, 6-7 from memory, 8-16 extrapolated.
- **SPR_GUE_01**: only the XIV Cuerpo is verified; every other entry is from memory.
- **SPR_RED_01**: keys 1 and 14-21 are verified. Keys 2-13 and 22-24 are from memory. Keys 25-30 are extrapolated.
- **SPR_POU_01**: keys 1 and 3 are verified, 2 and 4-7 from memory, 8-13 extrapolated.
- **SPD_INF_06**: keys 1-13 and 19 are verified; 14-18 and 20-21 are from memory.
- **SPD_INF_04**: keys 1-18 are verified; 19-26 are extrapolated from anarchist figures and press.

## Kept on judgment
`-Check SPR` reports 8 flags. All are expected:
- **PLACEHOLDER_ENTRIES and LOW_DEPTH on SPA_INF_01**: its 55 entries are vanilla's historical numbers and repeat the fallback text by design. The lint counts them as placeholders (known problem, `docs/tooling-backlog.md`, Lints).
- **LOW_DEPTH on SPR_MOT_01 and SPR_MEC_01**: fallback only by the user's answer (no named motorized or mechanized lists).
- **LOW_DEPTH on SPR_CAV_01**: fallback only. Spain fielded one cavalry division; the names are in SPR_CAV_02.
- **LOW_DEPTH on SPR_PAR_01**: 7 names. Spain's paratroop arm dates from 1947-60 and had three army banderas.
- **LOW_DEPTH on SPR_ROY_02**: 10 names, but the lint reads `Alfonso XII` and `Alfonso XIII` as one pattern and counts 8.
- **IDENTITY_REPEAT (file)**: `Líster`, `Durruti`, `Carlos Marx`, `Ascaso` and `Macià-Companys` name both a division in SPR_INF_07 and its brigade in SPD_INF_03 (and militia units elsewhere). That is the real lineage.

`SPR_INF_01` and `SPR_ARM_01` hold no names by design; the audit shows each as `Variant: plain (un-nicknamed) counterpart of ...`.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames SPR -Batch docs\superpowers\plans\2026-10-09-spain-namelist.md`. Expect `Created INEX_SPR_names_divisions.txt`, 38 lines that begin `Added` and no `[ERROR]`. Eight of those lines show a tag with a doubled prefix (`SPR_SPA_INF_01`, `SPR_SPA_INF_02`, `SPR_SPD_INF_01` to `SPR_SPD_INF_06`). That is expected and step 2 corrects it.
- [x] 2. Rename the eight tags to their vanilla form. Run this one line in PowerShell from the repository root, exactly as written:
  ```powershell
  $p = Join-Path (Get-Location) 'common\units\names_divisions\INEX_SPR_names_divisions.txt'; $e = New-Object System.Text.UTF8Encoding($false); $t = [IO.File]::ReadAllText($p, $e); $n = [regex]::Matches($t, 'SPR_(SP[AD]_INF_0\d)').Count; [IO.File]::WriteAllText($p, ($t -creplace 'SPR_(SP[AD]_INF_0\d)', '$1'), $e); "Renamed $n tag reference(s)"
  ```
  Expect `Renamed 9 tag reference(s)` (eight group tags and one `link_numbering_with`). Any other number is a stop condition. Do not run it a second time.
- [x] 3. Write `wiki/Spain.md` from "Docs payload" with the Write tool.
- [x] 4. `powershell -File .\build.ps1 -SyncWiki SPR -Country "Spain"`. Expect `Registered SPR (Spain) in: README.md, wiki/Home.md, wiki/_Sidebar.md`, `Spain.md: 0 row(s) updated` and no line about stale or missing rows.
- [x] 5. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: insert the cross-reference row and the `[b]Spain[/b]` block from "Docs payload".
- [x] 6. `powershell -File .\build.ps1 -Check SPR`. Expect `AUDIT SUMMARY SPR: GROUPS=38 AUTHORED=676/771 FLAGS=8`, `Flags: LOW_DEPTH x6, IDENTITY_REPEAT x1, PLACEHOLDER_ENTRIES x1` and `Check passed`. The flags must be the ones under "Kept on judgment".
- [x] 7. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 8. Ship, on the user's word: commit with the message `Add Spain division namelists`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document SPR division namelists"`.

## Docs payload
Insert every text below exactly as written. The `README.md` row, the `wiki/Home.md` row and the `wiki/_Sidebar.md` line are written by `-SyncWiki -Country` in step 4.

### Workshop cross-reference row
In `WORKSHOP_DESCRIPTION_GUIDELINES.md`, after the row that begins ``| `INEX_PER_names_divisions.txt` `` (the last row of the table):
```
| `INEX_SPR_names_divisions.txt` | Spain | `SPR` | Included (Plain & Named Republican and Nationalist infantry, Named armored divisions, 1936 infantry & cavalry regiments, Mountain, Marine tercios, Paratrooper banderas, garrison commands, Army of Africa & Legion, Guardia Civil, Assault Guards, Carabineros, Requeté tercios, Falange & División Azul, royal regiments, Mixed & International Brigades, socialist, communist, POUM & anarchist militias, Basque & Catalan forces, guerrillas) |
```

### Workshop `[b]Spain[/b]` block
In `WORKSHOP_DESCRIPTION_GUIDELINES.md`, after the last line of the `[b]Iran[/b]` block (`- Tribal levies ...`), with one blank line before it and one blank line before `If you enjoy the mod, please give it a thumbs up and favorite!`:
```
[b]Spain[/b]
- Both armies of the Civil War: People's Army divisions and Mixed Brigades ([i]11.ª División 'Líster'[/i], [i]XI Brigada Internacional 'Thälmann'[/i]), Nationalist divisions ([i]4.ª División de Navarra[/i]) and the 1936 regiments ([i]Regimiento de Infantería 'Wad-Ras' n.º 1[/i])
- Army of Africa and Legion ([i]IV Bandera de La Legión 'Cristo de Lepanto'[/i]), Guardia Civil, Assault Guards, Carabineros, mountain, marine and paratrooper lists
- Ideology suites: Requeté tercios ([i]Tercio de Montejurra[/i]) and royal regiments, Falange and División Azul, communist, POUM and anarchist militias ([i]Columna Durruti[/i]), Basque and Catalan forces
```

### wiki/Spain.md (whole page)
````markdown
# Spain

**Country Tag:** `SPR` | **Source File:** [`INEX_SPR_names_divisions.txt`](../common/units/names_divisions/INEX_SPR_names_divisions.txt)

---

## Historical Overview

In July 1936 the Spanish Army held eight *Divisiones Orgánicas* (Madrid, Sevilla, Valencia, Barcelona, Zaragoza, Burgos, Valladolid, La Coruña) with thirty-two infantry regiments, whose names the Republic had restored in 1935 (*Wad-Ras n.º 1*, *Covadonga n.º 4*, *San Marcial n.º 22*), a cavalry division, two mountain brigades and the Army of Africa: the Legion's *banderas*, the *Grupos de Regulares* and the *Mehal-las* of the Protectorate. The rising split it in two.

The Republic rebuilt its forces as the *Ejército Popular*: militia columns became numbered *Brigadas Mixtas* and divisions, many of which kept the name of their column or commander (*11.ª División 'Líster'*, *26.ª División 'Durruti'*), beside the International Brigades, the Basque *Euzko Gudarostea* and the Catalan columns. The Nationalists fielded the *Divisiones de Navarra*, the Carlist *tercios de requetés* and the Falange *banderas*, and after 1939 numbered their divisions by army corps (11-13 in Madrid, 91-93 and 101-102 in Morocco). The lists follow both armies and extend them in their own patterns; every extended name is built from a real regiment, corps, garrison or figure of that tradition.

INEX replaces all 21 vanilla lists. Vanilla wrote ordinals as `1a` and `1°`; the lists use the Spanish abbreviations *1.ª*, *1.º* and *1.er*, and put the number last where the army did (*Regimiento de Infantería 'León' n.º 2*). Vanilla's *División Blindada* becomes *División Acorazada*, its garrison commands are respelled (*Galicia*, *La Coruña*, *Zaragoza*, *Marruecos*), and terms that no army used (*Brigada Popular*, *Brigada de la Guardia Civil*, *División de la Guardia de Asalto*, *Requeté* as a unit) give way to *Brigada Mixta*, *Tercio de la Guardia Civil*, *Grupo de Asalto* and *Tercio de Requetés*. Twelve of the vanilla lists were empty groups that the civil-war events assign to spawned units; those units now receive historical names. Two of them are filled by what vanilla's script does with them rather than by vanilla's label: `SPD_INF_05` is given to the Basque template and `SPD_INF_04` to the anarchist brigade.

Lists are gated by government type only, never by focus. The game files the Republic as democratic, the Nationalist Directory and the Carlists as non-aligned, the Falange as fascist, the Stalinist and POUM paths as communist and the Anarchist Commune as non-aligned. Because non-aligned covers three opposed camps, the Republican-side lists that events hand out are closed only to a fascist government, and the Nationalist-side lists are open to fascist and non-aligned governments. The army's own lists, the Army of Africa and the security corps are open to all.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name | Available To |
|:---|:---|:---|:---|:---|
| `SPR_INF_01` | Republican Infantry | infantry | `%d.ª División` | All but fascism |
| `SPR_INF_07` | Republican Infantry (Named) | infantry | `%d.ª División` | All but fascism |
| `SPA_INF_01` | Nationalist Infantry | infantry | `División de Infantería n.º %d` | Fascism or neutrality |
| `SPA_INF_02` | Nationalist Infantry (Named) | infantry | `División de Infantería n.º %d` | Fascism or neutrality |
| `SPR_MOT_01` | Motorized Divisions | motorized | `%d.ª División Motorizada` | All governments |
| `SPR_MEC_01` | Mechanized Divisions | mechanized | `%d.ª División Mecanizada` | All governments |
| `SPR_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `División Acorazada n.º %d` | All governments |
| `SPR_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `División Acorazada n.º %d` | All governments |
| `SPR_REG_01` | Infantry Regiments | infantry | `Regimiento de Infantería n.º %d` | All governments |
| `SPR_CAV_01` | Cavalry Divisions | cavalry | `%d.ª División de Caballería` | All governments |
| `SPR_CAV_02` | Cavalry Regiments | cavalry | `Regimiento de Caballería n.º %d` | All governments |
| `SPR_MNT_01` | Mountain Divisions | mountaineers | `División de Montaña n.º %d` | All governments |
| `SPR_MNT_02` | Mountain Battalions | mountaineers | `Batallón de Cazadores de Montaña n.º %d` | All governments |
| `SPR_MAR_01` | Marine Tercios | marine | `%d.º Tercio de Infantería de Marina` | All governments |
| `SPR_PAR_01` | Paratrooper Banderas | paratrooper | `%s Bandera Paracaidista` | All governments |
| `SPR_GAR_01` | Garrison Commands | infantry | `%d.ª Agrupación de Guarnición` | All governments |
| `SPR_INF_06` | Army of Africa | infantry | `Grupo de Regulares n.º %d` | All governments |
| `SPR_LEG_01` | Legion Banderas | infantry | `%s Bandera de La Legión` | All governments |
| `SPR_INF_04` | Guardia Civil Tercios | infantry | `%d.º Tercio de la Guardia Civil` | All governments |
| `SPR_INF_05` | Assault Guards | infantry | `%d.º Grupo de Asalto` | All governments |
| `SPR_CAR_01` | Carabineros | infantry | `%d.ª Comandancia de Carabineros` | All governments |
| `SPR_INF_02` | Nationalist Garrisons | infantry | `Batallón de Guarnición n.º %d` | Fascism or neutrality |
| `SPR_INF_03` | Requeté Tercios | infantry | `%d.º Tercio de Requetés` | Fascism or neutrality |
| `SPR_FAL_01` | Falange Banderas | infantry, militia | `%d.ª Bandera de Falange` | Fascism only |
| `SPR_VOL_01` | Volunteer Divisions | infantry | `%d.ª División Española de Voluntarios` | Fascism only |
| `SPR_ROY_01` | Royal Regiments | infantry | `Regimiento de la Guardia Real n.º %d` | Neutrality only |
| `SPR_ROY_02` | Royal Cavalry Regiments | cavalry | `Regimiento de Caballería de la Guardia Real n.º %d` | Neutrality only |
| `SPD_INF_03` | Mixed Brigades | infantry | `%d.ª Brigada Mixta` | All but fascism |
| `SPR_INT_01` | International Brigades | infantry | `%d.ª Brigada Internacional` | Democratic or communism |
| `SPD_INF_01` | Republican Garrisons | infantry | `Batallón de Retaguardia n.º %d` | All but fascism |
| `SPD_INF_02` | Socialist Battalions | infantry | `Batallón UGT n.º %d` | All but fascism |
| `SPD_INF_05` | Basque Battalions | infantry | `Euzko Gudarostea, Batallón n.º %d` | All but fascism |
| `SPR_CAT_01` | Catalan Columns | infantry, militia | `Columna Catalana núm. %d` | Democratic or communism |
| `SPR_GUE_01` | Guerrilla Groups | infantry, militia | `%d.ª Agrupación Guerrillera` | Democratic or communism |
| `SPR_RED_01` | People's Militia Battalions | infantry, militia | `Batallón de Milicias Populares n.º %d` | Communism only |
| `SPR_POU_01` | POUM Columns | infantry, militia | `Columna del POUM n.º %d` | Communism only |
| `SPD_INF_06` | Anarchist Columns | infantry, militia | `Columna Confederal n.º %d` | All but fascism |
| `SPD_INF_04` | Anarchist Battalions | infantry | `Batallón Confederal n.º %d` | All but fascism |

---

## Group Details

**Field divisions**

### `SPR_INF_01` — Republican Infantry
Overrides vanilla SPR_INF_01 as the plain variant: fallback only, no nicknames. The People's Army numbered its divisions without an arm, so the fallback is *%d.ª División*. Vanilla's civil-war, Carabineros and Chilean templates use this tag.

### `SPR_INF_07` — Republican Infantry (Named)
Named variant of SPR_INF_01. People's Army divisions under their real numbers, with the column, commander or regional name they carried: *10.ª División 'A'*, *11.ª División 'Líster'*, *26.ª División 'Durruti'*, *27.ª División 'Carlos Marx'*, *35.ª División Internacional*, *43.ª División 'La Heroica'*, the Basque, Santander and Asturian divisions of the Army of the North (*48.ª División Vasca*, *57.ª División Asturiana de Choque*) and the provisional *División del Zújar*.

### `SPA_INF_01` — Nationalist Infantry
Overrides vanilla SPA_INF_01 as the plain variant. It keeps vanilla's 55 division numbers, which follow the 1939 army (the first digit is the army corps), in the post-war form *División de Infantería n.º 11*. Vanilla's focus gate is replaced by government type.

### `SPA_INF_02` — Nationalist Infantry (Named)
Named variant of SPA_INF_01. The wartime *1.ª* to *6.ª División de Navarra*, the *División de Soria* and *División de Ávila*, then the divisions of the 1939 army with regional and battle names in the pattern of *División de Infantería 'Guadarrama' n.º 11*, *'Guzmán el Bueno' n.º 21* and *'Maestrazgo' n.º 31*. Only those three names and the wartime divisions are historical; the rest extends the pattern from corps names (*Aragón*, *Castilla*, *Galicia*), regiments (*San Marcial*, *San Quintín*) and the Moroccan seats (*Tetuán*, *Larache*, *Xauen*, *Melilla*).

### `SPR_MOT_01` — Motorized Divisions
Overrides vanilla SPR_MOT_01: fallback only. Anchor of the mobile numbering.

### `SPR_MEC_01` — Mechanized Divisions
Overrides vanilla SPR_MEC_01: fallback only.

### `SPR_ARM_01` — Armored Divisions
Overrides vanilla SPR_ARM_01 as the plain variant. The Spanish term is *División Acorazada*; vanilla wrote *Blindada*.

### `SPR_ARM_02` — Armored Divisions (Named)
Named variant of SPR_ARM_01. *División Acorazada 'Brunete' n.º 1* was formed in 1943 from the 13.ª División. The other names are those of the cavalry regiments that became Spain's armored regiments (*Villaviciosa*, *Almansa*, *Pavía*, *Lusitania*, *Farnesio*) and are an extension, not history.

**Arms and services**

### `SPR_REG_01` — Infantry Regiments
The 32 regiments of the eight Divisiones Orgánicas in July 1936, four to a division, with the names restored in 1935: *Regimiento de Infantería 'Wad-Ras' n.º 1* and *'León' n.º 2* (Madrid), *'Granada' n.º 6* (Sevilla), *'Badajoz' n.º 13* (Barcelona), *'Aragón' n.º 17* (Zaragoza), *'América' n.º 23* (Pamplona), *'Milán' n.º 32* (Oviedo). Keys 41-50 are island and other regiments under their 1943 numbers (*'Palma' n.º 47*, *'Tenerife' n.º 49*).

### `SPR_CAV_01` — Cavalry Divisions
Overrides vanilla SPR_CAV_01: fallback only. Spain fielded a single División de Caballería.

### `SPR_CAV_02` — Cavalry Regiments
Cavalry regiments under the numbers and arms they held before the 1931 reform: *Regimiento de Lanceros de Farnesio n.º 5*, *Dragones de Santiago n.º 9*, *Cazadores de Lusitania n.º 12*, *Húsares de Pavía n.º 20*, *Cazadores de Taxdir n.º 29*. The regiments with royal titles are in SPR_ROY_02.

### `SPR_MNT_01` — Mountain Divisions
Overrides vanilla SPR_MNT_01. *División de Montaña 'Urgel' n.º 4* and *'Navarra' n.º 5* are post-war divisions; the other names extend the pattern across the Pyrenees and the other ranges (*Pirineos*, *Roncesvalles*, *Jaca*, *Valle de Arán*, *Picos de Europa*).

### `SPR_MNT_02` — Mountain Battalions
The Batallones de Cazadores de Montaña of the two mountain brigades of 1936 (*'Flandes' n.º 5*, *'Garellano' n.º 6*, *'Arapiles' n.º 7*, *'Sicilia' n.º 8*), older cazadores names and the mountain regiments of 1943 (*'Barcelona' n.º 63*, *'Galicia' n.º 64*).

### `SPR_MAR_01` — Marine Tercios
Overrides vanilla SPR_MAR_01. The Infantería de Marina by naval department (*Tercio del Norte*, *Tercio del Sur*, *Tercio de Levante*, *Tercio de Baleares*) and the four tercios of the 16th century from which the corps descends (*Tercio Nuevo de la Mar de Nápoles*, *Tercio de la Armada del Mar Océano*).

### `SPR_PAR_01` — Paratrooper Banderas
Overrides vanilla SPR_PAR_01. Spain's paratroop arm dates from 1947-60, so the list is short: *I Bandera Paracaidista 'Roger de Flor'*, *II 'Roger de Lauria'*, *III 'Ortiz de Zárate'*, the air force's bandera and three names in the same almogávar tradition.

### `SPR_GAR_01` — Garrison Commands
Overrides vanilla SPR_GAR_01 and keeps its 18 commands under the same keys, respelled and with the terms of 1936: *Comandancia Militar de Baleares*, *Circunscripción Occidental de Marruecos*, *Gobierno Militar de Zaragoza*. Vanilla's *Circunscripción Maestrazgo* was not a command and is replaced by the *Circunscripción Oriental de Marruecos*.

**Army of Africa**

### `SPR_INF_06` — Army of Africa
Overrides vanilla SPR_INF_06, the group of the event template *División del Ejército de África*. The ten *Grupos de Regulares* (*Tetuán n.º 1*, *Melilla n.º 2*, *Ceuta n.º 3*, *Larache n.º 4*, *Alhucemas n.º 5*), the *Mehal-las Jalifianas*, the *Tiradores de Ifni* and the *Cazadores de África*.

### `SPR_LEG_01` — Legion Banderas
The banderas of the Tercio de Extranjeros, La Legión, in Roman numerals: *I Bandera de La Legión 'Casa de Borgoña'*, *III 'Tigres de Buharrat'*, *IV 'Cristo de Lepanto'*, *X 'Millán Astray'*, and its four tercios (*1.er Tercio 'Gran Capitán'*). The banderas named after Nationalist commanders and victories are left out, because the list is open to every government.

**Security corps**

### `SPR_INF_04` — Guardia Civil Tercios
Overrides vanilla SPR_INF_04 (*Brigada de la Guardia Civil*). The corps was organized in tercios and comandancias, 24 tercios in 1936; the list names them by seat (*Tercio de la Guardia Civil de Madrid*, *Tercio Móvil de Madrid*).

### `SPR_INF_05` — Assault Guards
Overrides vanilla SPR_INF_05 (*División de la Guardia de Asalto*). The Cuerpo de Seguridad y Asalto was organized in groups, named here by city (*Grupo de Asalto de Barcelona*).

### `SPR_CAR_01` — Carabineros
The Cuerpo de Carabineros, the coast and frontier guard, by comandancia (*Comandancia de Carabineros de Gerona*, *de Algeciras*, *de Guipúzcoa*).

**Nationalist side**

### `SPR_INF_02` — Nationalist Garrisons
Overrides vanilla SPR_INF_02, the group of the Nationalist garrison template of the civil-war event. Garrisons that joined the rising of July 1936: *Guarnición de Pamplona*, *de Burgos*, *de Sevilla*, *de Melilla*, *Guarnición del Alcázar de Toledo*.

### `SPR_INF_03` — Requeté Tercios
Overrides vanilla SPR_INF_03, the group of the event template *Requeté Carlista*. The Carlist militia fought in tercios named after battles, saints and princes of the Carlist cause: *Tercio de Montejurra*, *Tercio de Lácar*, *Tercio de Oriamendi*, *Tercio de Zumalacárregui*, *Tercio de Nuestra Señora de Montserrat*, *Tercio de la Virgen de los Reyes*.

### `SPR_FAL_01` — Falange Banderas
The militia of Falange Española de las JONS in banderas (battalions) and centurias (companies): *Bandera 'Leones de Castilla'*, *Bandera Legionaria Gallega*, *Centuria 'Onésimo Redondo'*, and regional banderas (*1.ª Bandera de Falange de Navarra*).

### `SPR_VOL_01` — Volunteer Divisions
The *División Española de Voluntarios* (the División Azul of 1941-43) with its regiments (*Regimiento 262 'Pimentel'*, *263 'Vierna'*, *269 'Esparza'*), the *Legión Española de Voluntarios* that followed it, and the mixed *Flechas* divisions of 1937-39.

### `SPR_ROY_01` — Royal Regiments
The palace guard (*Real Cuerpo de Guardias Alabarderos*) and the infantry regiments with royal titles, under the numbers they held until 1931: *Regimiento de Infantería 'Inmemorial del Rey' n.º 1*, *'La Reina' n.º 2*, *'Príncipe' n.º 3*, *'Borbón' n.º 17*.

### `SPR_ROY_02` — Royal Cavalry Regiments
The *Escuadrón de la Escolta Real* and the cavalry regiments with royal titles: *Regimiento de Lanceros del Rey n.º 1*, *Húsares de la Princesa n.º 19*, *Cazadores de Alfonso XIII n.º 24*.

**Republican side**

### `SPD_INF_03` — Mixed Brigades
Overrides vanilla SPD_INF_03 (*Brigada Popular*). The People's Army's *Brigadas Mixtas* under their real numbers: former columns (*32.ª Brigada Mixta 'Mangada'*, *83.ª 'Columna de Hierro'*, *119.ª 'Durruti'*), the Carabineros brigades (*3.ª*, *5.ª*, *65.ª*), shock brigades and the *151.ª Brigada Mixta de Infantería de Marina*.

### `SPR_INT_01` — International Brigades
The International Brigades of 1936-38 (*XI Brigada Internacional 'Thälmann'*, *XII 'Garibaldi'*, *XIII 'Dąbrowski'*, *XIV 'La Marsellesa'*, *XV 'Abraham Lincoln'*) and their battalions (*Batallón 'Edgar André'*, *'Commune de Paris'*, *'Mackenzie-Papineau'*, *'Đuro Đaković'*).

### `SPD_INF_01` — Republican Garrisons
Overrides vanilla SPD_INF_01, the group of the Republican garrison template of the civil-war event. Garrisons of the cities that stayed loyal in July 1936: *Guarnición de Madrid*, *de Barcelona*, *de Valencia*, *de Bilbao*, *de Cartagena*.

### `SPD_INF_02` — Socialist Battalions
Overrides vanilla SPD_INF_02 (*Brigada de Juventudes Sindicales*). Militia battalions of the UGT, the PSOE and the Juventudes Socialistas Unificadas: *Batallón 'Pablo Iglesias'*, *'Largo Caballero'*, *'Jean Jaurès'*, *'Octubre' n.º 11*, *'Joven Guardia'*, *'UHP'*.

### `SPD_INF_05` — Basque Battalions
Overrides vanilla SPD_INF_05, the tag vanilla's focus gives to its Basque template. The battalions of the Euzko Gudarostea raised by the Basque nationalist parties, with their Basque names in the period spelling: *Batallón 'Arana Goiri'*, *'Itxarkundia'*, *'Amaiur'*, *'Gordexola'*, *'Euzko Indarra'*, *'Lenago Il'*.

### `SPR_CAT_01` — Catalan Columns
Forces of the Generalitat and of the Catalan republican parties in 1936-37, in Catalan: *Columna Macià-Companys*, *Regiment Pirinenc núm. 1 de Catalunya*, *Milícies Alpines*, *Grup Alpí*, and battalions named in the same tradition (*Batalló 'Francesc Layret'*).

### `SPR_GUE_01` — Guerrilla Groups
The People's Army's *XIV Cuerpo de Ejército Guerrillero* and the Republican guerrilla groupings of 1939-45 in Spain and France: *Agrupación Guerrillera de Levante y Aragón*, *Federación de Guerrillas de León-Galicia*, *Agrupación de Guerrilleros Españoles*, *Compañía 'La Nueve'*.

**Revolutionary left**

### `SPR_RED_01` — People's Militia Battalions
Communist militias: the PCE's *5.º Regimiento de Milicias Populares* and its units (*Compañías de Acero*, *Batallón 'Thaelmann'*, *'Comuna de París'*, *'Pasionaria'*), the Basque communist battalions (*'Rosa Luxemburgo'*, *'Karl Liebknecht'*) and the PSUC's *Columna Carlos Marx*.

### `SPR_POU_01` — POUM Columns
Militias of the Partido Obrero de Unificación Marxista, kept apart from the PCE lists: *Columna Lenin*, *Columna Joaquín Maurín*, *Batallón de Choque del POUM*, *Batallón 'Andreu Nin'*.

### `SPD_INF_06` — Anarchist Columns
Overrides vanilla SPD_INF_06, the group of the focus template *Anarchist Militia*. The CNT-FAI columns of 1936: *Columna Durruti*, *Columna Ascaso*, *Columna de Hierro*, *Columna Tierra y Libertad*, *Columna Los Aguiluchos*, *Centuria 'Sébastien Faure'*.

### `SPD_INF_04` — Anarchist Battalions
Overrides vanilla SPD_INF_04, the tag vanilla's event gives to the template *Brigada Anarquista*. CNT battalions of Madrid, Euzkadi and Santander: *Batallón 'Isaac Puente'*, *'Malatesta'*, *'Bakunin'*, *'Sacco-Vanzetti'*, *'Orobón Fernández'*.
````

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
**Proofread** (`inex-code-reviewer`, 2026-10-10; all 716 authored names pasted per group with the "Author confirmation" list): no errors. One query: `Batallón 'Thaelmann'` in SPR_RED_01 is spelled differently from `'Thälmann'` in SPR_INT_01. Kept on purpose: `Thaelmann` is the period Spanish spelling of the Madrid militia battalion, and the International Brigade units keep the German form (see "Decisions"). The reviewer made no web lookups, so the entries marked "from memory" under "Author confirmation" were checked for language only, not against sources.

**Checklist**: language and ordinals, grounding, depth, gating, plain and named pairs, vanilla names carried over and self-containment were gone through before hand-off.

**Trial run**: the batch, the rename of step 2, the docs steps and `-Check SPR` were run in a throwaway copy of the repository outside the working tree. The outputs written under "Implementation steps" are the ones that run printed.

## Outcome
Date: 2026-10-10.

`-Check SPR` summary: `AUDIT SUMMARY SPR: GROUPS=38 AUTHORED=676/771 FLAGS=8`, `Flags: LOW_DEPTH x6, IDENTITY_REPEAT x1, PLACEHOLDER_ENTRIES x1`, `Check passed`. All eight flags are the ones listed under "Kept on judgment". Validate OK, tests 401 passed, 0 failed.

Deviations: none from the steps. Step 4 printed one extra informational line, `wiki/Home.md: SPR group count 38 (unchanged)`, which is not a stale or missing-row report and matches the 38 groups of the plan; it was treated as a pass.

## Edit batch
Applied by `build.ps1 -EditNames SPR -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{ "newFile": true, "header": "Division template historical names system for Spain (SPR).\nImmersive Namelists Expanded (INEX)\nSpanish ordinals: 1.ª (feminine), 1.º and 1.er (masculine). Honorifics are in single quotes. The Basque and Catalan lists keep their own spelling.\nOverrides all 21 vanilla groups (SPR_*, SPA_INF_01, SPD_INF_01 to SPD_INF_06). Every group is for_countries = { SPR }, as in vanilla." }
```

```json batch
{ "addGroup": true, "group": "SPR_INF_01", "selector": "Republican Infantry", "addType": "infantry", "fallback": "%d.ª División",
  "canUse": "NOT = { has_government = fascism }",
  "comment": "# ===== Field divisions =====\n\nOverrides vanilla SPR_INF_01 as the plain variant, with vanilla's gate. The People's Army numbered its divisions without an arm (11.ª División).\nVanilla's civil-war, Carabineros and Chilean templates use this tag." }
```

```json batch
{ "addGroup": true, "group": "SPR_INF_07", "selector": "Republican Infantry (Named)", "addType": "infantry", "fallback": "%d.ª División",
  "canUse": "NOT = { has_government = fascism }", "link": "SPR_INF_01",
  "comment": "Named variant of SPR_INF_01. People's Army divisions under their real numbers, with the column, commander or regional name they carried.",
  "add": ["# Divisions that kept the name of their column or commander",
    "10=10.ª División 'A'", "11=11.ª División 'Líster'", "25=25.ª División 'Jubert'", "26=26.ª División 'Durruti'", "27=27.ª División 'Carlos Marx'",
    "28=28.ª División 'Ascaso'", "29=29.ª División 'Lenin'", "30=30.ª División 'Macià-Companys'", "35=35.ª División Internacional", "43=43.ª División 'La Heroica'",
    "45=45.ª División Internacional", "46=46.ª División 'El Campesino'",
    "# Divisions of the Army of the North",
    "48=48.ª División Vasca", "49=49.ª División Vasca", "50=50.ª División Vasca", "51=51.ª División Vasca", "52=52.ª División Santanderina", "53=53.ª División Santanderina",
    "54=54.ª División Santanderina", "56=56.ª División Asturiana", "57=57.ª División Asturiana de Choque", "58=58.ª División Asturiana", "59=59.ª División Asturiana",
    "60=60.ª División Asturiana", "61=61.ª División Asturiana", "62=62.ª División Asturiana",
    "# Guerrilla and provisional divisions",
    "75=75.ª División Guerrillera", "78=División 'Andalucía'", "79=División 'Extremadura'", "80=División 'Levante'", "81=División del Zújar"] }
```

```json batch
{ "addGroup": true, "group": "SPA_INF_01", "selector": "Nationalist Infantry", "addType": "infantry", "fallback": "División de Infantería n.º %d",
  "canUse": "OR = { has_government = fascism has_government = neutrality }",
  "comment": "Overrides vanilla SPA_INF_01 as the plain variant. Vanilla's focus gate is replaced by government type.\nThe numbers are vanilla's and follow the 1939 army, where the first digit is the army corps.",
  "add": ["# Division numbers of the 1939 army",
    "11=División de Infantería n.º %d", "12=División de Infantería n.º %d", "13=División de Infantería n.º %d", "14=División de Infantería n.º %d", "15=División de Infantería n.º %d", "16=División de Infantería n.º %d",
    "21=División de Infantería n.º %d", "22=División de Infantería n.º %d", "23=División de Infantería n.º %d", "24=División de Infantería n.º %d", "25=División de Infantería n.º %d", "26=División de Infantería n.º %d",
    "31=División de Infantería n.º %d", "32=División de Infantería n.º %d", "33=División de Infantería n.º %d", "34=División de Infantería n.º %d", "35=División de Infantería n.º %d", "36=División de Infantería n.º %d",
    "41=División de Infantería n.º %d", "42=División de Infantería n.º %d", "43=División de Infantería n.º %d", "44=División de Infantería n.º %d", "45=División de Infantería n.º %d", "46=División de Infantería n.º %d",
    "51=División de Infantería n.º %d", "52=División de Infantería n.º %d", "53=División de Infantería n.º %d", "54=División de Infantería n.º %d", "55=División de Infantería n.º %d", "56=División de Infantería n.º %d",
    "61=División de Infantería n.º %d", "62=División de Infantería n.º %d", "63=División de Infantería n.º %d", "64=División de Infantería n.º %d", "65=División de Infantería n.º %d", "66=División de Infantería n.º %d",
    "71=División de Infantería n.º %d", "72=División de Infantería n.º %d", "73=División de Infantería n.º %d", "74=División de Infantería n.º %d", "75=División de Infantería n.º %d", "76=División de Infantería n.º %d",
    "81=División de Infantería n.º %d", "82=División de Infantería n.º %d", "83=División de Infantería n.º %d", "84=División de Infantería n.º %d", "85=División de Infantería n.º %d",
    "91=División de Infantería n.º %d", "92=División de Infantería n.º %d", "93=División de Infantería n.º %d", "94=División de Infantería n.º %d",
    "101=División de Infantería n.º %d", "102=División de Infantería n.º %d", "103=División de Infantería n.º %d", "104=División de Infantería n.º %d"] }
```

```json batch
{ "addGroup": true, "group": "SPA_INF_02", "selector": "Nationalist Infantry (Named)", "addType": "infantry", "fallback": "División de Infantería n.º %d",
  "canUse": "OR = { has_government = fascism has_government = neutrality }", "link": "SPA_INF_01",
  "comment": "Named variant of SPA_INF_01. The wartime Divisiones de Navarra, then the divisions of the 1939 army with regional and battle names in the pattern of Guadarrama, Guzmán el Bueno and Maestrazgo.",
  "add": ["# Wartime divisions",
    "1=1.ª División de Navarra", "2=2.ª División de Navarra", "3=3.ª División de Navarra", "4=4.ª División de Navarra", "5=5.ª División de Navarra", "6=6.ª División de Navarra",
    "7=División de Soria", "8=División de Ávila",
    "# I and II Cuerpo de Ejército (Madrid, Sevilla)",
    "11=División de Infantería 'Guadarrama' n.º 11", "12=División de Infantería 'Somosierra' n.º 12", "13=División de Infantería 'Mano Negra' n.º 13", "14=División de Infantería 'Jarama' n.º 14",
    "21=División de Infantería 'Guzmán el Bueno' n.º 21", "22=División de Infantería 'Bailén' n.º 22", "23=División de Infantería 'Las Navas de Tolosa' n.º 23",
    "# III, IV and V Cuerpo de Ejército (Valencia, Barcelona, Zaragoza)",
    "31=División de Infantería 'Maestrazgo' n.º 31", "32=División de Infantería 'Turia' n.º 32", "33=División de Infantería 'Levante' n.º 33",
    "41=División de Infantería 'Ampurdán' n.º 41", "43=División de Infantería 'Almogávares' n.º 43",
    "51=División de Infantería 'Aragón' n.º 51", "52=División de Infantería 'Belchite' n.º 52", "53=División de Infantería 'Teruel' n.º 53",
    "# VI, VII and VIII Cuerpo de Ejército (Burgos, Valladolid, La Coruña)",
    "61=División de Infantería 'San Marcial' n.º 61", "63=División de Infantería 'Cantabria' n.º 63",
    "71=División de Infantería 'Castilla' n.º 71", "72=División de Infantería 'San Quintín' n.º 72", "73=División de Infantería 'Arapiles' n.º 73",
    "81=División de Infantería 'Galicia' n.º 81", "82=División de Infantería 'Covadonga' n.º 82", "83=División de Infantería 'Oviedo' n.º 83",
    "# IX and X Cuerpo de Ejército (Morocco)",
    "91=División de Infantería 'Tetuán' n.º 91", "92=División de Infantería 'Larache' n.º 92", "93=División de Infantería 'Xauen' n.º 93",
    "101=División de Infantería 'Melilla' n.º 101", "102=División de Infantería 'Alhucemas' n.º 102"] }
```

```json batch
{ "addGroup": true, "group": "SPR_MOT_01", "selector": "Motorized Divisions", "addType": "motorized", "fallback": "%d.ª División Motorizada",
  "comment": "Overrides vanilla SPR_MOT_01: fallback only, with the ordinal corrected. Anchor of the mobile numbering." }
```

```json batch
{ "addGroup": true, "group": "SPR_MEC_01", "selector": "Mechanized Divisions", "addType": "mechanized", "fallback": "%d.ª División Mecanizada", "link": "SPR_MOT_01",
  "comment": "Overrides vanilla SPR_MEC_01: fallback only, with the ordinal corrected." }
```

```json batch
{ "addGroup": true, "group": "SPR_ARM_01", "selector": "Armored Divisions", "addType": "light_armor; medium_armor; heavy_armor; modern_armor", "fallback": "División Acorazada n.º %d",
  "comment": "Overrides vanilla SPR_ARM_01 as the plain variant. The Spanish term is División Acorazada (vanilla: Blindada). Vanilla's Brunete entry is in SPR_ARM_02." }
```

```json batch
{ "addGroup": true, "group": "SPR_ARM_02", "selector": "Armored Divisions (Named)", "addType": "light_armor; medium_armor; heavy_armor; modern_armor", "fallback": "División Acorazada n.º %d", "link": "SPR_ARM_01",
  "comment": "Named variant of SPR_ARM_01. The División Acorazada Brunete of 1943, then the names of the cavalry regiments that became Spain's armored regiments.",
  "add": ["# División Acorazada Brunete and the cavalry lineage",
    "1=División Acorazada 'Brunete' n.º 1", "2=División Acorazada 'Villaviciosa' n.º 2", "3=División Acorazada 'Almansa' n.º 3", "4=División Acorazada 'Pavía' n.º 4",
    "5=División Acorazada 'Lusitania' n.º 5", "6=División Acorazada 'Farnesio' n.º 6", "7=División Acorazada 'Numancia' n.º 7", "8=División Acorazada 'Sagunto' n.º 8",
    "9=División Acorazada 'Santiago' n.º 9", "10=División Acorazada 'Montesa' n.º 10", "11=División Acorazada 'Alcántara' n.º 11", "12=División Acorazada 'Calatrava' n.º 12",
    "13=División Acorazada 'España' n.º 13", "14=División Acorazada 'Castillejos' n.º 14"] }
```

```json batch
{ "addGroup": true, "group": "SPR_REG_01", "selector": "Infantry Regiments", "addType": "infantry", "fallback": "Regimiento de Infantería n.º %d",
  "comment": "# ===== Arms and services =====\n\nThe 32 infantry regiments of the eight Divisiones Orgánicas in July 1936, with the names restored in 1935, and island and later regiments under their 1943 numbers.",
  "add": ["# I to IV División Orgánica (Madrid, Sevilla, Valencia, Barcelona)",
    "1=Regimiento de Infantería 'Wad-Ras' n.º 1", "2=Regimiento de Infantería 'León' n.º 2", "3=Regimiento de Infantería 'Castilla' n.º 3", "4=Regimiento de Infantería 'Covadonga' n.º 4",
    "5=Regimiento de Infantería 'Lepanto' n.º 5", "6=Regimiento de Infantería 'Granada' n.º 6", "7=Regimiento de Infantería 'Pavía' n.º 7", "8=Regimiento de Infantería 'Vitoria' n.º 8",
    "9=Regimiento de Infantería 'Otumba' n.º 9", "10=Regimiento de Infantería 'Guadalajara' n.º 10", "11=Regimiento de Infantería 'Tarifa' n.º 11", "12=Regimiento de Infantería 'Vizcaya' n.º 12",
    "13=Regimiento de Infantería 'Badajoz' n.º 13", "14=Regimiento de Infantería 'Alcántara' n.º 14", "15=Regimiento de Infantería 'Almansa' n.º 15", "16=Regimiento de Infantería 'Albuera' n.º 16",
    "# V to VIII División Orgánica (Zaragoza, Burgos, Valladolid, La Coruña)",
    "17=Regimiento de Infantería 'Aragón' n.º 17", "18=Regimiento de Infantería 'Gerona' n.º 18", "19=Regimiento de Infantería 'Galicia' n.º 19", "20=Regimiento de Infantería 'Valladolid' n.º 20",
    "21=Regimiento de Infantería 'Valencia' n.º 21", "22=Regimiento de Infantería 'San Marcial' n.º 22", "23=Regimiento de Infantería 'América' n.º 23", "24=Regimiento de Infantería 'Bailén' n.º 24",
    "25=Regimiento de Infantería 'San Quintín' n.º 25", "26=Regimiento de Infantería 'Toledo' n.º 26", "27=Regimiento de Infantería 'Argel' n.º 27", "28=Regimiento de Infantería 'La Victoria' n.º 28",
    "29=Regimiento de Infantería 'Zamora' n.º 29", "30=Regimiento de Infantería 'Zaragoza' n.º 30", "31=Regimiento de Infantería 'Burgos' n.º 31", "32=Regimiento de Infantería 'Milán' n.º 32",
    "# Island and later regiments (1943 numbers)",
    "41=Regimiento de Infantería 'Gravelinas' n.º 41", "45=Regimiento de Infantería 'Garellano' n.º 45", "47=Regimiento de Infantería 'Palma' n.º 47", "49=Regimiento de Infantería 'Tenerife' n.º 49",
    "50=Regimiento de Infantería 'Canarias' n.º 50"] }
```

```json batch
{ "addGroup": true, "group": "SPR_CAV_01", "selector": "Cavalry Divisions", "addType": "cavalry", "fallback": "%d.ª División de Caballería",
  "comment": "Overrides vanilla SPR_CAV_01: fallback only, with the ordinal corrected. Spain fielded a single División de Caballería; the regiments are in SPR_CAV_02." }
```

```json batch
{ "addGroup": true, "group": "SPR_CAV_02", "selector": "Cavalry Regiments", "addType": "cavalry", "fallback": "Regimiento de Caballería n.º %d",
  "comment": "Cavalry regiments under the numbers and arms (lancers, dragoons, hussars, cazadores) they held before the 1931 reform. The regiments with royal titles are in SPR_ROY_02.",
  "add": ["# Lancers and dragoons",
    "5=Regimiento de Lanceros de Farnesio n.º 5", "6=Regimiento de Lanceros de Villaviciosa n.º 6", "7=Regimiento de Lanceros de España n.º 7", "8=Regimiento de Lanceros de Sagunto n.º 8",
    "9=Regimiento de Dragones de Santiago n.º 9", "10=Regimiento de Dragones de Montesa n.º 10", "11=Regimiento de Dragones de Numancia n.º 11",
    "# Cazadores and hussars",
    "12=Regimiento de Cazadores de Lusitania n.º 12", "13=Regimiento de Cazadores de Almansa n.º 13", "14=Regimiento de Cazadores de Alcántara n.º 14", "15=Regimiento de Cazadores de Talavera n.º 15",
    "16=Regimiento de Cazadores de Albuera n.º 16", "17=Regimiento de Cazadores de Tetuán n.º 17", "18=Regimiento de Cazadores de Castillejos n.º 18", "20=Regimiento de Húsares de Pavía n.º 20",
    "23=Regimiento de Cazadores de Villarrobledo n.º 23", "25=Regimiento de Cazadores de Galicia n.º 25", "26=Regimiento de Cazadores de Treviño n.º 26", "28=Regimiento de Cazadores de Vitoria n.º 28",
    "29=Regimiento de Cazadores de Taxdir n.º 29", "30=Regimiento de Cazadores de Calatrava n.º 30"] }
```

```json batch
{ "addGroup": true, "group": "SPR_MNT_01", "selector": "Mountain Divisions", "addType": "mountaineers", "fallback": "División de Montaña n.º %d",
  "comment": "Overrides vanilla SPR_MNT_01. The Divisiones de Montaña Urgel and Navarra, then Pyrenean and mountain names in the same pattern.",
  "add": ["# Mountain divisions",
    "1=División de Montaña 'Pirineos' n.º 1", "2=División de Montaña 'Roncesvalles' n.º 2", "3=División de Montaña 'Jaca' n.º 3", "4=División de Montaña 'Urgel' n.º 4",
    "5=División de Montaña 'Navarra' n.º 5", "6=División de Montaña 'Valle de Arán' n.º 6", "7=División de Montaña 'Sobrarbe' n.º 7", "8=División de Montaña 'Ribagorza' n.º 8",
    "9=División de Montaña 'Cerdaña' n.º 9", "10=División de Montaña 'Roncal' n.º 10", "11=División de Montaña 'Picos de Europa' n.º 11", "12=División de Montaña 'Sierra Nevada' n.º 12"] }
```

```json batch
{ "addGroup": true, "group": "SPR_MNT_02", "selector": "Mountain Battalions", "addType": "mountaineers", "fallback": "Batallón de Cazadores de Montaña n.º %d",
  "comment": "The Batallones de Cazadores de Montaña of the two mountain brigades of 1936, older cazadores names and the later mountain regiments.",
  "add": ["# Mountain brigades of 1936",
    "1=Batallón de Cazadores de Montaña 'Chiclana' n.º 1", "2=Batallón de Cazadores de Montaña 'Asia' n.º 2", "3=Batallón de Cazadores de Montaña 'Madrid' n.º 3",
    "4=Batallón de Cazadores de Montaña 'Ciudad Rodrigo' n.º 4", "5=Batallón de Cazadores de Montaña 'Flandes' n.º 5", "6=Batallón de Cazadores de Montaña 'Garellano' n.º 6",
    "7=Batallón de Cazadores de Montaña 'Arapiles' n.º 7", "8=Batallón de Cazadores de Montaña 'Sicilia' n.º 8",
    "# Later battalions and older cazadores names",
    "9=Batallón de Cazadores de Montaña 'Tarifa' n.º 9", "10=Batallón de Cazadores de Montaña 'Estella' n.º 10", "11=Batallón de Cazadores de Montaña 'Barbastro' n.º 11",
    "12=Batallón de Cazadores de Montaña 'Las Navas' n.º 12", "13=Batallón de Cazadores de Montaña 'Alba de Tormes' n.º 13", "14=Batallón de Cazadores de Montaña 'Llerena' n.º 14",
    "15=Batallón de Montaña 'Pirineos'",
    "# Mountain regiments of 1943",
    "16=Regimiento de Cazadores de Montaña 'Barcelona' n.º 63", "17=Regimiento de Cazadores de Montaña 'Galicia' n.º 64", "18=Regimiento de Cazadores de Montaña 'América' n.º 66"] }
```

```json batch
{ "addGroup": true, "group": "SPR_MAR_01", "selector": "Marine Tercios", "addType": "marine", "fallback": "%d.º Tercio de Infantería de Marina",
  "comment": "Overrides vanilla SPR_MAR_01. The Infantería de Marina's tercios and groupings by naval department, and the four tercios of the 16th century from which the corps descends.",
  "add": ["# Tercios and groupings by naval department",
    "1=Tercio del Norte", "2=Tercio del Sur", "3=Tercio de Levante", "4=Tercio de Baleares", "5=Agrupación de Infantería de Marina de Madrid", "6=Agrupación de Infantería de Marina de Canarias",
    "7=Tercio de Armada", "8=Grupo Especial de Infantería de Marina",
    "# The corps' founding tercios",
    "9=Tercio Nuevo de la Mar de Nápoles", "10=Tercio de la Armada del Mar Océano", "11=Tercio de Galeras de Sicilia", "12=Tercio Viejo del Mar Océano"] }
```

```json batch
{ "addGroup": true, "group": "SPR_PAR_01", "selector": "Paratrooper Banderas", "addType": "paratrooper", "fallback": "%s Bandera Paracaidista",
  "comment": "Overrides vanilla SPR_PAR_01. Spain's paratroop units date from 1947-60, so the list is short: the three army banderas, the air force bandera and names in the same almogávar tradition.",
  "add": ["# Banderas Paracaidistas",
    "1=I Bandera Paracaidista 'Roger de Flor'", "2=II Bandera Paracaidista 'Roger de Lauria'", "3=III Bandera Paracaidista 'Ortiz de Zárate'", "4=IV Bandera Paracaidista 'Almogávares'",
    "5=V Bandera Paracaidista 'Berenguer de Entenza'", "6=VI Bandera Paracaidista 'Bernat de Rocafort'", "7=Primera Bandera Paracaidista de Aviación"] }
```

```json batch
{ "addGroup": true, "group": "SPR_GAR_01", "selector": "Garrison Commands", "addType": "infantry", "fallback": "%d.ª Agrupación de Guarnición",
  "comment": "Overrides vanilla SPR_GAR_01 and keeps its 18 commands under the same keys, respelled (Galacia, Coruna, Zaragosa, Morocco) and with the terms of 1936: Comandancia Militar, Circunscripción, Gobierno Militar.",
  "add": ["# Vanilla's commands, corrected",
    "1=Comandancia Militar de Baleares", "2=Comandancia Militar de Canarias", "3=Circunscripción Occidental de Marruecos", "4=Circunscripción Oriental de Marruecos",
    "5=Gobierno Militar de Madrid", "6=Gobierno Militar de Sevilla", "7=Gobierno Militar de El Ferrol", "8=Gobierno Militar de Barcelona", "9=Gobierno Militar de Valencia",
    "10=Gobierno Militar de Cádiz", "11=Gobierno Militar de La Coruña", "12=Gobierno Militar de Cartagena", "13=Gobierno Militar de Burgos", "14=Gobierno Militar de Zaragoza",
    "15=Comandancia Militar de Melilla", "16=Comandancia Militar de Ceuta", "17=Gobierno Militar de Bilbao", "18=Gobierno Militar de Valladolid",
    "# Further commands",
    "19=Comandancia Militar de Asturias", "20=Gobierno Militar de Las Palmas", "21=Gobierno Militar de Granada", "22=Gobierno Militar de Málaga", "23=Gobierno Militar de Pamplona",
    "24=Gobierno Militar de San Sebastián", "25=Gobierno Militar de Menorca", "26=Gobierno Militar de Santander", "27=Gobierno Militar de Badajoz", "28=Gobierno Militar de Córdoba"] }
```

```json batch
{ "addGroup": true, "group": "SPR_INF_06", "selector": "Army of Africa", "addType": "infantry", "fallback": "Grupo de Regulares n.º %d",
  "comment": "# ===== Army of Africa =====\n\nOverrides vanilla SPR_INF_06, the group of the event template División del Ejército de África. The Regulares, the Mehal-las of the Protectorate, the Ifni and Sahara troops and the Cazadores de África.",
  "add": ["# Grupos de Fuerzas Regulares Indígenas",
    "1=Grupo de Regulares de Tetuán n.º 1", "2=Grupo de Regulares de Melilla n.º 2", "3=Grupo de Regulares de Ceuta n.º 3", "4=Grupo de Regulares de Larache n.º 4",
    "5=Grupo de Regulares de Alhucemas n.º 5", "6=Grupo de Regulares de Xauen n.º 6", "7=Grupo de Regulares de Llano Amarillo n.º 7", "8=Grupo de Regulares del Rif n.º 8",
    "9=Grupo de Regulares de Arcila n.º 9", "10=Grupo de Regulares de Bab-Taza n.º 10",
    "# Mehal-las Jalifianas",
    "11=Mehal-la Jalifiana de Tetuán n.º 1", "12=Mehal-la Jalifiana de Melilla n.º 2", "13=Mehal-la Jalifiana de Larache n.º 3", "14=Mehal-la Jalifiana de Gomara n.º 4",
    "15=Mehal-la Jalifiana del Rif n.º 5",
    "# Ifni, Sahara and the Cazadores de África",
    "16=Batallón de Tiradores de Ifni", "17=Agrupación de Tropas Nómadas del Sáhara", "18=Batallón de Cazadores de África 'San Fernando' n.º 1", "19=Batallón de Cazadores de África 'Las Navas' n.º 2",
    "20=Batallón de Cazadores de África 'Melilla' n.º 3", "21=Batallón de Cazadores de África 'Ceriñola' n.º 6", "22=Batallón de Cazadores de África 'Ceuta' n.º 7", "23=Batallón de Cazadores de África 'Serrallo' n.º 8"] }
```

```json batch
{ "addGroup": true, "group": "SPR_LEG_01", "selector": "Legion Banderas", "addType": "infantry", "fallback": "%s Bandera de La Legión",
  "comment": "The banderas and tercios of the Tercio de Extranjeros, La Legión. The banderas named after Nationalist commanders and victories (IX, XIII, XIV, XVII) are left out, because the list is open to every government.",
  "add": ["# Banderas",
    "1=I Bandera de La Legión 'Casa de Borgoña'", "2=II Bandera de La Legión 'Carlos V'", "3=III Bandera de La Legión 'Tigres de Buharrat'", "4=IV Bandera de La Legión 'Cristo de Lepanto'",
    "5=V Bandera de La Legión 'Gonzalo Fernández de Córdoba'", "6=VI Bandera de La Legión 'Duque de Alba'", "7=VII Bandera de La Legión 'Valenzuela'", "8=VIII Bandera de La Legión 'Colón'",
    "10=X Bandera de La Legión 'Millán Astray'", "11=XI Bandera de La Legión 'Comandante Tiede'", "12=XII Bandera de La Legión 'Cabo Suceso Terrero'", "15=XV Bandera de La Legión 'Reino de Aragón'",
    "16=XVI Bandera de La Legión 'Capitán Arredondo'", "18=XVIII Bandera de La Legión 'Nuestra Señora de África'",
    "# Tercios and the tank bandera",
    "19=1.er Tercio 'Gran Capitán'", "20=2.º Tercio 'Duque de Alba'", "21=3.er Tercio 'Don Juan de Austria'", "22=4.º Tercio 'Alejandro Farnesio'", "23=Bandera de Carros de Combate de La Legión"] }
```

```json batch
{ "addGroup": true, "group": "SPR_INF_04", "selector": "Guardia Civil Tercios", "addType": "infantry", "fallback": "%d.º Tercio de la Guardia Civil",
  "comment": "# ===== Security corps =====\n\nOverrides vanilla SPR_INF_04 (Brigada de la Guardia Civil): the corps was organized in tercios and comandancias, 24 tercios in 1936. Vanilla gives the group to both sides, so it is open to every government.",
  "add": ["# Tercios by seat",
    "1=Tercio de la Guardia Civil de Madrid", "2=Tercio Móvil de Madrid", "3=Tercio de la Guardia Civil de Barcelona", "4=Tercio de la Guardia Civil de Valencia",
    "5=Tercio de la Guardia Civil de Sevilla", "6=Tercio de la Guardia Civil de Zaragoza", "7=Tercio de la Guardia Civil de Granada", "8=Tercio de la Guardia Civil de Málaga",
    "9=Tercio de la Guardia Civil de Córdoba", "10=Tercio de la Guardia Civil de La Coruña", "11=Tercio de la Guardia Civil de Valladolid", "12=Tercio de la Guardia Civil de Burgos",
    "13=Tercio de la Guardia Civil de San Sebastián", "14=Tercio de la Guardia Civil de Toledo", "15=Tercio de la Guardia Civil de Murcia", "16=Tercio de la Guardia Civil de Oviedo",
    "17=Tercio de la Guardia Civil de León", "18=Tercio de la Guardia Civil de Badajoz", "19=Tercio de la Guardia Civil de Pamplona", "20=Tercio de la Guardia Civil de Jaén",
    "21=Tercio de la Guardia Civil de Palma de Mallorca", "22=Tercio de la Guardia Civil de Santa Cruz de Tenerife", "23=Tercio de la Guardia Civil de Bilbao", "24=Tercio de la Guardia Civil de Salamanca"] }
```

```json batch
{ "addGroup": true, "group": "SPR_INF_05", "selector": "Assault Guards", "addType": "infantry", "fallback": "%d.º Grupo de Asalto",
  "comment": "Overrides vanilla SPR_INF_05 (División de la Guardia de Asalto): the Cuerpo de Seguridad y Asalto was organized in groups, not divisions. Vanilla gives the group to both sides, so it is open to every government.",
  "add": ["# Grupos de Asalto by city",
    "1=Grupo de Asalto de Madrid", "2=Grupo de Asalto de Barcelona", "3=Grupo de Asalto de Valencia", "4=Grupo de Asalto de Sevilla", "5=Grupo de Asalto de Zaragoza", "6=Grupo de Asalto de Bilbao",
    "7=Grupo de Asalto de Oviedo", "8=Grupo de Asalto de Málaga", "9=Grupo de Asalto de La Coruña", "10=Grupo de Asalto de Badajoz", "11=Grupo de Asalto de Granada", "12=Grupo de Asalto de Murcia",
    "13=Grupo de Asalto de Valladolid", "14=Grupo de Asalto de Córdoba", "15=Grupo de Asalto de Santander", "16=Grupo de Asalto de Cartagena"] }
```

```json batch
{ "addGroup": true, "group": "SPR_CAR_01", "selector": "Carabineros", "addType": "infantry", "fallback": "%d.ª Comandancia de Carabineros",
  "comment": "The Cuerpo de Carabineros, the coast and frontier guard, by comandancia.",
  "add": ["# Comandancias of the coasts and frontiers",
    "1=Comandancia de Carabineros de Gerona", "2=Comandancia de Carabineros de Barcelona", "3=Comandancia de Carabineros de Tarragona", "4=Comandancia de Carabineros de Castellón",
    "5=Comandancia de Carabineros de Valencia", "6=Comandancia de Carabineros de Alicante", "7=Comandancia de Carabineros de Murcia", "8=Comandancia de Carabineros de Almería",
    "9=Comandancia de Carabineros de Málaga", "10=Comandancia de Carabineros de Algeciras", "11=Comandancia de Carabineros de Cádiz", "12=Comandancia de Carabineros de Huelva",
    "13=Comandancia de Carabineros de Badajoz", "14=Comandancia de Carabineros de Salamanca", "15=Comandancia de Carabineros de Pontevedra", "16=Comandancia de Carabineros de La Coruña",
    "17=Comandancia de Carabineros de Asturias", "18=Comandancia de Carabineros de Guipúzcoa", "19=Comandancia de Carabineros de Navarra", "20=Comandancia de Carabineros de Huesca"] }
```

```json batch
{ "addGroup": true, "group": "SPR_INF_02", "selector": "Nationalist Garrisons", "addType": "infantry", "fallback": "Batallón de Guarnición n.º %d",
  "canUse": "OR = { has_government = fascism has_government = neutrality }",
  "comment": "# ===== Nationalist side =====\n\nOverrides vanilla SPR_INF_02 (Guarnición Nacionalista), the group of the Nationalist garrison template of the civil-war event. Garrisons that joined the rising of July 1936.",
  "add": ["# Garrisons of the rising",
    "1=Guarnición de Pamplona", "2=Guarnición de Burgos", "3=Guarnición de Valladolid", "4=Guarnición de Zaragoza", "5=Guarnición de Sevilla", "6=Guarnición de La Coruña",
    "7=Guarnición de Salamanca", "8=Guarnición de Cáceres", "9=Guarnición de Oviedo", "10=Guarnición de Córdoba", "11=Guarnición de Granada", "12=Guarnición de Cádiz",
    "13=Guarnición de Vitoria", "14=Guarnición de Palma de Mallorca", "15=Guarnición de Santa Cruz de Tenerife", "16=Guarnición de Las Palmas", "17=Guarnición de Ceuta", "18=Guarnición de Melilla",
    "19=Guarnición de Tetuán", "20=Guarnición de Huesca", "21=Guarnición de Teruel", "22=Guarnición de Jaca", "23=Guarnición de Logroño", "24=Guarnición de León",
    "25=Guarnición de Zamora", "26=Guarnición de Segovia", "27=Guarnición de Ávila", "28=Guarnición de Soria", "29=Guarnición de Palencia", "30=Guarnición de Vigo",
    "31=Guarnición de El Ferrol", "32=Guarnición de Lugo", "33=Guarnición del Alcázar de Toledo"] }
```

```json batch
{ "addGroup": true, "group": "SPR_INF_03", "selector": "Requeté Tercios", "addType": "infantry", "fallback": "%d.º Tercio de Requetés",
  "canUse": "OR = { has_government = fascism has_government = neutrality }",
  "comment": "Overrides vanilla SPR_INF_03 (%d° Requeté), the group of the event template Requeté Carlista. The Carlist militia fought in tercios named after battles, saints and princes of the Carlist cause.",
  "add": ["# Navarra and the Basque provinces",
    "1=Tercio de Montejurra", "2=Tercio de Lácar", "3=Tercio de Navarra", "4=Tercio de San Miguel", "5=Tercio de San Fermín", "6=Tercio de Roncesvalles",
    "7=Tercio de Abárzuza", "8=Tercio de Nuestra Señora del Camino", "9=Tercio de Doña María de las Nieves", "10=Tercio de Oriamendi", "11=Tercio de Zumalacárregui", "12=Tercio de San Ignacio",
    "13=Tercio de Nuestra Señora de Begoña", "14=Tercio de Ortiz de Zárate", "15=Tercio de la Virgen Blanca", "16=Tercio de Nuestra Señora de Estíbaliz",
    "# Castilla, Aragón, Cataluña and Andalucía",
    "17=Tercio de El Alcázar", "18=Tercio de Cristo Rey", "19=Tercio de Burgos-Sangüesa", "20=Tercio Castellano-Mola", "21=Tercio de Doña María de Molina", "22=Tercio de Nuestra Señora del Pilar",
    "23=Tercio de Almogávares", "24=Tercio de Nuestra Señora de Montserrat", "25=Tercio de la Virgen de los Reyes", "26=Tercio de San Rafael"] }
```

```json batch
{ "addGroup": true, "group": "SPR_FAL_01", "selector": "Falange Banderas", "addType": "infantry; militia", "fallback": "%d.ª Bandera de Falange",
  "canUse": "has_government = fascism",
  "comment": "The militia of Falange Española de las JONS: banderas (battalions) and centurias (companies), raised by region.",
  "add": ["# Named banderas and centurias",
    "1=Bandera 'Leones de Castilla'", "2=Bandera 'General Sanjurjo'", "3=Bandera Legionaria Gallega", "4=Bandera 'Águilas de España'", "5=Bandera Móvil de Aragón",
    "6=Centuria 'José Antonio'", "7=Centuria 'Onésimo Redondo'", "8=Centuria 'Juan Barbará'",
    "# Regional banderas",
    "9=1.ª Bandera de Falange de Castilla", "10=1.ª Bandera de Falange de Aragón", "11=1.ª Bandera de Falange de Navarra", "12=1.ª Bandera de Falange de Marruecos",
    "13=1.ª Bandera de Falange de Galicia", "14=1.ª Bandera de Falange de Asturias", "15=1.ª Bandera de Falange de León", "16=1.ª Bandera de Falange de Burgos",
    "17=1.ª Bandera de Falange de Sevilla", "18=1.ª Bandera de Falange de Cádiz", "19=1.ª Bandera de Falange de Extremadura", "20=1.ª Bandera de Falange de Canarias",
    "21=1.ª Bandera de Falange de Mallorca",
    "# Extensions in the same tradition",
    "22=Bandera 'Ramiro Ledesma Ramos'", "23=Bandera 'Matías Montero'", "24=Bandera 'Julio Ruiz de Alda'"] }
```

```json batch
{ "addGroup": true, "group": "SPR_VOL_01", "selector": "Volunteer Divisions", "addType": "infantry", "fallback": "%d.ª División Española de Voluntarios",
  "canUse": "has_government = fascism",
  "comment": "The División Española de Voluntarios (División Azul, 1941-43) with its regiments and the Legión that followed it, and the mixed Flechas divisions of 1937-39.",
  "add": ["# División Azul",
    "1=División Española de Voluntarios", "2=Legión Española de Voluntarios", "3=Regimiento 262 'Pimentel'", "4=Regimiento 263 'Vierna'", "5=Regimiento 269 'Esparza'",
    "6=Regimiento de Artillería 250 'Badillo'", "7=Batallón de Reserva 'Tía Bernarda'", "8=Compañía de Esquiadores 250", "9=Grupo de Exploración 250", "10=Batallón de Zapadores 250",
    "# Flechas divisions",
    "11=División 'Flechas Negras'", "12=División 'Flechas Azules'", "13=División 'Flechas Verdes'"] }
```

```json batch
{ "addGroup": true, "group": "SPR_ROY_01", "selector": "Royal Regiments", "addType": "infantry", "fallback": "Regimiento de la Guardia Real n.º %d",
  "canUse": "has_government = neutrality",
  "comment": "The palace guard and the infantry regiments with royal titles, under the numbers they held until the Republic dissolved or renamed them in 1931.",
  "add": ["# Palace guard and royal regiments",
    "1=Real Cuerpo de Guardias Alabarderos", "2=Regimiento de Infantería 'Inmemorial del Rey' n.º 1", "3=Regimiento de Infantería 'La Reina' n.º 2", "4=Regimiento de Infantería 'Príncipe' n.º 3",
    "5=Regimiento de Infantería 'Princesa' n.º 4", "6=Regimiento de Infantería 'Infante' n.º 5", "7=Regimiento de Infantería 'Borbón' n.º 17", "8=Regimiento de Infantería 'Lealtad' n.º 30",
    "9=Regimiento de Infantería 'Isabel II' n.º 32", "10=Regimiento de Infantería 'Isabel la Católica' n.º 54"] }
```

```json batch
{ "addGroup": true, "group": "SPR_ROY_02", "selector": "Royal Cavalry Regiments", "addType": "cavalry", "fallback": "Regimiento de Caballería de la Guardia Real n.º %d",
  "canUse": "has_government = neutrality",
  "comment": "The royal escort and the cavalry regiments with royal titles, under their numbers before 1931.",
  "add": ["# Royal escort and royal regiments",
    "1=Escuadrón de la Escolta Real", "2=Regimiento de Lanceros del Rey n.º 1", "3=Regimiento de Lanceros de la Reina n.º 2", "4=Regimiento de Lanceros del Príncipe n.º 3",
    "5=Regimiento de Lanceros de Borbón n.º 4", "6=Regimiento de Húsares de la Princesa n.º 19", "7=Regimiento de Cazadores de Alfonso XII n.º 21", "8=Regimiento de Cazadores de Victoria Eugenia n.º 22",
    "9=Regimiento de Cazadores de Alfonso XIII n.º 24", "10=Regimiento de Cazadores de María Cristina n.º 27"] }
```

```json batch
{ "addGroup": true, "group": "SPD_INF_03", "selector": "Mixed Brigades", "addType": "infantry", "fallback": "%d.ª Brigada Mixta",
  "canUse": "NOT = { has_government = fascism }",
  "comment": "# ===== Republican side =====\n\nOverrides vanilla SPD_INF_03 (Brigada Popular, not a period term). The event template of that name gets the People's Army's Brigadas Mixtas, keyed by their real numbers.",
  "add": ["# Brigades with an identity: former columns, Carabineros, shock and marine brigades",
    "1=1.ª Brigada Mixta 'Líster'", "3=3.ª Brigada Mixta de Carabineros", "5=5.ª Brigada Mixta de Carabineros", "10=10.ª Brigada Mixta 'Móvil de Choque'",
    "22=22.ª Brigada Mixta 'Peire'", "29=29.ª Brigada Mixta 'Cuevas'", "32=32.ª Brigada Mixta 'Mangada'", "34=34.ª Brigada Mixta 'Robledo'",
    "36=36.ª Brigada Mixta 'Prada'", "38=38.ª Brigada Mixta 'Perea'", "39=39.ª Brigada Mixta 'Palacios'", "40=40.ª Brigada Mixta 'Ortega'",
    "43=43.ª Brigada Mixta 'Escobar'", "44=44.ª Brigada Mixta 'Enciso'", "45=45.ª Brigada Mixta 'Burillo'", "46=46.ª Brigada Mixta 'Fantasma'",
    "60=60.ª Brigada Mixta 'Del Rosal'", "65=65.ª Brigada Mixta de Carabineros", "81=81.ª Brigada Mixta 'Torres-Benedito'", "83=83.ª Brigada Mixta 'Columna de Hierro'",
    "85=85.ª Brigada Mixta de Carabineros", "86=86.ª Brigada Mixta 'Móvil de Puertollano'", "87=87.ª Brigada Mixta de Carabineros", "88=88.ª Brigada Mixta 'Andalucía-Extremadura'",
    "100=100.ª Brigada Mixta de Choque", "101=101.ª Brigada Mixta de Choque", "119=119.ª Brigada Mixta 'Durruti'", "122=122.ª Brigada Mixta 'Carlos Marx'",
    "125=125.ª Brigada Mixta 'Ascaso'", "132=132.ª Brigada Mixta 'Macià-Companys'", "147=147.ª Brigada Mixta 'Maroto'", "151=151.ª Brigada Mixta de Infantería de Marina",
    "152=152.ª Brigada Mixta de Carabineros", "153=153.ª Brigada Mixta 'Tierra y Libertad'", "211=211.ª Brigada Mixta de Carabineros", "228=228.ª Brigada Mixta de Carabineros"] }
```

```json batch
{ "addGroup": true, "group": "SPR_INT_01", "selector": "International Brigades", "addType": "infantry", "fallback": "%d.ª Brigada Internacional",
  "canUse": "OR = { has_government = democratic has_government = communism }",
  "comment": "The International Brigades of 1936-38 and their battalions. Keys run 1..N; the brigades keep their Roman numbers in the name.",
  "add": ["# Brigades",
    "1=XI Brigada Internacional 'Thälmann'", "2=XII Brigada Internacional 'Garibaldi'", "3=XIII Brigada Internacional 'Dąbrowski'", "4=XIV Brigada Internacional 'La Marsellesa'",
    "5=XV Brigada Internacional 'Abraham Lincoln'", "6=129.ª Brigada Internacional", "7=150.ª Brigada Internacional",
    "# Battalions",
    "8=Batallón 'Edgar André'", "9=Batallón 'Commune de Paris'", "10=Batallón 'Dąbrowski'", "11=Batallón 'Thälmann'", "12=Batallón 'Garibaldi'",
    "13=Batallón 'André Marty'", "14=Batallón 'Chapaiev'", "15=Batallón 'Henri Vuillemin'", "16=Batallón 'Louise Michel'", "17=Batallón 'Mickiewicz'",
    "18=Batallón 'Palafox'", "19=Batallón 'Domingo Germinal'", "20=Batallón 'Henri Barbusse'", "21=Batallón 'Pierre Brachet'", "22=Batallón 'Vaillant-Couturier'",
    "23=Batallón 'Dimitrov'", "24=Batallón 'Six Février'", "25=Batallón Británico", "26=Batallón 'Abraham Lincoln'", "27=Batallón 'George Washington'",
    "28=Batallón 'Mackenzie-Papineau'", "29=Batallón 'Masaryk'", "30=Batallón 'Đuro Đaković'", "31=Batallón 'Rákosi'", "32=Batallón 'Hans Beimler'",
    "33=Batallón 'Doce de Febrero'", "34=Batallón 'Nueve Naciones'"] }
```

```json batch
{ "addGroup": true, "group": "SPD_INF_01", "selector": "Republican Garrisons", "addType": "infantry", "fallback": "Batallón de Retaguardia n.º %d",
  "canUse": "NOT = { has_government = fascism }",
  "comment": "Overrides vanilla SPD_INF_01 (Guarnición Republicana), the group of the Republican garrison template of the civil-war event. Garrisons of the cities that stayed loyal in July 1936.",
  "add": ["# Loyal garrisons of July 1936",
    "1=Guarnición de Madrid", "2=Guarnición de Barcelona", "3=Guarnición de Valencia", "4=Guarnición de Bilbao", "5=Guarnición de Cartagena", "6=Guarnición de Málaga",
    "7=Guarnición de San Sebastián", "8=Guarnición de Santander", "9=Guarnición de Gijón", "10=Guarnición de Almería", "11=Guarnición de Alicante", "12=Guarnición de Murcia",
    "13=Guarnición de Albacete", "14=Guarnición de Jaén", "15=Guarnición de Badajoz", "16=Guarnición de Castellón", "17=Guarnición de Tarragona", "18=Guarnición de Lérida",
    "19=Guarnición de Gerona", "20=Guarnición de Ciudad Real", "21=Guarnición de Cuenca", "22=Guarnición de Guadalajara", "23=Guarnición de Mahón", "24=Guarnición de Alcalá de Henares"] }
```

```json batch
{ "addGroup": true, "group": "SPD_INF_02", "selector": "Socialist Battalions", "addType": "infantry", "fallback": "Batallón UGT n.º %d",
  "canUse": "NOT = { has_government = fascism }",
  "comment": "Overrides vanilla SPD_INF_02 (Brigada de Juventudes Sindicales, not a period term). Militia battalions of the UGT, the PSOE and the Juventudes Socialistas Unificadas.\nVanilla also gives this group to its POUM youth template.",
  "add": ["# UGT and PSOE battalions",
    "1=Batallón 'Pablo Iglesias'", "2=Batallón 'Largo Caballero'", "3=Batallón 'Margarita Nelken'", "4=Batallón 'Mateos'", "5=Batallón 'Prieto'", "6=Batallón 'Peña'",
    "7=Batallón 'Carlos Marx'", "8=Batallón 'Madrid'", "9=Batallón 'Jean Jaurès'", "10=Batallón 'México'", "11=Batallón 'Torrijos'", "12=Batallón 'Artes Blancas'",
    "13=Batallón 'Capitán Condés'", "14=Batallón 'Leones Rojos'", "15=Batallón 'Félix Bárzana'",
    "# JSU battalions",
    "16=Batallón 'Octubre' n.º 11", "17=Batallón 'Joven Guardia'", "18=Batallón 'Cultura y Deporte'", "19=Batallón 'Castilla'", "20=Batallón 'UHP'", "21=Batallón 'Amuategi'",
    "22=Batallón 'Meabe'", "23=Batallón 'Dragones'", "24=Batallón 'Rusia'", "25=Batallón 'Juventud Campesina'", "26=Batallón 'Deportivo'", "27=Batallón 'Alpino Juventud'",
    "# Extensions in the same tradition",
    "28=Batallón 'Aida Lafuente'", "29=Batallón 'Lina Odena'", "30=Batallón 'Julián Besteiro'", "31=Batallón 'Casa del Pueblo'", "32=Batallón 'Primero de Mayo'"] }
```

```json batch
{ "addGroup": true, "group": "SPD_INF_05", "selector": "Basque Battalions", "addType": "infantry", "fallback": "Euzko Gudarostea, Batallón n.º %d",
  "canUse": "NOT = { has_government = fascism }",
  "comment": "Overrides vanilla SPD_INF_05. Vanilla's focus gives this tag to its Basque template (and the Basque group SPD_INF_04 to the anarchist one), so the Euzko Gudarostea battalions are here.\nPeriod Basque spelling (Euzko, Euzkadi); the unit term was the Spanish Batallón.",
  "add": ["# PNV battalions",
    "1=Batallón 'Arana Goiri'", "2=Batallón 'Itxarkundia'", "3=Batallón 'Amaiur'", "4=Batallón 'Otxandiano'", "5=Batallón 'Gordexola'", "6=Batallón 'Kirikiño'",
    "7=Batallón 'Loyola'", "8=Batallón 'Saseta'", "9=Batallón 'Padura'", "10=Batallón 'Ibaizabal'", "11=Batallón 'Mungia'", "12=Batallón 'Araba'",
    "13=Batallón 'Itxasalde'", "14=Batallón 'Martiartu'", "15=Batallón 'Malato'", "16=Batallón 'Rebelión de la Sal'", "17=Batallón 'Simón Bolibar'", "18=Batallón 'Sukarrieta'",
    "19=Batallón 'Abellaneda'", "20=Batallón 'Muñatones'", "21=Batallón 'Aralar'", "22=Batallón 'Larrazabal'", "23=Batallón 'Ariztimuño'", "24=Batallón 'Irrintzi'",
    "25=Batallón 'Alkartzea'",
    "# ANV, Jagi-Jagi and STV battalions",
    "26=Batallón 'Olabarri'", "27=Batallón 'Euzko Indarra'", "28=Batallón 'Askatasuna'", "29=Batallón 'Lenago Il'", "30=Batallón 'Zergatik ez?'", "31=Batallón 'San Andrés'"] }
```

```json batch
{ "addGroup": true, "group": "SPR_CAT_01", "selector": "Catalan Columns", "addType": "infantry; militia", "fallback": "Columna Catalana núm. %d",
  "canUse": "OR = { has_government = democratic has_government = communism }",
  "comment": "Forces of the Generalitat and of the Catalan republican parties, 1936-37, in Catalan.",
  "add": ["# Columns, Pyrenean militias and the Exèrcit Popular de Catalunya",
    "1=Columna Macià-Companys", "2=Regiment Pirinenc núm. 1 de Catalunya", "3=Milícies Alpines", "4=Milícies Pirinenques", "5=Grup Alpí", "6=Columna Volant Catalana",
    "7=Columna Pirinenca", "8=1a Divisió de l'Exèrcit de Catalunya", "9=2a Divisió de l'Exèrcit de Catalunya", "10=3a Divisió de l'Exèrcit de Catalunya",
    "# Extensions in the same tradition",
    "11=Batalló 'Francesc Layret'", "12=Batalló 'Rafael Casanova'", "13=Batalló 'Pau Claris'", "14=Batalló 'Onze de Setembre'", "15=Batalló 'Els Segadors'", "16=Batalló 'Almogàvers'"] }
```

```json batch
{ "addGroup": true, "group": "SPR_GUE_01", "selector": "Guerrilla Groups", "addType": "infantry; militia", "fallback": "%d.ª Agrupación Guerrillera",
  "canUse": "OR = { has_government = democratic has_government = communism }",
  "comment": "The People's Army's guerrilla corps and the Republican guerrilla groupings of 1939-45 in Spain and in France.",
  "add": ["# Guerrilla corps and groupings",
    "1=XIV Cuerpo de Ejército Guerrillero", "2=Agrupación de Guerrilleros Españoles", "3=Agrupación Guerrillera de Levante y Aragón", "4=Agrupación Guerrillera de Granada",
    "5=Agrupación Guerrillera de Málaga", "6=Federación de Guerrillas de León-Galicia", "7=Ejército Guerrillero de Galicia", "8=Agrupación Guerrillera de Asturias",
    "9=Agrupación Guerrillera de Extremadura", "10=Ejército Guerrillero del Centro", "11=Agrupación Guerrillera del Alto Aragón", "12=Agrupación Guerrillera 'Fermín Galán'",
    "13=Brigada Guerrillera 'Machado'", "14=Agrupación Guerrillera de Córdoba", "15=Agrupación Guerrillera de Ciudad Real",
    "# Spanish guerrilla units in France, 1944",
    "16=204.ª División de Guerrilleros", "17=3.ª Brigada de Guerrilleros Españoles", "18=35.ª Brigada de Guerrilleros Españoles", "19=Compañía 'La Nueve'"] }
```

```json batch
{ "addGroup": true, "group": "SPR_RED_01", "selector": "People's Militia Battalions", "addType": "infantry; militia", "fallback": "Batallón de Milicias Populares n.º %d",
  "canUse": "has_government = communism",
  "comment": "# ===== Revolutionary left =====\n\nCommunist militias: the PCE's Quinto Regimiento de Milicias Populares, the Basque communist battalions and the PSUC columns.",
  "add": ["# Quinto Regimiento",
    "1=5.º Regimiento de Milicias Populares", "2=Compañías de Acero", "3=Batallón 'Thaelmann'", "4=Batallón 'Leningrado'", "5=Batallón 'Comuna de París'", "6=Batallón 'Pasionaria'",
    "7=Batallón 'Victoria'", "8=Batallón de Milicias Gallegas", "9=Batallón 'José Díaz'", "10=Batallón 'Lenin'", "11=Batallón 'El Campesino'", "12=Batallón 'Líster'",
    "13=Batallón 'Amanecer'",
    "# Basque communist battalions",
    "14=Batallón 'Leandro Carro'", "15=Batallón 'Rosa Luxemburgo'", "16=Batallón 'Perezagua'", "17=Batallón 'Larrañaga'", "18=Batallón 'Karl Liebknecht'", "19=Batallón 'Salsamendi'",
    "20=Batallón 'Guipúzcoa'",
    "# PSUC columns and the MAOC",
    "21=Columna Carlos Marx", "22=Columna Del Barrio", "23=Columna Libertad", "24=Milicias Antifascistas Obreras y Campesinas",
    "# Extensions in the same tradition",
    "25=Batallón 'Mundo Obrero'", "26=Batallón 'Pedro Checa'", "27=Batallón 'Stalingrado'", "28=Batallón 'No Pasarán'", "29=Batallón 'Defensa de Madrid'", "30=Batallón 'Frente Rojo'"] }
```

```json batch
{ "addGroup": true, "group": "SPR_POU_01", "selector": "POUM Columns", "addType": "infantry; militia", "fallback": "Columna del POUM n.º %d",
  "canUse": "has_government = communism",
  "comment": "Militias of the Partido Obrero de Unificación Marxista and its youth, the Juventud Comunista Ibérica. Kept apart from the PCE lists.",
  "add": ["# Columns and battalions of 1936-37",
    "1=Columna Lenin", "2=Columna Joaquín Maurín", "3=División Lenin", "4=Batallón de Choque del POUM", "5=Columna Motorizada del POUM", "6=Columna Internacional Lenin",
    "7=Batallón de la Juventud Comunista Ibérica",
    "# Extensions in the same tradition",
    "8=Batallón 'Andreu Nin'", "9=Batallón 'Josep Rovira'", "10=Batallón 'Germinal Vidal'", "11=Batallón 'Hipólito Etchebéhère'", "12=Batallón 'La Batalla'",
    "13=Batallón 'Bloque Obrero y Campesino'"] }
```

```json batch
{ "addGroup": true, "group": "SPD_INF_06", "selector": "Anarchist Columns", "addType": "infantry; militia", "fallback": "Columna Confederal n.º %d",
  "canUse": "NOT = { has_government = fascism }",
  "comment": "Overrides vanilla SPD_INF_06 (Milicia Anarquista), the group of the focus template Anarchist Militia. The CNT-FAI columns of 1936.\nThe Anarchist Commune is non-aligned in the game, so the gate only shuts out a fascist government.",
  "add": ["# Columns of the confederal militias",
    "1=Columna Durruti", "2=Columna Ascaso", "3=Columna Sur-Ebro", "4=Columna Los Aguiluchos", "5=Columna Roja y Negra", "6=Columna de Hierro",
    "7=Columna Tierra y Libertad", "8=Columna Del Rosal", "9=Columna Torres-Benedito", "10=Columna Iberia", "11=Columna Maroto", "12=Columna Andalucía-Extremadura",
    "13=Columna CNT n.º 13", "14=Columna Hilario-Zamora", "15=Columna Temple y Rebeldía", "16=Columna Carod-Ferrer", "17=Columna Cultura y Acción", "18=Columna CEFA",
    "# International groups",
    "19=Grupo Internacional de la Columna Durruti", "20=Centuria 'Sébastien Faure'", "21=Centuria 'Erich Mühsam'"] }
```

```json batch
{ "addGroup": true, "group": "SPD_INF_04", "selector": "Anarchist Battalions", "addType": "infantry", "fallback": "Batallón Confederal n.º %d",
  "canUse": "NOT = { has_government = fascism }",
  "comment": "Overrides vanilla SPD_INF_04. Vanilla's event gives this tag (its Basque group) to the template Brigada Anarquista, so the CNT battalions are here and the Basque battalions are in SPD_INF_05.",
  "add": ["# CNT battalions of Madrid, Euzkadi and Santander",
    "1=Batallón 'Isaac Puente'", "2=Batallón 'Malatesta'", "3=Batallón 'Bakunin'", "4=Batallón 'Durruti'", "5=Batallón 'Sacco-Vanzetti'", "6=Batallón 'Celta'",
    "7=Batallón CNT n.º 7", "8=Batallón 'Libertad'", "9=Batallón CNT-FAI", "10=Batallón 'España Libre'", "11=Batallón 'Águilas de la Libertad'", "12=Batallón 'Espartacus'",
    "13=Batallón 'Mora'", "14=Batallón 'Ferrer'", "15=Batallón 'Orobón Fernández'", "16=Batallón 'Juvenil Libertario'", "17=Batallón 'Sigüenza'", "18=Batallón 'Toledo'",
    "# Extensions in the same tradition",
    "19=Batallón 'Kropotkin'", "20=Batallón 'Anselmo Lorenzo'", "21=Batallón 'Salvador Seguí'", "22=Batallón 'Fermín Salvochea'", "23=Batallón 'Ricardo Flores Magón'",
    "24=Batallón 'Germinal'", "25=Batallón 'Acracia'", "26=Batallón 'Solidaridad Obrera'"] }
```
