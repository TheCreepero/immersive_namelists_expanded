# Japan

**Country Tag:** `JAP` | **Source File:** [`INEX_JAP_names_divisions.txt`](../common/units/names_divisions/INEX_JAP_names_divisions.txt)

---

## Historical Overview

The Imperial Japanese Army numbered its divisions with a plain ordinal (*Dai-1 Shidan*, 1st Division), the branch word coming first for specialist arms (*Sensha Dai-1 Shidan*, 1st Tank Division). From 1937 each division also carried a wartime cover name, the *tsūshōgō* (通称号), and was called by it in the form *<name> Heidan*: *Tama* for the 1st Division, *Isamu* for the 2nd, *Kuma* for the 7th (Asahikawa), *Taku* for the 1st Tank Division. The Army had no motorized, mechanized or mountain divisions, its cavalry topped out at a Cavalry Group (*Kihei Shūdan*), and its airborne arm was the *Teishin Shūdan* (Raiding Group). The Navy fielded its own ground troops as *Tokubetsu Rikusentai* (Special Naval Landing Forces), named by naval district and ordinal.

INEX replaces the vanilla Japanese lists, which lacked macrons, mixed English into the fallbacks and wrongly used *Hohei Shidan* and *Sangaku Shidan*. Names are romaji in Hepburn with macrons, in the nominative and in native word order. Infantry, motorized, mechanized and armored divisions come as **plain and Named pairs** that share numbering: the plain list keeps the vanilla tag with a numbered fallback, the Named list carries the tsūshōgō (keys 1-21 and the later attested numbers match real division numbers). Motorized, mechanized and mountain divisions are extrapolations in the Japanese pattern; so is every formation of the ideology suites.

Ideology suites are gated by government type, never by focus: **Kokutai Divisions** and **Yokusan Corps** (fascism), a **Jieitai-style Defense Force** with divisions, brigades, airborne and volunteer corps (democratic), and **Red Guards** and **People's Army** divisions (communism). The Konoe Guard is open to every government except communism, the Kenpeitai to fascism and neutrality.

Vanilla focuses and scripted effects reference `JAP_INF_01`, `JAP_CAV_01` and `JAP_MIL_01`, which stay as the same tags here. `JAP_MIL_02` (the *Sanson Kōsakutai* of the communist uprising and the *Ashigaru Levy* of the modern ashigaru focus) is left to vanilla.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name | Available To |
|:---|:---|:---|:---|:---|
| `JAP_INF_01` | Infantry Divisions | infantry | `Dai-%d Shidan` | All governments |
| `JAP_INF_02` | Infantry Divisions (Named) | infantry | `Dai-%d Shidan` | All governments |
| `JAP_MOT_01` | Motorized Divisions | motorized | `Jidōsha Dai-%d Shidan` | All governments |
| `JAP_MOT_02` | Motorized Divisions (Named) | motorized | `Jidōsha Dai-%d Shidan` | All governments |
| `JAP_MEC_01` | Mechanized Divisions | mechanized | `Kikaika Dai-%d Shidan` | All governments |
| `JAP_MEC_02` | Mechanized Divisions (Named) | mechanized | `Kikaika Dai-%d Shidan` | All governments |
| `JAP_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `Sensha Dai-%d Shidan` | All governments |
| `JAP_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `Sensha Dai-%d Shidan` | All governments |
| `JAP_CAV_01` | Cavalry Divisions | cavalry | `Kihei Dai-%d Ryodan` | All governments |
| `JAP_PAR_01` | Paratrooper Divisions | paratrooper | `Teishin Dai-%d Dan` | All governments |
| `JAP_PAR_02` | Naval Airborne Groups | paratrooper | `Dai-%d Kaigun Rakkasan Butai` | All governments |
| `JAP_MAR_01` | Marine Divisions | marine | `Dai-%d Tokubetsu Rikusentai` | All governments |
| `JAP_AMP_01` | Amphibious Brigades | marine | `Kaijō Teishin Dai-%d Sentai` | All governments |
| `JAP_MNT_01` | Mountain Divisions | mountaineers | `Sangaku Dai-%d Shidan` | All governments |
| `JAP_GAR_01` | Garrison Units | infantry | `Dai-%d Shubitai` | All governments |
| `JAP_GAR_02` | Naval Garrison Units | infantry | `Dai-%d Konkyochitai` | All governments |
| `JAP_FOR_01` | Fortress Garrisons | infantry | `Dai-%d Yōsai Hohei Rentai` | All governments |
| `JAP_IMB_01` | Independent Mixed Brigades | infantry | `Dokuritsu Konsei Dai-%d Ryodan` | All governments |
| `JAP_BDR_01` | Border Garrison Units | infantry | `Dai-%d Kokkyō Shubitai` | All governments |
| `JAP_GUA_01` | Imperial Guards | infantry, motorized | `Konoe Dai-%d Shidan` | Any government except communism |
| `JAP_KEN_01` | Kempeitai Units | infantry | `Dai-%d Kenpeitai` | Fascism or neutrality |
| `JAP_MIL_01` | Militia Units | infantry | `Dai-%d Kokumin Giyū Sentōtai` | All governments |
| `JAP_RGR_01` | Ranger Units | ranger_battalion | `Dai-%d Yūgekitai` | All governments |
| `JAP_BIC_01` | Bicycle Units | infantry | `Dai-%d Ginrin Daitai` | All governments |
| `JAP_FAS_01` | Kokutai Divisions | infantry, motorized, mechanized | `Dai-%d Kokutai Shidan` | Fascism only |
| `JAP_FAS_02` | Yokusan Corps | infantry | `Dai-%d Hōkokutai` | Fascism only |
| `JAP_DEM_01` | Defense Force Divisions | infantry, motorized, mechanized | `Dai-%d Shidan` | Democratic only |
| `JAP_DEM_02` | Defense Force Brigades | infantry, mountaineers | `Dai-%d Ryodan` | Democratic only |
| `JAP_DEM_03` | Defense Force Airborne | paratrooper | `Dai-%d Kūtei Dan` | Democratic only |
| `JAP_DEM_04` | Volunteer Defense Corps | infantry | `Dai-%d Jieidan` | Democratic only |
| `JAP_RED_01` | Red Guards | infantry | `Dai-%d Sekieitai` | Communism only |
| `JAP_COM_01` | People's Army Divisions | infantry, motorized, mechanized | `Dai-%d Jinmin Kaihō Shidan` | Communism only |

