# Soviet Union

**Country Tag:** `SOV` | **Source File:** [`zz_INEX_SOV_names_divisions.txt`](../common/units/names_divisions/zz_INEX_SOV_names_divisions.txt)

---

## Historical Overview

The Red Army underwent the most radical organizational transformation of any belligerent in WWII — from the pre-war rifle divisions numbered in the hundreds, through the catastrophic 1941 losses, to the rebuilt Guards formations and large armored corps of 1943–45. INEX keeps vanilla's historical division numbers and gives a division only the battle honour it actually held. It adds national divisions, fortified regions, naval brigades and mechanized corps, and four government-gated suites: partisans (communism), the Imperial Guard (neutrality), White volunteer divisions (fascism) and republican shock divisions (democratic).

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `SOV_INF_01` | Rifle Divisions | infantry | `%d-ya Strelkovaya Diviziya` |
| `SOV_CAV_01` | Cavalry Divisions | cavalry | `%d-ya Kavaleriyskaya Diviziya` |
| `SOV_MOT_01` | Motor Rifle Divisions | motorized | `%d-ya Motostrelkovaya Diviziya` |
| `SOV_MEC_01` | Mechanized Divisions | mechanized, motorized | `%d-ya Mekhanizirovannaya Diviziya` |
| `SOV_MEC_02` | Mechanized Corps | mechanized, motorized | `%d-y Mekhanizirovannyy Korpus` |
| `SOV_ARM_01` | Tank Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d-ya Tankovaya Diviziya` |
| `SOV_ARM_02` | Tank Corps | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Tankovyy Korpus` |
| `SOV_ARM_03` | Guards Tank Corps | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Gvardeyskiy Tankovyy Korpus` |
| `SOV_ARM_04` | Tank Brigades | light_armor, medium_armor, heavy_armor, modern_armor | `%d-ya Tankovaya Brigada` |
| `SOV_PAR_01` | Airborne Divisions | paratrooper | `%d-ya Vozdushno-Desantnaya Diviziya` |
| `SOV_MAR_01` | Naval Infantry Divisions | marine | `%d-ya Diviziya Morskoy Pekhoty` |
| `SOV_MAR_02` | Naval Rifle Brigades | marine | `%d-ya Morskaya Strelkovaya Brigada` |
| `SOV_MNT_01` | Mountain Rifle Divisions | mountaineers | `%d-ya Gornostrelkovaya Diviziya` |
| `SOV_GAR_01` | Garrison Divisions | infantry | `%d-ya Pogranichnaya Diviziya Voisk NKVD` |
| `SOV_UR_01` | Fortified Regions | infantry | `%d-y Ukreplennyy Rayon` |
| `SOV_GRD_01` | Guards Rifle Divisions | infantry | `%d-ya Gvardeyskaya Strelkovaya Diviziya` |
| `SOV_NAT_01` | National Rifle Divisions | infantry | `%d-ya Natsionalnaya Strelkovaya Diviziya` |
| `SOV_GMC_01` | Guards Mechanized Corps | mechanized, motorized | `%d-y Gvardeyskiy Mekhanizirovannyy Korpus` |
| `SOV_GTC_01` | Guards Tank Corps (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Gvardeyskiy Tankovyy Korpus` |
| `SOV_CAV_02` | Cossack Cavalry Divisions | cavalry | `%d-ya Kazachya Kavaleriyskaya Diviziya` |
| `SOV_PEN_01` | Penal Units | infantry | `%d-ya Shtrafnaya Chast` |
| `SOV_NKVD_01` | NKVD Security Divisions | infantry | `%d-ya Diviziya Voisk NKVD` |
| `SOV_AIR_01` | Guards Airborne Divisions | paratrooper | `%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya` |
| `SOV_ART_01` | Artillery Divisions | artillery | `%d-ya Artilleriyskaya Diviziya` |
| `SOV_PRT_01` | Partisan Formations | militia, infantry | `%d-ya Partizanskaya Brigada` |
| `SOV_IMP_01` | Imperial Guard Divisions | infantry | `%d-ya Gvardeyskaya Pekhotnaya Diviziya` |
| `SOV_WHT_01` | White Volunteer Divisions | infantry | `%d-ya Dobrovolcheskaya Diviziya` |
| `SOV_REP_01` | Republican Shock Divisions | infantry | `%d-ya Udarnaya Diviziya` |

> Groups on vanilla tags are merged into the vanilla groups: a vanilla name that INEX does not replace under its number stays in the game. `SOV_MEC_02`, `SOV_MAR_02`, `SOV_UR_01`, `SOV_NAT_01`, `SOV_NKVD_01`, `SOV_AIR_01`, `SOV_ART_01` and the four government-gated groups are new tags. Vanilla's `SOV_INF_02`, `SOV_INF_03` and `SOV_JAP_INF`, which focuses and scripted effects use, stay as vanilla defines them.

