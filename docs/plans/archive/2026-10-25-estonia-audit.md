# Estonia (EST) Namelist Audit - 2026-10-25

Status: DONE

File: `common/units/names_divisions/zz_INEX_EST_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit EST`)
- AUDIT SUMMARY EST: GROUPS=4 AUTHORED=66/150 FLAGS=9
- [EST_REG_01] flags: PLACEHOLDER_ENTRIES, SELECTOR_SINGULAR, DEAD_SELF_LINK_COMMENT, POLITICAL_ENTRY
- [EST_KL_01] flags: DEAD_SELF_LINK_COMMENT
- [EST_ARM_02] flags: PLACEHOLDER_ENTRIES, DEAD_SELF_LINK_COMMENT
- [EST_MAR_02] flags: PLACEHOLDER_ENTRIES, DEAD_SELF_LINK_COMMENT
- Found on manual review:
  - No INEX group reuses a vanilla tag, so vanilla's nine EST groups stay in the game unchanged (`-InspectVanilla EST`): `EST_INF_01` (20 entries), `EST_CAV_01`, `EST_MOT_01`, `EST_MEC_01`, `EST_ARM_01`, `EST_PAR_01`, `EST_MAR_01`, `EST_MNT_01` (10 each), `EST_GAR_01` (20). Every entry and fallback is `%s <noun>diviisi`: a Roman numeral (NAM-005) and the genitive case ("III Jalaväediviisi"). Each group links to `EST_INF_01`.
  - `EST_INF_01` is the group of the templates the vanilla focuses `EST_anti_communist_militia` (`estonia.txt:1480`, "Anti-Soviet Division") and `EST_baltic_stronger_together` (`estonia.txt:3452`, "Baltic Entente Division") create.
  - There is no division-level infantry list and no cavalry list; the four groups mix regiments, battalions, armoured cars and trains under division numbers.
  - Unattested or wrong entries: `EST_REG_01` 1-10 "Jalaväerügement" (the war-time form was `jalaväepolk`, 1-9), "Partisanide Rügement" (they were battalions), "Kalevlaste Maleva Jalaväerügement", "Tallinna Vahirügement"; `EST_ARM_02` "Soomusbrigaad"/"Soomuskolonn" (the names are single armoured cars), "1./2. Tankipataljon", 'Kapten Irv' twice; `EST_MAR_02` "Merekindlus", "Meredessantrügement" 1-7, the island batteries; `EST_KL_01` "Pärnu malev" (only Pärnumaa existed), "Alutaguse malev" (post-1999), four unattested malevkonnad.
  - Title-cased common nouns ("1. Jalaväerügement") where Estonian writes them lower case.
  - The header is a "Covers" list (R1) and every group still carries the template comments `# Names with numbers ...`.
  - The vanilla focus tree's ideology paths: Vaps and the Finno-Ugric union (`fascism`), Forest Brothers, the communist path; Estonia starts under Päts (`neutrality`, `history/countries/EST - Estonia.txt:219`).

## User decisions
- 2026-10-25, policy answers before research:
  - Scope: the full Baltic suite, matching LIT (fix the four INEX groups in place, reuse the nine vanilla tags, Named infantry variant, gated suites).
  - Suites: all four, neutrality (Päts era), fascism (Vaps), communism (Red Rifle), democratic (Freedom Fighters).
  - Orthography: native Estonian, lower-case common nouns; existing entries renamed in place.
  - Plausible extrapolation allowed, each extension listed under "Author confirmation".
- 2026-10-25, checkpoint: the audit report approved as proposed, nothing dropped. This includes the Vaps list with Finnic-land nicknames and dropping the numbered armoured-train entries of `EST_ARM_02`.

## Research
- `inex-audit-researcher`, run 1 (25 web calls): divisions, infantry regiments and battalions, cavalry, armour, coast. Main sources: et.wikipedia "Eesti Vabadussõjas osalenud väeosade loend", "Eesti sõjaväe ja Sõjaministeeriumi organisatsioon (1939)", "1. Diviis", "2. Diviis", "3. Diviis", "Soomusrongide divisjon", "Kaitsepataljonid (Eesti Vabadussõda)", "Auto-Tanki rügement"; en.wikipedia "Estonian Land Forces", "Armored Train Regiment (Estonia)", "Meredessantpataljon"; pygmywars Estonian Army OOB of 21 Oct 1919.
- `inex-audit-researcher`, run 2 (21 web calls): Kaitseliit, the four suites. Main sources: et.wikipedia "Eesti Kaitseliit", "22. Eesti Territoriaalne Laskurkorpus", "Eesti laskurkorpus", "Eesti Vabadussõjalaste Liit", "Eesti muinasmaakonnad", "Muistne vabadusvõitlus"; en.wikipedia "Finnish Infantry Regiment 200", "Johan Pitka", "Estonian partisans", "Vaps Movement"; ERR (Toompea malevkond; Battle of Keila).

