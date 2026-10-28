# Hungary (HUN) Namelist Plan - 2026-10-25

Status: READY

File: `common/units/names_divisions/zz_INEX_HUN_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Hungary has no INEX file. Vanilla (`HUN_names_divisions.txt`, game 1.19.3) has 13 `HUN_*` groups, almost all bare runs of the fallback, several with the wrong term or case (`HUN_INF_02` "Infantry Brigades" typed `cavalry`, cavalry falling back to "Huszár Dandár", motorized to "Motorizált Dandár", the misspelt "Ejtöernyös"), and 9 `AUSHUN_*` groups for Austria-Hungary. ROADMAP.md Tier 1 lists HUN first. This plan creates the file with 25 groups and 572 names: twelve vanilla tags overridden, Named variants for every plain line list, the 1941 infantry brigades, border guards, and four government-gated suites.

Uncommitted at hand-off and part of the ship commit: the ROADMAP.md note on Austria-Hungary (written on the user's word during planning). The three `docs/tooling-backlog.md` entries from this plan were fixed in the tooling session of 2026-10-27 and committed with it.

## Decisions
- 2026-10-25, user policy answers:
  - Plausible extrapolation allowed; every extension follows a verified pattern and is listed under "Author confirmation".
  - Ideology suites: Royal/Habsburg (`neutrality`), Arrow Cross / Hungarist (`fascism`), Red Army (`communism`), Republican (`democratic`).
  - The `AUSHUN_*` groups stay with vanilla and are left out of this plan; a note for a later Austria-Hungary plan was added to ROADMAP.md (Austria row of Tier 2, and the cross-cutting note on generic lists).
- **Orthography.** Hungarian as the Honvédség wrote it: Arabic ordinal with a full stop, unit noun in lower case (`1. gyaloghadosztály`, `2. gépkocsizó dandár`, `1. hegyidandár`), a regional title in lower case in parentheses after the attested `27. (székely) könnyű hadosztály`. Nicknames stand in straight single quotes in the nominative; persons in Hungarian order, surname first (`'Kossuth Lajos'`). Unnumbered attested names keep their source capitalisation (`Magyar Királyi Testőrség`, `Fekete sereg`, `Ruszin Vörös Gárdahadosztály`).
- **Terms.** Infantry `gyaloghadosztály`; brigades `gyalogdandár`; motorized `gépkocsizó` (the army's term; `motorizált` is wrong), used for a division as `gépkocsizó hadosztály`; mechanized `gépesített lövészhadosztály` (the later Hungarian term; Hungary had no mechanized division and `páncélgránátos` is a German calque); armour `páncéloshadosztály`; cavalry `lovashadosztály` (the 1944 *1. honvéd lovashadosztály*; *huszárhadosztály* is commemorative only); mountain `hegyidandár`, kept as a brigade as in the army; marines become the river forces, `folyamerő dandár` after the *Honvéd Folyamerők* of 1939 and the 1940 listing *folyamerő dandár*; paratroopers `ejtőernyős hadosztály`; garrisons keep vanilla's `tábori póthadosztály`; border guards `határvadászdandár`.
- **Gate on reused vanilla tags.** Vanilla's universal `HUN_*` groups have `for_countries = { AUS HUN CZE }` and `can_use = { OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE } }`. A redefinition adds to `for_countries` and replaces `can_use` [NAM-020], so `always = yes` would open the Hungarian lists to Austria and Czechoslovakia, whose templates would then move to them as the larger groups [NAM-018]. Every reused universal tag therefore keeps vanilla's gate verbatim; `HUN_EMPIRE` is the Austria-Hungary cosmetic tag (set by the Habsburg focuses and the formable decision). It is a tag gate, not a focus, decision, idea or flag. New tags get `for_countries = { HUN }` from the tool and `always = yes` or `has_government`. `HUN_MIL_01` (vanilla `for_countries = { HUN }`, `original_tag = HUN`) takes `always = yes`, which is the same for Hungary.
- **Links.** Vanilla links `HUN_INF_01`, `HUN_INF_02` and `HUN_GAR_01` in one pool and `HUN_MOT_01` with `HUN_MEC_01`; links are added on a redefinition [NAM-020], so they stay in the merged groups. `"link"` takes one group that already exists (tooling backlog, 2026-10-25), so the batch links each later group to an earlier one: `HUN_INF_02`, `HUN_INF_03`, `HUN_GAR_01` to `HUN_INF_01`; `HUN_MEC_01`, `HUN_MOT_02`, `HUN_MEC_02` to `HUN_MOT_01` (the mobile anchor, as in LIT and ROM); each other Named group to its plain group. Armour stays outside the mobile family, as in vanilla.
- **Types.** `HUN_INF_02` keeps vanilla's `cavalry` type, which a redefinition cannot remove [NAM-020]; the batch adds `infantry`.
- **Plain variants and vanilla's numbers.** Where vanilla's text differs from the INEX fallback (wrong term or case), the plain group writes every vanilla number again: `HUN_MOT_01` 34 keys, `HUN_MEC_01` 33, `HUN_ARM_01` 33, `HUN_CAV_01` 53, `HUN_MTN_01` 53, `HUN_MAR_01` 30, `HUN_PAR_01` 30, `HUN_INF_02` 31. Where vanilla's text equals the fallback (`HUN_INF_01` except key 27, `HUN_GAR_01` keys 1-32 and 202-204), the numbers are left to vanilla. Each plain line list gets a Named partner, including cavalry, mountain and river forces, so that `-Audit` treats the rewritten runs as plain variants.
- **Named identities.** Infantry: the seat of each brigade of April 1941 in the regional form of *27. (székely)*, then regions and counties. Motorized: rivers. Mechanized: battles and sieges up to 1917, none from 1848-1849 (they belong to the democratic suite). Armour: the army's vehicle names, then the captains of the border fortresses against the Ottomans. Cavalry: hussar generals and regiment patrons. Mountain: the Verecke Pass, Carpathian peaks, the Hungarian highlands and the Székely seats. River forces: the patrol boats *Sopron* and *Siófok*, then river towns.
- **One figure per suite.** No person or symbol stands in two lists. Royal: the kings and the Holy Crown (Mátyás as *'Mátyás király'*; "Hunyadi" is not used, since it is in the German SS list). Hungarist: the Conquest chieftains (except Tas, Botond and Csaba, which are vehicle names in `HUN_ARM_02`), the legends, and the lands of the Hungarist plan. Red: the 1919 divisions and communist patrons, with Dózsa, Martinovics and Táncsics. Democratic: Kossuth, Petőfi, Batthyány, the 1849 corps commanders and the 13 Martyrs of Arad, and 1956. Szent László stays with the regular army (`HUN_PAR_01`, the 1944 division). Csepel goes to the communist workers; the 1956 list uses other insurgent groups.
- **Exclusions.** Not named: the gendarmerie (the 1944 deportations), the Arrow Cross party service (*Pártszolgálat*) and the *Nemzeti Számonkérő Különítmény*, labour service, the units of the Újvidék raid of January 1942 (no Délvidék or Bácska title in the Named lists), the Lenin Boys (vanilla's `HUN_MIL_02` names are the 14 men executed in 1919 for the Red Terror killings, and are written over), the Prónay, Héjjas and Ostenburg detachments, the Hungarian Waffen-SS divisions (they stay in `GER_SS`), and party leaders as patrons (Szálasi, Gömbös, Kun, Rákosi, Szamuely; Nagy Imre). The occupation light divisions of 1941-1943 appear only by number in `HUN_GAR_01`, as other nations' security divisions do.
- **Left to vanilla.** `HUN_MIL_03` (Volksbund, empty list, a focus template) and the nine `AUSHUN_*` groups.

## Vanilla findings (`-InspectVanilla HUN`)
| Vanilla | State | Action in the batch |
|---|---|---|
| `HUN_INF_01` "Infantry Divisions" | 32 entries, all `%d. gyaloghadosztály` except 27 = `%d. 'Szekel' gyaloghadosztály`; linked to `HUN_INF_02`, `HUN_GAR_01`; scripted: focus templates in `hungary.txt` (4831, 4852), `hungary_wuw.txt` (11820-12066, 18430-18905) and the Yugoslav *Vojvodina* template (`yugoslavia.txt:1580`, kept out by the gate as in vanilla) | plain variant; key 27 written plain, the Székely title moves to `HUN_INF_03` |
| `HUN_INF_02` "Infantry Brigades" | typed `cavalry`; 31 entries `%d. Gyalogdandár` (1-27, 102, 105, 108, 124); the starting infantry templates of every history file use it | the 27 brigades of 1941 with their seats; 102-124 written as `%d. gyalogdandár`; `infantry` added |
| `HUN_CAV_01` "Cavalry Divisions" | 53 entries `%d. Huszár Dandár`; starting cavalry templates and the focus template *Magyar Királyi Huszárok* | plain variant `%d. lovashadosztály`, keys 1-53 written over |
| `HUN_MOT_01` "Motorised Divisions" | 34 entries `%d. Motorizált Dandár`; linked to `HUN_MEC_01`; 1939 starting template and the focus template *Gyorshadtest* | plain variant `%d. gépkocsizó hadosztály`, all 34 keys written over |
| `HUN_ARM_01` "Armoured Divisions" | 33 entries `%d. Páncéloshadosztály` | plain variant, keys 1-33 written over in lower case |
| `HUN_MEC_01` "Mechanised Divisions" | 33 entries `%d. Páncélgránátos hadosztály` | plain variant `%d. gépesített lövészhadosztály`, keys 1-33 |
| `HUN_GAR_01` "Garrison Divisions" | 35 entries `%d. tábori póthadosztály` (1, 4-27, 30-32, 102, 105, 108, 124, 201-204) | fallback kept; 102, 105, 108, 124, 201 written as `%d. könnyű hadosztály` and 121 added; the other vanilla numbers stay with vanilla's text, which equals the fallback |
| `HUN_MAR_01` "Marine Divisions" | 30 entries `%d. Folyamdandár` | plain `%d. folyamerő dandár`, keys 1-30 |
| `HUN_MTN_01` "Mountain Divisions" | 53 entries `%d. Hegyidandár`; focus template *Székel Command Group* | plain `%d. hegyidandár`, keys 1-53 |
| `HUN_PAR_01` "Paratrooper Divisions" | key 1 `'Szent László' Hadosztály`, 2-30 `%d. Ejtöernyös hadosztály` | key 1 `Szent László hadosztály`, 2-30 `%d. ejtőernyős hadosztály` |
| `HUN_MIL_01` "Ragged Guards Divisions" | 17 entries `Rongyos Gárda '<place>'`, key 7 *'Pecs'*; focus templates *Rongyos Gárda* | 17 keys written, key 7 *'Pécs'*; fallback `Rongyos Gárda %d. puskás zászlóalj` |
| `HUN_MIL_02` "Lenin Boys Divisions" | 14 names of the Lenin Boys executed in 1919, in Western order, with *Béla Kun* for Cserny József; `has_government = communism`; focus template *Lenin-fiúk* | keys 1-16 written over with workers' battalions; gate kept |
| `HUN_MIL_03` "Volksbund Divisions" | empty; focus template | left to vanilla |
| `AUSHUN_*` (9) | German texts for Austria-Hungary | left to vanilla (ROADMAP note) |

The rehearsal audit leaves two `Vanilla:` lines, both expected: `HUN_INF_01` and `HUN_GAR_01` leave out vanilla's numbered keys, which read the same as the INEX fallback. No vanilla nickname is lost: *'Szekel'* becomes *27. (székely) gyaloghadosztály* in `HUN_INF_03`, and *Szent László* stays at `HUN_PAR_01` key 1.

## Group suite
Totals: 25 groups, 572 names.

| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `HUN_INF_01` | Infantry Divisions | infantry | HUN gate | (vanilla: `HUN_INF_02`, `HUN_GAR_01`) | `%d. gyaloghadosztály` | 1 |
| `HUN_INF_02` | Infantry Brigades | infantry (+ vanilla cavalry) | HUN gate | `HUN_INF_01` | `%d. gyalogdandár` | 31 |
| `HUN_INF_03` | Infantry Divisions (Named) | infantry | always | `HUN_INF_01` | `%d. gyaloghadosztály` | 40 |
| `HUN_MOT_01` | Motorized Divisions | motorized | HUN gate | (vanilla: `HUN_MEC_01`) | `%d. gépkocsizó hadosztály` | 34 |
| `HUN_MEC_01` | Mechanized Divisions | mechanized | HUN gate | `HUN_MOT_01` | `%d. gépesített lövészhadosztály` | 33 |
| `HUN_MOT_02` | Motorized Divisions (Named) | motorized | always | `HUN_MOT_01` | `%d. gépkocsizó hadosztály` | 20 |
| `HUN_MEC_02` | Mechanized Divisions (Named) | mechanized | always | `HUN_MOT_01` | `%d. gépesített lövészhadosztály` | 15 |
| `HUN_ARM_01` | Armored Divisions | light/medium/heavy/modern_armor | HUN gate | none | `%d. páncéloshadosztály` | 33 |
| `HUN_ARM_02` | Armored Divisions (Named) | light/medium/heavy/modern_armor | always | `HUN_ARM_01` | `%d. páncéloshadosztály` | 17 |
| `HUN_CAV_01` | Cavalry Divisions | cavalry | HUN gate | none | `%d. lovashadosztály` | 53 |
| `HUN_CAV_02` | Cavalry Divisions (Named) | cavalry | always | `HUN_CAV_01` | `%d. lovashadosztály` | 9 |
| `HUN_MTN_01` | Mountain Brigades | mountaineers | HUN gate | none | `%d. hegyidandár` | 53 |
| `HUN_MTN_02` | Mountain Brigades (Named) | mountaineers | always | `HUN_MTN_01` | `%d. hegyidandár` | 24 |
| `HUN_MAR_01` | River Force Brigades | marine | HUN gate | none | `%d. folyamerő dandár` | 30 |
| `HUN_MAR_02` | River Force Brigades (Named) | marine | always | `HUN_MAR_01` | `%d. folyamerő dandár` | 11 |
| `HUN_PAR_01` | Paratrooper Divisions | paratrooper | HUN gate | none | `%d. ejtőernyős hadosztály` | 30 |
| `HUN_GAR_01` | Garrison Divisions | infantry | HUN gate | `HUN_INF_01` | `%d. tábori póthadosztály` | 6 |
| `HUN_GAR_02` | Border Guard Brigades | infantry | always | none | `%d. határvadászdandár` | 3 |
| `HUN_MIL_01` | Ragged Guard | militia | always | none | `Rongyos Gárda %d. puskás zászlóalj` | 17 |
| `HUN_GUA_01` | Royal Guard Divisions | infantry, cavalry, light/medium/heavy/modern_armor | `has_government = neutrality` | none | `%d. királyi gárdahadosztály` | 18 |
| `HUN_FAS_01` | Hungarist Divisions | infantry, motorized | `has_government = fascism` | none | `%d. hungarista hadosztály` | 19 |
| `HUN_RED_01` | Red Army Divisions | infantry, motorized | `has_government = communism` | none | `%d. vörös hadosztály` | 20 |
| `HUN_MIL_02` | Workers' Battalions | militia | `has_government = communism` | none | `%d. munkászászlóalj` | 16 |
| `HUN_DEM_01` | 1848 Honvéd Divisions | infantry, cavalry | `has_government = democratic` | none | `%d. honvédhadosztály` | 25 |
| `HUN_DEM_02` | National Guard Divisions | infantry, militia | `has_government = democratic` | none | `%d. nemzetőr hadosztály` | 14 |

"HUN gate" is `OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }`.

## Research record
- `inex-historical-researcher`, regular army (`scratch/hun_dossier.md`): 38 web calls. Sources: hu.wikipedia "Magyar Királyi Honvédség (1922–1945)" (1940 corps seats, Gyorshadtest brigades and seats), mek.oszk.hu 02185 ch. 64 (light, reserve and occupation division numbers), en.wikipedia "Royal Hungarian Army", the 12th/14th/15th/19th brigade pages, "Gyorshadtest", "Third Army (Hungary)", "Battle of Debrecen" OOB, "Szent László Infantry Division", "Imperial and Royal Hussars"; Szeged journal snippets (tábori póthadosztály, border defence); Parádi, *A Magyar Királyi Folyamőrség* (Salutem 7, 2019); Fortepan (patrol boat *Sopron*); honvedelem.hu (paratroopers).
- `inex-historical-researcher`, ideology suites (`scratch/hun_dossier2.md`): 40 web calls. Sources: hu.wikipedia "Magyar királyi nemesi testőrség", "Hungarizmus", "Magyar Vörös Hadsereg", "Lenin-fiúk", "1848–49-es honvédsereg", "Aradi vértanúk", "Nemzetőrség (1956)"; mek.oszk.hu "A Vörös Hadsereg (1919)"; en.wikipedia "Arrow Cross Party", "List of Waffen-SS divisions", "Rákosi Battalion", "Volunteer Regiment of Buda"; warhistory.org "The Waffen-SS and Hungary"; the Ludovika study on the Hungarist plan (snippet).
- `inex-historical-researcher`, narrow follow-up (`scratch/hun_dossier3.md`): 26 web calls. Source of the brigade seats: hu.wikipedia "2. magyar hadsereg", order of battle of April 1941 (after Szakály); border-guard units 8, 9 and the Székely Határvédelmi Erők from the same page and Szabó (Hadtörténelmi Közlemények 2011/2); the official name *1. honvéd lovashadosztály* (MEK/mtak).
- `inex-proofreader` on all authored names: see "Review".
- Planner: `-InspectVanilla HUN` and the vanilla excerpts; who sets `HUN_EMPIRE` (`formable_nation_decisions.txt:1085`, `habsburg_joint.txt:3598`, `hungary.txt:362`, `hungary_wuw.txt:4952`); the focus ids that create the militia templates; a grep of the INEX files for Hungarian names (only *Hunyadi*, in `GER_SS`).
- Verified: the 27 brigade seats of 1941, the corps seats, the gépkocsizó and lovasdandár brigades, the 1944 lovashadosztály, the 1. hegyidandár, the 1. ejtőernyős zászlóalj, the occupation light division numbers 102, 105, 108, 121, 124, 201, the river forces' names, the Hungarian vehicle names, the royal guards, the Hungarist lands, the 1919 Red Army divisions and named units, the Buda Volunteer Regiment, the 1848 commanders and the 13 Martyrs of Arad, the 1956 National Guard and its groups.
- Unverified and left out: interwar hussar regiment honorifics (game wiki only), river craft names other than *Sopron* and *Siófok*, armoured trains, the 1938 Rongyos Gárda battalion designations, the Hungarist "5. Kossuth" division, the 1918 National Guard, Hungarian partisan groups, Budapest factory units of 1919 by name.

## Author confirmation
Extrapolated (plausible, not historical units or forms):
- `HUN_INF_02`: the seat in parentheses after the number (the 1941 seats are attested; the written form follows the hu.wikipedia listing style); keys 102, 105, 108, 124 as *gyalogdandár* (vanilla's numbers).
- `HUN_INF_03`: all 40 names (keys 1-26 from the attested seats, 27 the attested Székely title, 28-40 regions and counties).
- `HUN_MOT_01`, `HUN_MOT_02`: *gépkocsizó hadosztály* for a division (the brigade form is attested); all 20 rivers.
- `HUN_MEC_01`, `HUN_MEC_02`: *gépesített lövészhadosztály* (post-1945 Hungarian term); all 15 battles.
- `HUN_ARM_02`: the vehicle names as division nicknames (keys 1-8, the vehicles are attested); keys 9-17 (border-fortress captains).
- `HUN_CAV_02`: all nine patrons (Hadik and Nádasdy are attested patrons of k.u.k. hussar regiments; Kolossváry Dezső was a Dualist-era honvéd general).
- `HUN_MTN_02`: all 24 names.
- `HUN_MAR_01`, `HUN_MAR_02`: *folyamerő dandár* as a unit; keys 3-11 (river towns; *Sopron* and *Siófok* are attested patrol boats).
- `HUN_PAR_01`: *ejtőernyős hadosztály* (Hungary had a battalion).
- `HUN_MIL_01`: the fallback `Rongyos Gárda %d. puskás zászlóalj` (the 1938 rifle battalions are attested, their numbering is not); the 17 place names are vanilla's.
- `HUN_GUA_01`: keys 1-13 (guard divisions after kings); keys 101-105 are attested.
- `HUN_FAS_01`: all 19 names as division names (the lands of keys 16-19 are attested Hungarist terms; the chieftains are a Turanist extension of the movement's Árpád symbolism).
- `HUN_RED_01`: keys 10-18 (patron divisions; Sallai Imre, Fürst Sándor, Schönherz Zoltán, Ságvári Endre and Zalka Máté from memory, all communists); keys 1-6, 9 and 101-104 are attested.
- `HUN_MIL_02`: all 16 names (the 1919 workers' battalions are attested, not their district names).
- `HUN_DEM_01`: all 25 as division names (the persons and the red-capped battalions are attested).
- `HUN_DEM_02`: all 14 as division names (groups, commanders and the 1848 camps are attested).

## Kept on judgment
Expected `-Check HUN` flags after the batch (`-DryRun` and a rehearsal with the audit of 2026-10-27: `FLAGS=4`):
- `LOW_DEPTH` on `HUN_CAV_02` (9 names): only patrons that could be placed with confidence; the fallback carries on.
- `PLACEHOLDER_ENTRIES` and `LOW_DEPTH` on `HUN_PAR_01`: keys 2-30 write over vanilla's misspelt *Ejtöernyös*; Hungary had one parachute battalion, so no Named list.
- `UNGATED_POLITICAL` on `HUN_MIL_01`: raised by the `militia` type on an ungated group. Vanilla's own Ragged Guard list, ungated in vanilla and used by focus templates; kept ungated so those templates keep it.
Any other flag is a stop condition.

## Implementation steps
- [ ] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames HUN -Batch docs\plans\2026-10-25-hungary-namelist.md`. Expect `Created zz_INEX_HUN_names_divisions.txt`, then these 25 lines and no `[ERROR]`:
  - `Added HUN_INF_01: "Infantry Divisions" [infantry], 1 name(s)`
  - `Added HUN_INF_02: "Infantry Brigades" [infantry], 31 name(s), links HUN_INF_01`
  - `Added HUN_INF_03: "Infantry Divisions (Named)" [infantry], 40 name(s), links HUN_INF_01`
  - `Added HUN_MOT_01: "Motorized Divisions" [motorized], 34 name(s)`
  - `Added HUN_MEC_01: "Mechanized Divisions" [mechanized], 33 name(s), links HUN_MOT_01`
  - `Added HUN_MOT_02: "Motorized Divisions (Named)" [motorized], 20 name(s), links HUN_MOT_01`
  - `Added HUN_MEC_02: "Mechanized Divisions (Named)" [mechanized], 15 name(s), links HUN_MOT_01`
  - `Added HUN_ARM_01: "Armored Divisions" [light_armor medium_armor heavy_armor modern_armor], 33 name(s)`
  - `Added HUN_ARM_02: "Armored Divisions (Named)" [light_armor medium_armor heavy_armor modern_armor], 17 name(s), links HUN_ARM_01`
  - `Added HUN_CAV_01: "Cavalry Divisions" [cavalry], 53 name(s)`
  - `Added HUN_CAV_02: "Cavalry Divisions (Named)" [cavalry], 9 name(s), links HUN_CAV_01`
  - `Added HUN_MTN_01: "Mountain Brigades" [mountaineers], 53 name(s)`
  - `Added HUN_MTN_02: "Mountain Brigades (Named)" [mountaineers], 24 name(s), links HUN_MTN_01`
  - `Added HUN_MAR_01: "River Force Brigades" [marine], 30 name(s)`
  - `Added HUN_MAR_02: "River Force Brigades (Named)" [marine], 11 name(s), links HUN_MAR_01`
  - `Added HUN_PAR_01: "Paratrooper Divisions" [paratrooper], 30 name(s)`
  - `Added HUN_GAR_01: "Garrison Divisions" [infantry], 6 name(s), links HUN_INF_01`
  - `Added HUN_GAR_02: "Border Guard Brigades" [infantry], 3 name(s)`
  - `Added HUN_MIL_01: "Ragged Guard" [militia], 17 name(s)`
  - `Added HUN_GUA_01: "Royal Guard Divisions" [infantry cavalry light_armor medium_armor heavy_armor modern_armor], 18 name(s)`
  - `Added HUN_FAS_01: "Hungarist Divisions" [infantry motorized], 19 name(s)`
  - `Added HUN_RED_01: "Red Army Divisions" [infantry motorized], 20 name(s)`
  - `Added HUN_MIL_02: "Workers' Battalions" [militia], 16 name(s)`
  - `Added HUN_DEM_01: "1848 Honvéd Divisions" [infantry cavalry], 25 name(s)`
  - `Added HUN_DEM_02: "National Guard Divisions" [infantry militia], 14 name(s)`
