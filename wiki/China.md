# China

**Country Tag:** `CHI` | **Source File:** [`zz_INEX_CHI_names_divisions.txt`](../common/units/names_divisions/zz_INEX_CHI_names_divisions.txt)

---

## Historical Overview

The National Revolutionary Army (*Guomin Gemingjun*) of the Republic of China numbered its divisions (*shi*) in one series from the 1st to the 200th, and in the war against Japan added New (*Xinbian*), Provisional (*Zanbian*), Reserve (*Yubei*) and Honour (*Rongyu*) series. Two or three divisions formed an army (*jun*, a corps in strength). The core was the Central Army: the Whampoa-led divisions, the German-trained divisions of 1935-37 (the 36th, 87th and 88th first among them) and the Mechanized 200th Division of 1938. In 1942-45 the Chinese Army in India (X Force) and the Chinese Expeditionary Force (Y Force) fought in Burma and on the Salween with American equipment.

INEX writes the names in Hanyu Pinyin without tone marks, because the game's fonts lack the third-tone letters: *Di-36 Shi* (36th Division), *Xinbian Di-38 Shi* (New 38th Division), *Qibing Di-3 Shi* (3rd Cavalry Division, the arm before the number as the NRA wrote it). A HoI4 division is an NRA division; the corps-level armies have lists of their own. Battle honours stand in parentheses (*Di-88 Shi (Sihang)*), nicknames in single quotes (*Di-57 Shi 'Huben'*, *Di-74 Jun 'Kangri Tiejun'*). Burmese places keep their Chinese names: *Ren'anqiang* (Yenangyaung), *Mizhina* (Myitkyina), *Bamo* (Bhamo), *Tonggu* (Toungoo).

INEX replaces all nine vanilla lists, which counted corps as *Juntuán* (a misspelling of *juntuan*, an army group) and used the invented terms *Jidonghua* and *Sheng Jun*. Every vanilla number is written over. The game hands out names in the order of vanilla's file, so the numbers vanilla used for the German-trained and X Force divisions (402-499) come early: in the plain lists they read as New divisions, in the mountain list as mountain ranges.

China starts in 1936 under the Kuomintang (`neutrality`). The Party Army (`neutrality`), Blue Shirts (`fascism`), Republican Armies (`democratic`) and People's Revolutionary Army (`communism`) lists are gated by government type only and never mix traditions. The Red Army, the Eighth Route Army and the New Fourth Army belong to the Communist China (PRC) file, and the warlord cliques to their own tags.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `CHI_INF_01` | Infantry Divisions | infantry | `Di-%d Shi` |
| `CHI_INF_02` | Infantry Divisions (Named) | infantry | `Di-%d Shi` |
| `CHI_INF_03` | Expeditionary Divisions | infantry | `Yuanzhengjun Di-%d Shi` |
| `CHI_JUN_01` | Corps-Level Armies | infantry | `Di-%d Jun` |
| `CHI_JUN_02` | Corps-Level Armies (Named) | infantry | `Di-%d Jun` |
| `CHI_MOT_01` | Motorized Divisions | motorized | `Motuohua Di-%d Shi` |
| `CHI_MEC_01` | Mechanized Divisions | mechanized | `Jixiehua Di-%d Shi` |
| `CHI_MOT_02` | Motorized Divisions (Named) | motorized | `Motuohua Di-%d Shi` |
| `CHI_MEC_02` | Mechanized Divisions (Named) | mechanized | `Jixiehua Di-%d Shi` |
| `CHI_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `Zhuangjiabing Di-%d Shi` |
| `CHI_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `Zhuangjiabing Di-%d Shi` |
| `CHI_CAV_01` | Cavalry Divisions | cavalry | `Qibing Di-%d Shi` |
| `CHI_PAR_01` | Parachute Regiments | paratrooper | `Sanbing Di-%d Tuan` |
| `CHI_MAR_01` | Marine Brigades | marine | `Haijun Luzhandui Di-%d Lü` |
| `CHI_MNT_01` | Mountain Divisions | mountaineers | `Shandi Di-%d Shi` |
| `CHI_GAR_01` | Garrisons & Fortresses | infantry | `Shoubei Di-%d Zongdui` |
| `CHI_BAO_01` | Peace Preservation Corps | militia | `Baoan Di-%d Tuan` |
| `CHI_KMT_01` | Party Army Divisions | infantry | `Dangjun Di-%d Shi` |
| `CHI_LXS_01` | Blue Shirts Divisions | infantry, militia | `Lixingshe Di-%d Shi` |
| `CHI_HUG_01` | Republican Armies | infantry | `Huguojun Di-%d Shi` |
| `CHI_RGJ_01` | People's Revolutionary Army | infantry | `Renmin Gemingjun Di-%d Shi` |

