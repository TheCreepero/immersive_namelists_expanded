# France

**Country Tag:** `FRA` | **Source File:** [`INEX_FRA_names_divisions.txt`](../common/units/names_divisions/INEX_FRA_names_divisions.txt)

---

## Historical Overview

France's *Armée de Terre* entered WWII with a large but doctrinally constrained force structure. After the 1940 defeat, French military identity split between Vichy France, Free French Forces (*Forces Françaises Libres*), and eventually the *Forces Françaises de l'Intérieur* (FFI). INEX covers the pre-war and 1940 order of battle (infantry, cavalry, *Divisions Légères Mécaniques*, *Divisions Cuirassées de Réserve*, Maginot fortress divisions, Alpine troops), the colonial and North African formations, the 1943-46 *Divisions Blindées*, post-war airborne units, and government-gated militia lists for democratic, fascist, communist and neutral France. All French names use proper French diacritics (*1ère Division d'Infanterie*, *Chasseurs Alpins*). Ordinals follow the vanilla style (*1ère*, *2ème*).

Where history offers little, a group is kept short and falls back to its numbered fallback name rather than being padded.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `FRA_INF_01` | Infantry Divisions | infantry | `%dème Division d'Infanterie` |
| `FRA_INF_02` | Infantry Divisions (Named) | infantry | `%dème Division d'Infanterie` |
| `FRA_GARDE_NAT_01` | National Guard Divisions | infantry, motorized, mechanized, marine, mountaineers, paratrooper | `%dème Division de la Garde Nationale` |
| `FRA_CAV_01` | Cavalry Divisions | cavalry | `%dème Division de Cavalerie` |
| `FRA_MOT_01` | Motorized Divisions | motorized | `%dème Div. d'Infanterie Motorisée` |
| `FRA_MEC_01` | Light Mechanized Divisions | light_armor, medium_armor, mechanized | `%dème Division Légère Mécanique` |
| `FRA_DLC_01` | Light Cavalry Divisions | motorized, cavalry, mechanized | `%dème Div. Légère de Cavalerie` |
| `FRA_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Division Cuirassée` |
| `FRA_ARM_02` | Tank Brigades | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Brigade Cuirassée` |
| `FRA_ARM_03` | Armored Divisions (DB) | medium_armor, modern_armor | `%dème Division Blindée` |
| `FRA_PAR_01` | Paratrooper Divisions | paratrooper | `%dème Division Parachutiste` |
| `FRA_MAR_01` | Marine Divisions | marine | `%dème Div. d'Infanterie de Marine` |
| `FRA_MNT_01` | Mountain Divisions | mountaineers | `%dème Division d'Infanterie Alpine` |
| `FRA_GAR_01` | Garrison Divisions | infantry | `%dème Division de Forteresse` |
| `FRA_COL_01` | Colonial Divisions | infantry | `%dème Division d'Infanterie Coloniale` |
| `FRA_DEF_01` | Defense Divisions | militia | `%dème Division de la Défense Nationale` |
| `FRA_INF_METRO_01` | Metropolitan Infantry | infantry | `%dème Division d'Infanterie Métropolitaine` |
| `FRA_MIL_FAS_01` | Milice Divisions | infantry, militia | `%dème Division de la Milice Française` |
| `FRA_MIL_COM_01` | Francs-Tireurs Divisions | infantry, militia | `%dème Division des Francs-Tireurs et Partisans` |
| `FRA_MIL_NEU_01` | Armistice Army Divisions | infantry, militia | `%dème Division de l'Armée de l'Armistice` |

---

## Group Details

### `FRA_INF_01` — Infantry Divisions
The plain, un-nicknamed infantry list: it carries only the fallback name (*%dème Division d'Infanterie*). `FRA_MOT_01`, `FRA_MNT_01` and `FRA_GAR_01` share its numbering via `link_numbering_with`.

### `FRA_INF_02` — Infantry Divisions (Named)
The nicknamed counterpart of `FRA_INF_01`, sharing its numbering. Authentic nicknames are scarce, so only the better attested ones sit at their division number: 11e DI *de Fer*, 14e DI *des As*, 39e DI *d'Acier*, 66e DI *L'Alsacienne*, 133e DI *La Gauloise*, 164e DI *du Dragon*, 5e DI *de Neuville-Saint-Vaast*, 36e DI *du Sud-Ouest*. Most of these are First World War epithets. The remaining entries draw on republican and Napoleonic tradition (*Valmy*, *Jemmapes*, *Austerlitz*) and the Great War battles (*Verdun*, *Marne*, *Somme*).

### `FRA_GARDE_NAT_01` — National Guard Divisions
Republican *Garde Nationale* divisions named after 30 regional centres. Available to democratic governments only.

### `FRA_CAV_01` — Cavalry Divisions
The pre-1940 *Divisions de Cavalerie* (1ère-5ème) plus the 1ère-3ème *Brigades de Spahis* and the *Brigades de Cavalerie*.

### `FRA_MOT_01` — Motorized Divisions
*Divisions d'Infanterie Motorisées*. Only the 1ère *Division Motorisée d'Infanterie* (the renamed 1ère DFL, August 1943) is authored; everything else uses the numbered fallback. Shares numbering with `FRA_INF_01`.

### `FRA_MEC_01` — Light Mechanized Divisions
The *Divisions Légères Mécaniques*: 1ère, 2ème, 3ème, 4ème and 7ème DLM. The 5ème, 6ème and 8ème were never formed. DLM numbering was a series of its own, so the list is deliberately not linked to infantry.

### `FRA_DLC_01` — Light Cavalry Divisions
The 1ère-6ème *Divisions Légères de Cavalerie* (1940). Sources disagree on whether the 6ème, formed in Tunisia, counts.

### `FRA_ARM_01` / `FRA_ARM_02` / `FRA_ARM_03` — Armored
- `FRA_ARM_01` — *Divisions Cuirassées de Réserve* (DCR), 1ère-4ème (1940)
- `FRA_ARM_02` — Tank brigades; fallback names only
- `FRA_ARM_03` — *Divisions Blindées* (DB): 1ère, 2ème, 3ème, 5ème and 6ème. Shares numbering with `FRA_ARM_01`.

### `FRA_PAR_01` — Paratrooper Divisions
Post-war airborne: the 25ème *Division Aéroportée* (1946), the 10ème and 25ème *Divisions Parachutistes* (1956) and the 11ème *Division Légère d'Intervention* (1961).

### `FRA_MAR_01` — Marine Divisions
*Infanterie de Marine* divisions named after the naval bases (Toulon, Brest, Cherbourg, Lorient, Rochefort), plus the 9ème *Division d'Infanterie de Marine*. The base titles are a plausible extrapolation.

### `FRA_MNT_01` — Mountain Divisions
The 27e-31e *Divisions d'Infanterie Alpine*, the 64e-66e *Divisions d'Infanterie de Montagne*, the 4ème *Division Marocaine de Montagne* and the 1940 *Brigade de Haute Montagne*. Shares numbering with `FRA_INF_01`.

### `FRA_GAR_01` — Garrison Divisions
The 101e-105e *Divisions d'Infanterie de Forteresse* (March 1940) and *Divisions de Forteresse* named after the Maginot and Alpine fortified sectors (Maubeuge, Thionville, Haguenau, Colmar, Dauphiné, Savoie, Alpes-Maritimes and others). Shares numbering with `FRA_INF_01`.

### `FRA_COL_01` — Colonial Divisions
- *Division d'Infanterie Coloniale* (DIC), numbered by key
- *Divisions d'Infanterie Nord-Africaine* (DINA), *Divisions Marocaines* and *Divisions d'Infanterie Algérienne*
- Territorial garrisons (*Division du Tonkin*, *Division du Levant*, *Division de Casablanca*) and West and Equatorial African titles

### `FRA_DEF_01` — Defense Divisions
*Divisions de la Défense Nationale*, named after 30 cities, in the tradition of the 1870 *Gouvernement de la Défense Nationale*. Democratic governments only.

### `FRA_INF_METRO_01` — Metropolitan Infantry
The post-liberation *Divisions d'Infanterie Métropolitaine* (1ère-40ème). Democratic governments only.

### `FRA_MIL_FAS_01` — Milice Divisions
*Milice Française* divisions by regional seat (Vichy, Lyon, Marseille...). Alt-history extrapolation: the Milice never formed divisions. Fascist governments only.

### `FRA_MIL_COM_01` — Francs-Tireurs Divisions
*Francs-Tireurs et Partisans* (FTP) divisions by region of the resistance, plus the *Commune de Paris*. Alt-history extrapolation: the FTP never formed divisions. Communist governments only.

### `FRA_MIL_NEU_01` — Armistice Army Divisions
*Armée de l'Armistice* divisions by military region and colonial command (Lyon, Alger, Dakar...). Alt-history extrapolation of the 1940-42 Vichy army. Neutrality governments only.
