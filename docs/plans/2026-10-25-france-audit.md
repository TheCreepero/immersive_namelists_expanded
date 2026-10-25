# France (FRA) Namelist Audit - 2026-10-25

Status: READY

File: `common/units/names_divisions/zz_INEX_FRA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit FRA`)
- AUDIT SUMMARY FRA: GROUPS=20 AUTHORED=326/447 FLAGS=12
- [FRA_MOT_01] flags: LOW_DEPTH
- [FRA_MEC_01] flags: LOW_DEPTH, UNLINKED_MOBILE
- [FRA_DLC_01] flags: LOW_DEPTH
- [FRA_ARM_01] flags: LOW_DEPTH
- [FRA_ARM_02] flags: LOW_DEPTH
- [FRA_ARM_03] flags: LOW_DEPTH
- [FRA_PAR_01] flags: LOW_DEPTH
- [FRA_MAR_01] flags: LOW_DEPTH
- [FRA_GAR_01] flags: PLACEHOLDER_ENTRIES
- [FRA_COL_01] flags: STALE_COMMENT
- [FRA_MIL_COM_01] flags: NAME_LONG
- Found on manual review:
  - `FRA_COL_01`: 74/79 entries are vanilla copies, and many are not attested: 8ème-17ème DINA, 4ème-10ème Division Marocaine, 1ère-7ème "Div. d'Infanterie Algérienne" (in 1939-40 the series was the *Division d'Infanterie d'Afrique* 81e-88e and 180e-183e), 1ère/2ème DLINA beyond the 1re, "Division de Sousse". INEX's own "Division de Tirailleurs Sénégalais", "Division de l'Afrique-Occidentale Française", "Division de l'Afrique-Équatoriale Française" and "Division du Levant" are not attested either.
  - `FRA_MOT_01` key 1 is the 1943 *1ère Division Motorisée d'Infanterie* (the renamed 1ère DFL), so the 1940 *1ère Division d'Infanterie Motorisée* is missing. The other six 1940 DIMs (3, 5, 9, 12, 15, 25) show only as vanilla's abbreviated stubs.
  - `FRA_MIL_NEU_01`: an invented format ("%dème Division de l'Armée de l'Armistice 'City'"). Vanilla makes Vichy a dynamic country of FRA with a fascist government (`events/France.txt:1199`, `create_dynamic_country = { original_tag = FRA }`; `set_politics` ruling party fascism), so the group's neutrality gate hides it from Vichy.
  - Free France is FRA itself under the cosmetic tag `FRA_FREE` (`events/France.txt:470`), democratic. No group carries Free French names.
  - `FRA_GAR_01`: "de Crusnes" and "de Savoie" lack their articles (Secteur fortifié de la Crusnes, de la Savoie). Flandres, Lille, Montbéliard, Rhône and Lauter are missing.

## User decisions
- 2026-10-25, before research:
  - `FRA_COL_01`: rewrite and split. The troupes coloniales stay in `FRA_COL_01`; the Armée d'Afrique moves to a new group `FRA_AFR_01` "Army of Africa Divisions".
  - Free France: new group `FRA_FFL_01` "Free French Divisions", `has_government = democratic`.
  - `FRA_MIL_NEU_01`: rework to the historical divisions militaires, and widen the gate to fascism or neutrality so vanilla's Vichy sees it.
  - Extras, all approved: the 1940 DIMs in `FRA_MOT_01`; the missing fortified sectors and the respellings in `FRA_GAR_01`; *Division Bleue* in `FRA_MAR_01`; the collaborationist legions and the Franc-Garde in `FRA_MIL_FAS_01`.
- 2026-10-25, at the checkpoint: the audit report approved in full, the four "Author confirmation" entries included. The game launch that would confirm that a dynamic FRA country (Vichy) reads `for_countries = { FRA }` groups is deferred: not part of this plan.

## Research
- `inex-audit-researcher` A (Armée d'Afrique and colonial), 16 web calls. Sources: en.wikipedia "List of French divisions in World War II" (LIST), unit pages (1st Moroccan Division (1939), 87th and 183rd African Infantry Division, Oran Division, Moroccan Division (France), 37th Infantry Division (France), Japanese coup d'état in French Indochina), les-tirailleurs.fr regimental histories, generals.dk, beaucouze.fr (Méheust, Indochine).
- `inex-audit-researcher` B (Free French, Armistice Army, fortified sectors, extras), 25 web calls. Sources: en.wikipedia "1st Free French Division", "Alsace-Lorraine Independent Brigade", "Corps Léger d'Intervention", "Tricolour Legion", "Milice", "Blue Division (Second French Empire)", "7th Military Division (Vichy France)"; fr.wikipedia "Armée de l'Armistice", "Secteur fortifié"; cheminsdememoire.gouv.fr (colonne Leclerc); axishistory forum and littlewars.se (1940 DIM).
- Unverified after both runs: the 1939 régions militaires seats (so the Armistice group carries only the eight historical divisions), the French form of the Tunisian occupation division, Phalange Africaine (not reached; well documented), Brigade de marche d'Extrême-Orient, Division Légère d'Extrême-Orient, AOF/Madagascar divisions, the FFI-raised 1re/19e/23e/25e/36e DI.