---

## Group Details

### `JAP_INF_01` — Infantry Divisions
Fallback-only (plain) list: every division is numbered `Dai-%d Shidan`.

### `JAP_INF_02` — Infantry Divisions (Named)
41 entries:

| # | Name |
|:--|:---|
| 1 | *Dai-%d Shidan 'Tama'* |
| 2 | *Dai-%d Shidan 'Isamu'* |
| 3 | *Dai-%d Shidan 'Kō'* |
| 4 | *Dai-%d Shidan 'Yodo'* |
| 5 | *Dai-%d Shidan 'Koi'* |
| 6 | *Dai-%d Shidan 'Mei'* |
| 7 | *Dai-%d Shidan 'Kuma'* |
| 8 | *Dai-%d Shidan 'Sugi'* |
| 9 | *Dai-%d Shidan 'Take'* |
| 10 | *Dai-%d Shidan 'Tetsu'* |
| 11 | *Dai-%d Shidan 'Nishiki'* |
| 12 | *Dai-%d Shidan 'Ken'* |
| 13 | *Dai-%d Shidan 'Kagami'* |
| 14 | *Dai-%d Shidan 'Teru'* |
| 15 | *Dai-%d Shidan 'Matsuri'* |
| 16 | *Dai-%d Shidan 'Kaki'* |
| 17 | *Dai-%d Shidan 'Tsuki'* |
| 18 | *Dai-%d Shidan 'Kiku'* |
| 19 | *Dai-%d Shidan 'Tora'* |
| 20 | *Dai-%d Shidan 'Asa'* |
| 21 | *Dai-%d Shidan 'Tō'* |
| 23 | *Dai-%d Shidan 'Asahi'* |
| 24 | *Dai-%d Shidan 'Yama'* |
| 33 | *Dai-%d Shidan 'Yumi'* |
| 43 | *Dai-%d Shidan 'Homare'* |
| 46 | *Dai-%d Shidan 'Sei'* |
| 58 | *Dai-%d Shidan 'Hiro'* |
| 62 | *Dai-%d Shidan 'Ishi'* |
| 65 | *Dai-%d Shidan 'Sen'* |
| 68 | *Dai-%d Shidan 'Hinoki'* |
| 70 | *Dai-%d Shidan 'Yari'* |
| 91 | *Dai-%d Shidan 'Saki'* |
| 93 | *Dai-%d Shidan 'Ketsu'* |
| 100 | *Dai-%d Shidan 'Kyo'* |
| 103 | *Dai-%d Shidan 'Shun'* |
| 109 | *Dai-%d Shidan 'Tan'* |
| 115 | *Dai-%d Shidan 'Kita'* |
| 135 | *Dai-%d Shidan 'Magokoro'* |
| 138 | *Dai-%d Shidan 'Fudō'* |
| 142 | *Dai-%d Shidan 'Gosen'* |
| 209 | *Dai-%d Shidan 'Kaetsu'* |

### `JAP_MOT_01` — Motorized Divisions
Fallback-only (plain) list: every division is numbered `Jidōsha Dai-%d Shidan`.

### `JAP_MOT_02` — Motorized Divisions (Named)
41 entries:

