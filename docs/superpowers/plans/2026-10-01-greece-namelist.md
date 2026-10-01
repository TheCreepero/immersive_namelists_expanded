# Greece (GRE) Namelist Plan

## Context
Greece has no INEX file. Vanilla ships 9 `GRE_*` groups in the base game: 30-entry INF, MNT and GAR lists, 10-11 entry CAV, MOT, MEC, ARM, PAR and MAR lists. Every entry is the same stub (`%s Merarchía Pezikoú`, Roman ordinal, Latin transliteration). MNT and GAR reuse the infantry wording, so mountain and garrison divisions are named "Infantry Division". The only scripted references are `GRE_INF_01` (`common/national_focus/greece.txt:1928`) and `GRE_CAV_01` (`:1943`), both in effect blocks, so both vanilla tags stay as INEX overrides. This is a new-nation authoring task per `hoi4-inex-namelist-authoring`. Goal: override and expand all nine vanilla groups and add a full suite of historical and ideology-gated lists.

## Phase 0 decisions (user-confirmed)
- **Script**: Latin transliteration in the vanilla style (stress accents kept: `Merarchía`, `Taxiarchía`, `Sýntagma`, `Lóchos`). No Greek script. Transliteration follows ELOT 743 conventions (η and ι are `i`, υ is `y`, χ is `ch`, ξ is `x`, ου is `ou`, ΜΠ/ΝΤ as `b`/`d` where Greek-sounding).
- **Naming policy**: verified Hellenic Army, Navy and Air Force names plus plausible extrapolation in the Greek pattern. Every extrapolated name goes on the "Author confirmation" list. Nothing is invented to reach a count.
- **Ideology suites** (gated only by `can_use = { has_government = ... }`): fascism, communism, democratic (Venizelist), neutrality/monarchy.
- **New list families**: plain/named pairs and irregular light troops (Evzones, Lochoi); territorial, islands and fortresses; expeditionary and Asia Minor; naval and air-ground.

## Design decisions
- **Ordinals**: Greek writes Arabic numeral plus ending (`5η Μεραρχία`), so fallbacks transliterate the ending by gender: `%di` (feminine: Merarchía, Taxiarchía, Chorofylakí), `%do` (neuter: Sýntagma, Tágma), `%dos` (masculine: Lóchos). This replaces vanilla's Roman `%s`. `%dª` passes `-ValidateOnly` in Brazil, so a trailing letter suffix after `%d` is accepted. Test `%di` on the first group created. If rejected, fall back to Roman `%s` as vanilla does, and note it here.
- **Nominative forms**: the unit noun stays nominative (`Merarchía Pezikoú` is the established genitive-attribute title "Division of Infantry", not a vanilla error). Fix the real slips only (`Michanopoiiméni`, `Tethorakisméni` spelling and accents are checked by the dossier).
- **Neutrality versus fascism risk (settle in the dossier)**: Greece starts in HOI4 under Metaxas's Fourth of August regime, which is the in-game `neutrality` government (to confirm in `history/countries/GRE - Greece.txt`). Regime-era units (Fourth of August, EON, Royal Guard) therefore split by what a player can reach: royal, Evzone and Metaxist state units go on `neutrality`; a fascist-flavoured EON/national-syndicalist militia and any Axis-collaborating formations go on `fascism` only if history supports them. Collaborationist Security Battalions are excluded unless the dossier makes a case. No flag or focus gates, per `CLAUDE.md` §6.

