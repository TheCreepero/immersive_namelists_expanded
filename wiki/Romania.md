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

