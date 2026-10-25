# Lithuania (LIT) Namelist Plan - 2026-10-25

Status: DONE

File: `common/units/names_divisions/zz_INEX_LIT_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
The INEX Lithuania file (16 groups, 150 entries, 31 authored) is the weakest in the mod (ROADMAP.md, rework queue item 1): placeholder runs copied from vanilla, machine-translated fallbacks ("Juras Peizazas Divizija", the Albanian "Bjeshkë", "Apsisarvavimas Divizija"), singular selectors, English "District 'Kaunas'" names, a duplicated 4th/5th regiment patron, and two groups on support-company tokens (`artillery`, `anti_air`). This plan replaces the whole file: it removes all 16 groups and builds 19 new ones (394 names) in native Lithuanian, covering the interwar army, its Named variants, the Riflemen's Union, specialists, and four government-gated suites.

## Decisions
- 2026-10-25, user policy answers:
  - Plausible extrapolation allowed; every extension follows a verified pattern and is listed under "Author confirmation".
  - Ideology suites: monarchist Royal Guard, fascist Iron Wolf, communist, democratic (all four).
  - Plain and Named pairs for infantry, motorized/mechanized and armour.
  - Native Lithuanian style: Arabic ordinals with gendered definite endings, lower-case common nouns, proper names capitalised.
- **Orthography.** Feminine nouns (`divizija`, `rinktinė`) take `-oji`, masculine (`pulkas`, `korpusas`, `batalionas`) `-asis`; after a final 3 the endings are `-ioji` / `-iasis` (3, 23, 33), but 13 is `13-oji` / `13-asis`. A fallback cannot change its ending, so the plain lists write their numbers out: `LIT_INF_01` keys 1-40, `LIT_MOT_01`, `LIT_MEC_01`, `LIT_ARM_01` keys 1-25. A fallback number past a written run that ends in 3 shows `-oji`; accepted.
- **Honorifics** stand in the genitive before the noun, as in the attested `10-asis pėstininkų Marijampolės pulkas`. The interwar regiment names keep the catalogued forms, including their two word orders (`Lietuvos didžiojo kunigaikščio Gedimino`, `Didžiojo Lietuvos kunigaikščio Algirdo`). The 5th regiment is Kęstutis (the old file had Mindaugas twice).
- **Nicknames** of the Named mobile, armour, paratrooper, marine and mountain lists stand in the nominative in straight single quotes (`1-oji tankų divizija 'Gediminas'`), after the modern Lithuanian brigades *Žemaitija*, *Aukštaitija*, *Žalgiris*. The map font `hoi_mapfont4.fnt` has every Lithuanian letter but no `„` `“` `”` (char ids 8222, 8220, 8221 missing; checked in `gfx/fonts`, game 1.19.3, 2026-10-25), so Lithuanian quotation marks are not used.
- **Riflemen's Union** entries keep the Union's own form, Roman numeral plus county genitive (`XX Klaipėdos rinktinė`); the fallback adds `šaulių` (`%s šaulių rinktinė`) so a bare number reads clearly. Rinktinės whose number is not known sit on keys 101-114 without a numeral.
- **Keys.** A group that mixes numbered and unnumbered names keeps each numbered name on its own number and the unnumbered ones on 101+ (`LIT_ARM_02`, `LIT_GAR_01`, `LIT_SAU_01`, `LIT_GUA_01`) or 201+ (`LIT_RED_01`, whose numbers reach 184). Groups whose names carry no number run from key 1.
- **Links.** `LIT_INF_02` to `LIT_INF_01`; the mobile family anchors on `LIT_MOT_01` (`LIT_MEC_01`, `LIT_MOT_02`, `LIT_MEC_02`); `LIT_ARM_02` to `LIT_ARM_01` (armour kept apart from the mobile family, as in ROM); `LIT_MNT_01` and `LIT_GAR_01` to `LIT_INF_01`, written out because vanilla's link stays in the merged group anyway [NAM-020]. `LIT_MOT_01` is not linked to infantry.
- **Tags.** Vanilla tags reused: `LIT_INF_01`, `LIT_CAV_01`, `LIT_MOT_01`, `LIT_MEC_01`, `LIT_ARM_01`, `LIT_PAR_01`, `LIT_MAR_01`, `LIT_MNT_01`, `LIT_GAR_01`. INEX tag kept: `LIT_REG_01` (still the infantry regiments). New: `LIT_INF_02`, `LIT_MOT_02`, `LIT_MEC_02`, `LIT_ARM_02`, `LIT_SAU_01`, `LIT_GUA_01`, `LIT_GV_01`, `LIT_RED_01`, `LIT_LLK_01` (no `LIT_` tag exists outside this file). Dropped: `LIT_GAR_02` (English district names; garrisons now in `LIT_GAR_01`), `LIT_REG_02` (cavalry regiments, now `LIT_CAV_01`), `LIT_REG_03` and `LIT_AA_01` (support-company tokens `artillery` and `anti_air`, tooling backlog "Validation"; no attested artillery honorifics; "Priešlėktuvinės Apsaugos Rinktinė" is not attested), `LIT_REG_04` (its one name, *Šarvuočių rinktinė*, moves to `LIT_ARM_02` key 101), `LIT_INF_BRG_01` (no attested brigades). Saved templates on a dropped tag fall back to default names; `-EditNames` warns about it.
- **Cavalry** stood as regiments in the interwar army, so `LIT_CAV_01` names regiments (selector "Cavalry Regiments", fallback `%d-asis kavalerijos pulkas`); no separate cavalry-division list.
- **Gating.** `LIT_GUA_01` `has_government = neutrality` (the monarchy focuses need neutrality; Lithuania starts neutral, so the list is open from 1936), `LIT_GV_01` `fascism`, `LIT_RED_01` `communism`, `LIT_LLK_01` `democratic`. `LIT_SAU_01` stays ungated with `militia`: the Riflemen's Union served every interwar government.
- **Exclusions.** No formation of 1941 is used: the June Uprising insurgent groups cannot be cleared one by one, and the TDA battalions, police battalions, Ypatingasis būrys, Saugumo policija and the self-defence battalions took part in the Holocaust. The 1944 Territorial Defence Force (Vietinė rinktinė) and the Iron Wolf's "Mirties batalionas" are left out. Soviet partisan brigades are left out (names unverified, and some units were involved in killings of civilians). The LLKS *Geležinio Vilko rinktinė* is left out so the Iron Wolf name stays with the fascist list; the 3rd Dragoons keep *Geležinio Vilko*, an official regiment name of 1922 that predates the 1927 organisation. The Soviet *Vytauto partizanų brigada* and the LLKS *Žalgirio* and *Birutės rinktinė* are left out, because those names already belong to other lists. Political leaders (Smetona, Voldemaras, Sniečkus) are not used as patrons.
- **Header.** `"newFile"` refuses an existing file, so the batch's first block removes the 16 old groups (dependents first), and step 2 sets the header with `-SetHeader` (tooling backlog entry added 2026-10-25).
- **Baltic program.** EST and LAT (queue items 2 and 3) should take the same suite layout and gating when they are planned.

## Vanilla findings (`-InspectVanilla LIT`)
| Vanilla | State | Action in the batch |
|---|---|---|
| `LIT_INF_01` "Infantry Division" | 20 entries `%s. Divizija`, fallback the same; scripted: focus `LIT_anti_communist_militia` (`lithuania.txt:664`) gives its template this group | plain variant, keys 1-40 written over |
| `LIT_CAV_01` | 10 entries `%s. Kavalerija Divizija` (wrong case) | cavalry regiments, keys 1-19 |
| `LIT_MOT_01` | 10 entries `%s. Motorizavimas Divizija` | plain variant, keys 1-25 |
| `LIT_MEC_01` | 10 entries `%s. Mechanizavimas Divizija` | plain variant, keys 1-25 |
| `LIT_ARM_01` | 10 entries `%s. Apsisarvavimas Divizija` | plain variant, keys 1-25 |
| `LIT_PAR_01` | 10 entries `%s. Gabenamas Divizija` | aviator names, keys 1-10 |
| `LIT_MAR_01` | 10 entries `%s. Juras Peizazas Divizija` | coastal names, keys 1-12 |
| `LIT_MNT_01` | 10 entries `%s. Divizija`, fallback `%s Bjeshkë Divizija`, linked to `LIT_INF_01` | hills and hillforts, keys 1-11; link kept |
| `LIT_GAR_01` | 20 entries `%s. Divizija`, linked to `LIT_INF_01` | garrison towns, keys 1-20, border units 101-106; link kept |

Every vanilla key is written over, so none of vanilla's texts stay in the game (the rehearsal audit printed no `Vanilla:` line). Vanilla has no nickname to carry over. Other focuses use foreign groups (`LAT_INF_01` for the Baltic Entente division, `POL_INF_01` for "Royal Guards Division", `SOV_INF_01` for Soviet volunteers and Red Riflemen); they are not touched.

## Group suite
Totals: 19 groups, 394 names (was 16 groups, 150 entries).

| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `LIT_INF_01` | Infantry Divisions | infantry | always | none | `%d-oji pėstininkų divizija` | 40 |
| `LIT_INF_02` | Infantry Divisions (Named) | infantry | always | `LIT_INF_01` | `%d-oji pėstininkų divizija` | 25 |
| `LIT_REG_01` | Infantry Regiments | infantry | always | none | `%d-asis pėstininkų pulkas` | 27 |
| `LIT_MOT_01` | Motorized Divisions | motorized | always | none | `%d-oji motorizuotoji pėstininkų divizija` | 25 |
| `LIT_MEC_01` | Mechanized Divisions | mechanized | always | `LIT_MOT_01` | `%d-oji mechanizuotoji pėstininkų divizija` | 25 |
| `LIT_MOT_02` | Motorized Divisions (Named) | motorized | always | `LIT_MOT_01` | `%d-oji motorizuotoji pėstininkų divizija` | 20 |
| `LIT_MEC_02` | Mechanized Divisions (Named) | mechanized | always | `LIT_MOT_01` | `%d-oji mechanizuotoji pėstininkų divizija` | 18 |
| `LIT_ARM_01` | Armored Divisions | light/medium/heavy/modern_armor | always | none | `%d-oji tankų divizija` | 25 |
| `LIT_ARM_02` | Armored Divisions (Named) | light/medium/heavy/modern_armor | always | `LIT_ARM_01` | `%d-oji tankų divizija` | 16 |
| `LIT_CAV_01` | Cavalry Regiments | cavalry | always | none | `%d-asis kavalerijos pulkas` | 19 |
| `LIT_PAR_01` | Paratrooper Divisions | paratrooper | always | none | `%d-oji oro desanto divizija` | 10 |
| `LIT_MAR_01` | Marine Divisions | marine | always | none | `%d-oji jūrų pėstininkų divizija` | 12 |
| `LIT_MNT_01` | Mountain Divisions | mountaineers | always | `LIT_INF_01` | `%d-oji kalnų pėstininkų divizija` | 11 |
| `LIT_GAR_01` | Garrisons & Border Guards | infantry | always | `LIT_INF_01` | `%d-oji įgulos divizija` | 26 |
| `LIT_SAU_01` | Riflemen's Union | militia, infantry | always | none | `%s šaulių rinktinė` | 24 |
| `LIT_GUA_01` | Royal Guard Divisions | infantry, cavalry, light/medium/heavy/modern_armor | `has_government = neutrality` | none | `%d-oji gvardijos divizija` | 22 |
| `LIT_GV_01` | Iron Wolf Divisions | infantry, militia | `has_government = fascism` | none | `%d-oji Geležinio Vilko divizija` | 20 |
| `LIT_RED_01` | Red Rifle Divisions | infantry, motorized | `has_government = communism` | none | `%d-oji lietuviškoji šaulių divizija` | 13 |
| `LIT_LLK_01` | Freedom Fighters | infantry, militia | `has_government = democratic` | none | `%d-oji laisvės kovotojų divizija` | 16 |

## Research record
- `inex-historical-researcher`, regular army: about 36 web calls. Sources: vle.lt ("Lietuvos ginkluotosios pajėgos 1918-1940", the regiment articles, "Husarų pulkas", "Ulonų pulkas", "Dragūnų pulkas", "Kauno tvirtovė", "Lietuvos šaulių sąjunga"), lituanistika.lt catalogue titles of the regiment histories, en.wikipedia ("List of Lithuanian Army units (1939)", "Lithuanian Wars of Independence", "12th Infantry Regiment (Lithuania)", "List of armoured trains"), Lituanistica and gs.elaba.lt articles on the Riflemen's Union rinktinės.
- `inex-historical-researcher`, ideology suites: about 37 web calls (most lt.wikipedia fetches failed). Sources: lt.wikipedia "Geležinis Vilkas (organizacija)" and "Lietuvos laisvės kovos sąjūdis"; vle.lt "leibgvardija", "dragūnai", "Birželio sukilimas", "Šešioliktoji lietuviškoji šaulių divizija", "Sovietiniai partizanai Lietuvoje", "apygarda", "Geležinio Vilko rinktinė"; en.wikipedia "Kingdom of Lithuania (1918)", "Army of the Grand Duchy of Lithuania", the Vanguard and Tatar regiment pages, "29th Rifle Corps", "Samogitian Regiment (Soviet Russia)", "Lithuanian Territorial Defense Force", "Lithuanian Freedom Army".
- Planner: one search on the 16th Division's name (vle.lt title "Šešioliktoji lietuviškoji šaulių divizija"); font glyph check in `gfx/fonts`.
- Verified: the three divisions and their 1940 county areas; the nine regiments' official names, garrisons and the 10th, 12th and 13th regiments; the three cavalry regiments; the armoured trains *Gediminas*, *Kęstutis*, *Algirdas* and the *Šarvuočių rinktinė*; the 1923 border guard division, brigade and regiments; 1939-40 garrison towns; ten numbered šaulių rinktinės and the county list; the Grand Duchy guard regiments (vle.lt forms); the Iron Wolf's county groups (Kauno, Panevėžio, Raseinių, Vilniaus krašto, Pagėgių, Šilutės, Klaipėdos); the 16th Rifle Division, the 29th Territorial Rifle Corps with the 179th and 184th Rifle Divisions, the 1919 *Lietuvos divizija*; the LLKS districts, the three regions of the 1949 declaration, the *Šarūno rinktinė*, the LLA and its *Vanagai* sector.
- Unverified and left out: Soviet partisan brigade names, Grand Duchy hussar, pancerni and Tatar banners, the 1934 coup units, interwar division HQs, artillery honorifics, a sea-riflemen unit, the Lithuanian form of the Klaipėda honorific of the 16th Division.

## Author confirmation
Extrapolated (plausible, not historical units or forms):
- `LIT_INF_02`: all 25 names (the interwar divisions had no names; keys 1-3 follow their 1940 county areas).
- `LIT_REG_01`: keys 11 and 14-27 (further dukes; heroes Antanas Juozapavičius, Povilas Lukšys, Silvestras Žukauskas, Kazys Ladiga).
- `LIT_MOT_02` (rivers), `LIT_MEC_02` (battles): all names.
- `LIT_ARM_02`: keys 4-15 (keys 1-3 are the armoured trains; key 101 is attested).
- `LIT_CAV_01`: keys 4-19 (hetmans, grand duchesses and queens, legendary princes).
- `LIT_PAR_01`, `LIT_MAR_01`, `LIT_MNT_01`: all nicknames.
- `LIT_GAR_01`: each garrison town as a division (the towns are attested garrisons); keys 101-106 are attested.
- `LIT_SAU_01`: keys 101-114 (counties attested, numbers unknown).
- `LIT_GUA_01`: keys 1-14 (guard divisions after kings); the Lithuanian forms of 102 (shortened with "LDK"), 105, 106-108 (106-108 translated from en.wikipedia titles).
- `LIT_GV_01`: keys 8-20 (further county groups).
- `LIT_RED_01`: "179-oji šaulių divizija" and "184-oji šaulių divizija" (Lithuanian forms), keys 202-209.
- `LIT_LLK_01`: "Vanagų rinktinė", "Lietuvos laisvės kovos sąjūdžio divizija".

## Kept on judgment
Expected `-Check LIT` flags after the batch (rehearsal on an export of HEAD, 2026-10-25: `FLAGS=4`):
- `NAME_LONG` on `LIT_REG_01`, `LIT_CAV_01` and `LIT_MEC_02`: the official interwar regiment names (up to 64 characters) and *4-oji mechanizuotoji pėstininkų divizija 'Mėlynieji Vandenys'*. Kept in full; the extrapolated names were shortened during planning.
- `UNGATED_POLITICAL` on `LIT_SAU_01`: raised by the `militia` type on an ungated group. The Riflemen's Union was a national paramilitary under every interwar government; kept ungated.
Any other flag is a stop condition.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames LIT -Batch docs\plans\2026-10-25-lithuania-namelist.md`. Expect 16 `Removed LIT_…` lines, then 19 `Added` lines, then `[WARN] Removed group tags: saved templates that used them fall back to default names` (expected) and no `[ERROR]`. The `Added` lines:
  - `Added LIT_INF_01: "Infantry Divisions" [infantry], 40 name(s)`
  - `Added LIT_INF_02: "Infantry Divisions (Named)" [infantry], 25 name(s), links LIT_INF_01`
  - `Added LIT_REG_01: "Infantry Regiments" [infantry], 27 name(s)`
  - `Added LIT_MOT_01: "Motorized Divisions" [motorized], 25 name(s)`
  - `Added LIT_MEC_01: "Mechanized Divisions" [mechanized], 25 name(s), links LIT_MOT_01`
  - `Added LIT_MOT_02: "Motorized Divisions (Named)" [motorized], 20 name(s), links LIT_MOT_01`
  - `Added LIT_MEC_02: "Mechanized Divisions (Named)" [mechanized], 18 name(s), links LIT_MOT_01`
  - `Added LIT_ARM_01: "Armored Divisions" [light_armor medium_armor heavy_armor modern_armor], 25 name(s)`
  - `Added LIT_ARM_02: "Armored Divisions (Named)" [light_armor medium_armor heavy_armor modern_armor], 16 name(s), links LIT_ARM_01`
  - `Added LIT_CAV_01: "Cavalry Regiments" [cavalry], 19 name(s)`
  - `Added LIT_PAR_01: "Paratrooper Divisions" [paratrooper], 10 name(s)`
  - `Added LIT_MAR_01: "Marine Divisions" [marine], 12 name(s)`
  - `Added LIT_MNT_01: "Mountain Divisions" [mountaineers], 11 name(s), links LIT_INF_01`
  - `Added LIT_GAR_01: "Garrisons & Border Guards" [infantry], 26 name(s), links LIT_INF_01`
  - `Added LIT_SAU_01: "Riflemen's Union" [militia infantry], 24 name(s)`
  - `Added LIT_GUA_01: "Royal Guard Divisions" [infantry cavalry light_armor medium_armor heavy_armor modern_armor], 22 name(s)`
  - `Added LIT_GV_01: "Iron Wolf Divisions" [infantry militia], 20 name(s)`
  - `Added LIT_RED_01: "Red Rifle Divisions" [infantry motorized], 13 name(s)`
  - `Added LIT_LLK_01: "Freedom Fighters" [infantry militia], 16 name(s)`
