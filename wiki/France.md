# France

**Country Tag:** `FRA` | **Source File:** [`INEX_FRA_names_divisions.txt`](../common/units/names_divisions/INEX_FRA_names_divisions.txt)

---

## Historical Overview

France's *Armée de Terre* entered WWII with a large but doctrinally constrained force structure. After the 1940 defeat, French military identity split between Vichy France, Free French Forces (*Forces Françaises Libres*), and eventually the *Forces Françaises de l'Intérieur* (FFI). INEX provides extensive coverage of all phases: pre-war infantry divisions with their historical Roman-numeral corps designations, colonial formations from North Africa, West Africa, and Indochina, cavalry and armored divisions, Garde Nationale mobile units, and post-liberation metropolitan infantry. All French names use proper French diacritics (*1ère Division d'Infanterie*, *Chasseurs Alpins*).

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `FRA_INF_01` | Infantry Division | infantry | `%dème Division d'Infanterie` |
| `FRA_INF_02` | Named Infantry Division | infantry | *(named format)* |
| `FRA_GARDE_NAT_01` | National Guard | infantry | *(Garde Nationale format)* |
| `FRA_CAV_01` | Cavalry Division | cavalry | `%dème Division de Cavalerie` |
| `FRA_MOT_01` | Motorized Division | motorized | *(DIM format)* |
| `FRA_MEC_01` | Light Mechanized Division | mechanized | `%dème Division Légère Mécanique` |
| `FRA_DLC_01` | Light Cavalry Division | cavalry | `%dème Division Légère de Cavalerie` |
| `FRA_ARM_01` | Armored Division | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Division Cuirassée` |
| `FRA_ARM_02` | Tank Brigade | light_armor, medium_armor, heavy_armor, modern_armor | *(brigade format)* |
| `FRA_ARM_03` | Armored Division (late) | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Division Blindée` |
| `FRA_PAR_01` | Paratrooper Division | paratrooper | `%dème Division Parachutiste` |
| `FRA_MAR_01` | Marine Division | marine | *(marine format)* |
| `FRA_MNT_01` | Mountain Division | mountaineers | `%dème Division Alpine` |
| `FRA_GAR_01` | Garrison Division | infantry | *(fortress/garrison format)* |
| `FRA_COL_01` | Colonial Division | infantry | *(colonial format)* |
| `FRA_DEF_01` | Division de la Défense Nationale | infantry | *(DNF format)* |
| `FRA_INF_METRO_01` | Post-Liberation Infantry Divisions | infantry | *(post-liberation format)* |
| `FRA_INF_DECISION_01` | Division d'Infanterie de Décision | infantry | *(assault format)* |

---

## Group Details

### `FRA_INF_01` — Infantry Division (Division d'Infanterie)
The main French infantry series covering all pre-war series divisions. Historical entries include active-army (1–24), reserve (series B), and North African divisions. The file respects the historical French numbering with proper ordinal formatting (*1ère*, *2ème*, *3ème*, etc.).

Key historical entries: 2e DI, 4e DI, 6e DI, 7e DI, 10e DI, 11e DI, 13e DI, 14e DI, 16e DI, 18–26e DI, 36e DI, 42–43e DI, with African divisions (81e–88e) and the Moroccan divisions.

### `FRA_INF_02` — Named Infantry Divisions
Specific named formations with strong historical identity, including the *Division Marocaine*, *Division d'Infanterie Coloniale*, and other distinctive units.

### `FRA_GARDE_NAT_01` — Garde Nationale (National Guard)
Gendarmerie-tradition formations and mobilized Garde Nationale mobile units. Covers regional territorial defence in metropolitan France.

### `FRA_CAV_01` — Cavalry Divisions
French cavalry divisions (*Division de Cavalerie*). France maintained active cavalry divisions through 1939–40, including the famous *Corps de Cavalerie* of Prioux's command.

### `FRA_MOT_01` — Motorized Division (Division d'Infanterie Motorisée — DIM)
The *Divisions d'Infanterie Motorisées* — France's truck-mobile infantry. Shares numbering with `FRA_MNT_01` via `link_numbering_with`. Historical entries: 1re, 3e, 5e, 9e, 12e, 15e, 25e DIM.

### `FRA_MEC_01` — Light Mechanized Division (Division Légère Mécanique — DLM)
The *Divisions Légères Mécaniques* — France's premier mechanized cavalry formations. Historically: 1re, 2e, 3e DLM, plus the 4e DLM partially formed.

### `FRA_DLC_01` — Light Cavalry Division (Division Légère de Cavalerie)
Lighter cavalry divisions, partially motorized.

### `FRA_ARM_01` / `FRA_ARM_02` / `FRA_ARM_03` — Armored
Three armor lists cover the evolution of French armor:
- `FRA_ARM_01` — *Divisions Cuirassées de Réserve* (DCR) — the 1939–40 heavy armored reserve divisions (1e–4e DCR)
- `FRA_ARM_02` — Tank brigades and independent armored formations
- `FRA_ARM_03` — Post-1942 Free French *Divisions Blindées* (DB) — 1re (de Lattre), 2e (*Leclerc*), and 3e DB

### `FRA_PAR_01` — Paratrooper Division
*Divisions Parachutistes* — French airborne from the SAS units formed in Britain through to the post-war colonial paratroopers. Historical entries include the 10e DP (Dien Bien Phu), 24e Brigade Parachutiste, 601e/801e groupes.

### `FRA_MAR_01` — Marine Division (Infanterie de Marine)
The *Troupes de Marine* — France's colonial marine infantry, distinct from the Navy. Covers numbered Marine brigades and divisions.

### `FRA_MNT_01` — Mountain Division (Division Alpine / Chasseurs Alpins)
*Divisions d'Infanterie Alpine* and *Chasseurs Alpins* brigades — France's elite mountain troops, with historical entries for the 27e, 28e, 29e, 30e, 31e Divisions Alpines and the 64e DI.

### `FRA_GAR_01` — Garrison / Fortress Divisions
Line-of-communication and fortress garrison divisions, numbered in the 100s series. Covers the static divisions of the Maginot Line and interior garrisons.

### `FRA_COL_01` — Colonial Divisions
Extensive colonial series covering:
- *Division d'Infanterie Coloniale* (DIC) — Senegalese, Malagasy, Indochinese, and Antillais formations
- North African formations (Algerian, Moroccan, Tunisian)
- Saharan and West African units

### `FRA_DEF_01` — Division de la Défense Nationale
Post-armistice Vichy French *Armée d'Armistice* formations, limited by the 1940 armistice terms to 100,000 men.

### `FRA_INF_METRO_01` — Post-Liberation Infantry Divisions
Free French and post-liberation *Armée de la Libération* divisions reconstituted from 1944 onward: 1re Armée (de Lattre), *Forces Françaises de l'Intérieur* integration.

### `FRA_INF_DECISION_01` — Division d'Infanterie de Décision
Assault infantry — heavy infantry divisions designated for breakthrough operations.