| # | Name |
|:--|:---|
| 1 | *Jidōsha Dai-%d Shidan 'Tama'* |
| 2 | *Jidōsha Dai-%d Shidan 'Isamu'* |
| 3 | *Jidōsha Dai-%d Shidan 'Kō'* |
| 4 | *Jidōsha Dai-%d Shidan 'Yodo'* |
| 5 | *Jidōsha Dai-%d Shidan 'Koi'* |
| 6 | *Jidōsha Dai-%d Shidan 'Mei'* |
| 7 | *Jidōsha Dai-%d Shidan 'Kuma'* |
| 8 | *Jidōsha Dai-%d Shidan 'Sugi'* |
| 9 | *Jidōsha Dai-%d Shidan 'Take'* |
| 10 | *Jidōsha Dai-%d Shidan 'Tetsu'* |
| 11 | *Jidōsha Dai-%d Shidan 'Nishiki'* |
| 12 | *Jidōsha Dai-%d Shidan 'Ken'* |
| 13 | *Jidōsha Dai-%d Shidan 'Kagami'* |
| 14 | *Jidōsha Dai-%d Shidan 'Teru'* |
| 15 | *Jidōsha Dai-%d Shidan 'Matsuri'* |
| 16 | *Jidōsha Dai-%d Shidan 'Kaki'* |
| 17 | *Jidōsha Dai-%d Shidan 'Tsuki'* |
| 18 | *Jidōsha Dai-%d Shidan 'Kiku'* |
| 19 | *Jidōsha Dai-%d Shidan 'Tora'* |
| 20 | *Jidōsha Dai-%d Shidan 'Asa'* |
| 21 | *Jidōsha Dai-%d Shidan 'Tō'* |
| 23 | *Jidōsha Dai-%d Shidan 'Asahi'* |
| 24 | *Jidōsha Dai-%d Shidan 'Yama'* |
| 33 | *Jidōsha Dai-%d Shidan 'Yumi'* |
| 43 | *Jidōsha Dai-%d Shidan 'Homare'* |
| 46 | *Jidōsha Dai-%d Shidan 'Sei'* |
| 58 | *Jidōsha Dai-%d Shidan 'Hiro'* |
| 62 | *Jidōsha Dai-%d Shidan 'Ishi'* |
| 65 | *Jidōsha Dai-%d Shidan 'Sen'* |
| 68 | *Jidōsha Dai-%d Shidan 'Hinoki'* |
| 70 | *Jidōsha Dai-%d Shidan 'Yari'* |
| 91 | *Jidōsha Dai-%d Shidan 'Saki'* |
| 93 | *Jidōsha Dai-%d Shidan 'Ketsu'* |
| 100 | *Jidōsha Dai-%d Shidan 'Kyo'* |
| 103 | *Jidōsha Dai-%d Shidan 'Shun'* |
| 109 | *Jidōsha Dai-%d Shidan 'Tan'* |
| 115 | *Jidōsha Dai-%d Shidan 'Kita'* |
| 135 | *Jidōsha Dai-%d Shidan 'Magokoro'* |
| 138 | *Jidōsha Dai-%d Shidan 'Fudō'* |
| 142 | *Jidōsha Dai-%d Shidan 'Gosen'* |
| 209 | *Jidōsha Dai-%d Shidan 'Kaetsu'* |

### `JAP_MEC_01` — Mechanized Divisions
Fallback-only (plain) list: every division is numbered `Kikaika Dai-%d Shidan`.

### `JAP_MEC_02` — Mechanized Divisions (Named)
41 entries:

| # | Name |
|:--|:---|
| 1 | *Kikaika Dai-%d Shidan 'Tama'* |
| 2 | *Kikaika Dai-%d Shidan 'Isamu'* |
| 3 | *Kikaika Dai-%d Shidan 'Kō'* |
| 4 | *Kikaika Dai-%d Shidan 'Yodo'* |
| 5 | *Kikaika Dai-%d Shidan 'Koi'* |
| 6 | *Kikaika Dai-%d Shidan 'Mei'* |
| 7 | *Kikaika Dai-%d Shidan 'Kuma'* |
| 8 | *Kikaika Dai-%d Shidan 'Sugi'* |
| 9 | *Kikaika Dai-%d Shidan 'Take'* |
| 10 | *Kikaika Dai-%d Shidan 'Tetsu'* |
| 11 | *Kikaika Dai-%d Shidan 'Nishiki'* |
| 12 | *Kikaika Dai-%d Shidan 'Ken'* |
| 13 | *Kikaika Dai-%d Shidan 'Kagami'* |
| 14 | *Kikaika Dai-%d Shidan 'Teru'* |
| 15 | *Kikaika Dai-%d Shidan 'Matsuri'* |
| 16 | *Kikaika Dai-%d Shidan 'Kaki'* |
| 17 | *Kikaika Dai-%d Shidan 'Tsuki'* |
| 18 | *Kikaika Dai-%d Shidan 'Kiku'* |
| 19 | *Kikaika Dai-%d Shidan 'Tora'* |
| 20 | *Kikaika Dai-%d Shidan 'Asa'* |
| 21 | *Kikaika Dai-%d Shidan 'Tō'* |
| 23 | *Kikaika Dai-%d Shidan 'Asahi'* |
| 24 | *Kikaika Dai-%d Shidan 'Yama'* |
| 33 | *Kikaika Dai-%d Shidan 'Yumi'* |
| 43 | *Kikaika Dai-%d Shidan 'Homare'* |
| 46 | *Kikaika Dai-%d Shidan 'Sei'* |
| 58 | *Kikaika Dai-%d Shidan 'Hiro'* |
| 62 | *Kikaika Dai-%d Shidan 'Ishi'* |
| 65 | *Kikaika Dai-%d Shidan 'Sen'* |
| 68 | *Kikaika Dai-%d Shidan 'Hinoki'* |
| 70 | *Kikaika Dai-%d Shidan 'Yari'* |
| 91 | *Kikaika Dai-%d Shidan 'Saki'* |
| 93 | *Kikaika Dai-%d Shidan 'Ketsu'* |
| 100 | *Kikaika Dai-%d Shidan 'Kyo'* |
| 103 | *Kikaika Dai-%d Shidan 'Shun'* |
| 109 | *Kikaika Dai-%d Shidan 'Tan'* |
| 115 | *Kikaika Dai-%d Shidan 'Kita'* |
| 135 | *Kikaika Dai-%d Shidan 'Magokoro'* |
| 138 | *Kikaika Dai-%d Shidan 'Fudō'* |
| 142 | *Kikaika Dai-%d Shidan 'Gosen'* |
| 209 | *Kikaika Dai-%d Shidan 'Kaetsu'* |

### `JAP_ARM_01` — Armored Divisions
Fallback-only (plain) list: every division is numbered `Sensha Dai-%d Shidan`.

