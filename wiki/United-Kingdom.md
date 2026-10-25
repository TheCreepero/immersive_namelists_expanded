# United Kingdom

**Country Tag:** `ENG` | **Source File:** [`zz_INEX_ENG_names_divisions.txt`](../common/units/names_divisions/zz_INEX_ENG_names_divisions.txt)

---

## Historical Overview

The British Army's divisional system drew on a rich tradition of regional county regiments, imperial service units, and specialist formations spanning the Home Forces, British Expeditionary Force, Eighth Army in North Africa, and campaigns across the globe. INEX provides comprehensive coverage from numbered infantry and armoured divisions through highland light divisions, colonial formations, airborne, Home Guard, Special Service brigades, and alternate-history options.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `ENG_INF_01` | Infantry Divisions | infantry | `%d Infantry Division` |
| `ENG_INF_04` | Infantry Divisions (Named) | infantry, motorized, mechanized | `%d Infantry Division` |
| `ENG_INF_02` | Infantry Brigades | infantry | `%d Infantry Brigade` |
| `ENG_INF_03` | Light Divisions | infantry, mechanized | `%d (Light) Division` |
| `ENG_CAV_01` | Cavalry Divisions | cavalry | `%d Cavalry Division` |
| `ENG_CAV_02` | Cavalry Brigades | cavalry | `%d Cavalry Brigade` |
| `ENG_MOT_01` | Motorised Divisions | motorized | `%d Infantry Division` |
| `ENG_MOT_02` | Motor Divisions | motorized | `%d Motor Division` |
| `ENG_MEC_01` | Mechanised Divisions | mechanized | `%d Infantry Division` |
| `ENG_ARM_01` | Armoured Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Armoured Division` |
| `ENG_ARM_04` | Armoured Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d Armoured Division` |
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

### `ENG_INF_01` / `ENG_INF_04` — Infantry Divisions (plain and named)
`ENG_INF_01` is the plain series: the Regular Army (1st–8th), the first-line Territorial Army (42nd–56th), the second-line and wartime divisions (9th (Highland) to 80th (Reserve)), the deception divisions (40th, 57th, 58th) and the Guards Division, each under its regional title and without nicknames. Numbers the Army left unused in 1939–45 revive the titles they carried in 1914–18: 10th and 16th (Irish), 13th and 19th (Western), 17th (Northern), 60th (2/2nd London) to 69th (2nd East Anglian), and 74th (Yeomanry). Vanilla's numbered entries fill the gaps.

`ENG_INF_04` (Named) holds the same divisions with their nicknames and formation signs, shares numbering with `ENG_INF_01`, and also serves motorised and mechanised templates. Examples:
- 3rd Infantry Division (*Iron Division*)
- 5th Infantry Division (*Globetrotters*)
- 43rd (Wessex) Infantry Division (*Wyverns*)
- 49th (West Riding) Infantry Division (*Polar Bears*)
- 50th (Northumbrian) Infantry Division (*Tyne-Tees*)
- 51st (Highland) Infantry Division (*Highway Decorators*)
- 56th (London) Infantry Division (*Black Cats*)
- 78th Infantry Division (*Battleaxe*)

### `ENG_INF_02` / `ENG_INF_03` — Infantry Brigade & Light Division
Brigade-sized formations for smaller templates. `ENG_INF_02` carries the Territorial Army brigades under their regional titles (*125th (Lancashire Fusiliers)*, *150th (York and Durham)*, *152nd (1st Highland)*, *167th (1st London)*), the Guards brigades and the *231st (Malta) Infantry Brigade*. `ENG_INF_03` keeps vanilla's light divisions, whose 14th and 20th (Light) match the 1914–18 titles.

### `ENG_CAV_01` / `ENG_CAV_02` — Cavalry
British cavalry divisions and brigades. By 1939 only the yeomanry 1st Cavalry Division in Palestine remained, so the lists draw on the First World War: the 1st–5th Cavalry Divisions, the Yeomanry Mounted Division and the 1st–4th Mounted Divisions in `ENG_CAV_01`, and the fourteen Territorial Force mounted brigades of 1908 (*Highland*, *Notts and Derby*, *1st South Western*) and the Scottish Horse in `ENG_CAV_02`.

### `ENG_MOT_01` / `ENG_MOT_02` — Motorised Divisions
British motorized infantry. `ENG_MOT_01` and `ENG_MOT_02` share numbering with `ENG_INF_01` via `link_numbering_with` to preserve consistent divisional numbering across infantry and motorized types. `ENG_MOT_02` holds the four Motor Divisions of September 1939: 50th (Northumbrian), 55th (West Lancashire), and 1st and 2nd London.

