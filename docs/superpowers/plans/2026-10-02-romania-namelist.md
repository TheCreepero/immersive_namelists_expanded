# Romania (ROM) Namelist Plan - 2026-10-02

Status: DONE

File: `common/units/names_divisions/INEX_ROM_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Romania (ROM) has no INEX file. Vanilla ships 9 `ROM_*` groups (INF, CAV, MOT, ARM, MEC, GAR, MAR, MTN, PAR) made of identical `%d` stubs with no diacritics (`Parasutisti`, `Armura`, `Paza`), a masculine `Motomecanizat` on feminine `Divizie`, and a few literal entries (`Divizia 1 Infanterie de Garda`, `Divizie 1 Fortificatii`, `Divizie 1 Graniceri`). Scripted references: `ROM_MTN_01`, `ROM_INF_01` and `ROM_ARM_01` in `common/national_focus/romania.txt`, and `ROM_INF_01` in `yugoslavia.txt`, so those vanilla tags stay as INEX overrides. Goal: override all nine vanilla groups with correct Romanian and add a full suite of historical and ideology-gated lists. 29 groups, 348 authored names, one new file.

## Decisions
User policy answers (2026-10-02):
- **Name policy**: verified Royal Romanian Army, Navy and Air Corps names plus plausible extrapolation in the Romanian pattern. Every extrapolated name is on "Author confirmation".
- **Ideology suites** (gated only by `can_use = { has_government = ... }`): fascism (Iron Guard), communism (Soviet-raised and Patriotic Guard lists), neutrality (royal and Crown), democratic (volunteer and civic tradition).
- **Plain/named pairs**: infantry, motorized, mechanized and armor.

Design decisions (all final):
- **Language and orthography**: Romanian with comma-below `ș` and `ț` (never cedilla `ş` `ţ`), plus `ă`, `â`, `î`. Selectors are English and use INEX's American spelling (`Motorized`, `Armored`).
- **Order and ordinals**: the Army wrote the definite noun, then the Arabic number, then the arm (`Divizia 6 Infanterie`, `Brigada 4 Mixtă Munte`, `Regimentul 14 Dorobanți`), never Roman numerals. Every fallback is therefore `<Noun> %d <Arm>` with `%d`, and vanilla's indefinite `Divizie %d Infanterie` is replaced by `Divizia %d Infanterie`. Honorifics follow the arm in single quotes, as INEX does elsewhere (`Divizia %d Infanterie 'Mărășești'`).
- **Honorifics are extrapolated by design**: interwar divisions carried no honorifics. The only attested division honorific is `România Mare` (1st Armoured Division, 26 April 1944). The Named lists use the garrison towns of the numbered divisions, regimental patrons, the 1916-17 battles, rulers and provinces.
- **Vanilla grammar fixes**: `Divizie` to `Divizia`; `Motomecanizat` to `Motorizată` (MOT) and `Mecanizată` (MEC); `Armura` to `Blindată`; `Infanterie Marinar` (Marinar means sailor) to `Infanterie Marină`; `Parasutisti` to `Parașutiști`; `Paza` to `Pază`; `de Munte Mixtă` to the Army's `Mixtă Munte`.
- **Plain and Named**: INF_01, MOT_01, MEC_01 and ARM_01 keep their vanilla tags as fallback-only plain groups (no `ordered`); INF_02, MOT_02, MEC_02 and ARM_02 are the Named variants. Numbering links: INF_02 to INF_01; MOT_01 keeps vanilla's link to INF_01; the mobile family is anchored on ROM_MOT_01 (MOT_02, MEC_01 and MEC_02 link it; vanilla linked MEC_01 to INF_01); ARM_02 links ARM_01. CAV_02 links CAV_01 and MTN_02 links MTN_01, because brigade and division series share one numbering.
- **Cavalry**: three lists. Cavalry Divisions (the 1942 divisions, `Divizia %d Cavalerie`), Cavalry Brigades (the 1939-42 brigades) and Cavalry Regiments (Roșiori 1-12 and Călărași 1-13). The fallback of CAV_03 is `Regimentul %d Călărași`.
- **Mountain**: vanilla `ROM_MTN_01` (selector "Mountain Divisions", focus-referenced) becomes "Mountain Brigades" with `Brigada %d Mixtă Munte`, since Romania's mountain units were brigades; the new `ROM_MTN_02` "Mountain Divisions" carries `Divizia %d Vânători de Munte`.
- **Vanilla literals relocated**: `Divizia 1 Infanterie de Garda` and `2` become the Royal Guard lists (ROM_ROY_01, ROM_ROY_02) with the Army's `Gardă`; `Divizie 1 Fortificatii` becomes `Divizia 1 Fortificații` (ROM_FOR_01 key 10); `Divizie 1 Graniceri` becomes `Divizia 1 Grăniceri` (ROM_BOR_01 key 13).
- **Gating**: `history/countries/ROM - Romania.txt` starts Romania as `democratic` in 1936 and switches it to `neutrality` in the 1939 bookmark (Carol II's royal dictatorship). So: royal lists (ROM_ROY_01, ROM_ROY_02, ROM_STR_01) are `neutrality`; Iron Guard lists are `fascism`; People's Army lists are `communism`; the volunteer and civic lists are `democratic` and are available at the 1936 start. No focus, decision, idea or flag gates.
- **Not authored**: no Antonescu suite (his regime kept Royal Army titles and crushed the Legion in January 1941), no collaborationist or Security-Battalion lists, no postwar Romanian People's Republic beyond the communist suite.
- **Border and fortified troops stay two lists** (ROM_FOR_01, ROM_BOR_01): merging them would number border brigades 11-18.

## Vanilla findings (`-InspectVanilla ROM`)
| Tag | Vanilla state | Action |
|---|---|---|
| ROM_INF_01 | 52 entries, `Divizie %d Infanterie`, 2 Guard + fortification + border literals, focus references (`romania.txt`, `yugoslavia.txt`) | plain, fallback only |
| ROM_MOT_01 | 33 stubs `Divizie %d Motomecanizat`, links INF_01 | plain, fix gender |
| ROM_MEC_01 | 33 stubs `Divizie %d Motomecanizat`, links INF_01 | plain, fix gender, anchor on MOT_01 |
| ROM_ARM_01 | 33 stubs `Divizie %d Armura`, focus references | plain, `Blindată` |
| ROM_CAV_01 | 50 stubs `Brigada %d Cavalerie` | override with real entries (divisions) |
| ROM_GAR_01 | 48 stubs `Divizia %d Paza` | override with real entries |
| ROM_MAR_01 | 30 stubs `Infanterie Marinar` | override with real entries |
| ROM_MTN_01 | 53 stubs `Brigada %d de Munte Mixtă`, focus reference | override as mountain brigades |
| ROM_PAR_01 | 30 stubs `Parasutisti` | override with real entries |

New tags avoid these nine. `-AddGroup` refuses a tag that exists in the mod.

## Group suite
| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| ROM_INF_01 | Infantry Divisions | infantry | always | - | `Divizia %d Infanterie` | 0 |
| ROM_INF_02 | Infantry Divisions (Named) | infantry | always | ROM_INF_01 | `Divizia %d Infanterie` | 40 |
| ROM_MOT_01 | Motorized Divisions | motorized | always | ROM_INF_01 | `Divizia %d Motorizată` | 0 |
| ROM_MOT_02 | Motorized Divisions (Named) | motorized | always | ROM_MOT_01 | `Divizia %d Motorizată` | 14 |
| ROM_MEC_01 | Mechanized Divisions | mechanized | always | ROM_MOT_01 | `Divizia %d Mecanizată` | 0 |
| ROM_MEC_02 | Mechanized Divisions (Named) | mechanized | always | ROM_MOT_01 | `Divizia %d Mecanizată` | 14 |
| ROM_ARM_01 | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | always | - | `Divizia %d Blindată` | 0 |
| ROM_ARM_02 | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | always | ROM_ARM_01 | `Divizia %d Blindată` | 14 |
| ROM_CAV_01 | Cavalry Divisions | cavalry | always | - | `Divizia %d Cavalerie` | 12 |
| ROM_CAV_02 | Cavalry Brigades | cavalry | always | ROM_CAV_01 | `Brigada %d Cavalerie` | 10 |
| ROM_CAV_03 | Cavalry Regiments | cavalry | always | - | `Regimentul %d Călărași` | 25 |
| ROM_MTN_01 | Mountain Brigades | mountaineers | always | - | `Brigada %d Mixtă Munte` | 10 |
| ROM_MTN_02 | Mountain Divisions | mountaineers | always | ROM_MTN_01 | `Divizia %d Vânători de Munte` | 12 |
| ROM_MAR_01 | Marine Divisions | marine | always | - | `Regimentul %d Infanterie Marină` | 11 |
| ROM_PAR_01 | Paratrooper Divisions | paratrooper | always | - | `Batalionul %d Parașutiști` | 10 |
| ROM_GAR_01 | Garrison Divisions | infantry | always | - | `Divizia %d Pază` | 14 |
| ROM_FOR_01 | Fortified Sectors | infantry | always | - | `Sectorul Fortificat %d` | 13 |
| ROM_BOR_01 | Border Guard Brigades | infantry | always | - | `Brigada %d Grăniceri` | 13 |
| ROM_JAN_01 | Gendarmerie Legions | infantry | always | - | `Legiunea %d Jandarmi` | 23 |
| ROM_ROY_01 | Royal Guard Divisions | infantry | has_government = neutrality | - | `Divizia %d Gardă` | 12 |
| ROM_ROY_02 | Royal Guard Regiments | infantry | has_government = neutrality | - | `Regimentul %d Gardă` | 10 |
| ROM_STR_01 | Straja Țării Legions | militia | has_government = neutrality | - | `Legiunea %d Straja Țării` | 11 |
| ROM_FAS_01 | Legionary Divisions | infantry | has_government = fascism | - | `Divizia %d Legionară` | 12 |
| ROM_FAS_02 | Iron Guard Legions | infantry, militia | has_government = fascism | - | `Legiunea %d Garda de Fier` | 12 |
| ROM_RED_01 | People's Divisions | infantry | has_government = communism | - | `Divizia %d Voluntari` | 11 |
| ROM_RED_02 | People's Armored Divisions | mechanized, light_armor, medium_armor, heavy_armor, modern_armor | has_government = communism | - | `Divizia %d Tancuri` | 11 |
| ROM_RED_03 | Patriotic Guards | militia | has_government = communism | - | `Garda Patriotică %d` | 10 |
| ROM_DEM_01 | Volunteer Divisions | infantry | has_government = democratic | - | `Divizia %d Voluntari` | 12 |
| ROM_DEM_02 | National Guard Regiments | infantry, militia | has_government = democratic | - | `Regimentul %d Garda Națională` | 12 |
| **Total** | | | | | | **29 groups, 348 names** |

## Research record
- **inex-historical-researcher**, one run, about 36 web calls. Main sources: ro.wikipedia (Divizia 1 Blindată, Gărzile Patriotice, Corpurile Voluntarilor Români din Rusia), en.wikipedia (Tudor Vladimirescu Division, Horea Cloșca și Crișan Division, Straja Țării), ligamilitarilor.ro (cavalry), arhivelenationale.ro and jandarmeriabrasov.ro (gendarmerie), navy.ro (marines), search snippets of an Axis History Forum peacetime-corps table. worldwar2.ro, the Axis History Forum pages and niehorster.org were unreachable, so division garrisons beyond those in the snippets stayed unverified.
- **No second pass**: the unverified areas (cavalry royal patrons, border and fortified titles, `Pază` wording, naval and paratroop group titles) feed lists that are extrapolated by policy, so more research would not change the batch.
- **Government mapping**: read directly from `history/countries/ROM - Romania.txt` (democratic 1936, neutrality at the 1939 bookmark).
- **Unverified and unused**: `Grupul Parașutiști`, `Divizia de Mare`, `Divizia de Dunăre`, Security Battalions.

## Author confirmation
Entries held for the author (wrong or unverified beyond this list is a proofreader finding):
- **ROM_INF_02**: every honorific is extrapolated. Garrison-keyed: 2 Craiova, 3 Pitești, 4 București, 9 Constanța, 10 Tulcea, 11 Slatina, 16 Cluj, 18 Sibiu (verified HQ towns). Regimental-title-keyed: 7 Roman, 13 Prahova, 20 Alba Iulia, 25 Gorj, 26 Baia. The rest are rulers, battles and provinces (12 Banat stands in for an unverified Timișoara garrison).
- **ROM_MOT_02, ROM_MEC_02, ROM_ARM_02** (keys 2-14): all honorifics. Only `România Mare` on `Divizia 1 Blindată` is attested.
- **ROM_CAV_01, ROM_CAV_02**: honorifics. Real numbers are 1, 5, 6, 7, 8 and 9; keys 2-4, 10-12 (divisions) and 2-4, 10 (brigades) are extrapolated. Botoșani (5) and Bazargic (brigade 7) come from attested regimental garrisons.
- **ROM_CAV_03**: all patrons and the Călărași counties (Ialomița, Teleorman, Vlașca, Dolj, Mehedinți, Gorj, Argeș, Olt, Romanați, Vaslui, Fălciu, Tutova, Putna) are extrapolated; the regiment numbers and the garrisons Botoșani (8 Roșiori) and Bazargic (12 Roșiori) are verified.
- **ROM_MTN_01 / ROM_MTN_02**: brigades 5-10 and every massif honorific are extrapolated (Brașov and Aiud are attested garrisons); the Divizia 4 Vânători de Munte of 1942 is attested but the series is extrapolated.
- **ROM_MAR_01**: honorifics are extrapolated; the Brăila regiment and the Batalionul 1 Infanterie Marină (1 April 1940) are verified.
- **ROM_PAR_01**: honorifics are extrapolated; paratroopers were brevetted on 1 October 1941 and the first battalion formed in 1942.
- **ROM_GAR_01**: the `Divizia %d Pază` title (vanilla's own wording) and keys 1-12 are extrapolated; `Divizia 1 Instrucție` and `Divizia 35 Rezervă` are attested.
- **ROM_FOR_01 / ROM_BOR_01**: sector and brigade titles are extrapolated. The Focșani-Nămoloasa-Galați line is verified; `Linia Carol al II-lea` comes from memory; `Divizia 1 Fortificații` and `Divizia 1 Grăniceri` are vanilla literals with unconfirmed titles.
- **ROM_JAN_01**: the four brigade seats and the first eleven legions are verified; legions 16-23 (Cluj, Iași, Sibiu, Constanța, Timiș-Torontal, Mureș, Bihor, Dolj) follow the pattern.
- **ROM_ROY_01 / ROM_ROY_02 / ROM_STR_01**: the honorific series (ROY_01), keys 7-12 (ROY_02) and the legion-to-ținut pairing (STR_01) are extrapolated; ROY_02 keys 1-4 and the ten ținut names are verified.
- **ROM_FAS_01**: every honorific is extrapolated (the Legion fielded no divisions). **ROM_FAS_02**: `Corpul Legionar 'Ion Moța - Vasile Marin'` is from memory; keys 5-12 are extrapolated; the other three titles are verified.
- **ROM_RED_01 / RED_02 / RED_03**: only RED_01 keys 1-2, RED_02 keys 1, 6 and 37 are verified conversions and titles; every other honorific is extrapolated, as are the factory names of RED_03.
- **ROM_DEM_01 / ROM_DEM_02**: `Darnița`, `Siberia` and `Italia` are verified volunteer-corps places; every other honorific is extrapolated.

## Kept on judgment
- **NAME_LONG (INFO) on ROM_ROY_02**: `Regimentul 2/9 Vânători de Gardă 'Regele Alexandru I al Iugoslaviei'` and `Regimentul 1/2 Vânători de Gardă 'Regina Elisabeta a Greciei'` exceed 60 characters. They are the verified full regimental titles with their patrons.
- The four plain groups (INF_01, MOT_01, MEC_01, ARM_01) hold no names by design; the audit shows each as `Variant: plain (un-nicknamed) counterpart of <named tag>`.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames ROM -Batch docs\superpowers\plans\2026-10-02-romania-namelist.md`. Expect `Created INEX_ROM_names_divisions.txt`, one `Added ROM_...` line per group (29 groups, 348 names in total) and no `[ERROR]`.
- [x] 2. `README.md`: insert the row from "Docs payload" after the row that begins ``| `GRE` | Greece``.
- [x] 3. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: insert the cross-reference row after the row that begins ``| `INEX_GRE_names_divisions.txt` ``, and the `[b]Romania[/b]` block after the `[b]Greece[/b]` block (before `[b]Lithuania[/b]`), both from "Docs payload".
- [x] 4. Wiki: write `wiki/Romania.md` from "Docs payload" (Write tool, UTF-8 without BOM), insert the `wiki/Home.md` row after the Greece row and the `wiki/_Sidebar.md` line after `- [Greece](Greece)`, then `powershell -File .\build.ps1 -SyncWiki ROM`. Expect no stale or missing tags.
- [x] 5. `powershell -File .\build.ps1 -Check ROM`. Expect `Check passed`; the only remaining flag must be the INFO `NAME_LONG` on ROM_ROY_02 listed under "Kept on judgment".
- [x] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 7. After the user confirms: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document ROM division namelists"`.