### `JAP_ARM_02` — Armored Divisions (Named)
10 entries:

| # | Name |
|:--|:---|
| 1 | *Sensha Dai-%d Shidan 'Taku'* |
| 2 | *Sensha Dai-%d Shidan 'Geki'* |
| 3 | *Sensha Dai-%d Shidan 'Taki'* |
| 4 | *Sensha Dai-%d Shidan 'Hagane'* |
| 5 | *Sensha Dai-%d Shidan 'Ikazuchi'* |
| 6 | *Sensha Dai-%d Shidan 'Arashi'* |
| 7 | *Sensha Dai-%d Shidan 'Hayate'* |
| 8 | *Sensha Dai-%d Shidan 'Kaminari'* |
| 9 | *Sensha Dai-%d Shidan 'Tsurugi'* |
| 10 | *Sensha Dai-%d Shidan 'Kongō'* |

### `JAP_CAV_01` — Cavalry Divisions
27 entries:

| # | Name |
|:--|:---|
| 1 | *Kihei Shūdan* |
| 2 | *Kihei Dai-1 Ryodan* |
| 3 | *Kihei Dai-4 Ryodan* |
| 4 | *Kihei Dai-3 Ryodan* |
| 5 | *Kihei Dai-2 Ryodan* |
| 6 | *Konoe Kihei Rentai* |
| 7 | *Kantōgun Kihei Ryodan* |
| 8 | *Tama Kihei Rentai* |
| 9 | *Isamu Kihei Rentai* |
| 10 | *Kō Kihei Rentai* |
| 11 | *Yodo Kihei Rentai* |
| 12 | *Koi Kihei Rentai* |
| 13 | *Mei Kihei Rentai* |
| 14 | *Kuma Kihei Rentai* |
| 15 | *Sugi Kihei Rentai* |
| 16 | *Take Kihei Rentai* |
| 17 | *Tetsu Kihei Rentai* |
| 18 | *Nishiki Kihei Rentai* |
| 19 | *Ken Kihei Rentai* |
| 20 | *Kagami Kihei Rentai* |
| 21 | *Teru Kihei Rentai* |
| 22 | *Matsuri Kihei Rentai* |
| 23 | *Kaki Kihei Rentai* |
| 24 | *Tsuki Kihei Rentai* |
| 25 | *Kiku Kihei Rentai* |
| 26 | *Tora Kihei Rentai* |
| 27 | *Asa Kihei Rentai* |

### `JAP_PAR_01` — Paratrooper Divisions
8 entries:

| # | Name |
|:--|:---|
| 1 | *Teishin Shūdan* |
| 2 | *Teishin Ryodan* |
| 3 | *Teishin Rentai* |
| 4 | *Teishin Renshū Butai* |
| 5 | *Giretsu Kūteitai* |
| 6 | *Kaoru Kūteitai* |
| 7 | *Ran Heidan* |
| 8 | *Teishin Kūtei Dan* |

### `JAP_PAR_02` — Naval Airborne Groups
13 entries:

| # | Name |
|:--|:---|
| 1 | *Kaigun Rakkasan Butai* |
| 2 | *Yokosuka Kaigun Rakkasan Butai* |
| 3 | *Sasebo Kaigun Rakkasan Butai* |
| 4 | *Yokosuka Kōkūtai Rakkasan Butai* |
| 5 | *Kisarazu Kōkūtai Rakkasan Butai* |
| 6 | *Tsukuba Kōkūtai Rakkasan Butai* |
| 7 | *Kasumigaura Kōkūtai Rakkasan Butai* |
| 8 | *Kanoya Kōkūtai Rakkasan Butai* |
| 9 | *Genzan Kōkūtai Rakkasan Butai* |
| 10 | *Tainan Kōkūtai Rakkasan Butai* |
| 11 | *Takao Kōkūtai Rakkasan Butai* |
| 12 | *Chitose Kōkūtai Rakkasan Butai* |
| 13 | *Suzuka Kōkūtai Rakkasan Butai* |

### `JAP_MAR_01` — Marine Divisions
27 entries:

| # | Name |
|:--|:---|
| 1 | *Yokosuka Dai-1 Tokubetsu Rikusentai* |
| 2 | *Yokosuka Dai-2 Tokubetsu Rikusentai* |
| 3 | *Yokosuka Dai-3 Tokubetsu Rikusentai* |
| 4 | *Yokosuka Dai-4 Tokubetsu Rikusentai* |
| 5 | *Yokosuka Dai-5 Tokubetsu Rikusentai* |
| 6 | *Yokosuka Dai-6 Tokubetsu Rikusentai* |
| 7 | *Yokosuka Dai-7 Tokubetsu Rikusentai* |
| 8 | *Kure Dai-1 Tokubetsu Rikusentai* |
| 9 | *Kure Dai-2 Tokubetsu Rikusentai* |
| 10 | *Kure Dai-3 Tokubetsu Rikusentai* |
| 11 | *Kure Dai-5 Tokubetsu Rikusentai* |
| 12 | *Kure Dai-6 Tokubetsu Rikusentai* |
| 13 | *Kure Dai-7 Tokubetsu Rikusentai* |
| 14 | *Maizuru Dai-1 Tokubetsu Rikusentai* |
| 15 | *Maizuru Dai-2 Tokubetsu Rikusentai* |
| 16 | *Maizuru Dai-4 Tokubetsu Rikusentai* |
| 17 | *Maizuru Dai-5 Tokubetsu Rikusentai* |
| 18 | *Sasebo Dai-1 Tokubetsu Rikusentai* |
| 19 | *Sasebo Dai-2 Tokubetsu Rikusentai* |
| 20 | *Sasebo Dai-5 Tokubetsu Rikusentai* |
| 21 | *Sasebo Dai-6 Tokubetsu Rikusentai* |
| 22 | *Sasebo Dai-7 Tokubetsu Rikusentai* |
| 23 | *Sasebo Dai-8 Tokubetsu Rikusentai* |
| 24 | *Sasebo Rengō Tokubetsu Rikusentai* |
| 25 | *Shanhai Kaigun Tokubetsu Rikusentai* |
| 26 | *Kankō Tokubetsu Rikusentai* |
| 27 | *Kaigun Rikusentai* |

