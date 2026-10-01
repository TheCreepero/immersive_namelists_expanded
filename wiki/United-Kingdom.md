# United Kingdom

**Country Tag:** `ENG` | **Source File:** [`INEX_ENG_names_divisions.txt`](../common/units/names_divisions/INEX_ENG_names_divisions.txt)

---

## Historical Overview

The British Army's divisional system drew on a rich tradition of regional county regiments, imperial service units, and specialist formations spanning the Home Forces, British Expeditionary Force, Eighth Army in North Africa, and campaigns across the globe. INEX provides comprehensive coverage from numbered infantry and armoured divisions through highland light divisions, colonial formations, airborne, Home Guard, Special Service brigades, and alternate-history options.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `ENG_INF_01` | Infantry Divisions | infantry | `%d Infantry Division` |
| `ENG_INF_02` | Infantry Brigades | infantry | `%d Infantry Brigade` |
| `ENG_INF_03` | Light Divisions | infantry, mechanized | `%d (Light) Division` |
| `ENG_CAV_01` | Cavalry Divisions | cavalry | `%d Cavalry Division` |
| `ENG_CAV_02` | Cavalry Brigades | cavalry | `%d Cavalry Brigade` |
| `ENG_MOT_01` | Motorised Divisions | motorized | `%d Infantry Division` |
| `ENG_MOT_02` | Motor Divisions | motorized | `%d Motor Division` |
| `ENG_MEC_01` | Mechanised Divisions | mechanized | `%d Infantry Division` |
| `ENG_ARM_01` | Armoured Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Armoured Division` |
| `ENG_ARM_02` | Armoured & Tank Brigades | light_armor, medium_armor, modern_armor | `%d Armoured Brigade` |
| `ENG_ARM_03` | Heavy Armoured Brigades | heavy_armor | `%d Heavy Armoured Brigade` |
| `ENG_PAR_01` | Airborne Divisions | paratrooper | `%d Airborne Division` |
| `ENG_PAR_02` | Parachute Brigades | paratrooper | `%d Parachute Brigade` |
| `ENG_MAR_01` | Royal Marines | marine | `%d Royal Marines Division` |
| `ENG_MNT_01` | Mountain Divisions | mountaineers | `%d Infantry Division` |
| `ENG_MNT_02` | Gurkha Divisions | mountaineers | `%d Gurkha Division` |
| `ENG_GAR_01` | Garrison Divisions | infantry | `%d Garrison Division` |
| `ENG_COL_01` | Colonial Divisions | infantry | `%d (Colonial) Division` |
| `ENG_AIR_01` | Anti-Aircraft Divisions | infantry | `%d Anti-Aircraft Division` |
| `ENG_DEM_01` | Loyalist Brigades | infantry | `%d Loyalist Brigade` |
| `ENG_FAS_01` | Blackshirt Brigades | infantry | `%d Blackshirt Brigade` |
| `ENG_FAS_02` | Legion of St. George | infantry, motorized | `%d Legion of St. George` |
| `ENG_COM_01` | Workers' Defense Brigades | infantry, motorized | `%d Workers' Defense Brigade` |
| `ENG_COM_02` | People's Army Divisions | infantry, motorized, mechanized, light_armor, medium_armor | `%d People's Division` |
| `ENG_HOMEGUARD_01` | Home Guard | infantry | `%d Home Guard Division` |
| `ENG_ROYAL_GUARD_01` | Household Divisions | infantry, motorized, mechanized, light_armor, medium_armor, modern_armor | `%d Royal Guard Division` |
| `ENG_INDEPENDENT_BRIGADES_01` | Independent Brigades | infantry, motorized, mechanized | `%d Independent Brigade` |
| `ENG_SSB_01` | Special Service Brigades | infantry, paratrooper, mountaineers | `%d Special Service Brigade` |

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
British motorized infantry. `ENG_MOT_01` and `ENG_MOT_02` share numbering with `ENG_INF_01` via `link_numbering_with` to preserve consistent divisional numbering across infantry and motorized types.

### `ENG_ARM_01` — Armoured Divisions
Historical British armoured divisions including:
- 1st and 2nd Armoured Divisions
- 6th Armoured Division (*Mailed Fist*)
- 7th Armoured Division (*Desert Rats*)
- 8th, 9th, 10th Armoured Divisions
- 11th Armoured Division (*Black Bull*)
- 42nd Armoured Division
- 79th Armoured Division (*Hobart's Funnies*)
- Guards Armoured Division

### `ENG_ARM_02` / `ENG_ARM_03` — Tank Brigades / Heavy Armoured Brigades
Independent tank brigades and army tank brigades used for infantry support.

### `ENG_PAR_01` — Airborne Divisions
British airborne: 1st Airborne Division (*Red Devils* — Arnhem) and 6th Airborne Division (D-Day landings). Extended numbered series for alt-history airborne expansion.

### `ENG_PAR_02` — Parachute Brigades
Parachute and airlanding brigade formations: 1st through 5th Parachute Brigades, plus 1st and 6th Airlanding Brigades.

### `ENG_MAR_01` — Royal Marines
Royal Marines formations, covering the historical Royal Marine Division and Royal Marine Commandos (Nos. 40 through 48 RM Commando).

### `ENG_MNT_01` — Mountain Divisions
Mountain and highland infantry. `ENG_MNT_01` links numbering with motorized/mechanized lists.

### `ENG_MNT_02` — Gurkha Divisions
Gurkha formations — the famous Nepalese light infantry regiments of the British Indian Army, with `can_use` available to either `ENG` or `RAJ`.

### `ENG_GAR_01` — Garrison Divisions
Anti-invasion County Divisions (Devon & Cornwall, Dorset, Durham & North Riding, Essex, Hampshire, Lincolnshire, Norfolk, Northumberland, West Sussex, Yorkshire) and strategic overseas fortress garrisons (Gibraltar, Malta, Singapore, Hong Kong).

### `ENG_COL_01` — Colonial Divisions
Formations from British colonial territories and protectorates: East Africa, West Africa, Sudan, Somaliland, Transjordan, Burma, Malaya, and Hong Kong, including the King's African Rifles (KAR) and the Royal West African Frontier Force (RWAFF).

### `ENG_HOMEGUARD_01` — Home Guard
The British Home Guard (*Dad's Army*) — territorial defence formations organized by county to defend the British Isles against invasion. 40 named county formations.

### `ENG_ROYAL_GUARD_01` — Household Divisions
Household Division formations: Grenadier, Coldstream, Scots, Irish, and Welsh Guards, Household Cavalry, Life Guards, Royal Horse Guards (*The Blues*), and King's Guard formations.

### `ENG_SSB_01` — Special Service Brigades (Commandos / SAS)
Special Service brigades: 1st through 4th Special Service Brigades (later Commando Brigades), including Lord Lovat's commandos.

### `ENG_DEM_01` / `ENG_FAS_01` / `ENG_FAS_02` — Democratic Loyalist & Fascist Formations
Ideology-gated formations for British political paths: Democratic/Neutral Loyalist Brigades (`ENG_DEM_01`), British Union of Fascists Blackshirt Brigades (`ENG_FAS_01`), and the Fascist volunteer Legion of St. George (`ENG_FAS_02`).

### `ENG_COM_01` / `ENG_COM_02` — Communist Formations
Communist-gated suites for a socialist Britain: Workers' Defense Brigades (`ENG_COM_01`) honoring historical labor movements and International Brigade veterans (Tom Mann, Shapurji Saklatvala, James Connolly Column, Tolpuddle Martyrs, Red Clydeside), and the regular People's Army Divisions (`ENG_COM_02`).