## Docs payload
Insert every text below exactly as written.

### README.md row
After the row that begins ``| `GRE` | Greece``:
```
| `ROM` | Romania | `INEX_ROM_names_divisions.txt` |
```

### Workshop cross-reference row
After the row that begins ``| `INEX_GRE_names_divisions.txt` ``:
```
| `INEX_ROM_names_divisions.txt` | Romania | `ROM` | Included (Plain & Named Divizia infantry, motorized, mechanized and armored lists, Cavalry divisions, brigades & regiments, Mountain brigades & divisions, Marine, Paratrooper, garrison, fortified sectors, Border Guard, Gendarmerie, Royal Guard & Straja Țării, fascist Iron Guard, communist People's divisions & Patriotic Guards, democratic Volunteer & National Guard) |
```

### Workshop `[b]Romania[/b]` block
After the `[b]Greece[/b]` block, with one blank line before `[b]Lithuania[/b]`:
```
[b]Romania[/b]
- Plain and Named infantry, motorized, mechanized and armored divisions with regional and royal honorifics ([i]Divizia 6 Infanterie 'Mărășești'[/i], [i]Divizia 1 Blindată 'România Mare'[/i]), plus Cavalry, Mountain brigades and divisions, Marine and Paratrooper lists
- Gendarmerie legions, Border Guard brigades, fortified sectors ([i]Sectorul Fortificat 3 'Galați'[/i]), and garrison, training and reserve divisions
- Ideology suites: Royal Guard & Straja Țării (neutrality), Iron Guard (fascist), Tudor Vladimirescu & Patriotic Guards (communist), and Volunteer & National Guard (democratic)
```

### wiki/Home.md row
After the Greece row:
```
| [Romania](Romania) | `ROM` | 29 | `INEX_ROM_names_divisions.txt` |
```

### wiki/_Sidebar.md line
After `- [Greece](Greece)`:
```
- [Romania](Romania)
```

### wiki/Romania.md (whole page)
````markdown
# Romania

**Country Tag:** `ROM` | **Source File:** [`INEX_ROM_names_divisions.txt`](../common/units/names_divisions/INEX_ROM_names_divisions.txt)

---

## Historical Overview

The Royal Romanian Army (*Armata Regală Română*) entered the Second World War with twenty-one peacetime infantry divisions (*Divizia 1 Infanterie* to *Divizia 21 Infanterie*) grouped under the 1st to 7th Army Corps, a Guard Division (*Divizia 1 Gardă*), six cavalry brigades (*Brigada 1, 5, 6, 7, 8 and 9 Cavalerie*, made divisions in March 1942), the mountain brigades (*Brigada 1-4 Mixtă Munte*), the Gendarmerie and, from 1941, the *Divizia 1 Blindată* (the *România Mare* division from April 1944). The Army wrote the definite noun first, then the Arabic number and the arm (*Divizia 6 Infanterie*, *Regimentul 14 Dorobanți*, *Batalionul 13 Vânători de Munte*), and put any honorific after it in quotation marks.

Interwar divisions were not named, so the Named lists extrapolate from regimental patrons (*Roman*, *Prahova*, *Gorj*, *Baia*), the garrison towns of the numbered divisions (*Craiova*, *Pitești*, *Constanța*, *Tulcea*, *Cluj*, *Sibiu*), the battles of 1916-17 (*Mărăști*, *Mărășești*, *Oituz*), rulers and provinces. Only *România Mare* is an attested division honorific; every other one is an extension in the Romanian pattern.

INEX replaces all nine vanilla lists, which were stubs without diacritics. Vanilla's *Divizie %d Infanterie* lacked the definite article (*Divizia*), *Motomecanizat* did not agree with its feminine noun, *Armura* becomes *Blindată*, *Marinar* (sailor) becomes *Infanterie Marină*, *Parasutisti* becomes *Parașutiști*, *Paza* becomes *Pază* and *Munte Mixtă* is put in the Army's order, *Mixtă Munte*. Names use comma-below *ș* and *ț* with *ă*, *â* and *î*.