## Vanilla findings (`-InspectVanilla GRE`)
| Tag | Vanilla state | Action |
|---|---|---|
| GRE_INF_01 | 30 stubs, `%s Merarchía Pezikoú`, focus reference | plain: `-ClearOrdered`, fallback `%di Merarchía Pezikoú` |
| GRE_MOT_01 / MEC_01 | 11 stubs each, link INF_01 | plain, keep link |
| GRE_ARM_01 | 11 stubs, link INF_01 | plain, fix accents |
| GRE_CAV_01 | 10 stubs, focus reference | override with real entries (Merarchía Ippikoú, Syntágmata Ippéon) |
| GRE_PAR_01 / MAR_01 | 10 stubs each | override with real entries |
| GRE_MNT_01 | 30 infantry stubs, links INF_01 | override as mountain list: Taxiarchíes Oreinés, Lochoi Oreinón Katadromón |
| GRE_GAR_01 | 30 stubs, `Merarchía Pezikoú`, links INF_01 | override with real garrison entries |

New tags must avoid these nine. `-AddGroup` refuses an existing tag.

## Target group suite (about 33 groups)
| Section | Tags | Notes |
|---|---|---|
| Field divisions | INF_01/02, MOT_01/02, MEC_01/02, ARM_01/02 | Plain keeps the vanilla tag (fallback only, no `ordered`). Named gets a new tag, selector `"<Plain> (Named)"`, `-Link <plain>`. MOT_01 and MEC_01 keep their vanilla link to INF_01. MOT_02 and MEC_02 link MOT_01. INF_02 links INF_01. ARM_02 links ARM_01. Named lists carry the regional titles used by 1940 divisions (Merarchía Ipeírou, Makedonías, Kritis, Thessalías) plus extrapolation. |
| Specialist | CAV_01, MNT_01, MNT_02, EVZ_01, LOK_01, PAR_01, PAR_02, MAR_01, MAR_02 | CAV, MNT_01, PAR_01 and MAR_01 override vanilla. New: MNT_02 mountain brigades (Taxiarchíes Oreinés, Rimini tradition), EVZ_01 Evzones and Lochoi light infantry (Evzonikó Sýntagma, Presidential Guard heritage), LOK_01 Sacred Band, Lochos Oreinón Katadromón and Raiders (Ierós Lóchos, Mountaineer Raiding Companies), PAR_02 air-landing and Air Force paratroops, MAR_02 naval infantry and coastal defence. |
| Territorial | GAR_01, ISL_01, FOR_01, GEN_01, RES_01 | GAR_01 overrides vanilla. New: ISL_01 island and Aegean commands (Crete, Dodecanese, Ionian, Lemnos), FOR_01 fortress and frontier sectors (Metaxas Line forts such as Rupel, Echinos, Istibei; Tmíma Synórou), GEN_01 Gendarmerie (Chorofylakí), RES_01 Reserve and National Guard battalions (Ethnofrourá/TEA tradition if verified). |
| Air-ground | AIR_01 | Air Force ground defence and airfield units. Merged into PAR_02 if the dossier finds fewer than about 8 verified or plausible names. |
| Expeditionary | ASM_01, EXP_01, LEG_01 | ASM_01 Asia Minor Army divisions (Smyrna, Archipelago, Cretan, Ionia, Idea). EXP_01 Middle East Brigades, Rimini, Korean Expeditionary Force. LEG_01 volunteer and Philhellenic legions (Hellenic Legion). Thin lists are merged, not padded. |
| Neutrality/Monarchy (`neutrality`) | ROY_01 Royal Guard Divisions, ROY_02 Royal Volunteers | Royal Guard (Vasilikí Froúra), Evzone Guard, Fourth of August state units, Royal Hellenic Army traditions. |
| Fascism (`fascism`) | FAS_01 National Youth Divisions, FAS_02 Party Militia | EON (Ethnikí Orgánosis Neoléas) and fascist-flavoured militia lists, subject to the risk above. |
| Communism (`communism`) | RED_01 People's Liberation Divisions, RED_02 Partisan Guards, COM_01 Democratic Army Divisions | ELAS (Ethnikós Laïkós Apeleftherotikós Stratós) regiments and divisions, ELAN naval, EPON youth, OPLA, and the 1946-49 Democratic Army (DSE) divisions. |
| Democratic (`democratic`) | DEM_01 National Defence Divisions, DEM_02 Republican Volunteer Corps | Venizelist Ethnikí Amyna (1916), Cretan revolutionary and Macedonian Struggle traditions, 1924-35 Republic units, Pantelis-era volunteers. |

