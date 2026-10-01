# Soviet Union

**Country Tag:** `SOV` | **Source File:** [`INEX_SOV_names_divisions.txt`](../common/units/names_divisions/INEX_SOV_names_divisions.txt)

---

## Historical Overview

The Red Army underwent the most radical organizational transformation of any belligerent in WWII — from the pre-war rifle divisions numbered in the hundreds, through the catastrophic 1941 losses, to the rebuilt Guards formations and large armored corps of 1943–45. INEX provides complete coverage of all major Soviet formation categories including Guards, Cossacks, NKVD, penal units (*Shtrafbat*), airborne, and artillery divisions. All groups override their vanilla counterparts to ensure proper Russian transliteration and historically grounded entries.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `SOV_INF_01` | Rifle Divisions | infantry | `%d-ya Strelkovaya Diviziya` |
| `SOV_CAV_01` | Cavalry Divisions | cavalry | `%d-ya Kavaleriyskaya Diviziya` |
| `SOV_MOT_01` | Motor Rifle Divisions | motorized | `%d-ya Motostrelkovaya Diviziya` |
| `SOV_MEC_01` | Mechanized Divisions | mechanized, motorized | `%d-ya Mekhanizirovannaya Diviziya` |
| `SOV_ARM_01` | Tank Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d-ya Tankovaya Diviziya` |
| `SOV_ARM_02` | Tank Corps | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Tankovyy Korpus` |
| `SOV_ARM_03` | Guard Tank Corps | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Gvardeyskiy Tankovyy Korpus` |
| `SOV_ARM_04` | Tank Brigades | light_armor, medium_armor, heavy_armor, modern_armor | `%d-ya Tankovaya Brigada` |
| `SOV_PAR_01` | Paratrooper Divisions | paratrooper | `%d-ya Vozdushno-Desantnaya Diviziya` |
| `SOV_MAR_01` | Naval Infantry Divisions | marine | `%d-ya Diviziya Morskoy Pekhoty` |
| `SOV_MNT_01` | Mountain Rifle Divisions | mountaineers | `%d-ya Gornostrelkovaya Diviziya` |
| `SOV_GAR_01` | Garrison Divisions | infantry | `%d-ya Pogranichnaya Diviziya Voisk NKVD` |
| `SOV_GRD_01` | Guards Rifles | infantry | `%d-ya Gvardeyskaya Strelkovaya Diviziya` |
| `SOV_GMC_01` | Guards Mechanized | mechanized, motorized | `%d-y Gvardeyskiy Mekhanizirovannyy Korpus` |
| `SOV_GTC_01` | Guards Tanks | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Gvardeyskiy Tankovyy Korpus` |
| `SOV_CAV_02` | Cossack Cavalry Divisions | cavalry | `%d-ya Kazach'ya Kavaleriyskaya Diviziya` |
| `SOV_PEN_01` | Penal Units | infantry | `%d-ya Shtrafnaya Chast'` |
| `SOV_NKVD_01` | NKVD Security Divisions | infantry | `%d-ya Diviziya Voisk NKVD` |
| `SOV_AIR_01` | Guards Airborne Divisions | paratrooper | `%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya` |
| `SOV_ART_01` | Artillery Divisions | artillery | `%d-ya Artilleriyskaya Diviziya` |

> All groups override their vanilla equivalents — vanilla Soviet entries for these tags are completely replaced by INEX's versions.

---

## Group Details

### `SOV_INF_01` — Rifle Divisions (*Strelkovaya Diviziya*)
The backbone of the Red Army. Features historical named and honorary divisions (*Moskovskaya Proletarskaya*, *Chapayevskaya*, *Samaro-Ulyanovskaya*, *Sivashskaya*, etc.) and formatted fallback numbering for the hundreds of wartime divisions raised.

### `SOV_CAV_01` — Cavalry Divisions (*Kavaleriyskaya Diviziya*)
Regular and early-war cavalry, including Red Cossack and honorary formations (*Zaporozhskaya*, *Chernigovskaya*, *imeni Blinova*), Central Asian mountain cavalry, and the 1st–17th Guards Cavalry Divisions.

### `SOV_MOT_01` / `SOV_MEC_01` — Motor Rifle / Mechanized Divisions
Motor Rifle divisions (*Motostrelkovaya Diviziya*) and Mechanized divisions (*Mekhanizirovannaya Diviziya*). Includes internal motorized formations (such as OMSDON *Dzerzhinskogo*) and links numbering with rifle divisions.

