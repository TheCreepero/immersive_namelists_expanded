# Latvia (LAT) Namelist Audit - 2026-10-25

Status: DONE

File: `common/units/names_divisions/zz_INEX_LAT_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit LAT`)
- AUDIT SUMMARY LAT: GROUPS=7 AUTHORED=113/215 FLAGS=17
- [LAT_INF_01] flags: PLACEHOLDER_ENTRIES, SELECTOR_SINGULAR, DEAD_SELF_LINK_COMMENT
- [LAT_REG_01] flags: SELECTOR_SINGULAR, DEAD_SELF_LINK_COMMENT
- [LAT_AIZ_01] flags: DEAD_SELF_LINK_COMMENT
- [LAT_ARM_02] flags: DEAD_SELF_LINK_COMMENT
- [LAT_MAR_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, DEAD_SELF_LINK_COMMENT
- [LAT_CAV_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, SELECTOR_SINGULAR, DEAD_SELF_LINK_COMMENT
- [LAT_CAV_02] flags: SELECTOR_LONG, DEAD_SELF_LINK_COMMENT, UNGATED_POLITICAL
- Found on manual review:
  - INEX reuses two vanilla tags, `LAT_INF_01` (20 entries; 1-4 regional, with Zemgale and Latgale swapped against history, 5-20 stubs) and `LAT_CAV_01` (10 stubs), and writes over all their keys. Vanilla's other seven LAT groups stay in the game unchanged (`-InspectVanilla LAT`): `LAT_MOT_01`, `LAT_MEC_01`, `LAT_ARM_01`, `LAT_PAR_01`, `LAT_MAR_01`, `LAT_MNT_01`, `LAT_GAR_01` (10 entries each, GAR on 11-20; MNT and GAR link to `LAT_INF_01`). Their text is title-cased ("%d. Motorizēto Strēlnieku Pulks") and `LAT_PAR_01`'s fallback lacks a diacritic ("Aviodesanta divizija").
  - `LAT_INF_01` is the group of the vanilla focus templates "Ugonskrust Division" (`latvia.txt:1898`, `LAT_free_the_ugonskrusts`) and "Baltic Entente Division" (`latvia.txt:3137`, `:3189`, `baltic_shared.txt:3315`, `estonia.txt:3504`, `lithuania.txt:3716`, `:3768`), so it stays an infantry group. Latvia starts under `neutrality`.
  - Invented or wrong entries: `LAT_INF_01` 5-12 (only four divisions existed); `LAT_REG_01` "Cēsu rotu pulks", "Neatkarības bataljons" (Latvijas Neatkarības bataljons), "Kara skolas kadetu bataljons" (companies), the border guards as "pulks" (they were battalions) and "4. Krāslavas" (no such unit); `LAT_AIZ_01` 14 of 19 regiment numbers wrong, Aizpute missing, "Rīgas pilsētas", "motorizētais" and "sakaru" unattested; `LAT_ARM_02` "Bruņudivīzija/-brigāde/-kolonna" built on single vehicle names, the trains "Komandieris", "Krišjānis Barons", "Pirmās", the tank battalions and the motorised units; `LAT_MAR_02` all but Daugavgrīva and Mangaļsala; `LAT_CAV_01` 2-6 (only Latvijas 1. Jātnieku pulks existed); `LAT_CAV_02` the town squadrons, "Studentu" and "Augškurzemes" squadrons.
  - Fallbacks title-case common nouns ("%d. Kājnieku divīzija") while the authored entries write them lower case.
  - The header is a "Covers" list (R1), and every group still carries the template comments (`# Number reservation system ...`, `# Names with numbers ...`, `# It's okay to have gaps ...`).
  - No Baltic suite: no named infantry variant and no ideology groups, where LIT has four and EST plans four.

## User decisions
- 2026-10-25, policy answers before research:
  - Scope: the full Baltic suite, matching LIT and EST (fix the seven INEX groups in place, reuse the seven untouched vanilla tags, plain/Named pairs, gated suites).
  - Suites: all four, neutrality (Ulmanis era), fascism (Pērkonkrusts), communism (Red Rifle), democratic (Freedom Fighters). Excluded as in EST: formations of 1941-44 under German occupation (Latvian Legion, police battalions) and the Soviet Latvian Riflemen of 1918-20 who fought the Republic.
  - Infantry: `LAT_INF_01` becomes the plain list; the regional and honorific names move to a new `LAT_INF_02` "Infantry Divisions (Named)" linked to it.
  - Orthography: native Latvian, lower-case common nouns, fallbacks included; existing entries renamed in place.
  - Plausible extrapolation allowed, each extension listed under "Author confirmation".
- 2026-10-25, audit report checkpoint: approved as proposed, nothing dropped.

## Research
- `inex-audit-researcher`, run 1 (25 web calls): divisions, infantry regiments and 1919 units, Latvian Riflemen, border guards, cavalry. Main sources: lv.wikipedia "Latvijas Bruņotie spēki", "3. Latgales kājnieku divīzija", "Ziemeļlatvijas brigāde", "Dienvidlatvijas brigāde", "Latgales partizānu pulks", "Latviešu strēlnieki", "Latvijas 1. Jātnieku pulks"; dspace.lu.lv (Latgales kājnieku divīzija 1934-40; Latvijas Kara skola 1919-31); militaryheritagetourism.info (Robežsargu brigāde); valka.cz (Bangerskis).
- `inex-audit-researcher`, run 2 (25 web calls): Aizsargi, armoured cars, armoured trains, coast. Main sources: lv.wikipedia "Aizsargi (organizācija)"; en.wikipedia "Aizsargi"; dspace.lu.lv (18. Daugavpils aizsargu pulks); militaryheritagetourism.info (Autotanku pulks monument, Zemgalietis, armoured train No. 5, Daugavgrīva, Mangaļsala); lvportals.lv (Imanta, Liepāja battery No. 2).
- `inex-audit-researcher`, run 4 (15 web calls): what run 2 left open (armoured car and train names, armour units, coast, terms). Main sources: tanks-encyclopedia.com "Latvia (WW2)" and the Axis History Forum "Baltic AFVs" (secondary); militaryheritagetourism.info; lvportals.lv, dja.lv (Imanta); vestnesis.lv (Krastu artilērijas pulks, 16 Nov 1938). Terms for formation types, train names other than Kalpaks and navy shore units stayed UNVERIFIED.
- `inex-audit-researcher`, run 3 (23 web calls): the four suites. Main sources: lv.wikipedia "24. teritoriālais strēlnieku korpuss", "201. latviešu strēlnieku divīzija", "43. gvardes latviešu strēlnieku divīzija", "308. latviešu strēlnieku divīzija", "130. latviešu strēlnieku korpuss", "Latvijas nacionālie partizāni", "Stompaku kauja", "Zemgaļi", "Latgaļi", "Durbes kauja", "Saules kauja", "Aizkraukles kauja", "Pērkonkrusts"; en.wikipedia "Nameisis", "Viestards", "Visvaldis", "Vetseke", "Tālava"; president.lv (Order of Viesturs).

## Rationale
- **Tags.** The seven INEX tags stay (non-negotiable 1) and are fixed in place. Vanilla tags reused as new INEX groups, so their names in the game are INEX's: `LAT_MOT_01`, `LAT_MEC_01`, `LAT_ARM_01` (plain), `LAT_PAR_01`, `LAT_MAR_01` (plain), `LAT_MNT_01`, `LAT_GAR_01`; every vanilla key is written over, so no title-cased vanilla text stays. New: `LAT_INF_02` (Named infantry), `LAT_SEN_01` (neutrality), `LAT_PK_01` (fascism), `LAT_RED_01` (communism), `LAT_NP_01` (democratic). No other `LAT_` tag exists in the mod.
- **Numbering.** Vanilla links `LAT_MNT_01` and `LAT_GAR_01` to `LAT_INF_01`, and a redefinition cannot remove a link (NAM-020), so INEX writes those links out. New links: `LAT_INF_02` -> `LAT_INF_01`, `LAT_MEC_01` -> `LAT_MOT_01` (as LIT), `LAT_ARM_02` -> `LAT_ARM_01`, `LAT_MAR_02` -> `LAT_MAR_01`.
- **Rebuild in one batch.** `"link"` works only with `"addGroup"` (tooling backlog, Editing), and the regex workaround that backlog entry names writes into `common/units/names_divisions/`, which the project hook refuses. So the batch's first block removes the seven INEX groups and the following blocks add all 19 groups in file order, the seven INEX tags among them, as the LIT re-author did. The batch runs all or nothing, so every tag exists again when it ends and saved templates keep their group; the `[WARN] Removed group tags` line it prints counts the removals only. The rebuild also drops the vanilla template comments and the dead self-links (R8). Rehearsed on a copy of the repository on 2026-10-25: 19 groups, links as above, no comment left.
- **Orthography.** Native Latvian: ordinal `N.`, common nouns lower case, proper names capitalised (`1. Kurzemes kājnieku divīzija`, `Latvijas Neatkarības bataljons`, `Latvijas 1. jātnieku pulks`). Nicknames in the nominative in straight single quotes, as in LIT and EST.
- **Fallbacks**, lower-cased: `%d. kājnieku divīzija` (INF_01, INF_02, SEN_01), `%d. kājnieku pulks` (REG), `%d. aizsargu pulks` (AIZ), `%d. jātnieku pulks` (CAV_01), `%d. atsevišķais jātnieku eskadrons` (CAV_02); new or corrected: `%d. motorizētā kājnieku divīzija`, `%d. mehanizētā kājnieku divīzija`, `%d. tanku divīzija` (ARM_01), `%d. bruņotā divīzija` (ARM_02, was "Bruņudivīzija"), `%d. gaisa desanta divīzija`, `%d. jūras kājnieku divīzija` (MAR_01, MAR_02, was "pulks"), `%d. kalnu kājnieku divīzija`, `%d. garnizona divīzija`, `%d. pērkonkrustiešu divīzija`, `%d. latviešu strēlnieku divīzija`, `%d. nacionālo partizānu divīzija`.
- **Keys.** Numbered names stand on their own number; unnumbered historical units of a numbered group go on 101+ (`LAT_AIZ_01`, `LAT_ARM_02`, `LAT_MAR_02`, `LAT_GAR_01`).
- **`LAT_INF_01` "Infantry Divisions"**: plain variant, `1. kājnieku divīzija` to `20. kājnieku divīzija` over vanilla's keys 1-20; placeholders 21-30 go, the fallback carries on.
- **`LAT_INF_02` "Infantry Divisions (Named)"**: 1-4 the historical divisions in their 1934-40 form; 5-12 the regional names that stood in `LAT_INF_01` (extrapolated, kept: Sēlija, Maliena and Augškurzeme are historical regions, Ziemeļlatvija and Dienvidlatvija the 1919 brigades); 13-18 the ancient Latgalian lands (Tālava, Jersika, Koknese, Atzele, Idumeja, Metsepole); 19-24 Piebalga (the 1919 battalion) and the regiment towns Jelgava, Cēsis, Valmiera, Rēzekne, Ventspils. Extrapolated past 4: no fifth division existed.
- **`LAT_REG_01` "Infantry Regiments"**: rewritten in sections. 1-12 the peacetime regiments; 13-20 the 1919 units in their attested forms (Cēsu bataljons for "Cēsu rotu pulks", Latvijas Neatkarības bataljons, Kara skolas kadetu rota); 21-28 the Latvian Riflemen unchanged; 29-31 the border guard battalions; 32-40 further attested units (13. Tukuma kājnieku pulks, Piebalgas and Malienas bataljons, the schoolboys' battalion and company, Ziemeļlatvijas rezerves bataljons, Bauskas atsevišķais bataljons, 1. partizānu pulks, the riflemen's reserve regiment). The 18 placeholders 33-50 go.
- **`LAT_AIZ_01` "Aizsargi Formations"**: the 19 regiments under their 1939-40 numbers, then the railway and aviation regiments and the naval divizions on 101-103; the three unattested entries and the placeholders go. Gets the `militia` type, like LIT's Riflemen's Union and EST's Kaitseliit; stays ungated because the Aizsargi served every interwar government.
- **`LAT_ARM_02` "Armored & Mobile (Named)"**: the vehicle names of 1919-40 (armoured cars, the AA gun Pērkons, the two named tanks) as nicknames on 1-9, characters of the Lāčplēsis epic on 10-15 (extrapolated), the armour units (Autotanku pulks, Autotanku brigāde, Bruņoto vilcienu pulks, Bruņuvilciens Nr. 5 'Kalpaks', Tehniskā divīzija) on 101-105. The invented brigade/column forms, unattested trains, tank battalions and motorised units go. Types unchanged, so templates of every type keep the group. Viesturs (a car) and Tālivaldis (an AA gun) are left to `LAT_SEN_01`, where they stand for the chieftains, so no identity repeats across groups.
- **`LAT_MAR_02` "Coastal Defense & Marines"**: Named marine variant with coastal-town nicknames on 1-10 (extrapolated), the attested coastal units on 101-103 (Daugavgrīvas cietoksnis, Mangaļsalas nocietinājumi, Krastu artilērijas pulks). The unattested garrisons, battalions and "1./2. Jūras kājnieku pulks" go: Latvia had no naval infantry.
- **`LAT_CAV_01` "Cavalry Regiments"**: `Latvijas 1. jātnieku pulks`, then plain 2.-10. over vanilla's keys (extrapolated numbers). The invented regional regiments go; the regions live on as the attested 1919-20 squadrons in `LAT_CAV_02`.
- **`LAT_CAV_02` "Cavalry Squadrons"**: the attested squadrons and divizioni of 1919-21 and of the 1st Cavalry Regiment. The selector loses "& Partisans"; the Latgale partisan regiment's squadron is a War of Independence army unit and stays.
- **`LAT_MOT_01`, `LAT_MEC_01`, `LAT_PAR_01`**: plain numbers 1-10 over vanilla's keys (no Latvian tradition to draw on). `LAT_MNT_01`: Latvia's uplands and highest hills as nicknames (extrapolated). `LAT_GAR_01` "Garrisons & Border Guards": the garrison towns on 11-30 (vanilla's keys 11-20 written over), the Robežsargu brigāde on 101.
- **Suites** (gated by `has_government` only, never mixing traditions; `LAT_PK_01` and `LAT_NP_01` also serve militia templates, as LIT's Iron Wolf and Freedom Fighters): `LAT_SEN_01` neutrality, the ancient fight against the crusaders that the Ulmanis era celebrated: chieftains, hillforts and battles (no Ulmanis-era honour unit exists). `LAT_PK_01` fascism, Pērkonkrusts by its five apgabali and its trieciengrupas, with its symbols as nicknames (extrapolated; the record is thin). `LAT_RED_01` communism, the 24th Territorial and 130th Latvian Rifle Corps, their divisions and regiments, each on its own number. `LAT_NP_01` democratic, the national partisan organisations of 1944-56 under the Latvian Central Council's 1944 declaration, and their battles.
- **Exclusions**, as in LIT and EST: no formation of 1941-44 under German occupation (Latvian Legion, police battalions, Arājs Kommando, Kurelieši) and no Soviet Latvian Riflemen unit of 1918-20; political leaders (Ulmanis, Celmiņš) are not patrons, and the Pērkonkrusts slogans are not used.

## Verified formations & commanders
- 1. Kurzemes, 2. Vidzemes, 3. Latgales, 4. Zemgales kājnieku divīzija (the numbered "kājnieku" form of 1934-40; plain "Kurzemes divīzija" in 1919-20), three infantry and one artillery regiment each; only four divisions ever existed; Tehniskā divīzija: lv.wikipedia "Latvijas Bruņotie spēki", "3. Latgales kājnieku divīzija".
- 1. Liepājas to 12. Bauskas kājnieku pulks as numbered in the file; 13. Tukuma kājnieku pulks (1920-22); Kurzemes, Vidzemes, Latgales, Zemgales artilērijas pulks: lv.wikipedia "Latvijas Bruņotie spēki".
- Latviešu atsevišķais bataljons (Kalpaka bataljons, 5 Jan-20 Mar 1919); Dienvidlatvijas brigāde with Latvijas Neatkarības bataljons, Cēsu bataljons, Atsevišķais studentu bataljons, Piebalgas bataljons, Malienas bataljons, latviešu (skolnieku) bataljons, inženieru-sapieru bataljons, 1. jātnieku divizions, Latgales and Augškurzemes partizānu pulks; Ziemeļlatvijas brigāde (Zemitāns) with Ziemeļlatvijas rezerves bataljons, Ziemeļlatvijas partizānu pulks (Aparnieks), 1. and 2. kavalērijas eskadrons, Atsevišķais eskadrons, 2. Cēsu pulka Skolnieku rota; Bauskas atsevišķais bataljons; 1. partizānu pulks (Nov 1919): lv.wikipedia "Dienvidlatvijas brigāde", "Ziemeļlatvijas brigāde", "Latgales partizānu pulks"; lvportals.lv.
- Kara skola (13 Sep 1919) and its two cadet companies of the Bermontiāde: dspace.lu.lv "Latvijas Kara skola 1919.-1931.gadā".
- 1. Daugavgrīvas to 8. Valmieras latviešu strēlnieku pulks, Rezerves latviešu strēlnieku pulks, 1st and 2nd Latvian Rifle Brigades, the Latvian Rifle Division (1917): lv.wikipedia "Latviešu strēlnieki".
- Robežsargu brigāde (6 Apr 1935, HQ Zilupe, Bolšteins); 1. Dagdas, 2. Zilupes, 3. Abrenes robežsargu bataljons: militaryheritagetourism.info; VRK archive caption.
- Latvijas 1. Jātnieku pulks (1921-40, Daugavpils), from the Latviešu atsevišķā jātnieku nodaļa of 17 Feb 1919; the 1919-20 Kurzemes, Vidzemes, Latgales and Zemgales jātnieku eskadrons, the 13. Tukuma kājnieku pulka and Latgales partizānu pulka eskadrons: lv.wikipedia "Latvijas 1. Jātnieku pulks".
- The 19 aizsargu pulki of 1939-40, numbered 1 Talsu, 2 Ventspils, 3 Ludzas, 4 Jēkabpils, 5 Rīgas, 6 Aizputes, 7 Valkas, 8 Valmieras, 9 Madonas, 10 Cēsu, 11 Tukuma, 12 Ilūkstes, 13 Bauskas, 14 Kuldīgas, 15 Liepājas, 16 Jelgavas, 17 Rēzeknes, 18 Daugavpils, 19 Abrenes; Dzelzceļu aizsargu pulks; Aizsargu aviācijas pulks; the aizsargu jūras divizioni: lv.wikipedia "Aizsargi (organizācija)", dspace.lu.lv (18.).
- Armoured cars Lāčplēsis, Zemgalietis, Imanta; Autotanku pulks; armoured train No. 5 "Kalpaks"; Daugavgrīva fortress; Mangaļsala fortifications: militaryheritagetourism.info, lvportals.lv. Krastu artilērijas pulks: vestnesis.lv (1938). Autotanku brigāde, Bruņoto vilcienu pulks, Sapieru pulks, Sakaru bataljons in the Tehniskā divīzija: lv.wikipedia "Latvijas Bruņotie spēki".
- Secondary sources only (tanks-encyclopedia.com, Axis History Forum): armoured cars Staburags, Kurzemnieks, Viesturs, Sargs (built for the Aizsargi); AA guns Tālivaldis and Pērkons (English "Thunder"); tanks Latgalietis and Vidzemnieks; six numbered armoured trains.
- 24. teritoriālais strēlnieku korpuss with 181. (186., 195., 243. strēlnieku pulks) and 183. strēlnieku divīzija (227., 285., 295. strēlnieku pulks); 201. latviešu strēlnieku divīzija (92., 122., 191. strēlnieku pulks), 43. gvardes Rīgas latviešu strēlnieku divīzija (121., 123., 125. gvardes strēlnieku pulks); 308. latviešu strēlnieku divīzija (319., 323., 355. strēlnieku pulks); 130. latviešu strēlnieku korpuss; 1. atsevišķais latviešu strēlnieku rezerves pulks: lv.wikipedia pages of the same names.
- Latvijas Nacionālo partizānu apvienība (LNPA), Tēvzemes Sargu (partizānu) apvienība, Latvijas Nacionālo partizānu organizācija, Ziemeļkurzemes partizānu organizācija, Latviešu nacionālo partizānu apvienība "Kurzeme", the Ilūkste partisan regiment, the Kārlis Krauja unit; Stompaku kauja (2-3 Mar 1945), Kabiles uzbrukums, Gostiņu ieņemšana: lv.wikipedia "Latvijas nacionālie partizāni", "Stompaku kauja".
- Lands Zemgale, Sēlija, Tālava, Jersika, Koknese, Atzele, Idumeja, Metsepole, Latgale; hillforts Tērvete, Mežotne, Dobele, Sidrabene; chieftains Viesturs (Viestards), Namejs (Nameisis), Visvaldis, Tālivaldis, Rūsiņš, Vetseke, Varidots; Saules kauja (1236), Durbes kauja (1260), Aizkraukles kauja (1229): lv.wikipedia "Zemgaļi", "Latgaļi", battle pages; en.wikipedia chieftain pages.
- Pērkonkrusts: apgabali, rajoni, bloki, "T" trieciengrupas, the ugunskrusts and Māras krusts, "Latviju latviešiem!", "Cīņai sveiks!": lv.wikipedia "Pērkonkrusts".

## Author confirmation
- Extrapolated (patterned, never fielded): `LAT_INF_02` 5-24, `LAT_ARM_02` 10-15, `LAT_MAR_02` 1-10, `LAT_MNT_01`, `LAT_PK_01`, `LAT_NP_01` battle nicknames, `LAT_SEN_01` (as divisions); `LAT_CAV_01` 2.-10. jātnieku pulks; `LAT_GAR_01` garrison towns past the regiment towns.
- Secondary sources only: the vehicle names Staburags, Kurzemnieks, Sargs, Latgalietis, Vidzemnieks; the Latvian spelling of Pērkons for the AA gun "Max".
- The epic character names Koknesis, Laimdota, Spīdola, Aizkrauklis, Burtnieks, Staburadze (the proofreader questioned only "Lielvārds", now replaced).
- The forms "Bruņuvilciens Nr. 5 'Kalpaks'", "Aizsargu jūras divizions", "Jātnieku pulka I/II divizions" and "Jātnieku pulka ložmetēju eskadrons" (structure attested, wording not).
- The formation-type terms of the new fallbacks (motorizētā, mehanizētā, tanku, bruņotā, gaisa desanta, jūras kājnieku, kalnu kājnieku, garnizona divīzija; pērkonkrustiešu, nacionālo partizānu divīzija): no source found in run 4.
- Hill and upland spellings of `LAT_MNT_01`; Daugmale, Satekle and Autine hillfort forms in `LAT_SEN_01` (the proofreader raised none). The coastal-town names of `LAT_MAR_02` were checked by the proofreader (all existed by 1940; Skulte replaces Saulkrasti).
- The five Pērkonkrusts apgabali named after Rīga and the four regions (the number five is attested, the names are not).

## Kept on judgment
From the rehearsal on a copy of the repository (2026-10-25: `-Audit LAT` after steps 1-2, 11 flags):
- `PLACEHOLDER_ENTRIES` and `LOW_DEPTH` on `LAT_MOT_01`, `LAT_MEC_01`, `LAT_PAR_01`: plain lists with no Named counterpart, so `-Audit` does not mark them `Variant: plain`. Their ten entries exist only to write over vanilla's title-cased text (non-negotiable 6).
- `PLACEHOLDER_ENTRIES` and `LOW_DEPTH` on `LAT_CAV_01`: key 1 is the one historical regiment, keys 2-10 write over vanilla's entries.
- `PLACEHOLDER_ENTRIES` and `LOW_DEPTH` on `LAT_RED_01`: every entry stands on its own number, so the lint reads the numbered regiments and divisions as fallback repeats (tooling backlog, Lints, first entry); 23 attested formations.
- `UNGATED_POLITICAL` on `LAT_AIZ_01`, raised by the `militia` type: the Aizsargi served every interwar government; kept ungated, as LIT's Riflemen's Union and EST's Kaitseliit.
- `Variant: plain` groups (`LAT_INF_01`, `LAT_ARM_01`, `LAT_MAR_01`) are exempt from R4/R5 and carry no flag.
- `[WARN] Docs: workshop block [b]Latvia[/b] has 0 [i] example(s)` until docs edit 3; gone after step 3.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames LAT -Batch docs\plans\2026-10-25-latvia-audit.md`. Expect seven `Removed LAT_...` lines (INF_01, REG_01, AIZ_01, ARM_02, MAR_02, CAV_01, CAV_02), then 19 `Added LAT_...` lines in this order: INF_01, INF_02 (`links LAT_INF_01`), REG_01, GAR_01 (`links LAT_INF_01`), AIZ_01, MOT_01, MEC_01 (`links LAT_MOT_01`), ARM_01, ARM_02 (`links LAT_ARM_01`), PAR_01, MAR_01, MAR_02 (`links LAT_MAR_01`), MNT_01 (`links LAT_INF_01`), CAV_01, CAV_02, SEN_01, PK_01, RED_01, NP_01, and the line `[WARN] Removed group tags: saved templates that used them fall back to default names`. That warning is expected: the seven tags are added again in the same batch (Rationale, "Rebuild in one batch"). No `[ERROR]`.
- [x] 2. Set the header with this command (one line, PowerShell; `` `n `` starts a new header line). Expect `Header of zz_INEX_LAT_names_divisions.txt replaced`.
  ```powershell
  powershell -File .\build.ps1 -SetHeader LAT -HeaderText "Division template historical names system for Latvia (LAT).`nImmersive Namelists Expanded (INEX)`nLatvian names as the army of 1919-1940 wrote them: an Arabic ordinal with a full stop (1. Kurzemes kājnieku divīzija), lower-case common nouns, place names in the genitive before the noun. Nicknames stand in straight single quotes; the map font has no Latvian quotation marks.`nOverrides all nine vanilla LAT groups (INF, CAV, MOT, MEC, ARM, PAR, MAR, MNT, GAR) and writes over every vanilla number. LAT_INF_01 is the group of the vanilla Ugunskrusts and Baltic Entente focus templates."
  ```
- [x] 3. Make docs edits 1-3 of "Docs payload" (edit 4 waits for the ship step).
- [x] 4. `powershell -File .\build.ps1 -SyncWiki LAT`. Expect `Latvia.md: 0 row(s) updated`, `wiki/Home.md: LAT group count 7 -> 19` (on a rerun the count line may be absent, since the count is already 19), and no `no row in wiki table` line (edit 1 adds every row). Also expect this prose review block, which needs no action (planner review, 2026-10-25):
  ```
  prose mentioning names removed or moved since HEAD (review only these lines):
    L9: 4. Zemgales kājnieku divīzija (moved INF_01->INF_02)
    L53: 1. Kurzemes kājnieku divīzija (moved INF_01->INF_02), 4. Zemgales kājnieku divīzija (moved INF_01->INF_02), 7. Ziemeļlatvijas kājnieku divīzija (moved INF_01->INF_02)
    L56: Neatkarības bataljons (removed from REG_01)
  ```
  L9 and L53 name divisions that moved to `LAT_INF_02` on purpose (Rationale, `LAT_INF_02`). L56 is a substring match: the line says *Latvijas Neatkarības bataljons*, the renamed entry that stays in `LAT_REG_01`. Any other line in the block is a stop condition.
- [x] 5. `powershell -File .\build.ps1 -Check LAT`. Expect `Check passed`; remaining flags must match "Kept on judgment". Then fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 6. Ship, on the user's word: make docs edit 4 (`ROADMAP.md`) and move this plan to `docs/plans/archive/`, then commit with the message `Audit LAT division namelists`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit LAT division namelists"`.

## Docs payload
`README.md`: no change (its row names only the tag and the file).

**1. `wiki/Latvia.md`.** Keep lines 1-6 (the `# Latvia` title, the `**Country Tag:**` line and the first `---`). Replace everything from the line `## Historical Overview` to the end of the file with the text between the four-backtick fences below (fences not included):

````markdown
## Historical Overview

The Latvian Army (*Latvijas armija*) of 1919-1940 had four infantry divisions named after the historic regions (*1. Kurzemes*, *2. Vidzemes*, *3. Latgales* and *4. Zemgales kājnieku divīzija*), each with three infantry regiments named after their home towns (*1. Liepājas kājnieku pulks* to *12. Bauskas kājnieku pulks*), one cavalry regiment (*Latvijas 1. jātnieku pulks*) and the technical units of the *Tehniskā divīzija*: the *Autotanku pulks*, the armoured trains and the coastal artillery. It grew out of the units of the War of Independence (*Kalpaka bataljons*, the Northern and Southern Latvia Brigades, the Latgale partisans) and the tradition of the Latvian Riflemen of 1915-1917 (*latviešu strēlnieki*). The defence organisation *Aizsargi* kept one regiment in each county.

Only the four divisions were ever formed, so the Named list extends their pattern with regions, the ancient Latgalian lands and towns in the genitive (*13. Tālavas kājnieku divīzija*). The Named armour and marine lists take the names of the army's armoured cars and of the coastal towns as nicknames (*1. bruņotā divīzija 'Lāčplēsis'*). Nicknames stand in straight single quotes because the game's map font has no Latvian quotation marks.

All names use Latvian orthography: an ordinal with a full stop, lower-case common nouns and the diacritics ā, č, ē, ģ, ī, ķ, ļ, ņ, š, ū, ž.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `LAT_INF_01` | Infantry Divisions | infantry | `%d. kājnieku divīzija` |
| `LAT_INF_02` | Infantry Divisions (Named) | infantry | `%d. kājnieku divīzija` |
| `LAT_REG_01` | Infantry Regiments | infantry | `%d. kājnieku pulks` |
| `LAT_GAR_01` | Garrisons & Border Guards | infantry | `%d. garnizona divīzija` |
| `LAT_AIZ_01` | Aizsargi Formations | infantry, militia | `%d. aizsargu pulks` |
| `LAT_MOT_01` | Motorized Divisions | motorized | `%d. motorizētā kājnieku divīzija` |
| `LAT_MEC_01` | Mechanized Divisions | mechanized | `%d. mehanizētā kājnieku divīzija` |
| `LAT_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. tanku divīzija` |
| `LAT_ARM_02` | Armored & Mobile (Named) | light_armor, medium_armor, heavy_armor, modern_armor, motorized, mechanized | `%d. bruņotā divīzija` |
| `LAT_PAR_01` | Paratrooper Divisions | paratrooper | `%d. gaisa desanta divīzija` |
| `LAT_MAR_01` | Marine Divisions | marine | `%d. jūras kājnieku divīzija` |
| `LAT_MAR_02` | Coastal Defense & Marines | marine | `%d. jūras kājnieku divīzija` |
| `LAT_MNT_01` | Mountain Divisions | mountaineers | `%d. kalnu kājnieku divīzija` |
| `LAT_CAV_01` | Cavalry Regiments | cavalry | `%d. jātnieku pulks` |
| `LAT_CAV_02` | Cavalry Squadrons | cavalry | `%d. atsevišķais jātnieku eskadrons` |
| `LAT_SEN_01` | Heritage Divisions | infantry | `%d. kājnieku divīzija` |
| `LAT_PK_01` | Thunder Cross Divisions | infantry, militia | `%d. pērkonkrustiešu divīzija` |
| `LAT_RED_01` | Red Rifle Divisions | infantry | `%d. latviešu strēlnieku divīzija` |
| `LAT_NP_01` | National Partisans | infantry, militia | `%d. nacionālo partizānu divīzija` |

> **Note:** INEX overrides all nine vanilla LAT groups and writes over every vanilla number, so no title-cased vanilla name stays in the game. `LAT_INF_01` is the group of the vanilla *Ugunskrusts* and *Baltic Entente* focus templates.

---

## Group Details

### Field army

### `LAT_INF_01` — Infantry Divisions
The plain list (*1. kājnieku divīzija* onward), for players who want numbers only. It shares its numbering with the Named list, the garrisons and the mountain divisions.

### `LAT_INF_02` — Infantry Divisions (Named)
The four divisions of 1919-1940 (*1. Kurzemes kājnieku divīzija* to *4. Zemgales kājnieku divīzija*), then extensions on the same pattern: regions and the 1919 brigades (*7. Ziemeļlatvijas kājnieku divīzija*), the ancient lands of Tālava, Jersika, Koknese, Atzele, Idumeja and Metsepole, and towns (*21. Cēsu kājnieku divīzija*).

### `LAT_REG_01` — Infantry Regiments
Regiment-sized templates: the twelve peacetime regiments; the units of the War of Independence (*Kalpaka bataljons*, *Latvijas Neatkarības bataljons*, *Atsevišķais studentu bataljons*, the Northern Latvia, Latgale and Upper Courland partisan regiments, the *Kara skolas kadetu rota*); the eight Latvian Riflemen regiments (*1. Daugavgrīvas latviešu strēlnieku pulks* to *8. Valmieras latviešu strēlnieku pulks*); the border guard battalions of 1935-1940; and further units of 1915-1922 (*13. Tukuma kājnieku pulks*, *Piebalgas bataljons*).

### Garrisons and territorial defence

### `LAT_GAR_01` — Garrisons & Border Guards
Garrison towns (*Rīgas garnizons*, *Daugavpils garnizons*), from 11 because vanilla links the group to the infantry, and the *Robežsargu brigāde* of 1935.

### `LAT_AIZ_01` — Aizsargi Formations
The defence organisation *Aizsargi* (1919-1940): its 19 county regiments under their 1939-1940 numbers (*1. Talsu aizsargu pulks* to *19. Abrenes aizsargu pulks*), the railway and aviation regiments and the naval divizions. It serves infantry and militia templates under every government, as the organisation did.

### Motorized, mechanized and armour

### `LAT_MOT_01` — Motorized Divisions
Plain numbers (*1. motorizētā kājnieku divīzija*); anchors the mobile numbering.

### `LAT_MEC_01` — Mechanized Divisions
Plain numbers (*1. mehanizētā kājnieku divīzija*), sharing numbering with the motorized divisions.

### `LAT_ARM_01` — Armored Divisions
Plain numbers (*1. tanku divīzija*); the plain counterpart of `LAT_ARM_02`.

### `LAT_ARM_02` — Armored & Mobile (Named)
The armoured cars, the AA gun and the tanks of the 1919-1940 army as nicknames (*'Lāčplēsis'*, *'Kurzemnieks'*, *'Zemgalietis'*, *'Imanta'*, *'Staburags'*, *'Pērkons'*), characters of Andrejs Pumpurs' epic *Lāčplēsis* (*'Laimdota'*, *'Spīdola'*), and the armour units themselves: the *Autotanku pulks*, the *Bruņoto vilcienu pulks*, the armoured train *Bruņuvilciens Nr. 5 'Kalpaks'* and the *Tehniskā divīzija*. It serves armour, motorized and mechanized templates.

### Specialist troops

### `LAT_PAR_01` — Paratrooper Divisions
Plain numbers (*1. gaisa desanta divīzija*); Latvia had no airborne troops.

### `LAT_MAR_01` — Marine Divisions
Plain numbers (*1. jūras kājnieku divīzija*); the plain counterpart of `LAT_MAR_02`.

### `LAT_MAR_02` — Coastal Defense & Marines
Towns of the Baltic and Gulf of Riga coast as nicknames (*1. jūras kājnieku divīzija 'Kolka'*), then the coastal defence of the interwar army: *Daugavgrīvas cietoksnis*, *Mangaļsalas nocietinājumi* and the *Krastu artilērijas pulks*. Latvia had no naval infantry, so the nicknamed divisions are extensions.

### `LAT_MNT_01` — Mountain Divisions
Latvia's uplands and highest hills as nicknames (*1. kalnu kājnieku divīzija 'Gaiziņkalns'*, *'Vidzemes augstiene'*, *'Kurzemes Šveice'*).

### Cavalry

### `LAT_CAV_01` — Cavalry Regiments
*Latvijas 1. jātnieku pulks*, the army's one cavalry regiment (1921-1940, Daugavpils), then plain numbers.

### `LAT_CAV_02` — Cavalry Squadrons
Squadron-sized templates: the squadrons of 1919-1921 from which the regiment was formed (the *Latviešu atsevišķā jātnieku nodaļa* of the Kalpaks battalion, the Kurzeme, Vidzeme, Latgale and Zemgale squadrons, the Northern Latvia Brigade's squadrons, the Latgale partisans' squadron) and the regiment's own divizions.

### Ideology suites

### `LAT_SEN_01` — Heritage Divisions (neutrality)
The ancient fight against the crusaders that the Ulmanis era celebrated: chieftains (*'Viesturs'*, *'Namejs'*, *'Visvaldis'*, *'Tālivaldis'*), hillforts (*'Tērvete'*, *'Mežotne'*) and the battles of Saule and Durbe. All are extensions; no Ulmanis-era honour unit existed.

### `LAT_PK_01` — Thunder Cross Divisions (fascism)
*Pērkonkrusts* (1932-1934), the movement of the vanilla *Ugunskrusts* path, by its five regions (*apgabali*) and its shock groups (*trieciengrupas*), then its symbols as nicknames (*'Ugunskrusts'*, *'Māras krusts'*). The movement fielded no military units, so all are extensions; its slogans and its leader are not used.

### `LAT_RED_01` — Red Rifle Divisions (communism)
Latvian formations of the Red Army, each on its own number: the 24th Territorial Rifle Corps of 1940-1941 with the 181st and 183rd Rifle Divisions and their regiments, and the 130th Latvian Rifle Corps of 1944-1945 with the *201. latviešu strēlnieku divīzija*, the *43. gvardes Rīgas latviešu strēlnieku divīzija* and the *308. latviešu strēlnieku divīzija*.

### `LAT_NP_01` — National Partisans (democratic)
The national partisans of 1944-1956, who fought for the republic that the Latvian Central Council's declaration of 8 September 1944 restored: their organisations (*Latvijas Nacionālo partizānu apvienība*, *Tēvzemes Sargu partizānu apvienība*, the Courland organisations) and their battles as nicknames (*'Stompaki'*, *'Kabile'*).
````

**2. `WORKSHOP_DESCRIPTION_GUIDELINES.md`, file table row.** Replace the line

```
| `zz_INEX_LAT_names_divisions.txt` | Latvia | `LAT` | Included (Historical divisions & regiments, Aizsargu pulki, Armored cars/trains, Coastal fortresses, Cavalry) |
```

with

```
| `zz_INEX_LAT_names_divisions.txt` | Latvia | `LAT` | Included (Plain & Named infantry and armored divisions, peacetime and War of Independence regiments, Latvian Riflemen, Aizsargi regiments, cavalry squadrons, garrisons & border guards, marines, paratroopers, mountain, Heritage, Thunder Cross, Red Rifle divisions, National Partisans) |
```

**3. `WORKSHOP_DESCRIPTION_GUIDELINES.md`, Workshop block.** Replace the two bullet lines under `[b]Latvia[/b]`

```
- Historical regional divisions, peacetime regiments, and Latviešu strēlnieki
- Aizsargi county regiments, Autotanku pulks, armored trains, and coastal fortresses
```

with these three lines:

```
- Plain & Named infantry and armored divisions with regional and armoured-car identities ([i]1. Kurzemes kājnieku divīzija[/i], [i]1. bruņotā divīzija 'Lāčplēsis'[/i]), the twelve interwar regiments and the Latvian Riflemen ([i]1. Daugavgrīvas latviešu strēlnieku pulks[/i])
- Aizsargi county regiments, War of Independence battalions, cavalry squadrons, garrisons and border guards, marines, paratroopers and mountain troops
- Ideology suites: Heritage (neutrality), Thunder Cross (fascist), Red Rifle divisions (communist) and National Partisans (democratic)
```

**4. `ROADMAP.md`, at ship time (step 6).** Replace `| 3 | LAT | Expansion | S | audit |` with `| 3 | ~~LAT~~ | Shipped <ship date> | S | audit |`, and replace `3. **LAT, Latvia.** 7 groups.` with `3. ~~**LAT, Latvia.**~~ Shipped <ship date> as an audit with the full Baltic suite (plan in docs/plans/archive/2026-10-25-latvia-audit.md). Before it, 7 groups.` (`<ship date>` is the date of the ship step, `YYYY-MM-DD`.)

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader`, 2026-10-25 (all added and changed names, the fallback terms and the "Author confirmation" list). It raised no issue with the fallback terms or `Latvijas 1. jātnieku pulks`. Findings and what was done:
- `LAT_MAR_02` 'Saulkrasti': the name dates from 1954 -> replaced by 'Skulte' in the batch.
- `LAT_ARM_02` 'Lielvārds': not a character of the epic -> replaced by 'Staburadze' (the maiden of the Staburags cliff in the epic) in the batch.
- `LAT_ARM_02` 'Aizkrauklis' against `LAT_SEN_01` 'Aizkraukle': two identities (the epic's lord, the 1229 battle) -> both kept.
- `LAT_ARM_02` "Bruņoto vilcienu pulks" (suggested "Bruņuvilcienu divizions", from language knowledge): kept; lv.wikipedia "Latvijas Bruņotie spēki" lists the Bruņoto vilcienu pulks in the Tehniskā divīzija.
- `LAT_CAV_02` "kavalērijas eskadrons" (suggested "jātnieku"): kept; the attested 1919 form (lv.wikipedia "Ziemeļlatvijas brigāde").
- `LAT_AIZ_01` "Dzelzceļu aizsargu pulks", "Aizsargu jūras divizions" (suggested "Dzelzceļa", "Jūras aizsargu"): kept; the forms of lv.wikipedia "Aizsargi (organizācija)".
- Unsure items checked: `LAT_CAV_02` I/II divizions match the regiment's structure (lv.wikipedia "Latvijas 1. Jātnieku pulks"); `LAT_RED_01` 181st and 183rd divisions were formed from the four Latvian divisions (lv.wikipedia "24. teritoriālais strēlnieku korpuss"); the coastal towns all existed by 1940.

## Outcome
Date: 2026-10-25.

`-Check LAT`: Validate OK; Tests 475 Passed, 0 Failed, 0 Skipped; `AUDIT SUMMARY LAT: GROUPS=19 AUTHORED=206/308 FLAGS=11`; Flags: LOW_DEPTH x5, PLACEHOLDER_ENTRIES x5, UNGATED_POLITICAL x1, all listed under "Kept on judgment"; no `Docs:` warning; Diff vs HEAD: 19 group(s) changed, +275 -182 name(s); Check passed.

Deviations: `-SyncWiki LAT` printed `wiki/Home.md: LAT group count 19 (unchanged)` instead of `7 -> 19`. The count was already 19 when step 4 ran, the rerun case the step allows for; no edit was needed. Otherwise the output matched the step.

## Edit batch
Applied by `build.ps1 -EditNames LAT -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
[
  {"group": "INF_01", "removeGroup": true}, {"group": "REG_01", "removeGroup": true}, {"group": "AIZ_01", "removeGroup": true},
  {"group": "ARM_02", "removeGroup": true}, {"group": "MAR_02", "removeGroup": true}, {"group": "CAV_01", "removeGroup": true},
  {"group": "CAV_02", "removeGroup": true}
]
```

```json batch
{"addGroup": true, "group": "INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "%d. kājnieku divīzija",
  "comment": "# ===== Field army =====\n\nVanilla tag, used by the vanilla Ugunskrusts and Baltic Entente focus templates. Plain variant: keys 1-20 write over vanilla's regional and title-cased entries.",
  "add": [
  "1=1. kājnieku divīzija", "2=2. kājnieku divīzija", "3=3. kājnieku divīzija", "4=4. kājnieku divīzija", "5=5. kājnieku divīzija",
  "6=6. kājnieku divīzija", "7=7. kājnieku divīzija", "8=8. kājnieku divīzija", "9=9. kājnieku divīzija", "10=10. kājnieku divīzija",
  "11=11. kājnieku divīzija", "12=12. kājnieku divīzija", "13=13. kājnieku divīzija", "14=14. kājnieku divīzija", "15=15. kājnieku divīzija",
  "16=16. kājnieku divīzija", "17=17. kājnieku divīzija", "18=18. kājnieku divīzija", "19=19. kājnieku divīzija", "20=20. kājnieku divīzija"
  ]}
```

```json batch
{"addGroup": true, "group": "INF_02", "selector": "Infantry Divisions (Named)", "addType": "infantry", "fallback": "%d. kājnieku divīzija", "link": "INF_01",
  "comment": "Named variant of LAT_INF_01: the four divisions of 1919-1940 in their 1934-1940 form, then regions, the ancient lands and towns in the genitive on the same pattern.",
  "add": [
  "# Divisions of 1919-1940",
  "1=1. Kurzemes kājnieku divīzija", "2=2. Vidzemes kājnieku divīzija", "3=3. Latgales kājnieku divīzija", "4=4. Zemgales kājnieku divīzija",
  "# Regions and the 1919 brigades",
  "5=5. Rīgas kājnieku divīzija", "6=6. Sēlijas kājnieku divīzija", "7=7. Ziemeļlatvijas kājnieku divīzija", "8=8. Dienvidlatvijas kājnieku divīzija",
  "9=9. Malienas kājnieku divīzija", "10=10. Augškurzemes kājnieku divīzija", "11=11. Liepājas kājnieku divīzija", "12=12. Daugavpils kājnieku divīzija",
  "# Ancient lands",
  "13=13. Tālavas kājnieku divīzija", "14=14. Jersikas kājnieku divīzija", "15=15. Kokneses kājnieku divīzija", "16=16. Atzeles kājnieku divīzija",
  "17=17. Idumejas kājnieku divīzija", "18=18. Metsepoles kājnieku divīzija",
  "# Regions and towns",
  "19=19. Piebalgas kājnieku divīzija", "20=20. Jelgavas kājnieku divīzija", "21=21. Cēsu kājnieku divīzija", "22=22. Valmieras kājnieku divīzija",
  "23=23. Rēzeknes kājnieku divīzija", "24=24. Ventspils kājnieku divīzija"
  ]}
```

```json batch
{"addGroup": true, "group": "REG_01", "selector": "Infantry Regiments", "addType": "infantry", "fallback": "%d. kājnieku pulks",
  "comment": "Regiment-sized templates: the army's twelve regiments, the units of the War of Independence, the Latvian Riflemen of 1915-1917 and the border guard battalions. Numbers inside a name are the unit's own, not its key.",
  "add": [
  "# Peacetime regiments (1919-1940)",
  "1=1. Liepājas kājnieku pulks", "2=2. Ventspils kājnieku pulks", "3=3. Jelgavas kājnieku pulks", "4=4. Valmieras kājnieku pulks",
  "5=5. Cēsu kājnieku pulks", "6=6. Rīgas kājnieku pulks", "7=7. Siguldas kājnieku pulks", "8=8. Daugavpils kājnieku pulks",
  "9=9. Rēzeknes kājnieku pulks", "10=10. Aizputes kājnieku pulks", "11=11. Dobeles kājnieku pulks", "12=12. Bauskas kājnieku pulks",
  "# War of Independence (1919-1920)",
  "13=Kalpaka bataljons", "14=Atsevišķais studentu bataljons", "15=Cēsu bataljons", "16=Latvijas Neatkarības bataljons",
  "17=Ziemeļlatvijas partizānu pulks", "18=Latgales partizānu pulks", "19=Augškurzemes partizānu pulks", "20=Kara skolas kadetu rota",
  "# Latvian Riflemen (1915-1917)",
  "21=1. Daugavgrīvas latviešu strēlnieku pulks", "22=2. Rīgas latviešu strēlnieku pulks", "23=3. Kurzemes latviešu strēlnieku pulks",
  "24=4. Vidzemes latviešu strēlnieku pulks", "25=5. Zemgales latviešu strēlnieku pulks", "26=6. Tukuma latviešu strēlnieku pulks",
  "27=7. Bauskas latviešu strēlnieku pulks", "28=8. Valmieras latviešu strēlnieku pulks",
  "# Border guards (1935-1940)",
  "29=1. Dagdas robežsargu bataljons", "30=2. Zilupes robežsargu bataljons", "31=3. Abrenes robežsargu bataljons",
  "# Further units (1915-1922)",
  "32=13. Tukuma kājnieku pulks", "33=Piebalgas bataljons", "34=Malienas bataljons", "35=Latviešu skolnieku bataljons",
  "36=2. Cēsu pulka skolnieku rota", "37=Ziemeļlatvijas rezerves bataljons", "38=Bauskas atsevišķais bataljons", "39=1. partizānu pulks",
  "40=Rezerves latviešu strēlnieku pulks"
  ]}
```

```json batch
{"addGroup": true, "group": "GAR_01", "selector": "Garrisons & Border Guards", "addType": "infantry", "fallback": "%d. garnizona divīzija", "link": "INF_01",
  "comment": "# ===== Garrisons and territorial defence =====\n\nOverrides vanilla LAT_GAR_01 ('%d. Garnizona Pulks', keys 11-20). Vanilla links it to LAT_INF_01, so the towns start at 11; the Border Guard Brigade sits on 101.",
  "add": [
  "# Garrison towns",
  "11=Rīgas garnizons", "12=Liepājas garnizons", "13=Daugavpils garnizons", "14=Jelgavas garnizons", "15=Ventspils garnizons",
  "16=Rēzeknes garnizons", "17=Valmieras garnizons", "18=Cēsu garnizons", "19=Aizputes garnizons", "20=Dobeles garnizons",
  "21=Bauskas garnizons", "22=Siguldas garnizons", "23=Alūksnes garnizons", "24=Gulbenes garnizons", "25=Ludzas garnizons",
  "26=Abrenes garnizons", "27=Kuldīgas garnizons", "28=Tukuma garnizons", "29=Jēkabpils garnizons", "30=Krustpils garnizons",
  "# Border guards",
  "101=Robežsargu brigāde"
  ]}
```

```json batch
{"addGroup": true, "group": "AIZ_01", "selector": "Aizsargi Formations", "addType": ["infantry", "militia"], "fallback": "%d. aizsargu pulks",
  "comment": "Aizsargi (Aizsardzības organizācija, 1919-1940): the 19 county regiments under their 1939-1940 numbers; the special units sit on 101 and up, so the fallback fills the free numbers.",
  "add": [
  "# County regiments (1939-1940)",
  "1=1. Talsu aizsargu pulks", "2=2. Ventspils aizsargu pulks", "3=3. Ludzas aizsargu pulks", "4=4. Jēkabpils aizsargu pulks",
  "5=5. Rīgas aizsargu pulks", "6=6. Aizputes aizsargu pulks", "7=7. Valkas aizsargu pulks", "8=8. Valmieras aizsargu pulks",
  "9=9. Madonas aizsargu pulks", "10=10. Cēsu aizsargu pulks", "11=11. Tukuma aizsargu pulks", "12=12. Ilūkstes aizsargu pulks",
  "13=13. Bauskas aizsargu pulks", "14=14. Kuldīgas aizsargu pulks", "15=15. Liepājas aizsargu pulks", "16=16. Jelgavas aizsargu pulks",
  "17=17. Rēzeknes aizsargu pulks", "18=18. Daugavpils aizsargu pulks", "19=19. Abrenes aizsargu pulks",
  "# Special units",
  "101=Dzelzceļu aizsargu pulks", "102=Aizsargu aviācijas pulks", "103=Aizsargu jūras divizions"
  ]}
```

```json batch
{"addGroup": true, "group": "MOT_01", "selector": "Motorized Divisions", "addType": "motorized", "fallback": "%d. motorizētā kājnieku divīzija",
  "comment": "# ===== Motorized, mechanized and armour =====\n\nOverrides vanilla LAT_MOT_01 ('Motorizēto Strēlnieku Pulks', keys 1-10) as a plain list and anchors the mobile numbering.",
  "add": [
  "1=1. motorizētā kājnieku divīzija", "2=2. motorizētā kājnieku divīzija", "3=3. motorizētā kājnieku divīzija", "4=4. motorizētā kājnieku divīzija",
  "5=5. motorizētā kājnieku divīzija", "6=6. motorizētā kājnieku divīzija", "7=7. motorizētā kājnieku divīzija", "8=8. motorizētā kājnieku divīzija",
  "9=9. motorizētā kājnieku divīzija", "10=10. motorizētā kājnieku divīzija"
  ]}
```

```json batch
{"addGroup": true, "group": "MEC_01", "selector": "Mechanized Divisions", "addType": "mechanized", "fallback": "%d. mehanizētā kājnieku divīzija", "link": "MOT_01",
  "comment": "Overrides vanilla LAT_MEC_01 ('Mehanizēto Strēlnieku Pulks', keys 1-10) as a plain list; shares numbering with LAT_MOT_01.",
  "add": [
  "1=1. mehanizētā kājnieku divīzija", "2=2. mehanizētā kājnieku divīzija", "3=3. mehanizētā kājnieku divīzija", "4=4. mehanizētā kājnieku divīzija",
  "5=5. mehanizētā kājnieku divīzija", "6=6. mehanizētā kājnieku divīzija", "7=7. mehanizētā kājnieku divīzija", "8=8. mehanizētā kājnieku divīzija",
  "9=9. mehanizētā kājnieku divīzija", "10=10. mehanizētā kājnieku divīzija"
  ]}
```

```json batch
{"addGroup": true, "group": "ARM_01", "selector": "Armored Divisions", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"], "fallback": "%d. tanku divīzija",
  "comment": "Overrides vanilla LAT_ARM_01 ('Autotanku Pulks', keys 1-10) as the plain variant of LAT_ARM_02.",
  "add": [
  "1=1. tanku divīzija", "2=2. tanku divīzija", "3=3. tanku divīzija", "4=4. tanku divīzija", "5=5. tanku divīzija",
  "6=6. tanku divīzija", "7=7. tanku divīzija", "8=8. tanku divīzija", "9=9. tanku divīzija", "10=10. tanku divīzija"
  ]}
```

```json batch
{"addGroup": true, "group": "ARM_02", "selector": "Armored & Mobile (Named)", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor", "motorized", "mechanized"], "fallback": "%d. bruņotā divīzija", "link": "ARM_01",
  "comment": "Named variant of LAT_ARM_01: the armoured cars, AA guns and tanks of the 1919-1940 army and characters of the Lāčplēsis epic as nicknames; the armour units themselves on 101 and up.",
  "add": [
  "# Vehicles of the 1919-1940 army",
  "1=1. bruņotā divīzija 'Lāčplēsis'", "2=2. bruņotā divīzija 'Kurzemnieks'", "3=3. bruņotā divīzija 'Zemgalietis'",
  "4=4. bruņotā divīzija 'Imanta'", "5=5. bruņotā divīzija 'Staburags'", "6=6. bruņotā divīzija 'Sargs'",
  "7=7. bruņotā divīzija 'Latgalietis'", "8=8. bruņotā divīzija 'Vidzemnieks'", "9=9. bruņotā divīzija 'Pērkons'",
  "# The Lāčplēsis epic",
  "10=10. bruņotā divīzija 'Koknesis'", "11=11. bruņotā divīzija 'Laimdota'", "12=12. bruņotā divīzija 'Spīdola'",
  "13=13. bruņotā divīzija 'Aizkrauklis'", "14=14. bruņotā divīzija 'Burtnieks'", "15=15. bruņotā divīzija 'Staburadze'",
  "# Armour units (1919-1940)",
  "101=Autotanku pulks", "102=Autotanku brigāde", "103=Bruņoto vilcienu pulks", "104=Bruņuvilciens Nr. 5 'Kalpaks'", "105=Tehniskā divīzija"
  ]}
```

```json batch
{"addGroup": true, "group": "PAR_01", "selector": "Paratrooper Divisions", "addType": "paratrooper", "fallback": "%d. gaisa desanta divīzija",
  "comment": "# ===== Specialist troops =====\n\nOverrides vanilla LAT_PAR_01 (keys 1-10, fallback 'Aviodesanta divizija') as a plain list: Latvia had no airborne troops.",
  "add": [
  "1=1. gaisa desanta divīzija", "2=2. gaisa desanta divīzija", "3=3. gaisa desanta divīzija", "4=4. gaisa desanta divīzija", "5=5. gaisa desanta divīzija",
  "6=6. gaisa desanta divīzija", "7=7. gaisa desanta divīzija", "8=8. gaisa desanta divīzija", "9=9. gaisa desanta divīzija", "10=10. gaisa desanta divīzija"
  ]}
```

```json batch
{"addGroup": true, "group": "MAR_01", "selector": "Marine Divisions", "addType": "marine", "fallback": "%d. jūras kājnieku divīzija",
  "comment": "Overrides vanilla LAT_MAR_01 ('Jūras Kājnieku Divīzija', keys 1-10) as the plain variant of LAT_MAR_02.",
  "add": [
  "1=1. jūras kājnieku divīzija", "2=2. jūras kājnieku divīzija", "3=3. jūras kājnieku divīzija", "4=4. jūras kājnieku divīzija", "5=5. jūras kājnieku divīzija",
  "6=6. jūras kājnieku divīzija", "7=7. jūras kājnieku divīzija", "8=8. jūras kājnieku divīzija", "9=9. jūras kājnieku divīzija", "10=10. jūras kājnieku divīzija"
  ]}
```

```json batch
{"addGroup": true, "group": "MAR_02", "selector": "Coastal Defense & Marines", "addType": "marine", "fallback": "%d. jūras kājnieku divīzija", "link": "MAR_01",
  "comment": "Named variant of LAT_MAR_01: towns of the Baltic and Gulf of Riga coast as nicknames; the coastal defence units of the interwar army on 101 and up.",
  "add": [
  "# Coast",
  "1=1. jūras kājnieku divīzija 'Kolka'", "2=2. jūras kājnieku divīzija 'Ainaži'", "3=3. jūras kājnieku divīzija 'Pāvilosta'",
  "4=4. jūras kājnieku divīzija 'Salacgrīva'", "5=5. jūras kājnieku divīzija 'Roja'", "6=6. jūras kājnieku divīzija 'Engure'",
  "7=7. jūras kājnieku divīzija 'Mērsrags'", "8=8. jūras kājnieku divīzija 'Skulte'", "9=9. jūras kājnieku divīzija 'Užava'",
  "10=10. jūras kājnieku divīzija 'Jūrkalne'",
  "# Coastal defence (1919-1940)",
  "101=Daugavgrīvas cietoksnis", "102=Mangaļsalas nocietinājumi", "103=Krastu artilērijas pulks"
  ]}
```

```json batch
{"addGroup": true, "group": "MNT_01", "selector": "Mountain Divisions", "addType": "mountaineers", "fallback": "%d. kalnu kājnieku divīzija", "link": "INF_01",
  "comment": "Overrides vanilla LAT_MNT_01 ('Kalnu Kājnieku Divīzija', keys 1-10) with Latvia's uplands and highest hills; vanilla links it to LAT_INF_01.",
  "add": [
  "# Uplands and hills",
  "1=1. kalnu kājnieku divīzija 'Gaiziņkalns'", "2=2. kalnu kājnieku divīzija 'Vidzemes augstiene'", "3=3. kalnu kājnieku divīzija 'Latgales augstiene'",
  "4=4. kalnu kājnieku divīzija 'Alūksnes augstiene'", "5=5. kalnu kājnieku divīzija 'Augšzemes augstiene'", "6=6. kalnu kājnieku divīzija 'Rietumkursas augstiene'",
  "7=7. kalnu kājnieku divīzija 'Austrumkursas augstiene'", "8=8. kalnu kājnieku divīzija 'Lielais Liepukalns'", "9=9. kalnu kājnieku divīzija 'Vidzemes Šveice'",
  "10=10. kalnu kājnieku divīzija 'Kurzemes Šveice'"
  ]}
```

```json batch
{"addGroup": true, "group": "CAV_01", "selector": "Cavalry Regiments", "addType": "cavalry", "fallback": "%d. jātnieku pulks",
  "comment": "# ===== Cavalry =====\n\nVanilla tag. The army had one cavalry regiment (1921-1940, Daugavpils); keys 2-10 write over vanilla's title-cased entries.",
  "add": [
  "1=Latvijas 1. jātnieku pulks", "2=2. jātnieku pulks", "3=3. jātnieku pulks", "4=4. jātnieku pulks", "5=5. jātnieku pulks",
  "6=6. jātnieku pulks", "7=7. jātnieku pulks", "8=8. jātnieku pulks", "9=9. jātnieku pulks", "10=10. jātnieku pulks"
  ]}
```

```json batch
{"addGroup": true, "group": "CAV_02", "selector": "Cavalry Squadrons", "addType": "cavalry", "fallback": "%d. atsevišķais jātnieku eskadrons",
  "comment": "Squadron-sized templates: the squadrons and divizioni of 1919-1921, from which the 1st Cavalry Regiment was formed, and the regiment's own divizioni.",
  "add": [
  "# War of Independence (1919-1921)",
  "1=Latviešu atsevišķā jātnieku nodaļa", "2=1. jātnieku divizions", "3=Kurzemes jātnieku eskadrons", "4=Vidzemes jātnieku eskadrons",
  "5=Latgales jātnieku eskadrons", "6=Zemgales jātnieku eskadrons", "7=13. Tukuma kājnieku pulka eskadrons", "8=Latgales partizānu pulka eskadrons",
  "9=Ziemeļlatvijas brigādes 1. kavalērijas eskadrons", "10=Ziemeļlatvijas brigādes 2. kavalērijas eskadrons", "11=Ziemeļlatvijas brigādes atsevišķais eskadrons",
  "# Latvijas 1. jātnieku pulks (1921-1940)",
  "12=1. jātnieku pulka I divizions", "13=1. jātnieku pulka II divizions", "14=1. jātnieku pulka ložmetēju eskadrons"
  ]}
```

```json batch
{"addGroup": true, "group": "SEN_01", "selector": "Heritage Divisions", "addType": "infantry", "fallback": "%d. kājnieku divīzija", "canUse": "has_government = neutrality",
  "comment": "# ===== Ideology suites =====\n\nUlmanis era (neutrality): the ancient Latvian fight against the crusaders that the regime celebrated, by its chieftains, hillforts and battles. No Ulmanis-era honour unit existed; all are extrapolated.",
  "add": [
  "# Chieftains",
  "1=1. kājnieku divīzija 'Viesturs'", "2=2. kājnieku divīzija 'Namejs'", "3=3. kājnieku divīzija 'Visvaldis'", "4=4. kājnieku divīzija 'Tālivaldis'",
  "5=5. kājnieku divīzija 'Rūsiņš'", "6=6. kājnieku divīzija 'Varidots'", "7=7. kājnieku divīzija 'Vetseke'",
  "# Hillforts",
  "8=8. kājnieku divīzija 'Tērvete'", "9=9. kājnieku divīzija 'Mežotne'", "10=10. kājnieku divīzija 'Dobele'", "11=11. kājnieku divīzija 'Sidrabene'",
  "12=12. kājnieku divīzija 'Satekle'", "13=13. kājnieku divīzija 'Autine'", "14=14. kājnieku divīzija 'Daugmale'",
  "# Battles",
  "15=15. kājnieku divīzija 'Saule'", "16=16. kājnieku divīzija 'Durbe'", "17=17. kājnieku divīzija 'Aizkraukle'"
  ]}
```

```json batch
{"addGroup": true, "group": "PK_01", "selector": "Thunder Cross Divisions", "addType": ["infantry", "militia"], "fallback": "%d. pērkonkrustiešu divīzija", "canUse": "has_government = fascism",
  "comment": "Pērkonkrusts (fascism; the vanilla Ugunskrusts path): its five apgabali and its trieciengrupas, then its symbols as nicknames. The movement fielded no military units, so all are extrapolated; its slogans and its leader are not used.",
  "add": [
  "# Apgabali",
  "1=Pērkonkrusta Rīgas apgabala divīzija", "2=Pērkonkrusta Kurzemes apgabala divīzija", "3=Pērkonkrusta Vidzemes apgabala divīzija",
  "4=Pērkonkrusta Latgales apgabala divīzija", "5=Pērkonkrusta Zemgales apgabala divīzija",
  "# Trieciengrupas",
  "6=Pērkonkrusta trieciengrupu divīzija",
  "# Symbols",
  "7=7. pērkonkrustiešu divīzija 'Ugunskrusts'", "8=8. pērkonkrustiešu divīzija 'Māras krusts'", "9=9. pērkonkrustiešu divīzija 'Zibens'",
  "10=10. pērkonkrustiešu divīzija 'Auseklis'", "11=11. pērkonkrustiešu divīzija 'Jumis'"
  ]}
```

```json batch
{"addGroup": true, "group": "RED_01", "selector": "Red Rifle Divisions", "addType": "infantry", "fallback": "%d. latviešu strēlnieku divīzija", "canUse": "has_government = communism",
  "comment": "Latvian formations of the Red Army (communism): the 24th Territorial Rifle Corps of 1940-1941 and the 130th Latvian Rifle Corps of 1944-1945, with their divisions and regiments, each on its own number.",
  "add": [
  "1=1. atsevišķais latviešu strēlnieku rezerves pulks", "24=24. teritoriālais strēlnieku korpuss", "43=43. gvardes Rīgas latviešu strēlnieku divīzija",
  "92=92. strēlnieku pulks", "121=121. gvardes strēlnieku pulks", "122=122. strēlnieku pulks", "123=123. gvardes strēlnieku pulks",
  "125=125. gvardes strēlnieku pulks", "130=130. latviešu strēlnieku korpuss", "181=181. strēlnieku divīzija", "183=183. strēlnieku divīzija",
  "186=186. strēlnieku pulks", "191=191. strēlnieku pulks", "195=195. strēlnieku pulks", "201=201. latviešu strēlnieku divīzija",
  "227=227. strēlnieku pulks", "243=243. strēlnieku pulks", "285=285. strēlnieku pulks", "295=295. strēlnieku pulks",
  "308=308. latviešu strēlnieku divīzija", "319=319. strēlnieku pulks", "323=323. strēlnieku pulks", "355=355. strēlnieku pulks"
  ]}
```

```json batch
{"addGroup": true, "group": "NP_01", "selector": "National Partisans", "addType": ["infantry", "militia"], "fallback": "%d. nacionālo partizānu divīzija", "canUse": "has_government = democratic",
  "comment": "Latvian national partisans of 1944-1956 (democratic), who fought for the republic that the Latvian Central Council's declaration of 8 September 1944 restored: their organisations, then their battles as nicknames.",
  "add": [
  "# Organisations",
  "1=Latvijas Nacionālo partizānu apvienība", "2=Tēvzemes Sargu partizānu apvienība", "3=Latvijas Nacionālo partizānu organizācija",
  "4=Ziemeļkurzemes partizānu organizācija", "5=Latviešu nacionālo partizānu apvienība 'Kurzeme'", "6=Ilūkstes partizānu pulks",
  "7=Partizānu vienība 'Kārlis Krauja'",
  "# Battles",
  "8=8. nacionālo partizānu divīzija 'Stompaki'", "9=9. nacionālo partizānu divīzija 'Kabile'", "10=10. nacionālo partizānu divīzija 'Gostiņi'",
  "11=11. nacionālo partizānu divīzija 'Īle'", "12=12. nacionālo partizānu divīzija 'Usma'", "13=13. nacionālo partizānu divīzija 'Viļaka'"
  ]}
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 30 -> 20 | 1. kājnieku divīzija, 2. kājnieku divīzija, 3. kājnieku divīzija, 4. kājnieku divīzija, 5. kājnieku divīzija, 6. kājnieku divīzija, 7. kājnieku divīzija, 8. kājnieku divīzija, 9. kājnieku divīzija, 10. kājnieku divīzija, 11. kājnieku divīzija, 12. kājnieku divīzija, 13. kājnieku divīzija, 14. kājnieku divīzija, 15. kājnieku divīzija, 16. kājnieku divīzija, 17. kājnieku divīzija, 18. kājnieku divīzija, 19. kājnieku divīzija, 20. kājnieku divīzija | 1. Kurzemes kājnieku divīzija (to INF_02), 2. Vidzemes kājnieku divīzija (to INF_02), 3. Latgales kājnieku divīzija (to INF_02), 4. Zemgales kājnieku divīzija (to INF_02), 5. Rīgas kājnieku divīzija (to INF_02), 6. Sēlijas kājnieku divīzija (to INF_02), 7. Ziemeļlatvijas kājnieku divīzija (to INF_02), 8. Dienvidlatvijas kājnieku divīzija (to INF_02), 9. Malienas kājnieku divīzija (to INF_02), 10. Augškurzemes kājnieku divīzija (to INF_02), 11. Liepājas kājnieku divīzija (to INF_02), 12. Daugavpils kājnieku divīzija (to INF_02), 18 fallback stubs | selector: 'Infantry Division' -> 'Infantry Divisions'; fallback: '%d. Kājnieku divīzija' -> '%d. kājnieku divīzija' |
| REG_01 | 50 -> 40 | Cēsu bataljons, Latvijas Neatkarības bataljons, Kara skolas kadetu rota, 1. Dagdas robežsargu bataljons, 2. Zilupes robežsargu bataljons, 3. Abrenes robežsargu bataljons, 13. Tukuma kājnieku pulks, Piebalgas bataljons, Malienas bataljons, Latviešu skolnieku bataljons, 2. Cēsu pulka skolnieku rota, Ziemeļlatvijas rezerves bataljons, Bauskas atsevišķais bataljons, 1. partizānu pulks, Rezerves latviešu strēlnieku pulks | Cēsu rotu pulks, Neatkarības bataljons, Kara skolas kadetu bataljons, 1. Dagdas robežsargu pulks, 2. Zilupes robežsargu pulks, 3. Abrenes robežsargu pulks, 4. Krāslavas robežsargu pulks, 18 fallback stubs | selector: 'Infantry Regiment' -> 'Infantry Regiments'; fallback: '%d. Kājnieku pulks' -> '%d. kājnieku pulks' |
| AIZ_01 | 35 -> 22 | 3. Ludzas aizsargu pulks, 4. Jēkabpils aizsargu pulks, 6. Aizputes aizsargu pulks, 7. Valkas aizsargu pulks, 9. Madonas aizsargu pulks, 10. Cēsu aizsargu pulks, 11. Tukuma aizsargu pulks, 13. Bauskas aizsargu pulks, 14. Kuldīgas aizsargu pulks, 15. Liepājas aizsargu pulks, 16. Jelgavas aizsargu pulks, 17. Rēzeknes aizsargu pulks, 18. Daugavpils aizsargu pulks, 19. Abrenes aizsargu pulks, Aizsargu jūras divizions | 3. Kuldīgas aizsargu pulks, 4. Liepājas aizsargu pulks, 6. Jelgavas aizsargu pulks, 7. Bauskas aizsargu pulks, 9. Cēsu aizsargu pulks, 10. Valkas aizsargu pulks, 11. Madonas aizsargu pulks, 13. Jēkabpils aizsargu pulks, 14. Abrenes aizsargu pulks, 15. Ludzas aizsargu pulks, 16. Rēzeknes aizsargu pulks, 17. Daugavpils aizsargu pulks, 18. Tukuma aizsargu pulks, 19. Rīgas pilsētas aizsargu pulks, Aizsargu motorizētais pulks, Jūras aizsargu divizions, Aizsargu sakaru bataljons, 11 fallback stubs | division_types: [infantry] -> [infantry militia]; fallback: '%d. Aizsargu pulks' -> '%d. aizsargu pulks' |
| ARM_02 | 35 -> 20 | 1. bruņotā divīzija 'Lāčplēsis', 2. bruņotā divīzija 'Kurzemnieks', 3. bruņotā divīzija 'Zemgalietis', 4. bruņotā divīzija 'Imanta', 5. bruņotā divīzija 'Staburags', 6. bruņotā divīzija 'Sargs', 7. bruņotā divīzija 'Latgalietis', 8. bruņotā divīzija 'Vidzemnieks', 9. bruņotā divīzija 'Pērkons', 10. bruņotā divīzija 'Koknesis', 11. bruņotā divīzija 'Laimdota', 12. bruņotā divīzija 'Spīdola', 13. bruņotā divīzija 'Aizkrauklis', 14. bruņotā divīzija 'Burtnieks', 15. bruņotā divīzija 'Staburadze', Autotanku brigāde, Bruņoto vilcienu pulks, Bruņuvilciens Nr. 5 'Kalpaks', Tehniskā divīzija | Bruņudivīzija 'Lāčplēsis', Bruņubrigāde 'Imanta', Bruņubrigāde 'Kurzemnieks', Bruņubrigāde 'Viesturs', Bruņubrigāde 'Zemgalietis', Bruņubrigāde 'Tālivaldis', Bruņukolonna 'Sargs', Bruņukolonna 'Latvietis', Bruņukolonna 'Staburags', Bruņukolonna 'Pērkons', Bruņuvilcienu pulks, Bruņuvilciens 'Kalpaks', Bruņuvilciens 'Komandieris', Bruņuvilciens 'Krišjānis Barons', Bruņuvilciens 'Pirmās', 1. Tanku bataljons, 2. Tanku bataljons, Motorizētais kājnieku pulks, Mehanizētais izlūku bataljons, 15 fallback stubs | selector: 'Armored & Mobile Divisions' -> 'Armored & Mobile (Named)'; fallback: '%d. Bruņudivīzija' -> '%d. bruņotā divīzija'; links: [] -> [LAT_ARM_01] |
| MAR_02 | 25 -> 13 | 1. jūras kājnieku divīzija 'Kolka', 2. jūras kājnieku divīzija 'Ainaži', 3. jūras kājnieku divīzija 'Pāvilosta', 4. jūras kājnieku divīzija 'Salacgrīva', 5. jūras kājnieku divīzija 'Roja', 6. jūras kājnieku divīzija 'Engure', 7. jūras kājnieku divīzija 'Mērsrags', 8. jūras kājnieku divīzija 'Skulte', 9. jūras kājnieku divīzija 'Užava', 10. jūras kājnieku divīzija 'Jūrkalne', Daugavgrīvas cietoksnis, Mangaļsalas nocietinājumi, Krastu artilērijas pulks | Daugavgrīvas krasta cietoksnis, Mangaļsalas krasta nocietinājumi, Liepājas krasta cietoksnis, Bolderājas jūras garnizons, Ventspils krasta garnizons, Kolkas krasta aizsardzības bataljons, Ainažu krasta aizsardzības bataljons, Jūras krastu apsardzības pulks, 17 fallback stubs | fallback: '%d. Jūras kājnieku pulks' -> '%d. jūras kājnieku divīzija'; links: [] -> [LAT_MAR_01] |
| CAV_01 | 20 -> 10 | Latvijas 1. jātnieku pulks, 2. jātnieku pulks, 3. jātnieku pulks, 4. jātnieku pulks, 5. jātnieku pulks, 6. jātnieku pulks, 7. jātnieku pulks, 8. jātnieku pulks, 9. jātnieku pulks, 10. jātnieku pulks | 2. Latgales jātnieku pulks, 3. Kurzemes jātnieku pulks, 4. Vidzemes jātnieku pulks, 5. Zemgales jātnieku pulks, 6. Sēlijas jātnieku pulks, 15 fallback stubs | selector: 'Cavalry Regiment' -> 'Cavalry Regiments'; fallback: '%d. Jātnieku pulks' -> '%d. jātnieku pulks' |
| CAV_02 | 20 -> 14 | Latviešu atsevišķā jātnieku nodaļa, 1. jātnieku divizions, Kurzemes jātnieku eskadrons, Vidzemes jātnieku eskadrons, Latgales jātnieku eskadrons, Zemgales jātnieku eskadrons, 13. Tukuma kājnieku pulka eskadrons, Latgales partizānu pulka eskadrons, Ziemeļlatvijas brigādes 1. kavalērijas eskadrons, Ziemeļlatvijas brigādes 2. kavalērijas eskadrons, Ziemeļlatvijas brigādes atsevišķais eskadrons, 1. jātnieku pulka I divizions, 1. jātnieku pulka II divizions, 1. jātnieku pulka ložmetēju eskadrons | Atsevišķais jātnieku divizions, Kalpaka jātnieku eskadrons, Studentu jātnieku eskadrons, Ziemeļlatvijas jātnieku eskadrons, Latgales partizānu jātnieku eskadrons, Augškurzemes partizānu jātnieku eskadrons, Cēsu jātnieku eskadrons, Rīgas garnizona jātnieku eskadrons, Liepājas jātnieku eskadrons, Daugavpils jātnieku eskadrons, Jelgavas jātnieku eskadrons, Valmieras jātnieku eskadrons, Ventspils jātnieku eskadrons, Aizsargu jātnieku eskadrons, 6 fallback stubs | selector: 'Cavalry Squadrons & Partisans' -> 'Cavalry Squadrons'; fallback: '%d. Atsevišķais jātnieku eskadrons' -> '%d. atsevišķais jātnieku eskadrons' |
| INF_02 | new, 24 | 1. Kurzemes kājnieku divīzija (from INF_01), 2. Vidzemes kājnieku divīzija (from INF_01), 3. Latgales kājnieku divīzija (from INF_01), 4. Zemgales kājnieku divīzija (from INF_01), 5. Rīgas kājnieku divīzija (from INF_01), 6. Sēlijas kājnieku divīzija (from INF_01), 7. Ziemeļlatvijas kājnieku divīzija (from INF_01), 8. Dienvidlatvijas kājnieku divīzija (from INF_01), 9. Malienas kājnieku divīzija (from INF_01), 10. Augškurzemes kājnieku divīzija (from INF_01), 11. Liepājas kājnieku divīzija (from INF_01), 12. Daugavpils kājnieku divīzija (from INF_01), 13. Tālavas kājnieku divīzija, 14. Jersikas kājnieku divīzija, 15. Kokneses kājnieku divīzija, 16. Atzeles kājnieku divīzija, 17. Idumejas kājnieku divīzija, 18. Metsepoles kājnieku divīzija, 19. Piebalgas kājnieku divīzija, 20. Jelgavas kājnieku divīzija, 21. Cēsu kājnieku divīzija, 22. Valmieras kājnieku divīzija, 23. Rēzeknes kājnieku divīzija, 24. Ventspils kājnieku divīzija | - | - |
| GAR_01 | new, 21 | Rīgas garnizons, Liepājas garnizons, Daugavpils garnizons, Jelgavas garnizons, Ventspils garnizons, Rēzeknes garnizons, Valmieras garnizons, Cēsu garnizons, Aizputes garnizons, Dobeles garnizons, Bauskas garnizons, Siguldas garnizons, Alūksnes garnizons, Gulbenes garnizons, Ludzas garnizons, Abrenes garnizons, Kuldīgas garnizons, Tukuma garnizons, Jēkabpils garnizons, Krustpils garnizons, Robežsargu brigāde | - | - |
| MOT_01 | new, 10 | 1. motorizētā kājnieku divīzija, 2. motorizētā kājnieku divīzija, 3. motorizētā kājnieku divīzija, 4. motorizētā kājnieku divīzija, 5. motorizētā kājnieku divīzija, 6. motorizētā kājnieku divīzija, 7. motorizētā kājnieku divīzija, 8. motorizētā kājnieku divīzija, 9. motorizētā kājnieku divīzija, 10. motorizētā kājnieku divīzija | - | - |
| MEC_01 | new, 10 | 1. mehanizētā kājnieku divīzija, 2. mehanizētā kājnieku divīzija, 3. mehanizētā kājnieku divīzija, 4. mehanizētā kājnieku divīzija, 5. mehanizētā kājnieku divīzija, 6. mehanizētā kājnieku divīzija, 7. mehanizētā kājnieku divīzija, 8. mehanizētā kājnieku divīzija, 9. mehanizētā kājnieku divīzija, 10. mehanizētā kājnieku divīzija | - | - |
| ARM_01 | new, 10 | 1. tanku divīzija, 2. tanku divīzija, 3. tanku divīzija, 4. tanku divīzija, 5. tanku divīzija, 6. tanku divīzija, 7. tanku divīzija, 8. tanku divīzija, 9. tanku divīzija, 10. tanku divīzija | - | - |
| PAR_01 | new, 10 | 1. gaisa desanta divīzija, 2. gaisa desanta divīzija, 3. gaisa desanta divīzija, 4. gaisa desanta divīzija, 5. gaisa desanta divīzija, 6. gaisa desanta divīzija, 7. gaisa desanta divīzija, 8. gaisa desanta divīzija, 9. gaisa desanta divīzija, 10. gaisa desanta divīzija | - | - |
| MAR_01 | new, 10 | 1. jūras kājnieku divīzija, 2. jūras kājnieku divīzija, 3. jūras kājnieku divīzija, 4. jūras kājnieku divīzija, 5. jūras kājnieku divīzija, 6. jūras kājnieku divīzija, 7. jūras kājnieku divīzija, 8. jūras kājnieku divīzija, 9. jūras kājnieku divīzija, 10. jūras kājnieku divīzija | - | - |
| MNT_01 | new, 10 | 1. kalnu kājnieku divīzija 'Gaiziņkalns', 2. kalnu kājnieku divīzija 'Vidzemes augstiene', 3. kalnu kājnieku divīzija 'Latgales augstiene', 4. kalnu kājnieku divīzija 'Alūksnes augstiene', 5. kalnu kājnieku divīzija 'Augšzemes augstiene', 6. kalnu kājnieku divīzija 'Rietumkursas augstiene', 7. kalnu kājnieku divīzija 'Austrumkursas augstiene', 8. kalnu kājnieku divīzija 'Lielais Liepukalns', 9. kalnu kājnieku divīzija 'Vidzemes Šveice', 10. kalnu kājnieku divīzija 'Kurzemes Šveice' | - | - |
| SEN_01 | new, 17 | 1. kājnieku divīzija 'Viesturs', 2. kājnieku divīzija 'Namejs', 3. kājnieku divīzija 'Visvaldis', 4. kājnieku divīzija 'Tālivaldis', 5. kājnieku divīzija 'Rūsiņš', 6. kājnieku divīzija 'Varidots', 7. kājnieku divīzija 'Vetseke', 8. kājnieku divīzija 'Tērvete', 9. kājnieku divīzija 'Mežotne', 10. kājnieku divīzija 'Dobele', 11. kājnieku divīzija 'Sidrabene', 12. kājnieku divīzija 'Satekle', 13. kājnieku divīzija 'Autine', 14. kājnieku divīzija 'Daugmale', 15. kājnieku divīzija 'Saule', 16. kājnieku divīzija 'Durbe', 17. kājnieku divīzija 'Aizkraukle' | - | - |
| PK_01 | new, 11 | Pērkonkrusta Rīgas apgabala divīzija, Pērkonkrusta Kurzemes apgabala divīzija, Pērkonkrusta Vidzemes apgabala divīzija, Pērkonkrusta Latgales apgabala divīzija, Pērkonkrusta Zemgales apgabala divīzija, Pērkonkrusta trieciengrupu divīzija, 7. pērkonkrustiešu divīzija 'Ugunskrusts', 8. pērkonkrustiešu divīzija 'Māras krusts', 9. pērkonkrustiešu divīzija 'Zibens', 10. pērkonkrustiešu divīzija 'Auseklis', 11. pērkonkrustiešu divīzija 'Jumis' | - | - |
| RED_01 | new, 23 | 1. atsevišķais latviešu strēlnieku rezerves pulks, 24. teritoriālais strēlnieku korpuss, 43. gvardes Rīgas latviešu strēlnieku divīzija, 92. strēlnieku pulks, 121. gvardes strēlnieku pulks, 122. strēlnieku pulks, 123. gvardes strēlnieku pulks, 125. gvardes strēlnieku pulks, 130. latviešu strēlnieku korpuss, 181. strēlnieku divīzija, 183. strēlnieku divīzija, 186. strēlnieku pulks, 191. strēlnieku pulks, 195. strēlnieku pulks, 201. latviešu strēlnieku divīzija, 227. strēlnieku pulks, 243. strēlnieku pulks, 285. strēlnieku pulks, 295. strēlnieku pulks, 308. latviešu strēlnieku divīzija, 319. strēlnieku pulks, 323. strēlnieku pulks, 355. strēlnieku pulks | - | - |
| NP_01 | new, 13 | Latvijas Nacionālo partizānu apvienība, Tēvzemes Sargu partizānu apvienība, Latvijas Nacionālo partizānu organizācija, Ziemeļkurzemes partizānu organizācija, Latviešu nacionālo partizānu apvienība 'Kurzeme', Ilūkstes partizānu pulks, Partizānu vienība 'Kārlis Krauja', 8. nacionālo partizānu divīzija 'Stompaki', 9. nacionālo partizānu divīzija 'Kabile', 10. nacionālo partizānu divīzija 'Gostiņi', 11. nacionālo partizānu divīzija 'Īle', 12. nacionālo partizānu divīzija 'Usma', 13. nacionālo partizānu divīzija 'Viļaka' | - | - |
<!-- END CHANGE TABLE -->
