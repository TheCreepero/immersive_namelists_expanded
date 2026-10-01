# Greece

**Country Tag:** `GRE` | **Source File:** [`INEX_GRE_names_divisions.txt`](../common/units/names_divisions/INEX_GRE_names_divisions.txt)

---

## Historical Overview

The Hellenic Army that met the Italian invasion of October 1940 fielded fourteen *Merarchíes Pezikoú* (infantry divisions: I Larissa, II Athens, III Patras, IV Nauplion, V Chania on Crete, VI Serres, VIII in Epirus), one *Merarchía Ippikoú* (cavalry division, Larissa, Trikala and Elassona), three independent brigades and the Army Sections of Epirus and Macedonia. The Metaxas Line forts in Eastern Macedonia, the Dodecanese Regiment, the Pindos Detachment and the 19th Motorized Division of 1941 supply the verified titles. Exile forces (the 1st and 2nd Brigades, the 3rd Mountain Brigade *Rimini*, the Sacred Band), the 1919-22 Army of Asia Minor and the Korean War expeditionary force extend the pattern, as do the Evzone regiments (*1/38*, *2/39*, *3/40*, *5/42*).

INEX replaces all nine vanilla lists, which were stubs of the Roman-numeral form `%s Merarchía ...`. Names are Latin transliterations in the vanilla style (ELOT 743 with stress accents: *Merarchía*, *Taxiarchía*, *Sýntagma*, *Lóchos*). Greek writes the Arabic ordinal with a gendered ending, so fallbacks use `%di` for feminine nouns (*Merarchía*, *Taxiarchía*), `%do` for neuter ones (*Sýntagma*, *Tágma*) and `%dos` for masculine ones (*Lóchos*). Vanilla's *Pezonavton* becomes *Pezonaftón*, *Alexiptotiston* gains its stress mark, and the motorized and mechanized adjectives, which vanilla had swapped, now read *Michanokíniti* (motorized) and *Michanopoiiméni* (mechanized). Infantry, motorized, mechanized and armored divisions come as **plain and Named pairs** that share numbering.

Ideology suites are gated by government type, never by focus. Greece starts under Metaxas, which the game files as `neutrality`, so the **Royal Guard** and Fourth of August titles sit in the neutrality suite. A deliberately thin **National Youth** list (EON) serves fascism, the **ELAS** and **Democratic Army** divisions serve communism, and the Venizelist **National Defence** divisions and **Republican volunteers** serve democratic governments. The Evzones, the Gendarmerie and the Asia Minor Army are open to democratic and neutrality governments. The collaborationist Security Battalions are excluded.

`GRE_INF_01` and `GRE_CAV_01` are referenced by the vanilla Greek focus tree (`common/national_focus/greece.txt`); both are overridden. All nine vanilla tags are overridden.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name | Available To |
|:---|:---|:---|:---|:---|
| `GRE_INF_01` | Infantry Divisions | infantry | `%di Merarchía Pezikoú` | All governments |
| `GRE_CAV_01` | Cavalry Divisions | cavalry | `%di Merarchía Ippikoú` | All governments |
| `GRE_MOT_01` | Motorized Divisions | motorized | `%di Michanokíniti Merarchía` | All governments |
| `GRE_MEC_01` | Mechanized Divisions | mechanized | `%di Michanopoiiméni Merarchía` | All governments |
| `GRE_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%di Tethorakisméni Merarchía` | All governments |
| `GRE_PAR_01` | Paratrooper Divisions | paratrooper | `%di Merarchía Alexiptotistón` | All governments |
| `GRE_MAR_01` | Marine Divisions | marine | `%di Merarchía Pezonaftón` | All governments |
| `GRE_MNT_01` | Mountain Divisions | mountaineers | `%di Oreiní Merarchía` | All governments |
| `GRE_GAR_01` | Garrison Divisions | infantry | `%di Merarchía Frourás` | All governments |
| `GRE_INF_02` | Infantry Divisions (Named) | infantry | `%di Merarchía Pezikoú` | All governments |
| `GRE_MOT_02` | Motorized Divisions (Named) | motorized | `%di Michanokíniti Merarchía` | All governments |
| `GRE_MEC_02` | Mechanized Divisions (Named) | mechanized | `%di Michanopoiiméni Merarchía` | All governments |
| `GRE_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%di Tethorakisméni Merarchía` | All governments |
| `GRE_MNT_02` | Mountain Brigades | mountaineers | `%di Oreiní Taxiarchía` | All governments |
| `GRE_EVZ_01` | Evzone Regiments | infantry, mountaineers | `%do Evzonikó Sýntagma` | Neutrality or Democratic |
| `GRE_LOK_01` | Raider Regiments | infantry, mountaineers, paratrooper, marine | `%do Sýntagma Katadromón` | All governments |
| `GRE_ISL_01` | Island Commands | infantry | `%di Diíkisi Nísón` | All governments |
| `GRE_FOR_01` | Fortress Sectors | infantry | `%do Tmíma Ochýrosis` | All governments |
| `GRE_GEN_01` | Gendarmerie Regiments | militia, infantry | `%do Tágma Chorofylakís` | Neutrality or Democratic |
| `GRE_ASM_01` | Asia Minor Divisions | infantry | `%di Merarchía Mikrás Asías` | Neutrality or Democratic |
| `GRE_EXP_01` | Expeditionary Brigades | infantry | `%di Ekstrateftikí Taxiarchía` | All governments |
| `GRE_ROY_01` | Royal Guard Divisions | infantry | `%di Vasilikí Merarchía` | Neutrality only |
| `GRE_FAS_01` | National Youth Divisions | infantry, militia | `%di Merarchía Ethnikís Neolaías` | Fascism only |
| `GRE_RED_01` | Liberation Army Divisions | infantry | `%di Merarchía ELAS` | Communism only |
| `GRE_RED_02` | Partisan Guards | militia | `%di Omáda Antarton` | Communism only |
| `GRE_COM_01` | Democratic Army Divisions | infantry | `%di Merarchía DSE` | Communism only |
| `GRE_DEM_01` | National Defence Divisions | infantry | `%di Merarchía Ethnikís Amýnis` | Democratic only |
| `GRE_DEM_02` | Republican Volunteer Corps | militia | `%do Tágma Ethelontón` | Democratic only |