> **Note:** *Di-* is the ordinal prefix (第, "number"), joined to the numeral with a hyphen as pinyin orthography writes it. *Shi* is a division, *Jun* an army (corps), *Lü* a brigade, *Tuan* a regiment, *Ying* a battalion, *Zongdui* a group. Modifiers stand before the arm: *Xinbian Qibing Di-1 Shi* (New 1st Cavalry Division).

---

## Group Details

### Field army

### `CHI_INF_01` — Infantry Divisions
Overrides vanilla CHI_INF_01 as the plain variant, the group vanilla focuses give their templates. Every vanilla number is written again: 1-215 as *Di-%d Shi*, 301-315 as Provisional divisions (*Zanbian Di-1 Shi*), 402-499 as New divisions (*Xinbian Di-2 Shi* to *Xinbian Di-99 Shi*), where vanilla had its X Force keys 422, 430 and 438.

### `CHI_INF_02` — Infantry Divisions (Named)
Shares numbering with CHI_INF_01. Each division on its own number with the battle it is best known for: the Great Wall of 1933 (*Di-25 Shi (Gubeikou)*, *Di-38 Shi (Xifengkou)*), Shanghai 1937 (*Di-36 Shi (Songhu)*, *Di-88 Shi (Sihang)*), Taierzhuang, Xinkou, Wanjialing, Shanggao, Changsha, Shipai, Changde (*Di-57 Shi 'Huben'*, "Tiger Vanguard") and West Hunan (*Xiangxi*) in 1945, and *Di-200 Shi (Kunlunguan)*. Three Reserve and Provisional divisions follow.