- [ ] 2. Write `wiki/Hungary.md` with the whole page under "Docs payload" (Write tool; the fence lines are not part of the page).
- [ ] 3. `powershell -File .\build.ps1 -SyncWiki HUN -Country "Hungary"`. Expect `Registered HUN (Hungary) in: README.md, wiki/Home.md, wiki/_Sidebar.md`, `Hungary.md: 0 row(s) updated` and `wiki/Home.md: HUN group count 25 (unchanged)`, with no `row added`, `no group table` or `stale row` line.
- [ ] 4. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: make the two insertions under "Docs payload" with the Edit tool.
- [ ] 5. `powershell -File .\build.ps1 -Check HUN`. Expect:
  - `Validate: OK` and the tests passing (0 failed);
  - `AUDIT SUMMARY HUN: GROUPS=25 AUTHORED=296/572 FLAGS=4` and `Flags: LOW_DEPTH x2, UNGATED_POLITICAL x1, PLACEHOLDER_ENTRIES x1` (see "Kept on judgment");
  - no `[WARN] Docs:` line (the Hungary block is 383 of its 450 characters);
  - `Plan: no audit plan in progress for HUN` (expected);
  - `Diff vs HEAD, file absent: 25 group(s) changed, +572 -0 name(s)`;
  - `Check passed`.