---

## Group Details

### `GRE_INF_01` — Infantry Divisions
Plain variant of vanilla GRE_INF_01: fallback-only, no nicknames. Fixes the Roman-numeral stub; Greek sources write the Arabic ordinal with a gendered ending (1η Μεραρχία Πεζικού = 1i Merarchía Pezikoú). GRE_INF_02 is the named variant and shares this numbering.
Fallback-only (plain) list: every division is numbered `%di Merarchía Pezikoú`.

### `GRE_CAV_01` — Cavalry Divisions
Overrides vanilla GRE_CAV_01. The 1940 Cavalry Division (Larissa, Trikala, Elassona; 1st and 3rd Cavalry Regiments, Motorized Cavalry Regiment) and the 1929 tactical groups at Larissa and Thessaloniki. Thessaly was the cavalry heartland; the rest extends that pattern.

14 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía Ippikoú* |
| 2 | *%di Merarchía Ippikoú Thessalías* |
| 3 | *%di Merarchía Ippikoú Makedonías* |
| 4 | *%di Merarchía Ippikoú Thrákis* |
| 5 | *%di Ippikí Taxiarchía* |
| 6 | *%di Ippikí Taxiarchía Lárisas* |
| 7 | *%di Ippikí Taxiarchía Trikálon* |
| 8 | *%di Ippikí Taxiarchía Elassónas* |
| 9 | *%di Ippikí Taxiarchía Thessaloníkis* |
| 10 | *%do Sýntagma Ippikoú* |
| 11 | *%do Sýntagma Ippéon* |
| 12 | *%do Michanokínito Sýntagma Ippikoú* |
| 13 | *%di Ippikí Omáda Lárisas* |
| 14 | *%di Ippikí Omáda Thessaloníkis* |

### `GRE_MOT_01` — Motorized Divisions
Plain variant of vanilla GRE_MOT_01. Michanokíniti (motor-borne) is the Greek term for motorized; the 1941 19th Division was the 19η Μηχανοκίνητη Μεραρχία. Links INF_01; GRE_MOT_02 and GRE_MEC_01 share its numbering.
Shares numbering with `GRE_INF_01` (`link_numbering_with`).
Fallback-only (plain) list: every division is numbered `%di Michanokíniti Merarchía`.

### `GRE_MEC_01` — Mechanized Divisions
Plain variant of vanilla GRE_MEC_01. Michanopoiiméni (mechanized) was swapped with Michanokíniti in vanilla. Anchored on GRE_MOT_01 so the whole mobile family shares one numbering.
Shares numbering with `GRE_MOT_01` (`link_numbering_with`).
Fallback-only (plain) list: every division is numbered `%di Michanopoiiméni Merarchía`.

### `GRE_ARM_01` — Armored Divisions
Plain variant of vanilla GRE_ARM_01. Greece fielded almost no armor before 1941; postwar Tethorakisméni Merarchía/Taxiarchía titles extend the pattern. GRE_ARM_02 is the named variant.
Shares numbering with `GRE_INF_01` (`link_numbering_with`).
Fallback-only (plain) list: every division is numbered `%di Tethorakisméni Merarchía`.

### `GRE_PAR_01` — Paratrooper Divisions
Overrides vanilla GRE_PAR_01. Alexiptotistón (of parachutists) takes its stress mark. Greece had no interwar airborne force, so these follow the Raider-Paratrooper naming and Greek classical honorifics.

10 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía Alexiptotistón* |
| 2 | *%di Taxiarchía Alexiptotistón* |
| 3 | *%do Sýntagma Alexiptotistón* |
| 4 | *%do Tágma Alexiptotistón* |
| 5 | *%dos Lóchos Alexiptotistón* |
| 6 | *%di Aerometaferómeni Merarchía* |
| 7 | *%di Aerometaferómeni Taxiarchía* |
| 8 | *%di Merarchía Alexiptotistón Pegásou* |
| 9 | *%di Merarchía Alexiptotistón Ikárou* |
| 10 | *%di Merarchía Alexiptotistón Daidálou* |

### `GRE_MAR_01` — Marine Divisions
Overrides vanilla GRE_MAR_01. Pezonaftón corrects vanilla's Pezonavton (ELOT 743). Greece had no historic marine corps; the 32nd Marines Brigade at Volos descends from the 32nd Infantry Regiment of Preveza.