- [x] 2. Replace the old boilerplate header, in one PowerShell call (the backtick-n sequences are line breaks):

  ```powershell
  powershell -File .\build.ps1 -SetHeader LIT -HeaderText "Division template historical names system for Lithuania (LIT).`nImmersive Namelists Expanded (INEX)`nLithuanian names as the interwar army wrote them: an Arabic ordinal with a gendered definite ending (1-oji divizija, 3-iasis pulkas), lower-case common nouns, honorifics in the genitive before the noun. Nicknames stand in straight single quotes; the map font has no Lithuanian quotation marks. Riflemen's Union units keep their Roman numerals.`nOverrides all nine vanilla LIT groups (INF, CAV, MOT, MEC, ARM, PAR, MAR, MNT, GAR) and writes over every vanilla number."
  ```

  Expect `Header of zz_INEX_LIT_names_divisions.txt replaced`.
- [x] 3. Replace `wiki/Lithuania.md` with the whole page under "Docs payload" (Write tool; the fence lines are not part of the page).
- [x] 4. `powershell -File .\build.ps1 -SyncWiki LIT`. Expect `Lithuania.md: 0 row(s) updated` and `wiki/Home.md: LIT group count 13 -> 19`, with no `no row in wiki table` or `stale row` line. README and `wiki/_Sidebar.md` need no change (LIT is registered).
- [x] 5. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: make the two replacements under "Docs payload" with the Edit tool.
- [x] 6. `powershell -File .\build.ps1 -Check LIT`. Expect:
  - `Validate: OK` and the tests passing;
  - `AUDIT SUMMARY LIT: GROUPS=19 AUTHORED=272/394 FLAGS=4` and `Flags: NAME_LONG x3, UNGATED_POLITICAL x1` (see "Kept on judgment");
  - `Plan: no audit plan in progress for LIT` (expected);
  - `Diff vs HEAD: 25 group(s) changed, +394 -150 name(s)`;
  - `Check passed`.
- [x] 7. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 8. Ship, on the user's word:
  1. `ROADMAP.md`: replace `| 1 | LIT | Full re-author | M | authoring |` with `| 1 | ~~LIT~~ | Shipped 2026-10-25 | M | authoring |`, and replace `1. **LIT, Lithuania.** The weakest file in the mod,` with `1. ~~**LIT, Lithuania.**~~ Shipped 2026-10-25 as a full re-author (plan in docs/plans/archive/2026-10-25-lithuania-namelist.md). Before it, the weakest file in the mod,`.
  2. Move this plan to `docs/plans/archive/`.
  3. Commit everything with the message `Re-author Lithuania division namelists`.
  4. `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document the re-authored LIT division namelists"`.