### `JAP_AMP_01` — Amphibious Brigades
10 entries:

| # | Name |
|:--|:---|
| 1 | *Akatsuki Butai* |
| 2 | *Senpaku Shireibu* |
| 3 | *Senpaku Kōhei Rentai* |
| 4 | *Kaijō Kihon Daitai* |
| 5 | *Kaijō Teishin Sentai* |
| 6 | *Akitsu Maru Butai* |
| 7 | *Shinshū Maru Butai* |
| 8 | *Nigitsu Maru Butai* |
| 9 | *Mayasan Maru Butai* |
| 10 | *Kumano Maru Butai* |

### `JAP_MNT_01` — Mountain Divisions
24 entries:

| # | Name |
|:--|:---|
| 1 | *Sangaku Dai-%d Shidan 'Daisetsu'* |
| 2 | *Sangaku Dai-%d Shidan 'Hakusan'* |
| 3 | *Sangaku Dai-%d Shidan 'Fuji'* |
| 4 | *Sangaku Dai-%d Shidan 'Tsurugi'* |
| 5 | *Sangaku Dai-%d Shidan 'Ontake'* |
| 6 | *Sangaku Dai-%d Shidan 'Yarigatake'* |
| 7 | *Sangaku Dai-%d Shidan 'Hotaka'* |
| 8 | *Sangaku Dai-%d Shidan 'Yatsugatake'* |
| 9 | *Sangaku Dai-%d Shidan 'Asama'* |
| 10 | *Sangaku Dai-%d Shidan 'Iwate'* |
| 11 | *Sangaku Dai-%d Shidan 'Zaō'* |
| 12 | *Sangaku Dai-%d Shidan 'Chōkai'* |
| 13 | *Sangaku Dai-%d Shidan 'Gassan'* |
| 14 | *Sangaku Dai-%d Shidan 'Ibuki'* |
| 15 | *Sangaku Dai-%d Shidan 'Akagi'* |
| 16 | *Sangaku Dai-%d Shidan 'Tanigawa'* |
| 17 | *Sangaku Dai-%d Shidan 'Kirishima'* |
| 18 | *Sangaku Dai-%d Shidan 'Aso'* |
| 19 | *Sangaku Dai-%d Shidan 'Asahikawa'* |
| 20 | *Sangaku Dai-%d Shidan 'Hirosaki'* |
| 21 | *Sangaku Dai-%d Shidan 'Sendai'* |
| 22 | *Sangaku Dai-%d Shidan 'Kanazawa'* |
| 23 | *Sangaku Dai-%d Shidan 'Takada'* |
| 24 | *Sangaku Dai-%d Shidan 'Matsumoto'* |

### `JAP_GAR_01` — Garrison Units
21 entries:

| # | Name |
|:--|:---|
| 1 | *Hokkaidō Shubitai* |
| 2 | *Karafuto Shubitai* |
| 3 | *Hokuchishima Shubitai* |
| 4 | *Ogasawara Shubitai* |
| 5 | *Okinawa Shubitai* |
| 6 | *Miyako Shubitai* |
| 7 | *Taiwan Shubitai* |
| 8 | *Chōsen Shubitai* |
| 9 | *Tsushima Shubitai* |
| 10 | *Tōkyō Shubitai* |
| 11 | *Kantō Shubitai* |
| 12 | *Tōhoku Shubitai* |
| 13 | *Tōkai Shubitai* |
| 14 | *Chūbu Shubitai* |
| 15 | *Kinki Shubitai* |
| 16 | *Chūgoku Shubitai* |
| 17 | *Shikoku Shubitai* |
| 18 | *Seibu Shubitai* |
| 19 | *Kyūshū Shubitai* |
| 20 | *Kantōgun Shubitai* |
| 21 | *Shina Hakengun Shubitai* |

### `JAP_GAR_02` — Naval Garrison Units
9 entries:

| # | Name |
|:--|:---|
| 1 | *Yokosuka Keibitai* |
| 2 | *Kure Keibitai* |
| 3 | *Sasebo Keibitai* |
| 4 | *Maizuru Keibitai* |
| 5 | *Ōminato Keibufu* |
| 6 | *Chinkai Keibufu* |
| 7 | *Ryojun Keibufu* |
| 8 | *Mako Keibufu* |
| 9 | *Kaigun Keibitai* |

### `JAP_FOR_01` — Fortress Garrisons
12 entries:

| # | Name |
|:--|:---|
| 1 | *Tōkyō-wan Yōsai Shubitai* |
| 2 | *Tsushima Yōsai Shubitai* |
| 3 | *Kanmon Yōsai Shubitai* |
| 4 | *Tsugaru Yōsai Shubitai* |
| 5 | *Hōyo Yōsai Shubitai* |
| 6 | *Kii Yōsai Shubitai* |
| 7 | *Hakodate Yōsai Shubitai* |
| 8 | *Maizuru Yōsai Shubitai* |
| 9 | *Chinkai Yōsai Shubitai* |
| 10 | *Ryojun Yōsai Shubitai* |
| 11 | *Takao Yōsai Shubitai* |
| 12 | *Mako Yōsai Shubitai* |