11 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía Pezonaftón* |
| 2 | *%di Taxiarchía Pezonaftón* |
| 3 | *%do Sýntagma Pezonaftón* |
| 4 | *%do Tágma Pezonaftón* |
| 5 | *%di Amfívia Taxiarchía* |
| 6 | *%do Amfívio Tágma* |
| 7 | *%do Tágma Naftikoú Pezikoú* |
| 8 | *%dos Lóchos Naftikoú Pezikoú* |
| 9 | *32o Sýntagma Pezikoú Prevézis* |
| 10 | *%di Amfívia Merarchía* |
| 11 | *%di Taxiarchía Pezonaftón Vólou* |

### `GRE_MNT_01` — Mountain Divisions
Overrides vanilla GRE_MNT_01 (vanilla reused the infantry stub). Greek mountain ranges and peaks as honorifics; the 1940 Pindos Detachment (Davakis) fought in this terrain. Links INF_01 as in vanilla.
Shares numbering with `GRE_INF_01` (`link_numbering_with`).

20 entries:

| # | Name |
|:--|:---|
| 1 | *%di Oreiní Merarchía Píndou* |
| 2 | *%di Oreiní Merarchía Olýmpou* |
| 3 | *%di Oreiní Merarchía Rodópis* |
| 4 | *%di Oreiní Merarchía Taygétou* |
| 5 | *%di Oreiní Merarchía Vítsi* |
| 6 | *%di Oreiní Merarchía Grámmou* |
| 7 | *%di Oreiní Merarchía Ídis* |
| 8 | *%di Oreiní Merarchía Lefkón Óron* |
| 9 | *%di Oreiní Merarchía Vermíou* |
| 10 | *%di Oreiní Merarchía Falakroú* |
| 11 | *%di Oreiní Merarchía Agráfon* |
| 12 | *%di Oreiní Merarchía Parnassoú* |
| 13 | *%di Oreiní Merarchía Pilíou* |
| 14 | *%di Oreiní Merarchía Óssas* |
| 15 | *%di Oreiní Merarchía Ágiou Órous* |
| 16 | *%di Oreiní Merarchía Parnónos* |
| 17 | *%di Oreiní Merarchía Mainálou* |
| 18 | *%di Oreiní Merarchía Tymfrístou* |
| 19 | *%di Oreiní Merarchía Smólika* |
| 20 | *%di Oreiní Merarchía Varnoúnta* |

### `GRE_GAR_01` — Garrison Divisions
Overrides vanilla GRE_GAR_01 (vanilla reused the infantry stub). Frourarcheío is the Greek garrison command; replacement and reserve battalions (Tágma Anapliróseos, Efedrón), the postwar TEA and airfield defence units are folded in. Place names are real; the titles are extrapolated. Links INF_01 as in vanilla.
Shares numbering with `GRE_INF_01` (`link_numbering_with`).

27 entries:

| # | Name |
|:--|:---|
| 1 | *%do Frourarcheío Athinón* |
| 2 | *%do Frourarcheío Thessaloníkis* |
| 3 | *%do Frourarcheío Patrón* |
| 4 | *%do Frourarcheío Lárisas* |
| 5 | *%do Frourarcheío Ioannínon* |
| 6 | *%do Frourarcheío Serrón* |
| 7 | *%do Frourarcheío Kozánis* |
| 8 | *%do Frourarcheío Drámas* |
| 9 | *%do Frourarcheío Kavállas* |
| 10 | *%do Frourarcheío Vólou* |
| 11 | *%do Frourarcheío Kalamátas* |
| 12 | *%do Frourarcheío Tripóleos* |
| 13 | *%do Frourarcheío Nafplíou* |
| 14 | *%do Frourarcheío Chanión* |
| 15 | *%do Frourarcheío Irakleíou* |
| 16 | *%do Frourarcheío Rethýmnou* |
| 17 | *%do Frourarcheío Kerkýras* |
| 18 | *%do Frourarcheío Chíou* |
| 19 | *%do Frourarcheío Mytilínis* |
| 20 | *%do Frourarcheío Sámou* |
| 21 | *%do Frourarcheío Ródou* |
| 22 | *%do Frourarcheío Soúdas* |
| 23 | *%do Tágma Anapliróseos* |
| 24 | *%do Tágma Efedrón* |
| 25 | *%do Tágma Ethnofylakís Amýnis* |
| 26 | *%do Tágma Ochýrosis Aerodromíon* |
| 27 | *%do Tmíma Asfáleias Aerodromíou* |

### `GRE_INF_02` — Infantry Divisions (Named)
Named variant of GRE_INF_01; shares its numbering. Keys 1-6 and 8 follow the 1940 divisional seats (I Larissa, II Athens, III Patras, IV Nauplion, V Chania, VI Serres, VIII Epirus); the Army Sections of Epirus and Macedonia, the Dodecanese Regiment and the Evros and Nestos Brigades supply other regions. Most titles are extrapolated onto real place names.
Shares numbering with `GRE_INF_01` (`link_numbering_with`).