## Rationale
- **Tags.** The four INEX tags stay (non-negotiable 1) and are fixed in place. Vanilla tags reused, so their names in the game are INEX's: `EST_INF_01` (plain), `EST_CAV_01`, `EST_MOT_01`, `EST_MEC_01`, `EST_ARM_01` (plain), `EST_PAR_01`, `EST_MAR_01`, `EST_MNT_01`, `EST_GAR_01`; every vanilla key (1-20 or 1-10) is written over, so no `%s ...diviisi` text stays. New: `EST_INF_02` (Named infantry), `EST_MUI_01` (neutrality), `EST_VAPS_01` (fascism), `EST_RED_01` (communism), `EST_MV_01` (democratic). No other `EST_` tag exists in the mod.
- **Numbering.** Vanilla links all eight other groups to `EST_INF_01`, and a redefinition cannot remove a link (NAM-020), so the regular groups share one number pool with the infantry. INEX writes those links out, adds `EST_INF_02` -> `EST_INF_01`, `EST_ARM_02` -> `EST_ARM_01` and `EST_MAR_02` -> `EST_MAR_01`. `-Link` works only on new groups (tooling backlog, Editing), so the two existing groups get their links in a one-off regex step that turns their dead `#link_numbering_with` comment into the link.
- **Orthography.** Native Estonian: ordinal `N.`, common nouns lower case, proper names and the adjective `Eesti` capitalised (`1. jalaväepolk`, `Kuperjanovi partisanide pataljon`, `7. Eesti laskurdiviis`). Nicknames in the nominative in straight single quotes, as in LIT (the map font has no „ “). Period spellings of vehicle names are kept (`'Kapten Irw'`, `'Wahur'`, `'Wibulane'`, `Suuropi`).
- **Fallbacks**, corrected from vanilla's genitive: `%d. jalaväediviis`, `%d. ratsapolk`, `%d. motoriseeritud jalaväediviis`, `%d. mehhaniseeritud jalaväediviis`, `%d. tankidiviis`, `%d. õhudessantdiviis`, `%d. merejalaväediviis`, `%d. mägijalaväediviis`, `%d. garnisonidiviis`; INEX groups `%d. jalaväerügement` (REG), `Kaitseliidu %d. malev` (KL), `%d. soomusdiviis` (ARM_02), `%d. merejalaväediviis` (MAR_02, was the unattested "Meredessantrügement").
- **Keys.** Numbered names stand on their own number; unnumbered historical units of a numbered group go on 101+ (`EST_CAV_01`, `EST_ARM_02`, `EST_MAR_02`, `EST_GAR_01`, `EST_MV_01`).
- **`EST_REG_01` "Infantry Regiments"**: 1-9 the war-time `N. jalaväepolk`; 10 `10. üksik jalaväepataljon` (no 10th regiment existed); 11-25 the attested battalions in their corrected forms; 26-39 further attested units of 1918-19 (Tallinna 1.-3. kaitsepataljon, löögipataljonid, Pihkva vabatahtlik korpus and others); the 25 placeholder entries 26-50 go, the fallback carries on from 40.
- **`EST_INF_02` "Infantry Divisions (Named)"**: 1-4 are the historical 1st-4th Divisions (HQ Rakvere, Tartu, Tallinn, Viljandi) named after the ancient county of their HQ region (`'Virumaa'`, `'Ugandi'`, `'Rävala'`, `'Sakala'`), then the other ancient counties and five battles of the War of Independence. Extrapolated: no division carried an honorific.
- **`EST_CAV_01` "Cavalry Regiments"**: the 1st and 2nd war-time regiments, the plain 3.-10. (extrapolated numbers over vanilla's keys), the peacetime `Ratsarügement` and the attested squadrons on 101+.
- **`EST_ARM_02` "Armored & Mobile (Named)"**: the armoured cars of the Soomusautode kolonn and the artillery wagons of the armoured trains as nicknames (`1. soomusdiviis 'Kapten Irw'`), the formations themselves (Soomusrongide diviis, Soomusautode kolonn, Auto-tankirügement, Soomusrongirügement) on 101+. The numbered train entries go: their train numbers clashed with the division keys. Types unchanged, so templates of every type keep the group.
- **`EST_MAR_02` "Coastal Defense & Marines"**: Named marine variant with island nicknames on 1-12 (extrapolated), the attested coastal units on 101+ (Meredessantpataljon, the Aegna, Naissaare and Suuropi komandantuurid, Peipsi laevastiku divisjon). The unattested batteries and "Meredessantrügement" 1-7 go.
- **`EST_KL_01` "Defence League Malevs"**: the 14 malevad of the interwar list, Merekaitseliit, and three Tallinn malevkonnad. Gets the `militia` type, like LIT's Riflemen's Union; stays ungated because the Kaitseliit served every interwar government.
- **`EST_MNT_01`**: Estonia has no mountains; the uplands and highest hills as nicknames (extrapolated). `EST_PAR_01`: plain numbers only (no Estonian airborne tradition). `EST_GAR_01`: garrison towns of the 1939 army on 1-20, the Viru piirivalvepataljon on 101.
- **Suites** (gated by `has_government` only, never mixing traditions): `EST_MUI_01` neutrality, the ancient fight for freedom (elders, strongholds, battles) that the Päts era celebrated; no Päts-era honour unit was found. `EST_VAPS_01` fascism, the Veterans' League (thinly documented) with the Finnic lands of the vanilla Finno-Ugric focuses as nicknames (extrapolated). `EST_RED_01` communism, the 22nd Territorial and 8th Estonian Rifle Corps, their divisions and regiments. `EST_MV_01` democratic, JR 200, Löögirühm Admiral Pitka, the RVL and the Forest Brothers' battles of 1944-53.
- **Exclusions**, as in LIT: no formation of 1941-44 under German occupation (Omakaitse, police battalions, the 20th Waffen-SS division and its regiments) and no 1941 Summer War insurgent group; no Estonian Red Army unit of 1918-19 (Red Terror of the Estonian Commune); political leaders (Päts, Sirk, Larka, Tief, Lauristin) are not patrons.

## Verified formations & commanders
- 1.-3. Diviis (1918-20) and 1.-3. Diviis (peacetime; HQ Rakvere, Tartu, Tallinn); 4. Diviis, formed 1 Feb 1940, Viljandi: et.wikipedia "1. Diviis", "2. Diviis", "3. Diviis"; en.wikipedia "Estonian Land Forces".
- 1.-9. jalaväepolk; Kuperjanovi and Sakala partisanide pataljon; Kalevlaste Maleva polk; Scoutspolk; Ingeri polk; Balti pataljon; Peipsi rannakaitsepataljon; the kaitsepataljonid of Viljandi (and 2.), Järvamaa, Tartu, Pärnu (and 2.), Saaremaa, Kuressaare, Narva, Võru (Kapten Sarapuu), Tallinna 1.-3.; Järvamaa löögipataljon, Tallinna 1. löögipataljon; Katšanovi üksikpataljon; Pankjavitsa pataljon; Tartu kooliõpilaste pataljon; Pihkva vabatahtlik korpus; Viru piirivalvepataljon: et.wikipedia "Eesti Vabadussõjas osalenud väeosade loend", "Kaitsepataljonid (Eesti Vabadussõda)".
- Peacetime: 1. and 7. jalaväerügement, 2.-10. üksik jalaväepataljon, Vahipataljon, Ratsarügement, Auto-tankirügement, Soomusrongirügement, Aegna, Naissaare and Suuropi komandantuur, Peipsi laevastiku divisjon: et.wikipedia "Eesti sõjaväe ja Sõjaministeeriumi organisatsioon (1939)".
- 1. and 2. ratsapolk; Tallinna üksik eskadron; Balti pataljoni eskadron; Soomusrongide diviisi eskadron: et.wikipedia list above.
- Soomusrongide diviis; broad-gauge train nr 1 "Kapten Irw"; armoured cars Estonia, Tasuja, Wahur, Toonela, Wibulane, Kalevipoeg, Vanapagan, Pisuhänd, Suur Tõll; armoured trucks Puuk and Sorts: et.wikipedia "Soomusrongide divisjon". Train wagon names Hävitaja, Maru, Vapper, Võitleja, Tont, Taara, Uku, Pikker, Kõu, Kalev, Müristaja, Tapper: en.wikipedia "Armored Train Regiment (Estonia)".
- Meredessantpataljon (1919, Peeter Kask): en.wikipedia "Meredessantpataljon". Battles of Paju and Laagna: et.wikipedia, en.wikipedia "Meredessantpataljon"; Võnnu, Krivasoo, Utria: well documented.
- Kaitseliit malevad Tallinna, Harju, Lääne, Saaremaa, Pärnumaa, Sakalamaa, Järva, Viru, Narva, Tartu, Tartumaa, Valgamaa, Võrumaa, Petserimaa; Merekaitseliit; Toompea malevkond: et.wikipedia "Eesti Kaitseliit"; ERR (Toompea).
- 22. Eesti territoriaalne laskurkorpus; 180. and 182. Eesti laskurdiviis ("Põhja" and "Lõuna" diviis); 21., 42., 140., 171., 232. laskurpolk: et.wikipedia "22. Eesti Territoriaalne Laskurkorpus". 8. Eesti laskurkorpus, 41. kaardiväe Eesti Tallinna laskurkorpus; 7. and 249. Eesti laskurdiviis, 118. and 122. kaardiväe Eesti Tallinna punalipuline laskurdiviis; 27., 300., 354., 917., 921., 925. laskurpolk; 1. Eesti üksik tagavaralaskurpolk: et.wikipedia "Eesti laskurkorpus".
- Löögirühm Admiral Pitka; Battle of Keila: en.wikipedia "Johan Pitka", ERR. Relvastatud Võitluse Liit; battles of Saika, Puutlipalu, Osula; Vastseliina; Võrumaa metsavennad: en.wikipedia "Estonian partisans". JR 200: en.wikipedia "Finnish Infantry Regiment 200".
- Eesti Vabadussõjalaste Liit; Korrapidajate üksused: et.wikipedia "Eesti Vabadussõjalaste Liit", en.wikipedia "Vaps Movement".
- Ancient counties Virumaa, Ugandi, Rävala, Sakala, Harjumaa, Järvamaa, Läänemaa, Alempois, Mõhu, Nurmekund, Vaiga, Jogentagana, Soopoolitse: et.wikipedia "Eesti muinasmaakonnad". Lembitu, Meeme, Otepää, Varbola, Lõhavere, Viljandi: et.wikipedia "Muistne vabadusvõitlus".

## Author confirmation
- Extrapolated (patterned, never fielded): every nickname of `EST_INF_02`, `EST_ARM_02` 1-24, `EST_MAR_02` 1-12, `EST_MNT_01`, `EST_VAPS_01` 1-12, `EST_MV_01` 1-7, `EST_MUI_01`; `EST_CAV_01` 3.-10. ratsapolk.
- Kaitseliidu Sadama and Põhja malevkond: probable (Tallinna malev bulletin of Feb 1940, OCR snippet only).
- `EST_MUI_01`: Valjala, Soontagana, Tarbatu, Ümera, Madisepäev, Jüriöö, Vesse (well known, not checked in this run).
- `EST_GAR_01` garrison towns past the 1939 chart's (Paide, Paldiski, Kärdla, Rapla, Türi, Põltsamaa, Jõgeva).
- `EST_MNT_01` hill and upland spellings (Haanja, Pandivere, Karula, Vooremaa, Suur Munamägi, Vällamägi, Emumägi, Kuutsemägi, Ebavere).
- Estonian forms "Soome jalaväerügement 200" and "Vabadussõjalaste korrapidajate üksus" (sources in English).
- The nicknames 'Põhja' and 'Lõuna' on the 180th and 182nd divisions (attested as "Põhja diviis", "Lõuna diviis").
- The Finnic land names of `EST_VAPS_01` (Karjala, Ingerimaa, Aunus, Viena, Vepsamaa, Vadjamaa, Liivimaa, Lapimaa, Komimaa, Marimaa, Udmurdimaa, Mordva).
- The fallbacks `%d. garnisonidiviis`, `Kaitseliidu %d. malev`, `%d. vabadussõjalaste diviis`, `%d. vabadusvõitlejate diviis`.
- `EST_GAR_01` Kuressaare garnison (not on the 1939 chart); `EST_CAV_01` the form "Kaitseliidu ratsaosakond" (the 1918 detachment is attested, the name form is not).
- `EST_MV_01` word order "Löögirühm Admiral Pitka" (sourced; the proofreader finds "Admiral Pitka löögirühm" more natural).

## Kept on judgment
- `POLITICAL_ENTRY` on `EST_REG_01` (Kuperjanovi and Sakala partisanide pataljon): army battalions of the War of Independence (the rubric's own example), not a political militia.
- `UNGATED_POLITICAL` on `EST_KL_01` if raised by the `militia` type: the Kaitseliit served every interwar government; kept ungated, as LIT's Riflemen's Union.
- `PLACEHOLDER_ENTRIES` and `LOW_DEPTH` on `EST_MOT_01`, `EST_MEC_01` and `EST_PAR_01`: plain lists without a named variant; they exist to write over vanilla's keys 1-10 (`%s ...diviisi`), so their entries are the fallback text by design. `EST_INF_01`, `EST_ARM_01` and `EST_MAR_01` show `Variant: plain` instead.
- `PLACEHOLDER_ENTRIES` and `LOW_DEPTH` on `EST_CAV_01`: keys 3-10 write over vanilla's cavalry texts with plain numbers; only two war-time regiments and one peacetime regiment existed.
- `PLACEHOLDER_ENTRIES` and `LOW_DEPTH` on `EST_RED_01`: the historical divisions (`7. Eesti laskurdiviis`, `249. Eesti laskurdiviis`) read like the fallback, so the lint counts 7 of 22 as authored.
- Rehearsal on an export of HEAD (2026-10-25): `AUDIT SUMMARY EST: GROUPS=18 AUTHORED=192/299 FLAGS=12`, `Flags: LOW_DEPTH x5, PLACEHOLDER_ENTRIES x5, UNGATED_POLITICAL x1, POLITICAL_ENTRY x1`. Any other flag is new.


## Implementation steps
Expected outputs below come from a rehearsal of this plan on an export of HEAD (2026-10-25).

- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames EST -Batch docs\plans\2026-10-25-estonia-audit.md`. Expect 18 lines and no `[ERROR]`: `Edited` for `EST_REG_01` (+36), `EST_KL_01` (+18), `EST_ARM_02` (+28), `EST_MAR_02` (+17); `Added` for `EST_INF_01` (20), `EST_INF_02` (23), `EST_CAV_01` (15), `EST_MOT_01`, `EST_MEC_01`, `EST_ARM_01`, `EST_PAR_01`, `EST_MAR_01`, `EST_MNT_01` (10 each), `EST_GAR_01` (21), `EST_MUI_01` (15), `EST_VAPS_01` (14), `EST_RED_01` (22), `EST_MV_01` (10).
- [x] 2. One-off fix (tooling backlog, Editing: `-Link` works only with `-AddGroup`): give `EST_ARM_02` and `EST_MAR_02` their links, close the empty lines the batch left where the dead self-link comments of `EST_REG_01` and `EST_KL_01` were, and drop the four template comments `# Names with numbers ...`. Run in one PowerShell call from the repository root:

  ```powershell
  $p=(Resolve-Path '.\common\units\names_divisions\zz_INEX_EST_names_divisions.txt').Path; $t=[IO.File]::ReadAllText($p); $n=@{}; foreach ($g in 'ARM','MAR') { $r="(EST_$($g)_02 = \r\n\{[\s\S]*?division_types = \{[^\r\n]*\}\r\n)\r\n\r\n"; $n[$g]=[regex]::Matches($t,$r).Count; $t=[regex]::Replace($t,$r,('$1' + "`r`n`tlink_numbering_with = { EST_$($g)_01 }`r`n`r`n")) }; $r='(division_types = \{[^\r\n]*\}\r\n)\r\n\r\n(\tfallback_name)'; $n['blank']=[regex]::Matches($t,$r).Count; $t=[regex]::Replace($t,$r,('$1' + "`r`n" + '$2')); $r="\t# Names with numbers \(only one number per entry\)\. ?\r\n\t# It's okay to have gaps in numbering\.\r\n"; $n['template']=[regex]::Matches($t,$r).Count; $t=[regex]::Replace($t,$r,''); [IO.File]::WriteAllText($p,$t,(New-Object Text.UTF8Encoding $false)); "arm=$($n.ARM) mar=$($n.MAR) blank=$($n.blank) template=$($n.template)"
  ```

  Expect `arm=1 mar=1 blank=2 template=4`. Any other count: stop (the file is then already written; `git diff` shows what changed).
- [x] 3. Replace the old "Covers" header, in one PowerShell call (the backtick-n sequences are line breaks):

  ```powershell
  powershell -File .\build.ps1 -SetHeader EST -HeaderText "Division template historical names system for Estonia (EST).`nImmersive Namelists Expanded (INEX)`nEstonian names as the army wrote them: an Arabic ordinal with a full stop (1. jalaväepolk, 7. Eesti laskurdiviis), lower-case common nouns, proper names and Eesti capitalised. Nicknames stand in the nominative in straight single quotes; the map font has no Estonian quotation marks. Period spellings of the 1919 vehicles are kept (Kapten Irw, Wahur, Wibulane, Suuropi).`nOverrides all nine vanilla EST groups (INF, CAV, MOT, MEC, ARM, PAR, MAR, MNT, GAR) and writes over every vanilla number."
  ```

  Expect `Header of zz_INEX_EST_names_divisions.txt replaced`.
- [x] 4. `powershell -File .\build.ps1 -Audit EST`. Expect `AUDIT SUMMARY EST: GROUPS=18 AUTHORED=192/299 FLAGS=12`, `[links: EST_ARM_01]` on `EST_ARM_02` and `[links: EST_MAR_01]` on `EST_MAR_02`, and only the flags under "Kept on judgment".
- [x] 5. Replace `wiki/Estonia.md` with the whole page under "Docs payload" (Write tool; the fence lines are not part of the page).
- [x] 6. `powershell -File .\build.ps1 -SyncWiki EST`. Expect `Estonia.md: 0 row(s) updated` and `wiki/Home.md: EST group count 4 -> 18`, with no `no row in wiki table` or `stale row` line. README and `wiki/_Sidebar.md` need no change (EST is registered).
- [x] 7. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: make the two replacements under "Docs payload" with the Edit tool.
- [x] 8. `powershell -File .\build.ps1 -Check EST`. Expect:
  - `Validate: OK` and the tests passing;
  - `AUDIT SUMMARY EST: GROUPS=18 AUTHORED=192/299 FLAGS=12` and `Flags: LOW_DEPTH x5, PLACEHOLDER_ENTRIES x5, UNGATED_POLITICAL x1, POLITICAL_ENTRY x1` (see "Kept on judgment");
  - `Refreshed change table in docs/plans/2026-10-25-estonia-audit.md: 18 changed group(s) vs HEAD; 1 TODO section(s) left` (the tool rewrites this plan's change table; the TODO is "Outcome", filled in step 9). Corrected 2026-10-25 after the first run: the rehearsal had no plan file in its export and printed `Plan: no audit plan in progress for EST` instead;
  - `Diff vs HEAD: 18 group(s) changed, +280 -131 name(s)`;
  - `Check passed`.
  A failing test outside the EST files (other sessions have uncommitted work in this repository): stop and report it, do not fix it.
- [x] 9. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 10. Ship, on the user's word:
  1. `ROADMAP.md`: replace `| 2 | EST | Expansion | M | audit |` with `| 2 | ~~EST~~ | Shipped <date> | M | audit |`, and replace `2. **EST, Estonia.** Only 4 groups:` with `2. ~~**EST, Estonia.**~~ Shipped <date> as an audit (plan in docs/plans/archive/2026-10-25-estonia-audit.md). Before it, only 4 groups:`.
  2. Move this plan to `docs/plans/archive/`.
  3. Stage only this plan's files: `git add common/units/names_divisions/zz_INEX_EST_names_divisions.txt wiki/Estonia.md wiki/Home.md WORKSHOP_DESCRIPTION_GUIDELINES.md ROADMAP.md docs/plans/archive/2026-10-25-estonia-audit.md`. Run `git diff --cached`: every hunk must belong to this plan. Other sessions edit `ROADMAP.md` and the docs in parallel; if a staged file carries changes that are not this plan's, unstage that file (`git restore --staged <file>`) and report it instead of committing it.
  4. Commit with the message `Audit EST division namelists`.
  5. `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document the audited EST division namelists"`.

## Docs payload
README, `wiki/_Sidebar.md`: no change. `wiki/Home.md`: the group count, by `-SyncWiki` in step 6.

### Workshop cross-reference row
In `WORKSHOP_DESCRIPTION_GUIDELINES.md`, replace the line

```text
| `zz_INEX_EST_names_divisions.txt` | Estonia | `EST` | Included (Historical & elite regiments, Kaitseliit malevad, Armored trains/cars, Coastal fortresses) |
```

with

```text
| `zz_INEX_EST_names_divisions.txt` | Estonia | `EST` | Included (Plain & Named infantry, motorized, mechanized and armored divisions, War of Independence regiments & partisan battalions, cavalry regiments, Kaitseliit malevad, armored trains & cars, coastal commands & marines, garrisons & border guards, paratroopers, mountain, Ancient Freedom, Veterans' League, Red Rifle divisions, Freedom Fighters) |
```

### Workshop block
In `WORKSHOP_DESCRIPTION_GUIDELINES.md`, replace the three lines

```text
[b]Estonia[/b]
- Historic infantry regiments (1.–10.) and elite battalions ([i]Kuperjanovi[/i], [i]Scouts[/i])
- Kaitseliit county malevad, armored trains/cars, and coastal naval fortresses
```

with

```text
[b]Estonia[/b]
- Plain & Named infantry, mobile and armored divisions with ancient-county, battle and 1919 armored-car identities ([i]1. jalaväediviis 'Virumaa'[/i], [i]1. soomusdiviis 'Kapten Irw'[/i]), and the War of Independence regiments and partisan battalions ([i]Kuperjanovi partisanide pataljon[/i])
- Cavalry regiments, Kaitseliit malevad ([i]Kaitseliidu Sakalamaa malev[/i]), coastal commands and island marines, garrisons and border guards, paratroopers and mountain troops
- Ideology suites: Ancient Freedom (neutrality), Veterans' League (fascist), Red Rifle divisions (communist) and Freedom Fighters (democratic)
```

### wiki/Estonia.md (whole page)

```markdown
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
```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader`, 2026-10-25 (3 web calls), on the added and changed names of all groups and the "Author confirmation" list:
- `RED_01` "118. and 122. ... laskurdiviis" -> English "and" -> not in the batch: the prompt summarised two entries in one line; the batch has two separate entries. No change.
- `MV_01` Löögirühm Admiral Pitka -> word order -> kept in the sourced form (research run 2); added to "Author confirmation".
- unsure: `REG_01` Scoutspolk -> the battalion was the Scoutspataljon -> kept: research run 1 gives "Scoutspolk" as the war-time form after the battalion's expansion (et.wikipedia list of units).
- unsure: `ARM_02` 'Sorts' -> standard nominative "sort" -> kept: the armoured truck's name in the et.wikipedia list of units (research run 1).
- unsure: `REG_01` Katšanovi üksikpataljon -> spelling of Kachanovo -> kept: the form of the et.wikipedia list of units (research run 1).
No batch change followed.

## Outcome
- Date: 2026-10-25.
- `-Check EST`: `AUDIT SUMMARY EST: GROUPS=18 AUTHORED=192/299 FLAGS=12`; `Flags: LOW_DEPTH x5, PLACEHOLDER_ENTRIES x5, UNGATED_POLITICAL x1, POLITICAL_ENTRY x1` (all listed under "Kept on judgment"); `Validate: OK`; tests 475 passed, 0 failed; `Diff vs HEAD: 18 group(s) changed, +280 -131 name(s)`; `Check passed`.
- Deviations: none. Steps 1 to 7 were ticked by an earlier run; this run began at step 8.

## Edit batch
Applied by `build.ps1 -EditNames EST -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "REG_01", "selector": "Infantry Regiments", "fallback": "%d. jalaväerügement",
  "comment": "# ===== Regular army =====\n\nInfantry regiments and battalions of the War of Independence (1918-1920) and the peacetime army.",
  "removeAll": true, "add": [
  "# War of Independence regiments",
  "1=1. jalaväepolk", "2=2. jalaväepolk", "3=3. jalaväepolk", "4=4. jalaväepolk", "5=5. jalaväepolk",
  "6=6. jalaväepolk", "7=7. jalaväepolk", "8=8. jalaväepolk", "9=9. jalaväepolk",
  "# Peacetime battalion",
  "10=10. üksik jalaväepataljon",
  "# Partisan, volunteer and guard units",
  "11=Kuperjanovi partisanide pataljon", "12=Sakala partisanide pataljon", "13=Kalevlaste Maleva polk", "14=Scoutspolk",
  "15=Vahipataljon", "16=Ingeri polk", "17=Balti pataljon", "18=Peipsi rannakaitsepataljon",
  "# County defence battalions, 1918-1919",
  "19=Viljandi kaitsepataljon", "20=Järvamaa kaitsepataljon", "21=Tartu kaitsepataljon", "22=Pärnu kaitsepataljon",
  "23=Saaremaa kaitsepataljon", "24=Narva kaitsepataljon", "25=Võru kaitsepataljon", "26=Tallinna 1. kaitsepataljon",
  "27=Tallinna 2. kaitsepataljon", "28=Tallinna 3. kaitsepataljon", "29=Viljandi 2. kaitsepataljon", "30=Pärnu 2. kaitsepataljon",
  "# Other units",
  "31=Tallinna 1. löögipataljon", "32=Katšanovi üksikpataljon", "33=Pankjavitsa pataljon", "34=Tartu kooliõpilaste pataljon",
  "35=Pihkva vabatahtlik korpus", "36=Kalevi üksik jalaväepataljon" ] }
```

```json batch
{ "addGroup": true, "group": "INF_01", "selector": "Infantry Divisions", "addType": "infantry", "fallback": "%d. jalaväediviis", "after": "REG_01",
  "comment": "Overrides vanilla EST_INF_01 as the plain (un-nicknamed) variant; keys 1-20 are written so that vanilla's '%s Jalaväediviisi' texts do not show. The vanilla focuses EST_anti_communist_militia and EST_baltic_stronger_together name their templates from this group.",
  "add": [ "1=1. jalaväediviis", "2=2. jalaväediviis", "3=3. jalaväediviis", "4=4. jalaväediviis", "5=5. jalaväediviis",
  "6=6. jalaväediviis", "7=7. jalaväediviis", "8=8. jalaväediviis", "9=9. jalaväediviis", "10=10. jalaväediviis",
  "11=11. jalaväediviis", "12=12. jalaväediviis", "13=13. jalaväediviis", "14=14. jalaväediviis", "15=15. jalaväediviis",
  "16=16. jalaväediviis", "17=17. jalaväediviis", "18=18. jalaväediviis", "19=19. jalaväediviis", "20=20. jalaväediviis" ] }
```

```json batch
{ "addGroup": true, "group": "INF_02", "selector": "Infantry Divisions (Named)", "addType": "infantry", "fallback": "%d. jalaväediviis", "link": "INF_01", "after": "INF_01",
  "comment": "Named variant; shares numbering with EST_INF_01. The 1st-4th Divisions of 1940 after the ancient county of their HQ region, then the other ancient counties and battles of the War of Independence.",
  "add": [
  "# Divisions of 1940",
  "1=1. jalaväediviis 'Virumaa'", "2=2. jalaväediviis 'Ugandi'", "3=3. jalaväediviis 'Rävala'", "4=4. jalaväediviis 'Sakala'",
  "# Ancient counties",
  "5=5. jalaväediviis 'Harjumaa'", "6=6. jalaväediviis 'Järvamaa'", "7=7. jalaväediviis 'Läänemaa'", "8=8. jalaväediviis 'Alempois'",
  "9=9. jalaväediviis 'Mõhu'", "10=10. jalaväediviis 'Nurmekund'", "11=11. jalaväediviis 'Vaiga'", "12=12. jalaväediviis 'Jogentagana'",
  "13=13. jalaväediviis 'Soopoolitse'", "14=14. jalaväediviis 'Pärnumaa'", "15=15. jalaväediviis 'Tartumaa'", "16=16. jalaväediviis 'Võrumaa'",
  "17=17. jalaväediviis 'Valgamaa'", "18=18. jalaväediviis 'Petserimaa'",
  "# Battles of the War of Independence",
  "19=19. jalaväediviis 'Paju'", "20=20. jalaväediviis 'Võnnu'", "21=21. jalaväediviis 'Krivasoo'", "22=22. jalaväediviis 'Utria'",
  "23=23. jalaväediviis 'Laagna'" ] }
```

```json batch
{ "addGroup": true, "group": "CAV_01", "selector": "Cavalry Regiments", "addType": "cavalry", "fallback": "%d. ratsapolk", "link": "INF_01", "after": "INF_02",
  "comment": "Overrides vanilla EST_CAV_01; keys 1-10 are written so that vanilla's '%s Ratsaväediviisi' texts do not show. Linked to EST_INF_01, as in vanilla.",
  "add": [
  "# War of Independence regiments",
  "1=1. ratsapolk", "2=2. ratsapolk",
  "# Further regiments",
  "3=3. ratsapolk", "4=4. ratsapolk", "5=5. ratsapolk", "6=6. ratsapolk", "7=7. ratsapolk", "8=8. ratsapolk", "9=9. ratsapolk", "10=10. ratsapolk",
  "# Peacetime regiment and squadrons",
  "101=Ratsarügement", "102=Tallinna üksik eskadron", "103=Balti pataljoni eskadron", "104=Soomusrongide diviisi eskadron", "105=Kaitseliidu ratsaosakond" ] }
```

```json batch
{ "group": "KL_01", "selector": "Defence League Malevs", "fallback": "Kaitseliidu %d. malev", "addType": "militia",
  "comment": "# ===== Defence League =====\n\nThe Kaitseliit malevad of 1940; ungated, as the League served every interwar government.",
  "removeAll": true, "add": [
  "# Malevad",
  "1=Kaitseliidu Tallinna malev", "2=Kaitseliidu Harju malev", "3=Kaitseliidu Lääne malev", "4=Kaitseliidu Saaremaa malev",
  "5=Kaitseliidu Pärnumaa malev", "6=Kaitseliidu Sakalamaa malev", "7=Kaitseliidu Järva malev", "8=Kaitseliidu Viru malev",
  "9=Kaitseliidu Narva malev", "10=Kaitseliidu Tartu malev", "11=Kaitseliidu Tartumaa malev", "12=Kaitseliidu Valgamaa malev",
  "13=Kaitseliidu Võrumaa malev", "14=Kaitseliidu Petserimaa malev", "15=Merekaitseliit",
  "# Tallinn malevkonnad",
  "16=Kaitseliidu Toompea malevkond", "17=Kaitseliidu Sadama malevkond", "18=Kaitseliidu Põhja malevkond" ] }
```

```json batch
{ "addGroup": true, "group": "MOT_01", "selector": "Motorized Divisions", "addType": "motorized", "fallback": "%d. motoriseeritud jalaväediviis", "link": "INF_01", "after": "KL_01",
  "comment": "# ===== Mobile and armour =====\n\nOverrides vanilla EST_MOT_01 as a plain list; keys 1-10 are written so that vanilla's '%s Motoriseeritud diviisi' texts do not show. EST_ARM_02 holds the named mobile and armour names.",
  "add": [ "1=1. motoriseeritud jalaväediviis", "2=2. motoriseeritud jalaväediviis", "3=3. motoriseeritud jalaväediviis",
  "4=4. motoriseeritud jalaväediviis", "5=5. motoriseeritud jalaväediviis", "6=6. motoriseeritud jalaväediviis",
  "7=7. motoriseeritud jalaväediviis", "8=8. motoriseeritud jalaväediviis", "9=9. motoriseeritud jalaväediviis",
  "10=10. motoriseeritud jalaväediviis" ] }
```

```json batch
{ "addGroup": true, "group": "MEC_01", "selector": "Mechanized Divisions", "addType": "mechanized", "fallback": "%d. mehhaniseeritud jalaväediviis", "link": "INF_01", "after": "MOT_01",
  "comment": "Overrides vanilla EST_MEC_01 as a plain list; keys 1-10 are written so that vanilla's '%s Mehhaniseeritud diviisi' texts do not show.",
  "add": [ "1=1. mehhaniseeritud jalaväediviis", "2=2. mehhaniseeritud jalaväediviis", "3=3. mehhaniseeritud jalaväediviis",
  "4=4. mehhaniseeritud jalaväediviis", "5=5. mehhaniseeritud jalaväediviis", "6=6. mehhaniseeritud jalaväediviis",
  "7=7. mehhaniseeritud jalaväediviis", "8=8. mehhaniseeritud jalaväediviis", "9=9. mehhaniseeritud jalaväediviis",
  "10=10. mehhaniseeritud jalaväediviis" ] }
```

```json batch
{ "addGroup": true, "group": "ARM_01", "selector": "Armored Divisions", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"], "fallback": "%d. tankidiviis", "link": "INF_01", "after": "MEC_01",
  "comment": "Overrides vanilla EST_ARM_01 as the plain (un-nicknamed) variant; keys 1-10 are written so that vanilla's '%s Tankidiviisi' texts do not show. EST_ARM_02 is its named variant.",
  "add": [ "1=1. tankidiviis", "2=2. tankidiviis", "3=3. tankidiviis", "4=4. tankidiviis", "5=5. tankidiviis",
  "6=6. tankidiviis", "7=7. tankidiviis", "8=8. tankidiviis", "9=9. tankidiviis", "10=10. tankidiviis" ] }
```

```json batch
{ "group": "ARM_02", "selector": "Armored & Mobile (Named)", "fallback": "%d. soomusdiviis",
  "comment": "Named variant of EST_ARM_01 (link set in step 2) for armour and mobile templates: the armoured train, cars and trucks of 1919 and the artillery wagons of the armoured trains; the formations on 101 and up.",
  "removeAll": true, "add": [
  "# Armoured train, cars and trucks of 1919",
  "1=1. soomusdiviis 'Kapten Irw'", "2=2. soomusdiviis 'Suur Tõll'", "3=3. soomusdiviis 'Tasuja'", "4=4. soomusdiviis 'Kalevipoeg'",
  "5=5. soomusdiviis 'Estonia'", "6=6. soomusdiviis 'Vanapagan'", "7=7. soomusdiviis 'Wahur'", "8=8. soomusdiviis 'Toonela'",
  "9=9. soomusdiviis 'Pisuhänd'", "10=10. soomusdiviis 'Wibulane'", "11=11. soomusdiviis 'Puuk'", "12=12. soomusdiviis 'Sorts'",
  "# Armoured train wagons",
  "13=13. soomusdiviis 'Hävitaja'", "14=14. soomusdiviis 'Maru'", "15=15. soomusdiviis 'Vapper'", "16=16. soomusdiviis 'Võitleja'",
  "17=17. soomusdiviis 'Tont'", "18=18. soomusdiviis 'Taara'", "19=19. soomusdiviis 'Uku'", "20=20. soomusdiviis 'Pikker'",
  "21=21. soomusdiviis 'Kõu'", "22=22. soomusdiviis 'Kalev'", "23=23. soomusdiviis 'Müristaja'", "24=24. soomusdiviis 'Tapper'",
  "# Formations",
  "101=Soomusrongide diviis", "102=Soomusautode kolonn", "103=Auto-tankirügement", "104=Soomusrongirügement" ] }
```

```json batch
{ "addGroup": true, "group": "PAR_01", "selector": "Paratrooper Divisions", "addType": "paratrooper", "fallback": "%d. õhudessantdiviis", "link": "INF_01", "after": "ARM_02",
  "comment": "# ===== Specialists =====\n\nOverrides vanilla EST_PAR_01 as a plain list; keys 1-10 are written so that vanilla's '%s Õhudessantdiviisi' texts do not show.",
  "add": [ "1=1. õhudessantdiviis", "2=2. õhudessantdiviis", "3=3. õhudessantdiviis", "4=4. õhudessantdiviis", "5=5. õhudessantdiviis",
  "6=6. õhudessantdiviis", "7=7. õhudessantdiviis", "8=8. õhudessantdiviis", "9=9. õhudessantdiviis", "10=10. õhudessantdiviis" ] }
```

```json batch
{ "addGroup": true, "group": "MAR_01", "selector": "Marine Divisions", "addType": "marine", "fallback": "%d. merejalaväediviis", "link": "INF_01", "after": "PAR_01",
  "comment": "Overrides vanilla EST_MAR_01 as the plain variant; keys 1-10 are written so that vanilla's '%s Merejalaväediviisi' texts do not show. EST_MAR_02 is its named variant.",
  "add": [ "1=1. merejalaväediviis", "2=2. merejalaväediviis", "3=3. merejalaväediviis", "4=4. merejalaväediviis", "5=5. merejalaväediviis",
  "6=6. merejalaväediviis", "7=7. merejalaväediviis", "8=8. merejalaväediviis", "9=9. merejalaväediviis", "10=10. merejalaväediviis" ] }
```

```json batch
{ "group": "MAR_02", "fallback": "%d. merejalaväediviis",
  "comment": "Named variant of EST_MAR_01 (link set in step 2): the islands, then the coastal units of 1919-1940 on 101 and up.",
  "removeAll": true, "add": [
  "# Islands",
  "1=1. merejalaväediviis 'Saaremaa'", "2=2. merejalaväediviis 'Hiiumaa'", "3=3. merejalaväediviis 'Muhu'", "4=4. merejalaväediviis 'Vormsi'",
  "5=5. merejalaväediviis 'Kihnu'", "6=6. merejalaväediviis 'Ruhnu'", "7=7. merejalaväediviis 'Prangli'", "8=8. merejalaväediviis 'Osmussaar'",
  "9=9. merejalaväediviis 'Abruka'", "10=10. merejalaväediviis 'Vilsandi'", "11=11. merejalaväediviis 'Manija'", "12=12. merejalaväediviis 'Piirissaar'",
  "# Coastal units",
  "101=Meredessantpataljon", "102=Aegna komandantuur", "103=Naissaare komandantuur", "104=Suuropi komandantuur", "105=Peipsi laevastiku divisjon" ] }
```

```json batch
{ "addGroup": true, "group": "MNT_01", "selector": "Mountain Divisions", "addType": "mountaineers", "fallback": "%d. mägijalaväediviis", "link": "INF_01", "after": "MAR_02",
  "comment": "Overrides vanilla EST_MNT_01; keys 1-10 are written so that vanilla's '%s Mägidiviisi' texts do not show. Estonia's uplands and highest hills.",
  "add": [ "1=1. mägijalaväediviis 'Haanja'", "2=2. mägijalaväediviis 'Pandivere'", "3=3. mägijalaväediviis 'Karula'",
  "4=4. mägijalaväediviis 'Vooremaa'", "5=5. mägijalaväediviis 'Suur Munamägi'", "6=6. mägijalaväediviis 'Vällamägi'",
  "7=7. mägijalaväediviis 'Emumägi'", "8=8. mägijalaväediviis 'Kuutsemägi'", "9=9. mägijalaväediviis 'Ebavere'",
  "10=10. mägijalaväediviis 'Rõuge'" ] }
```

```json batch
{ "addGroup": true, "group": "GAR_01", "selector": "Garrisons & Border Guards", "addType": "infantry", "fallback": "%d. garnisonidiviis", "link": "INF_01", "after": "MNT_01",
  "comment": "Overrides vanilla EST_GAR_01; keys 1-20 are written so that vanilla's '%s Jalaväediviisi' texts do not show. Garrison towns of the 1939 army, then other towns; the border guard on 101.",
  "add": [
  "# Garrisons of the 1939 army",
  "1=Tallinna garnison", "2=Tartu garnison", "3=Narva garnison", "4=Rakvere garnison", "5=Pärnu garnison", "6=Viljandi garnison",
  "7=Võru garnison", "8=Valga garnison", "9=Petseri garnison", "10=Haapsalu garnison", "11=Jõhvi garnison", "12=Tapa garnison",
  "# Other towns",
  "13=Kuressaare garnison", "14=Paide garnison", "15=Paldiski garnison", "16=Kärdla garnison", "17=Rapla garnison", "18=Türi garnison",
  "19=Põltsamaa garnison", "20=Jõgeva garnison",
  "# Border guard",
  "101=Viru piirivalvepataljon" ] }
```

```json batch
{ "addGroup": true, "group": "MUI_01", "selector": "Ancient Freedom Divisions", "addType": ["infantry", "cavalry"], "fallback": "%d. diviis", "canUse": "has_government = neutrality", "after": "GAR_01",
  "comment": "# ===== Ideology suites =====\n\nNeutrality (the Päts era, which celebrated the ancient fight for freedom): the elders, strongholds and battles of 1208-1227 and the rising of 1343.",
  "add": [
  "# Elders",
  "1=1. diviis 'Lembitu'", "2=2. diviis 'Meeme'", "3=3. diviis 'Vesse'",
  "# Strongholds",
  "4=4. diviis 'Otepää'", "5=5. diviis 'Varbola'", "6=6. diviis 'Lõhavere'", "7=7. diviis 'Viljandi'", "8=8. diviis 'Valjala'",
  "9=9. diviis 'Soontagana'", "10=10. diviis 'Tarbatu'", "11=11. diviis 'Kaarma'", "12=12. diviis 'Keava'",
  "# Battles and risings",
  "13=13. diviis 'Ümera'", "14=14. diviis 'Madisepäev'", "15=15. diviis 'Jüriöö'" ] }
```

```json batch
{ "addGroup": true, "group": "VAPS_01", "selector": "Veterans' League Divisions", "addType": ["infantry", "militia"], "fallback": "%d. vabadussõjalaste diviis", "canUse": "has_government = fascism", "after": "MUI_01",
  "comment": "Fascism: the War of Independence Veterans' League (vapsid), with the Finnic lands of the vanilla Finno-Ugric union focuses as nicknames. No leader is a patron.",
  "add": [
  "# Finnic lands",
  "1=1. vabadussõjalaste diviis 'Karjala'", "2=2. vabadussõjalaste diviis 'Ingerimaa'", "3=3. vabadussõjalaste diviis 'Aunus'",
  "4=4. vabadussõjalaste diviis 'Viena'", "5=5. vabadussõjalaste diviis 'Vepsamaa'", "6=6. vabadussõjalaste diviis 'Vadjamaa'",
  "7=7. vabadussõjalaste diviis 'Liivimaa'", "8=8. vabadussõjalaste diviis 'Lapimaa'", "9=9. vabadussõjalaste diviis 'Komimaa'",
  "10=10. vabadussõjalaste diviis 'Marimaa'", "11=11. vabadussõjalaste diviis 'Udmurdimaa'", "12=12. vabadussõjalaste diviis 'Mordva'",
  "# The Veterans' League",
  "101=Vabadussõjalaste korrapidajate üksus", "102=Vabadussõjalaste Liidu Jõgeva osakond" ] }
```

```json batch
{ "addGroup": true, "group": "RED_01", "selector": "Red Rifle Divisions", "addType": ["infantry", "motorized"], "fallback": "%d. Eesti laskurdiviis", "canUse": "has_government = communism", "after": "VAPS_01",
  "comment": "Communism: the 22nd Territorial Rifle Corps of 1940-41 and the Estonian Rifle Corps of 1941-45 with their divisions and regiments, each on its own number. No unit of 1918-19 is used.",
  "add": [
  "1=1. Eesti üksik tagavaralaskurpolk", "7=7. Eesti laskurdiviis", "8=8. Eesti laskurkorpus", "21=21. laskurpolk",
  "22=22. Eesti territoriaalne laskurkorpus", "27=27. laskurpolk", "41=41. kaardiväe Eesti Tallinna laskurkorpus", "42=42. laskurpolk",
  "118=118. kaardiväe Eesti Tallinna punalipuline laskurdiviis", "122=122. kaardiväe Eesti Tallinna punalipuline laskurdiviis",
  "140=140. laskurpolk", "171=171. laskurpolk", "180=180. Eesti laskurdiviis 'Põhja'", "182=182. Eesti laskurdiviis 'Lõuna'",
  "221=221. tankipolk 'Nõukogude Eesti eest'", "232=232. laskurpolk", "249=249. Eesti laskurdiviis", "300=300. laskurpolk",
  "354=354. laskurpolk", "917=917. laskurpolk", "921=921. laskurpolk", "925=925. laskurpolk" ] }
```

```json batch
{ "addGroup": true, "group": "MV_01", "selector": "Freedom Fighters", "addType": ["infantry", "militia"], "fallback": "%d. vabadusvõitlejate diviis", "canUse": "has_government = democratic", "after": "RED_01",
  "comment": "Democratic: the Finnish Boys of JR 200, the defence of the Tief government in September 1944 and the Forest Brothers of 1944-53. No formation of 1941-44 is used.",
  "add": [
  "# Battles",
  "1=1. vabadusvõitlejate diviis 'Keila'", "2=2. vabadusvõitlejate diviis 'Saika'", "3=3. vabadusvõitlejate diviis 'Puutlipalu'",
  "4=4. vabadusvõitlejate diviis 'Osula'", "5=5. vabadusvõitlejate diviis 'Vastseliina'", "6=6. vabadusvõitlejate diviis 'Soomepoisid'",
  "# Units",
  "101=Löögirühm Admiral Pitka", "102=Soome jalaväerügement 200", "103=Relvastatud Võitluse Liit", "104=Võrumaa metsavennad" ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| REG_01 | 50 -> 36 | 1. jalaväepolk, 2. jalaväepolk, 3. jalaväepolk, 4. jalaväepolk, 5. jalaväepolk, 6. jalaväepolk, 7. jalaväepolk, 8. jalaväepolk, 9. jalaväepolk, 10. üksik jalaväepataljon, Kuperjanovi partisanide pataljon, Sakala partisanide pataljon, Kalevlaste Maleva polk, Scoutspolk, Vahipataljon, Ingeri polk, Balti pataljon, Peipsi rannakaitsepataljon, Viljandi kaitsepataljon, Järvamaa kaitsepataljon, Tartu kaitsepataljon, Pärnu kaitsepataljon, Saaremaa kaitsepataljon, Narva kaitsepataljon, Võru kaitsepataljon, Tallinna 1. kaitsepataljon, Tallinna 2. kaitsepataljon, Tallinna 3. kaitsepataljon, Viljandi 2. kaitsepataljon, Pärnu 2. kaitsepataljon, Tallinna 1. löögipataljon, Katšanovi üksikpataljon, Pankjavitsa pataljon, Tartu kooliõpilaste pataljon, Pihkva vabatahtlik korpus, Kalevi üksik jalaväepataljon | Kuperjanovi Partisanide Rügement, Sakala Partisanide Rügement, Kalevlaste Maleva Jalaväerügement, Scoutsrügement, Tallinna Vahirügement, Ingeri Jalaväepolk, Balti Pataljon, Peipsi Rannakaitsepataljon, Viljandi Kaitsepataljon, Järvamaa Kaitsepataljon, Tartu Kaitsepataljon, Pärnu Kaitsepataljon, Saaremaa Kaitsepataljon, Narva Kaitsepataljon, Võru Kaitsepataljon, 35 fallback stubs | selector: 'Infantry Regiment' -> 'Infantry Regiments'; fallback: '%d. Jalaväerügement' -> '%d. jalaväerügement' |
| KL_01 | 35 -> 18 | Merekaitseliit | Kaitseliidu Pärnu malev, Kaitseliidu Raudtee malevkond, Kaitseliidu Nõmme malevkond, Kaitseliidu Lõuna malevkond, Kaitseliidu Ida malevkond, Kaitseliidu Tehniline malevkond, Kaitseliidu Õppurmalevkond, Kaitseliidu Alutaguse malev, 10 fallback stubs | selector: 'Defense Formations' -> 'Defence League Malevs'; division_types: [infantry] -> [infantry militia]; fallback: '%d. Kaitseliidu Malev' -> 'Kaitseliidu %d. malev' |
| ARM_02 | 35 -> 28 | 1. soomusdiviis 'Kapten Irw', 2. soomusdiviis 'Suur Tõll', 3. soomusdiviis 'Tasuja', 4. soomusdiviis 'Kalevipoeg', 5. soomusdiviis 'Estonia', 6. soomusdiviis 'Vanapagan', 7. soomusdiviis 'Wahur', 8. soomusdiviis 'Toonela', 9. soomusdiviis 'Pisuhänd', 10. soomusdiviis 'Wibulane', 11. soomusdiviis 'Puuk', 12. soomusdiviis 'Sorts', 13. soomusdiviis 'Hävitaja', 14. soomusdiviis 'Maru', 15. soomusdiviis 'Vapper', 16. soomusdiviis 'Võitleja', 17. soomusdiviis 'Tont', 18. soomusdiviis 'Taara', 19. soomusdiviis 'Uku', 20. soomusdiviis 'Pikker', 21. soomusdiviis 'Kõu', 22. soomusdiviis 'Kalev', 23. soomusdiviis 'Müristaja', 24. soomusdiviis 'Tapper', Soomusrongide diviis, Soomusautode kolonn | Soomusdiviis 'Kapten Irv', Soomusbrigaad 'Suur Tõll', Soomusbrigaad 'Tasuja', Soomusbrigaad 'Kalevipoeg', Soomusbrigaad 'Estonia', Soomuskolonn 'Vanapagan', Soomuskolonn 'Wahur', Soomuskolonn 'Toonela', Soomuskolonn 'Pisuhänd', Soomuskolonn 'Wibulane', 1. Laiarööpmeline Soomusrong 'Kapten Irv', 2. Laiarööpmeline Soomusrong, 3. Laiarööpmeline Soomusrong, 4. Laiarööpmeline Soomusrong, 5. Laiarööpmeline Soomusrong, 6. Laiarööpmeline Soomusrong, 1. Kitsarööpmeline Soomusrong, 2. Kitsarööpmeline Soomusrong, 3. Kitsarööpmeline Soomusrong, 4. Kitsarööpmeline Soomusrong, 5. Kitsarööpmeline Soomusrong, 1. Tankipataljon, 2. Tankipataljon, 10 fallback stubs | selector: 'Armored & Mobile Divisions' -> 'Armored & Mobile (Named)'; fallback: '%d. Soomusdiviis' -> '%d. soomusdiviis'; links: [] -> [EST_ARM_01] |
| MAR_02 | 30 -> 17 | 1. merejalaväediviis 'Saaremaa', 2. merejalaväediviis 'Hiiumaa', 3. merejalaväediviis 'Muhu', 4. merejalaväediviis 'Vormsi', 5. merejalaväediviis 'Kihnu', 6. merejalaväediviis 'Ruhnu', 7. merejalaväediviis 'Prangli', 8. merejalaväediviis 'Osmussaar', 9. merejalaväediviis 'Abruka', 10. merejalaväediviis 'Vilsandi', 11. merejalaväediviis 'Manija', 12. merejalaväediviis 'Piirissaar', Meredessantpataljon, Aegna komandantuur, Naissaare komandantuur, Suuropi komandantuur, Peipsi laevastiku divisjon | Aegna Merekindlus, Naissaare Merekindlus, Suuropi Merekindlus, Eesti Meredessantpataljon, Saaremaa Rannakaitsepataljon, Hiiumaa Rannakaitsepataljon, Peipsi Laevastiku Dessantpataljon, Viimsi Rannakaitsepatarei, Kakumäe Rannakaitsepatarei, Sõrve Rannakaitsepatarei, Tahkuna Rannakaitsepatarei, Ruhnu Rannakaitsekomando, Pakri Rannakaitsekomando, 17 fallback stubs | fallback: '%d. Meredessantrügement' -> '%d. merejalaväediviis'; links: [] -> [EST_MAR_01] |
| INF_01 | new, 20 | 1. jalaväediviis, 2. jalaväediviis, 3. jalaväediviis, 4. jalaväediviis, 5. jalaväediviis, 6. jalaväediviis, 7. jalaväediviis, 8. jalaväediviis, 9. jalaväediviis, 10. jalaväediviis, 11. jalaväediviis, 12. jalaväediviis, 13. jalaväediviis, 14. jalaväediviis, 15. jalaväediviis, 16. jalaväediviis, 17. jalaväediviis, 18. jalaväediviis, 19. jalaväediviis, 20. jalaväediviis | - | - |
| INF_02 | new, 23 | 1. jalaväediviis 'Virumaa', 2. jalaväediviis 'Ugandi', 3. jalaväediviis 'Rävala', 4. jalaväediviis 'Sakala', 5. jalaväediviis 'Harjumaa', 6. jalaväediviis 'Järvamaa', 7. jalaväediviis 'Läänemaa', 8. jalaväediviis 'Alempois', 9. jalaväediviis 'Mõhu', 10. jalaväediviis 'Nurmekund', 11. jalaväediviis 'Vaiga', 12. jalaväediviis 'Jogentagana', 13. jalaväediviis 'Soopoolitse', 14. jalaväediviis 'Pärnumaa', 15. jalaväediviis 'Tartumaa', 16. jalaväediviis 'Võrumaa', 17. jalaväediviis 'Valgamaa', 18. jalaväediviis 'Petserimaa', 19. jalaväediviis 'Paju', 20. jalaväediviis 'Võnnu', 21. jalaväediviis 'Krivasoo', 22. jalaväediviis 'Utria', 23. jalaväediviis 'Laagna' | - | - |
| CAV_01 | new, 15 | 1. ratsapolk, 2. ratsapolk, 3. ratsapolk, 4. ratsapolk, 5. ratsapolk, 6. ratsapolk, 7. ratsapolk, 8. ratsapolk, 9. ratsapolk, 10. ratsapolk, Ratsarügement, Tallinna üksik eskadron, Balti pataljoni eskadron, Soomusrongide diviisi eskadron, Kaitseliidu ratsaosakond | - | - |
| MOT_01 | new, 10 | 1. motoriseeritud jalaväediviis, 2. motoriseeritud jalaväediviis, 3. motoriseeritud jalaväediviis, 4. motoriseeritud jalaväediviis, 5. motoriseeritud jalaväediviis, 6. motoriseeritud jalaväediviis, 7. motoriseeritud jalaväediviis, 8. motoriseeritud jalaväediviis, 9. motoriseeritud jalaväediviis, 10. motoriseeritud jalaväediviis | - | - |
| MEC_01 | new, 10 | 1. mehhaniseeritud jalaväediviis, 2. mehhaniseeritud jalaväediviis, 3. mehhaniseeritud jalaväediviis, 4. mehhaniseeritud jalaväediviis, 5. mehhaniseeritud jalaväediviis, 6. mehhaniseeritud jalaväediviis, 7. mehhaniseeritud jalaväediviis, 8. mehhaniseeritud jalaväediviis, 9. mehhaniseeritud jalaväediviis, 10. mehhaniseeritud jalaväediviis | - | - |
| ARM_01 | new, 10 | 1. tankidiviis, 2. tankidiviis, 3. tankidiviis, 4. tankidiviis, 5. tankidiviis, 6. tankidiviis, 7. tankidiviis, 8. tankidiviis, 9. tankidiviis, 10. tankidiviis | - | - |
| PAR_01 | new, 10 | 1. õhudessantdiviis, 2. õhudessantdiviis, 3. õhudessantdiviis, 4. õhudessantdiviis, 5. õhudessantdiviis, 6. õhudessantdiviis, 7. õhudessantdiviis, 8. õhudessantdiviis, 9. õhudessantdiviis, 10. õhudessantdiviis | - | - |
| MAR_01 | new, 10 | 1. merejalaväediviis, 2. merejalaväediviis, 3. merejalaväediviis, 4. merejalaväediviis, 5. merejalaväediviis, 6. merejalaväediviis, 7. merejalaväediviis, 8. merejalaväediviis, 9. merejalaväediviis, 10. merejalaväediviis | - | - |
| MNT_01 | new, 10 | 1. mägijalaväediviis 'Haanja', 2. mägijalaväediviis 'Pandivere', 3. mägijalaväediviis 'Karula', 4. mägijalaväediviis 'Vooremaa', 5. mägijalaväediviis 'Suur Munamägi', 6. mägijalaväediviis 'Vällamägi', 7. mägijalaväediviis 'Emumägi', 8. mägijalaväediviis 'Kuutsemägi', 9. mägijalaväediviis 'Ebavere', 10. mägijalaväediviis 'Rõuge' | - | - |
| GAR_01 | new, 21 | Tallinna garnison, Tartu garnison, Narva garnison, Rakvere garnison, Pärnu garnison, Viljandi garnison, Võru garnison, Valga garnison, Petseri garnison, Haapsalu garnison, Jõhvi garnison, Tapa garnison, Kuressaare garnison, Paide garnison, Paldiski garnison, Kärdla garnison, Rapla garnison, Türi garnison, Põltsamaa garnison, Jõgeva garnison, Viru piirivalvepataljon | - | - |
| MUI_01 | new, 15 | 1. diviis 'Lembitu', 2. diviis 'Meeme', 3. diviis 'Vesse', 4. diviis 'Otepää', 5. diviis 'Varbola', 6. diviis 'Lõhavere', 7. diviis 'Viljandi', 8. diviis 'Valjala', 9. diviis 'Soontagana', 10. diviis 'Tarbatu', 11. diviis 'Kaarma', 12. diviis 'Keava', 13. diviis 'Ümera', 14. diviis 'Madisepäev', 15. diviis 'Jüriöö' | - | - |
| VAPS_01 | new, 14 | 1. vabadussõjalaste diviis 'Karjala', 2. vabadussõjalaste diviis 'Ingerimaa', 3. vabadussõjalaste diviis 'Aunus', 4. vabadussõjalaste diviis 'Viena', 5. vabadussõjalaste diviis 'Vepsamaa', 6. vabadussõjalaste diviis 'Vadjamaa', 7. vabadussõjalaste diviis 'Liivimaa', 8. vabadussõjalaste diviis 'Lapimaa', 9. vabadussõjalaste diviis 'Komimaa', 10. vabadussõjalaste diviis 'Marimaa', 11. vabadussõjalaste diviis 'Udmurdimaa', 12. vabadussõjalaste diviis 'Mordva', Vabadussõjalaste korrapidajate üksus, Vabadussõjalaste Liidu Jõgeva osakond | - | - |
| RED_01 | new, 22 | 1. Eesti üksik tagavaralaskurpolk, 7. Eesti laskurdiviis, 8. Eesti laskurkorpus, 21. laskurpolk, 22. Eesti territoriaalne laskurkorpus, 27. laskurpolk, 41. kaardiväe Eesti Tallinna laskurkorpus, 42. laskurpolk, 118. kaardiväe Eesti Tallinna punalipuline laskurdiviis, 122. kaardiväe Eesti Tallinna punalipuline laskurdiviis, 140. laskurpolk, 171. laskurpolk, 180. Eesti laskurdiviis 'Põhja', 182. Eesti laskurdiviis 'Lõuna', 221. tankipolk 'Nõukogude Eesti eest', 232. laskurpolk, 249. Eesti laskurdiviis, 300. laskurpolk, 354. laskurpolk, 917. laskurpolk, 921. laskurpolk, 925. laskurpolk | - | - |
| MV_01 | new, 10 | 1. vabadusvõitlejate diviis 'Keila', 2. vabadusvõitlejate diviis 'Saika', 3. vabadusvõitlejate diviis 'Puutlipalu', 4. vabadusvõitlejate diviis 'Osula', 5. vabadusvõitlejate diviis 'Vastseliina', 6. vabadusvõitlejate diviis 'Soomepoisid', Löögirühm Admiral Pitka, Soome jalaväerügement 200, Relvastatud Võitluse Liit, Võrumaa metsavennad | - | - |
<!-- END CHANGE TABLE -->
