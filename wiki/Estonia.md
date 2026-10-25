# Estonia

**Country Tag:** `EST` | **Source File:** [`zz_INEX_EST_names_divisions.txt`](../common/units/names_divisions/zz_INEX_EST_names_divisions.txt)

---

## Historical Overview

The Estonian Army fought the War of Independence (1918-1920) with three divisions (*1.*, *2.* and *3. diviis*), nine infantry regiments (*1. jalaväepolk* to *9. jalaväepolk*), partisan and volunteer battalions (*Kuperjanovi partisanide pataljon*, *Sakala partisanide pataljon*, *Kalevlaste Maleva polk*, *Scoutspolk*), county defence battalions and the Armoured Train Division (*Soomusrongide diviis*) with its named trains and armoured cars (*Kapten Irw*, *Wahur*, *Toonela*, *Pisuhänd*). In peace it kept three divisions (HQ Rakvere, Tartu and Tallinn) of regiments and independent battalions (*üksik jalaväepataljon*), a cavalry regiment (*Ratsarügement*), the *Auto-tankirügement* and the coastal commands of Aegna, Naissaar and Suuropi; a 4th Division followed in February 1940. Behind it stood the Defence League (*Kaitseliit*), one *malev* per county.

Estonian writes the ordinal with a full stop (*1. jalaväepolk*) and common nouns in lower case. The divisions carried no honorifics, so the Named lists are extensions: the ancient counties and the battles of the War of Independence for infantry (*1. jalaväediviis 'Virumaa'*), the 1919 armoured cars and train wagons for armour (*1. soomusdiviis 'Kapten Irw'*), the islands for marines. Nicknames stand in straight single quotes because the game's map font has no Estonian quotation marks; the 1919 vehicles keep their period spelling (*Wahur*, *Wibulane*).

INEX replaces all nine vanilla lists, whose names were Roman numerals in the genitive case (*III Jalaväediviisi*). Every vanilla number is written over, so none of vanilla's texts show. `EST_INF_01` also names the Anti-Soviet and Baltic Entente divisions of the vanilla focus tree.

Estonia starts in 1936 under Päts (`neutrality`). The Ancient Freedom (`neutrality`), Veterans' League (`fascism`), Red Rifle (`communism`) and Freedom Fighter (`democratic`) lists are gated by government type only and never mix traditions. No formation raised under the German occupation of 1941-1944 is used.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `EST_REG_01` | Infantry Regiments | infantry | `%d. jalaväerügement` |
| `EST_INF_01` | Infantry Divisions | infantry | `%d. jalaväediviis` |
| `EST_INF_02` | Infantry Divisions (Named) | infantry | `%d. jalaväediviis` |
| `EST_CAV_01` | Cavalry Regiments | cavalry | `%d. ratsapolk` |
| `EST_KL_01` | Defence League Malevs | infantry, militia | `Kaitseliidu %d. malev` |
| `EST_MOT_01` | Motorized Divisions | motorized | `%d. motoriseeritud jalaväediviis` |
| `EST_MEC_01` | Mechanized Divisions | mechanized | `%d. mehhaniseeritud jalaväediviis` |
| `EST_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. tankidiviis` |
| `EST_ARM_02` | Armored & Mobile (Named) | light_armor, medium_armor, heavy_armor, modern_armor, motorized, mechanized | `%d. soomusdiviis` |
| `EST_PAR_01` | Paratrooper Divisions | paratrooper | `%d. õhudessantdiviis` |
| `EST_MAR_01` | Marine Divisions | marine | `%d. merejalaväediviis` |
| `EST_MAR_02` | Coastal Defense & Marines | marine | `%d. merejalaväediviis` |
| `EST_MNT_01` | Mountain Divisions | mountaineers | `%d. mägijalaväediviis` |
| `EST_GAR_01` | Garrisons & Border Guards | infantry | `%d. garnisonidiviis` |
| `EST_MUI_01` | Ancient Freedom Divisions | infantry, cavalry | `%d. diviis` |
| `EST_VAPS_01` | Veterans' League Divisions | infantry, militia | `%d. vabadussõjalaste diviis` |
| `EST_RED_01` | Red Rifle Divisions | infantry, motorized | `%d. Eesti laskurdiviis` |
| `EST_MV_01` | Freedom Fighters | infantry, militia | `%d. vabadusvõitlejate diviis` |

---

## Group Details

### Regular army

### `EST_REG_01` — Infantry Regiments
The nine regiments of the War of Independence (*1. jalaväepolk* to *9. jalaväepolk*), the peacetime *10. üksik jalaväepataljon* and *Kalevi üksik jalaväepataljon*, the partisan, volunteer and guard units (*Kuperjanovi partisanide pataljon*, *Sakala partisanide pataljon*, *Kalevlaste Maleva polk*, *Scoutspolk*, *Vahipataljon*, *Ingeri polk*, *Balti pataljon*), and the county defence battalions of 1918-1919 (*Viljandi kaitsepataljon*, *Tallinna 1. kaitsepataljon*). Every name is attested.

### `EST_INF_01` — Infantry Divisions
Plain numbered divisions (*1. jalaväediviis*), the default for templates without a nickname. It writes over vanilla's 20 numbers.