The tag count and per-group `can_use` get finalized once the dossier lands. Lists with thin history are merged rather than padded. Selectors are plural, at most 28 characters, with no demonyms (`"Evzone Regiments"`, not `"Greek Evzones"`).

## Workflow (phases)
1. **Plan file in repo**: after approval, copy this file to `docs/superpowers/plans/2026-10-01-greece-namelist.md`. Leave the "Author confirmation" section empty and the Progress checklist unticked except Phase 0. (`-AuditPlan` is audit-only.)
2. **Research**: dispatch `inex-historical-researcher` with the country, tag, Phase 0 answers, the vanilla table and the neutrality/fascism risk. It writes `scratch/gre_dossier.md` with one `##` section per group family and returns at most 200 words. It covers:
   - Hellenic Army 1930s-40s order of battle: divisions I-XV and the A, B, Γ Corps, Army Corps districts, regimental numbers and patron names, Cavalry Division, Evzone regiments, Mountain Division and Rimini brigade, the 1941 fortress sectors and Metaxas Line forts, border battalions.
   - Interwar and earlier cadres: Asia Minor campaign divisions (Smyrna, Archipelago, Cretan), Balkan Wars regiments, National Defence divisions of 1916-17, the Venizelist and 1935 coup units.
   - Special forces and exile forces: Sacred Band, LOK, Greek Raiders, Middle East brigades, Rimini, Korean War Expeditionary Force, Hellenic Navy marine and coastal units, RHAF ground units.
   - Ideological material: Fourth of August regime, EON, ELAS and DSE unit structure and regional names, Venizelist and republican forces, Royal Guard.
   - Greek terminology in ELOT transliteration for every unit class (Merarchía, Taxiarchía, Sýntagma, Tágma, Lóchos, Stóllos, Tmíma, Chorofylakí), with correct gender for each ordinal ending.
   - Vanilla grammar checks for the three Greek compounds (`Michanopoiiméni`, `Michanokíniti`, `Tethorakisméni`).
3. **Clear point**: with the dossier written and the plan holding the decisions, tell the user it is safe to `/clear`, then resume with "author the GRE namelist".
4. **Author** `common/units/names_divisions/INEX_GRE_names_divisions.txt`:
   - Seed with the Write tool from the skill §4 template (UTF-8 without BOM, balanced braces). Start with the nine vanilla overrides.
   - Add groups only via `build.ps1 -EditNames GRE -AddGroup -Group <TAG> -Selector ... -AddType ... -Fallback ... [-CanUse ...] [-Link ...]`.
   - Fill them with `-EditNames GRE -Batch scratch\gre_edits.json` (apostrophes in names such as `Ierós Lóchos 'Pelopidas'`).
   - Turn vanilla groups into plain variants with `-ClearOrdered -Comment "<override note>"`.
   - Depth: 20-30+ authored entries on the main lines, fallbacks reading naturally past the last entry.
5. **Docs sync** (`CLAUDE.md` §4):
   - `WORKSHOP_DESCRIPTION_GUIDELINES.md`: cross-reference row and `[b]Greece[/b]` block, 2-3 bullets, `[i]...[/i]` examples. Check the length headroom with `-Check GRE` (`Docs:` warnings). No emojis.
   - `README.md` summary-table row with tags and source file.
   - `wiki/Greece.md`, `wiki/Home.md` row, `wiki/_Sidebar.md` entry. Keep group rows in step with `-SyncWiki GRE`.
   - The wiki push (`powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document GRE division namelists"`) is outward-facing and runs only after the user confirms.