### `ENG_ARM_01` / `ENG_ARM_04` — Armoured Divisions (plain and named)
`ENG_ARM_01` is the plain series: the 1st, 2nd and 6th to 11th Armoured Divisions, the 42nd, 79th and Guards Armoured Divisions, the notional 5th Armoured of Operation Fortitude, the 1937 *Mobile Division*, the 1938 *Mobile Division (Egypt)*, and three extrapolated (Yeomanry) armoured divisions. `ENG_ARM_04` (Named) holds the same divisions with their nicknames and formation signs and shares numbering with `ENG_ARM_01`:
- 1st Armoured Division (*Rhino*)
- 6th Armoured Division (*Mailed Fist*)
- 7th Armoured Division (*Desert Rats*)
- 9th Armoured Division (*Panda*) and 10th Armoured Division (*Fox's Mask*)
- 11th Armoured Division (*Black Bull*)
- 79th Armoured Division (*Hobart's Funnies*)
- Guards Armoured Division (*Ever-Open Eye*)

### `ENG_ARM_02` / `ENG_ARM_03` — Tank Brigades / Heavy Armoured Brigades
Armoured brigades and army tank brigades under their real numbers (*4th Armoured Brigade 'Black Rats'*, *5th Guards Armoured Brigade*, *6th Guards Tank Brigade*, the 35th and 36th Army Tank Brigades). `ENG_ARM_03` keeps vanilla's numbered heavy brigades.

### `ENG_PAR_01` — Airborne Divisions
British airborne: 1st Airborne Division (*Red Devils* — Arnhem) and 6th Airborne Division (D-Day landings). Extended numbered series for alt-history airborne expansion.

### `ENG_PAR_02` — Parachute Brigades
Parachute and airlanding brigade formations: 1st through 5th Parachute Brigades (the 2nd as the *2nd Independent Parachute Brigade* of Italy and Greece), the 1st and 6th Airlanding Brigades, and the *16th Independent Parachute Brigade Group* of 1948.

### `ENG_MAR_01` — Royal Marines
Royal Marines formations: the Royal Marine Division and its 101st–103rd Royal Marine Brigades, the Mobile Naval Base Defence Organisations I and II, the 116th and 117th Infantry Brigades Royal Marines of 1945, the Royal Marine Commandos (Nos. 40 through 48), and the *63rd (Royal Naval) Division* of 1914–18.

### `ENG_MNT_01` — Mountain Divisions
Mountain and highland infantry. `ENG_MNT_01` links numbering with motorized/mechanized lists.

### `ENG_MNT_02` — Gurkha Divisions
Gurkha formations — the famous Nepalese light infantry regiments of the British Indian Army, with `can_use` available to either `ENG` or `RAJ`.

### `ENG_GAR_01` — Garrison Divisions
Anti-invasion County Divisions (Devon & Cornwall, Dorset, Durham & North Riding, Essex, Hampshire, Lincolnshire, Norfolk, Northumberland, West Sussex, Yorkshire) and strategic overseas fortress garrisons (Gibraltar, Malta, Singapore, Hong Kong).

### `ENG_COL_01` — Colonial Divisions
Formations from British colonial territories and protectorates: the 11th (East Africa), 12th (African), 81st and 82nd (West Africa) Divisions; the King's African Rifles (KAR) and the Royal West African Frontier Force (RWAFF); the Sudan Defence Force, Somaliland Camel Corps, Arab Legion, Transjordan Frontier Force, Palestine Regiment and Aden Protectorate Levies; the Burma Rifles, Malay Regiment and Hong Kong Volunteer Defence Corps; and the Cyprus, King's Own Malta, Caribbean and Fiji regiments.

### `ENG_HOMEGUARD_01` — Home Guard
The British Home Guard (*Dad's Army*) — territorial defence formations organized by county to defend the British Isles against invasion. 40 named county formations.

### `ENG_ROYAL_GUARD_01` — Household Divisions
Household Division formations: Grenadier, Coldstream, Scots, Irish, and Welsh Guards, Household Cavalry, Life Guards, Royal Horse Guards (*The Blues*), and King's Guard formations.

### `ENG_AIR_01` — Anti-Aircraft Divisions
The twelve divisions of Anti-Aircraft Command (1939–1942), each with the area it defended (*1st (London)*, *3rd (Scotland & Northern Ireland)*, *8th (South West England)*).

### `ENG_INDEPENDENT_BRIGADES_01` — Independent Brigades
The 1st Independent Brigade Group (Guards), the 20th Independent Infantry Brigade (Guards), and the 201st–225th Independent Infantry Brigades (Home), raised for static coastal defence in 1940–41.

### `ENG_SSB_01` — Special Service Brigades (Commandos / SAS)
Special Service brigades: 1st through 4th Special Service Brigades (later Commando Brigades), including Lord Lovat's commandos.

### `ENG_DEM_01` / `ENG_FAS_01` / `ENG_FAS_02` — Democratic Loyalist & Fascist Formations
Ideology-gated formations for British political paths: Democratic/Neutral Loyalist Brigades (`ENG_DEM_01`), British Union of Fascists Blackshirt Brigades (`ENG_FAS_01`), and the Fascist volunteer Legion of St. George (`ENG_FAS_02`).

### `ENG_COM_01` / `ENG_COM_02` — Communist Formations
Communist-gated suites for a socialist Britain: Workers' Defense Brigades (`ENG_COM_01`) honoring historical labor movements and International Brigade veterans (Tom Mann, Shapurji Saklatvala, James Connolly Column, Tolpuddle Martyrs, Red Clydeside), and the regular People's Army Divisions (`ENG_COM_02`).

