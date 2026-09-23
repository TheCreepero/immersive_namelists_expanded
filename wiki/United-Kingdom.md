# United Kingdom

**Country Tag:** `ENG` | **Source File:** [`INEX_ENG_names_divisions.txt`](../common/units/names_divisions/INEX_ENG_names_divisions.txt)

---

## Historical Overview

The British Army's divisional system drew on a rich tradition of regional county regiments, imperial service units, and specialist formations spanning the Home Forces, British Expeditionary Force, Eighth Army in North Africa, and campaigns across the globe. INEX provides comprehensive coverage from numbered infantry and armoured divisions through highland light divisions, colonial formations, airborne, Home Guard, Special Service brigades, and alternate-history options.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `ENG_INF_01` | Infantry Division | infantry | `%d Infantry Division` |
| `ENG_INF_02` | Infantry Brigade | infantry | *(brigade format)* |
| `ENG_INF_03` | Light Division | infantry | *(light division format)* |
| `ENG_CAV_01` | Cavalry Division | cavalry | *(cavalry format)* |
| `ENG_CAV_02` | Cavalry Brigade | cavalry | *(cavalry brigade format)* |
| `ENG_MOT_01` | Motorised Division | motorized | `%d Motorised Division` |
| `ENG_MOT_02` | Motor Division | motorized | *(motor division format)* |
| `ENG_MEC_01` | Mechanised Division | mechanized | `%d Mechanised Division` |
| `ENG_ARM_01` | Armoured Division | light_armor, medium_armor, heavy_armor, modern_armor | `%d Armoured Division` |
| `ENG_ARM_02` | Tank Brigade | light_armor, medium_armor, heavy_armor, modern_armor | *(brigade format)* |
| `ENG_ARM_03` | Heavy Armoured Brigade | light_armor, medium_armor, heavy_armor, modern_armor | *(heavy format)* |
| `ENG_PAR_01` | Airborne Division | paratrooper | `%d Airborne Division` |
| `ENG_PAR_02` | Parachute Regiment | paratrooper | *(regiment format)* |
| `ENG_MAR_01` | Royal Marines Division | marine | `%d Royal Marines Division` |
| `ENG_MNT_01` | Mountain Division | mountaineers | `%d Mountain Division` |
| `ENG_MNT_02` | Gurkha Division | mountaineers | *(Gurkha format)* |
| `ENG_GAR_01` | Garrison Division | infantry | `%d Garrison Division` |
| `ENG_COL_01` | Colonial Division | infantry | *(colonial format)* |
| `ENG_AIR_01` | Anti-Aircraft Division | infantry | *(AA format)* |
| `ENG_DEM_01` | Loyalist Brigade | infantry | *(loyalist format)* |
| `ENG_FAS_01` | Blackshirt Brigade | infantry | *(blackshirt format)* |
| `ENG_HOMEGUARD_01` | Home Guard Division | infantry | *(Home Guard format)* |
| `ENG_ROYAL_GUARD_01` | Royal Guard Division | infantry | *(royal guard format)* |
| `ENG_INDEPENDENT_BRIGADES_01` | Independent Brigade | infantry | *(independent brigade format)* |
| `ENG_SSB_01` | Special Service Brigade | infantry | *(SAS/commando format)* |

---

## Group Details

### `ENG_INF_01` — Infantry Divisions
The main British infantry division series. Historical entries cover all active British infantry divisions including the Guards Division, Scottish, Welsh, and English county-based formations. The numbered series spans 1st–82nd plus wartime expanded entries. Note the large historical gaps in the sequence, which the file preserves faithfully.

Selected named entries include:
- 1st Infantry Division (*1 Division*)
- 2nd Infantry Division (*2 Division*)
- 3rd Infantry Division (*Iron Division*)
- 4th, 5th, 6th Infantry Divisions
- 42nd–55th Infantry Divisions (Territorial Army)
- 7th, 8th, 9th, 12th, 15th (Scottish), 18th, 23rd, 38th (Welsh), 43rd (Wessex), 46th, 50th (Northumbrian), 51st (Highland), 52nd (Lowland), 56th (London)

### `ENG_INF_02` / `ENG_INF_03` — Infantry Brigade & Light Division
Brigade-sized and light division formations for players using smaller templates.

### `ENG_CAV_01` / `ENG_CAV_02` — Cavalry
British cavalry divisions and brigades. By WWII most had converted to armour, but the lists include historic cavalry designations for the early war period and alternate-history paths.

### `ENG_MOT_01` / `ENG_MOT_02` — Motorised Divisions
British motorized infantry. `ENG_MOT_01` shares numbering with `ENG_MEC_01` via `link_numbering_with` to preserve consistent divisional numbering across motorized and mechanized types.

### `ENG_ARM_01` — Armoured Divisions
Historical British armoured divisions including:
- 1st Armoured Division
- 6th Armoured Division (*Battleaxe Division*)
- 7th Armoured Division (*Desert Rats*)
- 8th, 9th, 10th, 11th Armoured Divisions

### `ENG_ARM_02` / `ENG_ARM_03` — Tank Brigades / Heavy Armoured Brigades
Independent tank brigades and army tank brigades used for infantry support.

### `ENG_PAR_01` — Airborne Divisions
British airborne: 1st Airborne Division (*Red Devils* — Arnhem) and 6th Airborne Division (D-Day landings). Extended numbered series for alt-history airborne expansion.

### `ENG_PAR_02` — Parachute Regiments
Parachute Regiment formations below division level.

### `ENG_MAR_01` — Royal Marines Division
Royal Marines formations, covering both historical Royal Marines Division and amphibious brigade-sized units.

### `ENG_MNT_01` — Mountain Divisions
Mountain and highland infantry. `ENG_MNT_01` links numbering with motorized/mechanized lists.

### `ENG_MNT_02` — Gurkha Divisions
Gurkha formations — the famous Nepalese light infantry regiments of the British Indian Army, with `can_use` tied to either being `ENG` or completing the relevant focus.

### `ENG_GAR_01` — Garrison Divisions
Garrison and line-of-communication divisions. Numbered series in the 100s and 200s (e.g., 200–210 series, Line of Communication areas).

### `ENG_COL_01` — Colonial Divisions
Formations from British colonial territories: India, Australia, Canada, South Africa, New Zealand, East Africa, West Africa, the Middle East. Numbers mirror historical command numbering (500–series for Indian, etc.).

### `ENG_HOMEGUARD_01` — Home Guard
The British Home Guard (*Dad's Army*) — territorial defence formations organized by county and region to defend the British Isles against invasion. 40 named regional formations.

### `ENG_ROYAL_GUARD_01` — Royal Guard Division
Household Division formations: the Brigade of Guards, Life Guards, Blues and Royals, and Household Cavalry. 20 named entries.

### `ENG_SSB_01` — Special Service Brigade (Commandos / SAS)
Special forces formations: Royal Marine Commandos, Army Commandos, SAS brigades, and independent raider brigades.

### `ENG_DEM_01` / `ENG_FAS_01` — Loyalist / Blackshirt Brigades
Alternate-history formations for a British civil conflict scenario — Loyalist (monarchy/government) brigades and British Union of Fascists (Blackshirt) formations.

