# China (CHI) Namelist Plan - 2026-10-25

Status: READY

File: `common/units/names_divisions/zz_INEX_CHI_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Nationalist China (CHI) has no INEX file (ROADMAP.md, section B, Tier 1). Vanilla gives it 9 groups (469 entries, 168 more than the fallback), written in toneless pinyin at corps level (`%d Juntuán`, a misspelling of 軍團 juntuan, an army group), with the German-trained and X Force divisions on offset keys 402-499 and invented terms (`Jidonghua`, `Sheng Jun`, Wade-Giles `Nanking`, `Hophei`). This plan creates the file with 21 groups and 732 names: the National Revolutionary Army (NRA) at division level (師 shi) in plain and Named lists, the X and Y Force divisions, the corps-level armies (軍 jun), the mobile, armour, cavalry and specialist arms, garrisons and peace preservation regiments, and four government-gated suites.

## Decisions
- 2026-10-25, user policy answers:
  - Toneless Hanyu Pinyin. The vanilla UI and map fonts have `ü` and the first, second and fourth tone marks, but not the third-tone letters `ǎ ě ǐ ǒ ǔ` (char ids 462-476 missing from `hoi_20`, `hoi_16mbs`, `hoi_18mbs` and `hoi_mapfont4`; checked in `gfx/fonts`, game 1.19.3, 2026-10-25), so no tone marks are used anywhere.
  - A HoI4 infantry division is an NRA division (shi); separate groups hold the corps-level armies (jun).
  - Ideology suites: neutrality (Kuomintang party army), fascism (Blue Shirts), democratic (republican armies), communism (the CHI-side left, not the Red Army).
  - Scope: CHI only. The PRC file (a later plan) owns the Red Army, the Eighth Route Army, the New Fourth Army, the Northeast Anti-Japanese United Army and the PLA; the warlord tags get a later plan of their own. No shared groups.
  - Plausible extrapolation allowed; every extension is listed under "Author confirmation".
- **Orthography.** The ordinal 第N is `Di-N`, hyphenated and with Arabic numerals (`Di-36 Shi`). Echelons: `Shi` division, `Jun` army, `Lü` brigade, `Tuan` regiment, `Ying` battalion, `Zongdui` / `Zhidui` group / detachment, `Lu` route, `Biao` (Qing regiment). The NRA's word order: modifier, arm, ordinal, echelon (`Xinbian Qibing Di-1 Shi`, New 1st Cavalry Division). Series modifiers: `Xinbian` (New), `Zanbian` (Provisional), `Yubei` (Reserve), `Rongyu` (Honour). Compound unit nouns are joined (`Qingnianjun`, `Jiangfangjun`, `Huguojun`); mountain names write the specific and generic apart (`Zhongtiao Shan`, `Qin Ling`); towns, passes and gates are one word (`Gubeikou`, `Kunlunguan`, `Guanghuamen`). Pinyin apostrophes stay where a syllable needs one (`Tai'erzhuang`, `Ren'anqiang`). Burmese places carry their Chinese names (`Ren'anqiang` Yenangyaung, `Mengguan` Maingkwan, `Mizhina` Myitkyina, `Bamo` Bhamo, `Tonggu` Toungoo, `Waluban` Walawbum).
- **Honours and nicknames.** A battle honour stands in parentheses (`Di-88 Shi (Sihang)`), after the US file's `705th (Bastogne)`; a nickname in single quotes (`Di-57 Shi 'Huben'`, `Di-74 Jun 'Kangri Tiejun'`). Parentheses keep pinyin apostrophes out of quotes. One honour per division, the battle it is best known for; many divisions share `Songhu` (Shanghai 1937), which is history.
- **Use order.** A new division takes the first free `ordered` entry in the order of the file [NAM-021], and for a reused vanilla tag that is vanilla's order [NAM-020]. Vanilla puts keys 402-499 of `CHI_INF_01` right after its first 18 keys, and key 500 and the 4xx keys first in `CHI_MOT_01`, `CHI_MEC_01` and `CHI_MNT_01`. So those keys carry static texts that read naturally when they come up early: in the plain infantry and mobile lists 4xx are New divisions (`Xinbian Di-<key - 400> Shi`, which keeps vanilla's meaning of 422, 430 and 438 as the X Force's New 22nd, 30th and 38th), 301-315 Provisional divisions (`Zanbian Di-<key - 300> Shi`, vanilla's `Juntuán Linshi`), and key 500 the 200th Division (`Jixiehua Di-200 Shi`, the Mechanized 200th of 1938; `Motuohua Di-200 Shi` in the motorized list). In `CHI_MNT_01` the 24 keys vanilla hands out first carry number-free mountain identities. New groups list their entries most important first.
- **Fallback numbers.** The fallback takes the number above the highest in use in the linked pool [NAM-021]. Once a 4xx or 500 key of a vanilla group is held, fallback names in that pool run from there (`Di-501 Shi`); vanilla behaves the same. Named groups keep their own keys at or below 218 (`CHI_INF_02`) and put unnumbered identities on keys right after their numbered ones, so their fallback stays low.
- **Links.** `CHI_INF_02` to `CHI_INF_01`; `CHI_JUN_02` to `CHI_JUN_01`; `CHI_ARM_02` to `CHI_ARM_01`. Vanilla links `CHI_MOT_01`, `CHI_MEC_01` and `CHI_MNT_01` to `CHI_INF_01`, and the links stay in the merged groups [NAM-020], so the whole mobile family anchors on `CHI_INF_01`: the batch writes those links out and links `CHI_MOT_02` and `CHI_MEC_02` there too. The NRA numbered all its divisions in one series, so the shared pool is historical. `CHI_INF_03` and `CHI_GAR_01` are not linked (vanilla's garrison link is commented out).
- **Terms.** Vanilla's `Jidonghua` is not a period term: the mechanized list uses `Jixiehua` (attested in 陸軍機械化第二百師), the motorized list `Motuohua` (standard Mandarin; no NRA unit used it). Vanilla's armour `Zhuangjia Shi` is a 1950s Taiwan form: the armour lists use the period arm word `Zhuangjiabing` (Armoured Corps). The NRA had no parachute division (three regiments in a group) and no mountain units: `CHI_PAR_01` names regiments, `CHI_MNT_01` is an extrapolation (`Shandi`, mountain).
- **Tags.** Vanilla tags reused: `CHI_INF_01`, `CHI_CAV_01`, `CHI_MOT_01`, `CHI_MEC_01`, `CHI_ARM_01`, `CHI_PAR_01`, `CHI_MAR_01`, `CHI_MNT_01`, `CHI_GAR_01`. New: `CHI_INF_02`, `CHI_INF_03`, `CHI_JUN_01`, `CHI_JUN_02`, `CHI_MOT_02`, `CHI_MEC_02`, `CHI_ARM_02`, `CHI_BAO_01`, `CHI_KMT_01`, `CHI_LXS_01`, `CHI_HUG_01`, `CHI_RGJ_01`. No `CHI_` tag exists in another INEX file.
- **Scripted groups.** Vanilla focuses give templates `CHI_INF_01` (`china_nationalist_sea.txt`, `TSR_lingguang_incident_joint_branch.txt`), `CHI_MEC_01` and `CHI_MNT_01` (`china_shared.txt`, `china_shared_TSR.txt`) and `CHI_GAR_01` (`manchukuo_TSR.txt`). All four stay ungated (`always = yes`), so the scripted templates keep their groups [NAM-018].
- **Gating.** `CHI_KMT_01` `has_government = neutrality` (the Kuomintang, CHI's starting government), `CHI_LXS_01` `fascism`, `CHI_HUG_01` `democratic`, `CHI_RGJ_01` `communism`. `CHI_BAO_01` stays ungated with `militia`: the provincial peace preservation regiments served every government.
- **Suite contents.**
  - Neutrality: the Whampoa training regiments, the Party Army (Dangjun) with honours of the Eastern and Northern Expeditions, the Guard Army whose 1st and 2nd Divisions became the 87th and 88th, the Training Brigade, and the Youth Army 201st-209th with the towns they were raised at.
  - Fascism: divisions after the Lixingshe ("Blue Shirts") and its circles, then the armed units of Dai Li (a Lixingshe alternate director): the Loyal and Patriotic Army, the Special Action Army and the action groups. The Whampoa clique's commanders are not used as patrons (Chen Cheng's membership is not attested), and no person is a patron in any list.
  - Democratic: the China Democratic League had no armed units, so the list honours the armies that defended the Republic and its constitution: the National Protection Army (1915-16), the Constitutional Protection Army and the Shaanxi Jingguojun (1917-18), and the 1911 revolutionaries.
  - Communism: the Fujian People's Revolutionary Army of 1933-34 and the 19th Route Army it came from (a socialist-leaning anti-Chiang government allied with, but not part of, the CCP), and two NRA armies that went over in 1949 (the 104th in the Beiping handover, the 111th in the Suiyuan uprising).
  - Left out as PRC lineage: Ye Ting's Independent Regiment, the Nanchang and Ningdu uprisings and the 11th Army's 24th and 26th Divisions.
- **Clique origin.** Formations of warlord origin that served in the NRA appear only by their national designations (the 29th Army's divisions at the Great Wall, the cavalry divisions of Ma and Shanxi origin, the 122nd Division at Tengxian, the Yunnan-born National Protection Army). No clique leader or clique army name is used.
- **Dropped vanilla content.** Every vanilla key is written again (see "Vanilla findings"); no vanilla text stays in the game. Vanilla's own names are dropped on purpose: `Juntuán` (wrong term and level), `Jidonghua` and `Bubing Shi` mobile forms, `Peixun Shi` (498; the intended Training Brigade is `Jiaodao Zongdui` in `CHI_KMT_01`), `Shui Jing Tuan` (499; as `Shuijing Zongtuan` in `CHI_GAR_01`), and the garrison names the vanilla file calls fictional (`Sheng Jun`, Wade-Giles forms); its two real ones are `Songhu Jingbei` and `Shoudu Jingbei` (Nanjing). Vanilla's corps-level `Xin N Qibing Jun` become New cavalry divisions.
- **Header.** The `newFile` block writes the file header; no `-SetHeader` step is needed.

## Vanilla findings (`-InspectVanilla CHI`)
| Vanilla | State | Action in the batch |
|---|---|---|
| `CHI_INF_01` "Infantry Unit" | 151 entries: keys 1-100 `%d Juntuán`; 201-215 `Xin N Juntuán`; 301-315 `N Juntuán Linshi` (310-314 off by one); 402-489 German-trained `N Bubing Shi`, 498 `Peixun Shi`, 499 `Shui Jing Tuan`; scripted (two focus files) | plain variant: every key written again (1-215 `Di-%d Shi`, 301-315 `Zanbian Di-N Shi`, 4xx `Xinbian Di-N Shi`) |
| `CHI_MOT_01` "Motorized Unit" | 43 entries, linked to `CHI_INF_01`: 500 `200 Jidonghua Bubing Shi`, 4xx `N Jidonghua Bubing Shi`, 1-20 `%d Jidonghua Juntuán` | plain variant: all 43 keys (500 `Motuohua Di-200 Shi`, 4xx `Xinbian Motuohua Di-N Shi`, 1-20 `Motuohua Di-%d Shi`); link written out |
| `CHI_MEC_01` "Mechanized Unit" | the same 43 keys with `Jixiehua`; scripted (shared focus tree) | plain variant: all 43 keys, `Jixiehua`; link written out |
| `CHI_ARM_01` "Armored Unit" | 15 entries `%d Zhuangjia Shi` | plain variant: keys 1-15 `Zhuangjiabing Di-%d Shi` |
| `CHI_CAV_01` "Cavalry Unit" | 10 entries `%d Qibing Jun`, 101-104 `Xin N Qibing Jun` | cavalry divisions 1-12, 101-104 New cavalry divisions, more on new keys |
| `CHI_PAR_01` "Paratrooper Unit" | 10 entries `%d Sanbing Shi` | keys 1-10: parachute regiments and groups |
| `CHI_MAR_01` "Marine Unit" | 10 entries `%d Luzhan Dui Shi` | keys 1-10: Navy Marine Corps brigades and units |
| `CHI_MNT_01` "Mountain Unit" | 136 entries, a copy of `CHI_INF_01` without 3xx, linked to it; scripted (shared focus tree) | all 136 keys: 24 mountain identities on the 4xx keys it hands out first, the rest `Shandi Di-%d Shi`; link written out |
| `CHI_GAR_01` "Garrison Unit" | 47 entries: 101-127 invented garrison names, 1-20 `%d Baoan Zongdui`; scripted (`manchukuo_TSR.txt`) | 101-127 real garrison commands, fortresses and Tax Police (used first), 1-20 military police regiments |

The rehearsal audit printed no `Vanilla:` line: no vanilla text stays in the game. Vanilla has no nickname to carry over.

## Group suite
Totals: 21 groups, 732 names.

| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `CHI_INF_01` | Infantry Divisions | infantry | always | none | `Di-%d Shi` | 151 |
| `CHI_INF_02` | Infantry Divisions (Named) | infantry | always | `CHI_INF_01` | `Di-%d Shi` | 52 |
| `CHI_INF_03` | Expeditionary Divisions | infantry | always | none | `Yuanzhengjun Di-%d Shi` | 20 |
| `CHI_JUN_01` | Corps-Level Armies | infantry | always | none | `Di-%d Jun` | 0 |
| `CHI_JUN_02` | Corps-Level Armies (Named) | infantry | always | `CHI_JUN_01` | `Di-%d Jun` | 23 |
| `CHI_MOT_01` | Motorized Divisions | motorized | always | `CHI_INF_01` | `Motuohua Di-%d Shi` | 43 |
| `CHI_MEC_01` | Mechanized Divisions | mechanized | always | `CHI_INF_01` | `Jixiehua Di-%d Shi` | 43 |
| `CHI_MOT_02` | Motorized Divisions (Named) | motorized | always | `CHI_INF_01` | `Motuohua Di-%d Shi` | 22 |
| `CHI_MEC_02` | Mechanized Divisions (Named) | mechanized | always | `CHI_INF_01` | `Jixiehua Di-%d Shi` | 22 |
| `CHI_ARM_01` | Armored Divisions | light/medium/heavy/modern_armor | always | none | `Zhuangjiabing Di-%d Shi` | 15 |
| `CHI_ARM_02` | Armored Divisions (Named) | light/medium/heavy/modern_armor | always | `CHI_ARM_01` | `Zhuangjiabing Di-%d Shi` | 12 |
| `CHI_CAV_01` | Cavalry Divisions | cavalry | always | none | `Qibing Di-%d Shi` | 29 |
| `CHI_PAR_01` | Parachute Regiments | paratrooper | always | none | `Sanbing Di-%d Tuan` | 10 |
| `CHI_MAR_01` | Marine Brigades | marine | always | none | `Haijun Luzhandui Di-%d Lü` | 10 |
| `CHI_MNT_01` | Mountain Divisions | mountaineers | always | `CHI_INF_01` | `Shandi Di-%d Shi` | 136 |
| `CHI_GAR_01` | Garrisons & Fortresses | infantry | always | none | `Shoubei Di-%d Zongdui` | 47 |
| `CHI_BAO_01` | Peace Preservation Corps | militia | always | none | `Baoan Di-%d Tuan` | 23 |
| `CHI_KMT_01` | Party Army Divisions | infantry | `has_government = neutrality` | none | `Dangjun Di-%d Shi` | 22 |
| `CHI_LXS_01` | Blue Shirts Divisions | infantry, militia | `has_government = fascism` | none | `Lixingshe Di-%d Shi` | 22 |
| `CHI_HUG_01` | Republican Armies | infantry | `has_government = democratic` | none | `Huguojun Di-%d Shi` | 18 |
| `CHI_RGJ_01` | People's Revolutionary Army | infantry | `has_government = communism` | none | `Renmin Gemingjun Di-%d Shi` | 12 |

## Research record
- `inex-historical-researcher`, run 1 (line army, about 38 web calls): zh.wikipedia "德械師", "青年軍", "國民革命軍第88師", "中國遠征軍", "中國駐印軍"; en.wikipedia "Battle of Shanghai order of battle", "Army groups of the National Revolutionary Army", "Battle of Taierzhuang", "Battle of Changde", "Battle of Hengyang", "Battle of Kunlun Pass", "New 1st Army", "200th Division (National Revolutionary Army)"; mnd.gov.tw (Youth Expeditionary Force). Verified: the German-trained roster (vanilla's 18 divisions match the 20-unit list), the Youth Army 201-209 with formation towns, X and Y Force orders of battle, 90+ division numbers, series formats.
- Run 2 (specialist arms, about 38 calls): zh.wikipedia "國民革命軍騎兵", "中華民國陸軍裝甲步兵第三五一旅", "國民革命軍江防軍", "中華民國海軍陸戰隊", en.wikipedia "Republic of China Marine Corps", snippets on 稅警總團, 傘兵, 淞滬警備司令部. Verified: the NRA's arm-before-ordinal order, `Jixiehua` (1938), the armour lineage 1929-49, cavalry divisions and armies, the parachute regiments, the marine brigades, the Yangtze fortresses, garrison commands, the Tax Police, the attested peace preservation regiments; no mountain units existed.
- Run 3 (ideology suites, about 30 calls): zh.wikipedia "三民主義力行社", "復興社", "忠義救國軍", "三民主義青年團", "護國戰爭", "護法運動", "北平和平解放", "綏遠和平起義", "國民革命軍第十九路軍"; en.wikipedia "Blue Shirts Society", "China Democratic League", "Fujian People's Government".
- Run 4 (narrow follow-up, about 35 calls): zh.wikipedia "長城戰役", "忻口會戰", "南京保衛戰", "萬家嶺戰役", "國民革命軍第七十四軍", "國民革命軍第十軍", "鄂西會戰", "湘西會戰", "松山戰役", "騰衝戰役", "龍陵戰役", "滇西緬北戰役", "國軍十大王牌軍", "俞濟時", "辛亥南京起義", "武昌起義", "閩變". Verified: about 45 division honours, 14 army nicknames or honours, the Guard Army lineage of the 87th and 88th, the National Protection Army's armies, the Jiangsu-Zhejiang Allied Army, the Shaanxi Jingguojun routes, the 1933 People's Revolutionary Army, the Burmese place names.
- Planner: glyph check of the tone letters in `gfx/fonts`; rehearsal of the batch, the docs payload and `-Check` on an export of HEAD (2026-10-25).
- Unverified and left out: Hu Zongnan's 1st Division as "天下第一師" (attested only for a Taiwan-era unit), the 190th Division "忠勇", the 36th Division at Huitongqiao, the 9th Division at Longling, the Constitutional Protection Army's units, the names of the Fujian 3rd-5th Armies' commanders, wartime armoured trains, numbered garrison commands outside the Yangtze, the Chinese name of the Ramgarh tank group.

## Author confirmation
Extrapolated or resting on a single source:
- `CHI_INF_01`: New division numbers above about 40 (`Xinbian Di-41 Shi` to `Xinbian Di-99 Shi` on keys 441-499); the series is attested, these numbers are not.
- `CHI_INF_02`: `Di-4 Shi (Nankou)`, `Di-21 Shi (Nankou)`, `Di-89 Shi (Nankou)` (one non-academic source); `Di-10 Shi (Xinkou)` (the division is named in a Xinkou telegram, its sector is not known).
- `CHI_INF_03`: the fallback form `Yuanzhengjun Di-%d Shi`.
- `CHI_JUN_02`: `Di-13 Jun (Nankou)` (one source); the joined spelling `'Taishanjun'` and `'Qianliju'`.
- `CHI_MOT_01`, `CHI_MEC_01`: `Motuohua` as a period word, and the `Xinbian Motuohua` / `Xinbian Jixiehua` designations.
- `CHI_MOT_02`, `CHI_MEC_02`: all names (motorized and mechanized forms of infantry divisions; only the 200th was mechanized).
- `CHI_ARM_01`, `CHI_ARM_02`: the form `Zhuangjiabing Di-N Shi`; keys 1-3 give the battles of the 1st Tank Battalion to armoured divisions.
- `CHI_PAR_01`: keys 6-10 (only three regiments existed). `CHI_MAR_01`: keys 7-10.
- `CHI_MNT_01`: all names (the mountain identities and the form `Shandi`).
- `CHI_GAR_01`: `Humen Yaosai`, `Minjiang Yaosai`, `Xiamen Yaosai`, `Qingdao Yaosai` (historic forts, no 1930s command found), `Wuhan Jingbei`; `Xianbing Di-12 Tuan` to `Xianbing Di-20 Tuan` (eleven regiments are attested by 1937); `Shoubei Di-%d Zongdui` as a fallback.
- `CHI_BAO_01`: every name except `Jiangsu Baoan Di-2 Tuan`, `Jiangxi Baoan Di-3 Tuan` and `Jiangxi Baoan Di-11 Tuan` (the pattern is attested, the province numbers are not).
- `CHI_KMT_01`: `Dangjun Di-1 Shi (Mianhu)` to `Dangjun Di-4 Shi (Beifa)` (the battles are attested, the Party Army divisions with these numbers are not); `Huangpu Jiaodao Di-3 Tuan` (dates uncertain); the fallback form.
- `CHI_LXS_01`: the five society-named divisions (keys 1-5) and the fallback form.
- `CHI_HUG_01`: `Huguojun Di-3 Jun` (a third army is named only in the biographies); the fallback form.
- `CHI_RGJ_01`: `Renmin Gemingjun Di-3 Jun` to `Di-5 Jun` (five armies are attested, the 3rd-5th by number only), `Minge Di-1 Shi`, the honour form `(Suiyuan Qiyi)`, the fallback form.

## Kept on judgment
Expected `-Check CHI` flags after the batch (`-DryRun` and a rehearsal with the audit of 2026-10-27: `FLAGS=5`):
- `PLACEHOLDER_ENTRIES` and `LOW_DEPTH` on `CHI_PAR_01`: vanilla keys 1-10 written over; the NRA had only a few parachute units.
- `LOW_DEPTH` on `CHI_MAR_01`: the Navy Marine brigades were few.
- `PLACEHOLDER_ENTRIES` on `CHI_MNT_01`: 112 numbered keys written over vanilla's.
- `UNGATED_POLITICAL` on `CHI_BAO_01`: raised by the `militia` type on an ungated group; the peace preservation regiments served every government.
Any other flag is a stop condition.

## Implementation steps
- [ ] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames CHI -Batch docs\plans\2026-10-25-china-namelist.md`. Expect `Created zz_INEX_CHI_names_divisions.txt`, then these 21 lines, and no `[ERROR]`:
  - `Added CHI_INF_01: "Infantry Divisions" [infantry], 151 name(s)`
  - `Added CHI_INF_02: "Infantry Divisions (Named)" [infantry], 52 name(s), links CHI_INF_01`
  - `Added CHI_INF_03: "Expeditionary Divisions" [infantry], 20 name(s)`
  - `Added CHI_JUN_01: "Corps-Level Armies" [infantry], 0 name(s)`
  - `Added CHI_JUN_02: "Corps-Level Armies (Named)" [infantry], 23 name(s), links CHI_JUN_01`
  - `Added CHI_MOT_01: "Motorized Divisions" [motorized], 43 name(s), links CHI_INF_01`
  - `Added CHI_MEC_01: "Mechanized Divisions" [mechanized], 43 name(s), links CHI_INF_01`
  - `Added CHI_MOT_02: "Motorized Divisions (Named)" [motorized], 22 name(s), links CHI_INF_01`
  - `Added CHI_MEC_02: "Mechanized Divisions (Named)" [mechanized], 22 name(s), links CHI_INF_01`
  - `Added CHI_ARM_01: "Armored Divisions" [light_armor medium_armor heavy_armor modern_armor], 15 name(s)`
  - `Added CHI_ARM_02: "Armored Divisions (Named)" [light_armor medium_armor heavy_armor modern_armor], 12 name(s), links CHI_ARM_01`
  - `Added CHI_CAV_01: "Cavalry Divisions" [cavalry], 29 name(s)`
  - `Added CHI_PAR_01: "Parachute Regiments" [paratrooper], 10 name(s)`
  - `Added CHI_MAR_01: "Marine Brigades" [marine], 10 name(s)`
  - `Added CHI_MNT_01: "Mountain Divisions" [mountaineers], 136 name(s), links CHI_INF_01`
  - `Added CHI_GAR_01: "Garrisons & Fortresses" [infantry], 47 name(s)`
  - `Added CHI_BAO_01: "Peace Preservation Corps" [militia], 23 name(s)`
  - `Added CHI_KMT_01: "Party Army Divisions" [infantry], 22 name(s)`
  - `Added CHI_LXS_01: "Blue Shirts Divisions" [infantry militia], 22 name(s)`
  - `Added CHI_HUG_01: "Republican Armies" [infantry], 18 name(s)`
  - `Added CHI_RGJ_01: "People's Revolutionary Army" [infantry], 12 name(s)`
- [ ] 2. Write `wiki/China.md` from the whole page under "Docs payload" with the Write tool (the fence lines are not part of the page).
- [ ] 3. `powershell -File .\build.ps1 -SyncWiki CHI -Country "China"`. Expect `Registered CHI (China) in: README.md, wiki/Home.md, wiki/_Sidebar.md`, `China.md: 0 row(s) updated` and `wiki/Home.md: CHI group count 21 (unchanged)`, with no `row added`, `no group table` or `stale row` line.
- [ ] 4. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: with the Edit tool, insert the cross-reference row from "Docs payload" as a new line directly after the row that starts with ``| `zz_INEX_SPR_names_divisions.txt` ``, and the `[b]China[/b]` block (three lines and the blank line after them) directly before the line `If you enjoy the mod, please give it a thumbs up and favorite!`. The description then has about 7,750 characters (about 8,130 if Hungary shipped first).
- [ ] 5. `powershell -File .\build.ps1 -Check CHI`. Expect:
  - `Validate: OK` and the tests passing (0 failed);
  - `AUDIT SUMMARY CHI: GROUPS=21 AUTHORED=428/732 FLAGS=5` and `Flags: LOW_DEPTH x2, PLACEHOLDER_ENTRIES x2, UNGATED_POLITICAL x1` (see "Kept on judgment");
  - no `[WARN] Docs:` line (the China block is 439 of its 450 characters);
  - `Plan: no audit plan in progress for CHI` (expected);
  - `Diff vs HEAD, file absent: 21 group(s) changed, +732 -0 name(s)`;
  - `Check passed`.
- [ ] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 7. Ship, on the user's word:
  1. `ROADMAP.md`, three replacements with the Edit tool (`<date>` is the day of this step, YYYY-MM-DD):
     - `| China (Nationalist) | CHI |` becomes `| ~~China (Nationalist)~~ | CHI |`;
     - `- **CHI.** The largest army on the map.` becomes `- ~~**CHI.**~~ Shipped <date> as a new file of 21 groups (plan in docs/plans/archive/2026-10-25-china-namelist.md). The largest army on the map.`;
     - `New Fourth Army. Plan with CHI. |` becomes `New Fourth Army. CHI shipped first: this file owns the Red Army, the Eighth Route Army, the New Fourth Army and the PLA; CHI's communist list is the Fujian People's Revolutionary Army and NRA armies that went over in 1949. |`.
  2. Move this plan to `docs/plans/archive/` (`Move-Item docs\plans\2026-10-25-china-namelist.md docs\plans\archive\`; the plan is not tracked yet, so not `git mv`).
  3. Run `git diff -- ROADMAP.md docs/tooling-backlog.md README.md WORKSHOP_DESCRIPTION_GUIDELINES.md wiki/Home.md wiki/_Sidebar.md`. This plan's changes there are: the three ROADMAP replacements of 7.1 and the CHI rows and block of steps 3 and 4; `docs/tooling-backlog.md` shows no change (its entry from this plan was committed with the tooling work of 2026-10-27). If the diff holds any other change (another plan was in progress in parallel, e.g. Hungary on 2026-10-25), stop and ask the user whether to commit both plans' changes together. Otherwise stage exactly these paths with `git add`: `common/units/names_divisions/zz_INEX_CHI_names_divisions.txt`, `wiki/China.md`, `wiki/Home.md`, `wiki/_Sidebar.md`, `README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `ROADMAP.md`, `docs/plans/archive/2026-10-25-china-namelist.md`, and commit with the message `Add China division namelists`. Leave any other untracked file (another plan) alone.
  4. `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document CHI division namelists"`.

## Docs payload
### Workshop cross-reference row
Goes into `WORKSHOP_DESCRIPTION_GUIDELINES.md` directly after the `zz_INEX_SPR_names_divisions.txt` row:

```text
| `zz_INEX_CHI_names_divisions.txt` | China | `CHI` | Included (Plain & Named NRA divisions with battle honours, X & Y Force expeditionary divisions, Plain & Named corps-level armies, German-trained motorized & mechanized lists, Armoured Corps, Cavalry, Parachute, Navy Marine, Mountain, Garrisons & Yangtze fortresses, Peace Preservation, Whampoa Party Army & Youth Army, Blue Shirts, Republican armies, People's Revolutionary Army) |
```

### Workshop `[b]China[/b]` block
Goes directly before `If you enjoy the mod, please give it a thumbs up and favorite!`, followed by one blank line:

```text
[b]China[/b]
- National Revolutionary Army divisions on their own numbers with their battles ([i]Di-88 Shi (Sihang)[/i]), German-trained mobile lists, X and Y Force, corps-level armies ([i]Di-74 Jun 'Kangri Tiejun'[/i]), cavalry, parachute and marine units, Yangtze fortresses and Peace Preservation regiments
- Whampoa Party Army and Youth Army, Blue Shirts, National Protection and 1911 armies, and the Fujian People's Revolutionary Army
```

### wiki/China.md (whole page)

````markdown
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
````

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader` (2026-10-25), given every authored name per group, the orthography rules and the "Author confirmation" list. Findings and what was done:
- `Di-104 Jun (Beiping Qiyi)`: the Beiping handover of January 1949 was a peaceful reorganization (和平解放), not an uprising (起義). Changed to `Di-104 Jun (Beiping)`; the group comment, the Decisions and the wiki page say "went over".
- `Di-111 Jun (Suiyuan Qiyi)`: the proofreader could not confirm a 111th Army in the Suiyuan uprising. Kept: research run 3 read it on zh.wikipedia "綏遠和平起義" (the 111th Army with the 258th, 320th and 326th Divisions).
- `Di-110 Shi (Tai'erzhuang)`, `Di-83 Shi (Nantianmen)`, `Di-5 Shi (Wuyang)`, `Di-42 Biao (Hanyang)`: not placed from the proofreader's memory, no lookup spent. Kept: sourced in research (en.wikipedia "Battle of Taierzhuang"; zh.wikipedia "長城戰役", "湘西會戰", "武昌起義").
- `'Taishanjun'` for the 10th Army: confirmed by the proofreader (thepaper.cn, Third Battle of Changsha). No other spelling, segmentation, nickname or honour problems found.

## Outcome
<!-- TODO(implementer): date, group and name counts from -Check, deviations from this plan with the reason -->

## Edit batch
Applied by `build.ps1 -EditNames CHI -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back. The first block creates the file with its header.

```json batch
{"newFile": true, "header": "Division template historical names system for China (CHI).\nImmersive Namelists Expanded (INEX)\nNational Revolutionary Army names in toneless Hanyu Pinyin (the game fonts lack the third-tone marks): Di-36 Shi (36th Division), Xinbian Di-38 Shi (New 38th), Qibing Di-3 Shi (cavalry). A HoI4 division is an NRA division (shi); CHI_JUN_* hold the corps-level armies (jun). Battle honours stand in parentheses, nicknames in single quotes.\nOverrides all nine vanilla CHI groups (INF, CAV, MOT, MEC, ARM, PAR, MAR, MNT, GAR) and writes over every vanilla number."}
```

```json batch
{"addGroup": true, "group": "CHI_INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "Di-%d Shi", "comment": "# ===== Field army =====\n\nOverrides vanilla CHI_INF_01 as the plain (un-nicknamed) variant; focuses in china_nationalist_sea.txt and TSR_lingguang_incident_joint_branch.txt give their templates this group. Every vanilla key is written again, so vanilla's corps-level '%d Juntuán' texts do not show. The game hands out entries in vanilla's file order, which puts keys 402-499 right after the first 18 divisions: they read as New divisions (Xinbian, 402 = New 2nd), as vanilla's X Force keys 422, 430 and 438 did, and keys 301-315 as Provisional divisions (Zanbian), vanilla's 'Juntuán Linshi'.",
  "add": [
  "# Vanilla keys written again (vanilla CHI_INF_01 merges into this group)",
  "1=Di-%d Shi",
  "2=Di-%d Shi",
  "3=Di-%d Shi",
  "4=Di-%d Shi",
  "5=Di-%d Shi",
  "6=Di-%d Shi",
  "7=Di-%d Shi",
  "8=Di-%d Shi",
  "9=Di-%d Shi",
  "10=Di-%d Shi",
  "11=Di-%d Shi",
  "12=Di-%d Shi",
  "13=Di-%d Shi",
  "14=Di-%d Shi",
  "15=Di-%d Shi",
  "16=Di-%d Shi",
  "17=Di-%d Shi",
  "18=Di-%d Shi",
  "19=Di-%d Shi",
  "20=Di-%d Shi",
  "21=Di-%d Shi",
  "22=Di-%d Shi",
  "23=Di-%d Shi",
  "25=Di-%d Shi",
  "26=Di-%d Shi",
  "27=Di-%d Shi",
  "28=Di-%d Shi",
  "29=Di-%d Shi",
  "30=Di-%d Shi",
  "31=Di-%d Shi",
  "32=Di-%d Shi",
  "33=Di-%d Shi",
  "34=Di-%d Shi",
  "35=Di-%d Shi",
  "36=Di-%d Shi",
  "37=Di-%d Shi",
  "38=Di-%d Shi",
  "39=Di-%d Shi",
  "40=Di-%d Shi",
  "41=Di-%d Shi",
  "42=Di-%d Shi",
  "43=Di-%d Shi",
  "44=Di-%d Shi",
  "45=Di-%d Shi",
  "46=Di-%d Shi",
  "47=Di-%d Shi",
  "48=Di-%d Shi",
  "49=Di-%d Shi",
  "50=Di-%d Shi",
  "51=Di-%d Shi",
  "52=Di-%d Shi",
  "53=Di-%d Shi",
  "54=Di-%d Shi",
  "55=Di-%d Shi",
  "56=Di-%d Shi",
  "57=Di-%d Shi",
  "58=Di-%d Shi",
  "59=Di-%d Shi",
  "60=Di-%d Shi",
  "61=Di-%d Shi",
  "62=Di-%d Shi",
  "63=Di-%d Shi",
  "64=Di-%d Shi",
  "65=Di-%d Shi",
  "66=Di-%d Shi",
  "67=Di-%d Shi",
  "68=Di-%d Shi",
  "69=Di-%d Shi",
  "70=Di-%d Shi",
  "71=Di-%d Shi",
  "72=Di-%d Shi",
  "73=Di-%d Shi",
  "74=Di-%d Shi",
  "75=Di-%d Shi",
  "76=Di-%d Shi",
  "77=Di-%d Shi",
  "78=Di-%d Shi",
  "79=Di-%d Shi",
  "80=Di-%d Shi",
  "81=Di-%d Shi",
  "82=Di-%d Shi",
  "83=Di-%d Shi",
  "84=Di-%d Shi",
  "85=Di-%d Shi",
  "86=Di-%d Shi",
  "87=Di-%d Shi",
  "88=Di-%d Shi",
  "89=Di-%d Shi",
  "90=Di-%d Shi",
  "91=Di-%d Shi",
  "92=Di-%d Shi",
  "93=Di-%d Shi",
  "94=Di-%d Shi",
  "95=Di-%d Shi",
  "96=Di-%d Shi",
  "98=Di-%d Shi",
  "99=Di-%d Shi",
  "100=Di-%d Shi",
  "201=Di-%d Shi",
  "202=Di-%d Shi",
  "203=Di-%d Shi",
  "205=Di-%d Shi",
  "206=Di-%d Shi",
  "207=Di-%d Shi",
  "208=Di-%d Shi",
  "209=Di-%d Shi",
  "210=Di-%d Shi",
  "211=Di-%d Shi",
  "212=Di-%d Shi",
  "213=Di-%d Shi",
  "214=Di-%d Shi",
  "215=Di-%d Shi",
  "301=Zanbian Di-1 Shi",
  "302=Zanbian Di-2 Shi",
  "303=Zanbian Di-3 Shi",
  "304=Zanbian Di-4 Shi",
  "305=Zanbian Di-5 Shi",
  "306=Zanbian Di-6 Shi",
  "307=Zanbian Di-7 Shi",
  "308=Zanbian Di-8 Shi",
  "309=Zanbian Di-9 Shi",
  "310=Zanbian Di-10 Shi",
  "311=Zanbian Di-11 Shi",
  "312=Zanbian Di-12 Shi",
  "313=Zanbian Di-13 Shi",
  "314=Zanbian Di-14 Shi",
  "315=Zanbian Di-15 Shi",
  "402=Xinbian Di-2 Shi",
  "403=Xinbian Di-3 Shi",
  "404=Xinbian Di-4 Shi",
  "406=Xinbian Di-6 Shi",
  "409=Xinbian Di-9 Shi",
  "410=Xinbian Di-10 Shi",
  "411=Xinbian Di-11 Shi",
  "414=Xinbian Di-14 Shi",
  "422=Xinbian Di-22 Shi",
  "425=Xinbian Di-25 Shi",
  "427=Xinbian Di-27 Shi",
  "430=Xinbian Di-30 Shi",
  "436=Xinbian Di-36 Shi",
  "438=Xinbian Di-38 Shi",
  "450=Xinbian Di-50 Shi",
  "457=Xinbian Di-57 Shi",
  "467=Xinbian Di-67 Shi",
  "480=Xinbian Di-80 Shi",
  "483=Xinbian Di-83 Shi",
  "487=Xinbian Di-87 Shi",
  "488=Xinbian Di-88 Shi",
  "489=Xinbian Di-89 Shi",
  "498=Xinbian Di-98 Shi",
  "499=Xinbian Di-99 Shi"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_INF_02", "selector": "Infantry Divisions (Named)", "addType": "infantry", "fallback": "Di-%d Shi", "link": "CHI_INF_01", "comment": "Named variant of CHI_INF_01: each division on its own number with the battle it is best known for, in parentheses (Di-88 Shi (Sihang)); the 57th keeps its nickname 'Huben' (Tiger Vanguard, Changde 1943). Keys 216-218 hold Reserve and Provisional divisions; they come last in use order.",
  "add": [
  "# Numbered divisions with a battle honour, on their own numbers",
  "1=Di-1 Shi (Songhu)",
  "2=Di-2 Shi (Nantianmen)",
  "3=Di-3 Shi (Hengyang)",
  "4=Di-4 Shi (Nankou)",
  "5=Di-5 Shi (Wuyang)",
  "6=Di-6 Shi (Songhu)",
  "9=Di-9 Shi (Songhu)",
  "10=Di-10 Shi (Xinkou)",
  "11=Di-11 Shi (Shipai)",
  "13=Di-13 Shi (Songhu)",
  "14=Di-14 Shi (Songhu)",
  "15=Di-15 Shi (Songhu)",
  "16=Di-16 Shi (Songhu)",
  "18=Di-18 Shi (Qianniuling)",
  "19=Di-19 Shi (Shanggao)",
  "21=Di-21 Shi (Nankou)",
  "25=Di-25 Shi (Gubeikou)",
  "26=Di-26 Shi (Shanggao)",
  "27=Di-27 Shi (Tai'erzhuang)",
  "31=Di-31 Shi (Tai'erzhuang)",
  "36=Di-36 Shi (Songhu)",
  "37=Di-37 Shi (Lengkou)",
  "38=Di-38 Shi (Xifengkou)",
  "51=Di-51 Shi (Wanjialing)",
  "54=Di-54 Shi (Xinkou)",
  "57=Di-57 Shi 'Huben'",
  "58=Di-58 Shi (Shanggao)",
  "63=Di-63 Shi (Xiangxi)",
  "67=Di-67 Shi (Songhu)",
  "77=Di-77 Shi (Xiangxi)",
  "83=Di-83 Shi (Nantianmen)",
  "85=Di-85 Shi (Xinkou)",
  "87=Di-87 Shi (Songhu)",
  "88=Di-88 Shi (Sihang)",
  "89=Di-89 Shi (Nankou)",
  "98=Di-98 Shi (Songhu)",
  "103=Di-103 Shi (Songhu)",
  "110=Di-110 Shi (Tai'erzhuang)",
  "118=Di-118 Shi (Xiangxi)",
  "121=Di-121 Shi (Qing Jiang)",
  "122=Di-122 Shi (Tengxian)",
  "150=Di-150 Shi (Changde)",
  "154=Di-154 Shi (Nanjing)",
  "156=Di-156 Shi (Guanghuamen)",
  "159=Di-159 Shi (Nanjing)",
  "190=Di-190 Shi (Changsha)",
  "191=Di-191 Shi (Xiangxi)",
  "196=Di-196 Shi (Xiangxi)",
  "200=Di-200 Shi (Kunlunguan)",
  "# Reserve and Provisional divisions (after the numbered ones in use order)",
  "216=Yubei Di-10 Shi (Changsha)",
  "217=Yubei Di-9 Shi (Shanggao)",
  "218=Zanbian Di-2 Shi (Luowenyu)"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_INF_03", "selector": "Expeditionary Divisions", "addType": "infantry", "fallback": "Yuanzhengjun Di-%d Shi", "comment": "The divisions of the Chinese Army in India (X Force) and the Chinese Expeditionary Force (Y Force) with their Burma and Salween battles, Burmese places in their Chinese names (Ren'anqiang = Yenangyaung, Mizhina = Myitkyina, Bamo = Bhamo, Tonggu = Toungoo). Own numbering; the fallback continues as Expeditionary Army divisions.",
  "add": [
  "# X Force (Zhuyinjun) and Y Force (Yuanzhengjun), Burma and the Salween 1942-45",
  "1=Xinbian Di-38 Shi (Ren'anqiang)",
  "2=Xinbian Di-22 Shi (Mengguan)",
  "3=Xinbian Di-30 Shi (Mizhina)",
  "4=Di-50 Shi (Mizhina)",
  "5=Di-14 Shi (Bamo)",
  "6=Di-200 Shi (Tonggu)",
  "7=Di-36 Shi (Tengchong)",
  "8=Di-87 Shi (Longling)",
  "9=Di-88 Shi (Longling)",
  "10=Rongyu Di-1 Shi (Longling)",
  "11=Xinbian Di-28 Shi (Songshan)",
  "12=Xinbian Di-39 Shi (Longling)",
  "13=Di-82 Shi (Songshan)",
  "14=Di-103 Shi (Songshan)",
  "15=Di-116 Shi (Tengchong)",
  "16=Di-130 Shi (Tengchong)",
  "17=Di-198 Shi (Tengchong)",
  "18=Yubei Di-2 Shi (Tengchong)",
  "19=Zanbian Di-55 Shi",
  "20=Xinbian Di-33 Shi"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_JUN_01", "selector": "Corps-Level Armies", "addType": "infantry", "fallback": "Di-%d Jun", "comment": "Plain variant of the corps-level armies (jun, 2-3 divisions; 'army' in English sources, e.g. New 1st Army). Fallback only.",
  "add": [
  
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_JUN_02", "selector": "Corps-Level Armies (Named)", "addType": "infantry", "fallback": "Di-%d Jun", "link": "CHI_JUN_01", "comment": "Named variant of CHI_JUN_01: the Iron Army (4th), Mount Tai Army (10th), Thousand-li Steed (52nd), Anti-Japanese Iron Army (74th) and First Army Under Heaven (New 1st), the rest with a battle. Keys 101-102 hold the New armies.",
  "add": [
  "# Armies with a nickname in quotes or a battle honour in parentheses",
  "4=Di-4 Jun 'Tiejun'",
  "5=Di-5 Jun (Kunlunguan)",
  "8=Di-8 Jun (Songshan)",
  "9=Di-9 Jun (Xinkou)",
  "10=Di-10 Jun 'Taishanjun'",
  "13=Di-13 Jun (Nankou)",
  "17=Di-17 Jun (Gubeikou)",
  "18=Di-18 Jun (Shipai)",
  "29=Di-29 Jun (Xifengkou)",
  "32=Di-32 Jun (Wanjialing)",
  "49=Di-49 Jun (Shanggao)",
  "52=Di-52 Jun 'Qianliju'",
  "53=Di-53 Jun (Tengchong)",
  "54=Di-54 Jun (Tengchong)",
  "66=Di-66 Jun (Wanjialing)",
  "70=Di-70 Jun (Shanggao)",
  "71=Di-71 Jun (Longling)",
  "73=Di-73 Jun (Xiangxi)",
  "74=Di-74 Jun 'Kangri Tiejun'",
  "94=Di-94 Jun (Wuyang)",
  "100=Di-100 Jun (Xiangxi)",
  "# New armies (after the numbered ones in use order)",
  "101=Xinbian Di-1 Jun 'Tianxia Diyi Jun'",
  "102=Xinbian Di-6 Jun (Bamo)"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_MOT_01", "selector": "Motorized Divisions", "addType": "motorized", "fallback": "Motuohua Di-%d Shi", "link": "CHI_INF_01", "comment": "# ===== Motorized, mechanized and armour =====\n\nOverrides vanilla CHI_MOT_01 as the plain variant. Vanilla links it to CHI_INF_01, and the link stays [NAM-020]; every mobile group anchors there. Vanilla's 'Jidonghua' is not a period term; motuohua is the standard word. Key 500 (first in use order) is the 200th Division, 4xx are New divisions as in CHI_INF_01.",
  "add": [
  "# Vanilla keys written again (vanilla group merges in); 500 and 4xx come first in use order",
  "1=Motuohua Di-%d Shi",
  "2=Motuohua Di-%d Shi",
  "3=Motuohua Di-%d Shi",
  "4=Motuohua Di-%d Shi",
  "5=Motuohua Di-%d Shi",
  "6=Motuohua Di-%d Shi",
  "7=Motuohua Di-%d Shi",
  "8=Motuohua Di-%d Shi",
  "9=Motuohua Di-%d Shi",
  "10=Motuohua Di-%d Shi",
  "11=Motuohua Di-%d Shi",
  "12=Motuohua Di-%d Shi",
  "13=Motuohua Di-%d Shi",
  "14=Motuohua Di-%d Shi",
  "15=Motuohua Di-%d Shi",
  "16=Motuohua Di-%d Shi",
  "17=Motuohua Di-%d Shi",
  "18=Motuohua Di-%d Shi",
  "19=Motuohua Di-%d Shi",
  "20=Motuohua Di-%d Shi",
  "402=Xinbian Motuohua Di-2 Shi",
  "403=Xinbian Motuohua Di-3 Shi",
  "404=Xinbian Motuohua Di-4 Shi",
  "406=Xinbian Motuohua Di-6 Shi",
  "409=Xinbian Motuohua Di-9 Shi",
  "410=Xinbian Motuohua Di-10 Shi",
  "411=Xinbian Motuohua Di-11 Shi",
  "414=Xinbian Motuohua Di-14 Shi",
  "422=Xinbian Motuohua Di-22 Shi",
  "425=Xinbian Motuohua Di-25 Shi",
  "427=Xinbian Motuohua Di-27 Shi",
  "430=Xinbian Motuohua Di-30 Shi",
  "436=Xinbian Motuohua Di-36 Shi",
  "438=Xinbian Motuohua Di-38 Shi",
  "450=Xinbian Motuohua Di-50 Shi",
  "457=Xinbian Motuohua Di-57 Shi",
  "467=Xinbian Motuohua Di-67 Shi",
  "480=Xinbian Motuohua Di-80 Shi",
  "483=Xinbian Motuohua Di-83 Shi",
  "487=Xinbian Motuohua Di-87 Shi",
  "488=Xinbian Motuohua Di-88 Shi",
  "489=Xinbian Motuohua Di-89 Shi",
  "500=Motuohua Di-200 Shi"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_MEC_01", "selector": "Mechanized Divisions", "addType": "mechanized", "fallback": "Jixiehua Di-%d Shi", "link": "CHI_INF_01", "comment": "Overrides vanilla CHI_MEC_01 as the plain variant (focuses in china_shared.txt and china_shared_TSR.txt give their templates this group). Jixiehua as in the 1938 Mechanized 200th Division (Lujun Jixiehua Di-200 Shi), which key 500 holds.",
  "add": [
  "# Vanilla keys written again (vanilla group merges in); 500 and 4xx come first in use order",
  "1=Jixiehua Di-%d Shi",
  "2=Jixiehua Di-%d Shi",
  "3=Jixiehua Di-%d Shi",
  "4=Jixiehua Di-%d Shi",
  "5=Jixiehua Di-%d Shi",
  "6=Jixiehua Di-%d Shi",
  "7=Jixiehua Di-%d Shi",
  "8=Jixiehua Di-%d Shi",
  "9=Jixiehua Di-%d Shi",
  "10=Jixiehua Di-%d Shi",
  "11=Jixiehua Di-%d Shi",
  "12=Jixiehua Di-%d Shi",
  "13=Jixiehua Di-%d Shi",
  "14=Jixiehua Di-%d Shi",
  "15=Jixiehua Di-%d Shi",
  "16=Jixiehua Di-%d Shi",
  "17=Jixiehua Di-%d Shi",
  "18=Jixiehua Di-%d Shi",
  "19=Jixiehua Di-%d Shi",
  "20=Jixiehua Di-%d Shi",
  "402=Xinbian Jixiehua Di-2 Shi",
  "403=Xinbian Jixiehua Di-3 Shi",
  "404=Xinbian Jixiehua Di-4 Shi",
  "406=Xinbian Jixiehua Di-6 Shi",
  "409=Xinbian Jixiehua Di-9 Shi",
  "410=Xinbian Jixiehua Di-10 Shi",
  "411=Xinbian Jixiehua Di-11 Shi",
  "414=Xinbian Jixiehua Di-14 Shi",
  "422=Xinbian Jixiehua Di-22 Shi",
  "425=Xinbian Jixiehua Di-25 Shi",
  "427=Xinbian Jixiehua Di-27 Shi",
  "430=Xinbian Jixiehua Di-30 Shi",
  "436=Xinbian Jixiehua Di-36 Shi",
  "438=Xinbian Jixiehua Di-38 Shi",
  "450=Xinbian Jixiehua Di-50 Shi",
  "457=Xinbian Jixiehua Di-57 Shi",
  "467=Xinbian Jixiehua Di-67 Shi",
  "480=Xinbian Jixiehua Di-80 Shi",
  "483=Xinbian Jixiehua Di-83 Shi",
  "487=Xinbian Jixiehua Di-87 Shi",
  "488=Xinbian Jixiehua Di-88 Shi",
  "489=Xinbian Jixiehua Di-89 Shi",
  "500=Jixiehua Di-200 Shi"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_MOT_02", "selector": "Motorized Divisions (Named)", "addType": "motorized", "fallback": "Motuohua Di-%d Shi", "link": "CHI_INF_01", "comment": "Named variant: the German-trained divisions (dexie shi), the 200th and four divisions of the 74th, 94th and 18th Armies, with the honours of CHI_INF_02.",
  "add": [
  "# The German-trained divisions of 1935-37 and the 200th, most famous first, then four divisions of the 74th, 94th and 18th Armies",
  "200=Motuohua Di-200 Shi (Kunlunguan)",
  "36=Motuohua Di-36 Shi (Songhu)",
  "87=Motuohua Di-87 Shi (Songhu)",
  "88=Motuohua Di-88 Shi (Sihang)",
  "57=Motuohua Di-57 Shi 'Huben'",
  "3=Motuohua Di-3 Shi (Hengyang)",
  "9=Motuohua Di-9 Shi (Songhu)",
  "6=Motuohua Di-6 Shi (Songhu)",
  "14=Motuohua Di-14 Shi (Songhu)",
  "11=Motuohua Di-11 Shi (Shipai)",
  "2=Motuohua Di-2 Shi (Nantianmen)",
  "25=Motuohua Di-25 Shi (Gubeikou)",
  "83=Motuohua Di-83 Shi (Nantianmen)",
  "27=Motuohua Di-27 Shi (Tai'erzhuang)",
  "67=Motuohua Di-67 Shi (Songhu)",
  "4=Motuohua Di-4 Shi (Nankou)",
  "10=Motuohua Di-10 Shi (Xinkou)",
  "89=Motuohua Di-89 Shi (Nankou)",
  "51=Motuohua Di-51 Shi (Wanjialing)",
  "58=Motuohua Di-58 Shi (Shanggao)",
  "5=Motuohua Di-5 Shi (Wuyang)",
  "18=Motuohua Di-18 Shi (Qianniuling)"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_MEC_02", "selector": "Mechanized Divisions (Named)", "addType": "mechanized", "fallback": "Jixiehua Di-%d Shi", "link": "CHI_INF_01", "comment": "Named variant: the German-trained divisions (dexie shi), the 200th and four divisions of the 74th, 94th and 18th Armies, with the honours of CHI_INF_02.",
  "add": [
  "# The German-trained divisions of 1935-37 and the 200th, most famous first, then four divisions of the 74th, 94th and 18th Armies",
  "200=Jixiehua Di-200 Shi (Kunlunguan)",
  "36=Jixiehua Di-36 Shi (Songhu)",
  "87=Jixiehua Di-87 Shi (Songhu)",
  "88=Jixiehua Di-88 Shi (Sihang)",
  "57=Jixiehua Di-57 Shi 'Huben'",
  "3=Jixiehua Di-3 Shi (Hengyang)",
  "9=Jixiehua Di-9 Shi (Songhu)",
  "6=Jixiehua Di-6 Shi (Songhu)",
  "14=Jixiehua Di-14 Shi (Songhu)",
  "11=Jixiehua Di-11 Shi (Shipai)",
  "2=Jixiehua Di-2 Shi (Nantianmen)",
  "25=Jixiehua Di-25 Shi (Gubeikou)",
  "83=Jixiehua Di-83 Shi (Nantianmen)",
  "27=Jixiehua Di-27 Shi (Tai'erzhuang)",
  "67=Jixiehua Di-67 Shi (Songhu)",
  "4=Jixiehua Di-4 Shi (Nankou)",
  "10=Jixiehua Di-10 Shi (Xinkou)",
  "89=Jixiehua Di-89 Shi (Nankou)",
  "51=Jixiehua Di-51 Shi (Wanjialing)",
  "58=Jixiehua Di-58 Shi (Shanggao)",
  "5=Jixiehua Di-5 Shi (Wuyang)",
  "18=Jixiehua Di-18 Shi (Qianniuling)"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_ARM_01", "selector": "Armored Divisions", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"], "fallback": "Zhuangjiabing Di-%d Shi", "comment": "Overrides vanilla CHI_ARM_01 as the plain variant; vanilla's 'Zhuangjia Shi' (armoured division) is a 1950s Taiwan form, so the list uses the period arm word zhuangjiabing (Armoured Corps).",
  "add": [
  "# Vanilla keys 1-15 written again",
  "1=Zhuangjiabing Di-%d Shi",
  "2=Zhuangjiabing Di-%d Shi",
  "3=Zhuangjiabing Di-%d Shi",
  "4=Zhuangjiabing Di-%d Shi",
  "5=Zhuangjiabing Di-%d Shi",
  "6=Zhuangjiabing Di-%d Shi",
  "7=Zhuangjiabing Di-%d Shi",
  "8=Zhuangjiabing Di-%d Shi",
  "9=Zhuangjiabing Di-%d Shi",
  "10=Zhuangjiabing Di-%d Shi",
  "11=Zhuangjiabing Di-%d Shi",
  "12=Zhuangjiabing Di-%d Shi",
  "13=Zhuangjiabing Di-%d Shi",
  "14=Zhuangjiabing Di-%d Shi",
  "15=Zhuangjiabing Di-%d Shi"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_ARM_02", "selector": "Armored Divisions (Named)", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"], "fallback": "Zhuangjiabing Di-%d Shi", "link": "CHI_ARM_01", "comment": "Named variant of CHI_ARM_01: three divisions after the battles of the 1st Tank Battalion (Zhanche Di-1 Ying: Kunlunguan 1939, Walawbum 1944, Guningtou 1949), then the Armoured Corps of 1937, the armoured and tank regiments and the Armoured Training Group.",
  "add": [
  "# Battles of the 1st Tank Battalion as divisional honours",
  "1=Zhuangjiabing Di-1 Shi (Kunlunguan)",
  "2=Zhuangjiabing Di-2 Shi (Waluban)",
  "3=Zhuangjiabing Di-3 Shi (Guningtou)",
  "# The NRA's armoured units, 1937-49",
  "4=Zhuangjiabing Tuan",
  "5=Zhanche Di-1 Ying",
  "6=Zhuangjiabing Di-1 Tuan",
  "7=Zhuangjiabing Di-2 Tuan",
  "8=Zhanche Di-1 Tuan",
  "9=Zhanche Di-2 Tuan",
  "10=Zhanche Di-3 Tuan",
  "11=Zhanche Di-4 Tuan",
  "12=Zhuangjiabing Jiaodao Zongdui"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_CAV_01", "selector": "Cavalry Divisions", "addType": "cavalry", "fallback": "Qibing Di-%d Shi", "comment": "# ===== Cavalry =====\n\nOverrides vanilla CHI_CAV_01 ('%d Qibing Jun'). The NRA wrote the arm before the ordinal (Qibing Di-3 Shi, cavalry 3rd division). Cavalry divisions 1-12, the New (Xinbian) 1-7 and Provisional (Zanbian) divisions, then the six cavalry armies and Ma Zhanshan's Northeast Advance Army. Designations only: no clique leader is named.",
  "add": [
  "# Cavalry divisions 1-12 (vanilla keys 1-10 written again)",
  "1=Qibing Di-%d Shi",
  "2=Qibing Di-%d Shi",
  "3=Qibing Di-%d Shi",
  "4=Qibing Di-%d Shi",
  "5=Qibing Di-%d Shi",
  "6=Qibing Di-%d Shi",
  "7=Qibing Di-%d Shi",
  "8=Qibing Di-%d Shi",
  "9=Qibing Di-%d Shi",
  "10=Qibing Di-%d Shi",
  "11=Qibing Di-%d Shi",
  "12=Qibing Di-%d Shi",
  "# New and Provisional cavalry divisions (vanilla's 'Xin N Qibing Jun' on 101-104 rewritten)",
  "101=Xinbian Qibing Di-1 Shi",
  "102=Xinbian Qibing Di-2 Shi",
  "103=Xinbian Qibing Di-3 Shi",
  "104=Xinbian Qibing Di-4 Shi",
  "105=Xinbian Qibing Di-5 Shi",
  "106=Xinbian Qibing Di-6 Shi",
  "107=Xinbian Qibing Di-7 Shi",
  "108=Zanbian Qibing Di-1 Shi",
  "109=Zanbian Qibing Di-2 Shi",
  "110=Zanbian Qibing Di-10 Shi",
  "# Cavalry armies",
  "111=Qibing Di-1 Jun",
  "112=Qibing Di-2 Jun",
  "113=Qibing Di-3 Jun",
  "114=Qibing Di-4 Jun",
  "115=Qibing Di-5 Jun",
  "116=Qibing Di-6 Jun",
  "117=Dongbei Tingjin Jun"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_PAR_01", "selector": "Parachute Regiments", "addType": "paratrooper", "fallback": "Sanbing Di-%d Tuan", "comment": "# ===== Specialist troops =====\n\nOverrides vanilla CHI_PAR_01 ('%d Sanbing Shi'): the NRA never had a parachute division. The 1st Parachute Regiment (cover name Hongxiang, 'Soaring Swan', Kunming 1944), the 2nd and 3rd, the Parachute Group of 1946 and the Army Assault Group of 1945.",
  "add": [
  "# The parachute regiments of 1944-49 (vanilla keys 1-10 written again)",
  "1=Sanbing Di-1 Tuan 'Hongxiang'",
  "2=Sanbing Di-2 Tuan",
  "3=Sanbing Di-3 Tuan",
  "4=Sanbing Zongdui",
  "5=Lujun Tuji Zongdui",
  "6=Sanbing Di-%d Tuan",
  "7=Sanbing Di-%d Tuan",
  "8=Sanbing Di-%d Tuan",
  "9=Sanbing Di-%d Tuan",
  "10=Sanbing Di-%d Tuan"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_MAR_01", "selector": "Marine Brigades", "addType": "marine", "fallback": "Haijun Luzhandui Di-%d Lü", "comment": "Overrides vanilla CHI_MAR_01 ('%d Luzhan Dui Shi', wrongly split): the Navy Marine Corps (Haijun Luzhandui) of Fujian, its two independent brigades of 1929-45, the mixed brigade of 1923, the supply regiment and the two marine divisions of 1949.",
  "add": [
  "# The Navy Marine Corps, 1923-49 (vanilla keys 1-10 written again)",
  "1=Haijun Luzhandui Di-1 Duli Lü",
  "2=Haijun Luzhandui Di-2 Duli Lü",
  "3=Haijun Luzhandui Di-1 Huncheng Lü",
  "4=Haijun Luzhandui Buchong Tuan",
  "5=Luzhan Di-1 Shi",
  "6=Luzhan Di-2 Shi",
  "7=Haijun Luzhandui Di-%d Lü",
  "8=Haijun Luzhandui Di-%d Lü",
  "9=Haijun Luzhandui Di-%d Lü",
  "10=Haijun Luzhandui Di-%d Lü"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_MNT_01", "selector": "Mountain Divisions", "addType": "mountaineers", "fallback": "Shandi Di-%d Shi", "link": "CHI_INF_01", "comment": "Overrides vanilla CHI_MNT_01 (an infantry copy, focuses in china_shared.txt give their templates this group). The NRA had no mountain units, so the list is an extrapolation: the 24 keys vanilla lists first carry the ranges and passes the NRA fought in or trained at (Zhongtiao Shan, Xuefeng Shan, Gaoligong Shan), without a number; the rest are numbered. Vanilla links it to CHI_INF_01, and the link stays [NAM-020].",
  "add": [
  "# Mountain identities on vanilla's keys 402-499, which this group hands out first",
  "430=Shandi Shi 'Zhongtiao Shan'",
  "438=Shandi Shi 'Xuefeng Shan'",
  "422=Shandi Shi 'Gaoligong Shan'",
  "414=Shandi Shi 'Dabie Shan'",
  "450=Shandi Shi 'Mufu Shan'",
  "403=Shandi Shi 'Lu Shan'",
  "406=Shandi Shi 'Zijin Shan'",
  "409=Shandi Shi 'Yuelu Shan'",
  "436=Shandi Shi 'Jiugong Shan'",
  "487=Shandi Shi 'Funiu Shan'",
  "488=Shandi Shi 'Tongbai Shan'",
  "498=Shandi Shi 'Wuling Shan'",
  "402=Shandi Shi 'Qin Ling'",
  "404=Shandi Shi 'Daba Shan'",
  "410=Shandi Shi 'Emei Shan'",
  "411=Shandi Shi 'Nanyue'",
  "425=Shandi Shi 'Tianmu Shan'",
  "427=Shandi Shi 'Wuyi Shan'",
  "457=Shandi Shi 'Huang Shan'",
  "467=Shandi Shi 'Jiuhua Shan'",
  "480=Shandi Shi 'Wudang Shan'",
  "483=Shandi Shi 'Hua Shan'",
  "489=Shandi Shi 'Jigong Shan'",
  "499=Shandi Shi 'Niangziguan'",
  "# Other vanilla keys written again",
  "1=Shandi Di-%d Shi",
  "2=Shandi Di-%d Shi",
  "3=Shandi Di-%d Shi",
  "4=Shandi Di-%d Shi",
  "5=Shandi Di-%d Shi",
  "6=Shandi Di-%d Shi",
  "7=Shandi Di-%d Shi",
  "8=Shandi Di-%d Shi",
  "9=Shandi Di-%d Shi",
  "10=Shandi Di-%d Shi",
  "11=Shandi Di-%d Shi",
  "12=Shandi Di-%d Shi",
  "13=Shandi Di-%d Shi",
  "14=Shandi Di-%d Shi",
  "15=Shandi Di-%d Shi",
  "16=Shandi Di-%d Shi",
  "17=Shandi Di-%d Shi",
  "18=Shandi Di-%d Shi",
  "19=Shandi Di-%d Shi",
  "20=Shandi Di-%d Shi",
  "21=Shandi Di-%d Shi",
  "22=Shandi Di-%d Shi",
  "23=Shandi Di-%d Shi",
  "25=Shandi Di-%d Shi",
  "26=Shandi Di-%d Shi",
  "27=Shandi Di-%d Shi",
  "28=Shandi Di-%d Shi",
  "29=Shandi Di-%d Shi",
  "30=Shandi Di-%d Shi",
  "31=Shandi Di-%d Shi",
  "32=Shandi Di-%d Shi",
  "33=Shandi Di-%d Shi",
  "34=Shandi Di-%d Shi",
  "35=Shandi Di-%d Shi",
  "36=Shandi Di-%d Shi",
  "37=Shandi Di-%d Shi",
  "38=Shandi Di-%d Shi",
  "39=Shandi Di-%d Shi",
  "40=Shandi Di-%d Shi",
  "41=Shandi Di-%d Shi",
  "42=Shandi Di-%d Shi",
  "43=Shandi Di-%d Shi",
  "44=Shandi Di-%d Shi",
  "45=Shandi Di-%d Shi",
  "46=Shandi Di-%d Shi",
  "47=Shandi Di-%d Shi",
  "48=Shandi Di-%d Shi",
  "49=Shandi Di-%d Shi",
  "50=Shandi Di-%d Shi",
  "51=Shandi Di-%d Shi",
  "52=Shandi Di-%d Shi",
  "53=Shandi Di-%d Shi",
  "54=Shandi Di-%d Shi",
  "55=Shandi Di-%d Shi",
  "56=Shandi Di-%d Shi",
  "57=Shandi Di-%d Shi",
  "58=Shandi Di-%d Shi",
  "59=Shandi Di-%d Shi",
  "60=Shandi Di-%d Shi",
  "61=Shandi Di-%d Shi",
  "62=Shandi Di-%d Shi",
  "63=Shandi Di-%d Shi",
  "64=Shandi Di-%d Shi",
  "65=Shandi Di-%d Shi",
  "66=Shandi Di-%d Shi",
  "67=Shandi Di-%d Shi",
  "68=Shandi Di-%d Shi",
  "69=Shandi Di-%d Shi",
  "70=Shandi Di-%d Shi",
  "71=Shandi Di-%d Shi",
  "72=Shandi Di-%d Shi",
  "73=Shandi Di-%d Shi",
  "74=Shandi Di-%d Shi",
  "75=Shandi Di-%d Shi",
  "76=Shandi Di-%d Shi",
  "77=Shandi Di-%d Shi",
  "78=Shandi Di-%d Shi",
  "79=Shandi Di-%d Shi",
  "80=Shandi Di-%d Shi",
  "81=Shandi Di-%d Shi",
  "82=Shandi Di-%d Shi",
  "83=Shandi Di-%d Shi",
  "84=Shandi Di-%d Shi",
  "85=Shandi Di-%d Shi",
  "86=Shandi Di-%d Shi",
  "87=Shandi Di-%d Shi",
  "88=Shandi Di-%d Shi",
  "89=Shandi Di-%d Shi",
  "90=Shandi Di-%d Shi",
  "91=Shandi Di-%d Shi",
  "92=Shandi Di-%d Shi",
  "93=Shandi Di-%d Shi",
  "94=Shandi Di-%d Shi",
  "95=Shandi Di-%d Shi",
  "96=Shandi Di-%d Shi",
  "98=Shandi Di-%d Shi",
  "99=Shandi Di-%d Shi",
  "100=Shandi Di-%d Shi",
  "201=Shandi Di-%d Shi",
  "202=Shandi Di-%d Shi",
  "203=Shandi Di-%d Shi",
  "205=Shandi Di-%d Shi",
  "206=Shandi Di-%d Shi",
  "207=Shandi Di-%d Shi",
  "208=Shandi Di-%d Shi",
  "209=Shandi Di-%d Shi",
  "210=Shandi Di-%d Shi",
  "211=Shandi Di-%d Shi",
  "212=Shandi Di-%d Shi",
  "213=Shandi Di-%d Shi",
  "214=Shandi Di-%d Shi",
  "215=Shandi Di-%d Shi"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_GAR_01", "selector": "Garrisons & Fortresses", "addType": "infantry", "fallback": "Shoubei Di-%d Zongdui", "comment": "# ===== Garrisons and territorial defence =====\n\nOverrides vanilla CHI_GAR_01, whose names the vanilla file itself calls fictional (manchukuo_TSR.txt gives a template this group). The capital and Songhu (Shanghai) garrison commands, the Yangtze fortresses of 1937-43, the Salt Tax Police (Shuijing Zongtuan) and the military police regiments (Xianbing). The fallback is a garrison group (shoubei zongdui).",
  "add": [
  "# Garrison commands, Yangtze and coastal fortresses, the Tax Police (vanilla keys 101-127, used first)",
  "101=Shoudu Jingbei",
  "102=Songhu Jingbei",
  "103=Jinghu Jingbei",
  "104=Minxia Jingbei",
  "105=Jiujiang Jingbei",
  "106=Fengjie Jingbei",
  "107=Jiangyin Yaosai",
  "108=Zhenjiang Yaosai",
  "109=Jiangning Yaosai",
  "110=Wusong Yaosai",
  "111=Madang Yaosai",
  "112=Hukou Yaosai",
  "113=Tianjiazhen Yaosai",
  "114=Shipai Yaosai",
  "115=Yiwan Yaosai",
  "116=Yuwan Yaosai",
  "117=Bayi Yaosai",
  "118=Bawan Yaosai",
  "119=Humen Yaosai",
  "126=Minjiang Yaosai",
  "127=Xiamen Yaosai",
  "120=Qingdao Yaosai",
  "121=Jiangfangjun",
  "122=Shuijing Zongtuan",
  "123=Lianghuai Shuijing Zongtuan",
  "124=Jisi Zongdui",
  "125=Wuhan Jingbei",
  "# Military police regiments (vanilla keys 1-20)",
  "1=Xianbing Di-1 Tuan",
  "2=Xianbing Di-2 Tuan",
  "3=Xianbing Di-3 Tuan",
  "4=Xianbing Di-4 Tuan",
  "5=Xianbing Di-5 Tuan",
  "6=Xianbing Di-6 Tuan",
  "7=Xianbing Di-7 Tuan",
  "8=Xianbing Di-8 Tuan",
  "9=Xianbing Di-9 Tuan",
  "10=Xianbing Di-10 Tuan",
  "11=Xianbing Di-11 Tuan",
  "12=Xianbing Di-12 Tuan",
  "13=Xianbing Di-13 Tuan",
  "14=Xianbing Di-14 Tuan",
  "15=Xianbing Di-15 Tuan",
  "16=Xianbing Di-16 Tuan",
  "17=Xianbing Di-17 Tuan",
  "18=Xianbing Di-18 Tuan",
  "19=Xianbing Di-19 Tuan",
  "20=Xianbing Di-20 Tuan"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_BAO_01", "selector": "Peace Preservation Corps", "addType": "militia", "fallback": "Baoan Di-%d Tuan", "comment": "The provincial Peace Preservation regiments (baoan tuan) that the Nanjing government raised from the local militia after 1932, written as the provinces numbered them (Jiangxi Baoan Di-3 Tuan). Ungated: they served every government.",
  "add": [
  "# Provincial Peace Preservation regiments",
  "1=Jiangsu Baoan Di-1 Tuan",
  "2=Jiangsu Baoan Di-2 Tuan",
  "3=Jiangsu Baoan Di-3 Tuan",
  "4=Zhejiang Baoan Di-1 Tuan",
  "5=Zhejiang Baoan Di-2 Tuan",
  "6=Zhejiang Baoan Di-3 Tuan",
  "7=Anhui Baoan Di-1 Tuan",
  "8=Anhui Baoan Di-2 Tuan",
  "9=Jiangxi Baoan Di-1 Tuan",
  "10=Jiangxi Baoan Di-3 Tuan",
  "11=Jiangxi Baoan Di-11 Tuan",
  "12=Hubei Baoan Di-1 Tuan",
  "13=Hubei Baoan Di-2 Tuan",
  "14=Hunan Baoan Di-1 Tuan",
  "15=Hunan Baoan Di-2 Tuan",
  "16=Henan Baoan Di-1 Tuan",
  "17=Henan Baoan Di-2 Tuan",
  "18=Fujian Baoan Di-1 Tuan",
  "19=Fujian Baoan Di-2 Tuan",
  "20=Shaanxi Baoan Di-1 Tuan",
  "21=Gansu Baoan Di-1 Tuan",
  "22=Guizhou Baoan Di-1 Tuan",
  "23=Guangdong Baoan Di-1 Tuan"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_KMT_01", "selector": "Party Army Divisions", "addType": "infantry", "fallback": "Dangjun Di-%d Shi", "canUse": "has_government = neutrality", "comment": "# ===== Ideology suites =====\n\nKuomintang party army (neutrality, the government CHI starts with): the Whampoa Academy training regiments of 1924-25, the Party Army (Dangjun) with the battles of the Eastern and Northern Expeditions, the Guard Army whose two divisions became the 87th and 88th in 1932, the Training Brigade (Jiaodao Zongdui) and the Youth Army.",
  "add": [
  "# Whampoa, the Party Army and the Guard Army",
  "1=Huangpu Jiaodao Di-1 Tuan",
  "2=Huangpu Jiaodao Di-2 Tuan",
  "3=Huangpu Jiaodao Di-3 Tuan",
  "4=Dangjun Di-1 Lü",
  "5=Dangjun Di-1 Shi (Mianhu)",
  "6=Dangjun Di-2 Shi (Huizhou)",
  "7=Dangjun Di-3 Shi (Longtan)",
  "8=Dangjun Di-4 Shi (Beifa)",
  "9=Jingwei Di-1 Lü",
  "10=Jingwei Di-1 Shi",
  "11=Jingwei Di-2 Shi",
  "12=Jiaodao Di-1 Shi",
  "13=Jiaodao Zongdui",
  "# The Youth Army (Qingnianjun) of 1944-45, with the town each division was raised at",
  "14=Qingnianjun Di-201 Shi (Bishan)",
  "15=Qingnianjun Di-202 Shi (Qijiang)",
  "16=Qingnianjun Di-203 Shi (Luxian)",
  "17=Qingnianjun Di-204 Shi (Wanxian)",
  "18=Qingnianjun Di-205 Shi (Zhazuo)",
  "19=Qingnianjun Di-206 Shi (Hanzhong)",
  "20=Qingnianjun Di-207 Shi (Qujing)",
  "21=Qingnianjun Di-208 Shi (Lichuan)",
  "22=Qingnianjun Di-209 Shi (Yanshan)"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_LXS_01", "selector": "Blue Shirts Divisions", "addType": ["infantry", "militia"], "fallback": "Lixingshe Di-%d Shi", "canUse": "has_government = fascism", "comment": "Fascism (the Blue Shirts focuses): divisions after the Lixingshe, its outer Fuxingshe, the 'Blue Shirts' (Lanyishe), its servicemen's and youth associations and the New Life Movement, then the armed units of Dai Li (a Lixingshe director): the Loyal and Patriotic Army (Zhongyi Jiuguojun), the Special Action Army and its detachments, and the action groups behind Japanese lines.",
  "add": [
  "# Divisions after the Blue Shirts and their circles",
  "1=Lanyishe Di-1 Shi",
  "2=Fuxingshe Di-1 Shi",
  "3=Geming Junren Di-1 Shi",
  "4=Geming Qingnian Di-1 Shi",
  "5=Xin Shenghuo Di-1 Shi",
  "# Dai Li's Loyal and Patriotic Army and Special Action units, 1937-45",
  "6=Zhongyi Jiuguojun Di-1 Zongdui",
  "7=Zhongyi Jiuguojun Di-2 Zongdui",
  "8=Zhongyi Jiuguojun Di-3 Zongdui",
  "9=Biedongjun Di-3 Zongdui",
  "10=Biedongjun Di-4 Zongdui",
  "11=Biedongjun Di-7 Zongdui",
  "12=Suzhe Biedongdui Di-1 Zhidui",
  "13=Suzhe Biedongdui Di-2 Zhidui",
  "14=Suzhe Biedongdui Di-3 Zhidui",
  "15=Suzhe Biedongdui Di-4 Zhidui",
  "16=Suzhe Biedongdui Di-5 Zhidui",
  "17=Songhu Xingdong Zongdui",
  "18=Nanjing Xingdong Zongdui",
  "19=Taihu Xingdong Zongdui",
  "20=Pudong Xingdong Zongdui",
  "21=Zhedong Xingdong Zongdui",
  "22=Zhexi Xingdong Zongdui"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_HUG_01", "selector": "Republican Armies", "addType": "infantry", "fallback": "Huguojun Di-%d Shi", "canUse": "has_government = democratic", "comment": "Democratic: the armies that fought for the Republic and its constitution: the National Protection Army (Huguojun) against Yuan Shikai's monarchy in 1915-16, Sun Yat-sen's Constitutional Protection Army (Hufajun) and the Shaanxi Jingguojun of 1917-18, and the revolutionaries of 1911 at Wuchang, Hanyang and Nanjing (the Hubei army Ejun, the Jiangsu-Zhejiang Allied Army). The fallback continues the National Protection Army.",
  "add": [
  "# Defenders of the Republic: National Protection and Constitutional Protection, 1915-18",
  "1=Huguojun Di-1 Jun (Naxi)",
  "2=Huguojun Di-2 Jun",
  "3=Huguojun Di-3 Jun",
  "4=Hufajun",
  "5=Xiangnan Hufajun",
  "6=Shaanxi Jingguojun",
  "7=Jingguojun Di-1 Lu",
  "8=Jingguojun Di-3 Lu",
  "9=Jingguojun Di-4 Lu",
  "# The revolution of 1911: Wuchang, Hanyang and Nanjing",
  "10=Ejun",
  "11=Gongcheng Di-8 Ying (Wuchang)",
  "12=Di-42 Biao (Hanyang)",
  "13=Jiangzhe Lianjun",
  "14=Zhenjun",
  "15=Sujun",
  "16=Zhejun",
  "17=Zhejun Gansidui",
  "18=Hujun Xianfengdui"
  ] }
```

```json batch
{"addGroup": true, "group": "CHI_RGJ_01", "selector": "People's Revolutionary Army", "addType": "infantry", "fallback": "Renmin Gemingjun Di-%d Shi", "canUse": "has_government = communism", "comment": "Communism, from the CHI side: the People's Revolutionary Army (Renmin Gemingjun) of the 1933 Fujian government, formed from the 19th Route Army of the 1932 Shanghai defence, and NRA armies that went over in 1949 (the Beiping handover, the Suiyuan uprising, Qiyi). The Red Army, Eighth Route Army, New Fourth Army and PLA are left to the PRC file.",
  "add": [
  "# The Fujian People's Revolutionary Army of 1933-34 and the 19th Route Army",
  "1=Renmin Gemingjun Di-1 Jun",
  "2=Renmin Gemingjun Di-2 Jun",
  "3=Renmin Gemingjun Di-3 Jun",
  "4=Renmin Gemingjun Di-4 Jun",
  "5=Renmin Gemingjun Di-5 Jun",
  "6=Di-19 Lujun",
  "7=Di-19 Lujun Di-60 Shi",
  "8=Di-19 Lujun Di-61 Shi",
  "9=Di-19 Lujun Di-78 Shi",
  "# NRA armies that went over in 1949, and the Revolutionary Committee of the KMT",
  "10=Di-104 Jun (Beiping)",
  "11=Di-111 Jun (Suiyuan Qiyi)",
  "12=Minge Di-1 Shi"
  ] }
```
