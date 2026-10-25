# Latvia

**Country Tag:** `LAT` | **Source File:** [`zz_INEX_LAT_names_divisions.txt`](../common/units/names_divisions/zz_INEX_LAT_names_divisions.txt)

---

## Historical Overview

The Latvian Army (*Latvijas armija*) of 1919-1940 had four infantry divisions named after the historic regions (*1. Kurzemes*, *2. Vidzemes*, *3. Latgales* and *4. Zemgales kājnieku divīzija*), each with three infantry regiments named after their home towns (*1. Liepājas kājnieku pulks* to *12. Bauskas kājnieku pulks*), one cavalry regiment (*Latvijas 1. jātnieku pulks*) and the technical units of the *Tehniskā divīzija*: the *Autotanku pulks*, the armoured trains and the coastal artillery. It grew out of the units of the War of Independence (*Kalpaka bataljons*, the Northern and Southern Latvia Brigades, the Latgale partisans) and the tradition of the Latvian Riflemen of 1915-1917 (*latviešu strēlnieki*). The defence organisation *Aizsargi* kept one regiment in each county.

Only the four divisions were ever formed, so the Named list extends their pattern with regions, the ancient Latgalian lands and towns in the genitive (*13. Tālavas kājnieku divīzija*). The Named armour and marine lists take the names of the army's armoured cars and of the coastal towns as nicknames (*1. bruņotā divīzija 'Lāčplēsis'*). Nicknames stand in straight single quotes because the game's map font has no Latvian quotation marks.

All names use Latvian orthography: an ordinal with a full stop, lower-case common nouns and the diacritics ā, č, ē, ģ, ī, ķ, ļ, ņ, š, ū, ž.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `LAT_INF_01` | Infantry Divisions | infantry | `%d. kājnieku divīzija` |
| `LAT_INF_02` | Infantry Divisions (Named) | infantry | `%d. kājnieku divīzija` |
| `LAT_REG_01` | Infantry Regiments | infantry | `%d. kājnieku pulks` |
| `LAT_GAR_01` | Garrisons & Border Guards | infantry | `%d. garnizona divīzija` |
| `LAT_AIZ_01` | Aizsargi Formations | infantry, militia | `%d. aizsargu pulks` |
| `LAT_MOT_01` | Motorized Divisions | motorized | `%d. motorizētā kājnieku divīzija` |
| `LAT_MEC_01` | Mechanized Divisions | mechanized | `%d. mehanizētā kājnieku divīzija` |
| `LAT_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. tanku divīzija` |
| `LAT_ARM_02` | Armored & Mobile (Named) | light_armor, medium_armor, heavy_armor, modern_armor, motorized, mechanized | `%d. bruņotā divīzija` |
| `LAT_PAR_01` | Paratrooper Divisions | paratrooper | `%d. gaisa desanta divīzija` |
| `LAT_MAR_01` | Marine Divisions | marine | `%d. jūras kājnieku divīzija` |
| `LAT_MAR_02` | Coastal Defense & Marines | marine | `%d. jūras kājnieku divīzija` |
| `LAT_MNT_01` | Mountain Divisions | mountaineers | `%d. kalnu kājnieku divīzija` |
| `LAT_CAV_01` | Cavalry Regiments | cavalry | `%d. jātnieku pulks` |
| `LAT_CAV_02` | Cavalry Squadrons | cavalry | `%d. atsevišķais jātnieku eskadrons` |
| `LAT_SEN_01` | Heritage Divisions | infantry | `%d. kājnieku divīzija` |
| `LAT_PK_01` | Thunder Cross Divisions | infantry, militia | `%d. pērkonkrustiešu divīzija` |
| `LAT_RED_01` | Red Rifle Divisions | infantry | `%d. latviešu strēlnieku divīzija` |
| `LAT_NP_01` | National Partisans | infantry, militia | `%d. nacionālo partizānu divīzija` |

> **Note:** INEX overrides all nine vanilla LAT groups and writes over every vanilla number, so no title-cased vanilla name stays in the game. `LAT_INF_01` is the group of the vanilla *Ugunskrusts* and *Baltic Entente* focus templates.

---

## Group Details

### Field army

### `LAT_INF_01` — Infantry Divisions
The plain list (*1. kājnieku divīzija* onward), for players who want numbers only. It shares its numbering with the Named list, the garrisons and the mountain divisions.

### `LAT_INF_02` — Infantry Divisions (Named)
The four divisions of 1919-1940 (*1. Kurzemes kājnieku divīzija* to *4. Zemgales kājnieku divīzija*), then extensions on the same pattern: regions and the 1919 brigades (*7. Ziemeļlatvijas kājnieku divīzija*), the ancient lands of Tālava, Jersika, Koknese, Atzele, Idumeja and Metsepole, and towns (*21. Cēsu kājnieku divīzija*).

### `LAT_REG_01` — Infantry Regiments
Regiment-sized templates: the twelve peacetime regiments; the units of the War of Independence (*Kalpaka bataljons*, *Latvijas Neatkarības bataljons*, *Atsevišķais studentu bataljons*, the Northern Latvia, Latgale and Upper Courland partisan regiments, the *Kara skolas kadetu rota*); the eight Latvian Riflemen regiments (*1. Daugavgrīvas latviešu strēlnieku pulks* to *8. Valmieras latviešu strēlnieku pulks*); the border guard battalions of 1935-1940; and further units of 1915-1922 (*13. Tukuma kājnieku pulks*, *Piebalgas bataljons*).