30 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía Thessalías* |
| 2 | *%di Merarchía Athinón* |
| 3 | *%di Merarchía Patrón* |
| 4 | *%di Merarchía Nafplíou* |
| 5 | *%di Merarchía Krítis* |
| 6 | *%di Merarchía Serrón* |
| 7 | *%di Merarchía Kozánis* |
| 8 | *%di Merarchía Ipeírou* |
| 9 | *%di Merarchía Makedonías* |
| 10 | *%di Merarchía Thrákis* |
| 11 | *%di Merarchía Thessaloníkis* |
| 12 | *%di Merarchía Dodekanísou* |
| 13 | *%di Merarchía Kerkýras* |
| 14 | *%di Merarchía Kentrikís Makedonías* |
| 15 | *%di Merarchía Peloponnísou* |
| 16 | *%di Merarchía Anatolikís Makedonías* |
| 17 | *%di Merarchía Dytikís Makedonías* |
| 18 | *%di Merarchía Stereás Elládos* |
| 19 | *%di Merarchía Evvoías* |
| 20 | *%di Merarchía Píndou* |
| 21 | *%di Merarchía Olýmpou* |
| 22 | *%di Merarchía Évrou* |
| 23 | *%di Merarchía Néstou* |
| 24 | *%di Merarchía Ioannínon* |
| 25 | *%di Merarchía Lárisas* |
| 26 | *%di Merarchía Aitoloakarnanías* |
| 27 | *%di Merarchía Messinías* |
| 28 | *%di Merarchía Lakonías* |
| 29 | *%di Merarchía Chalkidikís* |
| 30 | *%di Merarchía Archipelágous* |

### `GRE_MOT_02` — Motorized Divisions (Named)
Named variant of GRE_MOT_01; shares its numbering. River names and independence-war captains as honorifics; extrapolated, since Greece fielded a single motorized division (19th, 1941).
Shares numbering with `GRE_MOT_01` (`link_numbering_with`).

14 entries:

| # | Name |
|:--|:---|
| 1 | *%di Michanokíniti Merarchía Thessalías* |
| 2 | *%di Michanokíniti Merarchía Makedonías* |
| 3 | *%di Michanokíniti Merarchía Axioú* |
| 4 | *%di Michanokíniti Merarchía Strymónos* |
| 5 | *%di Michanokíniti Merarchía Néstou* |
| 6 | *%di Michanokíniti Merarchía Évrou* |
| 7 | *%di Michanokíniti Merarchía Pineioú* |
| 8 | *%di Michanokíniti Merarchía Alfeioú* |
| 9 | *%di Michanokíniti Merarchía Spercheioú* |
| 10 | *%di Michanokíniti Merarchía Aliákmona* |
| 11 | *%di Michanokíniti Merarchía Kolokotróni* |
| 12 | *%di Michanokíniti Merarchía Karaiskáki* |
| 13 | *%di Michanokíniti Merarchía Botsári* |
| 14 | *%di Michanokíniti Merarchía Miaoúli* |

### `GRE_MEC_02` — Mechanized Divisions (Named)
Named variant of GRE_MEC_01; shares the mobile numbering through GRE_MOT_01. Battles of classical Greece as honorifics, a long-standing Hellenic Army convention; extrapolated.
Shares numbering with `GRE_MOT_01` (`link_numbering_with`).

10 entries:

| # | Name |
|:--|:---|
| 1 | *%di Michanopoiiméni Merarchía Marathónos* |
| 2 | *%di Michanopoiiméni Merarchía Salamínos* |
| 3 | *%di Michanopoiiméni Merarchía Plataión* |
| 4 | *%di Michanopoiiméni Merarchía Thermopylón* |
| 5 | *%di Michanopoiiméni Merarchía Chaironeías* |
| 6 | *%di Michanopoiiméni Merarchía Lefktron* |
| 7 | *%di Michanopoiiméni Merarchía Mantineías* |
| 8 | *%di Michanopoiiméni Merarchía Sfaktirías* |
| 9 | *%di Michanopoiiméni Merarchía Artemisíou* |
| 10 | *%di Michanopoiiméni Merarchía Mykális* |

### `GRE_ARM_02` — Armored Divisions (Named)
Named variant of GRE_ARM_01; shares its numbering. Classical commanders as honorifics; extrapolated.
Shares numbering with `GRE_ARM_01` (`link_numbering_with`).

10 entries:

| # | Name |
|:--|:---|
| 1 | *%di Tethorakisméni Merarchía Megálou Alexándrou* |
| 2 | *%di Tethorakisméni Merarchía Epameinónda* |
| 3 | *%di Tethorakisméni Merarchía Leonída* |
| 4 | *%di Tethorakisméni Merarchía Miltiádou* |
| 5 | *%di Tethorakisméni Merarchía Themistokléous* |
| 6 | *%di Tethorakisméni Merarchía Perikléous* |
| 7 | *%di Tethorakisméni Merarchía Pelopída* |
| 8 | *%di Tethorakisméni Merarchía Achilléos* |
| 9 | *%di Tethorakisméni Merarchía Filíppou* |
| 10 | *%di Tethorakisméni Merarchía Kímonos* |

### `GRE_MNT_02` — Mountain Brigades
Key 3 is the 3rd Greek Mountain Brigade Rimini (formed in exile, Rimini 1944); the Pindos Detachment (Davakis, 1940) is the last entry. The other brigades take mountain names and are extrapolated.

13 entries:

