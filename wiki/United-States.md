# United States

**Country Tag:** `USA` | **Source File:** [`INEX_USA_names_divisions.txt`](../common/units/names_divisions/INEX_USA_names_divisions.txt)

---

## Historical Overview

The United States Army expanded from a tiny peacetime force of 9 divisions in 1939 to 89 divisions by 1945, across every theatre of WWII. INEX provides comprehensive coverage of infantry, armored, airborne, marine, mountain, cavalry, and garrison divisions — all in the historical American format of numbered divisions without the ordinal period (*1st Infantry Division*, *82nd Airborne Division*). Alternate-history groups cover communist, fascist, and paramilitary formations for American civil conflict scenarios.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `USA_INF_01` | Infantry Division | infantry | `%d Infantry Division` |
| `USA_CAV_01` | Cavalry Division | cavalry | `%d Cavalry Division` |
| `USA_MOT_01` | Motorized Division | motorized | `%d Motorized Division` |
| `USA_MEC_01` | Mechanized Division | mechanized | `%d Mechanized Division` |
| `USA_ARM_01` | Armored Division | light_armor, medium_armor, heavy_armor, modern_armor | `%d Armored Division` |
| `USA_PAR_01` | Airborne Division | paratrooper | `%d Airborne Division` |
| `USA_MAR_01` | Marine Division | marine | `%d Marine Division` |
| `USA_MNT_01` | Mountain Division | mountaineers | `%d Mountain Division` |
| `USA_GAR_01` | Garrison Division | infantry | `%d Garrison Division` |
| `USA_MIL_01` | Militia Division | militia | *(State militia format)* |
| `USA_SHOCK_01` | Shock Division | mechanized, motorized, light_armor, medium_armor, heavy_armor, modern_armor, infantry | *(shock format)* |
| `USA_COM_GUARD_01` | Communist Guard Division | infantry, militia | *(communist format)* |
| `USA_FASCIST_01` | National Legion Division | infantry | *(fascist format)* |
| `USA_PARAMILITARY_01` | Paramilitary Militia Division | militia | *(paramilitary format)* |
| `USA_COMPOSITE_UNITS_01` | Composite Units | infantry | *(composite format)* |
| `USA_ARMORED_DETACHMENTS_01` | Armored Detachment | light_armor, medium_armor, heavy_armor, modern_armor | *(detachment format)* |
| `USA_DEF_01` | Division of National Defense | infantry | *(National Guard format)* |
| `USA_RANGER_FORCE_01` | Ranger Force | mountaineers, paratrooper, infantry | *(Ranger format)* |

---

## Group Details

### `USA_INF_01` — Infantry Divisions
The main US Army infantry series. All 91 numbered infantry divisions are included in historical order of activation, including:
- **Regular Army** (1st–9th Infantry Divisions)
- **National Guard** (26th *Yankee*, 27th *New York*, 29th *Blue and Gray*, 30th *Old Hickory*, 32nd *Red Arrow*, 34th *Red Bull*, 36th *Texas*, 37th *Buckeye*, 38th *Cyclone*, 40th *Sunshine*, 41st *Jungleers*, 42nd *Rainbow*, 43rd *Winged Victory*, 44th *Flying Dagger*, 45th *Thunderbird*)
- **Selective Service Army** (63rd–106th Infantry Divisions)
- **African-American divisions** (92nd *Buffalo Soldiers*, 93rd Division)
- Fallback entries through the 300s series for alt-history expansion

### `USA_CAV_01` — Cavalry Divisions
US Cavalry including the 1st Cavalry Division (used as ground infantry in the Pacific), 2nd Cavalry, and the numbered series including the famous 1st, 2nd, 3rd, 15th, 21st, 24th cavalry regiments.

### `USA_ARM_01` — Armored Divisions
All 16 historical US armored divisions (1st–16th), plus the 20th, 21st, 22nd, 25th, 27th, 30th, 39th, and 40th, and an extended alt-history numbered series through the 70s.

Key named entries:
- 1st Armored Division (*Old Ironsides*)
- 2nd Armored Division (*Hell on Wheels*)
- 3rd Armored Division (*Spearhead*)
- 4th Armored Division (*Name Unknown — Speed is the Password*)

### `USA_PAR_01` — Airborne Divisions
US Airborne with historical division numbering:
- 82nd Airborne Division (*All-American*)
- 101st Airborne Division (*Screaming Eagles*)
- 11th Airborne Division (*Angels*)
- 13th Airborne Division
- 17th Airborne Division (*Golden Talons*)
- 18th Airborne Division
- 21st Airborne Division
- 135th Airborne Division

### `USA_MAR_01` — Marine Divisions
All 6 historical USMC divisions (1st–6th), plus extended series through the 30s and 40s for alt-history. The USMC divisional system is included in full.

### `USA_MNT_01` — Mountain Divisions
- 10th Mountain Division (*Ski Troops*) — the most famous US mountain formation
- Extended numbered series for alt-history mountain warfare expansion

### `USA_DEF_01` — Division of National Defense (National Guard)
State National Guard formations organized by state — 52 named state guard divisions covering all continental US states plus territories.

### `USA_MIL_01` — Militia / State Militia
State militia formations distinct from the federalized National Guard.

### `USA_SHOCK_01` — Shock Divisions
Combined-arms assault formations for alternate or accelerated US doctrine.

### `USA_COM_GUARD_01` / `USA_FASCIST_01` / `USA_PARAMILITARY_01` — Alternate-History Factions
Civil conflict formations:
- **Communist Guard** — American communist formations for "Red USA" playthroughs
- **National Legion** — American fascist formations (*Silver Legion*, *American Bund*)
- **Paramilitary Militia** — unaligned armed militia formations

### `USA_RANGER_FORCE_01` — Ranger Forces
Ranger battalions (Darby's Rangers, 1st–6th Ranger Battalions) and special operations formations.

