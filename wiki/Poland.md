# Poland

**Country Tag:** `POL` | **Source File:** [`INEX_POL_names_divisions.txt`](../common/units/names_divisions/INEX_POL_names_divisions.txt)

---

## Historical Overview

Poland's military history in WWII is uniquely complex: the 1939 campaign, exile forces (*Polskie Siły Zbrojne* — PSZ) fighting under British command in the West, the communist *Ludowe Wojsko Polskie* (LWP) formed in the USSR, the underground *Armia Krajowa* (Home Army), partisan resistance groups, and the fascist *Brygada Świętokrzyska*. INEX covers all of these threads, plus the pre-war Polish army's rich regimental naming traditions (named for medieval battles, heroes, and regions) and specialized arms (artillery, anti-air, cavalry brigades).

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `POL_GA_01` | Artillery Group | artillery | *(artillery format)* |
| `POL_AA_01` | Anti-Air Regiment | anti_air | *(AA regiment format)* |
| `POL_AA_02` | Anti-Air Division | anti_air | *(AA division format)* |
| `POL_POLIC_01` | Military Police | cavalry, infantry | *(Military Police format)* |
| `POL_MOT_02` | Motorized Division | motorized | *(motorized format)* |
| `POL_ON_01` | National Defence Brigade | militia | *(ON brigade format)* |
| `POL_ARM_01` | Armored Division | light_armor, medium_armor, heavy_armor, modern_armor | *(armor format)* |
| `POL_ARM_BRIGADE_01` | Armored Battalion | light_armor, medium_armor, heavy_armor, modern_armor | *(armor battalion format)* |
| `POL_INF_01` | Infantry Division | infantry | `%d Dywizja Piechoty` |
| `POL_PSZ_01` | Infantry Division (PSZ) | infantry | *(PSZ exile format)* |
| `POL_PSZ_02` | Infantry Division (USSR) | infantry | *(Berling Army format)* |
| `POL_PSZ_03` | Infantry Division (P2C) | infantry | *(P2C format)* |
| `POL_LWP_01` | People's Infantry Division (LWP) | infantry | *(LWP infantry format)* |
| `POL_LWP_02` | People's Mechanized Division (LWP) | mechanized | *(LWP mechanized format)* |
| `POL_LWP_03` | People's Armored Division (LWP) | light_armor | *(LWP armor format)* |
| `POL_AWL_03` | Infantry Division (GL) | infantry | *(Gwardia Ludowa format)* |
| `POL_LWP_00` | Cavalry Division (GL) | cavalry | *(cavalry GL format)* |
| `POL_LWZ_00` | Anti-Air Division (GL) | artillery | *(AA GL format)* |
| `POL_LDP_00` | Artillery Division | artillery | *(artillery GL format)* |
| `POL_OTH_01` | Other (misc.) | infantry | *(misc format)* |
| `POL_AK_01` | Home Army Divisions | infantry | *(AK format)* |
| `POL_INF_RESERVE_01` | Reserve Infantry Division | infantry | *(reserve format)* |
| `POL_CAV_01` | Cavalry Brigade | cavalry | *(cavalry brigade format)* |
| `POL_CAV_DIVISION_01` | Cavalry Division | cavalry | *(cavalry division format)* |
| `POL_MOT_01` | Motorized Division | motorized | *(motorized format)* |
| `POL_MEC_01` | Mechanized Division | mechanized | *(mechanized format)* |
| `POL_ARM_01` | Armored Division | light_armor, medium_armor, heavy_armor, modern_armor | *(armor format)* |
| `POL_PAR_01` | Airborne Division | paratrooper | *(airborne format)* |
| `POL_PAR_02` | Airborne Division (LWP) | paratrooper | *(LWP airborne format)* |
| `POL_MAR_01` | Marine Division | marine | *(marine format)* |
| `POL_MNT_01` | Mountain Division | mountaineers | *(mountain format)* |
| `POL_GAR_01` | Border Guard Brigade | infantry | *(KOP format)* |
| `POL_GAR_02` | Border Guard Regiment | infantry | *(KOP regiment format)* |
| `POL_GAR_03` | Border Guard Regiment 2 | infantry | *(KOP regiment 2 format)* |
| `POL_BSKRZ_01` | Świętokrzyska Brigade | infantry, militia | *(Świętokrzyska format)* |

---

## Group Details

### `POL_INF_01` — Infantry Divisions (Dywizja Piechoty)
The main pre-war and wartime Polish infantry series. Covers 1–30 *Dywizja Piechoty* including the famous divisions of the 1939 campaign: *1 DP*, *2 DP* (*Legionów*), *3 DP* (*Karpacka*), *8 DP*, etc.

### `POL_PSZ_01` — PSZ Exile Forces (West)
*Polskie Siły Zbrojne* — Polish exile forces in the West under British command. Covers:
- 1st Polish Armoured Division (*Czarna Pantera*) — Falaise Gap, Market Garden
- 3rd Carpathian Rifle Division
- 5th Kresowa Infantry Division
- 2nd Warsaw Armoured Division

### `POL_PSZ_02` — Berling Army (Soviet-raised Polish)
The 1st Polish Army (*1 Armia Wojska Polskiego*) raised in the USSR under General Berling — later integrated into the LWP.

### `POL_LWP_01` / `POL_LWP_02` / `POL_LWP_03` — LWP (People's Army)
*Ludowe Wojsko Polskie* — the communist Polish People's Army, allied with the USSR. Numbered infantry, mechanized, and armored divisions in Soviet organizational style.

### `POL_AK_01` — Home Army (Armia Krajowa)
The *Armia Krajowa* (AK) — the underground Home Army of occupied Poland, the largest resistance movement in occupied Europe. 19 named AK district formations plus the 106th Division (*Torun*), covering all major AK territorial commands (*Obszar Lwów*, *Wilno*, *Nowogródek*, *Polesie*, *Wołyń*, *Kraków*, *Łódź*, *Radom*, *Kielce*, *Lublin*, *Białystok*, *Warszawski*).

### `POL_CAV_01` — Cavalry Brigades (Brygada Kawalerii)
Polish cavalry brigades — one of the most famous cavalry forces of the WWII era. Named entries cover all 11 pre-war cavalry brigades:
*Brygada Kawalerii Krakowska*, *Wołyńska*, *Kresowa*, *Nowogródzka*, *Podolska*, *Mazowiecka*, *Suwalska*, *Podlaska*, *Wielkopolska*, *Pomorska*, *Bielska* — plus numbered reserve brigades and extensions.

### `POL_GAR_01` / `POL_GAR_02` / `POL_GAR_03` — Korpus Ochrony Pogranicza (KOP)
*Korpus Ochrony Pogranicza* — the Polish Border Defence Corps, responsible for guarding the eastern frontier with the USSR. Organized into brigades and regiments by border region.

### `POL_ON_01` — National Defence (Obrona Narodowa — ON)
*Obrona Narodowa* militia formations — Polish territorial defence units established in 1937 for local and second-line defence.

### `POL_BSKRZ_01` — Świętokrzyska Brigade
The *Brygada Świętokrzyska* — a right-wing nationalist (NSZ) formation that controversially collaborated with Germany against Soviet forces in the final stage of the war. Only one entry; flagged `infantry, militia`.

### `POL_PAR_01` — Airborne (PSZ)
The 1st Independent Parachute Brigade (*1 Samodzielna Brygada Spadochronowa*) — the famous Polish paratroopers at Arnhem.

### `POL_MNT_01` — Mountain Divisions (Brygada Górska)
Polish mountain infantry brigades, including the 21st and 22nd Mountain Infantry Divisions formed in the Carpathian region.