---

## Group Details

### `SOV_INF_01` — Rifle Divisions (*Strelkovaya Diviziya*)
The backbone of the Red Army, in vanilla's historical numbering: the list skips the numbers of the mountain and motorized divisions that share its pool, so they keep theirs. Pre-war and Civil War honorifics sit on their own divisions (*Moskovskaya Proletarskaya*, *Chapayevskaya*, *Samaro-Ulyanovskaya*, *imeni Proletariata Donbassa*); every other number is plain.

### `SOV_CAV_01` — Cavalry Divisions (*Kavaleriyskaya Diviziya*)
Red Army cavalry in vanilla's historical numbering (*Chernigovskaya*, *Bessarabskaya*, *imeni Blinova*), the Central Asian and Transcaucasian mountain cavalry, the national cavalry divisions of 1941–42 (*Kalmytskaya*, *Bashkirskaya*, *Kabardino-Balkarskaya*) and the 1st–17th Guards Cavalry Divisions (*Rovenskaya*, *Mozyrskaya*).

### `SOV_MOT_01` / `SOV_MEC_01` — Motor Rifle / Mechanized Divisions
The motorized divisions of 1939–41 on their historical numbers, sharing numbering with the rifle divisions, and the NKVD motor rifle divisions with OMSDON *imeni Dzerzhinskogo*. The mechanized divisions carry the titles of their motorized predecessors.

### `SOV_MEC_02` — Mechanized Corps (*Mekhanizirovannyy Korpus*)
The mechanized corps of 1940–45. Only three stayed non-Guards and earned an honorific (*Krasnogradskiy*, *Novoukrainsko-Khinganskiy*, *Kiyevsko-Zhitomirskiy*); the other numbers take the fallback, and the Guards corps are in `SOV_GMC_01`.

### `SOV_ARM_01` / `SOV_ARM_02` / `SOV_ARM_04` — Tank Formations
- **Tank Divisions (`SOV_ARM_01`)** — the 1940–41 tank divisions, a plain fallback-only list.
- **Tank Corps (`SOV_ARM_02`)** — every non-Guards tank corps that held a battle honour in 1945 (*Insterburgskiy*, *Dvinskiy*, *Bobruysko-Berlinskiy*, *Vislenskiy*).
- **Tank Brigades (`SOV_ARM_04`)** — independent tank brigades, a plain fallback-only list.

### `SOV_ARM_03` — Guards Tank Corps (*Gvardeyskiy Tankovyy Korpus*)
The plain variant, numbers only and available at war as in vanilla. `SOV_GTC_01` is the named variant and shares its numbering.

### `SOV_GTC_01` — Guards Tank Corps (Named)
All twelve Guards Tank Corps with their battle honours (*Donskoy*, *Tatsinskiy*, *Kantemirovskiy*, *Uralsko-Lvovskiy*); the 8th held none.

### `SOV_GMC_01` — Guards Mechanized Corps (*Gvardeyskiy Mekhanizirovannyy Korpus*)
All nine Guards Mechanized Corps with their battle honours (*Venskiy*, *Nikolayevsko-Budapeshtskiy*, *Stalingradskiy*, *Zimovnikovskiy*).

### `SOV_PAR_01` — Airborne Divisions (*Vozdushno-Desantnaya Diviziya*)
A plain fallback-only list; the Guards airborne divisions are in `SOV_AIR_01`.

### `SOV_AIR_01` — Guards Airborne Divisions (*Gvardeyskaya Vozdushno-Desantnaya Diviziya*)
The 1st–10th Guards Airborne Divisions of December 1942 with their battle honours (*Zvenigorodskaya*, *Proskurovskaya*, *Cherkasskaya*), the 11th–16th of 1944, and the divisions of 1944–46 in vanilla's numbers (*76-ya Chernigovskaya*, *98-ya Svirskaya*, *106-ya Tulskaya*).

### `SOV_MAR_01` — Naval Infantry Divisions (*Diviziya Morskoy Pekhoty*)
The 1st *Mozyrskaya* Naval Infantry Division of the Baltic Fleet (1944–48), then divisions named after the fleets and flotillas. These are extrapolated: the wartime naval infantry fought as brigades (`SOV_MAR_02`).

### `SOV_MAR_02` — Naval Rifle Brigades (*Morskaya Strelkovaya Brigada*)
The fleets' naval infantry brigades (*Pechengskaya*, *Kirkenesskaya*, *Novorossiysko-Dunayskaya*, *Tamanskaya*) and the numbered naval rifle brigades of 1941–42, sailors who fought on the land fronts.

