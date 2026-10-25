# INEX Roadmap

Which nations to work on next: reworks of namelists INEX already has (section A), nations INEX does not cover yet (section B), and a backlog of low-impact tags (section C).

Snapshot: 2026-10-25, game version 1.19.3. Numbers go stale as work ships; refresh them with:

```powershell
powershell -File .\build.ps1 -Audit ALL            # INEX triage table (section A)
powershell -File .\build.ps1 -Audit <KEY>          # one file's flags
powershell -File .\build.ps1 -InspectVanilla <TAG> # a vanilla nation's groups (section B)
```

**Ranking.** Game weight first (focus tree, army size, role in the war, how often players and the AI field the nation), then how poor the vanilla list is, then research cost. "Named" counts the vanilla `ordered` entries whose text differs from their group's fallback once ordinal suffixes (`%dst`, `%d-va`, `%d.`) are folded together: a rough measure of entries that are more than the fallback repeated. A list with 0 named is a bare 1..N run. The count is approximate: a mere prefix (NZL's "NZ") counts as a name.

**A roadmap entry is not a plan.** Work on a nation starts with the authoring skill (`hoi4-inex-namelist-authoring`, new nations and full re-authors) or the audit skill (`hoi4-inex-namelist-audit`, existing files), which writes the plan under `docs/plans/`. The research anchors below are starting points for that research, not checked facts. When a nation ships, move or strike its entry here.

## Coverage snapshot

19 tags in 21 files. Two other tags get one INEX group each: RAJ (`ENG_MNT_02`, Gurkhas) and UKR (`SOV_CAV_02`, Cossacks).

| Key | Groups | Authored | Flags | Last commit |
|---|---:|---|---:|---|
| LIT | 16 | 31/150 (21 %) | 52 | 2026-10-11 |
| SOV | 28 | 373/1706 (22 %) | 40 | 2026-10-17 |
| POL | 39 | 352/569 (62 %) | 35 | 2026-10-20 |
| ENG | 28 | 271/561 (48 %) | 31 | 2026-10-17 |
| ITA | 43 | 809/962 (84 %) | 26 | 2026-10-17 |
| GER_ADDITIONAL | 24 | 556/917 (61 %) | 25 | 2026-10-11 |
| LAT | 7 | 113/215 (53 %) | 17 | 2026-10-11 |
| FRA | 20 | 326/447 (73 %) | 12 | 2026-10-17 |
| JAP | 32 | 470/1205 (39 %) | 11 | 2026-10-17 |
| EST | 4 | 66/150 (44 %) | 9 | 2026-10-11 |
| GER | 33 | 1043/1733 (60 %) | 8 | 2026-10-25 |
| ROM | 29 | 348/656 (53 %) | 6 | 2026-10-17 |
| SPR | 38 | 676/771 (88 %) | 6 | 2026-10-11 |
| BRA | 36 | 611/634 (96 %) | 5 | 2026-10-11 |
| FIN | 30 | 521/646 (81 %) | 5 | 2026-10-17 |
| USA | 36 | 835/1386 (60 %) | 5 | 2026-10-17 |
| GER_SS | 10 | 597/616 (97 %) | 3 | 2026-10-11 |
| GRE | 28 | 364/458 (79 %) | 3 | 2026-10-17 |
| MEX | 23 | 431/459 (94 %) | 1 | 2026-10-11 |
| PER | 13 | 303/327 (93 %) | 1 | 2026-10-17 |
| SWE | 29 | 418/468 (89 %) | 0 | 2026-10-17 |

A low authored share is not a problem in itself: long numbered runs (JAP, USA, GER) keep it down. The flags are the better signal.

## A. Rework queue (existing files)

| # | Key | Kind | Size | Skill |
|---|---|---|---|---|
| 1 | ~~LIT~~ | Shipped 2026-10-25 | M | authoring |
| 2 | EST | Expansion | M | audit |
| 3 | LAT | Expansion | S | audit |
| 4 | SOV | Depth | L | audit |
| 5 | ENG | Depth | M | audit |
| 6 | GER_ADDITIONAL | Depth | M | audit |
| 7 | ITA | Cleanup | S | audit |
| 8 | FRA | Expansion | M | audit |
| 9 | POL, JAP | Low | S | audit |

