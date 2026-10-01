# United States

**Country Tag:** `USA` | **Source File:** [`INEX_USA_names_divisions.txt`](../common/units/names_divisions/INEX_USA_names_divisions.txt)

---

## Historical Overview

The United States Army expanded from a modest peacetime force of fewer than 190,000 soldiers in 1939 to an eighty-nine-division global fighting force by 1945, deployed across European, Mediterranean, and Pacific theaters. INEX provides an exhaustive, modernized suite of 25 distinct division namelists covering regular frontline forces, armored cavalry reconnaissance, separate tank battalions, amphibious raiders, island defense commands, coastal harbor defenses, authentic World War II State Defense Forces, and distinct ideological paths for *Man the Guns* alternate-history campaigns.

All names strictly adhere to authentic American military conventions, using nominative casing without ordinal periods (*1st Infantry Division*, *82nd Airborne Division*), official divisional monikers, and correct English ordinal suffixes (`%dst`, `%dnd`, `%drd`, `%dth`).

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `USA_INF_01` | Infantry Divisions | infantry | `%d Infantry Division` |
| `USA_GAR_01` | National Guard Divisions | infantry | `%d National Guard Division` |
| `USA_CAV_01` | Cavalry Divisions | cavalry | `%d Cavalry Division` |
| `USA_MOT_01` | Motorized Divisions | motorized | `%d Motorized Division` |
| `USA_MEC_01` | Mechanized Divisions | mechanized | `%d Mechanized Division` |
| `USA_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Armored Division` |
| `USA_ACR_01` | Armored Cavalry Regiments | light_armor, motorized, mechanized | `%d Armored Cavalry Regiment` |
| `USA_ARMORED_DETACHMENTS_01` | Separate Tank Battalions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Tank Battalion` |
| `USA_PAR_01` | Airborne Divisions | paratrooper | `%d Airborne Division` |
| `USA_MAR_01` | Marine Divisions | marine | `%d Marine Division` |
| `USA_MAR_BGD_01` | Marine Raider Battalions | marine | `%d Marine Battalion` |
| `USA_MNT_01` | Mountain Divisions | mountaineers | `%d Mountain Division` |
| `USA_RANGER_FORCE_01` | Ranger Battalions | mountaineers, paratrooper, infantry | `%d Ranger Battalion` |
| `USA_COMPOSITE_UNITS_01` | Provisional Task Forces | infantry, motorized, mechanized | `Task Force %d` |
| `USA_DEF_01` | State Defense Forces | militia, infantry | `%d State Defense Force` |
| `USA_COAST_01` | Harbor Defense Commands | infantry | `%d Coast Artillery Command` |
| `USA_MIL_01` | State Militias | militia | `%d State Militia` |
| `USA_SHOCK_01` | Assault Divisions | mechanized, motorized, light_armor, medium_armor, heavy_armor, modern_armor, infantry | `%d Assault Division` |
| `USA_COM_GUARD_01` | Workers' Red Guards | infantry, militia | `%d Red Guard Division` |
| `USA_COM_BGD_01` | Lincoln Brigades | infantry, motorized | `%d International Brigade` |
| `USA_COM_ARM_01` | Red Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Red Armored Division` |
| `USA_FASCIST_01` | Silver Legions | infantry | `%d National Legion` |
| `USA_PARAMILITARY_01` | Nationalist Militias | militia | `%d Nationalist Militia` |
| `USA_CONFED_01` | Confederate Divisions | infantry, cavalry | `%d Confederate Division` |
| `USA_JUNTA_01` | Federal Emergency Forces | infantry, militia | `%d Emergency Defense Division` |

---

## Group Details

### Regular Army & Line Infantry
- **`USA_INF_01` — Infantry Divisions**: Comprehensive coverage of the 1st–106th Infantry Divisions (Regular Army, National Guard, and Army of the United States), plus authentic Operation Fortitude deception formations (6th, 9th, 14th, 18th, 21st, 22nd, 108th, 119th, 130th, 135th, 141st, 157th) and postwar reserve activations. Includes official nicknames (*Big Red One*, *Indianhead*, *Rock of the Marne*, *Ivy*, *Tropic Lightning*, *Thunderbird*, *Americal*).
- **`USA_GAR_01` — National Guard Divisions**: Dedicated state-identified National Guard formations linked to regular infantry numbering, including the 26th (*Yankee*), 27th (*New York*), 28th (*Keystone*), 29th (*Blue and Gray*), 30th (*Old Hickory*), 31st (*Dixie*), 32nd (*Red Arrow*), 36th (*Texas*), 42nd (*Rainbow*), 45th (*Thunderbird*), and postwar 46th–51st divisions.
- **`USA_MOT_01` & `USA_MEC_01` — Motorized & Mechanized Divisions**: Numbered in sequence with the infantry divisions via `link_numbering_with`, featuring designated mobile divisions with authentic nicknames.