| # | Name |
|:--|:---|
| 1 | *%di Oreiní Taxiarchía Píndou* |
| 2 | *%di Oreiní Taxiarchía Olýmpou* |
| 3 | *%di Oreiní Taxiarchía Rimini* |
| 4 | *%di Oreiní Taxiarchía Ipeírou* |
| 5 | *%di Oreiní Taxiarchía Vítsi* |
| 6 | *%di Oreiní Taxiarchía Grámmou* |
| 7 | *%di Oreiní Taxiarchía Taygétou* |
| 8 | *%di Oreiní Taxiarchía Rodópis* |
| 9 | *%di Oreiní Taxiarchía Lefkón Óron* |
| 10 | *%di Oreiní Taxiarchía Ídis* |
| 11 | *%di Oreiní Taxiarchía Falakroú* |
| 12 | *%di Oreiní Taxiarchía Vermíou* |
| 13 | *%do Apóspasma Píndou* |

### `GRE_EVZ_01` — Evzone Regiments
Evzones (Presidential Guard heritage, Royal Guard until 1924 and again later). 1/38 to 3/40, 5/42 and 49th are real regiment numbers; 4/41 and 6/43 continue the family and are extrapolated. Gated to the monarchy and the republic, which both kept Evzone units.

13 entries:

| # | Name |
|:--|:---|
| 1 | *1/38 Evzonikó Sýntagma* |
| 2 | *2/39 Evzonikó Sýntagma* |
| 3 | *3/40 Evzonikó Sýntagma* |
| 4 | *4/41 Evzonikó Sýntagma* |
| 5 | *5/42 Evzonikó Sýntagma* |
| 6 | *6/43 Evzonikó Sýntagma* |
| 7 | *49o Evzonikó Sýntagma* |
| 8 | *%do Tágma Evzónon* |
| 9 | *%do Evzonikó Apóspasma* |
| 10 | *%di Evzonikí Taxiarchía* |
| 11 | *%dos Lóchos Evzónon* |
| 12 | *%di Evzonikí Merarchía* |
| 13 | *%do Evzonikó Sýntagma Proedrikís Froúras* |

### `GRE_LOK_01` — Raider Regiments
Special-forces pool: the Sacred Band (Ierós Lóchos, 1942, Tsigantes; first the Lóchos Epilékton Athanáton), the mountain raiding companies (LOK) and the III Raider Brigade of 1949. Marine, airborne and raider titles are merged here because each is too thin alone.

11 entries:

| # | Name |
|:--|:---|
| 1 | *Ierós Lóchos* |
| 2 | *Lóchos Epilékton Athanáton* |
| 3 | *%dos Lóchos Oreinón Katadromón* |
| 4 | *%dos Lóchos Katadromón* |
| 5 | *%do Tágma Katadromón* |
| 6 | *%do Sýntagma Katadromón* |
| 7 | *%di Taxiarchía Katadromón* |
| 8 | *%di Omáda Katadromón* |
| 9 | *1i Taxiarchía Katadromón-Alexiptotistón* |
| 10 | *3i Taxiarchía Katadromón* |
| 11 | *%do Tágma Alexiptotistón-Katadromón* |

### `GRE_ISL_01` — Island Commands
Aegean, Ionian and Dodecanese commands. The Dodecanese Regiment (12th Division, 1941) is the only attested title; the command and battalion names extend it over real islands.

19 entries:

| # | Name |
|:--|:---|
| 1 | *%di Diíkisi Krítis* |
| 2 | *%di Diíkisi Dodekanísou* |
| 3 | *%di Diíkisi Ioníon Nísón* |
| 4 | *%di Diíkisi Límnou* |
| 5 | *%di Diíkisi Lésvou* |
| 6 | *%di Diíkisi Chíou* |
| 7 | *%di Diíkisi Sámou* |
| 8 | *%di Diíkisi Kykládon* |
| 9 | *%di Diíkisi Ródou* |
| 10 | *%do Sýntagma Dodekanísou* |
| 11 | *%do Sýntagma Nisiotikón Apospasmáton* |
| 12 | *%do Nisiotikó Tágma* |
| 13 | *%do Tágma Krítis* |
| 14 | *%do Tágma Límnou* |
| 15 | *%do Tágma Kerkýras* |
| 16 | *%do Tágma Lefkádas* |
| 17 | *%do Tágma Zakýnthou* |
| 18 | *%do Tágma Kefallinías* |
| 19 | *%do Tágma Kárpathou* |

### `GRE_FOR_01` — Fortress Sectors
The 21 forts of the Metaxas Line (Eastern Macedonia Army Section), plus the Nestos and Evros Brigades and the Krousia Detachment of 1940-41. Tmíma Ochýrosis is an extrapolated sector title.

24 entries:

