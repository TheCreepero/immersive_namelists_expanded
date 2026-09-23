# Latvia

**Country Tag:** `LAT` | **Source File:** [`INEX_LAT_names_divisions.txt`](../common/units/names_divisions/INEX_LAT_names_divisions.txt)

---

## Historical Overview

The Latvian National Army (*Latvijas Nacionālā Armija*) was organized around four provincial divisions matching Latvia's historic regions: Kurzeme, Vidzeme, Latgale, and Zemgale. It drew on the legendary *Latviešu strēlnieki* (Latvian Riflemen) tradition from WWI — arguably the finest light infantry of the Tsarist army — as well as a volunteer defence organization (*Aizsargi*), named armored trains and armored cars, and distinct cavalry regiments with provincial identities.

All Latvian names use correct Latvian grammar and diacritics (ā, č, ē, ģ, ī, ķ, ļ, ņ, š, ū, ž).

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `LAT_INF_01` | Infantry Division | infantry | `%d. Kājnieku divīzija` |
| `LAT_REG_01` | Infantry Regiment | infantry | `%d. Kājnieku pulks` |
| `LAT_AIZ_01` | Aizsargi Formations | infantry | `%d. Aizsargu pulks` |
| `LAT_ARM_02` | Armored & Mobile Divisions | light_armor, medium_armor, heavy_armor, modern_armor, motorized, mechanized | `%d. Bruņudivīzija` |
| `LAT_MAR_02` | Coastal Defense & Marines | marine | `%d. Jūras kājnieku pulks` |
| `LAT_CAV_01` | Cavalry Regiment | cavalry | `%d. Jātnieku pulks` |
| `LAT_CAV_02` | Cavalry Squadrons & Partisans | cavalry | `%d. Atsevišķais jātnieku eskadrons` |

---

## Group Details

### `LAT_INF_01` — Infantry Divisions (Kājnieku divīzija)
Four historical provincial divisions plus eight mobilization-expansion regional divisions:

**Historical provincial divisions (1–4):**
| # | Name |
|:--|:---|
| 1 | *1. Kurzemes kājnieku divīzija* |
| 2 | *2. Vidzemes kājnieku divīzija* |
| 3 | *3. Latgales kājnieku divīzija* |
| 4 | *4. Zemgales kājnieku divīzija* |

**Mobilization regional divisions (5–12):**
*Rīgas*, *Sēlijas*, *Ziemeļlatvijas*, *Dienvidlatvijas*, *Malienas*, *Augškurzemes*, *Liepājas*, *Daugavpils* kājnieku divīzijas.

**Numbered fallback entries (13–30):** `%d. Kājnieku divīzija`

### `LAT_REG_01` — Infantry Regiments (Kājnieku pulks)
Twelve peacetime infantry regiments named after cities plus elite and historical formations:

**Peacetime city regiments (1–12):**
*Liepājas*, *Ventspils*, *Jelgavas*, *Valmieras*, *Cēsu*, *Rīgas*, *Siguldas*, *Daugavpils*, *Rēzeknes*, *Aizputes*, *Dobeles*, *Bauskas kājnieku pulks*

**Elite and historical formations (13–32):**
| # | Name | Notes |
|:--|:---|:---|
| 13 | *Kalpaka bataljons* | Named for Colonel Briedis (Kalpaka) |
| 14 | *Atsevišķais studentu bataljons* | Student battalion |
| 15 | *Cēsu rotu pulks* | Cēsis regiment |
| 16 | *Neatkarības bataljons* | Independence battalion |
| 17 | *Ziemeļlatvijas partizānu pulks* | North Latvian partisan regiment |
| 18 | *Latgales partizānu pulks* | Latgale partisan regiment |
| 19 | *Augškurzemes partizānu pulks* | Upper-Kurzeme partisan regiment |
| 20 | *Kara skolas kadetu bataljons* | Military academy cadet battalion |
| 21–28 | *Latviešu strēlnieku pulks* 1–8 | The WWI Latvian Riflemen regiments (Daugavgrīvas, Rīgas, Kurzemes, Vidzemes, Zemgales, Tukuma, Bauskas, Valmieras) |
| 29–32 | *Robežsargu pulks* 1–4 | Border guard regiments (Dagdas, Zilupes, Abrenes, Krāslavas) |

### `LAT_AIZ_01` — Aizsargi (Home Guard Formations)
The *Aizsargi* — Latvia's paramilitary home guard organization, organized into 19 county and city regiments plus specialized detachments:

**County and city regiments (1–19):**
*Talsu*, *Ventspils*, *Kuldīgas*, *Liepājas*, *Rīgas*, *Jelgavas*, *Bauskas*, *Valmieras*, *Cēsu*, *Valkas*, *Madonas*, *Ilūkstes*, *Jēkabpils*, *Abrenes*, *Ludzas*, *Rēzeknes*, *Daugavpils*, *Tukuma aizsargu pulks*, *Rīgas pilsētas aizsargu pulks*

**Specialized detachments (20–24):**
- *Dzelzceļu aizsargu pulks* — Railway Guard regiment
- *Aizsargu aviācijas pulks* — Aviation Guard regiment
- *Aizsargu motorizētais pulks* — Motorized Guard regiment
- *Jūras aizsargu divizions* — Naval Guard division
- *Aizsargu sakaru bataljons* — Communications battalion

### `LAT_ARM_02` — Armored & Mechanized (Bruņudivīzija)
Named after legendary armored vehicles and armored trains from the Latvian War of Independence:

**Named armored formations:**
| # | Name | Notes |
|:--|:---|:---|
| 1 | *Bruņudivīzija 'Lāčplēsis'* | Mythological Latvian hero ("Bear-slayer") |
| 2 | *Bruņubrigāde 'Imanta'* | Legendary medieval Latvian chieftain |
| 3 | *Bruņubrigāde 'Kurzemnieks'* | "Man of Kurzeme" |
| 4 | *Bruņubrigāde 'Viesturs'* | Medieval Latvian leader Viesturs |
| 5 | *Bruņubrigāde 'Zemgalietis'* | "Man of Zemgale" |
| 6 | *Bruņubrigāde 'Tālivaldis'* | Prince Tālivaldis of Tālava |
| 7–10 | Bruņukolonna | *Sargs*, *Latvietis*, *Staburags*, *Pērkons* (Thunder) |
| 11 | *Autotanku pulks* | Tank regiment |
| 12 | *Bruņuvilcienu pulks* | Armored train regiment |
| 13 | *Bruņuvilciens 'Kalpaks'* | Named armored train |
| 14 | *Bruņuvilciens 'Komandieris'* | "The Commander" |
| 15 | *Bruņuvilciens 'Krišjānis Barons'* | Named for national poet |
| 16 | *Bruņuvilciens 'Pirmās'* | "The First" |
| 17–18 | *Tanku bataljons* | 1st–2nd Tank battalions |
| 19 | *Motorizētais kājnieku pulks* | Motorized infantry regiment |
| 20 | *Mehanizētais izlūku bataljons* | Mechanized reconnaissance battalion |

### `LAT_MAR_02` — Coastal Defense & Marines (Jūras kājnieku)
Coastal fortresses and naval infantry formations:
- *Daugavgrīvas krasta cietoksnis* — Daugavgriva fortress (at Riga)
- *Mangaļsalas krasta nocietinājumi* — Mangaļsala fortifications
- *Liepājas krasta cietoksnis* — Liepāja fortress
- *Bolderājas jūras garnizons* — Bolderāja naval garrison
- *Ventspils krasta garnizons* — Ventspils garrison
- *Jūras kājnieku pulks* 1–2 — Naval infantry regiments
- *Kolkas*, *Ainažu krasta aizsardzības bataljons* — Coastal defence battalions
- *Jūras krastu apsardzības pulks* — Coastal guard regiment

### `LAT_CAV_01` — Cavalry Regiments (Jātnieku pulks)
Six provincial cavalry regiments:
*1. Jātnieku pulks*, *2. Latgales jātnieku pulks*, *3. Kurzemes jātnieku pulks*, *4. Vidzemes jātnieku pulks*, *5. Zemgales jātnieku pulks*, *6. Sēlijas jātnieku pulks* — then numbered fallback.

### `LAT_CAV_02` — Cavalry Squadrons & Partisans
Independent cavalry squadrons and partisan horse detachments:
*Atsevišķais jātnieku divizions*, *Kalpaka jātnieku eskadrons*, *Studentu jātnieku eskadrons*, *Ziemeļlatvijas jātnieku eskadrons*, *Latgales partizānu jātnieku eskadrons*, *Augškurzemes partizānu jātnieku eskadrons*, city-garrison squadrons (Cēsis, Rīga, Liepāja, Daugavpils, Jelgava, Valmiera, Ventspils), *Aizsargu jātnieku eskadrons*.

