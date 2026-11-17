# INEX Roadmap

Which nations to work on next: open plans (section A), reworks of namelists INEX already has (section B), nations INEX does not cover yet (section C), and a backlog of low-impact tags (section D).

Snapshot: 2026-11-17, game version 1.19.3. Numbers go stale as work ships; refresh them with:

```powershell
powershell -File .\build.ps1 -Audit ALL            # INEX triage table (coverage snapshot)
powershell -File .\build.ps1 -Audit <KEY>          # one file's flags
powershell -File .\build.ps1 -InspectVanilla <TAG> # a vanilla nation's groups (section C)
```

**Ranking.** Game weight first (focus tree, army size, role in the war, how often players and the AI field the nation), then how poor the vanilla list is, then research cost. "Named" counts the vanilla `ordered` entries whose text differs from their group's fallback once ordinal suffixes (`%dst`, `%d-va`, `%d.`) are folded together: a rough measure of entries that are more than the fallback repeated. A list with 0 named is a bare 1..N run. The count is approximate: a mere prefix (NZL's "NZ") counts as a name.

**A roadmap entry is not a plan.** Work on a nation starts with the authoring skill (`hoi4-inex-namelist-authoring`, new nations and full re-authors) or the audit skill (`hoi4-inex-namelist-audit`, existing files), which writes the plan under `docs/plans/`. The research anchors below are starting points for that research, not checked facts. When a nation ships, update its row here and drop its prose.

## A. Open plans

| Plan | Status | Note |
|---|---|---|
| [docs/plans/2026-10-27-division-types-retag.md](docs/plans/2026-10-27-division-types-retag.md) | READY, not applied | Retags twelve groups (BRA, POL, SOV, SWE, USA) from support-company ids to line ids [NAM-026], so the game gives them templates. Small and mechanical; do it first. Commit 890ae46 is titled "Implement…" but only added the plan files: the namelists still carry the old types. Its ship step clears the matching `docs/tooling-backlog.md` entry. |
| [docs/plans/2026-10-25-china-namelist.md](docs/plans/2026-10-25-china-namelist.md) | READY | New CHI file (Tier 1). Needs room in the Workshop description first (see Cross-cutting notes). |

Carry out a READY plan with `hoi4-inex-namelist-implement`.

## Coverage snapshot

20 tags in 22 files (Germany has three: GER, GER_ADDITIONAL and GER_SS). Two other tags get one INEX group each: RAJ (`ENG_MNT_02`, Gurkhas) and UKR (`SOV_CAV_02`, Cossacks).

| Key | Groups | Authored | Flags | Last commit |
|---|---:|---|---:|---|
| SOV | 30 | 849/1728 (49 %) | 27 | 2026-10-25 |
| POL | 39 | 433/569 (76 %) | 25 | 2026-10-20 |
| GER_ADDITIONAL | 35 | 810/1216 (67 %) | 17 | 2026-10-28 |
| ITA | 43 | 888/993 (89 %) | 15 | 2026-10-25 |
| ENG | 30 | 657/741 (89 %) | 14 | 2026-10-25 |
| FRA | 36 | 653/892 (73 %) | 14 | 2026-10-25 |
| EST | 18 | 208/299 (70 %) | 10 | 2026-10-25 |
| JAP | 32 | 495/1205 (41 %) | 9 | 2026-10-17 |
| LAT | 19 | 227/308 (74 %) | 9 | 2026-10-25 |
| MEX | 23 | 377/459 (82 %) | 7 | 2026-10-11 |
| ROM | 29 | 348/656 (53 %) | 6 | 2026-10-17 |
| SPR | 38 | 714/771 (93 %) | 6 | 2026-10-11 |
| BRA | 36 | 613/634 (97 %) | 5 | 2026-10-11 |
| HUN | 25 | 296/572 (52 %) | 4 | 2026-11-17 |
| GER | 33 | 1125/1998 (56 %) | 4 | 2026-10-28 |
| LIT | 19 | 287/394 (73 %) | 4 | 2026-10-25 |
| FIN | 30 | 536/646 (83 %) | 3 | 2026-10-17 |
| GRE | 28 | 374/458 (82 %) | 3 | 2026-10-17 |
| GER_SS | 13 | 630/641 (98 %) | 2 | 2026-10-28 |
| USA | 36 | 1313/1386 (95 %) | 2 | 2026-10-17 |
| PER | 13 | 307/327 (94 %) | 1 | 2026-10-17 |
| SWE | 29 | 421/468 (90 %) | 1 | 2026-10-17 |

