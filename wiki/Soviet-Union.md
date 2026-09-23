# Soviet Union

**Country Tag:** `SOV` | **Source File:** [`INEX_SOV_names_divisions.txt`](../common/units/names_divisions/INEX_SOV_names_divisions.txt)

---

## Historical Overview

The Red Army underwent the most radical organizational transformation of any belligerent in WWII — from the pre-war rifle divisions numbered in the hundreds, through the catastrophic 1941 losses, to the rebuilt Guards formations and large armored corps of 1943–45. INEX provides complete coverage of all major Soviet formation categories including Guards, Cossacks, NKVD, penal units (*Shtrafbat*), airborne, and artillery divisions. All groups override their vanilla counterparts to ensure proper Russian transliteration and historically grounded entries.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `SOV_INF_01` | Rifle Division | infantry | `%dya Strelkovaya Diviziya` |
| `SOV_CAV_01` | Cavalry Division | cavalry | `%dya Kavaleriyskaya Diviziya` |
| `SOV_MOT_01` | Motor Rifle Division | motorized | `%dya Motostrelkovaya Diviziya` |
| `SOV_MEC_01` | Mechanized Division | mechanized, motorized | `%dya Mekhanizirovanaya Diviziya` |
| `SOV_ARM_01` | Tank Division | light_armor, medium_armor, heavy_armor, modern_armor | `%dya Tankovaya Diviziya` |
| `SOV_ARM_02` | Tank Corps | light_armor, medium_armor, heavy_armor, modern_armor | `%dya Tankovaya Korpus` |
| `SOV_ARM_03` | Guard Tank Corps | light_armor, medium_armor, heavy_armor, modern_armor | `%dya Gvardeiskaya Tankovaya Korpus` |
| `SOV_ARM_04` | Tank Brigade | light_armor, medium_armor, heavy_armor, modern_armor | `%dya Tankovaya Brigada` |
| `SOV_PAR_01` | Paratrooper Division | paratrooper | `%dya Vozdushno-Desantnaya Div.` |
| `SOV_MAR_01` | Marine Division | marine | `%dya Diviziya Morskoi Pekhoty` |
| `SOV_MNT_01` | Mountain Rifle Division | mountaineers | `%dya Gornostrelkovaya Diviziya` |
| `SOV_GAR_01` | Garrison Division | infantry | `%dya NKVD Pogranichnaya Diviziya` |
| `SOV_GRD_01` | Guards Rifles | infantry | `%dya Gvardyeiskaya Strelk. Div.` |
| `SOV_GMC_01` | Guards Mechanized | mechanized, motorized | `%dya Gvds. Mekhanizirovanaya Korpus` |
| `SOV_GTC_01` | Guards Tanks | light_armor, medium_armor, heavy_armor, modern_armor | `%dya Gvds. Tankovaya Korpus` |
| `SOV_PEN_01` | Cossack Cavalry Division | cavalry | `%dya Kazachya Kavaleriyskaya Diviziya` |
| `SOV_NKVD_01` | Penal Units | infantry | `%dya Shtrafnaya Chast` |
| `SOV_AIR_01` | NKVD Security Divisions | infantry | `%d-ya Diviziya NKVD Bezopasnosti` |
| `SOV_ART_01` | Guards Airborne Divisions | paratrooper | `%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya` |
| *(unnamed)* | Artillery Divisions | artillery | `%d-ya Artillyeriyskaya Diviziya` |

> All groups override their vanilla equivalents — vanilla Soviet entries for these tags are completely replaced by INEX's versions.

---

## Group Details

### `SOV_INF_01` — Rifle Divisions (Strelkovaya Diviziya)
The backbone of the Red Army. The list covers the full historical numbered series of Soviet Rifle divisions (over 600 were raised during the war). Uses authentic Russian transliteration (*Strelkovaya Diviziya*, not *Rifle Division*).

### `SOV_CAV_01` — Cavalry Divisions
Soviet cavalry remained relevant throughout the war in exploitation and deep-operation roles. Covers the numbered *Kavaleriyskaya Diviziya* series.

### `SOV_MOT_01` / `SOV_MEC_01` — Motor Rifle / Mechanized
Motor Rifle divisions (*Motostrelkovaya*) and Mechanized divisions (*Mekhanizirovanaya*). These were often converted from rifle divisions or formed fresh for offensive operations.

### `SOV_ARM_01` / `SOV_ARM_02` / `SOV_ARM_04` — Tank Formations
Three tank lists cover the organizational evolution of Soviet armor:
- **Tank Divisions** — the pre-war and early-war structure, largely destroyed in 1941
- **Tank Corps** — the rebuilt 1942–43 armored formations (*Tankovaya Korpus*)
- **Tank Brigades** — the independent tank brigades used throughout the war

### `SOV_ARM_03` — Guard Tank Corps
Elite Guards-designation tank corps, earned through distinguished combat performance. Entries use the *Gvardeiskaya* prefix.

### `SOV_GRD_01` — Guards Rifles
Guards-designation rifle divisions, the elite of the Soviet infantry. The Guards title was awarded for outstanding combat performance and came with enhanced equipment priority.

### `SOV_GMC_01` / `SOV_GTC_01` — Guards Mechanized / Guards Tanks
Guards mechanized and tank corps — the premier assault formations of Soviet deep-battle doctrine from 1943 onward.

### `SOV_GAR_01` — Garrison / NKVD Border Divisions
NKVD (*People's Commissariat for Internal Affairs*) border guard divisions. These formations policed borders, rear areas, and served as blocking units during major offensives.

### `SOV_PEN_01` — Cossack Cavalry Divisions
The Cossack formations revived during WWII, both Soviet Don and Kuban Cossack cavalry corps that fought on the Eastern Front.

### `SOV_NKVD_01` — Penal Units (Shtrafbat / Shtrafnaya Chast)
*Shtrafnyye chasti* (penal units) — formed from soldiers convicted of crimes or dereliction, used as cannon fodder in high-risk assaults per Order No. 227 ("Not One Step Back").

### `SOV_AIR_01` — NKVD Security Divisions
Internal security divisions of the NKVD, distinct from border guards, used for rear-area control, anti-partisan operations, and enforcement.

### `SOV_ART_01` — Guards Airborne / Artillery Divisions
Covers the Guards Airborne (*Gvardeyskaya Vozdushno-Desantnaya*) formations and Artillery Divisions (*Artillyeriyskaya Diviziya*) — the large combined-arms artillery formations of Soviet operational artillery.

### `SOV_MAR_01` — Marine Divisions (Naval Infantry)
Soviet naval infantry (*Morskaya Pekhota*) divisions. Many Black Sea Fleet, Baltic Fleet, and Northern Fleet sailors were converted to shore infantry during the desperate defensive battles of 1941–42.

### `SOV_MNT_01` — Mountain Rifle Divisions
*Gornostrelkovaya Diviziya* — specialized mountain infantry for the Caucasus and Central Asian theatres.

### `SOV_PAR_01` — Paratrooper / Airborne Divisions
*Vozdushno-Desantnaya Diviziya* — Soviet airborne formations. The Red Army's airborne arm was largely committed as ground infantry after the 1942 reorganization but retains its authentic designation in INEX.