| # | Name |
|:--|:---|
| 1 | *%do Tmíma Ochýrosis Roupel* |
| 2 | *%do Tmíma Ochýrosis Istímbei* |
| 3 | *%do Tmíma Ochýrosis Popotlívitsa* |
| 4 | *%do Tmíma Ochýrosis Kelkagiá* |
| 5 | *%do Tmíma Ochýrosis Arpalouki* |
| 6 | *%do Tmíma Ochýrosis Paliouriónes* |
| 7 | *%do Tmíma Ochýrosis Karatás* |
| 8 | *%do Tmíma Ochýrosis Kali* |
| 9 | *%do Tmíma Ochýrosis Persek* |
| 10 | *%do Tmíma Ochýrosis Babazóra* |
| 11 | *%do Tmíma Ochýrosis Maliagka* |
| 12 | *%do Tmíma Ochýrosis Perithóri* |
| 13 | *%do Tmíma Ochýrosis Partaloúska* |
| 14 | *%do Tmíma Ochýrosis Ntásavli* |
| 15 | *%do Tmíma Ochýrosis Lisse* |
| 16 | *%do Tmíma Ochýrosis Pyramidoeidés* |
| 17 | *%do Tmíma Ochýrosis Kastíllo* |
| 18 | *%do Tmíma Ochýrosis Ágios Nikólaos* |
| 19 | *%do Tmíma Ochýrosis Bartíseva* |
| 20 | *%do Tmíma Ochýrosis Echínos* |
| 21 | *%do Tmíma Ochýrosis Nymfaía* |
| 22 | *%di Taxiarchía Néstou* |
| 23 | *%di Taxiarchía Évrou* |
| 24 | *%do Apóspasma Kroúsias* |

### `GRE_GEN_01` — Gendarmerie Regiments
The Hellenic Gendarmerie (Chorofylakí, 1833-1984) as a regional force. A state and republican institution, so gated off the communist and fascist suites.

16 entries:

| # | Name |
|:--|:---|
| 1 | *%di Taxiarchía Chorofylakís* |
| 2 | *%do Tágma Chorofylakís Athinón* |
| 3 | *%do Tágma Chorofylakís Thessaloníkis* |
| 4 | *%do Tágma Chorofylakís Patrón* |
| 5 | *%do Tágma Chorofylakís Lárisas* |
| 6 | *%do Tágma Chorofylakís Ipeírou* |
| 7 | *%do Tágma Chorofylakís Makedonías* |
| 8 | *%do Tágma Chorofylakís Thessalías* |
| 9 | *%do Tágma Chorofylakís Thrákis* |
| 10 | *%do Tágma Chorofylakís Krítis* |
| 11 | *%do Tágma Chorofylakís Peloponnísou* |
| 12 | *%do Tágma Chorofylakís Nísón Aigaíou* |
| 13 | *%do Tágma Chorofylakís Dodekanísou* |
| 14 | *%do Tágma Astynomías Póleon* |
| 15 | *%di Politofylakí Athinón* |
| 16 | *%di Stratiotikí Chorofylakí* |

### `GRE_ASM_01` — Asia Minor Divisions
The Army of Asia Minor, 1919-22 (Smyrna, Archipelago, Crete, Kydoniai and Serres Divisions, the Independent Division, Corps A to D). Sakarya, Eskisehir, Afyon, Kutahya and Usak are battle honorifics and are extrapolated; the Idea Division title is held for author confirmation. Gated to the monarchy and the republic, which share this tradition.

22 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía Smýrnis* |
| 2 | *%di Merarchía Archipelágous* |
| 3 | *%di Merarchía Krítis* |
| 4 | *%di Merarchía Kydonión* |
| 5 | *%di Merarchía Serrón* |
| 6 | *%di Merarchía Thessaloníkis* |
| 7 | *%di Merarchía Idéas* |
| 8 | *%di Anexártiti Merarchía* |
| 9 | *%di Merarchía Sangaríou* |
| 10 | *%di Merarchía Eskisehír* |
| 11 | *%di Merarchía Afión Karachisár* |
| 12 | *%di Merarchía Kioutácheias* |
| 13 | *%di Merarchía Ousák* |
| 14 | *31o Sýntagma Kydonión* |
| 15 | *32o Sýntagma Kydonión* |
| 16 | *33o Sýntagma Kydonión* |
| 17 | *A' Sóma Stratoú* |
| 18 | *B' Sóma Stratoú* |
| 19 | *G' Sóma Stratoú* |
| 20 | *D' Sóma Stratoú* |
| 21 | *Sóma Stratoú Smýrnis* |
| 22 | *Stratiá Mikrás Asías* |

### `GRE_EXP_01` — Expeditionary Brigades
Greek forces abroad: the 1st and 2nd Brigades and the Mountain Brigade of the Middle East, Korea (the Sparta Battalion) and the volunteer legions of 1825, 1897 and 1912 (Fabvier, Philhellenes, Garibaldini).

15 entries:

| # | Name |
|:--|:---|
| 1 | *%di Ellinikí Taxiarchía* |
| 2 | *%di Ellinikí Taxiarchía Mesis Anatolís* |
| 3 | *%di Ellinikí Oreiní Taxiarchía* |
| 4 | *%do Ellinikó Apóspasma Mesis Anatolís* |
| 5 | *%do Ellinikó Apóspasma Tobrouk* |
| 6 | *%di Taxiarchía Alamein* |
| 7 | *%do Ellinikó Ekstrateftikó Sóma Koreas* |
| 8 | *%do Ekstrateftikó Tágma Koreas* |
| 9 | *%do Tágma Spárti* |
| 10 | *%do Ekstrateftikó Tágma* |
| 11 | *%do Sýntagma Ekstrateías* |
| 12 | *%di Filellinikí Legeóna* |
| 13 | *%di Garibaldinikí Legeóna* |
| 14 | *%do Táktikon Sóma* |
| 15 | *%do Filellinikó Tágma* |