### Garrisons and territorial defence

### `LAT_GAR_01` — Garrisons & Border Guards
Garrison towns (*Rīgas garnizons*, *Daugavpils garnizons*), from 11 because vanilla links the group to the infantry, and the *Robežsargu brigāde* of 1935.

### `LAT_AIZ_01` — Aizsargi Formations
The defence organisation *Aizsargi* (1919-1940): its 19 county regiments under their 1939-1940 numbers (*1. Talsu aizsargu pulks* to *19. Abrenes aizsargu pulks*), the railway and aviation regiments and the naval divizions. It serves infantry and militia templates under every government, as the organisation did.

### Motorized, mechanized and armour

### `LAT_MOT_01` — Motorized Divisions
Plain numbers (*1. motorizētā kājnieku divīzija*); anchors the mobile numbering.

### `LAT_MEC_01` — Mechanized Divisions
Plain numbers (*1. mehanizētā kājnieku divīzija*), sharing numbering with the motorized divisions.

### `LAT_ARM_01` — Armored Divisions
Plain numbers (*1. tanku divīzija*); the plain counterpart of `LAT_ARM_02`.

### `LAT_ARM_02` — Armored & Mobile (Named)
The armoured cars, the AA gun and the tanks of the 1919-1940 army as nicknames (*'Lāčplēsis'*, *'Kurzemnieks'*, *'Zemgalietis'*, *'Imanta'*, *'Staburags'*, *'Pērkons'*), characters of Andrejs Pumpurs' epic *Lāčplēsis* (*'Laimdota'*, *'Spīdola'*), and the armour units themselves: the *Autotanku pulks*, the *Bruņoto vilcienu pulks*, the armoured train *Bruņuvilciens Nr. 5 'Kalpaks'* and the *Tehniskā divīzija*. It serves armour, motorized and mechanized templates.

### Specialist troops

### `LAT_PAR_01` — Paratrooper Divisions
Plain numbers (*1. gaisa desanta divīzija*); Latvia had no airborne troops.

### `LAT_MAR_01` — Marine Divisions
Plain numbers (*1. jūras kājnieku divīzija*); the plain counterpart of `LAT_MAR_02`.

### `LAT_MAR_02` — Coastal Defense & Marines
Towns of the Baltic and Gulf of Riga coast as nicknames (*1. jūras kājnieku divīzija 'Kolka'*), then the coastal defence of the interwar army: *Daugavgrīvas cietoksnis*, *Mangaļsalas nocietinājumi* and the *Krastu artilērijas pulks*. Latvia had no naval infantry, so the nicknamed divisions are extensions.

### `LAT_MNT_01` — Mountain Divisions
Latvia's uplands and highest hills as nicknames (*1. kalnu kājnieku divīzija 'Gaiziņkalns'*, *'Vidzemes augstiene'*, *'Kurzemes Šveice'*).

### Cavalry

### `LAT_CAV_01` — Cavalry Regiments
*Latvijas 1. jātnieku pulks*, the army's one cavalry regiment (1921-1940, Daugavpils), then plain numbers.

### `LAT_CAV_02` — Cavalry Squadrons
Squadron-sized templates: the squadrons of 1919-1921 from which the regiment was formed (the *Latviešu atsevišķā jātnieku nodaļa* of the Kalpaks battalion, the Kurzeme, Vidzeme, Latgale and Zemgale squadrons, the Northern Latvia Brigade's squadrons, the Latgale partisans' squadron) and the regiment's own divizions.

### Ideology suites

### `LAT_SEN_01` — Heritage Divisions (neutrality)
The ancient fight against the crusaders that the Ulmanis era celebrated: chieftains (*'Viesturs'*, *'Namejs'*, *'Visvaldis'*, *'Tālivaldis'*), hillforts (*'Tērvete'*, *'Mežotne'*) and the battles of Saule and Durbe. All are extensions; no Ulmanis-era honour unit existed.

### `LAT_PK_01` — Thunder Cross Divisions (fascism)
*Pērkonkrusts* (1932-1934), the movement of the vanilla *Ugunskrusts* path, by its five regions (*apgabali*) and its shock groups (*trieciengrupas*), then its symbols as nicknames (*'Ugunskrusts'*, *'Māras krusts'*). The movement fielded no military units, so all are extensions; its slogans and its leader are not used.

### `LAT_RED_01` — Red Rifle Divisions (communism)
Latvian formations of the Red Army, each on its own number: the 24th Territorial Rifle Corps of 1940-1941 with the 181st and 183rd Rifle Divisions and their regiments, and the 130th Latvian Rifle Corps of 1944-1945 with the *201. latviešu strēlnieku divīzija*, the *43. gvardes Rīgas latviešu strēlnieku divīzija* and the *308. latviešu strēlnieku divīzija*.

### `LAT_NP_01` — National Partisans (democratic)
The national partisans of 1944-1956, who fought for the republic that the Latvian Central Council's declaration of 8 September 1944 restored: their organisations (*Latvijas Nacionālo partizānu apvienība*, *Tēvzemes Sargu partizānu apvienība*, the Courland organisations) and their battles as nicknames (*'Stompaki'*, *'Kabile'*).