## Docs payload
README, `wiki/_Sidebar.md`: no change. `wiki/Home.md`: the group count, by `-SyncWiki` in step 4.

### Workshop cross-reference row
In `WORKSHOP_DESCRIPTION_GUIDELINES.md`, replace the line

```
| `zz_INEX_LIT_names_divisions.txt` | Lithuania | `LIT` | Included (Grand Duke/Royal regiments, Iron Wolf cavalry, AA/Armored teams) |
```

with

```
| `zz_INEX_LIT_names_divisions.txt` | Lithuania | `LIT` | Included (Plain & Named infantry, motorized, mechanized and armored divisions, Grand Duke infantry regiments, hussar, uhlan & dragoon regiments, Riflemen's Union, garrisons & border guards, marines, paratroopers, mountain, Royal Guard, Iron Wolf, Red Rifle divisions, Freedom Fighters) |
```

### Workshop `[b]Lithuania[/b]` block
Replace the two bullets under `[b]Lithuania[/b]`,

```
- Grand Duke infantry regiments ([i]Gedimino[/i], [i]Vytauto[/i], [i]Algirdo[/i]) & [i]Geležinio Vilko[/i] cavalry
- Armored & anti-air teams, artillery regiments, border garrisons, and territorial units
```

with

```
- Plain & Named infantry, motorized, mechanized and armored divisions with regional, river, battle and ruler identities ([i]3-ioji pėstininkų Žemaitijos divizija[/i], [i]1-oji tankų divizija 'Gediminas'[/i]), and the interwar regiments with their Grand Duke patrons ([i]5-asis pėstininkų Didžiojo Lietuvos kunigaikščio Kęstučio pulkas[/i])
- Hussar, uhlan and dragoon regiments, Riflemen's Union rinktinės ([i]XX Klaipėdos rinktinė[/i]), garrisons and border guards, marines, paratroopers and mountain troops
- Ideology suites: Royal Guard (neutrality), Iron Wolf (fascist), Red Rifle divisions (communist) and Freedom Fighters (democratic)
```

The description grows to 12,640 of 17,000 characters (rehearsal).

### wiki/Lithuania.md (whole page)
````markdown
# Lithuania

**Country Tag:** `LIT` | **Source File:** [`zz_INEX_LIT_names_divisions.txt`](../common/units/names_divisions/zz_INEX_LIT_names_divisions.txt)

---

## Historical Overview

The Lithuanian Army (*Lietuvos kariuomenė*) of 1920-1940 had three infantry divisions (*1-oji*, *2-oji* and *3-ioji pėstininkų divizija*), nine infantry regiments named after the rulers of the Grand Duchy (*1-asis pėstininkų Lietuvos didžiojo kunigaikščio Gedimino pulkas* to *9-asis pėstininkų Lietuvos kunigaikščio Vytenio pulkas*), four artillery regiments, three cavalry regiments (the *Jonušas Radvila* Hussars, the *Birutė* Uhlans and the *Geležinis Vilkas* Dragoons), an armoured unit (*Šarvuočių rinktinė*) and the armoured trains *Gediminas*, *Kęstutis* and *Algirdas*. Behind it stood the Riflemen's Union (*Lietuvos šaulių sąjunga*), one *rinktinė* per county. The Army wrote the ordinal with a gendered ending (*1-oji divizija*, *3-iasis pulkas*) and put an honorific in the genitive before the noun.

The divisions themselves were never named, so the Named lists extend the regiments' pattern: regions, lands of the medieval Grand Duchy and county towns for infantry (*3-ioji pėstininkų Žemaitijos divizija*), and rivers, battles and rulers for the mobile and armoured lists, in the style of the modern brigades *Žemaitija* and *Žalgiris*. Nicknames stand in straight single quotes because the game's map font has no Lithuanian quotation marks.

INEX replaces all nine vanilla lists, whose fallbacks were broken Lithuanian (*Motorizavimas*, *Apsisarvavimas*), nonsense (*Juras Peizazas*, "sea landscape", for marines) or not Lithuanian at all (the Albanian *Bjeshkë* for mountain troops). Every vanilla number is written over, so none of vanilla's texts show.