### `SOV_MNT_01` — Mountain Rifle Divisions (*Gornostrelkovaya Diviziya*)
Mountain infantry for the Caucasus and Central Asia in vanilla's historical numbering (*Kavkazskaya*, *Gruzinskaya*, *Armyanskaya*, *Azerbaydzhanskaya*, *Turkestanskaya*).

### `SOV_GAR_01` — Garrison Divisions
NKVD border, railway protection and rifle divisions, the 1941 volunteer *Narodnoye Opolcheniye* divisions of Moscow and Leningrad (*Kirovskaya*, *Krasnopresnenskaya*, *Rostokinskaya*) and the Moscow Communist divisions.

### `SOV_UR_01` — Fortified Regions (*Ukreplennyy Rayon*)
The fortified regions of the Stalin Line, the 1940–41 frontier (Molotov Line), Leningrad and Karelia, the Transcaucasus and the Far East on their June 1941 numbers (*Karelskiy*, *Kiyevskiy*, *Brestskiy*, *Grodekovskiy*), and the field fortified regions of 1941 (*Mozhayskiy*, *Volokolamskiy*).

### `SOV_GRD_01` — Guards Rifle Divisions (*Gvardeyskaya Strelkovaya Diviziya*)
Guards rifle divisions with the battle honour each held (*Panfilovskaya*, *Poltavskaya*, *Yelninskaya*, *Svirskaya*), including the Latvian 43rd *Rizhskaya* and the Estonian 118th *Tallinnskaya*.

### `SOV_NAT_01` — National Rifle Divisions
Rifle divisions raised in the Union republics in 1941–45, on their real numbers and sharing numbering with `SOV_INF_01`: Latvian, Lithuanian (*16-ya Klaypedskaya*), Estonian, Armenian (*89-ya Tamanskaya*), Azerbaijani (*416-ya Taganrogskaya*), Georgian, Karelo-Finnish and Kazakh.

### `SOV_CAV_02` — Cossack Cavalry Divisions (*Kazachya Kavaleriyskaya Diviziya*)
Divisions named after the Cossack hosts (Don, Kuban, Terek, Stavropol, Ural, Orenburg, Transbaikal, Amur; extrapolated) and the four Guards Cossack divisions: the 9th and 10th Kuban, the 11th *Volnovakhskaya* and the 12th *Korsunskaya* Don. Usable by SOV and UKR, as in vanilla.

### `SOV_PEN_01` — Penal Units (*Shtrafnaya Chast*)
*Shtrafnyye chasti* (penal units) formed per Order № 227 ("Not One Step Back!"), a fallback-only list available during war.

### `SOV_NKVD_01` — NKVD Security Divisions (*Diviziya Voisk NKVD*)
The six named NKVD rifle divisions that formed the Separate NKVD Army in 1942 (*Dalnevostochnaya*, *Zabaykalskaya*, *Sibirskaya*, *Uralskaya*, *Sredneaziatskaya*, *Stalingradskaya*); numbered divisions take the fallback. Gated to communist governments.

### `SOV_ART_01` — Artillery Divisions (*Artilleriyskaya Diviziya*)
Breakthrough artillery divisions of the Supreme Command Reserve (RVGK) on their own numbers (*Gumbinnenskaya*, *Sivashsko-Shtettinskaya*, *Drezdenskaya*) and the six Guards artillery divisions (*Glukhovskaya*, *Rizhsko-Khinganskaya*).

### `SOV_PRT_01` — Partisan Formations
Communist only. Kovpak's 1st Ukrainian Partisan Division, the Ukrainian raiding formations (*Sumskoye*, *Chernigovsko-Volynskoye*), Belarusian brigades (*Chekist*, *Zheleznyak*), the Leningrad brigades and the Crimean formations.

### `SOV_IMP_01` — Imperial Guard Divisions
Neutrality only, for a monarchist restoration. The three Guards infantry divisions of 1914 carry the names of their senior regiments (*Preobrazhenskaya*, *Moskovskaya*, *Litovskaya*); further divisions take the other Leib-Guard regiments (*Semyonovskaya*, *Izmaylovskaya*, *Tsarskoselskaya*).

### `SOV_WHT_01` — White Volunteer Divisions
Fascist only. The colored divisions of the Volunteer Army (*Kornilovskaya*, *Markovskaya*, *Drozdovskaya*, *Alekseyevskaya*), Kolchak's named divisions (*Izhevskaya*, *15-ya Votkinskaya*) and the North-Western Army's regiment towns as division titles (*Talabskaya*; extrapolated).

### `SOV_REP_01` — Republican Shock Divisions
Democratic only. The People's Army of the Komuch of 1918 (*2-ya Syzranskaya*) with Volga town titles (extrapolated), and the shock and women's battalions of 1917 (*1-y Russkiy Zhenskiy Batalyon Smerti*).