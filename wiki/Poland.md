# Poland

**Country Tag:** `POL` | **Source File:** [`zz_INEX_POL_names_divisions.txt`](../common/units/names_divisions/zz_INEX_POL_names_divisions.txt)

---

## Historical Overview

Poland's military history in WWII is uniquely complex: the 1939 defensive campaign, exile forces (*Polskie Siły Zbrojne* — PSZ) fighting in the West and in the Mediterranean, the Soviet-backed *Ludowe Wojsko Polskie* (LWP) and communist partisans (*Gwardia Ludowa* / *Armia Ludowa*), the underground *Armia Krajowa* (Home Army), and nationalist resistance formations (*Narodowe Siły Zbrojne* — NSZ). INEX provides immersive, historically verified namelists for each tradition alongside the Second Republic's regular armed forces, border guards (KOP), territorial militia (Obrona Narodowa), and specialist arms.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `POL_GA_01` | Artillery Groups | artillery | `%d Grupa Artylerii` |
| `POL_AA_01` | Anti-Air Regiments | anti_air | `%d Pułk Artylerii Przeciwlotniczej` |
| `POL_AA_02` | Anti-Air Battalions | anti_air | `%d Dywizjon Artylerii Przeciwlotniczej` |
| `POL_POLIC_01` | Military Police Battalions | cavalry, infantry | `%d Dywizjon Żandarmerii` |
| `POL_MOT_02` | Armored-Motorized Divisions | motorized | `%d Dywizja Pancerno-Motorowa` |
| `POL_ON_01` | National Defence Brigades | militia | `%d Batalion Obrony Narodowej` |
| `POL_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Dywizja Pancerna` |
| `POL_ARM_BRIGADE_01` | Armored Battalions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Batalion Pancerny` |
| `POL_INF_01` | Infantry Divisions | infantry | `%d Dywizja Piechoty` |
| `POL_PSZ_01` | Infantry Divisions (PSZ) | infantry | `%d Dywizja Piechoty (PSZ)` |
| `POL_PSZ_02` | Infantry Divisions (Anders) | infantry | `%d Dywizja Piechoty (PSZ w ZSRR)` |
| `POL_PSZ_03` | 2nd Polish Corps Divisions | infantry | `%d Dywizja Piechoty (2 Korpus Polski)` |
| `POL_LWP_01` | LWP Infantry Divisions | infantry | `%d Dywizja Piechoty (LWP)` |
| `POL_LWP_02` | LWP Cavalry Divisions | cavalry | `%d Dywizja Kawalerii (LWP)` |
| `POL_LWP_03` | LWP Anti-Air Divisions | anti_air | `%d Dywizja Artylerii Przeciwlotniczej` |
| `POL_AWL_03` | LWP Artillery Divisions | artillery | `%d Dywizja Artylerii` |
| `POL_LWP_00` | People's Infantry Divisions | infantry | `%d Ludowa Dywizja Piechoty` |
| `POL_LWZ_00` | LWP Mechanized Divisions | mechanized | `%d Ludowa Dywizja Zmechanizowana` |
| `POL_LDP_00` | People's Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Ludowa Dywizja Pancerna` |
| `POL_OTH_01` | People's Cavalry Divisions | cavalry | `%d Ludowa Dywizja Kawalerii` |
| `POL_AK_01` | Home Army Divisions | infantry | `%d Dywizja Piechoty AK` |
| `POL_INF_RESERVE_01` | Reserve Infantry Divisions | infantry | `%d Dywizja Piechoty Rezerwy` |
| `POL_CAV_01` | Cavalry Brigades | cavalry | `%d Brygada Kawalerii` |
| `POL_CAV_DIVISION_01` | Cavalry Divisions | cavalry | `%d Dywizja Kawalerii` |
| `POL_MOT_01` | Motorized Divisions | motorized | `%d Dywizja Motorowa` |
| `POL_MEC_01` | Mechanized Divisions | mechanized | `%d Dywizja Zmechanizowana` |
| `POL_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d Dywizja Pancerna` |
| `POL_PAR_01` | Airborne Divisions | paratrooper | `%d Dywizja Spadochronowa` |
| `POL_PAR_02` | LWP Airborne Divisions | paratrooper | `%d Dywizja Desantowa` |
| `POL_MAR_01` | Marine Divisions | marine | `%d Dywizja Piechoty Morskiej` |
| `POL_MNT_01` | Mountain Divisions | mountaineers | `%d Dywizja Piechoty Górskiej` |
| `POL_GAR_01` | Border Guard Brigades | infantry | `%d Brygada KOP` |
| `POL_GAR_02` | Border Guard Regiments | infantry | `%d Pułk KOP` |
| `POL_GAR_03` | KOP Cavalry Regiments | infantry | `%d Pułk Kawalerii KOP` |
| `POL_BSKRZ_01` | Nationalist Brigades (NSZ) | infantry, militia | `%d Brygada NSZ` |
| `POL_VOL_01` | Volunteer Divisions | infantry, cavalry, motorized | `%d Dywizja Ochotnicza` |
| `POL_VOL_02` | International Brigades | infantry, cavalry, motorized | `%d Brygada Międzynarodowa` |
| `POL_FORT_01` | Fortress Garrisons | infantry | `%d Batalion Forteczny` |
| `POL_GUA_01` | Royal Guard Divisions | infantry, cavalry, light_armor, medium_armor, heavy_armor, modern_armor | `%d Dywizja Gwardii Królewskiej` |
| `POL_POW_01` | Uprising Regiments | militia, infantry | `%d Pułk Powstańczy` |