### `SOV_ARM_01` / `SOV_ARM_02` / `SOV_ARM_04` — Tank Formations
Three tank lists cover the organizational evolution of Soviet armor:
- **Tank Divisions (`SOV_ARM_01`)** — the pre-war and 1941 mechanized corps division structure, kept as an un-nicknamed fallback-only plain list.
- **Tank Corps (`SOV_ARM_02`)** — the rebuilt 1942–45 operational armored formations (*%d-y Tankovyy Korpus*) with historical battle honors (*Insterburgskiy*, *Bobruyskiy*, *Vislenskiy*, etc.).
- **Tank Brigades (`SOV_ARM_04`)** — independent armored brigades used extensively throughout the war, kept as a clean fallback-only list.

### `SOV_ARM_03` — Guard Tank Corps (*Gvardeyskiy Tankovyy Korpus*)
Elite Guards-designation tank corps earned through distinguished combat performance, featuring authentic masculine agreement (*%d-y Gvardeyskiy Tankovyy Korpus*) and battle honors (*Donskoy*, *Tatsinskiy*, *Kantemirovskiy*, etc.). Available when at war.

### `SOV_PAR_01` — Paratrooper Divisions (*Vozdushno-Desantnaya Diviziya*)
Airborne divisions with historical battle honors, including the wartime 1st–10th Guards and late/post-war 76th, 98th, and 106th Guards Airborne Divisions.

### `SOV_MAR_01` — Naval Infantry Divisions (*Diviziya Morskoy Pekhoty*)
Formations organized by Soviet naval fleet and flotilla sectors: Baltic, Black Sea, Northern, Pacific, Caspian, Danube, Volga, Azov, Amur, and Ladoga.

### `SOV_MNT_01` — Mountain Rifle Divisions (*Gornostrelkovaya Diviziya*)
Specialized mountain infantry for the Caucasus and Central Asian theatres (*Kavkazskaya*, *Gruzinskaya*, *Armyanskaya*, *Azerbaydzhanskaya*, *Turkestanskaya*).

### `SOV_GAR_01` — Garrison Divisions
NKVD border troops (*Pogranichnye voyska*) and the famous 1941 volunteer *Narodnoe Opolcheniye* (DNO) divisions of Moscow and Leningrad (Kirovskaya, Krasnopresnenskaya, Rostokinskaya, Moskvoretskaya, etc.).

### `SOV_GRD_01` — Guards Rifles (*Gvardeyskaya Strelkovaya Diviziya*)
Guards-designation rifle divisions, the elite of the Soviet infantry awarded Guards status for valor (*Tamanskaya*, *Panfilovskaya*, *Moskovsko-Minskaya*, *Poltavskaya*, etc.).

### `SOV_GMC_01` / `SOV_GTC_01` — Guards Mechanized / Guards Tanks
Complete historical orders of battle for all 9 Red Army Guards Mechanized Corps and all 12 Guards Tank Corps with verified masculine battle honors (*Venskiy*, *Nikolayevsko-Budapeshtskiy*, *Stalingradskiy*, *Kotelnikovskiy*, *Uralsko-Lvovskiy*, etc.).

### `SOV_CAV_02` — Cossack Cavalry Divisions (*Kazach'ya Kavaleriyskaya Diviziya*)
Revived Cossack formations representing traditional regional hosts (Don, Kuban, Terek, Stavropol, Ural, Orenburg, Zabaykal, Amur) and wartime Guards Cossack cavalry divisions (usable by SOV and UKR).

### `SOV_PEN_01` — Penal Units (*Shtrafnaya Chast'*)
*Shtrafnyye chasti* (penal units) formed per Order № 227 ("Not One Step Back!"), maintained as a clean fallback-only list available during war.

### `SOV_NKVD_01` — NKVD Security Divisions (*Diviziya Voisk NKVD*)
Authentic internal troops of the NKVD (VV NKVD) tasked with rear security, railroad protection, and garrison duties; gated strictly for communist government (`can_use = { has_government = communism }`).

### `SOV_AIR_01` — Guards Airborne Divisions (*Gvardeyskaya Vozdushno-Desantnaya Diviziya*)
Authentic Order № 00253 (December 1942) battle honors for the 1st through 10th Guards Airborne Divisions (*Zvenigorodskaya*, *Proskurovskaya*, *Umanskaya*, *Cherkasskaya*, etc.).

### `SOV_ART_01` — Artillery Divisions (*Artilleriyskaya Diviziya*)
Breakthrough Artillery RVGK divisions (*Artilleriyskaya Diviziya Proryva*) of the Supreme Command Reserve, including the 1st–7th Guards Artillery Divisions and distinguished breakthrough formations.