### Mobile & Armored Forces
- **`USA_ARM_01` — Armored Divisions**: All 16 historical armored divisions (1st–16th) with official monikers (*Old Ironsides*, *Hell on Wheels*, *Spearhead*, *Breakthrough*, *Victory*, *Super Sixth*, *Lucky Seventh*, *Thundering Herd*, *Phantom*, *Tiger*, *Thunderbolt*, *Hellcat*, *Black Cat*, *Liberator*), plus postwar National Guard armored divisions (27th, 30th, 40th, 48th, 49th, 50th) and alternate-history numbered armor through the 70s.
- **`USA_ACR_01` — Armored Cavalry Regiments**: Specialized mechanized cavalry reconnaissance groups and regiments, featuring the 2nd ACR (*Second Dragoons*), 3rd ACR (*Brave Rifles*), 6th Cavalry Group (*Fighting Sixth*), 11th ACR (*Blackhorse*), 14th ACR (*First Dragoon*), and historical reconnaissance groups (4th, 15th, 106th, 107th, 113th, 115th, 116th).
- **`USA_ARMORED_DETACHMENTS_01` — Separate Tank Battalions**: Independent tank battalions attached to infantry and airborne divisions in the European theater, including the 70th, 741st (*Omaha Beach*), 743rd (*Roll On*), 756th (*Cassino*), 761st (*Black Panthers*), 771st, 777th (*Steel Wolves*), 781st, and 784th (*Black Tigers*).
- **`USA_CAV_01` — Cavalry Divisions**: Historical Regular Army 1st Cavalry Division (*The First Team*), 2nd Cavalry Division (Buffalo Soldiers), 3rd Cavalry, National Guard 21st–24th divisions, separate state cavalry brigades (51st–59th), and interwar numbered reserve divisions (61st–66th).
- **`USA_SHOCK_01` — Assault Divisions**: Heavy breakthrough formations organized around Combat Commands (*Iron Vanguard*, *Spearhead*, *Thunderbolt*, *Hell on Wheels*, *Old Ironsides*).
- **`USA_COMPOSITE_UNITS_01` — Provisional Task Forces**: Historical combined-arms provisional strike groups formed for breakthrough and pursuit operations (Task Forces Butler, Baum, Lovelady, Raff, Hogan, Richardson, Rose, O'Hara, Welborn, Dooley).

### Specialized, Airborne & Amphibious Forces
- **`USA_PAR_01` — Airborne Divisions**: The 11th (*Angels*), 13th (*Black Cats*), 17th (*Golden Talons*), 82nd (*All-American*), and 101st (*Screaming Eagles*), plus Operation Fortitude deception divisions (6th, 9th, 18th, 21st, 135th) and independent Parachute Infantry Regiments (501st–517th PIR, 555th *Triple Nickles*).
- **`USA_MAR_01` — Marine Divisions**: The 1st–6th US Marine Corps divisions with authentic monikers (*The Old Breed*, *Follow Me*, *Fighting Third*, *Fighting Fourth*, *The Spearhead*, *The Striking Sixth*), supplemented by Pacific campaign battle-honor divisions (7th–25th) including Guadalcanal, Tarawa, Saipan, Iwo Jima, and Okinawa.
- **`USA_MAR_BGD_01` — Marine Raider Battalions**: Elite raiding battalions, provisional brigades, and island defense formations: 1st Raider (*Edson's Raiders*), 2nd Raider (*Carlson's Raiders*), 3rd & 4th Raiders, 1st Paramarines, 1st–6th Provisional Marine Brigades (Iceland, Samoa, Guam), and 1st–18th Marine Defense Battalions (Pearl Harbor, Midway, Guantanamo, Wake Island).
- **`USA_MNT_01` — Mountain Divisions**: 10th Mountain Division (*Climb to Glory*), 85th/86th/87th Mountain Infantry, and a series named after prominent North American mountain ranges (Cascades, Sierra Nevada, Rockies, Appalachians, Adirondacks, Olympics, Black Hills, Tetons).
- **`USA_RANGER_FORCE_01` — Ranger Battalions**: Specialized raiding forces including the 1st–6th Ranger Battalions (*Darby's Rangers*, *Pointe du Hoc*, *Cabanatuan*), 1st Special Service Force (*The Devil's Brigade*), 5307th Composite Unit (*Merrill's Marauders*), Alamo Scouts, Mars Task Force, 99th Viking Battalion, 100th Purple Heart Battalion, and OSS Operational Groups.
- **`USA_COAST_01` — Harbor Defense Commands**: Authentic Coast Artillery Corps harbor defense commands guarding vital ports: Harbor Defenses of New York, Boston, San Francisco, Chesapeake Bay, Puget Sound, Pearl Harbor, Manila and Subic Bays, San Diego, Delaware, Galveston, and the Panama Canal.

### Territorial & State Defense
- **`USA_DEF_01` — State Defense Forces**: 38 authentic World War II state guard and reserve defense forces raised under Section 61 of the National Defense Act when the National Guard was federalized (New York Guard, Pennsylvania Reserve Defense Corps, Texas Defense Guard, California State Guard, Virginia Protective Force, Ohio State Guard, Alaska Territorial Guard, Hawaii Territorial Guard). Gated to Democratic and Neutrality governments.
- **`USA_MIL_01` — State Militias**: Home defense volunteer and militia formations (*Minute Men*, *Continental*, *Patriot*, *Green Mountain*, *Colonial*, *Frontier*). Gated to Democratic and Neutrality governments.

### Dedicated Ideological Suites
All ideological suites are strictly gated by `has_government = <ideology>` without focus dependencies:
- **Communist Path (`has_government = communism`)**:
  - `USA_COM_GUARD_01` (Workers' Red Guards): Named after prominent American labor leaders and abolitionists (Eugene V. Debs, Mother Jones, John Brown, Big Bill Haywood, Joe Hill, Frederick Douglass, Sojourner Truth, Tom Mooney, Lucy Parsons, Elizabeth Gurley Flynn) and historical labor strikes (Haymarket, Homestead, Pullman, Battle of Blair Mountain, Flint Sit-Down, Lawrence Bread & Roses).
  - `USA_COM_BGD_01` (Lincoln Brigades): International and anti-fascist volunteer brigades (*Abraham Lincoln*, *George Washington*, *John Brown Battery*, *Debs Column*, *Mackenzie-Papineau*).
  - `USA_COM_ARM_01` (Red Armored Divisions): Industrial union armored divisions (Steelworkers, Auto Workers, Teamsters, Mineworkers, Railway Brotherhood, Longshoremen, Machinists).
- **Fascist Path (`has_government = fascism`)**:
  - `USA_FASCIST_01` (Silver Legions): Formations inspired by William Dudley Pelley's Silver Legion of America and regional Bund posts (*Christian Commonwealth*, *Washington Post No. 1*, *New England Post*, *Great Lakes Post*, *Gau Ost*, *Camp Siegfried*).
  - `USA_PARAMILITARY_01` (Nationalist Militias): Regional radical factions including the Christian Front (*New York*, *Boston*, *Philadelphia*, *Detroit*) and Black Legion (*Wolverine League*, *Highland Park*, *Pontiac*, *Akron*).
  - `USA_CONFED_01` (Confederate Divisions): Specialized formations for the alternate-history civil war path (*Army of Northern Virginia*, *Stonewall*, *Army of Tennessee*, *Palmetto Guard*, *Dixie Rifles*, *Texas Rangers*).
- **Non-Aligned / Military Junta Path (`has_government = neutrality`)**:
  - `USA_JUNTA_01` (Federal Emergency Forces): Formations reflecting emergency military rule under General Douglas MacArthur (Federal District Emergency Division, Continental Command, Provost Marshal General, Regional Military District Commands, MacArthur Loyalists, Veterans' Defense Corps).