Romania starts in 1936 under a democratic government and becomes the royal dictatorship of Carol II (`neutrality`) by the 1939 bookmark. The royal, Straja Țării, Iron Guard (`fascism`), People's Army (`communism`) and volunteer or civic (`democratic`) lists are therefore gated by government type only and never mix traditions.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `ROM_INF_01` | Infantry Divisions | infantry | `Divizia %d Infanterie` |
| `ROM_INF_02` | Infantry Divisions (Named) | infantry | `Divizia %d Infanterie` |
| `ROM_MOT_01` | Motorized Divisions | motorized | `Divizia %d Motorizată` |
| `ROM_MOT_02` | Motorized Divisions (Named) | motorized | `Divizia %d Motorizată` |
| `ROM_MEC_01` | Mechanized Divisions | mechanized | `Divizia %d Mecanizată` |
| `ROM_MEC_02` | Mechanized Divisions (Named) | mechanized | `Divizia %d Mecanizată` |
| `ROM_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `Divizia %d Blindată` |
| `ROM_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `Divizia %d Blindată` |
| `ROM_CAV_01` | Cavalry Divisions | cavalry | `Divizia %d Cavalerie` |
| `ROM_CAV_02` | Cavalry Brigades | cavalry | `Brigada %d Cavalerie` |
| `ROM_CAV_03` | Cavalry Regiments | cavalry | `Regimentul %d Călărași` |
| `ROM_MTN_01` | Mountain Brigades | mountaineers | `Brigada %d Mixtă Munte` |
| `ROM_MTN_02` | Mountain Divisions | mountaineers | `Divizia %d Vânători de Munte` |
| `ROM_MAR_01` | Marine Divisions | marine | `Regimentul %d Infanterie Marină` |
| `ROM_PAR_01` | Paratrooper Divisions | paratrooper | `Batalionul %d Parașutiști` |
| `ROM_GAR_01` | Garrison Divisions | infantry | `Divizia %d Pază` |
| `ROM_FOR_01` | Fortified Sectors | infantry | `Sectorul Fortificat %d` |
| `ROM_BOR_01` | Border Guard Brigades | infantry | `Brigada %d Grăniceri` |
| `ROM_JAN_01` | Gendarmerie Legions | infantry | `Legiunea %d Jandarmi` |
| `ROM_ROY_01` | Royal Guard Divisions | infantry | `Divizia %d Gardă` |
| `ROM_ROY_02` | Royal Guard Regiments | infantry | `Regimentul %d Gardă` |
| `ROM_STR_01` | Straja Țării Legions | militia | `Legiunea %d Straja Țării` |
| `ROM_FAS_01` | Legionary Divisions | infantry | `Divizia %d Legionară` |
| `ROM_FAS_02` | Iron Guard Legions | infantry, militia | `Legiunea %d Garda de Fier` |
| `ROM_RED_01` | People's Divisions | infantry | `Divizia %d Voluntari` |
| `ROM_RED_02` | People's Armored Divisions | mechanized, light_armor, medium_armor, heavy_armor, modern_armor | `Divizia %d Tancuri` |
| `ROM_RED_03` | Patriotic Guards | militia | `Garda Patriotică %d` |
| `ROM_DEM_01` | Volunteer Divisions | infantry | `Divizia %d Voluntari` |
| `ROM_DEM_02` | National Guard Regiments | infantry, militia | `Regimentul %d Garda Națională` |

---

## Group Details

Plain lists (`ROM_INF_01`, `ROM_MOT_01`, `ROM_MEC_01`, `ROM_ARM_01`) carry only the fallback, so templates that want un-nicknamed numbering keep it; each Named list shares its numbering through `link_numbering_with`. The motorized and mechanized families share one numbering anchor (`ROM_MOT_01`). Ideology lists use `can_use = { has_government = ... }`.

### `ROM_INF_01` - Infantry Divisions
Overrides vanilla ROM_INF_01 as the plain variant. The Army wrote the definite noun before the number (Divizia 6 Infanterie), unlike vanilla's Divizie %d Infanterie. Vanilla's Guard, fortification and border literals move to ROM_ROY_01, ROM_FOR_01 and ROM_BOR_01. Plain variant: fallback only, no authored names.

### `ROM_INF_02` - Infantry Divisions (Named)
Named variant of ROM_INF_01; shares its numbering. Interwar Romanian divisions carried no honorifics, so the titles are extrapolated: garrison towns of the numbered divisions, regimental patrons, battles of 1916-17, rulers and provinces. Shares numbering with `ROM_INF_01`.

**Peacetime divisions 1-21:** *Divizia 1 Infanterie 'Mihai Viteazul'*; *Divizia 2 Infanterie 'Craiova'*; *Divizia 3 Infanterie 'Pitești'*; *Divizia 4 Infanterie 'București'*; *Divizia 5 Infanterie 'Ștefan cel Mare'*; *Divizia 6 Infanterie 'Mărășești'*; *Divizia 7 Infanterie 'Roman'*; *Divizia 8 Infanterie 'Mărăști'*; *Divizia 9 Infanterie 'Constanța'*; *Divizia 10 Infanterie 'Tulcea'*; *Divizia 11 Infanterie 'Slatina'*; *Divizia 12 Infanterie 'Banat'*; *Divizia 13 Infanterie 'Prahova'*; *Divizia 14 Infanterie 'Oituz'*; *Divizia 15 Infanterie 'Mircea cel Bătrân'*; *Divizia 16 Infanterie 'Cluj'*; *Divizia 17 Infanterie 'Matei Basarab'*; *Divizia 18 Infanterie 'Sibiu'*; *Divizia 19 Infanterie 'Burebista'*; *Divizia 20 Infanterie 'Alba Iulia'*; *Divizia 21 Infanterie 'Dimitrie Cantemir'* **Mobilization divisions:** *Divizia 22 Infanterie 'Alexandru cel Bun'*; *Divizia 23 Infanterie 'Vlad Țepeș'*; *Divizia 24 Infanterie 'Constantin Brâncoveanu'*; *Divizia 25 Infanterie 'Gorj'*; *Divizia 26 Infanterie 'Baia'*; *Divizia 27 Infanterie 'Regele Carol I'*; *Divizia 28 Infanterie 'Regina Maria'*; *Divizia 29 Infanterie 'Mareșal Averescu'*; *Divizia 30 Infanterie 'Mareșal Prezan'*; *Divizia 31 Infanterie 'General Dragalina'*; *Divizia 32 Infanterie 'Podu Înalt'*; *Divizia 33 Infanterie 'Jiu'*; *Divizia 34 Infanterie 'Moldova'*; *Divizia 35 Infanterie 'Dobrogea'*; *Divizia 36 Infanterie 'Bucovina'*; *Divizia 37 Infanterie 'Basarabia'*; *Divizia 38 Infanterie 'Transilvania'*; *Divizia 39 Infanterie 'Crișana'*; *Divizia 40 Infanterie 'Maramureș'*