6. **Verify**: `powershell -File .\build.ps1 -Check GRE`, plus `-DiffNames GRE`. Every audit flag still showing needs a written reason in the plan.
7. **Proofread**: authored transliterated Greek names will exceed 25, so dispatch `inex-code-reviewer` with the `-DiffNames GRE` added names, the language (Greek in ELOT-style Latin transliteration with gendered ordinal endings), and the Author-confirmation list. Fix findings via `-EditNames`, re-run `-Check GRE`, and record them here.
8. **Completion**: report the `-Check` result. On request, output the ready-to-copy Steam BBCode description and a change summary.

## Critical files
- New: `common/units/names_divisions/INEX_GRE_names_divisions.txt`, `wiki/Greece.md`, `docs/superpowers/plans/2026-10-01-greece-namelist.md`, `scratch/gre_dossier.md`, `scratch/gre_edits.json`.
- Edited: `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `README.md`, `wiki/Home.md`, `wiki/_Sidebar.md`.
- Reused: `docs/superpowers/plans/2026-10-01-brazil-namelist.md` as the structure template, and `build.ps1` (`-InspectVanilla`, `-AddGroup`, `-EditNames -Batch`, `-SyncWiki`, `-Check`) as the only editing path after seeding. Nothing in `build.ps1`, tests, skills or `CLAUDE.md`/`GEMINI.md` is edited.

## Verification
- `-Check GRE` passes (`-ValidateOnly`, Pester suite, audit, `Docs:` checks, diff counts).
- All 9 vanilla tags appear in the INEX file, so none falls back to a vanilla stub; `GRE_INF_01` and `GRE_CAV_01` (focus-referenced) have real or plain-fallback definitions.
- `-Audit GRE -NamesOnly` spot check: plain groups show `Variant: plain`, gated groups show `can_use`, no `DUPLICATE_NAME`, `POLITICAL_ENTRY` or `PLACEHOLDER_ENTRIES`.
- No `has_completed_focus`, decision, idea or flag gates.
- `git status` shows only the intended files changed.

## Author confirmation
Entries held for the author (wrong or unverified beyond this list is a proofreader finding):
- GRE_ASM_01: Idea Division (`Merarchía Idéas`); battle honorifics Sakaría, Eskisehír, Afyón, Kioutacheías, Ousák are extrapolated.
- GRE_RED_01: ELAS divisions IV, VII and XII left to the fallback (unverified).
- GRE_COM_01: DSE divisions 9 (Kastoriás) and 10 (Vítsiou); the source lists both at Kastoria.
- GRE_EVZ_01: regiments 4/41 and 6/43 (numbering family extrapolated).
- GRE_INF_02 key 7 and GRE_GAR_01: Kozánis seat is extrapolated.
- GRE_PAR_01: `Aerometaferómeni` (air-landing adjective) and the Pegásou/Ikárou/Daidálou honorifics.
- GRE_FOR_01: `Tmíma Ochýrosis` sector title (the 21 fort names are verified).
- GRE_MOT_02 / MEC_02 / ARM_02: river, battle and commander honorifics are extrapolated by design.
- GRE_EXP_01: `Filellinikí` / `Garibaldinikí Legeóna`, `Táktikon Sóma`, `Tágma Spárti` Greek forms.
- GRE_ROY_01 / FAS_01 / DEM_01 / DEM_02: Fourth of August, Third Hellenic Civilization, royal-name, Venizelist and volunteer titles are extrapolated.
- GRE_RED_02 `Tágma Othomanón` (DSE Ottoman Battalion) and GRE_FOR_01 `Apóspasma Kroúsias` (genitive form of Krousia): source forms unconfirmed.
- GRE_RED_02 and GRE_GEN_01: generic partisan and gendarmerie unit titles are extrapolated.

## Progress
- [x] Phase 0 decisions and vanilla inspection
- [x] Dossier: scratch/gre_dossier.md (only 7 web calls; sections 4-5 largely background knowledge; about 30 UNVERIFIED items in 6.4)
  - Vanilla fixes: `Pezonavton` -> `Pezonaftón`; `Alexiptotiston` -> `Alexiptotistón`. Other vanilla terms are correct.
  - Ordinals confirmed: 1η / 5ο / 3ος matches `%di` / `%do` / `%dos`.
  - Gating: the Fourth of August regime fits `neutrality`, not fascism. Security Battalions excluded. The 5/42 Evzone Regiment (Psarros, EKKA) goes in the democratic suite.
  - Recommended merges (to apply during authoring): LEG_01 into EXP_01; AIR_01 and RES_01 into GAR_01; FAS_01/02 into ROY (a thin EON-only fascism list is the alternative). MOT/MEC swap suggestion is unconfirmed.
  - Thin pools: cavalry (8-10), marines, paratroops, raiders, ELAS/DSE.
- [x] Second research pass: scratch/gre_dossier2.md (36 web calls)
  - Verified: ELAS divisions I, II, III, V, VI, VIII, IX, X, XI, XIII, ELAN, 54th Regiment; DSE divisions 1, 2, 3, 6, 7, 8, 11 (9/10 uncertain); Asia Minor corps A'-Δ' and divisions I-V, VII, IX-XIII; 2/39 and 5/42 Evzones; all 21 Metaxas forts.
  - UNVERIFIED: ELAS IV, VII, XII, XIV-XVI; Idea/Ionia/Thrace/Aydin divisions; 4/41, 6/43 Evzones; Fortified Sector term.
  - ELAS, DSE and cavalry have under 15 verified entries each, so merge regional pools.
  - Ordinals: Arabic in modern sources; Roman for pre-1940 corps and divisions (e.g. `Α΄ Σώμα`); ELAS used Roman plus η.
  - User decisions: keep a small EON-only fascism list (FAS_01, marked thin); second research pass accepted.
  - Merges now settled: LEG_01 into EXP_01; AIR_01 and RES_01 into GAR_01. Merge ELAS regional pools into RED_01 and thin cavalry/raider/marine pools as needed during authoring.
- [x] Authoring: `INEX_GRE_names_divisions.txt`, 28 groups, 382 names. Settled: PAR_02, MAR_02, ROY_02, LEG_01, AIR_01, RES_01 merged away; MEC_01 re-anchored on MOT_01 (vanilla linked INF_01); Michanokíniti/Michanopoiiméni swapped back to the Greek meaning; DEM_01 first four names prefixed `Ethnikís Amýnis` to avoid duplicating ASM_01.
- [x] Docs sync: README row, workshop cross-reference row and `[b]Greece[/b]` block, `wiki/Greece.md` (generated from the file by `scratch/gre_wiki.py`), Home and Sidebar. Wiki push not yet run (needs your confirmation).
- [x] -Check GRE: Validate OK, 355 tests passed, 0 failed. Flags: LOW_DEPTH x3 (PAR_01 9 authored, EVZ_01 13, FAS_01 10), kept: the history supports no more without padding (Greece had no interwar airborne force, the Evzone regiments are few, and EON is a youth organization).
- [x] Proofread: `inex-code-reviewer` dispatched (about 380 names). It made no web lookups, so findings are language-knowledge only. Applied 38 renames (batch `scratch/gre_fix.json`): demotic genitive Lárisas, Rethýmnou, Kalamátas, Óssas, Ioannínon; stress Píndou, Trítou, Párnithas, Antartón, Drámas, Vólou, Kioutácheias; Thessaloníkis made consistent; Sakaría to Sangaríou; Afyón to Afión Karachisár; Vitsíou/Vítsiou to the indeclinable Vítsi; Aris Velouchiótis to genitive Ari Velouchióti; Leuktron to Lefktron (own rule). Rejected: Katadromón (genitive plural of katadromí, the real LOK name). Held: `Tágma Othomanón` (RED_02) and `Apóspasma Kroúsias` (FOR_01) came from the dossier and the reviewer could not place them. `-Check GRE` passes again (355 tests, 0 failed).
- [ ] Wiki push (needs user confirmation)