---

## Group Details

### `POL_INF_01` — Infantry Divisions (Dywizja Piechoty)
The main pre-war and wartime Polish regular infantry series. Covers 1–30 *Dywizja Piechoty* including the historical regional and honorary titles of the 1939 campaign: *1 DP Legionów Józefa Piłsudskiego*, *2 DP* & *3 DP Legionów*, *10 Kaniowska DP*, *11 Karpacka DP*, *13 Kresowa DP*, *14*, *15*, *17 Wielkopolska DP*, *16 Pomorska DP*, *18 DP Ziemi Łomżyńskiej*, *21* & *22 DP Górskiej*, *23 Górnośląska DP*, *25 DP Ziemi Kaliskiej*, *29 Grodzieńska DP*, and *30 Poleska DP*.

### `POL_ARM_01` & `POL_ARM_BRIGADE_01` — Armored Divisions & Battalions
Polish armored forces across all WWII theatres: General Stanisław Maczek's famed 1st Armoured Division (*1 Dywizja Pancerna — Czarne Diabły*), the 2nd Warsaw Armoured Division in Italy (*2 Warszawska Dywizja Pancerna*), the 10th Armoured Cavalry Brigade (*10 Brygada Kawalerii Pancernej*), and peacetime armored battalions (1–12 *Batalion Pancerny*) alongside wartime tank brigades.

### `POL_PSZ_01` — Infantry Divisions (PSZ)
*Polskie Siły Zbrojne* — Polish exile forces formed in France (1939–1940) and reorganized in the United Kingdom under Allied operational command: 1st Grenadier Division, 2nd Infantry Fusiliers, 1st Independent Parachute Brigade, and the Independent Podhale Rifle Brigade. Gated to democratic/neutral governments.