A low authored share is not a problem in itself: long numbered runs (JAP, GER, SOV) keep it down. The flags are the better signal, and many of the remaining ones (LOW_DEPTH on short historical groups, NAME_LONG on real long titles) were kept on judgment in the audits that shipped them.

## B. Rework queue (existing files)

**Done.** The rework round of 2026-10-25 shipped LIT (full re-author), EST, LAT (the Baltic program), SOV, ENG, GER_ADDITIONAL, ITA and FRA; GER, GER_ADDITIONAL and GER_SS got a further expansion on 2026-10-28. Their plans are in `docs/plans/archive/`.

**Left, all low priority:**

| Key | Why look again | Skill |
|---|---|---|
| POL | 14 LOW_DEPTH (mostly short historical groups, audited 2026-10-20), 8 PLACEHOLDER_ENTRIES, 7 KEY_NUMBER_MISMATCH and 2 UNGATED_POLITICAL. The last two kinds are worth a small cleanup audit. | audit |
| SOV | Still the most flags after its audit: 11 NAME_LONG, 10 PLACEHOLDER_ENTRIES, 7 LOW_DEPTH. Check which were kept on judgment before planning anything. | audit |
| GER_ADDITIONAL | 14 PLACEHOLDER_ENTRIES, mostly from the plausible groups added 2026-10-28. | audit |
| JAP | Low authored share from long numbered runs; 9 flags. | audit |

**No action needed now:** SWE, PER, USA, GER_SS, GRE, FIN, LIT, GER, BRA, SPR, ROM, MEX.

## C. New nations

Vanilla state is `named / ordered` from the vanilla file (game version 1.19.3). Size: S (one research pass, under 15 groups), M, L (several hundred authored names, more than one research pass).

### Tier 1

| Nation | TAG | Focus tree | Vanilla | Size | State |
|---|---|---|---|---|---|
| ~~Hungary~~ | HUN | `hungary.txt`, `hungary_wuw.txt` | 74 / 569 | M | Shipped (docs/plans/archive/2026-10-25-hungary-namelist.md) |
| China (Nationalist) | CHI | `china_nationalist.txt` (+ shared) | 168 / 469 | L | Plan READY |
| Commonwealth program | CAN, AST, NZL, SAF, RAJ | `canada.txt`, `australia.txt`, `new_zealand.txt`, `south_africa.txt`, `india.txt` | 0 / 492, 10 / 405, 286 / 434 (mostly the "NZ" prefix), 6 / 459, 86 / 636 | L (5 x S-M) | |
| Yugoslavia | YUG | `yugoslavia.txt` | 61 / 144 | M | |
| Czechoslovakia | CZE | `czechoslovakia.txt`, `czechoslovakia_mu.txt` | 69 / 175 | M | |
| Turkey | TUR | `turkey.txt` | 7 / 205 | M | |

