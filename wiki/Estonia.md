# Estonia

**Country Tag:** `EST` | **Source File:** [`INEX_EST_names_divisions.txt`](../common/units/names_divisions/INEX_EST_names_divisions.txt)

---

## Historical Overview

The Estonian Defence Forces (*Eesti Kaitsevägi*) were organized around 10 peacetime infantry regiments (*Jalaväerügement*), designed to mobilize into wartime divisions. Unique to Estonia is a rich tradition of named elite battalions (the Kuperjanovi and Sakala *Partisanide Rügement*), a volunteer defence league (the *Kaitseliit* with its 15 county and urban *malevad*), an armored heritage rooted in legendary named armored trains and armored cars from the 1918–20 War of Independence, and coastal fortress batteries defending Tallinn Bay.

All Estonian names use the correct **nominative case** (e.g., *Jalaväediviis*, not the vanilla error *diviisi*) and proper Estonian diacritics (õ, ä, ö, ü).

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `EST_REG_01` | Infantry Regiment | infantry | `%d. Jalaväerügement` |
| `EST_KL_01` | Defense Formations (Kaitseliit) | infantry | `%d. Kaitseliidu Malev` |
| `EST_ARM_02` | Armored & Mobile Divisions | light_armor, medium_armor, heavy_armor, modern_armor, motorized, mechanized | `%d. Soomusdiviis` |
| `EST_MAR_02` | Coastal Defense & Marines | marine | `%d. Meredessantrügement` |

---

## Group Details

### `EST_REG_01` — Infantry Regiments (Jalaväerügement)
The Estonian Army's 10 peacetime infantry regiments plus the famous elite and volunteer formations:

**Historical peacetime regiments (1–10):**
1.–10. *Jalaväerügement*

**Elite and volunteer formations (11–25):**
| # | Name | Notes |
|:--|:---|:---|
| 11 | *Kuperjanovi Partisanide Rügement* | Famous partisan regiment of the War of Independence |
| 12 | *Sakala Partisanide Rügement* | Partisan regiment named for historic Sakalland region |
| 13 | *Kalevlaste Maleva Jalaväerügement* | Kalevlaste (Sons of Kalev) volunteer regiment |
| 14 | *Scoutsrügement* | Elite scout/ranger regiment |
| 15 | *Tallinna Vahirügement* | Tallinn Guard Regiment |
| 16 | *Ingeri Jalaväepolk* | Ingrian Finnish volunteer regiment |
| 17 | *Balti Pataljon* | Baltic German volunteer battalion |
| 18–25 | Regional defence battalions | *Peipsi*, *Viljandi*, *Järvamaa*, *Tartu*, *Pärnu*, *Saaremaa*, *Narva*, *Võru Kaitsepataljon* |

**Fallback:** `%d. Jalaväerügement` (Arabic numeral, period-separated — matching Estonian military convention)

### `EST_KL_01` — Kaitseliit (Defence League) Formations
The *Kaitseliit* was Estonia's national volunteer defence organization, structured into 15 county and city *malevad* (league formations) plus specialized urban companies (*malevkonnad*).

**County and city malevad (1–15):**
*Tallinna malev*, *Tartu malev*, *Narva malev*, *Pärnu malev*, *Harju malev*, *Järva malev*, *Viru malev*, *Lääne malev*, *Saaremaa malev*, *Sakalamaa malev*, *Pärnumaa malev*, *Tartumaa malev*, *Valgamaa malev*, *Võrumaa malev*, *Petserimaa malev*

**Urban and specialized malevkonnad (16–25):**
*Toompea malevkond*, *Raudtee malevkond* (Railway), *Sadama malevkond* (Port), *Nõmme malevkond*, *Põhja malevkond* (North), *Lõuna malevkond* (South), *Ida malevkond* (East), *Tehniline malevkond* (Technical), *Õppurmalevkond* (Student), *Alutaguse malev*

**Fallback:** `%d. Kaitseliidu Malev`

### `EST_ARM_02` — Armored & Mechanized Formations (Soomusdiviis)
Estonian armor draws on the rich tradition of named armored trains and armored cars from the 1918–20 War of Independence. Vehicles and trains were given individual names that became symbols of national military pride.

**Armored divisions and brigades (named vehicles and formations):**
| # | Name | Notes |
|:--|:---|:---|
| 1 | *Soomusdiviis 'Kapten Irv'* | Named armored train commander |
| 2 | *Soomusbrigaad 'Suur Tõll'* | Legendary armored car — giant from Estonian mythology |
| 3 | *Soomusbrigaad 'Tasuja'* | "The Avenger" — armored car |
| 4 | *Soomusbrigaad 'Kalevipoeg'* | Mythological Estonian hero |
| 5 | *Soomusbrigaad 'Estonia'* | National name |
| 6–10 | Soomuskolonn | *Vanapagan*, *Wahur*, *Toonela*, *Pisuhänd*, *Wibulane* — all mythological creatures |
| 11 | *Auto-tankirügement* | Tank regiment |
| 12 | *Soomusrongirügement* | Armored train regiment |
| 13–18 | *Laiarööpmeline Soomusrong* | Broad-gauge armored trains 1–6 |
| 19–23 | *Kitsarööpmeline Soomusrong* | Narrow-gauge armored trains 1–5 |
| 24–25 | *Tankipataljon* | Tank battalions |

**Fallback:** `%d. Soomusdiviis`

### `EST_MAR_02` — Coastal Defense & Marines (Meredessant)
Covers Estonian coastal fortress batteries, naval assault troops, and marine formations:

**Coastal fortresses:**
- *Aegna Merekindlus* — Aegna Island fortress, Tallinn Bay
- *Naissaare Merekindlus* — Naissaar Island fortress
- *Suuropi Merekindlus* — Suurupi fortress

**Marine assault:**
- *Eesti Meredessantpataljon* — Estonian naval assault battalion
- *Meredessantrügement* 1–7 — Marine assault regiments
- *Saaremaa Rannakaitsepataljon*, *Hiiumaa Rannakaitsepataljon* — Island coastal defence
- *Peipsi Laevastiku Dessantpataljon* — Lake Peipus fleet assault battalion

**Coastal batteries:**
*Viimsi*, *Kakumäe*, *Sõrve*, *Tahkuna Rannakaitsepatarei* — named batteries at key positions

**Fallback:** `%d. Meredessantrügement`