### `EST_INF_02` — Infantry Divisions (Named)
Shares its numbering with `EST_INF_01`. The 1st to 4th Divisions of 1940 after the ancient county of their HQ region (*'Virumaa'*, *'Ugandi'*, *'Rävala'*, *'Sakala'*), then the other ancient counties and the battles of Paju, Võnnu, Krivasoo, Utria and Laagna. The nicknames are extensions.

### `EST_CAV_01` — Cavalry Regiments
The *1.* and *2. ratsapolk* of the War of Independence, further numbered regiments, the peacetime *Ratsarügement* and the squadrons of 1919 (*Tallinna üksik eskadron*, *Balti pataljoni eskadron*).

### Defence League

### `EST_KL_01` — Defence League Malevs
The fourteen county and town *malevad* of the Kaitseliit before 1940 (*Kaitseliidu Sakalamaa malev*), the naval *Merekaitseliit* and the Tallinn *malevkonnad* (*Kaitseliidu Toompea malevkond*). Ungated, as the League served every interwar government.

### Mobile and armour

### `EST_MOT_01` — Motorized Divisions
Plain numbered divisions (*1. motoriseeritud jalaväediviis*); writes over vanilla's 10 numbers.

### `EST_MEC_01` — Mechanized Divisions
Plain numbered divisions (*1. mehhaniseeritud jalaväediviis*); writes over vanilla's 10 numbers.

### `EST_ARM_01` — Armored Divisions
Plain numbered divisions (*1. tankidiviis*), the plain variant of `EST_ARM_02`.

### `EST_ARM_02` — Armored & Mobile (Named)
Shares its numbering with `EST_ARM_01` and also serves motorized and mechanized templates. The armoured train *Kapten Irw*, the armoured cars and trucks of 1919 (*Suur Tõll*, *Tasuja*, *Kalevipoeg*, *Wahur*, *Puuk*) and the artillery wagons of the armoured trains (*Hävitaja*, *Müristaja*) as nicknames (*1. soomusdiviis 'Kapten Irw'*), and the formations themselves (*Soomusrongide diviis*, *Soomusautode kolonn*, *Auto-tankirügement*, *Soomusrongirügement*).

### Specialists

### `EST_PAR_01` — Paratrooper Divisions
Plain numbered divisions (*1. õhudessantdiviis*); Estonia had no airborne tradition.

### `EST_MAR_01` — Marine Divisions
Plain numbered divisions (*1. merejalaväediviis*), the plain variant of `EST_MAR_02`.

### `EST_MAR_02` — Coastal Defense & Marines
Shares its numbering with `EST_MAR_01`. Marine divisions after the islands (*1. merejalaväediviis 'Saaremaa'*, *'Hiiumaa'*, *'Muhu'*), then the landing battalion of 1919 (*Meredessantpataljon*), the coastal commands (*Aegna*, *Naissaare* and *Suuropi komandantuur*) and the Lake Peipus flotilla (*Peipsi laevastiku divisjon*).

### `EST_MNT_01` — Mountain Divisions
Estonia has no mountains; the uplands and highest hills stand in (*1. mägijalaväediviis 'Haanja'*, *'Suur Munamägi'*). The nicknames are extensions.

### `EST_GAR_01` — Garrisons & Border Guards
The garrison towns of the 1939 army (*Tallinna garnison*, *Rakvere garnison*), other county towns, and the *Viru piirivalvepataljon*.

### Ideology suites

### `EST_MUI_01` — Ancient Freedom Divisions (neutrality)
The ancient fight for freedom of 1208-1227 that the Päts era celebrated: the elders *Lembitu* and *Meeme*, the strongholds (*Varbola*, *Otepää*, *Valjala*), the battles of Ümera and St Matthew's Day, and the St George's Night rising of 1343 (*15. diviis 'Jüriöö'*). The division names are extensions.

### `EST_VAPS_01` — Veterans' League Divisions (fascism)
The War of Independence Veterans' League (*vapsid*), with the Finnic lands of the vanilla Finno-Ugric union focuses as nicknames (*1. vabadussõjalaste diviis 'Karjala'*, *'Ingerimaa'*, *'Aunus'*), and the League's own *korrapidajate üksus*. The divisions are extensions; no leader is a patron.

### `EST_RED_01` — Red Rifle Divisions (communism)
The 22nd Territorial Rifle Corps of 1940-1941 with its 180th and 182nd Divisions (*'Põhja'*, *'Lõuna'*), the 8th Estonian Rifle Corps with the 7th and 249th Divisions and their regiments, and the Guards titles of 1945 (*118. kaardiväe Eesti Tallinna punalipuline laskurdiviis*), each on its own number.

### `EST_MV_01` — Freedom Fighters (democratic)
The Finnish Boys of JR 200 (*Soome jalaväerügement 200*), the defence of the Tief government in September 1944 (*Löögirühm Admiral Pitka*, the battle of Keila) and the Forest Brothers of 1944-1953 (*Relvastatud Võitluse Liit*, *Võrumaa metsavennad*, the battles of Saika and Puutlipalu).