### `JAP_IMB_01` — Independent Mixed Brigades
Fallback-only (plain) list: every division is numbered `Dokuritsu Konsei Dai-%d Ryodan`.

### `JAP_BDR_01` — Border Garrison Units
10 entries:

| # | Name |
|:--|:---|
| 1 | *Kotō Kokkyō Shubitai* |
| 2 | *Tōnei Kokkyō Shubitai* |
| 3 | *Suifunka Kokkyō Shubitai* |
| 4 | *Konshun Kokkyō Shubitai* |
| 5 | *Manshūri Kokkyō Shubitai* |
| 6 | *Kokka Kokkyō Shubitai* |
| 7 | *Sonugo Kokkyō Shubitai* |
| 8 | *Aikun Kokkyō Shubitai* |
| 9 | *Hairaru Kokkyō Shubitai* |
| 10 | *Arushan Kokkyō Shubitai* |

### `JAP_GUA_01` — Imperial Guards
8 entries:

| # | Name |
|:--|:---|
| 1 | *Konoe Shidan* |
| 2 | *Miya Heidan* |
| 3 | *Konoe Hohei Rentai* |
| 4 | *Konoe Kihei Rentai* |
| 5 | *Konoe Yasen Hōhei Rentai* |
| 6 | *Konoe Kōhei Daitai* |
| 7 | *Konoe Dai-1 Hohei Ryodan* |
| 8 | *Kōkyo Keibitai* |

### `JAP_KEN_01` — Kempeitai Units
14 entries:

| # | Name |
|:--|:---|
| 1 | *Tōkyō Kenpeitai* |
| 2 | *Kantō Kenpeitai* |
| 3 | *Ōsaka Kenpeitai* |
| 4 | *Nagoya Kenpeitai* |
| 5 | *Hiroshima Kenpeitai* |
| 6 | *Kumamoto Kenpeitai* |
| 7 | *Sendai Kenpeitai* |
| 8 | *Keijō Kenpeitai* |
| 9 | *Hōten Kenpeitai* |
| 10 | *Taiwan Kenpeitai* |
| 11 | *Shanhai Kenpeitai* |
| 12 | *Nankin Kenpeitai* |
| 13 | *Kantōgun Kenpeitai* |
| 14 | *Shina Hakengun Kenpeitai* |

### `JAP_MIL_01` — Militia Units
47 entries:

| # | Name |
|:--|:---|
| 1 | *Hokkaidō Kokumin Giyū Sentōtai* |
| 2 | *Aomori Kokumin Giyū Sentōtai* |
| 3 | *Iwate Kokumin Giyū Sentōtai* |
| 4 | *Miyagi Kokumin Giyū Sentōtai* |
| 5 | *Akita Kokumin Giyū Sentōtai* |
| 6 | *Yamagata Kokumin Giyū Sentōtai* |
| 7 | *Fukushima Kokumin Giyū Sentōtai* |
| 8 | *Ibaraki Kokumin Giyū Sentōtai* |
| 9 | *Tochigi Kokumin Giyū Sentōtai* |
| 10 | *Gunma Kokumin Giyū Sentōtai* |
| 11 | *Saitama Kokumin Giyū Sentōtai* |
| 12 | *Chiba Kokumin Giyū Sentōtai* |
| 13 | *Tōkyō Kokumin Giyū Sentōtai* |
| 14 | *Kanagawa Kokumin Giyū Sentōtai* |
| 15 | *Niigata Kokumin Giyū Sentōtai* |
| 16 | *Toyama Kokumin Giyū Sentōtai* |
| 17 | *Ishikawa Kokumin Giyū Sentōtai* |
| 18 | *Fukui Kokumin Giyū Sentōtai* |
| 19 | *Yamanashi Kokumin Giyū Sentōtai* |
| 20 | *Nagano Kokumin Giyū Sentōtai* |
| 21 | *Gifu Kokumin Giyū Sentōtai* |
| 22 | *Shizuoka Kokumin Giyū Sentōtai* |
| 23 | *Aichi Kokumin Giyū Sentōtai* |
| 24 | *Mie Kokumin Giyū Sentōtai* |
| 25 | *Shiga Kokumin Giyū Sentōtai* |
| 26 | *Kyōto Kokumin Giyū Sentōtai* |
| 27 | *Ōsaka Kokumin Giyū Sentōtai* |
| 28 | *Hyōgo Kokumin Giyū Sentōtai* |
| 29 | *Nara Kokumin Giyū Sentōtai* |
| 30 | *Wakayama Kokumin Giyū Sentōtai* |
| 31 | *Tottori Kokumin Giyū Sentōtai* |
| 32 | *Shimane Kokumin Giyū Sentōtai* |
| 33 | *Okayama Kokumin Giyū Sentōtai* |
| 34 | *Hiroshima Kokumin Giyū Sentōtai* |
| 35 | *Yamaguchi Kokumin Giyū Sentōtai* |
| 36 | *Tokushima Kokumin Giyū Sentōtai* |
| 37 | *Kagawa Kokumin Giyū Sentōtai* |
| 38 | *Ehime Kokumin Giyū Sentōtai* |
| 39 | *Kōchi Kokumin Giyū Sentōtai* |
| 40 | *Fukuoka Kokumin Giyū Sentōtai* |
| 41 | *Saga Kokumin Giyū Sentōtai* |
| 42 | *Nagasaki Kokumin Giyū Sentōtai* |
| 43 | *Kumamoto Kokumin Giyū Sentōtai* |
| 44 | *Ōita Kokumin Giyū Sentōtai* |
| 45 | *Miyazaki Kokumin Giyū Sentōtai* |
| 46 | *Kagoshima Kokumin Giyū Sentōtai* |
| 47 | *Okinawa Kokumin Giyū Sentōtai* |