### `ROM_MOT_01` - Motorized Divisions
Overrides vanilla ROM_MOT_01 as the plain variant (vanilla's masculine Motomecanizat on a feminine Divizie is replaced). Anchor of the mobile numbering family. Shares numbering with `ROM_INF_01`. Plain variant: fallback only, no authored names.

### `ROM_MOT_02` - Motorized Divisions (Named)
Named variant of ROM_MOT_01; shares its numbering. Extrapolated: Romania fielded one motorized division before 1941. Rivers, towns and provinces of the plains. Shares numbering with `ROM_MOT_01`.

*Divizia 1 Motorizată 'Târgoviște'*; *Divizia 2 Motorizată 'Prahova'*; *Divizia 3 Motorizată 'Dunărea'*; *Divizia 4 Motorizată 'Olt'*; *Divizia 5 Motorizată 'Mihai Viteazul'*; *Divizia 6 Motorizată 'Brăila'*; *Divizia 7 Motorizată 'Ploiești'*; *Divizia 8 Motorizată 'Burebista'*; *Divizia 9 Motorizată 'Basarabia'*; *Divizia 10 Motorizată 'Tecuci'*; *Divizia 11 Motorizată 'Carpați'*; *Divizia 12 Motorizată 'Ialomița'*; *Divizia 13 Motorizată 'Teleorman'*; *Divizia 14 Motorizată 'Vedea'*

### `ROM_MEC_01` - Mechanized Divisions
Overrides vanilla ROM_MEC_01 as the plain variant. Anchored on ROM_MOT_01 for shared numbering; vanilla linked ROM_INF_01. Shares numbering with `ROM_MOT_01`. Plain variant: fallback only, no authored names.

### `ROM_MEC_02` - Mechanized Divisions (Named)
Named variant of ROM_MEC_01; shares the mobile numbering. Extrapolated: battles of 1917, frontier rivers and provinces. Shares numbering with `ROM_MOT_01`.

*Divizia 1 Mecanizată 'Mărășești'*; *Divizia 2 Mecanizată 'Podu Înalt'*; *Divizia 3 Mecanizată 'Mărăști'*; *Divizia 4 Mecanizată 'Oituz'*; *Divizia 5 Mecanizată 'Jiu'*; *Divizia 6 Mecanizată 'Dobrogea'*; *Divizia 7 Mecanizată 'Moldova'*; *Divizia 8 Mecanizată 'Siret'*; *Divizia 9 Mecanizată 'Prut'*; *Divizia 10 Mecanizată 'Argeș'*; *Divizia 11 Mecanizată 'Banat'*; *Divizia 12 Mecanizată 'Dâmbovița'*; *Divizia 13 Mecanizată 'Mureș'*; *Divizia 14 Mecanizată 'Someș'*

### `ROM_ARM_01` - Armored Divisions
Overrides vanilla ROM_ARM_01 as the plain variant (Armura becomes the Army's own Blindată). Plain variant: fallback only, no authored names.

### `ROM_ARM_02` - Armored Divisions (Named)
Named variant of ROM_ARM_01; shares its numbering. Key 1 is the real 1st Armoured Division 'România Mare' (1944); the rest is extrapolated, since no second armoured division existed. Shares numbering with `ROM_ARM_01`.

*Divizia 1 Blindată 'România Mare'*; *Divizia 2 Blindată 'Târgoviște'*; *Divizia 3 Blindată 'Mihai Viteazul'*; *Divizia 4 Blindată 'Ștefan cel Mare'*; *Divizia 5 Blindată 'Oituz'*; *Divizia 6 Blindată 'Mărășești'*; *Divizia 7 Blindată 'Vlad Țepeș'*; *Divizia 8 Blindată 'Mircea cel Bătrân'*; *Divizia 9 Blindată 'Dacia'*; *Divizia 10 Blindată 'Burebista'*; *Divizia 11 Blindată 'Decebal'*; *Divizia 12 Blindată 'Unirea Principatelor'*; *Divizia 13 Blindată 'Alexandru Ioan Cuza'*; *Divizia 14 Blindată 'Dimitrie Cantemir'*

### `ROM_CAV_01` - Cavalry Divisions
Overrides vanilla ROM_CAV_01. Cavalry brigades became numbered divisions on 15 March 1942 (real numbers 1, 5, 6, 7, 8, 9). Honorifics are extrapolated.

*Divizia 1 Cavalerie 'Regele Ferdinand I'*; *Divizia 2 Cavalerie 'Muntenia'*; *Divizia 3 Cavalerie 'Oltenia'*; *Divizia 4 Cavalerie 'Banat'*; *Divizia 5 Cavalerie 'Botoșani'*; *Divizia 6 Cavalerie 'Mihai Viteazul'*; *Divizia 7 Cavalerie 'Dobrogea'*; *Divizia 8 Cavalerie 'Ștefan cel Mare'*; *Divizia 9 Cavalerie 'Basarabia'*; *Divizia 10 Cavalerie 'Transilvania'*; *Divizia 11 Cavalerie 'Bucovina'*; *Divizia 12 Cavalerie 'Crișana'*

### `ROM_CAV_02` - Cavalry Brigades
Cavalry brigades of 1939-42 (real numbers 1, 5, 6, 7, 8, 9; Brigada 5 held Botoșani and Brigada 7 Bazargic). Shares numbering with ROM_CAV_01. Honorifics are extrapolated. Shares numbering with `ROM_CAV_01`.

*Brigada 1 Cavalerie 'Regina Maria'*; *Brigada 2 Cavalerie 'Iași'*; *Brigada 3 Cavalerie 'Bârlad'*; *Brigada 4 Cavalerie 'Craiova'*; *Brigada 5 Cavalerie 'Botoșani'*; *Brigada 6 Cavalerie 'Caracal'*; *Brigada 7 Cavalerie 'Bazargic'*; *Brigada 8 Cavalerie 'Bacău'*; *Brigada 9 Cavalerie 'Dorohoi'*; *Brigada 10 Cavalerie 'Roman'*

### `ROM_CAV_03` - Cavalry Regiments
The peacetime cavalry arm: Roșiori 1-12 and Călărași 1-13 (26 regiments with the Garda Regală Călare, which sits in ROM_ROY_02). Regimental numbers are real; Botoșani (8 Roșiori) and Bazargic (12 Roșiori) are attested garrisons and every other honorific is extrapolated. Keys 13-25 carry the Călărași numbers as literals and the interwar counties that raised them.

*Regimentul 1 Roșiori 'Regele Ferdinand I'*; *Regimentul 2 Roșiori 'Regina Maria'*; *Regimentul 3 Roșiori 'Principele Nicolae'*; *Regimentul 4 Roșiori 'Mihai Viteazul'*; *Regimentul 5 Roșiori 'Ștefan cel Mare'*; *Regimentul 6 Roșiori 'Iași'*; *Regimentul 7 Roșiori 'Craiova'*; *Regimentul 8 Roșiori 'Botoșani'*; *Regimentul 9 Roșiori 'Bârlad'*; *Regimentul 10 Roșiori 'Caracal'*; *Regimentul 11 Roșiori 'Regele Carol I'*; *Regimentul 12 Roșiori 'Bazargic'*; *Regimentul 1 Călărași 'Ialomița'*; *Regimentul 2 Călărași 'Teleorman'*; *Regimentul 3 Călărași 'Vlașca'*; *Regimentul 4 Călărași 'Dolj'*; *Regimentul 5 Călărași 'Mehedinți'*; *Regimentul 6 Călărași 'Gorj'*; *Regimentul 7 Călărași 'Argeș'*; *Regimentul 8 Călărași 'Olt'*; *Regimentul 9 Călărași 'Romanați'*; *Regimentul 10 Călărași 'Vaslui'*; *Regimentul 11 Călărași 'Fălciu'*; *Regimentul 12 Călărași 'Tutova'*; *Regimentul 13 Călărași 'Putna'*

### `ROM_MTN_01` - Mountain Brigades
Overrides vanilla ROM_MTN_01 (word order was Munte Mixtă). Brigada 1-3 Mixtă Munte formed in 1937 and Brigada 4 on 20 June 1939 (HQ Aiud); 5-8 are extrapolated. Honorifics are Carpathian massifs and garrisons (Brașov, Aiud).

*Brigada 1 Mixtă Munte 'Bucegi'*; *Brigada 2 Mixtă Munte 'Brașov'*; *Brigada 3 Mixtă Munte 'Făgăraș'*; *Brigada 4 Mixtă Munte 'Aiud'*; *Brigada 5 Mixtă Munte 'Rodna'*; *Brigada 6 Mixtă Munte 'Retezat'*; *Brigada 7 Mixtă Munte 'Parâng'*; *Brigada 8 Mixtă Munte 'Ceahlău'*; *Brigada 9 Mixtă Munte 'Cindrel'*; *Brigada 10 Mixtă Munte 'Vrancea'*

### `ROM_MTN_02` - Mountain Divisions
Divizia 4 Vânători de Munte is attested for 1942; the series is extrapolated from the Army's mountain-troop terms. Shares numbering with ROM_MTN_01. Shares numbering with `ROM_MTN_01`.

*Divizia 1 Vânători de Munte 'Carpați'*; *Divizia 2 Vânători de Munte 'Sarmizegetusa'*; *Divizia 3 Vânători de Munte 'Piatra Craiului'*; *Divizia 4 Vânători de Munte 'Postăvarul'*; *Divizia 5 Vânători de Munte 'Semenic'*; *Divizia 6 Vânători de Munte 'Căliman'*; *Divizia 7 Vânători de Munte 'Hășmaș'*; *Divizia 8 Vânători de Munte 'Penteleu'*; *Divizia 9 Vânători de Munte 'Ciucaș'*; *Divizia 10 Vânători de Munte 'Apuseni'*; *Divizia 11 Vânători de Munte 'Vrancea'*; *Divizia 12 Vânători de Munte 'Cozia'*

### `ROM_MAR_01` - Marine Divisions
Overrides vanilla ROM_MAR_01 (Marinar means sailor; the corps was Infanterie Marină). The Batalionul de Infanterie Marină was raised on 1 April 1940 and became a regiment at Brăila.

*Regimentul 1 Infanterie Marină 'Brăila'*; *Regimentul 2 Infanterie Marină 'Dunărea'*; *Regimentul 3 Infanterie Marină 'Marea Neagră'*; *Regimentul 4 Infanterie Marină 'Constanța'*; *Regimentul 5 Infanterie Marină 'Mangalia'*; *Regimentul 6 Infanterie Marină 'Sulina'*; *Regimentul 7 Infanterie Marină 'Galați'*; *Regimentul 8 Infanterie Marină 'Tulcea'*; *Regimentul 9 Infanterie Marină 'Delta Dunării'*; *Regimentul 10 Infanterie Marină 'Mircea cel Bătrân'*; *Batalionul 1 Infanterie Marină*

### `ROM_PAR_01` - Paratrooper Divisions
Overrides vanilla ROM_PAR_01 (Parasutisti lacked its diacritics). Romanian paratroopers were brevetted on 1 October 1941 and the first battalion formed in 1942. Honorifics are extrapolated.

*Batalionul 1 Parașutiști 'Aeronautica Regală'*; *Batalionul 2 Parașutiști 'Mihai Viteazul'*; *Batalionul 3 Parașutiști 'Burebista'*; *Batalionul 4 Parașutiști 'Decebal'*; *Batalionul 5 Parașutiști 'Dobrogea'*; *Batalionul 6 Parașutiști 'Carpați'*; *Batalionul 7 Parașutiști 'Ștefan cel Mare'*; *Batalionul 8 Parașutiști 'Regele Mihai I'*; *Batalionul 9 Parașutiști 'Moldova'*; *Batalionul 10 Parașutiști 'Transilvania'*

### `ROM_GAR_01` - Garrison Divisions
Overrides vanilla ROM_GAR_01 (Paza lacked its diacritic). Keys 1-12 are extrapolated garrison and rear-area titles of the cities and occupied provinces; keys 13 and 14 are attested wartime formations (Divizia 1 Instrucție, Divizia 35 Rezervă).

*Divizia 1 Pază 'București'*; *Divizia 2 Pază 'Ploiești'*; *Divizia 3 Pază 'Constanța'*; *Divizia 4 Pază 'Brăila'*; *Divizia 5 Pază 'Galați'*; *Divizia 6 Pază 'Iași'*; *Divizia 7 Pază 'Chișinău'*; *Divizia 8 Pază 'Cernăuți'*; *Divizia 9 Pază 'Cluj'*; *Divizia 10 Pază 'Timișoara'*; *Divizia 11 Pază 'Sibiu'*; *Divizia 12 Pază 'Craiova'*; *Divizia 1 Instrucție*; *Divizia 35 Rezervă*

### `ROM_FOR_01` - Fortified Sectors
Sectors of the Focșani-Nămoloasa-Galați line and the frontier works; sector numbering is extrapolated. Key 10 keeps vanilla's Divizia 1 Fortificații literal with its diacritics.

*Sectorul Fortificat 1 'Focșani'*; *Sectorul Fortificat 2 'Nămoloasa'*; *Sectorul Fortificat 3 'Galați'*; *Sectorul Fortificat 4 'Siret'*; *Sectorul Fortificat 5 'Prut'*; *Sectorul Fortificat 6 'Dobrogea'*; *Sectorul Fortificat 7 'Oltenia'*; *Sectorul Fortificat 8 'Maramureș'*; *Sectorul Fortificat 9 'Linia Carol al II-lea'*; *Divizia 1 Fortificații*; *Sectorul Fortificat 11 'Cernavodă'*; *Sectorul Fortificat 12 'Turtucaia'*; *Sectorul Fortificat 13 'Tisa'*

### `ROM_BOR_01` - Border Guard Brigades
Border troops (Grăniceri) by frontier; the brigade titles are extrapolated, as the Army's exact border-guard wording was not confirmed. Key 13 keeps vanilla's Divizia 1 Grăniceri literal with its diacritic.

*Brigada 1 Grăniceri 'Nistru'*; *Brigada 2 Grăniceri 'Prut'*; *Brigada 3 Grăniceri 'Tisa'*; *Brigada 4 Grăniceri 'Dunărea'*; *Brigada 5 Grăniceri 'Carpați'*; *Brigada 6 Grăniceri 'Bucovina'*; *Brigada 7 Grăniceri 'Maramureș'*; *Brigada 8 Grăniceri 'Dobrogea'*; *Brigada 9 Grăniceri 'Bugeac'*; *Brigada 10 Grăniceri 'Banat'*; *Brigada 11 Grăniceri 'Oltenia'*; *Brigada 12 Grăniceri 'Cerna'*; *Divizia 1 Grăniceri*

### `ROM_JAN_01` - Gendarmerie Legions
Gendarmerie (Jandarmeria): Brigada I-IV at Bucharest, Iași, Chișinău and Cluj, and county legions. The eleven legions of the 'Bucegi' regional inspectorate (1938) are verified; the other counties follow the pattern.

*Brigada 1 Jandarmi 'București'*; *Brigada 2 Jandarmi 'Iași'*; *Brigada 3 Jandarmi 'Chișinău'*; *Brigada 4 Jandarmi 'Cluj'*; *Legiunea de Jandarmi Ilfov*; *Legiunea de Jandarmi Teleorman*; *Legiunea de Jandarmi Argeș*; *Legiunea de Jandarmi Muscel*; *Legiunea de Jandarmi Dâmbovița*; *Legiunea de Jandarmi Prahova*; *Legiunea de Jandarmi Vlașca*; *Legiunea de Jandarmi Buzău*; *Legiunea de Jandarmi Brașov*; *Legiunea de Jandarmi Trei Scaune*; *Legiunea de Jandarmi București*; *Legiunea de Jandarmi Cluj*; *Legiunea de Jandarmi Iași*; *Legiunea de Jandarmi Sibiu*; *Legiunea de Jandarmi Constanța*; *Legiunea de Jandarmi Timiș-Torontal*; *Legiunea de Jandarmi Mureș*; *Legiunea de Jandarmi Bihor*; *Legiunea de Jandarmi Dolj*

### `ROM_ROY_01` - Royal Guard Divisions
Royal dictatorship of Carol II and the Crown. Divizia 1 Gardă (1941-45) is real; the honorific series is extrapolated from royal patrons. Gated: `has_government = neutrality`.

*Divizia 1 Gardă 'Regele Carol al II-lea'*; *Divizia 2 Gardă 'Regele Mihai I'*; *Divizia 3 Gardă 'Mihai Viteazul'*; *Divizia 4 Gardă 'Regele Ferdinand I Întregitorul'*; *Divizia 5 Gardă 'Regina Maria'*; *Divizia 6 Gardă 'Regele Carol I'*; *Divizia 7 Gardă 'Marele Voievod Mihai de Alba Iulia'*; *Divizia 8 Gardă 'Regina Elisabeta'*; *Divizia 9 Gardă 'Principele Nicolae'*; *Divizia 10 Gardă 'Ștefan cel Mare'*; *Divizia 11 Gardă 'Regina-Mamă Elena'*; *Divizia 12 Gardă 'Frontul Renașterii Naționale'*

### `ROM_ROY_02` - Royal Guard Regiments
Verified Guard regiments (keys 1-4) followed by extrapolated numbered Guard regiments with royal patrons (keys 7-12, so that Regimentul 6 Gardă stays the real one). Gated: `has_government = neutrality`.

*Regimentul 6 Gardă 'Mihai Viteazul'*; *Regimentul 1/2 Vânători de Gardă 'Regina Elisabeta a Greciei'*; *Regimentul 2/9 Vânători de Gardă 'Regele Alexandru I al Iugoslaviei'*; *Garda Regală Călare*; *Regimentul 7 Gardă 'Regina Maria'*; *Regimentul 8 Gardă 'Regele Carol al II-lea'*; *Regimentul 9 Gardă 'Regele Ferdinand I'*; *Regimentul 10 Gardă 'Principele Mihai'*; *Regimentul 11 Gardă 'Regele Mihai I'*; *Regimentul 12 Gardă 'Regele Carol I'*

### `ROM_STR_01` - Straja Țării Legions
Straja Țării, Carol II's national youth organization (1935; compulsory from 1938). A legion was the county level; the honorifics are the ten ținuturi created in 1938, and key 11 is the national falanga. Gated: `has_government = neutrality`.

*Legiunea 1 Straja Țării 'Bucegi'*; *Legiunea 2 Straja Țării 'Dunărea de Jos'*; *Legiunea 3 Straja Țării 'Mării'*; *Legiunea 4 Straja Țării 'Nistru'*; *Legiunea 5 Straja Țării 'Olt'*; *Legiunea 6 Straja Țării 'Prut'*; *Legiunea 7 Straja Țării 'Mureș'*; *Legiunea 8 Straja Țării 'Someș'*; *Legiunea 9 Straja Țării 'Suceava'*; *Legiunea 10 Straja Țării 'Timiș'*; *Falanga Straja Țării*

### `ROM_FAS_01` - Legionary Divisions
Legionary Movement (Garda de Fier). Titles after its martyrs, leaders and slogans; extrapolated, since the Legion fielded no divisions. The Antonescu regime used Royal Army titles and is not a separate suite. Gated: `has_government = fascism`.

*Divizia 1 Legionară 'Corneliu Zelea Codreanu'*; *Divizia 2 Legionară 'Ion Moța'*; *Divizia 3 Legionară 'Vasile Marin'*; *Divizia 4 Legionară 'Arhanghelul Mihail'*; *Divizia 5 Legionară 'Horia Sima'*; *Divizia 6 Legionară 'Garda de Fier'*; *Divizia 7 Legionară 'Căpitanul'*; *Divizia 8 Legionară 'Totul pentru Țară'*; *Divizia 9 Legionară 'Frăția de Cruce'*; *Divizia 10 Legionară 'Ion Moța - Vasile Marin'*; *Divizia 11 Legionară 'Ștefan cel Mare'*; *Divizia 12 Legionară 'Mihai Viteazul'*

### `ROM_FAS_02` - Iron Guard Legions
Legionary organizations (keys 1-4) and provincial Iron Guard legions (5-12, extrapolated). Gated: `has_government = fascism`.

*Corpul Muncitoresc Legionar*; *Corpul Legionar 'Ion Moța - Vasile Marin'*; *Legiunea Arhanghelul Mihail*; *Garda Legionară*; *Legiunea 5 Garda de Fier 'Bucovina'*; *Legiunea 6 Garda de Fier 'Basarabia'*; *Legiunea 7 Garda de Fier 'Banat'*; *Legiunea 8 Garda de Fier 'Transilvania'*; *Legiunea 9 Garda de Fier 'Moldova'*; *Legiunea 10 Garda de Fier 'Oltenia'*; *Legiunea 11 Garda de Fier 'Muntenia'*; *Legiunea 12 Garda de Fier 'Dobrogea'*

### `ROM_RED_01` - People's Divisions
Soviet-raised volunteer divisions: Divizia 1 Voluntari 'Tudor Vladimirescu' (1943) and Divizia 2 'Horia, Cloșca și Crișan' (1945) are real; the rest follow their naming (peasant-revolt leaders, 1848, the 1933 Grivița strike, 23 August 1944). Gated: `has_government = communism`.

*Divizia 1 Voluntari 'Tudor Vladimirescu'*; *Divizia 2 Voluntari 'Horia, Cloșca și Crișan'*; *Divizia 3 Voluntari 'Gheorghe Doja'*; *Divizia 4 Voluntari 'Nicolae Bălcescu'*; *Divizia 5 Voluntari '23 August'*; *Divizia 6 Voluntari 'Grivița'*; *Divizia 7 Voluntari 'Debrețin'*; *Divizia 8 Voluntari 'Târgu Mureș'*; *Divizia 9 Voluntari 'Ilie Pintilie'*; *Divizia 10 Voluntari 'Vasile Roaită'*; *Divizia 11 Voluntari 'Avram Iancu'*

### `ROM_RED_02` - People's Armored Divisions
Tancuri is the People's Army word for armour. Divizia 6 Tancuri 'Horia, Cloșca și Crișan' (Târgu Mureș) and the 37th Mechanized Division (ex-'Tudor Vladimirescu') are real; the rest is extrapolated. Gated: `has_government = communism`.

*Divizia 1 Tancuri 'Tudor Vladimirescu'*; *Divizia 2 Tancuri 'Grivița'*; *Divizia 3 Tancuri '23 August'*; *Divizia 4 Tancuri 'Debrețin'*; *Divizia 5 Tancuri 'Gheorghe Doja'*; *Divizia 6 Tancuri 'Horia, Cloșca și Crișan'*; *Divizia 7 Tancuri 'Nicolae Bălcescu'*; *Divizia 8 Tancuri 'Ilie Pintilie'*; *Divizia 9 Tancuri 'Târgu Mureș'*; *Divizia 10 Tancuri 'Vasile Roaită'*; *Divizia 37 Mecanizată 'Tudor Vladimirescu'*

### `ROM_RED_03` - Patriotic Guards
Gărzile Patriotice, the armed worker detachments of summer 1944. Factory names are extrapolated from Bucharest and provincial works. Gated: `has_government = communism`.

*Garda Patriotică 1 'Grivița'*; *Garda Patriotică 2 'Malaxa'*; *Garda Patriotică 3 'Vulcan'*; *Garda Patriotică 4 'Lemaitre'*; *Garda Patriotică 5 'IAR Brașov'*; *Garda Patriotică 6 'Reșița'*; *Garda Patriotică 7 'Hunedoara'*; *Garda Patriotică 8 'Astra Română'*; *Garda Patriotică 9 'Valea Jiului'*; *Garda Patriotică 10 'Câmpina'*

### `ROM_DEM_01` - Volunteer Divisions
Romania starts in 1936 under a democratic government. The 1917-18 volunteer corps (Darnița, Siberia, Italy) and the civic leaders of the National Peasant and Liberal parties; extrapolated as division titles. Gated: `has_government = democratic`.

*Divizia 1 Voluntari 'Darnița'*; *Divizia 2 Voluntari 'Siberia'*; *Divizia 3 Voluntari 'Italia'*; *Divizia 4 Voluntari 'Transilvania'*; *Divizia 5 Voluntari 'Bucovina'*; *Divizia 6 Voluntari 'Alba Iulia'*; *Divizia 7 Voluntari 'Marea Unire'*; *Divizia 8 Voluntari 'Mărășești'*; *Divizia 9 Voluntari 'Iuliu Maniu'*; *Divizia 10 Voluntari 'Ion C. Brătianu'*; *Divizia 11 Voluntari 'Take Ionescu'*; *Divizia 12 Voluntari 'Nicolae Iorga'*

### `ROM_DEM_02` - National Guard Regiments
Civic guards of the 1848 revolution (Islaz, Dealul Spirii) and the Gărzile Naționale of 1918, by city; extrapolated. Gated: `has_government = democratic`.

*Regimentul 1 Garda Națională 'București'*; *Regimentul 2 Garda Națională 'Iași'*; *Regimentul 3 Garda Națională 'Craiova'*; *Regimentul 4 Garda Națională 'Brașov'*; *Regimentul 5 Garda Națională 'Cluj'*; *Regimentul 6 Garda Națională 'Cernăuți'*; *Regimentul 7 Garda Națională 'Chișinău'*; *Regimentul 8 Garda Națională 'Timișoara'*; *Regimentul 9 Garda Națională 'Islaz'*; *Regimentul 10 Garda Națională 'Dealul Spirii'*; *Regimentul 11 Garda Națională 'Padeș'*; *Regimentul 12 Garda Națională 'Oltenia'*
````

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
- **Proofread**: `inex-code-reviewer` was dispatched with all 348 authored names, the language (Romanian, comma-below diacritics) and the extrapolation list above. It answered `No issues found`. It made a single tool call and no web lookups, so this is a language-knowledge pass, not a source check; the unverified titles stay on "Author confirmation".
- **Mechanical checks**: the batch ran to `Dry run OK` (29 groups, 348 names). A throwaway copy of the repo with the batch applied audited as `GROUPS=29 AUTHORED=348/348 FLAGS=1` (the INFO `NAME_LONG` above); no `LOW_DEPTH`, placeholder or duplicate flags. The repo itself was not touched.

## Outcome
- Date: 2026-10-02
- `-Check ROM`: `Check passed` (Validate: OK; Tests: 373 Passed, 0 Failed, 0 Skipped; GROUPS=29 AUTHORED=348/348 FLAGS=1 [NAME_LONG x1 on ROM_ROY_02, as expected in Kept on judgment]).
- Deviations: None in namelists or docs payload. Under user authorization, added missing `Get-PlanBatchBlocks` and `Get-PlanReadinessWarnings` helper function imports to `tests/BuildScript.Tests.ps1`'s `BeforeAll` block to resolve the test failure in `Invoke-Check`.

## Edit batch
Applied by `build.ps1 -EditNames ROM -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{"newFile": true, "header": "Division template historical names system for Romania (ROM).\nImmersive Namelists Expanded (INEX)\nRomanian titles follow the Army's own order: definite noun, Arabic number, arm (Divizia 6 Infanterie), with comma-below diacritics.\nOverrides all nine vanilla ROM groups (INF, CAV, MOT, ARM, MEC, GAR, MAR, MTN, PAR), which were stubs without diacritics."}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_INF_01",
  "selector": "Infantry Divisions",
  "addType": "infantry",
  "fallback": "Divizia %d Infanterie",
  "comment": "# ===== Field divisions =====\n\nOverrides vanilla ROM_INF_01 as the plain variant. The Army wrote the definite noun before the number (Divizia 6 Infanterie), unlike vanilla's Divizie %d Infanterie. Vanilla's Guard, fortification and border literals move to ROM_ROY_01, ROM_FOR_01 and ROM_BOR_01."
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_INF_02",
  "selector": "Infantry Divisions (Named)",
  "addType": "infantry",
  "fallback": "Divizia %d Infanterie",
  "link": "ROM_INF_01",
  "comment": "Named variant of ROM_INF_01; shares its numbering. Interwar Romanian divisions carried no honorifics, so the titles are extrapolated: garrison towns of the numbered divisions, regimental patrons, battles of 1916-17, rulers and provinces.",
  "add": [
    "# Peacetime divisions 1-21",
    "1=Divizia %d Infanterie 'Mihai Viteazul'",
    "2=Divizia %d Infanterie 'Craiova'",
    "3=Divizia %d Infanterie 'Pitești'",
    "4=Divizia %d Infanterie 'București'",
    "5=Divizia %d Infanterie 'Ștefan cel Mare'",
    "6=Divizia %d Infanterie 'Mărășești'",
    "7=Divizia %d Infanterie 'Roman'",
    "8=Divizia %d Infanterie 'Mărăști'",
    "9=Divizia %d Infanterie 'Constanța'",
    "10=Divizia %d Infanterie 'Tulcea'",
    "11=Divizia %d Infanterie 'Slatina'",
    "12=Divizia %d Infanterie 'Banat'",
    "13=Divizia %d Infanterie 'Prahova'",
    "14=Divizia %d Infanterie 'Oituz'",
    "15=Divizia %d Infanterie 'Mircea cel Bătrân'",
    "16=Divizia %d Infanterie 'Cluj'",
    "17=Divizia %d Infanterie 'Matei Basarab'",
    "18=Divizia %d Infanterie 'Sibiu'",
    "19=Divizia %d Infanterie 'Burebista'",
    "20=Divizia %d Infanterie 'Alba Iulia'",
    "21=Divizia %d Infanterie 'Dimitrie Cantemir'",
    "# Mobilization divisions",
    "22=Divizia %d Infanterie 'Alexandru cel Bun'",
    "23=Divizia %d Infanterie 'Vlad Țepeș'",
    "24=Divizia %d Infanterie 'Constantin Brâncoveanu'",
    "25=Divizia %d Infanterie 'Gorj'",
    "26=Divizia %d Infanterie 'Baia'",
    "27=Divizia %d Infanterie 'Regele Carol I'",
    "28=Divizia %d Infanterie 'Regina Maria'",
    "29=Divizia %d Infanterie 'Mareșal Averescu'",
    "30=Divizia %d Infanterie 'Mareșal Prezan'",
    "31=Divizia %d Infanterie 'General Dragalina'",
    "32=Divizia %d Infanterie 'Podu Înalt'",
    "33=Divizia %d Infanterie 'Jiu'",
    "34=Divizia %d Infanterie 'Moldova'",
    "35=Divizia %d Infanterie 'Dobrogea'",
    "36=Divizia %d Infanterie 'Bucovina'",
    "37=Divizia %d Infanterie 'Basarabia'",
    "38=Divizia %d Infanterie 'Transilvania'",
    "39=Divizia %d Infanterie 'Crișana'",
    "40=Divizia %d Infanterie 'Maramureș'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_MOT_01",
  "selector": "Motorized Divisions",
  "addType": "motorized",
  "fallback": "Divizia %d Motorizată",
  "link": "ROM_INF_01",
  "comment": "Overrides vanilla ROM_MOT_01 as the plain variant (vanilla's masculine Motomecanizat on a feminine Divizie is replaced). Anchor of the mobile numbering family."
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_MOT_02",
  "selector": "Motorized Divisions (Named)",
  "addType": "motorized",
  "fallback": "Divizia %d Motorizată",
  "link": "ROM_MOT_01",
  "comment": "Named variant of ROM_MOT_01; shares its numbering. Extrapolated: Romania fielded one motorized division before 1941. Rivers, towns and provinces of the plains.",
  "add": [
    "1=Divizia %d Motorizată 'Târgoviște'",
    "2=Divizia %d Motorizată 'Prahova'",
    "3=Divizia %d Motorizată 'Dunărea'",
    "4=Divizia %d Motorizată 'Olt'",
    "5=Divizia %d Motorizată 'Mihai Viteazul'",
    "6=Divizia %d Motorizată 'Brăila'",
    "7=Divizia %d Motorizată 'Ploiești'",
    "8=Divizia %d Motorizată 'Burebista'",
    "9=Divizia %d Motorizată 'Basarabia'",
    "10=Divizia %d Motorizată 'Tecuci'",
    "11=Divizia %d Motorizată 'Carpați'",
    "12=Divizia %d Motorizată 'Ialomița'",
    "13=Divizia %d Motorizată 'Teleorman'",
    "14=Divizia %d Motorizată 'Vedea'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_MEC_01",
  "selector": "Mechanized Divisions",
  "addType": "mechanized",
  "fallback": "Divizia %d Mecanizată",
  "link": "ROM_MOT_01",
  "comment": "Overrides vanilla ROM_MEC_01 as the plain variant. Anchored on ROM_MOT_01 for shared numbering; vanilla linked ROM_INF_01."
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_MEC_02",
  "selector": "Mechanized Divisions (Named)",
  "addType": "mechanized",
  "fallback": "Divizia %d Mecanizată",
  "link": "ROM_MOT_01",
  "comment": "Named variant of ROM_MEC_01; shares the mobile numbering. Extrapolated: battles of 1917, frontier rivers and provinces.",
  "add": [
    "1=Divizia %d Mecanizată 'Mărășești'",
    "2=Divizia %d Mecanizată 'Podu Înalt'",
    "3=Divizia %d Mecanizată 'Mărăști'",
    "4=Divizia %d Mecanizată 'Oituz'",
    "5=Divizia %d Mecanizată 'Jiu'",
    "6=Divizia %d Mecanizată 'Dobrogea'",
    "7=Divizia %d Mecanizată 'Moldova'",
    "8=Divizia %d Mecanizată 'Siret'",
    "9=Divizia %d Mecanizată 'Prut'",
    "10=Divizia %d Mecanizată 'Argeș'",
    "11=Divizia %d Mecanizată 'Banat'",
    "12=Divizia %d Mecanizată 'Dâmbovița'",
    "13=Divizia %d Mecanizată 'Mureș'",
    "14=Divizia %d Mecanizată 'Someș'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_ARM_01",
  "selector": "Armored Divisions",
  "addType": "light_armor medium_armor heavy_armor modern_armor",
  "fallback": "Divizia %d Blindată",
  "comment": "Overrides vanilla ROM_ARM_01 as the plain variant (Armura becomes the Army's own Blindată)."
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_ARM_02",
  "selector": "Armored Divisions (Named)",
  "addType": "light_armor medium_armor heavy_armor modern_armor",
  "fallback": "Divizia %d Blindată",
  "link": "ROM_ARM_01",
  "comment": "Named variant of ROM_ARM_01; shares its numbering. Key 1 is the real 1st Armoured Division 'România Mare' (1944); the rest is extrapolated, since no second armoured division existed.",
  "add": [
    "1=Divizia %d Blindată 'România Mare'",
    "2=Divizia %d Blindată 'Târgoviște'",
    "3=Divizia %d Blindată 'Mihai Viteazul'",
    "4=Divizia %d Blindată 'Ștefan cel Mare'",
    "5=Divizia %d Blindată 'Oituz'",
    "6=Divizia %d Blindată 'Mărășești'",
    "7=Divizia %d Blindată 'Vlad Țepeș'",
    "8=Divizia %d Blindată 'Mircea cel Bătrân'",
    "9=Divizia %d Blindată 'Dacia'",
    "10=Divizia %d Blindată 'Burebista'",
    "11=Divizia %d Blindată 'Decebal'",
    "12=Divizia %d Blindată 'Unirea Principatelor'",
    "13=Divizia %d Blindată 'Alexandru Ioan Cuza'",
    "14=Divizia %d Blindată 'Dimitrie Cantemir'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_CAV_01",
  "selector": "Cavalry Divisions",
  "addType": "cavalry",
  "fallback": "Divizia %d Cavalerie",
  "comment": "# ===== Cavalry =====\n\nOverrides vanilla ROM_CAV_01. Cavalry brigades became numbered divisions on 15 March 1942 (real numbers 1, 5, 6, 7, 8, 9). Honorifics are extrapolated.",
  "add": [
    "1=Divizia %d Cavalerie 'Regele Ferdinand I'",
    "2=Divizia %d Cavalerie 'Muntenia'",
    "3=Divizia %d Cavalerie 'Oltenia'",
    "4=Divizia %d Cavalerie 'Banat'",
    "5=Divizia %d Cavalerie 'Botoșani'",
    "6=Divizia %d Cavalerie 'Mihai Viteazul'",
    "7=Divizia %d Cavalerie 'Dobrogea'",
    "8=Divizia %d Cavalerie 'Ștefan cel Mare'",
    "9=Divizia %d Cavalerie 'Basarabia'",
    "10=Divizia %d Cavalerie 'Transilvania'",
    "11=Divizia %d Cavalerie 'Bucovina'",
    "12=Divizia %d Cavalerie 'Crișana'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_CAV_02",
  "selector": "Cavalry Brigades",
  "addType": "cavalry",
  "fallback": "Brigada %d Cavalerie",
  "link": "ROM_CAV_01",
  "comment": "Cavalry brigades of 1939-42 (real numbers 1, 5, 6, 7, 8, 9; Brigada 5 held Botoșani and Brigada 7 Bazargic). Shares numbering with ROM_CAV_01. Honorifics are extrapolated.",
  "add": [
    "1=Brigada %d Cavalerie 'Regina Maria'",
    "2=Brigada %d Cavalerie 'Iași'",
    "3=Brigada %d Cavalerie 'Bârlad'",
    "4=Brigada %d Cavalerie 'Craiova'",
    "5=Brigada %d Cavalerie 'Botoșani'",
    "6=Brigada %d Cavalerie 'Caracal'",
    "7=Brigada %d Cavalerie 'Bazargic'",
    "8=Brigada %d Cavalerie 'Bacău'",
    "9=Brigada %d Cavalerie 'Dorohoi'",
    "10=Brigada %d Cavalerie 'Roman'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_CAV_03",
  "selector": "Cavalry Regiments",
  "addType": "cavalry",
  "fallback": "Regimentul %d Călărași",
  "comment": "The peacetime cavalry arm: Roșiori 1-12 and Călărași 1-13 (26 regiments with the Garda Regală Călare, which sits in ROM_ROY_02). Regimental numbers are real; Botoșani (8 Roșiori) and Bazargic (12 Roșiori) are attested garrisons and every other honorific is extrapolated. Keys 13-25 carry the Călărași numbers as literals and the interwar counties that raised them.",
  "add": [
    "1=Regimentul %d Roșiori 'Regele Ferdinand I'",
    "2=Regimentul %d Roșiori 'Regina Maria'",
    "3=Regimentul %d Roșiori 'Principele Nicolae'",
    "4=Regimentul %d Roșiori 'Mihai Viteazul'",
    "5=Regimentul %d Roșiori 'Ștefan cel Mare'",
    "6=Regimentul %d Roșiori 'Iași'",
    "7=Regimentul %d Roșiori 'Craiova'",
    "8=Regimentul %d Roșiori 'Botoșani'",
    "9=Regimentul %d Roșiori 'Bârlad'",
    "10=Regimentul %d Roșiori 'Caracal'",
    "11=Regimentul %d Roșiori 'Regele Carol I'",
    "12=Regimentul %d Roșiori 'Bazargic'",
    "13=Regimentul 1 Călărași 'Ialomița'",
    "14=Regimentul 2 Călărași 'Teleorman'",
    "15=Regimentul 3 Călărași 'Vlașca'",
    "16=Regimentul 4 Călărași 'Dolj'",
    "17=Regimentul 5 Călărași 'Mehedinți'",
    "18=Regimentul 6 Călărași 'Gorj'",
    "19=Regimentul 7 Călărași 'Argeș'",
    "20=Regimentul 8 Călărași 'Olt'",
    "21=Regimentul 9 Călărași 'Romanați'",
    "22=Regimentul 10 Călărași 'Vaslui'",
    "23=Regimentul 11 Călărași 'Fălciu'",
    "24=Regimentul 12 Călărași 'Tutova'",
    "25=Regimentul 13 Călărași 'Putna'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_MTN_01",
  "selector": "Mountain Brigades",
  "addType": "mountaineers",
  "fallback": "Brigada %d Mixtă Munte",
  "comment": "# ===== Mountain troops =====\n\nOverrides vanilla ROM_MTN_01 (word order was Munte Mixtă). Brigada 1-3 Mixtă Munte formed in 1937 and Brigada 4 on 20 June 1939 (HQ Aiud); 5-8 are extrapolated. Honorifics are Carpathian massifs and garrisons (Brașov, Aiud).",
  "add": [
    "1=Brigada %d Mixtă Munte 'Bucegi'",
    "2=Brigada %d Mixtă Munte 'Brașov'",
    "3=Brigada %d Mixtă Munte 'Făgăraș'",
    "4=Brigada %d Mixtă Munte 'Aiud'",
    "5=Brigada %d Mixtă Munte 'Rodna'",
    "6=Brigada %d Mixtă Munte 'Retezat'",
    "7=Brigada %d Mixtă Munte 'Parâng'",
    "8=Brigada %d Mixtă Munte 'Ceahlău'",
    "9=Brigada %d Mixtă Munte 'Cindrel'",
    "10=Brigada %d Mixtă Munte 'Vrancea'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_MTN_02",
  "selector": "Mountain Divisions",
  "addType": "mountaineers",
  "fallback": "Divizia %d Vânători de Munte",
  "link": "ROM_MTN_01",
  "comment": "Divizia 4 Vânători de Munte is attested for 1942; the series is extrapolated from the Army's mountain-troop terms. Shares numbering with ROM_MTN_01.",
  "add": [
    "1=Divizia %d Vânători de Munte 'Carpați'",
    "2=Divizia %d Vânători de Munte 'Sarmizegetusa'",
    "3=Divizia %d Vânători de Munte 'Piatra Craiului'",
    "4=Divizia %d Vânători de Munte 'Postăvarul'",
    "5=Divizia %d Vânători de Munte 'Semenic'",
    "6=Divizia %d Vânători de Munte 'Căliman'",
    "7=Divizia %d Vânători de Munte 'Hășmaș'",
    "8=Divizia %d Vânători de Munte 'Penteleu'",
    "9=Divizia %d Vânători de Munte 'Ciucaș'",
    "10=Divizia %d Vânători de Munte 'Apuseni'",
    "11=Divizia %d Vânători de Munte 'Vrancea'",
    "12=Divizia %d Vânători de Munte 'Cozia'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_MAR_01",
  "selector": "Marine Divisions",
  "addType": "marine",
  "fallback": "Regimentul %d Infanterie Marină",
  "comment": "# ===== Marines and paratroopers =====\n\nOverrides vanilla ROM_MAR_01 (Marinar means sailor; the corps was Infanterie Marină). The Batalionul de Infanterie Marină was raised on 1 April 1940 and became a regiment at Brăila.",
  "add": [
    "1=Regimentul %d Infanterie Marină 'Brăila'",
    "2=Regimentul %d Infanterie Marină 'Dunărea'",
    "3=Regimentul %d Infanterie Marină 'Marea Neagră'",
    "4=Regimentul %d Infanterie Marină 'Constanța'",
    "5=Regimentul %d Infanterie Marină 'Mangalia'",
    "6=Regimentul %d Infanterie Marină 'Sulina'",
    "7=Regimentul %d Infanterie Marină 'Galați'",
    "8=Regimentul %d Infanterie Marină 'Tulcea'",
    "9=Regimentul %d Infanterie Marină 'Delta Dunării'",
    "10=Regimentul %d Infanterie Marină 'Mircea cel Bătrân'",
    "11=Batalionul 1 Infanterie Marină"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_PAR_01",
  "selector": "Paratrooper Divisions",
  "addType": "paratrooper",
  "fallback": "Batalionul %d Parașutiști",
  "comment": "Overrides vanilla ROM_PAR_01 (Parasutisti lacked its diacritics). Romanian paratroopers were brevetted on 1 October 1941 and the first battalion formed in 1942. Honorifics are extrapolated.",
  "add": [
    "1=Batalionul %d Parașutiști 'Aeronautica Regală'",
    "2=Batalionul %d Parașutiști 'Mihai Viteazul'",
    "3=Batalionul %d Parașutiști 'Burebista'",
    "4=Batalionul %d Parașutiști 'Decebal'",
    "5=Batalionul %d Parașutiști 'Dobrogea'",
    "6=Batalionul %d Parașutiști 'Carpați'",
    "7=Batalionul %d Parașutiști 'Ștefan cel Mare'",
    "8=Batalionul %d Parașutiști 'Regele Mihai I'",
    "9=Batalionul %d Parașutiști 'Moldova'",
    "10=Batalionul %d Parașutiști 'Transilvania'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_GAR_01",
  "selector": "Garrison Divisions",
  "addType": "infantry",
  "fallback": "Divizia %d Pază",
  "comment": "# ===== Territorial and security =====\n\nOverrides vanilla ROM_GAR_01 (Paza lacked its diacritic). Keys 1-12 are extrapolated garrison and rear-area titles of the cities and occupied provinces; keys 13 and 14 are attested wartime formations (Divizia 1 Instrucție, Divizia 35 Rezervă).",
  "add": [
    "1=Divizia %d Pază 'București'",
    "2=Divizia %d Pază 'Ploiești'",
    "3=Divizia %d Pază 'Constanța'",
    "4=Divizia %d Pază 'Brăila'",
    "5=Divizia %d Pază 'Galați'",
    "6=Divizia %d Pază 'Iași'",
    "7=Divizia %d Pază 'Chișinău'",
    "8=Divizia %d Pază 'Cernăuți'",
    "9=Divizia %d Pază 'Cluj'",
    "10=Divizia %d Pază 'Timișoara'",
    "11=Divizia %d Pază 'Sibiu'",
    "12=Divizia %d Pază 'Craiova'",
    "13=Divizia 1 Instrucție",
    "14=Divizia 35 Rezervă"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_FOR_01",
  "selector": "Fortified Sectors",
  "addType": "infantry",
  "fallback": "Sectorul Fortificat %d",
  "comment": "Sectors of the Focșani-Nămoloasa-Galați line and the frontier works; sector numbering is extrapolated. Key 10 keeps vanilla's Divizia 1 Fortificații literal with its diacritics.",
  "add": [
    "1=Sectorul Fortificat %d 'Focșani'",
    "2=Sectorul Fortificat %d 'Nămoloasa'",
    "3=Sectorul Fortificat %d 'Galați'",
    "4=Sectorul Fortificat %d 'Siret'",
    "5=Sectorul Fortificat %d 'Prut'",
    "6=Sectorul Fortificat %d 'Dobrogea'",
    "7=Sectorul Fortificat %d 'Oltenia'",
    "8=Sectorul Fortificat %d 'Maramureș'",
    "9=Sectorul Fortificat %d 'Linia Carol al II-lea'",
    "10=Divizia 1 Fortificații",
    "11=Sectorul Fortificat %d 'Cernavodă'",
    "12=Sectorul Fortificat %d 'Turtucaia'",
    "13=Sectorul Fortificat %d 'Tisa'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_BOR_01",
  "selector": "Border Guard Brigades",
  "addType": "infantry",
  "fallback": "Brigada %d Grăniceri",
  "comment": "Border troops (Grăniceri) by frontier; the brigade titles are extrapolated, as the Army's exact border-guard wording was not confirmed. Key 13 keeps vanilla's Divizia 1 Grăniceri literal with its diacritic.",
  "add": [
    "1=Brigada %d Grăniceri 'Nistru'",
    "2=Brigada %d Grăniceri 'Prut'",
    "3=Brigada %d Grăniceri 'Tisa'",
    "4=Brigada %d Grăniceri 'Dunărea'",
    "5=Brigada %d Grăniceri 'Carpați'",
    "6=Brigada %d Grăniceri 'Bucovina'",
    "7=Brigada %d Grăniceri 'Maramureș'",
    "8=Brigada %d Grăniceri 'Dobrogea'",
    "9=Brigada %d Grăniceri 'Bugeac'",
    "10=Brigada %d Grăniceri 'Banat'",
    "11=Brigada %d Grăniceri 'Oltenia'",
    "12=Brigada %d Grăniceri 'Cerna'",
    "13=Divizia 1 Grăniceri"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_JAN_01",
  "selector": "Gendarmerie Legions",
  "addType": "infantry",
  "fallback": "Legiunea %d Jandarmi",
  "comment": "Gendarmerie (Jandarmeria): Brigada I-IV at Bucharest, Iași, Chișinău and Cluj, and county legions. The eleven legions of the 'Bucegi' regional inspectorate (1938) are verified; the other counties follow the pattern.",
  "add": [
    "1=Brigada %d Jandarmi 'București'",
    "2=Brigada %d Jandarmi 'Iași'",
    "3=Brigada %d Jandarmi 'Chișinău'",
    "4=Brigada %d Jandarmi 'Cluj'",
    "5=Legiunea de Jandarmi Ilfov",
    "6=Legiunea de Jandarmi Teleorman",
    "7=Legiunea de Jandarmi Argeș",
    "8=Legiunea de Jandarmi Muscel",
    "9=Legiunea de Jandarmi Dâmbovița",
    "10=Legiunea de Jandarmi Prahova",
    "11=Legiunea de Jandarmi Vlașca",
    "12=Legiunea de Jandarmi Buzău",
    "13=Legiunea de Jandarmi Brașov",
    "14=Legiunea de Jandarmi Trei Scaune",
    "15=Legiunea de Jandarmi București",
    "16=Legiunea de Jandarmi Cluj",
    "17=Legiunea de Jandarmi Iași",
    "18=Legiunea de Jandarmi Sibiu",
    "19=Legiunea de Jandarmi Constanța",
    "20=Legiunea de Jandarmi Timiș-Torontal",
    "21=Legiunea de Jandarmi Mureș",
    "22=Legiunea de Jandarmi Bihor",
    "23=Legiunea de Jandarmi Dolj"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_ROY_01",
  "selector": "Royal Guard Divisions",
  "addType": "infantry",
  "fallback": "Divizia %d Gardă",
  "canUse": "has_government = neutrality",
  "comment": "# ===== Royal tradition (neutrality) =====\n\nRoyal dictatorship of Carol II and the Crown. Divizia 1 Gardă (1941-45) is real; the honorific series is extrapolated from royal patrons.",
  "add": [
    "1=Divizia %d Gardă 'Regele Carol al II-lea'",
    "2=Divizia %d Gardă 'Regele Mihai I'",
    "3=Divizia %d Gardă 'Mihai Viteazul'",
    "4=Divizia %d Gardă 'Regele Ferdinand I Întregitorul'",
    "5=Divizia %d Gardă 'Regina Maria'",
    "6=Divizia %d Gardă 'Regele Carol I'",
    "7=Divizia %d Gardă 'Marele Voievod Mihai de Alba Iulia'",
    "8=Divizia %d Gardă 'Regina Elisabeta'",
    "9=Divizia %d Gardă 'Principele Nicolae'",
    "10=Divizia %d Gardă 'Ștefan cel Mare'",
    "11=Divizia %d Gardă 'Regina-Mamă Elena'",
    "12=Divizia %d Gardă 'Frontul Renașterii Naționale'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_ROY_02",
  "selector": "Royal Guard Regiments",
  "addType": "infantry",
  "fallback": "Regimentul %d Gardă",
  "canUse": "has_government = neutrality",
  "comment": "Verified Guard regiments (keys 1-4) followed by extrapolated numbered Guard regiments with royal patrons (keys 7-12, so that Regimentul 6 Gardă stays the real one).",
  "add": [
    "1=Regimentul 6 Gardă 'Mihai Viteazul'",
    "2=Regimentul 1/2 Vânători de Gardă 'Regina Elisabeta a Greciei'",
    "3=Regimentul 2/9 Vânători de Gardă 'Regele Alexandru I al Iugoslaviei'",
    "4=Garda Regală Călare",
    "7=Regimentul %d Gardă 'Regina Maria'",
    "8=Regimentul %d Gardă 'Regele Carol al II-lea'",
    "9=Regimentul %d Gardă 'Regele Ferdinand I'",
    "10=Regimentul %d Gardă 'Principele Mihai'",
    "11=Regimentul %d Gardă 'Regele Mihai I'",
    "12=Regimentul %d Gardă 'Regele Carol I'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_STR_01",
  "selector": "Straja Țării Legions",
  "addType": "militia",
  "fallback": "Legiunea %d Straja Țării",
  "canUse": "has_government = neutrality",
  "comment": "Straja Țării, Carol II's national youth organization (1935; compulsory from 1938). A legion was the county level; the honorifics are the ten ținuturi created in 1938, and key 11 is the national falanga.",
  "add": [
    "1=Legiunea %d Straja Țării 'Bucegi'",
    "2=Legiunea %d Straja Țării 'Dunărea de Jos'",
    "3=Legiunea %d Straja Țării 'Mării'",
    "4=Legiunea %d Straja Țării 'Nistru'",
    "5=Legiunea %d Straja Țării 'Olt'",
    "6=Legiunea %d Straja Țării 'Prut'",
    "7=Legiunea %d Straja Țării 'Mureș'",
    "8=Legiunea %d Straja Țării 'Someș'",
    "9=Legiunea %d Straja Țării 'Suceava'",
    "10=Legiunea %d Straja Țării 'Timiș'",
    "11=Falanga Straja Țării"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_FAS_01",
  "selector": "Legionary Divisions",
  "addType": "infantry",
  "fallback": "Divizia %d Legionară",
  "canUse": "has_government = fascism",
  "comment": "# ===== Iron Guard (fascism) =====\n\nLegionary Movement (Garda de Fier). Titles after its martyrs, leaders and slogans; extrapolated, since the Legion fielded no divisions. The Antonescu regime used Royal Army titles and is not a separate suite.",
  "add": [
    "1=Divizia %d Legionară 'Corneliu Zelea Codreanu'",
    "2=Divizia %d Legionară 'Ion Moța'",
    "3=Divizia %d Legionară 'Vasile Marin'",
    "4=Divizia %d Legionară 'Arhanghelul Mihail'",
    "5=Divizia %d Legionară 'Horia Sima'",
    "6=Divizia %d Legionară 'Garda de Fier'",
    "7=Divizia %d Legionară 'Căpitanul'",
    "8=Divizia %d Legionară 'Totul pentru Țară'",
    "9=Divizia %d Legionară 'Frăția de Cruce'",
    "10=Divizia %d Legionară 'Ion Moța - Vasile Marin'",
    "11=Divizia %d Legionară 'Ștefan cel Mare'",
    "12=Divizia %d Legionară 'Mihai Viteazul'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_FAS_02",
  "selector": "Iron Guard Legions",
  "addType": "infantry militia",
  "fallback": "Legiunea %d Garda de Fier",
  "canUse": "has_government = fascism",
  "comment": "Legionary organizations (keys 1-4) and provincial Iron Guard legions (5-12, extrapolated).",
  "add": [
    "1=Corpul Muncitoresc Legionar",
    "2=Corpul Legionar 'Ion Moța - Vasile Marin'",
    "3=Legiunea Arhanghelul Mihail",
    "4=Garda Legionară",
    "5=Legiunea %d Garda de Fier 'Bucovina'",
    "6=Legiunea %d Garda de Fier 'Basarabia'",
    "7=Legiunea %d Garda de Fier 'Banat'",
    "8=Legiunea %d Garda de Fier 'Transilvania'",
    "9=Legiunea %d Garda de Fier 'Moldova'",
    "10=Legiunea %d Garda de Fier 'Oltenia'",
    "11=Legiunea %d Garda de Fier 'Muntenia'",
    "12=Legiunea %d Garda de Fier 'Dobrogea'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_RED_01",
  "selector": "People's Divisions",
  "addType": "infantry",
  "fallback": "Divizia %d Voluntari",
  "canUse": "has_government = communism",
  "comment": "# ===== People's Army (communism) =====\n\nSoviet-raised volunteer divisions: Divizia 1 Voluntari 'Tudor Vladimirescu' (1943) and Divizia 2 'Horia, Cloșca și Crișan' (1945) are real; the rest follow their naming (peasant-revolt leaders, 1848, the 1933 Grivița strike, 23 August 1944).",
  "add": [
    "1=Divizia %d Voluntari 'Tudor Vladimirescu'",
    "2=Divizia %d Voluntari 'Horia, Cloșca și Crișan'",
    "3=Divizia %d Voluntari 'Gheorghe Doja'",
    "4=Divizia %d Voluntari 'Nicolae Bălcescu'",
    "5=Divizia %d Voluntari '23 August'",
    "6=Divizia %d Voluntari 'Grivița'",
    "7=Divizia %d Voluntari 'Debrețin'",
    "8=Divizia %d Voluntari 'Târgu Mureș'",
    "9=Divizia %d Voluntari 'Ilie Pintilie'",
    "10=Divizia %d Voluntari 'Vasile Roaită'",
    "11=Divizia %d Voluntari 'Avram Iancu'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_RED_02",
  "selector": "People's Armored Divisions",
  "addType": "mechanized light_armor medium_armor heavy_armor modern_armor",
  "fallback": "Divizia %d Tancuri",
  "canUse": "has_government = communism",
  "comment": "Tancuri is the People's Army word for armour. Divizia 6 Tancuri 'Horia, Cloșca și Crișan' (Târgu Mureș) and the 37th Mechanized Division (ex-'Tudor Vladimirescu') are real; the rest is extrapolated.",
  "add": [
    "1=Divizia %d Tancuri 'Tudor Vladimirescu'",
    "2=Divizia %d Tancuri 'Grivița'",
    "3=Divizia %d Tancuri '23 August'",
    "4=Divizia %d Tancuri 'Debrețin'",
    "5=Divizia %d Tancuri 'Gheorghe Doja'",
    "6=Divizia %d Tancuri 'Horia, Cloșca și Crișan'",
    "7=Divizia %d Tancuri 'Nicolae Bălcescu'",
    "8=Divizia %d Tancuri 'Ilie Pintilie'",
    "9=Divizia %d Tancuri 'Târgu Mureș'",
    "10=Divizia %d Tancuri 'Vasile Roaită'",
    "37=Divizia %d Mecanizată 'Tudor Vladimirescu'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_RED_03",
  "selector": "Patriotic Guards",
  "addType": "militia",
  "fallback": "Garda Patriotică %d",
  "canUse": "has_government = communism",
  "comment": "Gărzile Patriotice, the armed worker detachments of summer 1944. Factory names are extrapolated from Bucharest and provincial works.",
  "add": [
    "1=Garda Patriotică %d 'Grivița'",
    "2=Garda Patriotică %d 'Malaxa'",
    "3=Garda Patriotică %d 'Vulcan'",
    "4=Garda Patriotică %d 'Lemaitre'",
    "5=Garda Patriotică %d 'IAR Brașov'",
    "6=Garda Patriotică %d 'Reșița'",
    "7=Garda Patriotică %d 'Hunedoara'",
    "8=Garda Patriotică %d 'Astra Română'",
    "9=Garda Patriotică %d 'Valea Jiului'",
    "10=Garda Patriotică %d 'Câmpina'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_DEM_01",
  "selector": "Volunteer Divisions",
  "addType": "infantry",
  "fallback": "Divizia %d Voluntari",
  "canUse": "has_government = democratic",
  "comment": "# ===== Civic and volunteer tradition (democratic) =====\n\nRomania starts in 1936 under a democratic government. The 1917-18 volunteer corps (Darnița, Siberia, Italy) and the civic leaders of the National Peasant and Liberal parties; extrapolated as division titles.",
  "add": [
    "1=Divizia %d Voluntari 'Darnița'",
    "2=Divizia %d Voluntari 'Siberia'",
    "3=Divizia %d Voluntari 'Italia'",
    "4=Divizia %d Voluntari 'Transilvania'",
    "5=Divizia %d Voluntari 'Bucovina'",
    "6=Divizia %d Voluntari 'Alba Iulia'",
    "7=Divizia %d Voluntari 'Marea Unire'",
    "8=Divizia %d Voluntari 'Mărășești'",
    "9=Divizia %d Voluntari 'Iuliu Maniu'",
    "10=Divizia %d Voluntari 'Ion C. Brătianu'",
    "11=Divizia %d Voluntari 'Take Ionescu'",
    "12=Divizia %d Voluntari 'Nicolae Iorga'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ROM_DEM_02",
  "selector": "National Guard Regiments",
  "addType": "infantry militia",
  "fallback": "Regimentul %d Garda Națională",
  "canUse": "has_government = democratic",
  "comment": "Civic guards of the 1848 revolution (Islaz, Dealul Spirii) and the Gărzile Naționale of 1918, by city; extrapolated.",
  "add": [
    "1=Regimentul %d Garda Națională 'București'",
    "2=Regimentul %d Garda Națională 'Iași'",
    "3=Regimentul %d Garda Națională 'Craiova'",
    "4=Regimentul %d Garda Națională 'Brașov'",
    "5=Regimentul %d Garda Națională 'Cluj'",
    "6=Regimentul %d Garda Națională 'Cernăuți'",
    "7=Regimentul %d Garda Națională 'Chișinău'",
    "8=Regimentul %d Garda Națională 'Timișoara'",
    "9=Regimentul %d Garda Națională 'Islaz'",
    "10=Regimentul %d Garda Națională 'Dealul Spirii'",
    "11=Regimentul %d Garda Națională 'Padeș'",
    "12=Regimentul %d Garda Națională 'Oltenia'"
  ]
}
```
