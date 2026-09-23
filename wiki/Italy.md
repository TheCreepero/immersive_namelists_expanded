# Italy

**Country Tag:** `ITA` | **Source File:** [`INEX_ITA_names_divisions.txt`](../common/units/names_divisions/INEX_ITA_names_divisions.txt)

---

## Historical Overview

The Regio Esercito (Royal Italian Army) is one of the most richly named in INEX, with distinct naming traditions for the Alpini mountain elite, Bersaglieri (light mobile infantry), cavalry (including camel-mounted *Meharisti*), colonial irregular forces (*Dubati*, *Savari*, *Zaptié*), and Italian partisan formations (*Garibaldini*, *Giustizia e Libertà*, *Fiame Verdi*, *Matteotti*). Post-armistice groups cover the RSI (Italian Social Republic — Fascist) and the Italian Co-Belligerent Army.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `ITA_INF_01` | Infantry Division | infantry | `%sª Divisione di Fanteria` |
| `ITA_INF_02` | CC.NN. Infantry Division | militia | *(Blackshirt format)* |
| `ITA_MONCH_01` | CC.NN. Div. (Monarchist) | infantry, mechanized, mountaineers, paratrooper, marine | *(Monarchist Blackshirt format)* |
| `ITA_COM_01` | Communist Division | infantry, mechanized, mountaineers, paratrooper, marine | *(Communist format)* |
| `ITA_COL_01` | Colonial Division | infantry | *(colonial format)* |
| `ITA_COL_02` | Irregular Bands | irregular_infantry | *(irregular band format)* |
| `ITA_COL_03` | Dubat Bands | irregular_infantry | *(Dubat format)* |
| `ITA_CAV_01` | Cavalry Regiment | cavalry | `%sº Reggimento di Cavalleria` |
| `ITA_CAV_02` | Cavalry Division | cavalry | *(cavalry division format)* |
| `ITA_CAV_03` | Colonial Cavalry | cavalry | *(colonial cavalry format)* |
| `ITA_CAV_04` | Savari Squadron Groups | cavalry | *(Savari format)* |
| `ITA_CAV_05` | Spahis Squadron Groups | cavalry, camelry | *(Spahis format)* |
| `ITA_CAV_06` | Mounted Irregular Bands | cavalry | *(mounted irregular format)* |
| `ITA_GAL_01` | Garibaldi Division | militia | *(Garibaldini partisan format)* |
| `ITA_GEL_01` | Giustizia e Libertà Formation | militia | *(GL partisan format)* |
| `ITA_MAT_01` | Matteotti Division | militia | *(Matteotti partisan format)* |
| `ITA_AUT_01` | Autonome Division | militia | *(Autonome partisan format)* |
| `ITA_FAV_01` | Fiame Verdi Division | militia | *(Green Flames partisan format)* |
| `ITA_ALT_01` | Other Partisan Formations | militia | *(other partisan format)* |
| `ITA_MOT_01` | Motorized Division | motorized | *(Div. Motorizzata format)* |
| `ITA_MEC_01` | Mechanized Division | mechanized | *(Div. Celere format)* |
| `ITA_ARM_01` | Armored Division | light_armor, medium_armor, heavy_armor, modern_armor | `%sª Divisione Corazzata` |
| `ITA_MAR_01` | Marine Regiment | marine | *(marine regiment format)* |
| `ITA_MAR_02` | Marine Division | marine | *(San Marco format)* |
| `ITA_MNT_01` | Mountain Division | mountaineers | `%sª Divisione Alpina` |
| `ITA_PAR_01` | Paratrooper Division | paratrooper | *(paratrooper format)* |
| `ITA_FES_01` | Defence Brigades | infantry | *(fortress format)* |
| `ITA_GAR_01` | Garrison Division | infantry | *(garrison format)* |
| `ITA_ROM_01` | Legione Romana | infantry, light_armor, medium_armor, heavy_armor, modern_armor | *(Roman Legion format)* |

---

## Group Details

### `ITA_INF_01` — Infantry Divisions
Core Italian infantry divisions with Roman numeral ordinals as used by the Regio Esercito (e.g., *Iª Divisione di Fanteria "Superba"*, *IIª Divisione Ravenna*). Covers all numbered infantry divisions through the war plus the Series B reserve divisions.