Lithuania starts in 1936 under Smetona (`neutrality`). The Royal Guard (`neutrality`), Iron Wolf (`fascism`), Red Rifle (`communism`) and Freedom Fighter (`democratic`) lists are gated by government type only and never mix traditions.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `LIT_INF_01` | Infantry Divisions | infantry | `%d-oji pėstininkų divizija` |
| `LIT_INF_02` | Infantry Divisions (Named) | infantry | `%d-oji pėstininkų divizija` |
| `LIT_REG_01` | Infantry Regiments | infantry | `%d-asis pėstininkų pulkas` |
| `LIT_MOT_01` | Motorized Divisions | motorized | `%d-oji motorizuotoji pėstininkų divizija` |
| `LIT_MEC_01` | Mechanized Divisions | mechanized | `%d-oji mechanizuotoji pėstininkų divizija` |
| `LIT_MOT_02` | Motorized Divisions (Named) | motorized | `%d-oji motorizuotoji pėstininkų divizija` |
| `LIT_MEC_02` | Mechanized Divisions (Named) | mechanized | `%d-oji mechanizuotoji pėstininkų divizija` |
| `LIT_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d-oji tankų divizija` |
| `LIT_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d-oji tankų divizija` |
| `LIT_CAV_01` | Cavalry Regiments | cavalry | `%d-asis kavalerijos pulkas` |
| `LIT_PAR_01` | Paratrooper Divisions | paratrooper | `%d-oji oro desanto divizija` |
| `LIT_MAR_01` | Marine Divisions | marine | `%d-oji jūrų pėstininkų divizija` |
| `LIT_MNT_01` | Mountain Divisions | mountaineers | `%d-oji kalnų pėstininkų divizija` |
| `LIT_GAR_01` | Garrisons & Border Guards | infantry | `%d-oji įgulos divizija` |
| `LIT_SAU_01` | Riflemen's Union | militia, infantry | `%s šaulių rinktinė` |
| `LIT_GUA_01` | Royal Guard Divisions | infantry, cavalry, light_armor, medium_armor, heavy_armor, modern_armor | `%d-oji gvardijos divizija` |
| `LIT_GV_01` | Iron Wolf Divisions | infantry, militia | `%d-oji Geležinio Vilko divizija` |
| `LIT_RED_01` | Red Rifle Divisions | infantry, motorized | `%d-oji lietuviškoji šaulių divizija` |
| `LIT_LLK_01` | Freedom Fighters | infantry, militia | `%d-oji laisvės kovotojų divizija` |

> **Note:** Ordinals carry Lithuanian definite endings: feminine *-oji* for *divizija* and *rinktinė*, masculine *-asis* for *pulkas*, with *-ioji* and *-iasis* after a final 3 (*3-ioji*, *23-iasis*, but *13-oji*). The fallback cannot change the ending, so the plain lists write their numbers out (infantry to 40, the others to 25); a fallback number past them that ends in 3 shows *-oji*. The Riflemen's Union keeps the Roman numerals it used (*XX Klaipėdos rinktinė*).

---

## Group Details

### Field army

### `LIT_INF_01` — Infantry Divisions
Overrides vanilla LIT_INF_01 (the group the vanilla focus *Anti-Communist Militia* gives its template) as the plain variant. Keys 1-40 are written out, so vanilla's *I. Divizija* texts do not show and 23 and 33 take *-ioji*.

### `LIT_INF_02` — Infantry Divisions (Named)
Shares numbering with LIT_INF_01. The three interwar divisions by their 1940 areas (*1-oji pėstininkų Vilniaus divizija*, *2-oji ... Kauno*, *3-ioji ... Žemaitijos*), then the ethnographic regions (*Aukštaitija*, *Dzūkija*, *Suvalkija*, *Mažoji Lietuva*), the lands of the medieval Grand Duchy (*Deltuva*, *Nalšia*, *Upytė*, *Skalva*) and county towns. All names are extensions of the regiment pattern *10-asis pėstininkų Marijampolės pulkas*.

### `LIT_REG_01` — Infantry Regiments
The army's regiments with their official patrons: Gediminas, Algirdas, Vytautas, King Mindaugas, Kęstutis, Margis of Pilėnai, Butegeidis of Samogitia, Vaidotas of Kaunas and Vytenis (keys 1-9), the *Marijampolės*, *Kauno* and volunteer (*savanorių*) regiments of 1919-1924 (keys 10, 12, 13). Keys 11 and 14-27 extend the pattern with further dukes and heroes of the independence wars (*Antanas Juozapavičius*, *Povilas Lukšys*).

### Motorized, mechanized and armour

### `LIT_MOT_01` — Motorized Divisions
Overrides vanilla LIT_MOT_01 as the plain variant and anchors the numbering of the four mobile groups.

### `LIT_MEC_01` — Mechanized Divisions
Overrides vanilla LIT_MEC_01 as the plain variant; shares numbering with LIT_MOT_01.

### `LIT_MOT_02` — Motorized Divisions (Named)
Rivers, after the modern brigades *Žemaitija* and *Aukštaitija*: *1-oji motorizuotoji pėstininkų divizija 'Nemunas'*, *'Neris'*, *'Nevėžis'*, *'Dubysa'*. Shares numbering with LIT_MOT_01.

### `LIT_MEC_02` — Mechanized Divisions (Named)
Battles of the Grand Duchy (*'Saulė'*, *'Durbė'*, *'Žalgiris'*, *'Orša'*) and of the 1919-1920 wars (*'Giedraičiai'*, *'Širvintos'*, *'Radviliškis'*). Shares numbering with LIT_MOT_01.

### `LIT_ARM_01` — Armored Divisions
Overrides vanilla LIT_ARM_01 as the plain variant.

### `LIT_ARM_02` — Armored Divisions (Named)
Named after the armoured trains of 1920-1935 (*'Gediminas'*, *'Kęstutis'*, *'Algirdas'*), further rulers and thunder and lightning (*'Perkūnas'*, *'Žaibas'*), with the interwar *Šarvuočių rinktinė*. Shares numbering with LIT_ARM_01.

### Cavalry

### `LIT_CAV_01` — Cavalry Regiments
Overrides vanilla LIT_CAV_01. The three interwar regiments (*1-asis husarų kunigaikščio Jonušo Radvilos pulkas*, *2-asis ulonų Lietuvos didžiosios kunigaikštienės Birutės pulkas*, *3-iasis dragūnų Geležinio Vilko pulkas*), then extrapolated hussars after the Grand Hetmans, uhlans after grand duchesses and queens, and dragoons after the legendary princes of the chronicles.

### Specialist troops

### `LIT_PAR_01` — Paratrooper Divisions
Lithuania had no airborne troops; the list honours its aviators and aircraft: *'Lituanica'*, *'Steponas Darius'*, *'Stasys Girėnas'*, *'Feliksas Vaitkus'*, *'ANBO'*.

### `LIT_MAR_01` — Marine Divisions
Places of the Klaipėda coast and the Curonian Spit: *'Klaipėda'*, *'Palanga'*, *'Nida'*, *'Juodkrantė'*, *'Kuršių nerija'*.

### `LIT_MNT_01` — Mountain Divisions
Lithuania has no mountains: the highest hills and the great hillforts (*'Aukštojas'*, *'Medvėgalis'*, *'Šatrija'*, *'Rambynas'*, *'Kernavė'*, *'Apuolė'*). Shares numbering with LIT_INF_01, as vanilla does.

### Garrisons and territorial defence

### `LIT_GAR_01` — Garrisons & Border Guards
The garrison towns of the interwar army, from the Kaunas Fortress (*Kauno tvirtovės įgula*) to Ukmergė, Panevėžys and Tauragė, and the border guard division, brigade and regiments of 1919-1924. Shares numbering with LIT_INF_01, as vanilla does.

### `LIT_SAU_01` — Riflemen's Union
The county *rinktinės* of the *Lietuvos šaulių sąjunga* in the Union's own form: *II Utenos*, *XIV Marijampolės*, *XX Klaipėdos* (dissolved in 1939), the railwaymen's *XXII Geležinkelių* and the *XXIII Vilniaus* formed in 1939, then the counties whose numbers are not known. The fallback fills the free Roman numbers.

### Ideology suites

### `LIT_GUA_01` — Royal Guard Divisions (neutrality)
For the monarchy path (the vanilla focus *Institute Royal Guards*): guard divisions after the 1918 king Mindaugas II and the kings of the union with Poland (*Jogaila*, *Žygimantas Augustas*, *Steponas Batoras*), and the guard, vanguard and Tatar regiments of the Grand Duchy (*LDK pėstininkų gvardijos regimentas*, *7-asis Lietuvos totorių pulkas*). The division names are extensions.

### `LIT_GV_01` — Iron Wolf Divisions (fascism)
Voldemaras's Iron Wolf (*Geležinis Vilkas*, 1927-1930), by its county groups: Kaunas, Panevėžys, Raseiniai, the Vilnius region, Pagėgiai, Šilutė and Klaipėda are attested, the rest are extensions. No formation of 1941 is used.

### `LIT_RED_01` — Red Rifle Divisions (communism)
The 16th Lithuanian Rifle Division (*16-oji lietuviškoji šaulių divizija*, Klaipėda honorific of 1945), the 29th Territorial Rifle Corps of 1940-1941 with its 179th and 184th Rifle Divisions, each on its own number, the Lithuanian Division of 1919, and extended Red divisions and patrons (*Vinco Kapsuko divizija*).