### `POL_PSZ_02` — Infantry Divisions (Anders)
The Polish Armed Forces in the USSR (Anders' Army) formed in 1941–1942 following the Sikorski-Mayski agreement, prior to evacuation to Iran and the Middle East: 5th Wilno, 6th Lwów, and 7th–10th infantry divisions. Gated to democratic/neutral governments.

### `POL_PSZ_03` — 2nd Polish Corps Divisions
General Władysław Anders' 2nd Polish Corps (*2 Korpus Polski*) in the Italian Campaign: 3rd Carpathian Rifle Division (*3 Dywizja Strzelców Karpackich* at Monte Cassino), 5th Kresowa Infantry Division, 2nd Warsaw Armoured Brigade, and the 14th Wielkopolska Armoured Brigade of 1945. Gated to democratic/neutral governments.

### `POL_LWP_00` to `POL_LWP_03` / `POL_AWL_03` / `POL_LWZ_00` / `POL_LDP_00` / `POL_OTH_01` — Ludowe Wojsko Polskie
The Soviet-equipped *Ludowe Wojsko Polskie* (LWP) and its post-war successors: 1st 'Tadeusz Kościuszko' Infantry Division, 2nd 'Henryk Dąbrowski', the 1st Warsaw Independent Cavalry Brigade, Sudecka and Drezdeńska mechanized and armored divisions, and artillery and anti-aircraft divisions. Gated to communist governments.

### `POL_AK_01` — Home Army Divisions (Armia Krajowa)
The underground *Armia Krajowa* (AK) of occupied Poland. Features 21 historical division designations mobilized for Operation Tempest (*Plan Burza*) in 1944 across regional inspectorates: *2 DP Legionów „Pogoń”*, *5 DP „Dzieci Lwowskich”*, *6 DP Ziemi Krakowskiej „Odwet”*, *7 DP „Orzeł”*, *8 DP im. Romualda Traugutta*, *27 Wołyńska DP*, *28 DP im. Stefana Okrzei*, etc. Gated to democratic/neutral governments.

### `POL_CAV_01` & `POL_CAV_DIVISION_01` — Cavalry Brigades & Divisions
Poland's famous pre-war cavalry: covers all 11 active cavalry brigades (*Krakowska*, *Kresowa*, *Mazowiecka*, *Nowogródzka*, *Podlaska*, *Podolska*, *Pomorska*, *Suwalska*, *Wielkopolska*, *Wileńska*, *Wołyńska*), the 10th Motorized Cavalry Brigade, wartime reserve brigades, and historical cavalry divisions.

### `POL_GAR_01` / `POL_GAR_02` / `POL_GAR_03` — Korpus Ochrony Pogranicza (KOP)
*Korpus Ochrony Pogranicza* — the elite Polish Border Protection Corps defending the eastern frontier against Soviet incursions: regional brigades (*Grodno*, *Nowogródek*, *Podole*, *Polesie*, *Wilno*, *Wołyń*), border regiments, and KOP cavalry squadrons (*Niewirków*, *Kraśne*, *Czortków*, *Hłubokie*, *Rokitno*).

### `POL_ON_01` — National Defence Brigades (Obrona Narodowa — ON)
*Obrona Narodowa* territorial militia established in 1937 for regional defense: covers all 16 historical brigades and half-brigades (Warszawska, Śląsko-Cieszyńska, Podhalańska, Morska, Pomorska, Lwowska, etc.). Gated to democratic/neutral governments.

### `POL_BSKRZ_01` — Nationalist Brigades (NSZ)
*Narodowe Siły Zbrojne* (NSZ) and *Narodowa Organizacja Wojskowa* (NOW) right-wing and nationalist resistance formations: the *Brygada Świętokrzyska*, *Brygada Dyspozycyjno-Zmotoryzowana „Koło”*, 202 and 204 regiments, and NOW insurgent battalions (*Gustaw*, *Harnaś*). Gated to fascist governments.

### `POL_PAR_01` & `POL_PAR_02` — Airborne Divisions
General Stanisław Sosabowski's 1st Independent Parachute Brigade (*1 Samodzielna Brygada Spadochronowa*) at Arnhem, post-war Polish airborne formations, and the 6th Pomeranian Airborne Division (*6 Pomorska Dywizja Powietrznodesantowa — Czerwone Berety*).

### `POL_MNT_01` — Mountain Divisions (Dywizje Piechoty Górskiej)
Authentic mountain and highland formations: 21st and 22nd Mountain Infantry Divisions, the Independent Highland Brigade (*Samodzielna Brygada Strzelców Podhalańskich* at Narvik), 3rd Carpathian Rifle Division (*3 Dywizja Strzelców Karpackich* at Monte Cassino), and regional Podhale rifle regiments (*Strzelcy Podhalańscy*).

### `POL_VOL_01` — Volunteer Divisions
Volunteer and expeditionary formations from 1914 to 1920, for volunteers sent abroad: the Polish rifle divisions of Haller's Blue Army in France and of the Polish corps in Russia (*1–7 Dywizja Strzelców Polskich*, the Siberian Division), the three brigades of the Polish Legions, the French *Bajończycy*, and the 1920 Volunteer Army (*Dywizja Ochotnicza*, the 200-series volunteer regiments). Some entries are plausible extensions. Any government.

### `POL_VOL_02` — International Brigades (Dąbrowszczacy)
Polish volunteers of the Spanish Civil War: the XIII *Jarosław Dąbrowski* International Brigade, the Dąbrowski and Mickiewicz battalions, the Palafox battalion and the Botwin, Szewczenko and Waryński companies, extended with plausible volunteer divisions named after revolutionary patrons. Gated to communist governments.

### `POL_FORT_01` — Fortress Garrisons
Fortified areas and city defence commands for static garrison templates: the Hel Fortified Area, the Silesia Fortified Area (*Obszar Warowny „Śląsk”*) and its combat groups, the Wizna line, the Sarny fortified area on the eastern border, the Warsaw defence command, Modlin and Lwów, followed by plausible garrisons of the old fortresses (Brześć, Przemyśl, Dęblin, Grudziądz, Osowiec). Westerplatte is in `POL_MAR_01`. Any government.

### `POL_GUA_01` — Royal Guard Divisions
For a restored monarchy (the vanilla King's Guard focus): the Crown Foot and Horse Guards of the Commonwealth, interwar regiments named after Polish kings (17th, 20th and 27th Uhlans, 81st Grodno Rifles), and guard infantry, cavalry, hussar and armoured divisions named after the kings. The division names are plausible extensions. Gated to non-aligned and fascist governments.

### `POL_POW_01` — Uprising Regiments
Insurgent formations of the Greater Poland Uprising (1918–1919: *Strzelcy Wielkopolscy*, the Greater Poland Army and Front) and the Third Silesian Uprising (1921: the *Wschód*, *Południe*, *Północ* and *Środek* groups, district regiments, the Wawelberg sabotage group), with the Polish Military Organisation (POW). Any government.