1. ~~**LIT, Lithuania.**~~ Shipped 2026-10-25 as a full re-author (plan in docs/plans/archive/2026-10-25-lithuania-namelist.md). Before it, the weakest file in the mod, with nothing worth keeping. Every one of the 16 groups has only placeholder entries (0 authored in the core groups), and the fallbacks are machine translations, some in the wrong language: "Juras Peizazas Divizija" (literally "sea landscape") for marines, the Albanian "Bjeshkë" for mountain troops, "Apsisarvavimas Divizija" for armour. The selectors are singular and the file has a boilerplate header. Re-author it from scratch: the 1st to 3rd Infantry Divisions, regiments named after Grand Dukes, Hussar and Uhlan regiments, the Riflemen's Union (Šaulių sąjunga).
2. **EST, Estonia.** Only 4 groups: regiments, Defence League (Kaitseliit) malevs, an armour/mobile catch-all and marines. There is no division-level or cavalry group, `EST_REG_01` has a singular selector, and partisan names sit ungated in it (`POLITICAL_ENTRY`: Kuperjanovi, Sakala). Bring it up to the depth of FIN and LAT.
3. **LAT, Latvia.** 7 groups. Marines and cavalry are LOW_DEPTH, `LAT_CAV_02` mixes partisan names in ungated (`UNGATED_POLITICAL`), three selectors are singular, and the Workshop block has no `[i]` examples (a docs warning in `-Check`).

   **Baltic program:** do 1 to 3 together. The three nations share the `baltic_shared` focus tree, so their suites (defence leagues, ideology groups, Baltic Entente paths) should match, and one research pass covers all three.
4. **SOV, Soviet Union.** Broad (28 groups) but thin: 373/1706 authored. `SOV_ARM_01` (Tank Divisions) and `SOV_ARM_03` (Guards Tank Corps) have no authored entries, and the file has 17 PLACEHOLDER, 12 LOW_DEPTH and 9 NAME_LONG flags. The work is honorific titles (Guards, city and battle honours) over the numbered runs. Large, but the most-played nation after GER.
5. **ENG, United Kingdom.** 271/561 authored, 18 LOW_DEPTH groups (cavalry divisions 5 entries, armoured divisions 12). Deepen the British groups only: the Dominions get files of their own (section B, Commonwealth program), not more ENG groups.
6. **GER_ADDITIONAL, Germany (numbered series, Festung, militias).** 13 PLACEHOLDER and 11 LOW_DEPTH. Last touched 2026-10-11, while the main GER file was reworked on 2026-10-25; bring it level with that.
7. **ITA, Italy.** Cleanup pass: 16 LOW_DEPTH, 2 STALE_COMMENT, a TODO_COMMENT, one POLITICAL_ENTRY.
8. **FRA, France.** The smallest major: 20 groups against 43 for ITA and 38 for SPR, and its Workshop block has only 2 `[i]` examples. Let the audit scope an expansion: colonial and North African formations, and what the Vichy and Free French tags see.
9. **POL and JAP.** Low priority. POL's 21 LOW_DEPTH flags mostly mark short historical groups (audited 2026-10-20), and JAP's low authored share comes from long numbered runs.

**No action needed now:** SWE, MEX, PER, GRE, GER_SS, BRA, FIN, USA, SPR, ROM, GER.

## B. New nations

Vanilla state is `named / ordered` from the vanilla file (game version 1.19.3). Size: S (one research pass, under 15 groups), M, L (several hundred authored names, more than one research pass).

### Tier 1

| Nation | TAG | Focus tree | Vanilla | Size |
|---|---|---|---|---|
| Hungary | HUN | `hungary.txt`, `hungary_wuw.txt` | 74 / 569 | M |
| China (Nationalist) | CHI | `china_nationalist.txt` (+ shared) | 168 / 469 | L |
| Commonwealth program | CAN, AST, NZL, SAF, RAJ | `canada.txt`, `australia.txt`, `new_zealand.txt`, `south_africa.txt`, `india.txt` | 0 / 492, 10 / 405, 286 / 434 (mostly the "NZ" prefix), 6 / 459, 86 / 636 | L (5 x S-M) |
| Yugoslavia | YUG | `yugoslavia.txt` | 61 / 144 | M |
| Czechoslovakia | CZE | `czechoslovakia.txt`, `czechoslovakia_mu.txt` | 69 / 175 | M |
| Turkey | TUR | `turkey.txt` | 7 / 205 | M |