### `LIT_LLK_01` — Freedom Fighters (democratic)
The armed resistance of the Union of Lithuanian Freedom Fighters (LLKS), whose 1949 declaration set a democratic republic as its aim: its districts (*Vyčio*, *Tauro*, *Dainavos*, *Žemaičių apygarda*), the three regions of the declaration, the *Šarūno rinktinė* and the Lithuanian Liberty Army.
````

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader` on all 394 names (Lithuanian), 2026-10-25:
- `LIT_CAV_01` key 16 *16-asis husarų etmono Leono Sapiegos pulkas*: Leonas Sapiega was Grand Chancellor, not a hetman. Fixed in the batch: *16-asis husarų etmono Kazimiero Jono Sapiegos pulkas* (Kazimieras Jonas Sapiega, Grand Hetman of Lithuania).
- `LIT_RED_01` key 16 *16-oji lietuviškoji Klaipėdos šaulių divizija* (unsure about the honorific's word order): no source settled the order, so the batch uses the attested name *16-oji lietuviškoji šaulių divizija* (vle.lt title) and the Klaipėda honorific is mentioned only in the group comment and the wiki.
No other issues: spelling, diacritics, genitives, ordinal endings and gating confirmed.

## Outcome
Date: 2026-10-25.

`-Check LIT` summary: `AUDIT SUMMARY LIT: GROUPS=19 AUTHORED=272/394 FLAGS=4`, flags `NAME_LONG x3` and `UNGATED_POLITICAL x1` (both listed under "Kept on judgment"). Validate OK, tests 475 passed, 0 failed, `Diff vs HEAD: 25 group(s) changed, +394 -150 name(s)`, `Check passed`.

Deviations: none. Steps 1 to 7 ran as written; the batch, header, wiki page, sync and workshop edits produced the expected output.

## Edit batch
Applied by `build.ps1 -EditNames LIT -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back. The first block removes the 16 groups of the old file, dependents first.

```json batch
[
{"group": "LIT_MNT_01", "removeGroup": true},
{"group": "LIT_GAR_01", "removeGroup": true},
{"group": "LIT_INF_01", "removeGroup": true},
{"group": "LIT_CAV_01", "removeGroup": true},
{"group": "LIT_MOT_01", "removeGroup": true},
{"group": "LIT_MEC_01", "removeGroup": true},
{"group": "LIT_ARM_01", "removeGroup": true},
{"group": "LIT_PAR_01", "removeGroup": true},
{"group": "LIT_MAR_01", "removeGroup": true},
{"group": "LIT_GAR_02", "removeGroup": true},
{"group": "LIT_REG_01", "removeGroup": true},
{"group": "LIT_REG_02", "removeGroup": true},
{"group": "LIT_REG_03", "removeGroup": true},
{"group": "LIT_REG_04", "removeGroup": true},
{"group": "LIT_AA_01", "removeGroup": true},
{"group": "LIT_INF_BRG_01", "removeGroup": true}
]
```

