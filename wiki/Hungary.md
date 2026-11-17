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