- **HUN, CHI.** Planned on 2026-10-25; the plans hold the research. HUN shipped on 2026-11-17 as a new file of 25 groups (plan in docs/plans/archive/2026-10-25-hungary-namelist.md). CHI's plan should be checked against PRC (Tier 2) and the warlords (section D) before it ships, so the lists do not overlap.
- **Commonwealth program.** Five focus trees, English-language names (cheap to proofread), deep and easily sourced histories, and vanilla lists that are ordinal 1..N runs ("%dst Canadian Infantry Division") apart from a few RAJ nicknames ('Red Eagle', 'Ball of Fire'). One file per nation, ENG's conventions as the model. Anchors: 1st, 2nd and 3rd Canadian Divisions; the 6th to 9th Australian Divisions ("Rats of Tobruk"); 2nd New Zealand Division; 1st and 6th South African (Armoured) Divisions; the 4th, 5th, 7th and 10th Indian Divisions. RAJ already has INEX's Gurkha group (`ENG_MNT_02`); its file must not duplicate it. Shared groups (guide §2): one short ANZAC group of the joint formations (ANZAC Corps of 1915 and 1941, I and II ANZAC Corps, ANZAC Mounted Division) in the AST file for `{ AST NZL }`, and perhaps a small Commonwealth group (1st Commonwealth Division, British Commonwealth Occupation Force) in the ENG file for ENG and the Dominions. National divisions stay in each nation's own file.
- **YUG.** The Royal Yugoslav Army named its divisions after rivers and regions (Dunavska, Drinska, Moravska, Vardarska, Šumadijska). Vanilla has some names in 9 groups; a full suite is a high payoff for the research. Ideology suites: royal guard, Partisan divisions (communist), Chetnik formations.
- **CZE.** The 1938 army: four armies, the fast divisions (rychlé divize), border regions, Legion heritage (Zborov). Alt-history paths in both trees need ideology suites. Vanilla's `HUN_*` and `AUSHUN_*` groups list CZE too (see Cross-cutting notes).
- **TUR.** A large tree and a large army with almost no named entries. Anchors: numbered infantry and cavalry divisions by corps area, fortress and strait commands; research needed before scoping.

### Tier 2

| Nation | TAG | Focus tree | Vanilla | Size | Note |
|---|---|---|---|---|---|
| Bulgaria | BUL | `bulgaria.txt` | 122 / 783 | M | Vanilla gives the infantry divisions their city names ('Sofia', 'Plovdiv', 'Sliven'); most of the other 15 groups are bare runs, and the communist group uses Russian-style forms ("Strelkova Divizija"). Cheap research. First in the tier. |
| Netherlands | HOL | `netherlands.txt` | 104 / 235 | M | Light Division (Lichte Divisie), Peel Division; the KNIL for INS is in the same vanilla file. |
| Belgium | BEL | `belgium.txt` | 20 / 149 | S | Chasseurs Ardennais, Cyclistes-Frontière; Force Publique for the Congo. |
| Norway | NOR | `norway.txt`, `nordic_shared.txt` | 0 / 110 | S | 1st to 6th Divisions of 1940, Brigade Nord-Norge. Sits next to SWE and FIN. |
| Denmark | DEN | `denmark.txt`, `nordic_shared.txt` | 56 / 113 | S | Jyske and Sjællandske Divisions, Livgarden. Pair with NOR. |
| Latin America program | ARG, then CHL, URG, PAR | `argentina.txt`, `chile.txt`, `uruguay.txt`, `paraguay.txt` | no own file; generic `SPAN` list only | M | Follows MEX and BRA. ARG first (largest army); anchors: numbered army divisions, Granaderos a Caballo. Its planning decides whether a shared Spanish-language group (guide §2) is worth adding for the minors that only have `SPAN_*` (BOL, PRU, COL, VEN, ECU, Central America); MEX and BRA stay out, and national heroes go in national files. |
| Portugal | POR | `portugal.txt` | 16 / 126 | S | |
| Switzerland | SWI | `switzerland.txt` | 0 / 110 | S | Field divisions and mountain brigades of 1939; names in German, French and Italian. |
| Austria | AUS | `austria.txt` | 9 / 159 | S | Bundesheer divisions and the Schnelle Division; Habsburg path. Its own file, not a group shared with GER: Austria is usually annexed in 1938, and the Austrian-raised Wehrmacht divisions (44th 'Hoch- und Deutschmeister', 45th, 2nd and 3rd Gebirgs) stay in GER. Plan the Austria-Hungary groups here as well (left out of the HUN plan): vanilla's nine `AUSHUN_*` groups (`for_countries = { AUS HUN CZE }`, `can_use = { has_cosmetic_tag = HUN_EMPIRE }`) serve whichever of AUS or HUN forms Austria-Hungary, and their German texts are broken (`%d.Infanterietruppendivision - Sarajevo`, no space after the ordinal, "Kolosvár", "Komáron"); a k.u.k. list after the 1914 divisions and their seats would replace them. |
| Manchukuo | MAN | `manchukuo.txt` | 60 / 205 | S | Manchukuo Imperial Army; coordinate with JAP. |
| Siam | SIA | `siam.txt` | 6 / 294 | S | Phayap Army. |
| Philippines | PHI | `philippines.txt` | 30 / 128 | S | Reserve divisions 11th to 101st, Philippine Scouts. |
| China (Communist) | PRC | `china_communist.txt` | 172 / 218 | M | 115th, 120th and 129th Divisions of the Eighth Route Army, the New Fourth Army. Check against the CHI plan. |