### `JAP_RGR_01` — Ranger Units
14 entries:

| # | Name |
|:--|:---|
| 1 | *Dai-1 Gokyōtai* |
| 2 | *Dai-2 Gokyōtai* |
| 3 | *Hokkaidō Yūgekitai* |
| 4 | *Tōhoku Yūgekitai* |
| 5 | *Kantō Yūgekitai* |
| 6 | *Chūbu Yūgekitai* |
| 7 | *Kinki Yūgekitai* |
| 8 | *Chūgoku Yūgekitai* |
| 9 | *Shikoku Yūgekitai* |
| 10 | *Kyūshū Yūgekitai* |
| 11 | *Okinawa Yūgekitai* |
| 12 | *Karafuto Yūgekitai* |
| 13 | *Chishima Yūgekitai* |
| 14 | *Kantōgun Yūgekitai* |

### `JAP_BIC_01` — Bicycle Units
15 entries:

| # | Name |
|:--|:---|
| 1 | *Konoe Ginrin Butai* |
| 2 | *Koi Ginrin Butai* |
| 3 | *Kiku Ginrin Butai* |
| 4 | *Tama Ginrin Butai* |
| 5 | *Isamu Ginrin Butai* |
| 6 | *Kō Ginrin Butai* |
| 7 | *Yodo Ginrin Butai* |
| 8 | *Mei Ginrin Butai* |
| 9 | *Kuma Ginrin Butai* |
| 10 | *Sugi Ginrin Butai* |
| 11 | *Take Ginrin Butai* |
| 12 | *Tetsu Ginrin Butai* |
| 13 | *Nishiki Ginrin Butai* |
| 14 | *Ken Ginrin Butai* |
| 15 | *Kagami Ginrin Butai* |

### `JAP_FAS_01` — Kokutai Divisions
20 entries:

| # | Name |
|:--|:---|
| 1 | *Dai-%d Shidan 'Kōdō'* |
| 2 | *Dai-%d Shidan 'Kokutai'* |
| 3 | *Dai-%d Shidan 'Shōwa Ishin'* |
| 4 | *Dai-%d Shidan 'Yamato'* |
| 5 | *Dai-%d Shidan 'Shinpū'* |
| 6 | *Dai-%d Shidan 'Hakkō Ichiu'* |
| 7 | *Dai-%d Shidan 'Kinnō'* |
| 8 | *Dai-%d Shidan 'Kenkoku'* |
| 9 | *Dai-%d Shidan 'Yasukuni'* |
| 10 | *Dai-%d Shidan 'Kōkoku'* |
| 11 | *Dai-%d Shidan 'Chūgi'* |
| 12 | *Dai-%d Shidan 'Amatsu'* |
| 13 | *Dai-%d Shidan 'Sakura'* |
| 14 | *Dai-%d Shidan 'Meiji'* |
| 15 | *Dai-%d Shidan 'Seiki'* |
| 16 | *Dai-%d Shidan 'Kokuhon'* |
| 17 | *Dai-%d Shidan 'Kokuryū'* |
| 18 | *Dai-%d Shidan 'Tōhō'* |
| 19 | *Dai-%d Shidan 'Taiwa'* |
| 20 | *Dai-%d Shidan 'Shinkoku'* |

### `JAP_FAS_02` — Yokusan Corps
12 entries:

| # | Name |
|:--|:---|
| 1 | *Taisei Yokusankai Hōkokutai* |
| 2 | *Dai Nippon Seinendan Hōkokutai* |
| 3 | *Zaigō Gunjinkai Hōkokutai* |
| 4 | *Dai Nippon Sangyō Hōkokukai Hōkokutai* |
| 5 | *Kokuhonsha Hōkokutai* |
| 6 | *Kokuryūkai Hōkokutai* |
| 7 | *Tōhōkai Hōkokutai* |
| 8 | *Kinnō-tō Hōkokutai* |
| 9 | *Sakurakai Hōkokutai* |
| 10 | *Yūzonsha Hōkokutai* |
| 11 | *Shinpūren Hōkokutai* |
| 12 | *Dai Nippon Seisantō Hōkokutai* |

### `JAP_DEM_01` — Defense Force Divisions
18 entries:

| # | Name |
|:--|:---|
| 1 | *Dai-%d Shidan 'Tōkyō'* |
| 2 | *Dai-%d Shidan 'Asahikawa'* |
| 3 | *Dai-%d Shidan 'Kansai'* |
| 4 | *Dai-%d Shidan 'Kyūshū'* |
| 6 | *Dai-%d Shidan 'Yamagata'* |
| 7 | *Dai-%d Shidan 'Hokkaidō'* |
| 8 | *Dai-%d Shidan 'Kumamoto'* |
| 9 | *Dai-%d Shidan 'Aomori'* |
| 10 | *Dai-%d Shidan 'Nagoya'* |
| 12 | *Dai-%d Shidan 'Gunma'* |
| 13 | *Dai-%d Shidan 'Shikoku'* |
| 14 | *Dai-%d Shidan 'Tōhoku'* |
| 15 | *Dai-%d Shidan 'Hokuriku'* |
| 16 | *Dai-%d Shidan 'Tōkai'* |
| 17 | *Dai-%d Shidan 'Kinki'* |
| 18 | *Dai-%d Shidan 'Chūgoku'* |
| 19 | *Dai-%d Shidan 'Okinawa'* |
| 20 | *Dai-%d Shidan 'Kantō'* |