- **HUN.** The Axis minor players pick most, with two focus trees (Habsburg, communist and Arrow Cross paths). The vanilla list has defects as well as thin content: `HUN_INF_02` "Infantry Brigades" is typed `cavalry`, cavalry divisions fall back to "Huszár Dandár" (brigade), and motorized to "Motorizált Dandár". Anchors: the Honvéd light divisions (könnyű hadosztály), the Mobile Corps (Gyorshadtest), the 1st and 2nd Armoured Divisions, the Szent László Division, the hussars, the river flotilla.
- **CHI.** The largest army on the map. Vanilla has some names, but 9 groups for hundreds of divisions is thin. Anchors: the German-trained 36th, 87th and 88th Divisions, the New 1st and New 6th Armies, X Force and Y Force, the Northeastern Army. Plan it together with PRC (Tier 2) so the two do not overlap, and decide then whether the warlords (section C) share the work.
- **Commonwealth program.** Five focus trees, English-language names (cheap to proofread), deep and easily sourced histories, and vanilla lists that are ordinal 1..N runs ("%dst Canadian Infantry Division") apart from a few RAJ nicknames ('Red Eagle', 'Ball of Fire'). One file per nation, ENG's conventions as the model. Anchors: 1st, 2nd and 3rd Canadian Divisions; the 6th to 9th Australian Divisions ("Rats of Tobruk"); 2nd New Zealand Division; 1st and 6th South African (Armoured) Divisions; the 4th, 5th, 7th and 10th Indian Divisions. RAJ already has INEX's Gurkha group (`ENG_MNT_02`); its file must not duplicate it.
- **YUG.** The Royal Yugoslav Army named its divisions after rivers and regions (Dunavska, Drinska, Moravska, Vardarska, Šumadijska). Vanilla has some names in 9 groups; a full suite is a high payoff for the research. Ideology suites: royal guard, Partisan divisions (communist), Chetnik formations.
- **CZE.** The 1938 army: four armies, the fast divisions (rychlé divize), border regions, Legion heritage (Zborov). Alt-history paths in both trees need ideology suites.
- **TUR.** A large tree and a large army with almost no named entries. Anchors: numbered infantry and cavalry divisions by corps area, fortress and strait commands; research needed before scoping.

### Tier 2

| Nation | TAG | Focus tree | Vanilla | Size | Note |
|---|---|---|---|---|---|
| Bulgaria | BUL | `bulgaria.txt` | 122 / 783 | M | Vanilla gives the infantry divisions their city names ('Sofia', 'Plovdiv', 'Sliven'); most of the other 15 groups are bare runs, and the communist group uses Russian-style forms ("Strelkova Divizija"). Cheap research. First in the tier. |
| Netherlands | HOL | `netherlands.txt` | 104 / 235 | M | Light Division (Lichte Divisie), Peel Division; the KNIL for INS is in the same vanilla file. |
| Belgium | BEL | `belgium.txt` | 20 / 149 | S | Chasseurs Ardennais, Cyclistes-Frontière; Force Publique for the Congo. |
| Norway | NOR | `norway.txt`, `nordic_shared.txt` | 0 / 110 | S | 1st to 6th Divisions of 1940, Brigade Nord-Norge. Sits next to SWE and FIN. |
| Denmark | DEN | `denmark.txt`, `nordic_shared.txt` | 56 / 113 | S | Jyske and Sjællandske Divisions, Livgarden. Pair with NOR. |
| Latin America program | ARG, then CHL, URG, PAR | `argentina.txt`, `chile.txt`, `uruguay.txt`, `paraguay.txt` | no own file; generic `SPAN` list only | M | Follows MEX and BRA. ARG first (largest army); anchors: numbered army divisions, Granaderos a Caballo. |
| Portugal | POR | `portugal.txt` | 16 / 126 | S | |
| Switzerland | SWI | `switzerland.txt` | 0 / 110 | S | Field divisions and mountain brigades of 1939; names in German, French and Italian. |
| Austria | AUS | `austria.txt` | 9 / 159 | S | Bundesheer divisions and the Schnelle Division; Habsburg path. |
| Manchukuo | MAN | `manchukuo.txt` | 60 / 205 | S | Manchukuo Imperial Army; coordinate with JAP. |
| Siam | SIA | `siam.txt` | 6 / 294 | S | Phayap Army. |
| Philippines | PHI | `philippines.txt` | 30 / 128 | S | Reserve divisions 11th to 101st, Philippine Scouts. |
| China (Communist) | PRC | `china_communist.txt` | 172 / 218 | M | 115th, 120th and 129th Divisions of the Eighth Route Army, the New Fourth Army. Plan with CHI. |

### Tier 3

Nations with a focus tree whose vanilla list is already decent, or whose army is small:

- **ETH**: 355 of 355 entries named already; an audit for quality is enough.
- **AFG**: 226 / 270 named.
- **IRQ**: 11 / 152, own tree.
- **ICE**: own tree, no army to speak of.
- **SLO, CRO**: Axis puppets without a tree of their own, 23 / 130 and 5 / 123.
- **INS**: if not done with HOL.

## C. Backlog (low-impact tags)

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

- **Workshop description budget.** The description is at 12,203 of about 17,000 characters (guide section 4), leaving room for a few more nation blocks at most. Restructure it (shorter blocks, or a pointer to the wiki) before Tier 1 is finished, ideally while the Commonwealth program is being planned.
- **Generic lists stay in the game.** Vanilla's generic `SPAN_*` and `ENGL_*` groups list ARG, CHL, CAN, AST, NZL, SAF, RAJ and others in `for_countries`. They stay available to those nations next to any INEX file [NAM-001], and a group that redefines them cannot drop a tag from `for_countries` [NAM-020]. The planning session for those nations decides how to live with that.
- **Shared research.** Programs (Baltic, Commonwealth, Nordic, Latin America, China) should share one research pass per region where possible, so their suites follow the same conventions.