- [ ] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 7. Ship, on the user's word:
  1. `ROADMAP.md`, Tier 1 table: replace ``| Hungary | HUN | `hungary.txt`, `hungary_wuw.txt` | 74 / 569 | M |`` with ``| ~~Hungary~~ | HUN | Shipped (docs/plans/archive/2026-10-25-hungary-namelist.md) | 74 / 569 | M |``.
  2. `ROADMAP.md`, the Tier 1 notes: replace `- **HUN.** The Axis minor players pick most,` with `- ~~**HUN.**~~ Shipped as a new file of 25 groups (plan in docs/plans/archive/2026-10-25-hungary-namelist.md). Before it, the Axis minor players picked most,`.
  3. `ROADMAP.md`, Coverage snapshot: replace `19 tags in 21 files.` with `20 tags in 22 files.`, and insert the row `| HUN | 25 | 296/572 (52 %) | 4 | <date of the ship commit, YYYY-MM-DD> |` directly above the row that starts `| BRA |`.
  4. Move this plan to `docs/plans/archive/`.
  5. Commit the namelist file, README.md, WORKSHOP_DESCRIPTION_GUIDELINES.md, wiki/Hungary.md, wiki/Home.md, wiki/_Sidebar.md, ROADMAP.md and the archived plan with the message `Add Hungary division namelists` (this plan's backlog entries were fixed and committed with the tooling work of 2026-10-27). If `git status` shows changes of another plan in progress (e.g. China), stage only these paths.
  6. `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document HUN division namelists"`.

## Docs payload
README.md, `wiki/Home.md` and `wiki/_Sidebar.md`: by `-SyncWiki -Country` in step 3.

### Workshop cross-reference row
In `WORKSHOP_DESCRIPTION_GUIDELINES.md`, insert this line directly after the line that starts ``| `zz_INEX_SPR_names_divisions.txt` |``:

```
| `zz_INEX_HUN_names_divisions.txt` | Hungary | `HUN` | Included (Plain & Named infantry, motorized, mechanized, armored and cavalry divisions, 1941 infantry brigades with their seats, mountain brigades, river forces, paratroopers, garrisons & border guards, Ragged Guard, Royal Guard, Hungarist divisions, Red Army & Workers' Battalions, 1848 Honvéd & 1956 National Guard) |
```

### Workshop `[b]Hungary[/b]` block
In the BBCode block of `WORKSHOP_DESCRIPTION_GUIDELINES.md`, insert this after the last `[b]Spain[/b]` bullet (the line ending `militias ([i]Columna Durruti[/i]), Basque and Catalan forces`), with one empty line before `[b]Hungary[/b]`; the empty line and `If you enjoy the mod, ...` follow it as before:

```
[b]Hungary[/b]
- Plain and Named divisions with seat, river, battle and vehicle identities ([i]1. páncéloshadosztály 'Toldi'[/i]), the 1941 infantry brigades with their seats ([i]14. gyalogdandár (Szeged)[/i]), mountain brigades, river forces, paratroopers and the Ragged Guard
- Royal Guard, Hungarist divisions, Red Army and Workers' Battalions, 1848 Honvéd and 1956 National Guard
```

The description grows to about 7,690 characters (about 8,130 if China shipped first), within its 16,000-character budget.

### wiki/Hungary.md (whole page)
````markdown
# Hungary

**Country Tag:** `HUN` | **Source File:** [`zz_INEX_HUN_names_divisions.txt`](../common/units/names_divisions/zz_INEX_HUN_names_divisions.txt)

---

## Historical Overview

The Royal Hungarian Honvédség (*Magyar Királyi Honvédség*) was held to a small army by the Treaty of Trianon. Until 1938 it had seven mixed brigades (*vegyesdandár*), which the Győr programme turned into corps; by April 1941 nine corps (Budapest, Székesfehérvár, Szombathely, Pécs, Szeged, Debrecen, Miskolc, Kassa, Kolozsvár) held 27 infantry brigades (*gyalogdandár*), which became light divisions (*könnyű hadosztály*) in February 1942. Its mobile troops were the Rapid Corps (*Gyorshadtest*) with two motorized (*gépkocsizó*) and two cavalry brigades (*lovasdandár*), from which came the 1st and 2nd Armoured Divisions (*1. és 2. páncéloshadosztály*) and the 1st Cavalry Division (*1. honvéd lovashadosztály*). The army wrote an Arabic ordinal with a full stop and the unit noun in lower case, and a regional title in parentheses: *27. (székely) könnyű hadosztály*.

The Named lists build on that pattern and on the army's own vehicle names: the brigade seats for infantry (*14. (szegedi) gyaloghadosztály*), rivers and battles for the mobile lists, the tanks *Toldi*, *Turán*, *Zrínyi* and *Nimród* and the captains of the border fortresses for armour, hussar generals for cavalry, and the Carpathian passes, peaks and Székely seats for the mountain brigades.

INEX overrides twelve vanilla `HUN_*` lists. Vanilla wrote its fallbacks with the wrong terms or case (*Huszár Dandár*, *Motorizált Dandár*, *Páncélgránátos*, *Folyamdandár*, the misspelt *Ejtöernyös*), and every one of those numbers is written over. Vanilla also lists Austria and Czechoslovakia in these groups and keeps them out through the gate `tag = HUN` or the Austria-Hungary cosmetic tag; the INEX groups keep that gate. The Volksbund militia and the Austria-Hungary (`AUSHUN_*`) lists stay vanilla.

Hungary starts in 1936 under Horthy's regency (`neutrality`). The Royal Guard (`neutrality`), Hungarist (`fascism`), Red Army and Workers' Battalion (`communism`), and 1848 Honvéd and National Guard (`democratic`) lists are gated by government type only and never mix traditions. No unit known for atrocities is named: not the gendarmerie, the Arrow Cross party service, the Lenin Boys or the units of the Újvidék raid.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `HUN_INF_01` | Infantry Divisions | infantry | `%d. gyaloghadosztály` |
| `HUN_INF_02` | Infantry Brigades | infantry | `%d. gyalogdandár` |
| `HUN_INF_03` | Infantry Divisions (Named) | infantry | `%d. gyaloghadosztály` |
| `HUN_MOT_01` | Motorized Divisions | motorized | `%d. gépkocsizó hadosztály` |
| `HUN_MEC_01` | Mechanized Divisions | mechanized | `%d. gépesített lövészhadosztály` |
| `HUN_MOT_02` | Motorized Divisions (Named) | motorized | `%d. gépkocsizó hadosztály` |
| `HUN_MEC_02` | Mechanized Divisions (Named) | mechanized | `%d. gépesített lövészhadosztály` |
| `HUN_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. páncéloshadosztály` |
| `HUN_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d. páncéloshadosztály` |
| `HUN_CAV_01` | Cavalry Divisions | cavalry | `%d. lovashadosztály` |
| `HUN_CAV_02` | Cavalry Divisions (Named) | cavalry | `%d. lovashadosztály` |
| `HUN_MTN_01` | Mountain Brigades | mountaineers | `%d. hegyidandár` |
| `HUN_MTN_02` | Mountain Brigades (Named) | mountaineers | `%d. hegyidandár` |
| `HUN_MAR_01` | River Force Brigades | marine | `%d. folyamerő dandár` |
| `HUN_MAR_02` | River Force Brigades (Named) | marine | `%d. folyamerő dandár` |
| `HUN_PAR_01` | Paratrooper Divisions | paratrooper | `%d. ejtőernyős hadosztály` |
| `HUN_GAR_01` | Garrison Divisions | infantry | `%d. tábori póthadosztály` |
| `HUN_GAR_02` | Border Guard Brigades | infantry | `%d. határvadászdandár` |
| `HUN_MIL_01` | Ragged Guard | militia | `Rongyos Gárda %d. puskás zászlóalj` |
| `HUN_GUA_01` | Royal Guard Divisions | infantry, cavalry, light_armor, medium_armor, heavy_armor, modern_armor | `%d. királyi gárdahadosztály` |
| `HUN_FAS_01` | Hungarist Divisions | infantry, motorized | `%d. hungarista hadosztály` |
| `HUN_RED_01` | Red Army Divisions | infantry, motorized | `%d. vörös hadosztály` |
| `HUN_MIL_02` | Workers' Battalions | militia | `%d. munkászászlóalj` |
| `HUN_DEM_01` | 1848 Honvéd Divisions | infantry, cavalry | `%d. honvédhadosztály` |
| `HUN_DEM_02` | National Guard Divisions | infantry, militia | `%d. nemzetőr hadosztály` |

> **Note:** Vanilla's HUN lists are open to Austria and Czechoslovakia in `for_countries`, and a redefinition cannot remove a tag from it. The INEX groups on vanilla tags therefore keep vanilla's gate (`tag = HUN` or the `HUN_EMPIRE` cosmetic tag of Austria-Hungary), so neither country gets the Hungarian lists. The new INEX groups are for Hungary alone.

---

## Group Details

### Field army

### `HUN_INF_01` — Infantry Divisions
Overrides vanilla HUN_INF_01 (the group the vanilla focuses give their infantry templates) as the plain variant. Vanilla's numbered entries already read as the fallback; number 27 is written over to replace vanilla's misspelt *'Szekel'* nickname. Shares numbering with HUN_INF_02 and HUN_GAR_01, as in vanilla.

### `HUN_INF_02` — Infantry Brigades
Overrides vanilla HUN_INF_02, the group of the starting infantry templates: the 27 infantry brigades of 1938-1942 with their seats as in the order of battle of April 1941 (*1. gyalogdandár (Budapest)*, *14. gyalogdandár (Szeged)*, *27. gyalogdandár (Marosvásárhely)*). Vanilla typed the group `cavalry`; that type cannot be removed from the merged group, so `infantry` is added.

### `HUN_INF_03` — Infantry Divisions (Named)
Shares numbering with HUN_INF_01. Each division takes the seat of its brigade in the form of the attested *27. (székely) könnyű hadosztály*: *1. (budapesti)*, *5. (győri)*, *17. (debreceni)*, *25. (nagyváradi) gyaloghadosztály*, and number 27 keeps the Székely title. Numbers 28-40 extend the pattern with regions and counties (*(felvidéki)*, *(erdélyi)*, *(kárpátaljai)*, *(palóc)*).

### Motorized, mechanized and armour

### `HUN_MOT_01` — Motorized Divisions
Overrides vanilla HUN_MOT_01 (the focus template *Gyorshadtest*) as the plain variant and anchors the mobile family. The Honvédség called its motorized troops *gépkocsizó* (*1. gépkocsizó dandár*), not vanilla's *Motorizált*.

### `HUN_MEC_01` — Mechanized Divisions
Overrides vanilla HUN_MEC_01 as the plain variant; shares numbering with HUN_MOT_01. Hungary fielded no mechanized division; the list uses the later Hungarian term *gépesített lövészhadosztály* in place of vanilla's *Páncélgránátos*.

### `HUN_MOT_02` — Motorized Divisions (Named)
Rivers of the Carpathian Basin: *'Duna'*, *'Tisza'*, *'Dráva'*, *'Maros'*, *'Latorca'*. Shares numbering with HUN_MOT_01.

### `HUN_MEC_02` — Mechanized Divisions (Named)
Battles and sieges from *'Nándorfehérvár'* (1456) and *'Szigetvár'* to the honvéd battles of 1914-1917 (*'Limanowa'*, *'Uzsok'*, *'Doberdó'*). Shares numbering with HUN_MOT_01.

### `HUN_ARM_01` — Armored Divisions
Overrides vanilla HUN_ARM_01 as the plain variant.

### `HUN_ARM_02` — Armored Divisions (Named)
The army's own vehicle names (*'Toldi'*, *'Turán'*, *'Zrínyi'*, *'Nimród'*, *'Csaba'*, *'Tas'*, *'Botond'*, *'Gidrán'*), then the captains of the border fortresses against the Ottomans (*'Dobó István'*, *'Jurisics Miklós'*, *'Szondi György'*). Shares numbering with HUN_ARM_01.

### Cavalry

### `HUN_CAV_01` — Cavalry Divisions
Overrides vanilla HUN_CAV_01 (the starting cavalry templates and the focus template *Magyar Királyi Huszárok*) as the plain variant, after the *1. honvéd lovashadosztály* of 1944; vanilla's *Huszár Dandár* is written over.

### `HUN_CAV_02` — Cavalry Divisions (Named)
Hussar generals and the patrons of the old hussar regiments: *'Hadik András'*, *'Nádasdy Ferenc'*, *'Simonyi József'*, *'Vak Bottyán'*, *'Bercsényi László'*. Shares numbering with HUN_CAV_01.

### Specialist troops

### `HUN_MTN_01` — Mountain Brigades
Overrides vanilla HUN_MTN_01 (the focus template *Székel Command Group*) as the plain variant, after the *1. hegyidandár* of Szolyva and Munkács.

### `HUN_MTN_02` — Mountain Brigades (Named)
The Verecke Pass of the Conquest, the Carpathian peaks (*'Hoverla'*, *'Pop Iván'*, *'Retyezát'*, *'Tátra'*), the Hungarian highlands (*'Kékes'*, *'Mátra'*, *'Bakony'*) and the Székely seats (*'Csíkszék'*, *'Háromszék'*). Shares numbering with HUN_MTN_01.

### `HUN_MAR_01` — River Force Brigades
Overrides vanilla HUN_MAR_01 as the plain variant. Hungary had no marines: its river forces (*Magyar Királyi Folyamőrség*, from 1939 the *Honvéd Folyamerők*) patrolled the Danube from Budapest.

### `HUN_MAR_02` — River Force Brigades (Named)
After the patrol boats *'Sopron'* and *'Siófok'*, then Danube and Tisza towns in the river forces' town-name tradition (*'Komárom'*, *'Esztergom'*, *'Mohács'*, *'Tokaj'*). Shares numbering with HUN_MAR_01.

### `HUN_PAR_01` — Paratrooper Divisions
Overrides vanilla HUN_PAR_01. Number 1 keeps vanilla's *Szent László hadosztály* of 1944; the other numbers write over vanilla's misspelt *Ejtöernyös*. Hungary's paratroopers were the *1. ejtőernyős zászlóalj* of Pápa.

### Garrisons and territorial defence

### `HUN_GAR_01` — Garrison Divisions
Overrides vanilla HUN_GAR_01; shares numbering with the infantry, as in vanilla. Vanilla's field replacement divisions (*tábori póthadosztály*) stay, and the occupation light divisions of 1941-1943 take their own numbers (*102.*, *105.*, *108.*, *121.*, *124.*, *201. könnyű hadosztály*).

### `HUN_GAR_02` — Border Guard Brigades
The border hunters (*határvadász*) of 1939-1944: the *8. határvadászdandár (Munkács)*, the *9. határvadászdandár (Gyergyószentmiklós)* and the *Székely Határvédelmi Erők*.

### `HUN_MIL_01` — Ragged Guard
Overrides vanilla HUN_MIL_01 (the focus templates *Rongyos Gárda*). Vanilla's places of the 1921 Western Hungary rising and the lost cities (*'Ágfalva'*, *'Felsőőr'*, *'Kassa'*, *'Pozsony'*) are kept with *Pécs* spelt right; the fallback follows the nineteen rifle battalions (*puskás zászlóalj*) of 1938.

### Ideology suites

### `HUN_GUA_01` — Royal Guard Divisions (neutrality)
For the regency and the Habsburg restoration: guard divisions after the kings of Hungary and the Holy Crown (*'Szent István'*, *'Nagy Lajos'*, *'Mátyás király'*, *'IV. Károly'*, *'Szent Korona'*), and the royal guards themselves, from the Noble Guard of 1760 to the *Magyar Királyi Testőrség* and *Koronaőrség* of 1920-1945, and King Matthias's *Fekete sereg*.

### `HUN_FAS_01` — Hungarist Divisions (fascism)
The Conquest chieftains and legends the Hungarist movement claimed (*'Árpád'*, *'Előd'*, *'Lehel'*, *'Turul'*), then the lands of Szálasi's Hungarist plan (*'Magyarföld'*, *'Erdélyföld'*, *'Ruténföld'*). No formation of 1944-1945 is used, and the Hungarian Waffen-SS divisions stay in the German SS list.

### `HUN_RED_01` — Red Army Divisions (communism)
The Hungarian Red Army of 1919 on its own numbers (*1. budapesti*, *4. győri*, *6. szegedi*, *9. vasas hadosztály*), Red divisions after the patrons the People's Republic honoured (*'Dózsa György'*, *'Táncsics Mihály'*, *'Landler Jenő'*, *'Zalka Máté'*), and the *Ruszin Vörös Gárdahadosztály*, *Felvidéki Vörös Ezred* and *Budai Önkéntes Ezred* of 1945. Party leaders are not used as patrons.

### `HUN_MIL_02` — Workers' Battalions (communism)
Overrides vanilla HUN_MIL_02 (the focus template *Lenin-fiúk*). Vanilla's entries were the Lenin Boys executed in 1919 for the Red Terror killings; they are written over with workers' battalions (*munkászászlóalj*) after the factory districts and mining towns (*'Csepel'*, *'Angyalföld'*, *'Diósgyőr'*, *'Salgótarján'*).

### `HUN_DEM_01` — 1848 Honvéd Divisions (democratic)
The honvéd army of the 1848-1849 War of Independence: divisions after Kossuth, Petőfi and Batthyány, the corps commanders (*'Bem József'*, *'Görgei Artúr'*, *'Klapka György'*), the 13 Martyrs of Arad, and the red-capped battalions (*'Vörössipkások'*).

### `HUN_DEM_02` — National Guard Divisions (democratic)
The National Guard (*Nemzetőrség*) of 1956 by its insurgent groups and commanders (*'Corvin köz'*, *'Széna tér'*, *'Maléter Pál'*, *'Király Béla'*), and the mobile national guard camps of 1848 (*'Pápa'*, *'Vác'*, *'Arad'*).
````

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader` on all authored names (Hungarian), 2026-10-25. Findings and what was done:
- *folyamerő dandár* "reads as an invention; use folyamőr": kept. *Honvéd Folyamerők* is the attested name of the river forces from 1939 (Parádi 2019; en.wikipedia) and *folyamerő dandár* stands in the 1940 hu.wikipedia listing; *folyamőr* was the 1921-1938 river guard.
- *Kolossváry Dezső* fits a 1930s-40s cavalry division poorly (Dualist-era honvéd general); name form correct: kept as an extrapolation, listed under "Author confirmation".
- *Tersztyánszky Károly*, *Splényi Gábor*, *Nádasdy Ferenc*: confirmed.
- *Ruszin Vörös Gárdahadosztály* capitalisation: kept, the form of the 1919 decree as the source gives it.
- *Fekete sereg* "should be Fekete Sereg": kept, the standard Hungarian form (hu.wikipedia title).
- Unsure: *Ruténföld*, *Magyarföld*: kept, both named in the Ludovika study of the Hungarist plan (dossier).
- Unsure: *Vörössipkások* vs *veressipkások*: kept *Vörössipkások*, the usual modern spelling (the proofreader leans the same way; *veressipkás* is the older form).
No change to the batch.

## Outcome
<!-- TODO(implementer): date, group and name counts from -Check, deviations from this plan with the reason -->

## Edit batch
Applied by `build.ps1 -EditNames HUN -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{"newFile": true, "header": "Division template historical names system for Hungary (HUN).\nImmersive Namelists Expanded (INEX)\nHungarian names as the Royal Hungarian Honvédség wrote them: Arabic ordinal with a full stop, unit nouns in lower case (1. gyaloghadosztály, 2. gépkocsizó dandár), a regional title in lower case in parentheses (27. (székely) könnyű hadosztály). Nicknames stand in straight single quotes.\nOverrides the vanilla HUN_INF_01, HUN_INF_02, HUN_CAV_01, HUN_MOT_01, HUN_MEC_01, HUN_ARM_01, HUN_GAR_01, HUN_MAR_01, HUN_MTN_01, HUN_PAR_01, HUN_MIL_01 and HUN_MIL_02 groups; reused universal tags keep vanilla's gate (tag HUN or the HUN_EMPIRE cosmetic tag), because vanilla lists AUS and CZE in for_countries. HUN_MIL_03 and the AUSHUN groups stay vanilla."}
```

```json batch
{"addGroup": true, "group": "HUN_INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "%d. gyaloghadosztály", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "comment": "# ===== Field army =====\n\nOverrides vanilla HUN_INF_01 as the plain variant. Vanilla's other numbers read as the fallback; key 27 replaces vanilla's misspelt 'Szekel' nickname, which moves to HUN_INF_03.", "add": ["27=%d. gyaloghadosztály"]}
```

```json batch
{"addGroup": true, "group": "HUN_INF_02", "selector": "Infantry Brigades", "addType": "infantry", "fallback": "%d. gyalogdandár", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "link": "HUN_INF_01", "comment": "Overrides vanilla HUN_INF_02, the group of the starting infantry templates: the 27 infantry brigades of 1938-1942 with their seats (April 1941 order of battle). Vanilla's cavalry type stays in the merged group; infantry is added.", "add": ["# Infantry brigades, 1938-1942", "1=%d. gyalogdandár (Budapest)", "2=%d. gyalogdandár (Budapest)", "3=%d. gyalogdandár (Budapest)", "4=%d. gyalogdandár (Székesfehérvár)", "5=%d. gyalogdandár (Győr)", "6=%d. gyalogdandár (Komárom)", "7=%d. gyalogdandár (Sopron)", "8=%d. gyalogdandár (Szombathely)", "9=%d. gyalogdandár (Nagykanizsa)", "10=%d. gyalogdandár (Kaposvár)", "11=%d. gyalogdandár (Pécs)", "12=%d. gyalogdandár (Szekszárd)", "13=%d. gyalogdandár (Kecskemét)", "14=%d. gyalogdandár (Szeged)", "15=%d. gyalogdandár (Kiskunhalas)", "16=%d. gyalogdandár (Szolnok)", "17=%d. gyalogdandár (Debrecen)", "18=%d. gyalogdandár (Békéscsaba)", "19=%d. gyalogdandár (Miskolc)", "20=%d. gyalogdandár (Eger)", "21=%d. gyalogdandár (Losonc)", "22=%d. gyalogdandár (Nyíregyháza)", "23=%d. gyalogdandár (Kassa)", "24=%d. gyalogdandár (Ungvár)", "25=%d. gyalogdandár (Nagyvárad)", "26=%d. gyalogdandár (Dés)", "27=%d. gyalogdandár (Marosvásárhely)", "# Security brigades of 1941", "102=%d. gyalogdandár", "105=%d. gyalogdandár", "108=%d. gyalogdandár", "124=%d. gyalogdandár"]}
```

```json batch
{"addGroup": true, "group": "HUN_INF_03", "selector": "Infantry Divisions (Named)", "addType": "infantry", "fallback": "%d. gyaloghadosztály", "canUse": "always = yes", "link": "HUN_INF_01", "comment": "Shares numbering with HUN_INF_01. The seat of each brigade and light division in the regional form of the attested 27. (székely) könnyű hadosztály; keys 28-40 extend it with regions and counties.", "add": ["# Division seats, 1941", "1=%d. (budapesti) gyaloghadosztály", "2=%d. (budapesti) gyaloghadosztály", "3=%d. (budapesti) gyaloghadosztály", "4=%d. (székesfehérvári) gyaloghadosztály", "5=%d. (győri) gyaloghadosztály", "6=%d. (komáromi) gyaloghadosztály", "7=%d. (soproni) gyaloghadosztály", "8=%d. (szombathelyi) gyaloghadosztály", "9=%d. (nagykanizsai) gyaloghadosztály", "10=%d. (kaposvári) gyaloghadosztály", "11=%d. (pécsi) gyaloghadosztály", "12=%d. (szekszárdi) gyaloghadosztály", "13=%d. (kecskeméti) gyaloghadosztály", "14=%d. (szegedi) gyaloghadosztály", "15=%d. (kiskunhalasi) gyaloghadosztály", "16=%d. (szolnoki) gyaloghadosztály", "17=%d. (debreceni) gyaloghadosztály", "18=%d. (békéscsabai) gyaloghadosztály", "19=%d. (miskolci) gyaloghadosztály", "20=%d. (egri) gyaloghadosztály", "21=%d. (losonci) gyaloghadosztály", "22=%d. (nyíregyházi) gyaloghadosztály", "23=%d. (kassai) gyaloghadosztály", "24=%d. (ungvári) gyaloghadosztály", "25=%d. (nagyváradi) gyaloghadosztály", "26=%d. (dési) gyaloghadosztály", "27=%d. (székely) gyaloghadosztály", "# Regions and counties", "28=%d. (felvidéki) gyaloghadosztály", "29=%d. (erdélyi) gyaloghadosztály", "30=%d. (kárpátaljai) gyaloghadosztály", "31=%d. (dunántúli) gyaloghadosztály", "32=%d. (alföldi) gyaloghadosztály", "33=%d. (tiszántúli) gyaloghadosztály", "34=%d. (jászkun) gyaloghadosztály", "35=%d. (hajdú) gyaloghadosztály", "36=%d. (palóc) gyaloghadosztály", "37=%d. (kolozsvári) gyaloghadosztály", "38=%d. (szatmári) gyaloghadosztály", "39=%d. (zalai) gyaloghadosztály", "40=%d. (somogyi) gyaloghadosztály"]}
```

```json batch
{"addGroup": true, "group": "HUN_MOT_01", "selector": "Motorized Divisions", "addType": "motorized", "fallback": "%d. gépkocsizó hadosztály", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "comment": "# ===== Motorized, mechanized and armor =====\n\nOverrides vanilla HUN_MOT_01 as the plain variant and anchors the mobile family. The Honvédség called motorized troops gépkocsizó (1. and 2. gépkocsizó dandár); vanilla's 34 'Motorizált Dandár' numbers are written over.", "add": ["1=%d. gépkocsizó hadosztály", "2=%d. gépkocsizó hadosztály", "3=%d. gépkocsizó hadosztály", "4=%d. gépkocsizó hadosztály", "5=%d. gépkocsizó hadosztály", "6=%d. gépkocsizó hadosztály", "7=%d. gépkocsizó hadosztály", "8=%d. gépkocsizó hadosztály", "9=%d. gépkocsizó hadosztály", "10=%d. gépkocsizó hadosztály", "12=%d. gépkocsizó hadosztály", "13=%d. gépkocsizó hadosztály", "16=%d. gépkocsizó hadosztály", "20=%d. gépkocsizó hadosztály", "24=%d. gépkocsizó hadosztály", "25=%d. gépkocsizó hadosztály", "26=%d. gépkocsizó hadosztály", "27=%d. gépkocsizó hadosztály", "28=%d. gépkocsizó hadosztály", "29=%d. gépkocsizó hadosztály", "30=%d. gépkocsizó hadosztály", "31=%d. gépkocsizó hadosztály", "32=%d. gépkocsizó hadosztály", "33=%d. gépkocsizó hadosztály", "34=%d. gépkocsizó hadosztály", "35=%d. gépkocsizó hadosztály", "36=%d. gépkocsizó hadosztály", "37=%d. gépkocsizó hadosztály", "38=%d. gépkocsizó hadosztály", "39=%d. gépkocsizó hadosztály", "40=%d. gépkocsizó hadosztály", "41=%d. gépkocsizó hadosztály", "42=%d. gépkocsizó hadosztály", "43=%d. gépkocsizó hadosztály"]}
```

```json batch
{"addGroup": true, "group": "HUN_MEC_01", "selector": "Mechanized Divisions", "addType": "mechanized", "fallback": "%d. gépesített lövészhadosztály", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "link": "HUN_MOT_01", "comment": "Overrides vanilla HUN_MEC_01 as the plain variant; shares numbering with HUN_MOT_01. Hungary fielded no mechanized division; the term is the later Hungarian gépesített lövészhadosztály, written over vanilla's 33 'Páncélgránátos' numbers.", "add": ["1=%d. gépesített lövészhadosztály", "2=%d. gépesített lövészhadosztály", "3=%d. gépesített lövészhadosztály", "4=%d. gépesített lövészhadosztály", "5=%d. gépesített lövészhadosztály", "6=%d. gépesített lövészhadosztály", "7=%d. gépesített lövészhadosztály", "8=%d. gépesített lövészhadosztály", "9=%d. gépesített lövészhadosztály", "10=%d. gépesített lövészhadosztály", "11=%d. gépesített lövészhadosztály", "12=%d. gépesített lövészhadosztály", "13=%d. gépesített lövészhadosztály", "14=%d. gépesített lövészhadosztály", "15=%d. gépesített lövészhadosztály", "16=%d. gépesített lövészhadosztály", "17=%d. gépesített lövészhadosztály", "18=%d. gépesített lövészhadosztály", "19=%d. gépesített lövészhadosztály", "20=%d. gépesített lövészhadosztály", "21=%d. gépesített lövészhadosztály", "22=%d. gépesített lövészhadosztály", "23=%d. gépesített lövészhadosztály", "24=%d. gépesített lövészhadosztály", "25=%d. gépesített lövészhadosztály", "26=%d. gépesített lövészhadosztály", "27=%d. gépesített lövészhadosztály", "28=%d. gépesített lövészhadosztály", "29=%d. gépesített lövészhadosztály", "30=%d. gépesített lövészhadosztály", "31=%d. gépesített lövészhadosztály", "32=%d. gépesített lövészhadosztály", "33=%d. gépesített lövészhadosztály"]}
```

```json batch
{"addGroup": true, "group": "HUN_MOT_02", "selector": "Motorized Divisions (Named)", "addType": "motorized", "fallback": "%d. gépkocsizó hadosztály", "canUse": "always = yes", "link": "HUN_MOT_01", "comment": "Rivers of the Carpathian Basin. Shares numbering with HUN_MOT_01.", "add": ["1=%d. gépkocsizó hadosztály 'Duna'", "2=%d. gépkocsizó hadosztály 'Tisza'", "3=%d. gépkocsizó hadosztály 'Dráva'", "4=%d. gépkocsizó hadosztály 'Rába'", "5=%d. gépkocsizó hadosztály 'Maros'", "6=%d. gépkocsizó hadosztály 'Szamos'", "7=%d. gépkocsizó hadosztály 'Körös'", "8=%d. gépkocsizó hadosztály 'Bodrog'", "9=%d. gépkocsizó hadosztály 'Hernád'", "10=%d. gépkocsizó hadosztály 'Sajó'", "11=%d. gépkocsizó hadosztály 'Ipoly'", "12=%d. gépkocsizó hadosztály 'Garam'", "13=%d. gépkocsizó hadosztály 'Vág'", "14=%d. gépkocsizó hadosztály 'Zagyva'", "15=%d. gépkocsizó hadosztály 'Berettyó'", "16=%d. gépkocsizó hadosztály 'Sió'", "17=%d. gépkocsizó hadosztály 'Kapos'", "18=%d. gépkocsizó hadosztály 'Lajta'", "19=%d. gépkocsizó hadosztály 'Latorca'", "20=%d. gépkocsizó hadosztály 'Nyárád'"]}
```

```json batch
{"addGroup": true, "group": "HUN_MEC_02", "selector": "Mechanized Divisions (Named)", "addType": "mechanized", "fallback": "%d. gépesített lövészhadosztály", "canUse": "always = yes", "link": "HUN_MOT_01", "comment": "Battles and sieges, from Nándorfehérvár (1456) to the honvéd battles of 1914-1917. Shares numbering with HUN_MOT_01.", "add": ["1=%d. gépesített lövészhadosztály 'Nándorfehérvár'", "2=%d. gépesített lövészhadosztály 'Rozgony'", "3=%d. gépesített lövészhadosztály 'Kenyérmező'", "4=%d. gépesített lövészhadosztály 'Eger'", "5=%d. gépesített lövészhadosztály 'Kőszeg'", "6=%d. gépesített lövészhadosztály 'Szigetvár'", "7=%d. gépesített lövészhadosztály 'Drégely'", "8=%d. gépesített lövészhadosztály 'Szentgotthárd'", "9=%d. gépesített lövészhadosztály 'Zenta'", "10=%d. gépesített lövészhadosztály 'Limanowa'", "11=%d. gépesített lövészhadosztály 'Gorlice'", "12=%d. gépesített lövészhadosztály 'Uzsok'", "13=%d. gépesített lövészhadosztály 'Przemyśl'", "14=%d. gépesített lövészhadosztály 'Isonzó'", "15=%d. gépesített lövészhadosztály 'Doberdó'"]}
```

```json batch
{"addGroup": true, "group": "HUN_ARM_01", "selector": "Armored Divisions", "addType": "light_armor; medium_armor; heavy_armor; modern_armor", "fallback": "%d. páncéloshadosztály", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "comment": "Overrides vanilla HUN_ARM_01 as the plain variant; vanilla's 33 capitalised numbers are written over.", "add": ["1=%d. páncéloshadosztály", "2=%d. páncéloshadosztály", "3=%d. páncéloshadosztály", "4=%d. páncéloshadosztály", "5=%d. páncéloshadosztály", "6=%d. páncéloshadosztály", "7=%d. páncéloshadosztály", "8=%d. páncéloshadosztály", "9=%d. páncéloshadosztály", "10=%d. páncéloshadosztály", "11=%d. páncéloshadosztály", "12=%d. páncéloshadosztály", "13=%d. páncéloshadosztály", "14=%d. páncéloshadosztály", "15=%d. páncéloshadosztály", "16=%d. páncéloshadosztály", "17=%d. páncéloshadosztály", "18=%d. páncéloshadosztály", "19=%d. páncéloshadosztály", "20=%d. páncéloshadosztály", "21=%d. páncéloshadosztály", "22=%d. páncéloshadosztály", "23=%d. páncéloshadosztály", "24=%d. páncéloshadosztály", "25=%d. páncéloshadosztály", "26=%d. páncéloshadosztály", "27=%d. páncéloshadosztály", "28=%d. páncéloshadosztály", "29=%d. páncéloshadosztály", "30=%d. páncéloshadosztály", "31=%d. páncéloshadosztály", "32=%d. páncéloshadosztály", "33=%d. páncéloshadosztály"]}
```

```json batch
{"addGroup": true, "group": "HUN_ARM_02", "selector": "Armored Divisions (Named)", "addType": "light_armor; medium_armor; heavy_armor; modern_armor", "fallback": "%d. páncéloshadosztály", "canUse": "always = yes", "link": "HUN_ARM_01", "comment": "The names of Hungarian armored vehicles (Toldi, Turán, Zrínyi, Nimród, Csaba, Tas), then the captains of the border fortresses against the Ottomans. Shares numbering with HUN_ARM_01.", "add": ["1=%d. páncéloshadosztály 'Toldi'", "2=%d. páncéloshadosztály 'Turán'", "3=%d. páncéloshadosztály 'Zrínyi'", "4=%d. páncéloshadosztály 'Nimród'", "5=%d. páncéloshadosztály 'Csaba'", "6=%d. páncéloshadosztály 'Tas'", "7=%d. páncéloshadosztály 'Botond'", "8=%d. páncéloshadosztály 'Gidrán'", "9=%d. páncéloshadosztály 'Dobó István'", "10=%d. páncéloshadosztály 'Jurisics Miklós'", "11=%d. páncéloshadosztály 'Szondi György'", "12=%d. páncéloshadosztály 'Losonczy István'", "13=%d. páncéloshadosztály 'Kinizsi Pál'", "14=%d. páncéloshadosztály 'Thury György'", "15=%d. páncéloshadosztály 'Bornemissza Gergely'", "16=%d. páncéloshadosztály 'Mekcsey István'", "17=%d. páncéloshadosztály 'Balassi Bálint'"]}
```

```json batch
{"addGroup": true, "group": "HUN_CAV_01", "selector": "Cavalry Divisions", "addType": "cavalry", "fallback": "%d. lovashadosztály", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "comment": "# ===== Cavalry =====\n\nOverrides vanilla HUN_CAV_01 (the starting cavalry templates and the focus template 'Magyar Királyi Huszárok') as the plain variant: the 1944 division was the 1. honvéd lovashadosztály. Vanilla's 53 'Huszár Dandár' numbers are written over.", "add": ["1=%d. lovashadosztály", "2=%d. lovashadosztály", "3=%d. lovashadosztály", "4=%d. lovashadosztály", "5=%d. lovashadosztály", "6=%d. lovashadosztály", "7=%d. lovashadosztály", "8=%d. lovashadosztály", "9=%d. lovashadosztály", "10=%d. lovashadosztály", "11=%d. lovashadosztály", "12=%d. lovashadosztály", "13=%d. lovashadosztály", "14=%d. lovashadosztály", "15=%d. lovashadosztály", "16=%d. lovashadosztály", "17=%d. lovashadosztály", "18=%d. lovashadosztály", "19=%d. lovashadosztály", "20=%d. lovashadosztály", "21=%d. lovashadosztály", "22=%d. lovashadosztály", "23=%d. lovashadosztály", "24=%d. lovashadosztály", "25=%d. lovashadosztály", "26=%d. lovashadosztály", "27=%d. lovashadosztály", "28=%d. lovashadosztály", "29=%d. lovashadosztály", "30=%d. lovashadosztály", "31=%d. lovashadosztály", "32=%d. lovashadosztály", "33=%d. lovashadosztály", "34=%d. lovashadosztály", "35=%d. lovashadosztály", "36=%d. lovashadosztály", "37=%d. lovashadosztály", "38=%d. lovashadosztály", "39=%d. lovashadosztály", "40=%d. lovashadosztály", "41=%d. lovashadosztály", "42=%d. lovashadosztály", "43=%d. lovashadosztály", "44=%d. lovashadosztály", "45=%d. lovashadosztály", "46=%d. lovashadosztály", "47=%d. lovashadosztály", "48=%d. lovashadosztály", "49=%d. lovashadosztály", "50=%d. lovashadosztály", "51=%d. lovashadosztály", "52=%d. lovashadosztály", "53=%d. lovashadosztály"]}
```

```json batch
{"addGroup": true, "group": "HUN_CAV_02", "selector": "Cavalry Divisions (Named)", "addType": "cavalry", "fallback": "%d. lovashadosztály", "canUse": "always = yes", "link": "HUN_CAV_01", "comment": "Hussar generals and the patrons of the old hussar regiments. Shares numbering with HUN_CAV_01.", "add": ["1=%d. lovashadosztály 'Hadik András'", "2=%d. lovashadosztály 'Nádasdy Ferenc'", "3=%d. lovashadosztály 'Simonyi József'", "4=%d. lovashadosztály 'Vak Bottyán'", "5=%d. lovashadosztály 'Bercsényi László'", "6=%d. lovashadosztály 'Pálffy János'", "7=%d. lovashadosztály 'Tersztyánszky Károly'", "8=%d. lovashadosztály 'Splényi Gábor'", "9=%d. lovashadosztály 'Kolossváry Dezső'"]}
```

```json batch
{"addGroup": true, "group": "HUN_MTN_01", "selector": "Mountain Brigades", "addType": "mountaineers", "fallback": "%d. hegyidandár", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "comment": "# ===== Specialist troops =====\n\nOverrides vanilla HUN_MTN_01 (the focus template 'Székel Command Group') as the plain variant, after the 1. hegyidandár of Szolyva and Munkács; vanilla's 53 capitalised numbers are written over.", "add": ["1=%d. hegyidandár", "2=%d. hegyidandár", "3=%d. hegyidandár", "4=%d. hegyidandár", "5=%d. hegyidandár", "6=%d. hegyidandár", "7=%d. hegyidandár", "8=%d. hegyidandár", "9=%d. hegyidandár", "10=%d. hegyidandár", "11=%d. hegyidandár", "12=%d. hegyidandár", "13=%d. hegyidandár", "14=%d. hegyidandár", "15=%d. hegyidandár", "16=%d. hegyidandár", "17=%d. hegyidandár", "18=%d. hegyidandár", "19=%d. hegyidandár", "20=%d. hegyidandár", "21=%d. hegyidandár", "22=%d. hegyidandár", "23=%d. hegyidandár", "24=%d. hegyidandár", "25=%d. hegyidandár", "26=%d. hegyidandár", "27=%d. hegyidandár", "28=%d. hegyidandár", "29=%d. hegyidandár", "30=%d. hegyidandár", "31=%d. hegyidandár", "32=%d. hegyidandár", "33=%d. hegyidandár", "34=%d. hegyidandár", "35=%d. hegyidandár", "36=%d. hegyidandár", "37=%d. hegyidandár", "38=%d. hegyidandár", "39=%d. hegyidandár", "40=%d. hegyidandár", "41=%d. hegyidandár", "42=%d. hegyidandár", "43=%d. hegyidandár", "44=%d. hegyidandár", "45=%d. hegyidandár", "46=%d. hegyidandár", "47=%d. hegyidandár", "48=%d. hegyidandár", "49=%d. hegyidandár", "50=%d. hegyidandár", "51=%d. hegyidandár", "52=%d. hegyidandár", "53=%d. hegyidandár"]}
```

```json batch
{"addGroup": true, "group": "HUN_MTN_02", "selector": "Mountain Brigades (Named)", "addType": "mountaineers", "fallback": "%d. hegyidandár", "canUse": "always = yes", "link": "HUN_MTN_01", "comment": "The Verecke Pass, the peaks of the Carpathians and the Hungarian highlands, and the Székely seats (székek). Shares numbering with HUN_MTN_01.", "add": ["1=%d. hegyidandár 'Verecke'", "2=%d. hegyidandár 'Hoverla'", "3=%d. hegyidandár 'Pop Iván'", "4=%d. hegyidandár 'Gutin'", "5=%d. hegyidandár 'Pietrosz'", "6=%d. hegyidandár 'Kelemen'", "7=%d. hegyidandár 'Hargita'", "8=%d. hegyidandár 'Retyezát'", "9=%d. hegyidandár 'Tátra'", "10=%d. hegyidandár 'Kriván'", "11=%d. hegyidandár 'Kékes'", "12=%d. hegyidandár 'Mátra'", "13=%d. hegyidandár 'Bükk'", "14=%d. hegyidandár 'Bakony'", "15=%d. hegyidandár 'Börzsöny'", "16=%d. hegyidandár 'Mecsek'", "17=%d. hegyidandár 'Pilis'", "18=%d. hegyidandár 'Csíkszék'", "19=%d. hegyidandár 'Gyergyószék'", "20=%d. hegyidandár 'Udvarhelyszék'", "21=%d. hegyidandár 'Marosszék'", "22=%d. hegyidandár 'Háromszék'", "23=%d. hegyidandár 'Aranyosszék'", "24=%d. hegyidandár 'Kászonszék'"]}
```

```json batch
{"addGroup": true, "group": "HUN_MAR_01", "selector": "River Force Brigades", "addType": "marine", "fallback": "%d. folyamerő dandár", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "comment": "Overrides vanilla HUN_MAR_01 as the plain variant. Hungary had no marines; its river forces (Magyar Királyi Folyamőrség, from 1939 Honvéd Folyamerők) patrolled the Danube. Vanilla's 30 'Folyamdandár' numbers are written over.", "add": ["1=%d. folyamerő dandár", "2=%d. folyamerő dandár", "3=%d. folyamerő dandár", "4=%d. folyamerő dandár", "5=%d. folyamerő dandár", "6=%d. folyamerő dandár", "7=%d. folyamerő dandár", "8=%d. folyamerő dandár", "9=%d. folyamerő dandár", "10=%d. folyamerő dandár", "11=%d. folyamerő dandár", "12=%d. folyamerő dandár", "13=%d. folyamerő dandár", "14=%d. folyamerő dandár", "15=%d. folyamerő dandár", "16=%d. folyamerő dandár", "17=%d. folyamerő dandár", "18=%d. folyamerő dandár", "19=%d. folyamerő dandár", "20=%d. folyamerő dandár", "21=%d. folyamerő dandár", "22=%d. folyamerő dandár", "23=%d. folyamerő dandár", "24=%d. folyamerő dandár", "25=%d. folyamerő dandár", "26=%d. folyamerő dandár", "27=%d. folyamerő dandár", "28=%d. folyamerő dandár", "29=%d. folyamerő dandár", "30=%d. folyamerő dandár"]}
```

```json batch
{"addGroup": true, "group": "HUN_MAR_02", "selector": "River Force Brigades (Named)", "addType": "marine", "fallback": "%d. folyamerő dandár", "canUse": "always = yes", "link": "HUN_MAR_01", "comment": "After the patrol boats Sopron and Siófok, then further Danube and Tisza towns in the river forces' town-name tradition. Shares numbering with HUN_MAR_01.", "add": ["1=%d. folyamerő dandár 'Sopron'", "2=%d. folyamerő dandár 'Siófok'", "3=%d. folyamerő dandár 'Komárom'", "4=%d. folyamerő dandár 'Esztergom'", "5=%d. folyamerő dandár 'Szentendre'", "6=%d. folyamerő dandár 'Dunaföldvár'", "7=%d. folyamerő dandár 'Paks'", "8=%d. folyamerő dandár 'Baja'", "9=%d. folyamerő dandár 'Mohács'", "10=%d. folyamerő dandár 'Csongrád'", "11=%d. folyamerő dandár 'Tokaj'"]}
```

```json batch
{"addGroup": true, "group": "HUN_PAR_01", "selector": "Paratrooper Divisions", "addType": "paratrooper", "fallback": "%d. ejtőernyős hadosztály", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "comment": "Overrides vanilla HUN_PAR_01. Key 1 keeps vanilla's Szent László division (October 1944); the other numbers write over vanilla's misspelt 'Ejtöernyös'. Hungary's paratroopers were the 1. ejtőernyős zászlóalj of Pápa.", "add": ["1=Szent László hadosztály", "2=%d. ejtőernyős hadosztály", "3=%d. ejtőernyős hadosztály", "4=%d. ejtőernyős hadosztály", "5=%d. ejtőernyős hadosztály", "6=%d. ejtőernyős hadosztály", "7=%d. ejtőernyős hadosztály", "8=%d. ejtőernyős hadosztály", "9=%d. ejtőernyős hadosztály", "10=%d. ejtőernyős hadosztály", "11=%d. ejtőernyős hadosztály", "12=%d. ejtőernyős hadosztály", "13=%d. ejtőernyős hadosztály", "14=%d. ejtőernyős hadosztály", "15=%d. ejtőernyős hadosztály", "16=%d. ejtőernyős hadosztály", "17=%d. ejtőernyős hadosztály", "18=%d. ejtőernyős hadosztály", "19=%d. ejtőernyős hadosztály", "20=%d. ejtőernyős hadosztály", "21=%d. ejtőernyős hadosztály", "22=%d. ejtőernyős hadosztály", "23=%d. ejtőernyős hadosztály", "24=%d. ejtőernyős hadosztály", "25=%d. ejtőernyős hadosztály", "26=%d. ejtőernyős hadosztály", "27=%d. ejtőernyős hadosztály", "28=%d. ejtőernyős hadosztály", "29=%d. ejtőernyős hadosztály", "30=%d. ejtőernyős hadosztály"]}
```

```json batch
{"addGroup": true, "group": "HUN_GAR_01", "selector": "Garrison Divisions", "addType": "infantry", "fallback": "%d. tábori póthadosztály", "canUse": "OR = { tag = HUN has_cosmetic_tag = HUN_EMPIRE }", "link": "HUN_INF_01", "comment": "# ===== Garrisons and territorial defence =====\n\nOverrides vanilla HUN_GAR_01; shares numbering with the infantry, as in vanilla. Vanilla's field replacement divisions (tábori póthadosztály) stay; the numbers of the occupation light divisions of 1941-1943 take their name.", "add": ["# Occupation light divisions", "102=%d. könnyű hadosztály", "105=%d. könnyű hadosztály", "108=%d. könnyű hadosztály", "121=%d. könnyű hadosztály", "124=%d. könnyű hadosztály", "201=%d. könnyű hadosztály"]}
```

```json batch
{"addGroup": true, "group": "HUN_GAR_02", "selector": "Border Guard Brigades", "addType": "infantry", "fallback": "%d. határvadászdandár", "canUse": "always = yes", "comment": "The border hunters (határvadász) of 1939-1944, with the Székely border defence forces.", "add": ["8=%d. határvadászdandár (Munkács)", "9=%d. határvadászdandár (Gyergyószentmiklós)", "101=Székely Határvédelmi Erők"]}
```

```json batch
{"addGroup": true, "group": "HUN_MIL_01", "selector": "Ragged Guard", "addType": "militia", "fallback": "Rongyos Gárda %d. puskás zászlóalj", "canUse": "always = yes", "comment": "Overrides vanilla HUN_MIL_01 (the focus templates 'Rongyos Gárda'). Vanilla's 17 place names are kept, with Pécs spelt right; the fallback follows the nineteen rifle battalions (puskás zászlóalj) of 1938.", "add": ["1=Rongyos Gárda 'Vas'", "2=Rongyos Gárda 'Moson'", "3=Rongyos Gárda 'Felsőőr'", "4=Rongyos Gárda 'Kismarton'", "5=Rongyos Gárda 'Ágfalva'", "6=Rongyos Gárda 'Győr'", "7=Rongyos Gárda 'Pécs'", "8=Rongyos Gárda 'Baja'", "9=Rongyos Gárda 'Szeged'", "10=Rongyos Gárda 'Csongrád'", "11=Rongyos Gárda 'Debrecen'", "12=Rongyos Gárda 'Kassa'", "13=Rongyos Gárda 'Újvidék'", "14=Rongyos Gárda 'Kolozsvár'", "15=Rongyos Gárda 'Ungvár'", "16=Rongyos Gárda 'Eperjes'", "17=Rongyos Gárda 'Pozsony'"]}
```

```json batch
{"addGroup": true, "group": "HUN_GUA_01", "selector": "Royal Guard Divisions", "addType": "infantry; cavalry; light_armor; medium_armor; heavy_armor; modern_armor", "fallback": "%d. királyi gárdahadosztály", "canUse": "has_government = neutrality", "comment": "# ===== Ideology suites =====\n\nRoyal Hungary (neutrality): guard divisions after the kings of Hungary and the Holy Crown, and the royal guards from the Noble Guard of 1760 to the Royal Guard and Crown Guard of 1920-1945.", "add": ["1=%d. királyi gárdahadosztály 'Szent István'", "2=%d. királyi gárdahadosztály 'Szent Imre'", "3=%d. királyi gárdahadosztály 'Könyves Kálmán'", "4=%d. királyi gárdahadosztály 'II. András'", "5=%d. királyi gárdahadosztály 'IV. Béla'", "6=%d. királyi gárdahadosztály 'Károly Róbert'", "7=%d. királyi gárdahadosztály 'Nagy Lajos'", "8=%d. királyi gárdahadosztály 'Luxemburgi Zsigmond'", "9=%d. királyi gárdahadosztály 'Mátyás király'", "10=%d. királyi gárdahadosztály 'Mária Terézia'", "11=%d. királyi gárdahadosztály 'Ferenc József'", "12=%d. királyi gárdahadosztály 'IV. Károly'", "13=%d. királyi gárdahadosztály 'Szent Korona'", "# Royal guards", "101=Magyar Királyi Testőrség", "102=Magyar Királyi Koronaőrség", "103=Magyar Királyi Nemesi Testőrség", "104=Magyar Királyi Darabont Testőrség", "105=Fekete sereg"]}
```

```json batch
{"addGroup": true, "group": "HUN_FAS_01", "selector": "Hungarist Divisions", "addType": "infantry; motorized", "fallback": "%d. hungarista hadosztály", "canUse": "has_government = fascism", "comment": "Hungarist Hungary (fascism): the Conquest chieftains and the legends the movement claimed (the Árpád stripes, the Turul), then the lands of Szálasi's Hungarist plan. No formation of 1944-1945 is used.", "add": ["1=%d. hungarista hadosztály 'Árpád'", "2=%d. hungarista hadosztály 'Álmos'", "3=%d. hungarista hadosztály 'Előd'", "4=%d. hungarista hadosztály 'Ond'", "5=%d. hungarista hadosztály 'Kond'", "6=%d. hungarista hadosztály 'Huba'", "7=%d. hungarista hadosztály 'Töhötöm'", "8=%d. hungarista hadosztály 'Lehel'", "9=%d. hungarista hadosztály 'Bulcsú'", "10=%d. hungarista hadosztály 'Kurszán'", "11=%d. hungarista hadosztály 'Taksony'", "12=%d. hungarista hadosztály 'Hunor'", "13=%d. hungarista hadosztály 'Magor'", "14=%d. hungarista hadosztály 'Attila'", "15=%d. hungarista hadosztály 'Turul'", "16=%d. hungarista hadosztály 'Magyarföld'", "17=%d. hungarista hadosztály 'Erdélyföld'", "18=%d. hungarista hadosztály 'Ruténföld'", "19=%d. hungarista hadosztály 'Horvát-Szlavónföld'"]}
```

```json batch
{"addGroup": true, "group": "HUN_RED_01", "selector": "Red Army Divisions", "addType": "infantry; motorized", "fallback": "%d. vörös hadosztály", "canUse": "has_government = communism", "comment": "Soviet Hungary (communism): the divisions of the Hungarian Red Army of 1919 on their numbers, Red divisions after the patrons the People's Republic honoured, and the Red Army's named units of 1919 and the Buda Volunteer Regiment of 1945.", "add": ["# Hungarian Red Army, 1919", "1=%d. budapesti hadosztály", "2=%d. budapesti hadosztály", "3=%d. budapesti hadosztály", "4=%d. győri hadosztály", "5=%d. nyíregyházi hadosztály", "6=%d. szegedi hadosztály", "9=%d. vasas hadosztály", "# Patrons", "10=%d. vörös hadosztály 'Dózsa György'", "11=%d. vörös hadosztály 'Martinovics Ignác'", "12=%d. vörös hadosztály 'Táncsics Mihály'", "13=%d. vörös hadosztály 'Landler Jenő'", "14=%d. vörös hadosztály 'Zalka Máté'", "15=%d. vörös hadosztály 'Ságvári Endre'", "16=%d. vörös hadosztály 'Sallai Imre'", "17=%d. vörös hadosztály 'Fürst Sándor'", "18=%d. vörös hadosztály 'Schönherz Zoltán'", "# Named units", "101=Ruszin Vörös Gárdahadosztály", "102=Felvidéki Vörös Ezred", "103=Vörösőr hadosztály", "104=Budai Önkéntes Ezred"]}
```

```json batch
{"addGroup": true, "group": "HUN_MIL_02", "selector": "Workers' Battalions", "addType": "militia", "fallback": "%d. munkászászlóalj", "canUse": "has_government = communism", "comment": "Overrides vanilla HUN_MIL_02 (the focus template 'Lenin-fiúk'). Vanilla's names were the Lenin Boys executed in 1919 for the Red Terror killings and are written over: the workers' battalions of 1919 by the factory districts and mining towns.", "add": ["1=%d. munkászászlóalj 'Csepel'", "2=%d. munkászászlóalj 'Angyalföld'", "3=%d. munkászászlóalj 'Újpest'", "4=%d. munkászászlóalj 'Kőbánya'", "5=%d. munkászászlóalj 'Ferencváros'", "6=%d. munkászászlóalj 'Kispest'", "7=%d. munkászászlóalj 'Óbuda'", "8=%d. munkászászlóalj 'Rákospalota'", "9=%d. munkászászlóalj 'Pesterzsébet'", "10=%d. munkászászlóalj 'Diósgyőr'", "11=%d. munkászászlóalj 'Ózd'", "12=%d. munkászászlóalj 'Salgótarján'", "13=%d. munkászászlóalj 'Tatabánya'", "14=%d. munkászászlóalj 'Dorog'", "15=%d. munkászászlóalj 'Ajka'", "16=%d. munkászászlóalj 'Várpalota'"]}
```

```json batch
{"addGroup": true, "group": "HUN_DEM_01", "selector": "1848 Honvéd Divisions", "addType": "infantry; cavalry", "fallback": "%d. honvédhadosztály", "canUse": "has_government = democratic", "comment": "Republican Hungary (democratic): honvéd divisions of the 1848-1849 War of Independence after Kossuth, Petőfi, Batthyány, the corps commanders and the 13 Martyrs of Arad, and the red-capped (vörössipkás) battalions.", "add": ["1=%d. honvédhadosztály 'Kossuth Lajos'", "2=%d. honvédhadosztály 'Petőfi Sándor'", "3=%d. honvédhadosztály 'Batthyány Lajos'", "4=%d. honvédhadosztály 'Bem József'", "5=%d. honvédhadosztály 'Görgei Artúr'", "6=%d. honvédhadosztály 'Klapka György'", "7=%d. honvédhadosztály 'Damjanich János'", "8=%d. honvédhadosztály 'Perczel Mór'", "9=%d. honvédhadosztály 'Guyon Richárd'", "10=%d. honvédhadosztály 'Kmety György'", "11=%d. honvédhadosztály 'Czetz János'", "12=%d. honvédhadosztály 'Mészáros Lázár'", "13=%d. honvédhadosztály 'Aulich Lajos'", "14=%d. honvédhadosztály 'Dessewffy Arisztid'", "15=%d. honvédhadosztály 'Kiss Ernő'", "16=%d. honvédhadosztály 'Knezić Károly'", "17=%d. honvédhadosztály 'Lahner György'", "18=%d. honvédhadosztály 'Lázár Vilmos'", "19=%d. honvédhadosztály 'Leiningen-Westerburg Károly'", "20=%d. honvédhadosztály 'Nagysándor József'", "21=%d. honvédhadosztály 'Poeltenberg Ernő'", "22=%d. honvédhadosztály 'Schweidel József'", "23=%d. honvédhadosztály 'Török Ignác'", "24=%d. honvédhadosztály 'Vécsey Károly'", "25=%d. honvédhadosztály 'Vörössipkások'"]}
```

```json batch
{"addGroup": true, "group": "HUN_DEM_02", "selector": "National Guard Divisions", "addType": "infantry; militia", "fallback": "%d. nemzetőr hadosztály", "canUse": "has_government = democratic", "comment": "The National Guard (Nemzetőrség) of 1956 by its insurgent groups and commanders, and the mobile national guard camps of 1848.", "add": ["1=%d. nemzetőr hadosztály 'Corvin köz'", "2=%d. nemzetőr hadosztály 'Széna tér'", "3=%d. nemzetőr hadosztály 'Baross tér'", "4=%d. nemzetőr hadosztály 'Tűzoltó utca'", "5=%d. nemzetőr hadosztály 'Práter utca'", "6=%d. nemzetőr hadosztály 'Maléter Pál'", "7=%d. nemzetőr hadosztály 'Király Béla'", "8=%d. nemzetőr hadosztály 'Kopácsi Sándor'", "9=%d. nemzetőr hadosztály 'Szabó János'", "10=%d. nemzetőr hadosztály 'Iván Kovács László'", "11=%d. nemzetőr hadosztály 'Mansfeld Péter'", "12=%d. nemzetőr hadosztály 'Pápa'", "13=%d. nemzetőr hadosztály 'Vác'", "14=%d. nemzetőr hadosztály 'Arad'"]}
```