### `JAP_DEM_02` — Defense Force Brigades
12 entries:

| # | Name |
|:--|:---|
| 1 | *Dai-%d Ryodan 'Tokachi'* |
| 2 | *Dai-%d Ryodan 'Makomanai'* |
| 3 | *Dai-%d Ryodan 'Kaita'* |
| 4 | *Dai-%d Ryodan 'Zentsūji'* |
| 5 | *Dai-%d Ryodan 'Naha'* |
| 6 | *Dai-%d Ryodan 'Hokkaidō'* |
| 7 | *Dai-%d Ryodan 'Tōhoku'* |
| 8 | *Dai-%d Ryodan 'Kantō'* |
| 9 | *Dai-%d Ryodan 'Chūbu'* |
| 10 | *Dai-%d Ryodan 'Kinki'* |
| 11 | *Dai-%d Ryodan 'Seibu'* |
| 12 | *Dai-%d Ryodan 'Okinawa'* |

### `JAP_DEM_03` — Defense Force Airborne
6 entries:

| # | Name |
|:--|:---|
| 1 | *Dai-1 Kūtei Dan* |
| 2 | *Dai-12 Herikoputā Dan* |
| 3 | *Suiriku Kidō Dan* |
| 4 | *Chūō Sokuō Shūdan* |
| 5 | *Dai-2 Kūtei Dan* |
| 6 | *Dai-3 Kūtei Dan* |

### `JAP_DEM_04` — Volunteer Defense Corps
12 entries:

| # | Name |
|:--|:---|
| 1 | *Hokkaidō Jieidan* |
| 2 | *Tōhoku Jieidan* |
| 3 | *Kantō Jieidan* |
| 4 | *Chūbu Jieidan* |
| 5 | *Kinki Jieidan* |
| 6 | *Chūgoku Jieidan* |
| 7 | *Shikoku Jieidan* |
| 8 | *Kyūshū Jieidan* |
| 9 | *Okinawa Jieidan* |
| 10 | *Tōkyō Jieidan* |
| 11 | *Ōsaka Jieidan* |
| 12 | *Aichi Jieidan* |

### `JAP_RED_01` — Red Guards
16 entries:

| # | Name |
|:--|:---|
| 1 | *Chūkaku Jieitai* |
| 2 | *Dokuritsu Yūgekitai* |
| 3 | *Sanson Kōsakutai* |
| 4 | *Rōdōsha Sekieitai* |
| 5 | *Nōmin Sekieitai* |
| 6 | *Zengakuren Sekieitai* |
| 7 | *Sōhyō Sekieitai* |
| 8 | *Zenkoku Rōdōkumiai Sekieitai* |
| 9 | *Sanya Rōdōsha Sekieitai* |
| 10 | *Ōsaka Rōdōsha Sekieitai* |
| 11 | *Kōza-ha Sekieitai* |
| 12 | *Hokkaidō Sekieitai* |
| 13 | *Tōhoku Sekieitai* |
| 14 | *Kantō Sekieitai* |
| 15 | *Kansai Sekieitai* |
| 16 | *Kyūshū Sekieitai* |

### `JAP_COM_01` — People's Army Divisions
14 entries:

| # | Name |
|:--|:---|
| 1 | *Dai-%d Shidan 'Akahata'* |
| 2 | *Dai-%d Shidan 'Kaihō'* |
| 3 | *Dai-%d Shidan 'Jinmin'* |
| 4 | *Dai-%d Shidan 'Rōdō'* |
| 5 | *Dai-%d Shidan 'Nōmin'* |
| 6 | *Dai-%d Shidan 'Kyōsan'* |
| 7 | *Dai-%d Shidan 'Kakumei'* |
| 8 | *Dai-%d Shidan 'Kōza'* |
| 9 | *Dai-%d Shidan 'Heiwa'* |
| 10 | *Dai-%d Shidan 'Chūkaku'* |
| 11 | *Dai-%d Shidan 'Sōhyō'* |
| 12 | *Dai-%d Shidan 'Zengakuren'* |
| 13 | *Dai-%d Shidan 'Sanya'* |
| 14 | *Dai-%d Shidan 'Sekki'* |

---

## Notes

- **Extrapolation**: Verified names are the numbered divisions with their tsūshōgō, the four tank divisions, the Cavalry Group and brigades, the Teishin Shūdan, the Special Naval Landing Forces by naval district, the Konoe units, the Kwantung border garrisons and the real JCP organs (*Sanson Kōsakutai*, *Chūkaku Jieitai*, *Dokuritsu Yūgekitai*). Motorized, mechanized and mountain divisions, regional garrisons, prefectural militias and every ideology-suite formation are plausible extensions in the Japanese naming pattern.
- **Readings**: Tsūshōgō use the kun readings attested in *-heidan* form (*Tama*, *Isamu*, *Take*) rather than the on readings (*Gyoku*, *Yū*, *Bu*) used by vanilla.