### `ITA_INF_02` / `ITA_MONCH_01` — CC.NN. Blackshirt Divisions
The *Camicie Nere* (CCNN) — Blackshirt divisions of the MVSN (*Milizia Volontaria per la Sicurezza Nazionale*). `ITA_MONCH_01` uses `can_use` restricted to monarchist or fascist government types.

### `ITA_COM_01` — Communist Divisions
Italian Communist Party formations — available under communist government type.

### `ITA_COL_01` — Colonial Divisions
*Divisioni Coloniali* from Libya (1a–5a Libica), Italian East Africa (Eritrea, Somalia), and the *Camicie Nere* colonial formations in Africa.

### `ITA_COL_02` / `ITA_COL_03` — Irregular Bands / Dubat Bands
*Bande Irregolari* and *Dubati* — Somali and Eritrean irregular infantry auxiliary units recruited locally.

### `ITA_CAV_01` — Cavalry Regiments
Italian cavalry regiments with their historic names: *Nizza Cavalleria*, *Piemonte Reale Cavalleria*, *Savoia Cavalleria*, *Genova Cavalleria*, *Novara Lancieri*, *Vittorio Emanuele II*, *Milano*, *Montebello*, *Lodi*, *Guides*, *Alessandria*, *Saluzzo*, *Monferrato*, *Guide* (14 named regiments historically).

### `ITA_CAV_02` — Cavalry Divisions
*Divisione Celere* (fast cavalry divisions) — Italy's combined-arms mobile divisions.

### `ITA_CAV_03` — Colonial Cavalry
*Cavalleria Coloniale* — colonial cavalry regiments from Eritrea and Libya.

### `ITA_CAV_04` / `ITA_CAV_05` — Savari / Spahis
*Savari* (North African cavalry) and *Spahis* (Libyan cavalry including camel-mounted formations — `camelry` type).

### `ITA_GAL_01` — Garibaldini Partisans
The Communist *Brigata Garibaldi* partisan network — the largest Italian partisan organization, linked to the PCI (Italian Communist Party). 47 named partisan divisions.

### `ITA_GEL_01` — Giustizia e Libertà (GL) Formations
The liberal-socialist *Giustizia e Libertà* partisan formations, second largest of the Italian partisan movement. 33 named formations.

### `ITA_MAT_01` — Matteotti Divisions
*Brigate Matteotti* — socialist partisan formations named after Giacomo Matteotti, the socialist deputy murdered by the Fascists in 1924. 12 named divisions.

### `ITA_AUT_01` — Autonome Divisions
*Formazioni Autonome* — non-partisan, monarchist-leaning Italian partisan formations loyal to the Italian government in the south. 15 named.

### `ITA_FAV_01` — Fiame Verdi (Green Flames)
*Fiame Verdi* — Catholic partisan formations associated with the Christian Democratic resistance. 4 named.

### `ITA_ALT_01` — Other Partisan Formations
Mixed and unaffiliated Italian partisan formations. 8 named.

### `ITA_ARM_01` — Armored Divisions (Divisioni Corazzate)
Italian armored divisions: *Ariete*, *Centauro*, *Littorio*, *M* (Armored), and expanded numbered series.

### `ITA_MNT_01` — Alpine Divisions (Divisioni Alpine)
The elite Alpini mountain troops — arguably the most celebrated branch of the Regio Esercito. Named entries: *Taurinense*, *Tridentina*, *Julia*, *Cuneense*, *Pusteria*, *Alpi Graie*, *Vicenza*. 8 named, with fallback `%sª Divisione Alpina`.

### `ITA_PAR_01` — Paratrooper Divisions (Paracadutisti)
Italian paratroopers, including the famous *Folgore* division (59a), *Nembo* (185a), and *Ciclone* (184a).

### `ITA_FES_01` — Defence Brigades (Fortezza)
Italian fortress brigades defending strategic positions in the Alps, Sicily, and Italian island garrisons.

### `ITA_ROM_01` — Legione Romana
Alternate-history Roman Legion-styled formations for fascist or neo-imperial Italy playthroughs.