```json batch
{"addGroup": true, "group": "LIT_INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "%d-oji pėstininkų divizija", "comment": "# ===== Field army =====\n\nOverrides vanilla LIT_INF_01 as the plain (un-nicknamed) variant. Keys 1-40 are written so that vanilla's '%s. Divizija' texts (keys 1-20) do not show and 23 and 33 take the -ioji ending.",
  "add": [
  "# Plain numbering (keys 1-40)",
  "1=1-oji pėstininkų divizija",
  "2=2-oji pėstininkų divizija",
  "3=3-ioji pėstininkų divizija",
  "4=4-oji pėstininkų divizija",
  "5=5-oji pėstininkų divizija",
  "6=6-oji pėstininkų divizija",
  "7=7-oji pėstininkų divizija",
  "8=8-oji pėstininkų divizija",
  "9=9-oji pėstininkų divizija",
  "10=10-oji pėstininkų divizija",
  "11=11-oji pėstininkų divizija",
  "12=12-oji pėstininkų divizija",
  "13=13-oji pėstininkų divizija",
  "14=14-oji pėstininkų divizija",
  "15=15-oji pėstininkų divizija",
  "16=16-oji pėstininkų divizija",
  "17=17-oji pėstininkų divizija",
  "18=18-oji pėstininkų divizija",
  "19=19-oji pėstininkų divizija",
  "20=20-oji pėstininkų divizija",
  "21=21-oji pėstininkų divizija",
  "22=22-oji pėstininkų divizija",
  "23=23-ioji pėstininkų divizija",
  "24=24-oji pėstininkų divizija",
  "25=25-oji pėstininkų divizija",
  "26=26-oji pėstininkų divizija",
  "27=27-oji pėstininkų divizija",
  "28=28-oji pėstininkų divizija",
  "29=29-oji pėstininkų divizija",
  "30=30-oji pėstininkų divizija",
  "31=31-oji pėstininkų divizija",
  "32=32-oji pėstininkų divizija",
  "33=33-ioji pėstininkų divizija",
  "34=34-oji pėstininkų divizija",
  "35=35-oji pėstininkų divizija",
  "36=36-oji pėstininkų divizija",
  "37=37-oji pėstininkų divizija",
  "38=38-oji pėstininkų divizija",
  "39=39-oji pėstininkų divizija",
  "40=40-oji pėstininkų divizija"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_INF_02", "selector": "Infantry Divisions (Named)", "addType": "infantry", "fallback": "%d-oji pėstininkų divizija", "link": "LIT_INF_01", "comment": "Named variant of LIT_INF_01: a regional identity in the genitive before the noun, as in the interwar 10-asis pėstininkų Marijampolės pulkas.",
  "add": [
  "# The three interwar divisions, by their 1940 areas",
  "1=1-oji pėstininkų Vilniaus divizija",
  "2=2-oji pėstininkų Kauno divizija",
  "3=3-ioji pėstininkų Žemaitijos divizija",
  "# Ethnographic regions and cities",
  "4=4-oji pėstininkų Aukštaitijos divizija",
  "5=5-oji pėstininkų Dzūkijos divizija",
  "6=6-oji pėstininkų Suvalkijos divizija",
  "7=7-oji pėstininkų Klaipėdos divizija",
  "8=8-oji pėstininkų Šiaulių divizija",
  "9=9-oji pėstininkų Panevėžio divizija",
  "10=10-oji pėstininkų Mažosios Lietuvos divizija",
  "11=11-oji pėstininkų Vilnijos divizija",
  "12=12-oji pėstininkų Sėlos divizija",
  "# Lands of the medieval Grand Duchy",
  "13=13-oji pėstininkų Deltuvos divizija",
  "14=14-oji pėstininkų Nalšios divizija",
  "15=15-oji pėstininkų Upytės divizija",
  "16=16-oji pėstininkų Karšuvos divizija",
  "17=17-oji pėstininkų Medininkų divizija",
  "18=18-oji pėstininkų Nadruvos divizija",
  "19=19-oji pėstininkų Skalvos divizija",
  "20=20-oji pėstininkų Jotvos divizija",
  "# County towns",
  "21=21-oji pėstininkų Alytaus divizija",
  "22=22-oji pėstininkų Utenos divizija",
  "23=23-ioji pėstininkų Telšių divizija",
  "24=24-oji pėstininkų Tauragės divizija",
  "25=25-oji pėstininkų Ukmergės divizija"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_REG_01", "selector": "Infantry Regiments", "addType": "infantry", "fallback": "%d-asis pėstininkų pulkas", "comment": "Regiment-sized templates. Keys 1-10, 12 and 13 are the army's own regiments with their official patrons (the 5th is Kęstutis); 11 and 14-27 are extrapolated on the same pattern.",
  "add": [
  "# Peacetime and 1919-1924 regiments",
  "1=1-asis pėstininkų Lietuvos didžiojo kunigaikščio Gedimino pulkas",
  "2=2-asis pėstininkų Didžiojo Lietuvos kunigaikščio Algirdo pulkas",
  "3=3-iasis pėstininkų Didžiojo Lietuvos kunigaikščio Vytauto pulkas",
  "4=4-asis pėstininkų Lietuvos karaliaus Mindaugo pulkas",
  "5=5-asis pėstininkų Didžiojo Lietuvos kunigaikščio Kęstučio pulkas",
  "6=6-asis pėstininkų Pilėnų kunigaikščio Margio pulkas",
  "7=7-asis pėstininkų Žemaičių kunigaikščio Butegeidžio pulkas",
  "8=8-asis pėstininkų Kauno kunigaikščio Vaidoto pulkas",
  "9=9-asis pėstininkų Lietuvos kunigaikščio Vytenio pulkas",
  "10=10-asis pėstininkų Marijampolės pulkas",
  "11=11-asis pėstininkų Lietuvos kunigaikščio Traidenio pulkas",
  "12=12-asis Kauno pėstininkų pulkas",
  "13=13-asis pėstininkų savanorių pulkas",
  "# Extrapolated: dukes of the Grand Duchy",
  "14=14-asis pėstininkų Lietuvos kunigaikščio Pukuvero pulkas",
  "15=15-asis pėstininkų Lietuvos kunigaikščio Jaunučio pulkas",
  "16=16-asis pėstininkų Žemaičių kunigaikščio Vykinto pulkas",
  "17=17-asis pėstininkų Lietuvos kunigaikščio Živinbudo pulkas",
  "18=18-asis pėstininkų Nalšios kunigaikščio Daumanto pulkas",
  "19=19-asis pėstininkų Lietuvos kunigaikščio Narimanto pulkas",
  "20=20-asis pėstininkų Lietuvos kunigaikščio Liubarto pulkas",
  "21=21-asis pėstininkų kunigaikščio Žygimanto Kęstutaičio pulkas",
  "22=22-asis pėstininkų Lietuvos kunigaikščio Skirgailos pulkas",
  "23=23-iasis pėstininkų kunigaikščio Švitrigailos pulkas",
  "# Extrapolated: heroes of the independence wars",
  "24=24-asis pėstininkų karininko Antano Juozapavičiaus pulkas",
  "25=25-asis pėstininkų savanorio Povilo Lukšio pulkas",
  "26=26-asis pėstininkų generolo Silvestro Žukausko pulkas",
  "27=27-asis pėstininkų generolo Kazio Ladigos pulkas"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_MOT_01", "selector": "Motorized Divisions", "addType": "motorized", "fallback": "%d-oji motorizuotoji pėstininkų divizija", "comment": "# ===== Motorized and mechanized =====\n\nOverrides vanilla LIT_MOT_01 as the plain variant and anchors the mobile numbering. Keys 1-25 replace vanilla's 'Motorizavimas Divizija' texts (keys 1-10).",
  "add": [
  "1=1-oji motorizuotoji pėstininkų divizija",
  "2=2-oji motorizuotoji pėstininkų divizija",
  "3=3-ioji motorizuotoji pėstininkų divizija",
  "4=4-oji motorizuotoji pėstininkų divizija",
  "5=5-oji motorizuotoji pėstininkų divizija",
  "6=6-oji motorizuotoji pėstininkų divizija",
  "7=7-oji motorizuotoji pėstininkų divizija",
  "8=8-oji motorizuotoji pėstininkų divizija",
  "9=9-oji motorizuotoji pėstininkų divizija",
  "10=10-oji motorizuotoji pėstininkų divizija",
  "11=11-oji motorizuotoji pėstininkų divizija",
  "12=12-oji motorizuotoji pėstininkų divizija",
  "13=13-oji motorizuotoji pėstininkų divizija",
  "14=14-oji motorizuotoji pėstininkų divizija",
  "15=15-oji motorizuotoji pėstininkų divizija",
  "16=16-oji motorizuotoji pėstininkų divizija",
  "17=17-oji motorizuotoji pėstininkų divizija",
  "18=18-oji motorizuotoji pėstininkų divizija",
  "19=19-oji motorizuotoji pėstininkų divizija",
  "20=20-oji motorizuotoji pėstininkų divizija",
  "21=21-oji motorizuotoji pėstininkų divizija",
  "22=22-oji motorizuotoji pėstininkų divizija",
  "23=23-ioji motorizuotoji pėstininkų divizija",
  "24=24-oji motorizuotoji pėstininkų divizija",
  "25=25-oji motorizuotoji pėstininkų divizija"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_MEC_01", "selector": "Mechanized Divisions", "addType": "mechanized", "fallback": "%d-oji mechanizuotoji pėstininkų divizija", "link": "LIT_MOT_01", "comment": "Overrides vanilla LIT_MEC_01 as the plain variant. Keys 1-25 replace vanilla's 'Mechanizavimas Divizija' texts (keys 1-10).",
  "add": [
  "1=1-oji mechanizuotoji pėstininkų divizija",
  "2=2-oji mechanizuotoji pėstininkų divizija",
  "3=3-ioji mechanizuotoji pėstininkų divizija",
  "4=4-oji mechanizuotoji pėstininkų divizija",
  "5=5-oji mechanizuotoji pėstininkų divizija",
  "6=6-oji mechanizuotoji pėstininkų divizija",
  "7=7-oji mechanizuotoji pėstininkų divizija",
  "8=8-oji mechanizuotoji pėstininkų divizija",
  "9=9-oji mechanizuotoji pėstininkų divizija",
  "10=10-oji mechanizuotoji pėstininkų divizija",
  "11=11-oji mechanizuotoji pėstininkų divizija",
  "12=12-oji mechanizuotoji pėstininkų divizija",
  "13=13-oji mechanizuotoji pėstininkų divizija",
  "14=14-oji mechanizuotoji pėstininkų divizija",
  "15=15-oji mechanizuotoji pėstininkų divizija",
  "16=16-oji mechanizuotoji pėstininkų divizija",
  "17=17-oji mechanizuotoji pėstininkų divizija",
  "18=18-oji mechanizuotoji pėstininkų divizija",
  "19=19-oji mechanizuotoji pėstininkų divizija",
  "20=20-oji mechanizuotoji pėstininkų divizija",
  "21=21-oji mechanizuotoji pėstininkų divizija",
  "22=22-oji mechanizuotoji pėstininkų divizija",
  "23=23-ioji mechanizuotoji pėstininkų divizija",
  "24=24-oji mechanizuotoji pėstininkų divizija",
  "25=25-oji mechanizuotoji pėstininkų divizija"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_MOT_02", "selector": "Motorized Divisions (Named)", "addType": "motorized", "fallback": "%d-oji motorizuotoji pėstininkų divizija", "link": "LIT_MOT_01", "comment": "Named variant: rivers, on the pattern of the modern brigades 'Žemaitija' and 'Aukštaitija'.",
  "add": [
  "1=1-oji motorizuotoji pėstininkų divizija 'Nemunas'",
  "2=2-oji motorizuotoji pėstininkų divizija 'Neris'",
  "3=3-ioji motorizuotoji pėstininkų divizija 'Nevėžis'",
  "4=4-oji motorizuotoji pėstininkų divizija 'Dubysa'",
  "5=5-oji motorizuotoji pėstininkų divizija 'Šešupė'",
  "6=6-oji motorizuotoji pėstininkų divizija 'Venta'",
  "7=7-oji motorizuotoji pėstininkų divizija 'Minija'",
  "8=8-oji motorizuotoji pėstininkų divizija 'Merkys'",
  "9=9-oji motorizuotoji pėstininkų divizija 'Šventoji'",
  "10=10-oji motorizuotoji pėstininkų divizija 'Jūra'",
  "11=11-oji motorizuotoji pėstininkų divizija 'Mūša'",
  "12=12-oji motorizuotoji pėstininkų divizija 'Žeimena'",
  "13=13-oji motorizuotoji pėstininkų divizija 'Lėvuo'",
  "14=14-oji motorizuotoji pėstininkų divizija 'Šušvė'",
  "15=15-oji motorizuotoji pėstininkų divizija 'Mituva'",
  "16=16-oji motorizuotoji pėstininkų divizija 'Verknė'",
  "17=17-oji motorizuotoji pėstininkų divizija 'Akmena'",
  "18=18-oji motorizuotoji pėstininkų divizija 'Bartuva'",
  "19=19-oji motorizuotoji pėstininkų divizija 'Virvytė'",
  "20=20-oji motorizuotoji pėstininkų divizija 'Ūla'"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_MEC_02", "selector": "Mechanized Divisions (Named)", "addType": "mechanized", "fallback": "%d-oji mechanizuotoji pėstininkų divizija", "link": "LIT_MOT_01", "comment": "Named variant: battles, on the pattern of the modern brigade 'Žalgiris'.",
  "add": [
  "# Battles of the Grand Duchy",
  "1=1-oji mechanizuotoji pėstininkų divizija 'Saulė'",
  "2=2-oji mechanizuotoji pėstininkų divizija 'Durbė'",
  "3=3-ioji mechanizuotoji pėstininkų divizija 'Pilėnai'",
  "4=4-oji mechanizuotoji pėstininkų divizija 'Mėlynieji Vandenys'",
  "5=5-oji mechanizuotoji pėstininkų divizija 'Žalgiris'",
  "6=6-oji mechanizuotoji pėstininkų divizija 'Orša'",
  "7=7-oji mechanizuotoji pėstininkų divizija 'Salaspilis'",
  "8=8-oji mechanizuotoji pėstininkų divizija 'Klušinas'",
  "# Battles of the independence wars, 1919-1920",
  "9=9-oji mechanizuotoji pėstininkų divizija 'Giedraičiai'",
  "10=10-oji mechanizuotoji pėstininkų divizija 'Širvintos'",
  "11=11-oji mechanizuotoji pėstininkų divizija 'Radviliškis'",
  "12=12-oji mechanizuotoji pėstininkų divizija 'Seda'",
  "13=13-oji mechanizuotoji pėstininkų divizija 'Jieznas'",
  "14=14-oji mechanizuotoji pėstininkų divizija 'Griva'",
  "15=15-oji mechanizuotoji pėstininkų divizija 'Rykantai'",
  "16=16-oji mechanizuotoji pėstininkų divizija 'Luokė'",
  "17=17-oji mechanizuotoji pėstininkų divizija 'Daugpilis'",
  "18=18-oji mechanizuotoji pėstininkų divizija 'Musninkai'"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_ARM_01", "selector": "Armored Divisions", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"], "fallback": "%d-oji tankų divizija", "comment": "# ===== Armour =====\n\nOverrides vanilla LIT_ARM_01 as the plain variant. Keys 1-25 replace vanilla's 'Apsisarvavimas Divizija' texts (keys 1-10).",
  "add": [
  "1=1-oji tankų divizija",
  "2=2-oji tankų divizija",
  "3=3-ioji tankų divizija",
  "4=4-oji tankų divizija",
  "5=5-oji tankų divizija",
  "6=6-oji tankų divizija",
  "7=7-oji tankų divizija",
  "8=8-oji tankų divizija",
  "9=9-oji tankų divizija",
  "10=10-oji tankų divizija",
  "11=11-oji tankų divizija",
  "12=12-oji tankų divizija",
  "13=13-oji tankų divizija",
  "14=14-oji tankų divizija",
  "15=15-oji tankų divizija",
  "16=16-oji tankų divizija",
  "17=17-oji tankų divizija",
  "18=18-oji tankų divizija",
  "19=19-oji tankų divizija",
  "20=20-oji tankų divizija",
  "21=21-oji tankų divizija",
  "22=22-oji tankų divizija",
  "23=23-ioji tankų divizija",
  "24=24-oji tankų divizija",
  "25=25-oji tankų divizija"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_ARM_02", "selector": "Armored Divisions (Named)", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"], "fallback": "%d-oji tankų divizija", "link": "LIT_ARM_01", "comment": "Named variant: Grand Dukes in the nominative, after the armoured trains Gediminas, Kęstutis and Algirdas.",
  "add": [
  "# Armoured trains of 1920-1935, then rulers",
  "1=1-oji tankų divizija 'Gediminas'",
  "2=2-oji tankų divizija 'Kęstutis'",
  "3=3-ioji tankų divizija 'Algirdas'",
  "4=4-oji tankų divizija 'Vytautas'",
  "5=5-oji tankų divizija 'Mindaugas'",
  "6=6-oji tankų divizija 'Treniota'",
  "7=7-oji tankų divizija 'Vaišvilkas'",
  "8=8-oji tankų divizija 'Tautvila'",
  "9=9-oji tankų divizija 'Lengvenis'",
  "10=10-oji tankų divizija 'Kaributas'",
  "11=11-oji tankų divizija 'Vygantas'",
  "# Myth and weather",
  "12=12-oji tankų divizija 'Perkūnas'",
  "13=13-oji tankų divizija 'Slibinas'",
  "14=14-oji tankų divizija 'Žaibas'",
  "15=15-oji tankų divizija 'Griausmas'",
  "# Interwar armoured unit",
  "101=Šarvuočių rinktinė"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_CAV_01", "selector": "Cavalry Regiments", "addType": "cavalry", "fallback": "%d-asis kavalerijos pulkas", "comment": "# ===== Cavalry =====\n\nOverrides vanilla LIT_CAV_01 ('Kavalerija Divizija', keys 1-10). The army's cavalry stood as regiments, so the list names regiments.",
  "add": [
  "# The three interwar regiments",
  "1=1-asis husarų kunigaikščio Jonušo Radvilos pulkas",
  "2=2-asis ulonų Lietuvos didžiosios kunigaikštienės Birutės pulkas",
  "3=3-iasis dragūnų Geležinio Vilko pulkas",
  "# Extrapolated: hussars after hetmans, uhlans after grand duchesses and queens, dragoons after legendary princes",
  "4=4-asis husarų etmono Konstantino Ostrogiškio pulkas",
  "5=5-asis ulonų kunigaikštienės Onos Vytautienės pulkas",
  "6=6-asis dragūnų kunigaikščio Palemono pulkas",
  "7=7-asis husarų etmono Jurgio Radvilos pulkas",
  "8=8-asis ulonų kunigaikštienės Julijonos pulkas",
  "9=9-asis dragūnų kunigaikščio Kūno pulkas",
  "10=10-asis husarų etmono Kristupo Radvilos Perkūno pulkas",
  "11=11-asis ulonų karalienės Aldonos pulkas",
  "12=12-asis dragūnų kunigaikščio Šventaragio pulkas",
  "13=13-asis husarų etmono Jono Karolio Chodkevičiaus pulkas",
  "14=14-asis ulonų karalienės Barboros Radvilaitės pulkas",
  "15=15-asis dragūnų kunigaikščio Kukovaičio pulkas",
  "16=16-asis husarų etmono Kazimiero Jono Sapiegos pulkas",
  "17=17-asis ulonų kunigaikštytės Živilės pulkas",
  "18=18-asis dragūnų kunigaikščio Ringaudo pulkas",
  "19=19-asis husarų etmono Mykolo Kazimiero Paco pulkas"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_PAR_01", "selector": "Paratrooper Divisions", "addType": "paratrooper", "fallback": "%d-oji oro desanto divizija", "comment": "# ===== Specialist troops =====\n\nOverrides vanilla LIT_PAR_01 ('Gabenamas Divizija', keys 1-10). Lithuania had no airborne troops; the list honours its aviators and aircraft.",
  "add": [
  "1=1-oji oro desanto divizija 'Lituanica'",
  "2=2-oji oro desanto divizija 'Lituanica II'",
  "3=3-ioji oro desanto divizija 'Steponas Darius'",
  "4=4-oji oro desanto divizija 'Stasys Girėnas'",
  "5=5-oji oro desanto divizija 'Feliksas Vaitkus'",
  "6=6-oji oro desanto divizija 'Antanas Gustaitis'",
  "7=7-oji oro desanto divizija 'ANBO'",
  "8=8-oji oro desanto divizija 'Aitvaras'",
  "9=9-oji oro desanto divizija 'Jurgis Dobkevičius'",
  "10=10-oji oro desanto divizija 'Romualdas Marcinkus'"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_MAR_01", "selector": "Marine Divisions", "addType": "marine", "fallback": "%d-oji jūrų pėstininkų divizija", "comment": "Overrides vanilla LIT_MAR_01 ('Juras Peizazas Divizija', keys 1-10) with places of the Klaipėda coast and the Curonian Spit.",
  "add": [
  "1=1-oji jūrų pėstininkų divizija 'Klaipėda'",
  "2=2-oji jūrų pėstininkų divizija 'Palanga'",
  "3=3-ioji jūrų pėstininkų divizija 'Nida'",
  "4=4-oji jūrų pėstininkų divizija 'Juodkrantė'",
  "5=5-oji jūrų pėstininkų divizija 'Neringa'",
  "6=6-oji jūrų pėstininkų divizija 'Smiltynė'",
  "7=7-oji jūrų pėstininkų divizija 'Melnragė'",
  "8=8-oji jūrų pėstininkų divizija 'Giruliai'",
  "9=9-oji jūrų pėstininkų divizija 'Karklė'",
  "10=10-oji jūrų pėstininkų divizija 'Rusnė'",
  "11=11-oji jūrų pėstininkų divizija 'Ventė'",
  "12=12-oji jūrų pėstininkų divizija 'Kuršių nerija'"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_MNT_01", "selector": "Mountain Divisions", "addType": "mountaineers", "fallback": "%d-oji kalnų pėstininkų divizija", "link": "LIT_INF_01", "comment": "Overrides vanilla LIT_MNT_01 (Albanian 'Bjeshkë' fallback, keys 1-10) with Lithuania's highest hills and hillforts. Vanilla links it to LIT_INF_01, and the link stays [NAM-020].",
  "add": [
  "1=1-oji kalnų pėstininkų divizija 'Aukštojas'",
  "2=2-oji kalnų pėstininkų divizija 'Juozapinė'",
  "3=3-ioji kalnų pėstininkų divizija 'Medvėgalis'",
  "4=4-oji kalnų pėstininkų divizija 'Šatrija'",
  "5=5-oji kalnų pėstininkų divizija 'Girgždūtė'",
  "6=6-oji kalnų pėstininkų divizija 'Rambynas'",
  "7=7-oji kalnų pėstininkų divizija 'Gedimino kalnas'",
  "8=8-oji kalnų pėstininkų divizija 'Kernavė'",
  "9=9-oji kalnų pėstininkų divizija 'Apuolė'",
  "10=10-oji kalnų pėstininkų divizija 'Impiltis'",
  "11=11-oji kalnų pėstininkų divizija 'Kruopinė'"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_GAR_01", "selector": "Garrisons & Border Guards", "addType": "infantry", "fallback": "%d-oji įgulos divizija", "link": "LIT_INF_01", "comment": "# ===== Garrisons and territorial defence =====\n\nOverrides vanilla LIT_GAR_01 ('%s. Divizija', keys 1-20). Vanilla links it to LIT_INF_01, and the link stays [NAM-020].",
  "add": [
  "# Garrison towns of the interwar army",
  "1=Kauno tvirtovės įgula",
  "2=Vilniaus įgula",
  "3=Klaipėdos įgula",
  "4=Šiaulių įgula",
  "5=Panevėžio įgula",
  "6=Ukmergės įgula",
  "7=Kėdainių įgula",
  "8=Raseinių įgula",
  "9=Tauragės įgula",
  "10=Telšių įgula",
  "11=Plungės įgula",
  "12=Marijampolės įgula",
  "13=Vilkaviškio įgula",
  "14=Alytaus įgula",
  "15=Radviliškio įgula",
  "16=Prienų įgula",
  "17=Kupiškio įgula",
  "18=Jonavos įgula",
  "19=Varnių įgula",
  "20=Šančių įgula",
  "# Border guard formations, 1919-1924",
  "101=Pasienio sargybų divizija",
  "102=Pasienio apsaugos brigada",
  "103=1-asis parubežinis pulkas",
  "104=2-asis pasienio pulkas",
  "105=3-iasis pasienio pulkas",
  "106=4-asis pasienio pulkas"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_SAU_01", "selector": "Riflemen's Union", "addType": ["militia", "infantry"], "fallback": "%s šaulių rinktinė", "comment": "Lithuanian Riflemen's Union (Lietuvos šaulių sąjunga): one rinktinė per county, numbered in Roman numerals and written as the Union wrote them (XX Klaipėdos rinktinė). Unnumbered rinktinės sit on keys 101 and up, so the fallback fills the free numbers.",
  "add": [
  "# Rinktinės known by their numbers",
  "2=II Utenos rinktinė",
  "5=V Trakų rinktinė",
  "12=XII Panevėžio rinktinė",
  "13=XIII Mažeikių rinktinė",
  "14=XIV Marijampolės rinktinė",
  "15=XV Kretingos rinktinė",
  "19=XIX Alytaus rinktinė",
  "20=XX Klaipėdos rinktinė",
  "22=XXII Geležinkelių rinktinė",
  "23=XXIII Vilniaus rinktinė",
  "# County rinktinės whose numbers are not known",
  "101=Kauno rinktinė",
  "102=Ukmergės rinktinė",
  "103=Rokiškio rinktinė",
  "104=Telšių rinktinė",
  "105=Šiaulių rinktinė",
  "106=Tauragės rinktinė",
  "107=Raseinių rinktinė",
  "108=Kėdainių rinktinė",
  "109=Biržų rinktinė",
  "110=Zarasų rinktinė",
  "111=Vilkaviškio rinktinė",
  "112=Šakių rinktinė",
  "113=Švenčionėlių rinktinė",
  "114=Seinų rinktinė"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_GUA_01", "selector": "Royal Guard Divisions", "addType": ["infantry", "cavalry", "light_armor", "medium_armor", "heavy_armor", "modern_armor"], "fallback": "%d-oji gvardijos divizija", "canUse": "has_government = neutrality", "comment": "# ===== Ideology suites =====\n\nMonarchy (the vanilla focus 'Institute Royal Guards'): neutrality. The 1918 king Mindaugas II, the kings of the union with Poland, and the guard regiments of the Grand Duchy (LDK).",
  "add": [
  "# Extrapolated: guard divisions after the kings",
  "1=1-oji karaliaus Mindaugo II gvardijos divizija",
  "2=2-oji karaliaus Jogailos gvardijos divizija",
  "3=3-ioji karaliaus Kazimiero Jogailaičio gvardijos divizija",
  "4=4-oji karaliaus Aleksandro Jogailaičio gvardijos divizija",
  "5=5-oji karaliaus Žygimanto Senojo gvardijos divizija",
  "6=6-oji karaliaus Žygimanto Augusto gvardijos divizija",
  "7=7-oji karaliaus Stepono Batoro gvardijos divizija",
  "8=8-oji karaliaus Žygimanto Vazos gvardijos divizija",
  "9=9-oji karaliaus Vladislovo Vazos gvardijos divizija",
  "10=10-oji karaliaus Jono Kazimiero Vazos gvardijos divizija",
  "11=11-oji karaliaus Mykolo Višnioveckio gvardijos divizija",
  "12=12-oji karaliaus Jono Sobieskio gvardijos divizija",
  "13=13-oji karaliaus Augusto Stipriojo gvardijos divizija",
  "14=14-oji karaliaus Stanislovo Augusto gvardijos divizija",
  "# Guard and vanguard regiments of the Grand Duchy",
  "101=Karališkosios gvardijos divizija",
  "102=LDK pėstininkų gvardijos regimentas",
  "103=LDK raitosios gvardijos pulkas",
  "104=Karališkųjų dragūnų leibregimentas",
  "105=LDK karabinierių leibregimentas",
  "106=1-asis Lietuvos priešakinės sargybos pulkas",
  "107=4-asis Lietuvos priešakinės sargybos pulkas",
  "108=7-asis Lietuvos totorių pulkas"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_GV_01", "selector": "Iron Wolf Divisions", "addType": ["infantry", "militia"], "fallback": "%d-oji Geležinio Vilko divizija", "canUse": "has_government = fascism", "comment": "Voldemaras's Iron Wolf (Geležinis Vilkas): fascism. Only the organisation's own county groups; no 1941 formation is used.",
  "add": [
  "# County groups of the Iron Wolf, 1927-1930",
  "1=Geležinio Vilko Kauno grupė",
  "2=Geležinio Vilko Panevėžio grupė",
  "3=Geležinio Vilko Raseinių grupė",
  "4=Geležinio Vilko Vilniaus krašto grupė",
  "5=Geležinio Vilko Pagėgių grupė",
  "6=Geležinio Vilko Šilutės grupė",
  "7=Geležinio Vilko Klaipėdos grupė",
  "# Extrapolated: further county groups",
  "8=Geležinio Vilko Šiaulių grupė",
  "9=Geležinio Vilko Ukmergės grupė",
  "10=Geležinio Vilko Marijampolės grupė",
  "11=Geležinio Vilko Alytaus grupė",
  "12=Geležinio Vilko Telšių grupė",
  "13=Geležinio Vilko Utenos grupė",
  "14=Geležinio Vilko Biržų grupė",
  "15=Geležinio Vilko Kėdainių grupė",
  "16=Geležinio Vilko Tauragės grupė",
  "17=Geležinio Vilko Rokiškio grupė",
  "18=Geležinio Vilko Zarasų grupė",
  "19=Geležinio Vilko Mažeikių grupė",
  "20=Geležinio Vilko Kretingos grupė"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_RED_01", "selector": "Red Rifle Divisions", "addType": ["infantry", "motorized"], "fallback": "%d-oji lietuviškoji šaulių divizija", "canUse": "has_government = communism", "comment": "Communism: the 16th Lithuanian Rifle Division (Klaipėda honorific of 1945), the 29th Territorial Rifle Corps of 1940-41 and its divisions, and the 1919 Lithuanian Division. Unnumbered names sit on keys 201 and up.",
  "add": [
  "# Red Army formations on their own numbers",
  "16=16-oji lietuviškoji šaulių divizija",
  "29=29-asis teritorinis šaulių korpusas",
  "179=179-oji šaulių divizija",
  "184=184-oji šaulių divizija",
  "# 1919 and extrapolated",
  "201=Lietuvos divizija",
  "202=Lietuvos-Baltarusijos raudonoji divizija",
  "203=Vilniaus raudonoji divizija",
  "204=Kauno raudonoji divizija",
  "205=Šiaulių raudonoji divizija",
  "206=Panevėžio raudonoji divizija",
  "207=Vinco Kapsuko divizija",
  "208=Zigmo Angariečio divizija",
  "209=Lietuvos raudonųjų šaulių divizija"
  ] }
```

```json batch
{"addGroup": true, "group": "LIT_LLK_01", "selector": "Freedom Fighters", "addType": ["infantry", "militia"], "fallback": "%d-oji laisvės kovotojų divizija", "canUse": "has_government = democratic", "comment": "Democratic: the armed resistance whose 1949 declaration set a democratic republic as its aim.",
  "add": [
  "# Districts of the Union of Lithuanian Freedom Fighters (LLKS)",
  "1=Vyčio apygarda",
  "2=Didžiosios Kovos apygarda",
  "3=Tauro apygarda",
  "4=Vytauto apygarda",
  "5=Žemaičių apygarda",
  "6=Algimanto apygarda",
  "7=Kęstučio apygarda",
  "8=Prisikėlimo apygarda",
  "9=Dainavos apygarda",
  "# Regions of the 1949 declaration",
  "10=Nemuno sritis",
  "11=Kalnų sritis",
  "12=Jūros sritis",
  "# Other resistance formations",
  "13=Šarūno rinktinė",
  "14=Lietuvos laisvės armija",
  "15=Vanagų rinktinė",
  "16=Lietuvos laisvės kovos sąjūdžio divizija"
  ] }
```