### `GRE_ROY_01` — Royal Guard Divisions
Neutrality (monarchy and the Fourth of August regime, which is the in-game starting government). The Royal Guard dates from 1914; the Fourth of August titles are extrapolated.

15 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía Vasilikís Froúras* |
| 2 | *%di Taxiarchía Vasilikís Froúras* |
| 3 | *%do Sýntagma Vasilikís Froúras* |
| 4 | *%di Merarchía Froúras* |
| 5 | *%di Vasilikí Merarchía* |
| 6 | *%di Vasilikí Taxiarchía* |
| 7 | *%do Vasilikó Sýntagma* |
| 8 | *%do Vasilikó Ippikó Sýntagma* |
| 9 | *%di Merarchía Tetártis Avgoústou* |
| 10 | *%di Taxiarchía Tetártis Avgoústou* |
| 11 | *%do Sýntagma Tetártis Avgoústou* |
| 12 | *%di Merarchía Vasiléos Georgíou* |
| 13 | *%di Merarchía Vasiléos Konstantínou* |
| 14 | *%di Merarchía Vasiléos Pávlou* |
| 15 | *%di Merarchía Vasiléos Alexándrou* |

### `GRE_FAS_01` — National Youth Divisions
Fascism. A thin, EON-based list (Ethnikí Orgánosis Neolaías, the Metaxist youth organization) and the Third Hellenic Civilization slogan. The Fourth of August regime itself sits in the neutrality suite; collaborationist Security Battalions are deliberately excluded.

10 entries:

| # | Name |
|:--|:---|
| 1 | *%do Tágma Ethnikís Neolaías* |
| 2 | *%dos Lóchos Ethnikís Neolaías* |
| 3 | *%do Sýntagma Ethnikís Neolaías* |
| 4 | *%di Taxiarchía Ethnikís Neolaías* |
| 5 | *%di Merarchía Ethnikís Neolaías* |
| 6 | *%do Tágma EON* |
| 7 | *%di Taxiarchía EON* |
| 8 | *%di Merarchía Trítou Ellinikoú Politismoú* |
| 9 | *%do Sýntagma Trítou Ellinikoú Politismoú* |
| 10 | *%di Taxiarchía Trítou Ellinikoú Politismoú* |

### `GRE_RED_01` — Liberation Army Divisions
COMMUNISM (has_government = communism) Communism. ELAS (1942-45). Keys follow the real divisional numbers (I Thessaly, II Attica-Boeotia, III Peloponnese, V Crete, VI Eastern Macedonia-Thrace, VIII Epirus, IX Western Macedonia, X Central Macedonia, XI Thessaloniki, XIII Roumeli); IV, VII and XII are unverified and left to the fallback.

18 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía ELAS Thessalías* |
| 2 | *%di Merarchía ELAS Attikovoiotías* |
| 3 | *%di Merarchía ELAS Peloponnísou* |
| 5 | *%di Merarchía ELAS Krítis* |
| 6 | *%di Merarchía ELAS Anatolikís Makedonías-Thrákis* |
| 8 | *%di Merarchía ELAS Ipeírou* |
| 9 | *%di Merarchía ELAS Dytikís Makedonías* |
| 10 | *%di Merarchía ELAS Kentrikís Makedonías* |
| 11 | *%di Merarchía ELAS Thessaloníkis* |
| 13 | *%di Merarchía ELAS Roúmelis* |
| 14 | *A' Sóma Stratoú ELAS Athinón* |
| 15 | *%do Sýntagma ELAS Vólou* |
| 16 | *%di Taxiarchía ELAS Párnithas* |
| 17 | *%di Íli Ippikoú ELAS* |
| 18 | *%di Moíra Archipelágous* |
| 19 | *%di Omáda Merarchión Makedonías* |
| 20 | *%di Omáda Merarchión Stereás* |
| 21 | *%do Sýntagma Ari Velouchióti* |

### `GRE_RED_02` — Partisan Guards
Communism. ELAS auxiliaries (ELAN naval squadrons, EPON youth, OPLA, the National Civil Guard, the Reserve ELAS), the DSE Ottoman Battalion and local Aftoámyna self-defence groups. Generic partisan titles are extrapolated.

12 entries:

| # | Name |
|:--|:---|
| 1 | *%di Moíra ELAN* |
| 2 | *%do Tágma Ethnikís Politofylakís* |
| 3 | *%do Tágma Efedrikoú ELAS* |
| 4 | *%do Tágma EPON* |
| 5 | *%di Taxiarchía EPON* |
| 6 | *%do Tágma OPLA* |
| 7 | *%do Tágma Othomanón* |
| 8 | *%di Omáda Aftoámynas* |
| 9 | *%dos Lóchos Antartón* |
| 10 | *%do Sýntagma Antartón* |
| 11 | *%di Omáda Antartón* |
| 12 | *%do Apóspasma Antartón* |

### `GRE_COM_01` — Democratic Army Divisions
Communism. The Democratic Army of Greece (DSE, 1946-49). Keys follow the verified divisions 1-3, 6-8 and 11; 9 and 10 are uncertain in the source and held for author confirmation. The 22nd and 55th Regiments and the four territorial sectors are the 3rd Division's.