### Tier 3

Nations with a focus tree whose vanilla list is already decent, or whose army is small:

- **ETH**: 355 of 355 entries named already; an audit for quality is enough.
- **AFG**: 226 / 270 named.
- **IRQ**: 11 / 152, own tree.
- **ICE**: own tree, no army to speak of.
- **SLO, CRO**: Axis puppets without a tree of their own, 23 / 130 and 5 / 123.
- **INS**: if not done with HOL.

## D. Backlog (low-impact tags)

Tags worth a list only once the tiers above are done. `named / ordered` from vanilla.

| Group | Tags (named / ordered) | Note |
|---|---|---|
| Chinese warlords | GXC 22/167, SHX 17/122, YUN 17/122, SIK 18/123, XSM 59/184, GSM 59/184, NXM 59/184, KHM 59/184, GDC 22/167, HBC 17/122, KUM 17/122, XIC 17/122, SIC 17/122, SND 17/122 | Decide with CHI/PRC whether they share one file. |
| German states | BAY 47/350, SAX 47/320, PRE 47/320, WUR 47/320, HAN 47/320, MEK 47/320, SHL 47/320, WGR 47/300 | Alt-history releasables sharing one template; Imperial-era regional names would suit them. |
| Soviet releasables | UKR 0/150, BLR 0/150, GEO 0/150, ARM 0/150, AZR 0/150, KAZ 0/150 | UKR already gets `SOV_CAV_02`. |
| Middle East | SAU 10/149, YEM 6/139, OMA 4/139, EGY 0/139, ISR 2/260 | EGY's list is vanilla's `ARBC` file. |
| Asia | NEP 3/171, BHU 6/174, TIB 0/206, TAN 0/130, MON 0/130, MEN 0/175, BRM 99/416, KOR 76/452, VIN 14/358 | |
| Europe minors | ALB 0/110, IRE 9/112, LUX 0/100, DDR 10/190, BYZ 21/120 | IRE's Emergency-era 1st and 2nd Divisions are an easy small file. |
| Alternate or cosmetic | CSA 394/507, AFA 10/10 | |
| Generic shared lists | `ENGL` (Commonwealth minors), `FREN` (French colonies), `SPAN` (Latin America minors) | Covered by vanilla's generic lists; no per-nation work planned. |

## Cross-cutting notes

- **Workshop description budget.** Steam caps the description at 8,000 [WS-008]; the budget is 7,500 (guide section 4), and each nation block is at most 450 characters (`WORKSHOP_DESCRIPTION_GUIDELINES.md`). The HUN ship (2026-11-17) cut the longest older blocks to make room for its 293-character block, and the description is back under 7,500 bytes with 20 nation blocks. CHI will not fit as it is: before it ships, make room again (shorter blocks, or fewer nations listed by name with a pointer to the wiki).
- **Generic lists stay in the game.** Vanilla's generic `SPAN_*` and `ENGL_*` groups list ARG, CHL, CAN, AST, NZL, SAF, RAJ and others in `for_countries`. They stay available to those nations next to any INEX file [NAM-001], and a group that redefines them cannot drop a tag from `for_countries` [NAM-020]. The planning session for those nations decides how to live with that. Vanilla's `HUN_*` groups list AUS and CZE as well and keep them out only through `can_use` (`tag = HUN` or the `HUN_EMPIRE` cosmetic tag); since a redefinition replaces `can_use` [NAM-020], an INEX group on such a tag keeps that gate, or AUS and CZE get the Hungarian lists.
- **Shared research.** Programs (Commonwealth, Nordic, Latin America, China) should share one research pass per region where possible, so their suites follow the same conventions, as the Baltic program did.
- **Shared groups.** A group several nations use (`for_countries` with more than one tag) only for truly joint formations in a shared language; otherwise mirrored groups, one per nation (guide §2, Shared Groups). Candidates: ANZAC (Commonwealth program), perhaps a Commonwealth group, perhaps a Spanish-language group for the Latin American minors.