## Rationale
- **Split of the colonial list.** `FRA_COL_01` keeps the troupes coloniales; the North African formations go to the new `FRA_AFR_01`. Every vanilla key of `FRA_COL_01` stays in the game ([NAM-020]), so the North African names vanilla has under keys 41-57, 61-70, 81-87, 91-99, 101, 102 and 108 would still show in `FRA_COL_01` unless written over. The batch clears the group (`removeAll`, INEX file only) and writes seven named colonial formations under keys 41-47, the 2ème and 8ème DLIC under vanilla's own keys 102 and 108, and the group's fallback text (`%dème Division d'Infanterie Coloniale`, `%dère` under key 1) over the other 67 vanilla keys (1-30, 48-57, 61-70, 81-87, 91-99, 101). Vanilla's text under those keys is the abbreviated `Div. d'Infanterie Coloniale`, which the old INEX list copied; the full form is the group's fallback, so every colonial number now reads alike. The stale "fictional divisions start here" comment goes with the cleared list.
- **Dropped as unattested**: 8ème-17ème DINA, 4ème-10ème Division Marocaine, 1ère/2ème/4ème-7ème Div. d'Infanterie Algérienne, Division de Sousse, Division du Levant (the Levant formations were the 191e and 192e DI and the 86e DIA), Division de Tirailleurs Sénégalais and the AOF/AEF titles (Senegalese troops served as regiments inside the DIC). The 2ème and 8ème DLIC are the only real DLIC numbers; vanilla's "Div. Légère d'Inf. Coloniale" entries at 102 and 108 are kept as those two.
- **`FRA_AFR_01` "Army of Africa Divisions"** (new tag, infantry, unlinked: the Armée d'Afrique numbered its own series). Fallback `%dème Div. d'Infanterie Nord-Africaine`, the 1939-40 DINA form. Keys 1-39 are sequential, in the order the player meets them: DINA 1-7 under keys 1-7 (their own numbers), then the 1940 light and Moroccan divisions, the DIA series, the 1942-45 divisions and the territorial divisions. Keys 40 and up render "40ème Div. d'Infanterie Nord-Africaine", which no static entry repeats. Not authored, to avoid two groups printing the same text: the WWI 37e, 38e and 45e DI and the Levant's 191e and 192e DI, which would read like `FRA_INF_01`'s "37ème Division d'Infanterie". "4ème Division Marocaine de Montagne" stays in `FRA_MNT_01` only.
- **`FRA_FFL_01` "Free French Divisions"** (new tag, infantry and motorized, `has_government = democratic`, unlinked). Free France is FRA under `FRA_FREE` and stays democratic; vanilla's Vichy is fascist and never sees the group. Fallback `%dème Division Française Libre`: past the 2ème it is an alt-history extrapolation, the same as other INEX fallbacks. *1ère Division Motorisée d'Infanterie* (1943) moves here from `FRA_MOT_01`. The *1ère Division de Marche d'Infanterie* form (1944) is left out: it names the same division a third time. FFI-raised numbered DIs are left out: they print like `FRA_INF_01`'s names, and the 10e DI had an FTP (communist) element. The *Brigade Indépendante Alsace-Lorraine* is FFI under Malraux (Gaullist) with no communist link in the sources.
- **`FRA_MOT_01`**: key 1 becomes the 1940 *1ère Division d'Infanterie Motorisée*. The 3ème, 5ème, 9ème, 12ème, 15ème and 25ème are written in full over vanilla's abbreviated stubs under their own numbers. The fallback stays as it is, because vanilla's other 30 stubs (91 and up) print it.
- **`FRA_MIL_NEU_01`**: the 16 invented entries are replaced by the free zone's two *Groupes de Divisions Militaires* (keys 1-2) and eight *Divisions Militaires* under their own numbers (7, 9, 12-17), with their seats. The fallback becomes `%dème Division Militaire`, so keys 3-6, 8, 10, 11 and 18 and up read as the unoccupied-zone numbering would, and no city is invented. The gate becomes `OR = { has_government = fascism has_government = neutrality }`. The group is a Vichy-era name; an early fascist France also sees it, because a situational gate is not allowed (guide §2, [NAM-018]).
- **`FRA_MIL_FAS_01`**: adds the LVF, the Légion Tricolore, the Phalange Africaine and the Milice's Franc-Garde under keys 21-24, all collaborationist. LVF is spelt *Bolchevisme* (standard French; *bolchévisme* is a variant).
- **`FRA_GAR_01`**: respells *de la Crusnes* and *de la Savoie*. Adds Flandres, Lille, Montbéliard, Rhône and Lauter under the free keys 130-134 (141 and up are vanilla's). Montbéliard and Rhône were *secteurs défensifs* and the Lauter a *région fortifiée*; the group's "Division de Forteresse de ..." format already covers Altkirch, a secteur défensif.
- **`FRA_MAR_01`**: adds *Division Bleue* (Bazeilles, 1870) under the free key 6.
- Capitalisation and ordinals follow the file (title case, *1ère*/*2ème*: user decision of 2026-10-01).

## Verified formations & commanders
- DINA 1ère-7ème, 1ère DLINA (June 1940), 1ère Division Marocaine (1939-40), 2ème Division Marocaine (1918; paper formation in 1939), 3ème Division Marocaine (1939-40), WWI Division Marocaine: researcher A (LIST; en.wikipedia unit pages).
- Divisions d'Infanterie d'Afrique 81ème-88ème and 180ème-183ème: researcher A (LIST, 87th/183rd unit pages, les-tirailleurs.fr).
- 2ème DIM, 3ème DIA (Algérienne), 8ème DIA (Algérienne), 1ère Division de Marche du Maroc, Divisions de Marche d'Alger, de Constantine and d'Oran: researcher A (LIST, Oran Division, les-tirailleurs.fr).
- Divisions d'Alger, d'Oran, de Constantine, de Casablanca, de Fès, de Meknès, de Marrakech: researcher A (LIST, Oran Division, generals.dk).
- Division du Tonkin, Division de Cochinchine-Cambodge, 1ère and 2ème Brigade du Tonkin, 2ème and 8ème DLIC, 1ère and 2ème Division Coloniale d'Extrême-Orient: researcher A (LIST, generals.dk, en.wikipedia "Japanese coup d'état in French Indochina"). DIC 1-9: audit of 2026-10-01.
- 1ère DFL, 2ème DFL (Force L, 1943), 1ère Division Motorisée d'Infanterie (Aug 1943), 1ère and 2ème Division Légère Française Libre (1941), 1ère, 2ème and 4ème Brigade Française Libre, Brigade Française Libre d'Orient, Corps Expéditionnaire Français Libre (1940), Colonne Leclerc, Brigade Indépendante Alsace-Lorraine, Corps Léger d'Intervention, Groupement de Marche de la 2ème DB: researcher B (en.wikipedia unit pages, cheminsdememoire.gouv.fr).
- 1er and 2ème Groupe de Divisions Militaires (Avignon, Clermont-Ferrand); 7ème (Bourg-en-Bresse), 9ème (Châteauroux), 12ème (Limoges), 13ème (Clermont-Ferrand), 14ème (Lyon), 15ème (Marseille), 16ème (Montpellier), 17ème (Toulouse) Division Militaire: researcher B (fr.wikipedia "Armée de l'Armistice", en.wikipedia "7th Military Division (Vichy France)").
- 1940 DIM 1ère, 3ème, 5ème, 9ème, 12ème, 15ème, 25ème: researcher B (axishistory, littlewars.se).
- LVF, Légion Tricolore, Franc-Garde: researcher B (en.wikipedia). Division Bleue: researcher B (en.wikipedia "Blue Division (Second French Empire)").
- Secteurs fortifiés des Flandres, de Lille, de la Crusnes, de la Savoie; secteurs défensifs de Montbéliard and du Rhône; région fortifiée de la Lauter: researcher B (fr.wikipedia "Secteur fortifié").
- Every other entry of the file is unchanged and keeps the sourcing of the 2026-10-01 audit.

## Author confirmation
- `FRA_AFR_01` "Division d'Occupation de Tunisie": the English sources give "Tunisian occupation division"; the French form was not found.
- `FRA_COL_01` "Division Annam-Tonkin": one French source (beaucouze.fr, Méheust) for the 1939-40 formation.
- `FRA_MIL_FAS_01` "Phalange Africaine" (Tunisia, 1942-43): well documented, not reached by the researcher.
- `FRA_AFR_01` "3ème Division Marocaine": LIST only, low confidence (1939 to May 1940, Morocco).

## Kept on judgment
Expected `-Check FRA` flags after the batch: 12, `AUDIT SUMMARY FRA: GROUPS=22`. A preview of the batch on a scratch copy of the mod gave exactly these.
- `LOW_DEPTH` on `FRA_MOT_01`, `FRA_MEC_01`, `FRA_DLC_01`, `FRA_ARM_01`, `FRA_ARM_02`, `FRA_ARM_03`, `FRA_PAR_01`, `FRA_MAR_01`: the historical series are short (2026-10-01 audit). `FRA_MOT_01` holds the seven 1940 DIMs.
- `UNLINKED_MOBILE` on `FRA_MEC_01`: the DLM had a numbering of their own (2026-10-01 audit).
- `PLACEHOLDER_ENTRIES` on `FRA_GAR_01` (2026-10-17 audit) and `FRA_COL_01` (this batch): both write their fallback text over vanilla keys that would otherwise show vanilla's text ([NAM-020]).
- `NAME_LONG` on `FRA_MIL_COM_01`: the 'Commune de Paris' honorific (2026-10-01 audit).
- `Vanilla:` lines: exactly two `leaves out 1 vanilla name(s)` lines, `1=%dère Brigade Cuirassée` (`FRA_ARM_02`) and `1=%dère Division Parachutiste` (`FRA_PAR_01`), both correct for key 1 (2026-10-17 audit). `FRA_COL_01` must show no `leaves out` line.
- Workshop info line: `[b]France[/b] 3 bullet(s), 4 [i] example(s)` after the docs payload.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per vanilla key the file writes again, including the 76 keys of `FRA_COL_01`. This is expected (guide §6).

## Implementation steps
- [ ] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames FRA -Batch docs/plans/2026-10-25-france-audit.md`. Expect these eight lines and no `[ERROR]`: `Edited FRA_MOT_01: +6 -0 ~1`; `Edited FRA_GAR_01: +5 -0 ~2`; `Edited FRA_MAR_01: +1 -0 ~0`; `Edited FRA_COL_01: +76 -0 ~0 [RemoveAll; Comment]`; `Added FRA_AFR_01: "Army of Africa Divisions" [infantry], 39 name(s)`; `Added FRA_FFL_01: "Free French Divisions" [infantry motorized], 14 name(s)`; `Edited FRA_MIL_FAS_01: +4 -0 ~0`; `Edited FRA_MIL_NEU_01: +10 -0 ~0 [Fallback='%dème Division Militaire'; CanUse='OR = { has_government = fascism has_government = neutrality }'; RemoveAll; Comment]`. The last line before the summary reads `the file holds 22 group(s), 507 name(s)` or similar.
- [ ] 2. `powershell -File .\build.ps1 -SyncWiki FRA`. Expect `France.md: 1 row(s) updated` (the `FRA_MIL_NEU_01` fallback), `no row in wiki table (add by hand): FRA_AFR_01, FRA_FFL_01`, and `wiki/Home.md: FRA group count 20 -> 22`. The two missing rows are in "Docs payload", edit 2.
- [ ] 3. Make the edits under "Docs payload", sections A and B, with Edit (old text -> new text, exactly as written). Leave section C (ROADMAP.md) for the ship step.
- [ ] 4. `powershell -File .\build.ps1 -Check FRA`. Expect `Check passed`, with the flags, `Vanilla:` lines and Workshop line under "Kept on judgment". Then `powershell -File .\build.ps1 -Audit FRA | Select-String 'vanilla name'` must print exactly the two lines named there.
- [ ] 5. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Plans and namelists of other nations may show in `git status`: other sessions work on them; leave them alone.
- [ ] 6. Ship, on the user's word:
  1. Make the ROADMAP.md edits of "Docs payload", section C, with today's date for `<date>`.
  2. Move this plan to `docs/plans/archive/2026-10-25-france-audit.md` with `git mv` if it is tracked, otherwise `Move-Item`.
  3. Stage only this audit's files: `git add common/units/names_divisions/zz_INEX_FRA_names_divisions.txt wiki/France.md wiki/Home.md WORKSHOP_DESCRIPTION_GUIDELINES.md docs/plans/archive/2026-10-25-france-audit.md`. Then run `git diff HEAD -- ROADMAP.md`. If it shows only the two section C edits, `git add ROADMAP.md`. If it shows other changes (other sessions' work), leave ROADMAP.md unstaged and say so in the report.
  4. Commit with the message `Expand FRA namelists: Army of Africa, Free French, Vichy`.
  5. Push the wiki: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Expand FRA namelists: Army of Africa, Free French, Vichy"`.

## Docs payload
`-SyncWiki` writes the `FRA_MIL_NEU_01` fallback cell and the `wiki/Home.md` count. Everything else is below, verbatim. No README.md change: the file name and tag are unchanged.

### A. `wiki/France.md`
1. In the "Historical Overview" paragraph, replace
   `the colonial and North African formations, the 1943-46 *Divisions Blindées*, post-war airborne units, and government-gated militia lists for democratic, fascist, communist and neutral France.`
   with
   `the colonial troops and the *Armée d'Afrique*, the Free French and Liberation formations, the 1943-46 *Divisions Blindées*, post-war airborne units, the *Armée de l'Armistice* of 1940-42, and government-gated militia lists for democratic, fascist, communist and neutral France. In vanilla, Vichy France is a new country split off from FRA with a fascist government, and Free France is FRA itself under a democratic government; the gates below follow that.`
2. In the "Namelist Groups" table, directly after the row that starts ``| `FRA_COL_01` |``, insert these two rows:
   ```
   | `FRA_AFR_01` | Army of Africa Divisions | infantry | `%dème Div. d'Infanterie Nord-Africaine` |
   | `FRA_FFL_01` | Free French Divisions | infantry, motorized | `%dème Division Française Libre` |
   ```
3. Under ``### `FRA_MOT_01` — Motorized Divisions``, replace
   `*Divisions d'Infanterie Motorisées*. Only the 1ère *Division Motorisée d'Infanterie* (the renamed 1ère DFL, August 1943) is authored; everything else uses the numbered fallback. Shares numbering with `FRA_INF_01`.`
   with
   `The seven *Divisions d'Infanterie Motorisée* of 1940 (1ère, 3ème, 5ème, 9ème, 12ème, 15ème and 25ème) under their own numbers; other numbers use the fallback. Shares numbering with `FRA_INF_01`. The 1943 *1ère Division Motorisée d'Infanterie* (the renamed 1ère DFL) is in `FRA_FFL_01`.`
4. Under ``### `FRA_MAR_01` — Marine Divisions``, replace
   `plus the 9ème *Division d'Infanterie de Marine*. The base titles`
   with
   `plus the 9ème *Division d'Infanterie de Marine* and the *Division Bleue* of Bazeilles (1870). The base titles`
5. Under ``### `FRA_GAR_01` — Garrison Divisions``, replace
   `(Maubeuge, Thionville, Haguenau, Colmar, Dauphiné, Savoie, Alpes-Maritimes and others).`
   with
   `(Flandres, Maubeuge, la Crusnes, Thionville, Haguenau, Colmar, Dauphiné, la Savoie, Alpes-Maritimes and others), the *secteurs défensifs* of Altkirch, Montbéliard and the Rhône, and the *région fortifiée* of the Lauter.`
6. Replace the whole ``### `FRA_COL_01` — Colonial Divisions`` section (its heading and its three bullet lines) with these three sections:
   ```
   ### `FRA_COL_01` — Colonial Divisions
   The *troupes coloniales*: the numbered *Divisions d'Infanterie Coloniale* (DIC), the Indochina formations (*Division du Tonkin*, *Division de Cochinchine-Cambodge*, *Division Annam-Tonkin*, the 1ère and 2ème *Brigades du Tonkin*), the 1944-45 *Divisions Coloniales d'Extrême-Orient*, and the 2ème and 8ème *Divisions Légères d'Infanterie Coloniale* of June 1940. The North African formations are in `FRA_AFR_01`.

   ### `FRA_AFR_01` — Army of Africa Divisions
   The *Armée d'Afrique*: the 1ère-7ème *Divisions d'Infanterie Nord-Africaine* and the *Divisions Marocaines* of 1939-40, the *Divisions d'Infanterie d'Afrique* (81ème-88ème, 180ème-183ème), the 1942-45 *Divisions de Marche* of Alger, Constantine, Oran and Morocco, the 2ème DIM, the 3ème and 8ème *Divisions d'Infanterie Algérienne*, and the territorial divisions of Algeria, Tunisia and Morocco. Its own numbering, not linked to infantry.

   ### `FRA_FFL_01` — Free French Divisions
   The *Forces Françaises Libres* and the Liberation: the 1ère and 2ème *Divisions Françaises Libres*, the 1941 light divisions, the Free French brigades, the *Colonne Leclerc*, the *Brigade Indépendante Alsace-Lorraine*, the *Corps Léger d'Intervention* and the *Groupement de Marche de la 2ème DB*. Democratic governments only.
   ```
7. Under ``### `FRA_MIL_FAS_01` — Milice Divisions``, replace
   `the Milice never formed divisions. Fascist governments only.`
   with
   `the Milice never formed divisions. Also the collaborationist *Légion des Volontaires Français contre le Bolchevisme*, *Légion Tricolore* and *Phalange Africaine*, and the Milice's *Franc-Garde*. Fascist governments only.`
8. Under ``### `FRA_MIL_NEU_01` — Armistice Army Divisions``, replace the whole paragraph
   `*Armée de l'Armistice* divisions by military region and colonial command (Lyon, Alger, Dakar...). Alt-history extrapolation of the 1940-42 Vichy army. Neutrality governments only.`
   with
   `The *Armée de l'Armistice* of the 1940-42 free zone: the 1er and 2ème *Groupes de Divisions Militaires* and the eight *Divisions Militaires* (7ème Bourg-en-Bresse, 9ème Châteauroux, 12ème Limoges, 13ème Clermont-Ferrand, 14ème Lyon, 15ème Marseille, 16ème Montpellier, 17ème Toulouse) under their own numbers; other numbers use the fallback. Fascist and neutral governments, so that vanilla's Vichy France, which is fascist, sees it.`

### B. `WORKSHOP_DESCRIPTION_GUIDELINES.md`
1. In the cross-reference table, replace
   `| Included (1940 order of battle, Nicknames, National Guard, Metropolitan, Milice, FTP, Armistice Army) |`
   with
   `| Included (1940 order of battle, Nicknames, Colonial & Army of Africa, Free French, National Guard, Metropolitan, Milice & Vichy legions, FTP, Armistice Army) |`
2. Replace the two bullet lines under `[b]France[/b]`
   ```
   - 1940 order of battle: [i]11ème Division d'Infanterie 'de Fer'[/i], DLM, DCR, Maginot fortress and Alpine divisions, plus colonial and North African formations
   - Government-gated National Guard and Metropolitan divisions, [i]Division de la Milice Française[/i], Francs-Tireurs et Partisans, and Armistice Army
   ```
   with these three:
   ```
   - 1940 order of battle: [i]11ème Division d'Infanterie 'de Fer'[/i], DLM, DCR, Maginot fortress and Alpine divisions
   - Colonial troops and the Army of Africa ([i]3ème Division d'Infanterie Algérienne[/i]), and for democratic France the Free French ([i]1ère Division Française Libre[/i], Colonne Leclerc)
   - Government-gated National Guard and Metropolitan divisions, [i]Division de la Milice Française[/i] and the Vichy legions, Francs-Tireurs et Partisans, and the Armistice Army's divisions militaires
   ```

### C. `ROADMAP.md` (ship step only)
1. In the priority table, replace `| 8 | FRA | Expansion | M | audit |` with `| 8 | ~~FRA~~ | Shipped <date> | M | audit |`.
2. In the numbered list, replace `8. **FRA, France.** The smallest major:` with `8. ~~**FRA, France.**~~ Shipped <date> as an expansion audit (plan in docs/plans/archive/2026-10-25-france-audit.md): Army of Africa and Free French groups added, the colonial list rewritten, the Armistice Army reworked and gated for Vichy. Before it, the smallest major:`

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader` (88 added or changed French names, no web calls). Four "unsure" findings and no errors; the batch is unchanged:
- `FRA_MAR_01` "Division Bleue" (possible confusion with the Spanish *División Azul*): kept. Researcher B sourced it as the French marine division at Bazeilles, 1870 (en.wikipedia "Blue Division (Second French Empire)"; *Le Chevron*).
- `FRA_COL_01` "2ème/8ème Division Légère d'Infanterie Coloniale" (designation not recognised): kept. Researcher A found "Division légère d'infanterie coloniale" (2e and 8e DLIC, June 1940) in the list source, the same pattern as the 1940 *Divisions Légères d'Infanterie*.
- `FRA_FFL_01` "1ère Division Motorisée d'Infanterie" (word order differs from `FRA_MOT_01`): kept on purpose. It is the 1943 designation of the renamed 1ère DFL, which is why it is a different text from the 1940 *Division d'Infanterie Motorisée*.
- `FRA_MIL_FAS_01` "Division de la Franc-Garde" (never a division): the wording was judged fine. Like the rest of the group, it is an alt-history extrapolation (wiki prose says so).
- Preview: the batch applied to a scratch copy of the mod validated (`Validation succeeded`), and `-Audit FRA` there gave the 12 flags under "Kept on judgment".

## Outcome
<!-- TODO(implementer): date, the -Check summary, deviations from this plan with the reason -->

## Edit batch
Applied by `build.ps1 -EditNames FRA -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "MOT_01", "rename": ["1ère Division Motorisée d'Infanterie=1ère Division d'Infanterie Motorisée"],
  "section": "Divisions d'Infanterie Motorisée",
  "add": ["3=3ème Division d'Infanterie Motorisée", "5=5ème Division d'Infanterie Motorisée", "9=9ème Division d'Infanterie Motorisée",
          "12=12ème Division d'Infanterie Motorisée", "15=15ème Division d'Infanterie Motorisée", "25=25ème Division d'Infanterie Motorisée"] }
```

```json batch
{ "group": "GAR_01",
  "rename": ["Division de Forteresse de Crusnes=Division de Forteresse de la Crusnes", "Division de Forteresse de Savoie=Division de Forteresse de la Savoie"],
  "section": "Secteurs fortifiés",
  "add": ["130=Division de Forteresse des Flandres", "131=Division de Forteresse de Lille", "132=Division de Forteresse de Montbéliard",
          "133=Division de Forteresse du Rhône", "134=Division de Forteresse de la Lauter"] }
```

```json batch
{ "group": "MAR_01", "section": "Infanterie de Marine", "add": ["6=Division Bleue"] }
```

```json batch
{ "group": "COL_01", "removeAll": true,
  "comment": "Troupes coloniales. Overrides vanilla FRA_COL_01; the Armée d'Afrique is in FRA_AFR_01.\nVanilla's entries merge in, so its North African keys are written again with colonial names or the fallback text.",
  "add": ["# Indochine et Extrême-Orient",
          "41=Division du Tonkin", "42=Division de Cochinchine-Cambodge", "43=Division Annam-Tonkin",
          "44=1ère Brigade du Tonkin", "45=2ème Brigade du Tonkin",
          "46=1ère Division Coloniale d'Extrême-Orient", "47=2ème Division Coloniale d'Extrême-Orient",
          "# Divisions Légères d'Infanterie Coloniale (1940)",
          "102=2ème Division Légère d'Infanterie Coloniale", "108=8ème Division Légère d'Infanterie Coloniale",
          "# Vanilla keys written again (vanilla group merges in)",
          "1=%dère Division d'Infanterie Coloniale", "2=%dème Division d'Infanterie Coloniale", "3=%dème Division d'Infanterie Coloniale",
          "4=%dème Division d'Infanterie Coloniale", "5=%dème Division d'Infanterie Coloniale", "6=%dème Division d'Infanterie Coloniale",
          "7=%dème Division d'Infanterie Coloniale", "8=%dème Division d'Infanterie Coloniale", "9=%dème Division d'Infanterie Coloniale",
          "10=%dème Division d'Infanterie Coloniale", "11=%dème Division d'Infanterie Coloniale", "12=%dème Division d'Infanterie Coloniale",
          "13=%dème Division d'Infanterie Coloniale", "14=%dème Division d'Infanterie Coloniale", "15=%dème Division d'Infanterie Coloniale",
          "16=%dème Division d'Infanterie Coloniale", "17=%dème Division d'Infanterie Coloniale", "18=%dème Division d'Infanterie Coloniale",
          "19=%dème Division d'Infanterie Coloniale", "20=%dème Division d'Infanterie Coloniale", "21=%dème Division d'Infanterie Coloniale",
          "22=%dème Division d'Infanterie Coloniale", "23=%dème Division d'Infanterie Coloniale", "24=%dème Division d'Infanterie Coloniale",
          "25=%dème Division d'Infanterie Coloniale", "26=%dème Division d'Infanterie Coloniale", "27=%dème Division d'Infanterie Coloniale",
          "28=%dème Division d'Infanterie Coloniale", "29=%dème Division d'Infanterie Coloniale", "30=%dème Division d'Infanterie Coloniale",
          "48=%dème Division d'Infanterie Coloniale", "49=%dème Division d'Infanterie Coloniale", "50=%dème Division d'Infanterie Coloniale",
          "51=%dème Division d'Infanterie Coloniale", "52=%dème Division d'Infanterie Coloniale", "53=%dème Division d'Infanterie Coloniale",
          "54=%dème Division d'Infanterie Coloniale", "55=%dème Division d'Infanterie Coloniale", "56=%dème Division d'Infanterie Coloniale",
          "57=%dème Division d'Infanterie Coloniale", "61=%dème Division d'Infanterie Coloniale", "62=%dème Division d'Infanterie Coloniale",
          "63=%dème Division d'Infanterie Coloniale", "64=%dème Division d'Infanterie Coloniale", "65=%dème Division d'Infanterie Coloniale",
          "66=%dème Division d'Infanterie Coloniale", "67=%dème Division d'Infanterie Coloniale", "68=%dème Division d'Infanterie Coloniale",
          "69=%dème Division d'Infanterie Coloniale", "70=%dème Division d'Infanterie Coloniale", "81=%dème Division d'Infanterie Coloniale",
          "82=%dème Division d'Infanterie Coloniale", "83=%dème Division d'Infanterie Coloniale", "84=%dème Division d'Infanterie Coloniale",
          "85=%dème Division d'Infanterie Coloniale", "86=%dème Division d'Infanterie Coloniale", "87=%dème Division d'Infanterie Coloniale",
          "91=%dème Division d'Infanterie Coloniale", "92=%dème Division d'Infanterie Coloniale", "93=%dème Division d'Infanterie Coloniale",
          "94=%dème Division d'Infanterie Coloniale", "95=%dème Division d'Infanterie Coloniale", "96=%dème Division d'Infanterie Coloniale",
          "97=%dème Division d'Infanterie Coloniale", "98=%dème Division d'Infanterie Coloniale", "99=%dème Division d'Infanterie Coloniale",
          "101=%dème Division d'Infanterie Coloniale"] }
```

```json batch
{ "addGroup": true, "group": "AFR_01", "selector": "Army of Africa Divisions", "addType": "infantry",
  "fallback": "%dème Div. d'Infanterie Nord-Africaine", "after": "COL_01",
  "comment": "Armée d'Afrique: North African divisions 1914-1945. Own numbering, not linked to infantry.",
  "add": ["# Divisions d'Infanterie Nord-Africaine (1939-1940)",
          "1=1ère Division d'Infanterie Nord-Africaine", "2=2ème Division d'Infanterie Nord-Africaine",
          "3=3ème Division d'Infanterie Nord-Africaine", "4=4ème Division d'Infanterie Nord-Africaine",
          "5=5ème Division d'Infanterie Nord-Africaine", "6=6ème Division d'Infanterie Nord-Africaine",
          "7=7ème Division d'Infanterie Nord-Africaine",
          "8=1ère Division Légère d'Infanterie Nord-Africaine",
          "# Divisions Marocaines",
          "9=Division Marocaine", "10=1ère Division Marocaine", "11=2ème Division Marocaine", "12=3ème Division Marocaine",
          "# Divisions d'Infanterie d'Afrique (1939-1940)",
          "13=81ème Division d'Infanterie d'Afrique", "14=82ème Division d'Infanterie d'Afrique",
          "15=83ème Division d'Infanterie d'Afrique", "16=84ème Division d'Infanterie d'Afrique",
          "17=85ème Division d'Infanterie d'Afrique", "18=86ème Division d'Infanterie d'Afrique",
          "19=87ème Division d'Infanterie d'Afrique", "20=88ème Division d'Infanterie d'Afrique",
          "21=180ème Division d'Infanterie d'Afrique", "22=181ème Division d'Infanterie d'Afrique",
          "23=182ème Division d'Infanterie d'Afrique", "24=183ème Division d'Infanterie d'Afrique",
          "# Armée d'Afrique (1942-1945)",
          "25=Division de Marche d'Alger", "26=Division de Marche de Constantine", "27=Division de Marche d'Oran",
          "28=1ère Division de Marche du Maroc", "29=2ème Division d'Infanterie Marocaine",
          "30=3ème Division d'Infanterie Algérienne", "31=8ème Division d'Infanterie Algérienne",
          "# Divisions territoriales",
          "32=Division d'Alger", "33=Division d'Oran", "34=Division de Constantine", "35=Division d'Occupation de Tunisie",
          "36=Division de Casablanca", "37=Division de Fès", "38=Division de Meknès", "39=Division de Marrakech"] }
```

```json batch
{ "addGroup": true, "group": "FFL_01", "selector": "Free French Divisions", "addType": "infantry; motorized",
  "fallback": "%dème Division Française Libre", "canUse": "has_government = democratic", "after": "AFR_01",
  "comment": "Forces Françaises Libres and the Liberation. Democratic governments only (Free France is FRA under the FRA_FREE cosmetic tag).",
  "add": ["# Forces Françaises Libres (1940-1943)",
          "1=1ère Division Française Libre", "2=2ème Division Française Libre", "3=1ère Division Motorisée d'Infanterie",
          "4=1ère Division Légère Française Libre", "5=2ème Division Légère Française Libre",
          "6=1ère Brigade Française Libre", "7=2ème Brigade Française Libre", "8=4ème Brigade Française Libre",
          "9=Brigade Française Libre d'Orient", "10=Corps Expéditionnaire Français Libre", "11=Colonne Leclerc",
          "# Libération et Extrême-Orient (1943-1945)",
          "12=Brigade Indépendante Alsace-Lorraine", "13=Corps Léger d'Intervention", "14=Groupement de Marche de la 2ème DB"] }
```

```json batch
{ "group": "MIL_FAS_01", "section": "Légions et Franc-Garde (1941-1944)",
  "add": ["21=Légion des Volontaires Français contre le Bolchevisme", "22=Légion Tricolore", "23=Phalange Africaine", "24=Division de la Franc-Garde"] }
```

```json batch
{ "group": "MIL_NEU_01", "removeAll": true, "fallback": "%dème Division Militaire",
  "canUse": "OR = { has_government = fascism has_government = neutrality }",
  "comment": "Armée de l'Armistice (1940-1942): the free zone's divisions militaires under their own numbers.\nFascist or neutral governments: vanilla's Vichy France is a dynamic FRA country with a fascist government.",
  "add": ["# Groupes de Divisions Militaires",
          "1=1er Groupe de Divisions Militaires (Avignon)", "2=2ème Groupe de Divisions Militaires (Clermont-Ferrand)",
          "# Divisions Militaires de la zone libre",
          "7=7ème Division Militaire (Bourg-en-Bresse)", "9=9ème Division Militaire (Châteauroux)",
          "12=12ème Division Militaire (Limoges)", "13=13ème Division Militaire (Clermont-Ferrand)",
          "14=14ème Division Militaire (Lyon)", "15=15ème Division Militaire (Marseille)",
          "16=16ème Division Militaire (Montpellier)", "17=17ème Division Militaire (Toulouse)"] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
No name changes versus the base revision.
<!-- END CHANGE TABLE -->