19 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía DSE Thessalías* |
| 2 | *%di Merarchía DSE Roúmelis* |
| 3 | *%di Merarchía DSE Peloponnísou* |
| 6 | *%di Merarchía DSE Kentrikís Makedonías* |
| 7 | *%di Merarchía DSE Anatolikís Makedonías-Thrákis* |
| 8 | *%di Merarchía DSE Ipeírou* |
| 9 | *%di Merarchía DSE Kastoriás* |
| 10 | *%di Merarchía DSE Vítsi* |
| 11 | *%di Merarchía DSE Flórinas* |
| 12 | *22o Sýntagma DSE Peloponnísou* |
| 13 | *55o Sýntagma DSE Peloponnísou* |
| 14 | *24i Taxiarchía DSE Kaimaktsalán* |
| 15 | *%dos Tomeás Parnónos* |
| 16 | *%dos Tomeás Taygétou* |
| 17 | *%dos Tomeás Mainálou* |
| 18 | *%dos Tomeás Achaías-Ileías* |
| 19 | *%di Merarchía DSE Grámmou* |
| 20 | *%do Sýntagma DSE* |
| 21 | *%di Taxiarchía DSE* |

### `GRE_DEM_01` — National Defence Divisions
DEMOCRATIC (has_government = democratic) Democratic (Venizelist). The Ethnikí Amýna divisions of 1916 (Serres, Crete, Archipelago, Thessaloniki), the Macedonian Struggle, the Theriso revolt and the Republic of 1924-35. Honorific titles are extrapolated onto real people and places.

17 entries:

| # | Name |
|:--|:---|
| 1 | *%di Merarchía Ethnikís Amýnis Serrón* |
| 2 | *%di Merarchía Ethnikís Amýnis Krítis* |
| 3 | *%di Merarchía Ethnikís Amýnis Archipelágous* |
| 4 | *%di Merarchía Ethnikís Amýnis Thessaloníkis* |
| 5 | *%do Sóma Stratoú Ethnikís Amýnis* |
| 6 | *%di Merarchía Venizélou* |
| 7 | *%di Merarchía Kountouriótou* |
| 8 | *%di Merarchía Plastíra* |
| 9 | *%di Merarchía Papanastasíou* |
| 10 | *%di Merarchía Dimokratías* |
| 11 | *%di Merarchía Pávlou Mela* |
| 12 | *%di Merarchía Germanoú Karavangéli* |
| 13 | *%di Merarchía Therísou* |
| 14 | *%di Taxiarchía Dimokratikís Froúras* |
| 15 | *%do Sýntagma Dimokratikís Froúras* |
| 16 | *%di Merarchía Kapetán Kótta* |
| 17 | *%di Merarchía Téllou Agrá* |

### `GRE_DEM_02` — Republican Volunteer Corps
Democratic. Republican resistance and volunteer forces: the EKKA 5/42 Regiment (Psarros), the EOEA of EDES, the Democratic Guard of the Republic, Macedonian Struggle and Cretan volunteers. Generic volunteer titles are extrapolated.

12 entries:

| # | Name |
|:--|:---|
| 1 | *%do Sýntagma Psarroú* |
| 2 | *%do Sýntagma EKKA* |
| 3 | *Ethnikés Omádes Ellínon Antartón* |
| 4 | *%di Dimokratikí Omáda Antartón* |
| 5 | *%do Tágma Ethelontón* |
| 6 | *%dos Lóchos Ethelontón* |
| 7 | *%di Omáda Makedonomáchon* |
| 8 | *%do Tágma Kritikón Ethelontón* |
| 9 | *%di Dimokratikí Froúra* |
| 10 | *%do Tágma Dimokratikís Amýnis* |
| 11 | *%do Sýntagma Ethelontón* |
| 12 | *%do Sýntagma Ethnikón Omádon* |

---

## Notes

- **Extrapolation**: Verified names are the 1940 divisional seats and corps, the Cavalry Division and its garrisons, the Dodecanese Regiment, the Pindos Detachment, the Metaxas Line forts, the Evzone regiments 1/38 to 3/40, 5/42 and 49, the Sacred Band and the Mountain Brigade *Rimini*, the Army of Asia Minor corps and divisions, the Korean War force, the ELAS divisions I, II, III, V, VI, VIII, IX, X, XI and XIII, the Democratic Army divisions 1-3, 6-8 and 11, and the Gendarmerie. Regional and honorific titles on divisions (rivers, mountains, classical battles and commanders), the garrison, island, mobile and mountain lists, and the Fourth of August, EON and Republican titles are extrapolated in the Greek pattern.
- **Thin lists**: Evzones, paratroops and the EON list are short because Greece fielded little of the kind before 1945; marine, airborne and raider titles share the *Raider Regiments* pool, and legions, reserves and airfield defence were folded into the expeditionary and garrison lists rather than padded.
- **Unverified**: the Idea Division, the ELAS divisions IV, VII and XII (left to the fallback), the Democratic Army divisions 9 and 10 (the source lists both at Kastoria), and the Evzone regiments 4/41 and 6/43.
- **Transliteration**: stress accents follow vanilla; Greek *η* is rendered `i`, *υ* `y`, *χ* `ch`, *ου* `ou`, and *αυ* before a voiceless consonant `af`.
- **Neutrality**: the Royal Guard and Fourth of August lists use `has_government = neutrality` because focus or flag locks are not used.