### `CHI_INF_03` — Expeditionary Divisions
X Force and Y Force, 1942-45, with their Burma and Salween battles: *Xinbian Di-38 Shi (Ren'anqiang)*, *Xinbian Di-22 Shi (Mengguan)*, *Di-50 Shi (Mizhina)*, *Di-200 Shi (Tonggu)*, *Rongyu Di-1 Shi (Longling)*, *Di-198 Shi (Tengchong)*. Own numbering; the fallback continues as Expeditionary Army divisions.

### `CHI_JUN_01` — Corps-Level Armies
Plain variant of the armies (*jun*): fallback only, *Di-%d Jun*.

### `CHI_JUN_02` — Corps-Level Armies (Named)
Shares numbering with CHI_JUN_01. The armies' nicknames: the Iron Army (*Di-4 Jun 'Tiejun'*), the Mount Tai Army (*Di-10 Jun 'Taishanjun'*), the Thousand-li Steed (*Di-52 Jun 'Qianliju'*), the Anti-Japanese Iron Army (*Di-74 Jun 'Kangri Tiejun'*) and the First Army Under Heaven (*Xinbian Di-1 Jun 'Tianxia Diyi Jun'*); the rest with a battle, from Gubeikou (17th Army, 1933) to Wuyang (94th Army, 1945).

### Motorized, mechanized and armour

### `CHI_MOT_01` — Motorized Divisions
Overrides vanilla CHI_MOT_01 as the plain variant. Vanilla links it to CHI_INF_01, and every mobile group shares that numbering. Key 500, which vanilla hands out first, is *Motuohua Di-200 Shi*; 402-499 are New divisions.

### `CHI_MEC_01` — Mechanized Divisions
Overrides vanilla CHI_MEC_01 as the plain variant (the group vanilla focuses in the shared China tree give their templates). Key 500 is the Mechanized 200th Division of 1938, *Jixiehua Di-200 Shi*.

### `CHI_MOT_02` — Motorized Divisions (Named)
The German-trained divisions (*dexie shi*) of 1935-37, the 200th and four divisions of the 74th, 94th and 18th Armies, most famous first, with the honours of CHI_INF_02 (*Motuohua Di-36 Shi (Songhu)*).

### `CHI_MEC_02` — Mechanized Divisions (Named)
The same divisions as mechanized: *Jixiehua Di-200 Shi (Kunlunguan)*, *Jixiehua Di-88 Shi (Sihang)*.

### `CHI_ARM_01` — Armored Divisions
Overrides vanilla CHI_ARM_01 as the plain variant. The period arm word was *zhuangjiabing* (Armoured Corps); vanilla's *Zhuangjia Shi* is a 1950s Taiwan form.

### `CHI_ARM_02` — Armored Divisions (Named)
Shares numbering with CHI_ARM_01. Three divisions after the battles of the 1st Tank Battalion (Kunlunguan 1939, Walawbum 1944, Guningtou 1949), then the NRA's armoured units: the Armoured Corps of 1937 (*Zhuangjiabing Tuan*), the armoured and tank regiments (*Zhanche Di-1 Tuan*) and the Armoured Training Group.

### Cavalry

### `CHI_CAV_01` — Cavalry Divisions
Overrides vanilla CHI_CAV_01. Cavalry divisions 1-12, the New and Provisional cavalry divisions, the six cavalry armies (*Qibing Di-2 Jun*) and the Northeast Advance Army (*Dongbei Tingjin Jun*). Designations only.

### Specialist troops

### `CHI_PAR_01` — Parachute Regiments
Overrides vanilla CHI_PAR_01: the NRA never had a parachute division. The 1st Parachute Regiment (*Sanbing Di-1 Tuan 'Hongxiang'*, Kunming 1944), the 2nd and 3rd, the Parachute Group and the Army Assault Group.

### `CHI_MAR_01` — Marine Brigades
Overrides vanilla CHI_MAR_01. The Navy Marine Corps (*Haijun Luzhandui*): its two independent brigades of 1929-45, the mixed brigade of 1923, the supply regiment and the two marine divisions of 1949 (*Luzhan Di-1 Shi*).

### `CHI_MNT_01` — Mountain Divisions
Overrides vanilla CHI_MNT_01, an infantry copy. The NRA had no mountain units: the 24 numbers vanilla hands out first carry the ranges and passes the NRA fought in or trained at (*Shandi Shi 'Zhongtiao Shan'*, *'Xuefeng Shan'*, *'Gaoligong Shan'*, *'Emei Shan'*); the rest are numbered.

### Garrisons and territorial defence

### `CHI_GAR_01` — Garrisons & Fortresses
Overrides vanilla CHI_GAR_01, whose names the vanilla file calls fictional. The capital and Songhu garrisons (*Shoudu Jingbei*, *Songhu Jingbei*), the Yangtze fortresses of 1937-43 (*Jiangyin Yaosai*, *Madang Yaosai*, *Shipai Yaosai*), the Salt Tax Police (*Shuijing Zongtuan*) and the military police regiments (*Xianbing Di-1 Tuan*).

### `CHI_BAO_01` — Peace Preservation Corps
The provincial Peace Preservation regiments raised from local militia after 1932, numbered per province (*Jiangxi Baoan Di-3 Tuan*). Open to every government.

### Ideology suites

### `CHI_KMT_01` — Party Army Divisions (neutrality)
The Kuomintang's own army: the Whampoa Academy training regiments of 1924-25, the Party Army (*Dangjun*) with the Eastern and Northern Expeditions (*Dangjun Di-1 Shi (Mianhu)*), the Guard Army whose divisions became the 87th and 88th, the Training Brigade (*Jiaodao Zongdui*) and the Youth Army of 1944 with the town each division was raised at (*Qingnianjun Di-201 Shi (Bishan)*).

### `CHI_LXS_01` — Blue Shirts Divisions (fascism)
Divisions after the Lixingshe ("Blue Shirts"), the Fuxingshe and the New Life Movement, then the armed units of Dai Li, a Lixingshe director: the Loyal and Patriotic Army (*Zhongyi Jiuguojun Di-1 Zongdui*), the Special Action Army and the action groups behind Japanese lines (*Taihu Xingdong Zongdui*).

### `CHI_HUG_01` — Republican Armies (democratic)
The armies that fought for the Republic and its constitution: the National Protection Army against Yuan Shikai's monarchy (*Huguojun Di-1 Jun (Naxi)*), the Constitutional Protection Army and the Shaanxi *Jingguojun*, and the revolutionaries of 1911 at Wuchang, Hanyang and Nanjing (*Jiangzhe Lianjun*).

### `CHI_RGJ_01` — People's Revolutionary Army (communism)
The Fujian People's Revolutionary Army of 1933-34 (*Renmin Gemingjun Di-1 Jun*), formed from the 19th Route Army of the 1932 Shanghai defence (*Di-19 Lujun Di-78 Shi*), and NRA armies that went over in 1949 (*Di-104 Jun (Beiping)*, *Di-111 Jun (Suiyuan Qiyi)*). The Red Army tradition is in the PRC file.
