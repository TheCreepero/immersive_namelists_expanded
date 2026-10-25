# France (FRA) Namelist Plan - 2026-10-25

Status: DONE

File: `common/units/names_divisions/zz_INEX_FRA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
France has an INEX file of 22 groups (expansion audit shipped 2026-10-25: Army of Africa, Free French, Armistice Army). This plan adds 14 new groups on four themes the user asked for: the French Revolution, the Bonaparte dynasty, the Paris Commune and coastal/island garrisons. Every new group has a new tag; no existing group changes.

## Decisions
- 2026-10-25, user, before research:
  - Revolution: both wings. Democratic (volunteers and armies of the Republic, Republican cavalry) and communist (Jacobin and sans-culotte tradition).
  - Bonapartist groups: `has_government = neutrality`, matching vanilla's Third Empire path (Napoléon VI, `set_politics = { ruling_party = neutrality }`, cosmetic tag `FRA_THIRD_EMPIRE`, `common/national_focus/france.txt:8108`). The Orléanist restoration is also neutrality and sees these groups too; a focus or flag gate is not allowed (guide §6).
  - Extras, all approved: Imperial armored and cavalry lists, a Second Empire list, communist motorized and armored lists, a Republican cavalry list.
  - Coastal: two ungated groups, metropolitan coastal defence and island & overseas garrisons.
- Policy: verified names plus plausible extrapolation of verified patterns, as in the rest of the file. Title case and *1ère*/*2ème* ordinals (user decision of 2026-10-01). Honorific entries carry `%d` (`%dère` under key 1, `%dème` elsewhere), as `FRA_INF_02` and `FRA_GARDE_NAT_01` do; titles that carry their own number are static.
- Communist groups: `has_government = communism`, matching vanilla's Commune path (`FRA_celebrate_the_commune`).
- `FRA_INF_02` keeps its Revolutionary and Napoleonic honorifics (Valmy, Jemmapes, Marengo, Austerlitz, Iéna, Wagram, Hoche, Marceau, Kléber, Desaix, Lafayette, Sambre-et-Meuse). No quoted identity in the new groups repeats one already in the file or in another new group (`IDENTITY_REPEAT`). Unquoted titles such as "Division de l'Armée de Sambre-et-Meuse" or "Division Gironde" are not identities and may echo an existing honorific.
- Ideology groups get no plain variant: like the file's existing gated groups, they are alternatives to the plain lines, not nicknamed versions of them. The mobile ideology groups link to the plain mobile anchors so they share numbering: `FRA_COMMUNE_MOT_01` to `FRA_MOT_01`, `FRA_GRA_ARM_01` and `FRA_COMMUNE_ARM_01` to `FRA_ARM_01`. Infantry and cavalry ideology groups are unlinked, as the file's other gated groups are.
- Placement: `FRA_COT_01` and `FRA_ILE_01` go after `FRA_GAR_01` in the "Specialist infantry" section; the 12 ideology groups go at the end of the file, after `FRA_MIL_NEU_01`, under three new section banners (Revolutionary traditions, Bonapartist France, Paris Commune).
- Who is left out:
  - Revolution: traitors and defectors (Dumouriez, Pichegru, Custine, Biron, Houchard). Girondins and Dantonists stay out of the communist list. Moreau and Kellermann père (later a marshal) stay out of the democratic list. Vendée-war and federalist-revolt départements are not used as volunteer honorifics. Arcole, Lodi and Rivoli are Bonaparte's own campaign, so they go to the Bonapartist list.
  - Bonapartist: Bernadotte, Marmont, Murat, Augereau, Berthier and the other marshals who rallied to the Bourbons in 1814; Grouchy (blamed for Waterloo); Bazaine (Metz). Mac-Mahon (a monarchist, later President of the Third Republic) is left out. So are Puebla (the 1862 defeat is the famous one) and Oaxaca (Bazaine's).
  - Bonapartist, kept: Ney, the "Brave des Braves", executed for rallying to Napoleon in 1815. He is a martyr of the Bonapartist tradition.
  - Commune: Cluseret (later nationalist) and Rossel and Bergeret (party unverified) are left out. So are Jaurès and Guesde (SFIO, not the communist tradition) and Clemenceau.
  - Commune, period: WWII figures (Môquet, Péri, Manouchian, Fabien) are left out, as an anachronism for a France that turns communist in 1936-39; the existing FTP group carries the WWII Resistance.
- Spelling: modern French forms for the Napoleonic battles (*Eckmühl*, *Essling*, *La Moskova*, *Lützen*, *Smolensk*), not the archaic Arc de Triomphe forms. 1790 forms for the départements (*Seine-Inférieure*, *Côtes-du-Nord*, *Basses-Alpes*). *Dombrowski* is the Communards' own French spelling.
- Each honorific is used in one group only. Montebello goes to the First Empire (Lannes, 1800), not the Second; Zurich, Hohenlinden and Neuwied to the Republic; Bara, Viala and Le Peletier to the democratic list; Carmagnole to the Jacobin list.

## Vanilla findings (`-InspectVanilla FRA`)
Vanilla has 14 FRA groups (`FRA_INF_01`, `FRA_CAV_01`, `FRA_MOT_01`, `FRA_MEC_01`, `FRA_DLC_01`, `FRA_ARM_01`-`03`, `FRA_PAR_01`, `FRA_MAR_01`, `FRA_MNT_01`, `FRA_GAR_01`, `FRA_COL_01`, `FRA_RGR_01`); scripted references to `FRA_INF_01` (chile.txt, free_france.txt) and `FRA_ARM_01` (france.txt). The INEX file already defines every vanilla tag but `FRA_RGR_01`, and the 2026-10-25 audit settled their vanilla carry-over. This plan reuses no vanilla tag: nothing merges and no vanilla name is affected. The links to `FRA_MOT_01` and `FRA_ARM_01` only share numbering.

## Group suite
| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `FRA_COT_01` | Coastal Defense Divisions | infantry | always | - | `%dème Division de Défense du Littoral` | 35 |
| `FRA_ILE_01` | Island & Overseas Garrisons | infantry | always | - | `%dème Division de Garnison` | 30 |
| `FRA_REV_01` | Volunteer Divisions | infantry | democratic | - | `%dème Division de Volontaires Nationaux` | 45 |
| `FRA_REV_02` | Republican Demi-Brigades | infantry | democratic | - | `%dème Demi-Brigade de Bataille` | 46 |
| `FRA_REV_CAV_01` | Republican Cavalry | cavalry | democratic | - | `%dème Division de Cavalerie Républicaine` | 11 |
| `FRA_REV_COM_01` | Sans-Culotte Divisions | infantry, militia | communism | - | `%dème Division de l'Armée Révolutionnaire` | 33 |
| `FRA_GARDE_IMP_01` | Imperial Guard Divisions | infantry | neutrality | - | `%dème Division de la Garde Impériale` | 34 |
| `FRA_GRA_01` | Grande Armée Divisions | infantry | neutrality | - | `%dème Division de la Grande Armée` | 37 |
| `FRA_GRA_ARM_01` | Cuirassier Divisions | light_armor, medium_armor, heavy_armor, modern_armor | neutrality | `FRA_ARM_01` | `%dème Division de Cuirassiers` | 22 |
| `FRA_GRA_CAV_01` | Imperial Cavalry Divisions | cavalry | neutrality | - | `%dème Division de Cavalerie Légère` | 18 |
| `FRA_SEC_EMP_01` | Second Empire Divisions | infantry | neutrality | - | `%dème Division de Voltigeurs de la Garde` | 25 |
| `FRA_COMMUNE_01` | Federated Legions | infantry, militia | communism | - | `%dème Légion Fédérée` | 25 |
| `FRA_COMMUNE_MOT_01` | Commune Motorized Divisions | motorized, mechanized | communism | `FRA_MOT_01` | `%dème Division Motorisée de la Commune` | 14 |
| `FRA_COMMUNE_ARM_01` | Commune Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | communism | `FRA_ARM_01` | `%dème Division Blindée de la Commune` | 10 |

Total: 14 groups, 385 names; the file goes from 22 to 36 groups and from 507 to 892 names.

## Research record
Four `inex-historical-researcher` runs on 2026-10-25, in parallel:
- Revolution (about 36 web calls; 7 fetches failed). Sources: fr.wikipedia "Liste des départements français de 1790"; en.wikipedia "National Volunteers (France)", "Demi-brigade", "Revolutionary sections of Paris", "Charles-Philippe Ronsin", "Hussards de la Mort", "9th Hussar Regiment", "Légion des Américains", "Légion des Allobroges", "List of battles involving France in modern history"; frenchempire.net "Organization of French Revolutionary Armies 1791-1801"; historyofwar.org; universalis.fr.
- Bonapartist (about 28 web calls). Sources: fr.wikipedia "Garde impériale (Premier Empire)", "Garde impériale (Second Empire)", "Maréchal d'Empire"; en.wikipedia "Imperial Guard (Napoleon I)", "Young Guard (Napoleonic)", "Old Guard (France)", "Imperial Guard Cavalry (First Empire)", "Waterloo campaign order of battle", "Reserve Cavalry Corps (Grande Armée)", "Battles inscribed on the Arc de Triomphe", "Franco-Prussian War order of battle", "Second Italian War of Independence", "French intervention in Mexico".
- Commune (about 37 web calls). Sources: parcours.commune1871.org; fr.wikipedia "Commune de Paris (1871)", "Garde nationale (France, 1870-1871)"; fotw.info "Paris Commune flags"; en.wikipedia "Insurrectionary communes in France in 1870-1871", "Le Creusot Commune", "XIV International Brigade", "FTP-MOI", "The Internationale", "Canut revolts"; commune1871.org biographies; geneawiki.
- Coastal and islands (36 web calls). Sources: tirsportifchabris.fr (transcription of the 15 Oct 1939 - 10 Jun 1940 coastal order of battle); en.wikipedia "French Forces of the West", "25th Motorized Division (France)", "15th Military Division (Vichy France)", "Defensive Organization of Corsica", "Battle of Madagascar", "French Somaliland in World War II"; geneacaux.fr "La milice de garde-côte"; patrimoine.bzh; Parc national de Port-Cros "Sentinelles de pierre"; maisondelaculture.pf; napoleon.org (camp de Boulogne).
- Unverified and therefore not used: the departmental armées révolutionnaires outside Paris; the demi-brigade sobriquets (32e, 57e, 10e légère); Hussards de Saint-Georges, Hussards de l'Égalité, Légion Batave; the regimental nicknames 10e léger, 18e, 21e, 32e and 46e; Vélites titles; Mellinet; the Commune's Défenseurs de la République, Turcos, Lascars, Garibaldiens, Éclaireurs fédérés and Amazones de la Seine; "Division Marchand", "Brigade Bretagne", "Groupement de Corse"; the Navy's *fronts de mer* titles; the garrisons of Molène, Houat, Hoëdic, Aix, Yeu, Noirmoutier and the Channel islands, of Wallis-et-Futuna and of Kerguelen.

## Author confirmation
Every entry here is in the batch. Each is either extrapolated from a verified pattern, or well documented but not fetched in this run.
- **All four themes**: the division-level titles are an alt-history extrapolation. The verified source units were battalions, demi-brigades, regiments, legions or sectors, and the plan names a division after them. This covers "Division de Volontaires Nationaux", "Demi-Brigade de Bataille" as a division, "Division de Cavalerie Républicaine", "Division de l'Armée Révolutionnaire", "Division de la Garde Impériale", "Division de la Grande Armée", "Division de Cuirassiers", "Division de Cavalerie Légère", "Division de Voltigeurs de la Garde", "Légion Fédérée", "Division Motorisée/Blindée de la Commune", "Division de Défense du Littoral" and "Division de Garnison".
- `FRA_REV_01`: Mont-Blanc and Mont-Terrible (créations of 1792-93, not in the 1790 list).
- `FRA_REV_02`:
  - Well documented, not fetched: 'Levée en Masse', 'An II', 'Marianne', 'Jeu de Paume', 'Bastille', 'Fédération'.
  - Results not fetched (general knowledge): 'Geisberg', 'Zurich' (the second battle, 1799), 'Hohenlinden'.
  - 'Carnot': a Montagnard, but he also served Napoleon in 1815, a mixed record.
  - 'Championnet': general knowledge.
- `FRA_REV_CAV_01`: 'Texel' (the hussars' capture of the Dutch fleet at Den Helder, January 1795: general knowledge, not in the dossier); 'Général Dumas'.
- `FRA_REV_COM_01`: 'Hanriot', 'Saint-Just', 'Couthon', 'Carmagnole', 'Ça Ira', 'Salut Public', 'Égaux' (general knowledge); 'Mutius-Scævola' (the period spelling of the section; modern Latin "Mucius").
- `FRA_GARDE_IMP_01`:
  - The 4ème, 5ème and 6ème Division de la Jeune Garde: numbering up to six in 1813-14 comes from a secondary source.
  - "Division des Marins de la Garde": the Marins were a battalion.
  - 'Dorsenne', 'Dumoustier', 'Lefebvre': well documented as Guard commanders, not fetched.
- `FRA_GRA_01`: 'Suchet', 'Soult' and 'Brune' (Brune was assassinated by royalists in 1815) are general knowledge. 'Un contre dix' under key 84 (84e de ligne) is attested, with an uncertain origin.
- `FRA_GRA_ARM_01`: 'Caulaincourt' (Auguste, killed at La Moskova) and 'Reichshoffen' (the cuirassier charge of 1870) are general knowledge; "Division des Carabiniers".
- `FRA_GRA_CAV_01`: 'Marulaz', 'Curély' (spelling from general knowledge).
- `FRA_SEC_EMP_01`: the victory dates are general knowledge. 'Camerone' is a Foreign Legion tradition. 'Canrobert' capitulated at Metz with Bazaine; the dossier judges him loyal. 'Margueritte' (Floing, 1870).
- `FRA_COMMUNE_01`: 'Commune de Lyon' and 'Commune de Marseille' (the cities are already FTP honorifics; these are the commune names); 'Fort de Montrouge', 'Fort de Bicêtre', 'Charonne', 'Batignolles' (general knowledge).
- `FRA_COMMUNE_MOT_01`: 'Paul Lafargue' (Parti ouvrier, Marx's son-in-law; party not fetched this run); 'Croix-Rousse', 'Premier Mai'.
- `FRA_COMMUNE_ARM_01`: 'Duval' and 'La Cécilia' (Communard generals; their faction is unverified).
- `FRA_COT_01`: the place-based extrapolations, which follow the verified sector pattern:
  - Saint-Nazaire, La Rochelle, Royan and la Pointe de Grave (the 1944-45 pockets);
  - Calais, Dieppe, Saint-Malo, Bayonne and Sète;
  - the six Garde-Côtes entries (the capitaineries of Saint-Pol-de-Léon and La Hougue are attested);
  - the four armées des côtes and the four camps, as divisions.
- `FRA_ILE_01`: every "Division de Garnison de ..." entry. The places and their garrisons are verified for Ajaccio, Bastia, Bonifacio, Corte, Ouessant, Belle-Île, Groix, Ré and Oléron; the other places are not. "Division du Pacifique", "Division Mixte Malgache", "Division de Tirailleurs Malgaches" and "Division de Tirailleurs Somalis" are extrapolated from verified battalions and regiments.

## Kept on judgment
Expected after the batch: `AUDIT SUMMARY FRA: GROUPS=36 AUTHORED=734/892 FLAGS=12`. These are the same 12 flags as before this plan; no new group carries a flag. A rehearsal outside the repository confirmed this: the batch was applied to an export of HEAD, the docs payload replayed, then `-Audit FRA` and `-SyncWiki FRA` were run.
- `LOW_DEPTH` x8 (`FRA_MOT_01`, `FRA_MEC_01`, `FRA_DLC_01`, `FRA_ARM_01`, `FRA_ARM_02`, `FRA_ARM_03`, `FRA_PAR_01`, `FRA_MAR_01`), `UNLINKED_MOBILE` on `FRA_MEC_01`, `PLACEHOLDER_ENTRIES` on `FRA_GAR_01` and `FRA_COL_01`, `NAME_LONG` on `FRA_MIL_COM_01`: unchanged, kept by the 2026-10-01, 2026-10-17 and 2026-10-25 audits.
- `Vanilla:` lines: the same two `leaves out 1 vanilla name(s)` lines as before (`FRA_ARM_02` key 1, `FRA_PAR_01` key 1).
- Workshop info line after the docs payload: `[b]France[/b] 3 bullet(s), 6 [i] example(s); description 14099/17000 chars`.
- The new groups write no vanilla tag, so `error.log` gets no new `Adding a duplicate ORDERED division name` lines from them.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames FRA -Batch docs/plans/2026-10-25-france-namelist.md`. Expect these 14 lines and no `[ERROR]`:
  - `Added FRA_COT_01: "Coastal Defense Divisions" [infantry], 35 name(s)`
  - `Added FRA_ILE_01: "Island & Overseas Garrisons" [infantry], 30 name(s)`
  - `Added FRA_REV_01: "Volunteer Divisions" [infantry], 45 name(s)`
  - `Added FRA_REV_02: "Republican Demi-Brigades" [infantry], 46 name(s)`
  - `Added FRA_REV_CAV_01: "Republican Cavalry" [cavalry], 11 name(s)`
  - `Added FRA_REV_COM_01: "Sans-Culotte Divisions" [infantry militia], 33 name(s)`
  - `Added FRA_GARDE_IMP_01: "Imperial Guard Divisions" [infantry], 34 name(s)`
  - `Added FRA_GRA_01: "Grande Armée Divisions" [infantry], 37 name(s)`
  - `Added FRA_GRA_ARM_01: "Cuirassier Divisions" [light_armor medium_armor heavy_armor modern_armor], 22 name(s), links FRA_ARM_01`
  - `Added FRA_GRA_CAV_01: "Imperial Cavalry Divisions" [cavalry], 18 name(s)`
  - `Added FRA_SEC_EMP_01: "Second Empire Divisions" [infantry], 25 name(s)`
  - `Added FRA_COMMUNE_01: "Federated Legions" [infantry militia], 25 name(s)`
  - `Added FRA_COMMUNE_MOT_01: "Commune Motorized Divisions" [motorized mechanized], 14 name(s), links FRA_MOT_01`
  - `Added FRA_COMMUNE_ARM_01: "Commune Armored Divisions" [light_armor medium_armor heavy_armor modern_armor], 10 name(s), links FRA_ARM_01`
- [x] 2. Make the edits under "Docs payload", section A (`wiki/France.md`, edits 1-5), with Edit, exactly as written. For edit 5, append after the last line of the page (the `FRA_MIL_NEU_01` paragraph ending `which is fascist, sees it.`).
- [x] 3. `powershell -File .\build.ps1 -SyncWiki FRA`. Expect `France.md: 0 row(s) updated` and `wiki/Home.md: FRA group count 22 -> 36`, and no line about stale or missing rows. If it prints a prose review note, report it; do not change the prose.
- [x] 4. Make the edits under "Docs payload", section B (`WORKSHOP_DESCRIPTION_GUIDELINES.md`), with Edit, exactly as written.
- [x] 5. `powershell -File .\build.ps1 -Check FRA`. Expect `Validate: OK`, all tests passed, `AUDIT SUMMARY FRA: GROUPS=36 AUTHORED=734/892 FLAGS=12` with the flags under "Kept on judgment", a diff of 14 groups and +385 names with none removed, and `Check passed`. Then `powershell -File .\build.ps1 -Audit FRA | Select-String 'Workshop|vanilla name'` must print the two `Vanilla:` lines and the Workshop line under "Kept on judgment".
- [x] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Plans and namelists of other nations may show in `git status`: other sessions work on them; leave them alone.
- [x] 7. Ship, on the user's word:
  1. Move this plan to `docs/plans/archive/2026-10-25-france-namelist.md` with `git mv` if it is tracked, otherwise `Move-Item`.
  2. Stage only this plan's files: `git add common/units/names_divisions/zz_INEX_FRA_names_divisions.txt wiki/France.md wiki/Home.md WORKSHOP_DESCRIPTION_GUIDELINES.md docs/plans/archive/2026-10-25-france-namelist.md`.
  3. Commit with the message `Expand FRA namelists: Revolution, Bonapartist Empire, Paris Commune, coastal garrisons`.
  4. Push the wiki: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Expand FRA namelists: Revolution, Bonapartist Empire, Paris Commune, coastal garrisons"`.

## Docs payload
`-SyncWiki` writes the `wiki/Home.md` group count. Everything else is below, verbatim. No README.md change (file name and tag unchanged) and no ROADMAP.md change (France's entry is already marked shipped).

### A. `wiki/France.md`
1. In the "Historical Overview" paragraph, replace
   `the *Armée de l'Armistice* of 1940-42, and government-gated militia lists for democratic, fascist, communist and neutral France. In vanilla, Vichy France is a new country split off from FRA with a fascist government, and Free France is FRA itself under a democratic government; the gates below follow that.`
   with
   `coastal defence and island and overseas garrisons, the *Armée de l'Armistice* of 1940-42, government-gated militia lists for democratic, fascist, communist and neutral France, and three historical-tradition suites: the Revolution of 1789-99 for democratic and communist France, the Imperial Guard, Grande Armée and Second Empire for a Bonapartist France, and the Paris Commune of 1871 for communist France. In vanilla, Vichy France is a new country split off from FRA with a fascist government, and Free France is FRA itself under a democratic government; the gates below follow that. Vanilla's Bonapartist restoration (Napoléon VI) sets a neutral government, as does the Orléanist one, so both see the Bonapartist groups; the Commune path is communist.`
2. In the "Namelist Groups" table, directly after the row that starts ``| `FRA_GAR_01` |``, insert these two rows:
   ```
   | `FRA_COT_01` | Coastal Defense Divisions | infantry | `%dème Division de Défense du Littoral` |
   | `FRA_ILE_01` | Island & Overseas Garrisons | infantry | `%dème Division de Garnison` |
   ```
3. In the same table, directly after the row that starts ``| `FRA_MIL_NEU_01` |`` (the last row), insert these twelve rows:
   ```
   | `FRA_REV_01` | Volunteer Divisions | infantry | `%dème Division de Volontaires Nationaux` |
   | `FRA_REV_02` | Republican Demi-Brigades | infantry | `%dème Demi-Brigade de Bataille` |
   | `FRA_REV_CAV_01` | Republican Cavalry | cavalry | `%dème Division de Cavalerie Républicaine` |
   | `FRA_REV_COM_01` | Sans-Culotte Divisions | infantry, militia | `%dème Division de l'Armée Révolutionnaire` |
   | `FRA_GARDE_IMP_01` | Imperial Guard Divisions | infantry | `%dème Division de la Garde Impériale` |
   | `FRA_GRA_01` | Grande Armée Divisions | infantry | `%dème Division de la Grande Armée` |
   | `FRA_GRA_ARM_01` | Cuirassier Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Division de Cuirassiers` |
   | `FRA_GRA_CAV_01` | Imperial Cavalry Divisions | cavalry | `%dème Division de Cavalerie Légère` |
   | `FRA_SEC_EMP_01` | Second Empire Divisions | infantry | `%dème Division de Voltigeurs de la Garde` |
   | `FRA_COMMUNE_01` | Federated Legions | infantry, militia | `%dème Légion Fédérée` |
   | `FRA_COMMUNE_MOT_01` | Commune Motorized Divisions | motorized, mechanized | `%dème Division Motorisée de la Commune` |
   | `FRA_COMMUNE_ARM_01` | Commune Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%dème Division Blindée de la Commune` |
   ```
4. Directly after the ``### `FRA_GAR_01` — Garrison Divisions`` section (its heading and paragraph), before ``### `FRA_COL_01` — Colonial Divisions``, insert:
   ```
   ### `FRA_COT_01` — Coastal Defense Divisions
   The ten *Secteurs de Défense du Littoral* of 1939-40, from Dunkerque to Nice (the Dunkerque and Boulogne sector became the *Groupement Littoral Nord* and then the 68e DI), the *Division Gironde* and the 1944-45 Atlantic pockets, the *garde-côtes* tradition of the coastal militia, and the *Armées des Côtes* and Boulogne camps of 1793-1805. The sectors past the 1939 ten are a plausible extrapolation. Its own numbering, not linked to infantry. Available to every government.

   ### `FRA_ILE_01` — Island & Overseas Garrisons
   Garrisons for Corsica (the *Secteur de Défense du Littoral de la Corse* and the garrison towns of Ajaccio, Bastia, Bonifacio and Corte), the Atlantic and Mediterranean islands (Ouessant, Belle-Île, Groix, Ré, Oléron, Hyères, Lérins, Frioul), and the overseas territories outside Indochina and North Africa, from the Antilles to Tahiti, plus divisions after the *Bataillon du Pacifique*, the *Régiment Mixte Malgache* and the *Tirailleurs Malgaches* and *Somalis*. Most garrison titles are a plausible extrapolation. Available to every government.
   ```
5. At the end of the page, after the ``### `FRA_MIL_NEU_01` — Armistice Army Divisions`` section, append:
   ```

   ### `FRA_REV_01` — Volunteer Divisions
   The *Volontaires Nationaux* of 1791-93, raised by département, under the 1790 names (*Côte-d'Or*, *Seine-Inférieure*, *Basses-Alpes*) and the annexed *Mont-Blanc* and *Mont-Terrible*. Départements of the Vendée war and the federalist revolts are left out. Democratic governments only.

   ### `FRA_REV_02` — Republican Demi-Brigades
   *Demi-Brigades de Bataille* of the 1793 *amalgame*, named for the Republic's victories (*Fleurus*, *Hondschoote*, *Wattignies*, *Hohenlinden*), its generals and martyrs (*Dampierre*, *Dugommier*, *Beaurepaire*, *Joubert*, *Bara*, *Viala*) and its watchwords (*Patrie en Danger*, *Levée en Masse*), plus divisions of the armies of the Republic (*Armée du Nord*, *de Sambre-et-Meuse*, *de Rhin-et-Moselle*). Democratic governments only.

   ### `FRA_REV_CAV_01` — Republican Cavalry
   The free cavalry corps of 1792-93: the *Hussards de la Mort*, *de la Liberté*, *Noirs* and *de la Montagne*, the *Éclaireurs de Fabrefonds*, and the *Légions des Allobroges*, *des Américains* (the chevalier de Saint-Georges's legion) and *Germanique*. Democratic governments only.

   ### `FRA_REV_COM_01` — Sans-Culotte Divisions
   The Jacobin and sans-culotte tradition: the *Armée Révolutionnaire Parisienne* of 1793, the Montagnards and proto-communists (*Robespierre*, *Saint-Just*, *Marat*, *Babeuf*, *Buonarroti*), and the revolutionary sections of Paris (*Piques*, *Bonnet-Rouge*, *Sans-Culottes*, *Gravilliers*, *Quinze-Vingts*). Girondins and Dantonists are left out. Communist governments only.

   ### `FRA_GARDE_IMP_01` — Imperial Guard Divisions
   The First Empire's *Garde Impériale*: the *Vieille*, *Moyenne* and *Jeune Garde* (whose divisions were numbered up to six in 1813-14), the Waterloo *Divisions de Grenadiers* and *de Chasseurs*, the Guard's infantry corps from the *Grenadiers à Pied* to the *Pupilles* and *Marins*, and its commanders (*Friant*, *Cambronne*, *Drouot*, *Mortier*). Neutral governments only.

   ### `FRA_GRA_01` — Grande Armée Divisions
   Line divisions named for the loyal marshals (*Davout*, *Masséna*, *Lannes*, *Ney*) and the victories of 1796-1815 not used elsewhere in the file (*Rivoli*, *Arcole*, *Friedland*, *Eckmühl*, *La Moskova*, *Montmirail*, *Ligny*), with the 9e léger's *L'Incomparable* under 9 and the 84e's *Un contre dix* under 84. Marshals who went over to the Bourbons or the coalition (Bernadotte, Marmont, Murat and others) are left out. Neutral governments only.

   ### `FRA_GRA_ARM_01` — Cuirassier Divisions
   Armored divisions in the tradition of Napoleon's heavy cavalry, named for its generals (*Nansouty*, *d'Hautpoul*, *Kellermann*, *Milhaud*, *Latour-Maubourg*) and its charges (*Eylau*, *Reichshoffen*), plus the Guard's heavy cavalry (*Grenadiers à Cheval*, *Dragons de l'Impératrice*). Shares numbering with `FRA_ARM_01`. Neutral governments only.

   ### `FRA_GRA_CAV_01` — Imperial Cavalry Divisions
   The Guard's light cavalry (*Chasseurs à Cheval de la Garde*, *Chevau-Légers Polonais*, *Lanciers Rouges*, *Mamelouks*, *Éclaireurs*, *Gardes d'Honneur*) and divisions named for the light cavalry generals (*Lasalle*, *Pajol*, *Colbert*) and the charge at *Somosierra*. Neutral governments only.

   ### `FRA_SEC_EMP_01` — Second Empire Divisions
   Napoleon III's army of 1852-70: the two infantry divisions of the Guard of 1870, the *Zouaves de la Garde*, the Crimean, Mexican and Chinese expeditions, the victories of Crimea and Italy (*Alma*, *Malakoff*, *Sébastopol*, *Magenta*, *Solférino*, *Palikao*, *Camerone*) and the loyal marshals (*Pélissier*, *Canrobert*, *Bosquet*, *Niel*). Bazaine and Mac-Mahon are left out. Neutral governments only.

   ### `FRA_COMMUNE_01` — Federated Legions
   The Commune's *Garde Nationale Fédérée*, organised in *légions* by arrondissement, as *Légions Fédérées*: the *Vengeurs de Flourens* and *Tirailleurs de la Marseillaise*, the quarters and forts of 1871 (*Belleville*, *Montmartre*, *Butte-aux-Cailles*, *Fort d'Issy*), the *Semaine Sanglante* and the *Mur des Fédérés*, and the provincial communes (*Narbonne*, *Le Creusot*). Communist governments only.

   ### `FRA_COMMUNE_MOT_01` — Commune Motorized Divisions
   Motorized divisions named for the Communards of the *Internationale* (*Varlin*, *Frankel*, *Louise Michel*, *Dmitrieff*), *Blanqui*, *Eugène Pottier* and *Temps des Cerises*, and the workers' movement (*Canuts*, *Fourmies*, *Premier Mai*); *Henri Barbusse* and *Vaillant-Couturier* also named battalions of the International Brigades. Shares numbering with `FRA_MOT_01`. Communist governments only.

   ### `FRA_COMMUNE_ARM_01` — Commune Armored Divisions
   Armored divisions named for the Commune's generals and delegates (*Dombrowski*, *Wróblewski*, *Eudes*, *Delescluze*), the *Internationale* and the *Drapeau Rouge*. Shares numbering with `FRA_ARM_01`. Communist governments only.
   ```

### B. `WORKSHOP_DESCRIPTION_GUIDELINES.md`
1. In the cross-reference table, replace
   `| Included (1940 order of battle, Nicknames, Colonial & Army of Africa, Free French, National Guard, Metropolitan, Milice & Vichy legions, FTP, Armistice Army) |`
   with
   `| Included (1940 order of battle, Nicknames, Colonial & Army of Africa, Coastal & Island Garrisons, Free French, National Guard, Metropolitan, Revolution, Bonapartist Empire, Paris Commune, Milice & Vichy legions, FTP, Armistice Army) |`
2. Replace the three bullet lines under `[b]France[/b]`
   ```
   - 1940 order of battle: [i]11ème Division d'Infanterie 'de Fer'[/i], DLM, DCR, Maginot fortress and Alpine divisions
   - Colonial troops and the Army of Africa ([i]3ème Division d'Infanterie Algérienne[/i]), and for democratic France the Free French ([i]1ère Division Française Libre[/i], Colonne Leclerc)
   - Government-gated National Guard and Metropolitan divisions, [i]Division de la Milice Française[/i] and the Vichy legions, Francs-Tireurs et Partisans, and the Armistice Army's divisions militaires
   ```
   with these three:
   ```
   - 1940 order of battle: [i]11ème Division d'Infanterie 'de Fer'[/i], DLM, DCR, Maginot fortress, Alpine and coastal defence divisions ([i]Division de Défense du Littoral de Dunkerque[/i]), island and overseas garrisons, colonial troops and the Army of Africa
   - Democratic France: Free French ([i]1ère Division Française Libre[/i]), National Guard, the volunteers of 1792 and the Republic's demi-brigades ([i]1ère Demi-Brigade de Bataille 'Fleurus'[/i]); Bonapartist France: Imperial Guard, Grande Armée and Second Empire ([i]Division de la Vieille Garde[/i])
   - Communist France: sans-culottes, the Commune's legions with motorized and armored lists ([i]1ère Légion Fédérée 'Vengeurs de Flourens'[/i]) and the Francs-Tireurs et Partisans; plus the Milice, Vichy legions and Armistice Army
   ```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader` (384 French names, before the last addition of 'Malon'), five findings:
- `FRA_COT_01` "Division Garde-Côtes de ..." (ungrammatical): applied, now "Division de Garde-Côtes de ..." (six entries).
- `FRA_COT_01` "de la Hougue": applied, now "de La Hougue" (the place name, as "de La Rochelle").
- `FRA_COT_01` "Division Gironde" (article missing): kept. It is the 23e DI's own historical name (en.wikipedia "French Forces of the West"), not a geographic title.
- `FRA_REV_COM_01` "Mutius-Scævola" (modern "Mucius"): kept. It is the period spelling of the section, given in the source (en.wikipedia "Revolutionary sections of Paris"); listed under "Author confirmation".
- `FRA_GARDE_IMP_01` "Division de Grenadiers de la Garde" / "de Chasseurs de la Garde" (inconsistent with "des Grenadiers à Pied"): kept. "Division de Grenadiers" and "Division de Chasseurs" are the attested Waterloo designations; the "des ..." entries name the Guard's corps.
- After the proofread, data-only fixes from the rehearsal:
  - Four entries over 60 characters (`NAME_LONG`) were replaced with shorter honorifics: 'Pyrénées-Orientales' by 'Loir-et-Cher', 'Droits-de-l'Homme' by 'Finistère', 'Amis-de-la-Patrie' by 'Faubourg-du-Nord', 'Jean-Baptiste Clément' by 'Temps des Cerises'. The last moved from `FRA_COMMUNE_ARM_01`.
  - 'Malon' (Benoît Malon, Commune Council member, Internationale: dossier) was added to `FRA_COMMUNE_ARM_01` to keep it at ten names (`LOW_DEPTH` at nine). The proofreader was not dispatched again for this.
- Rehearsal: `-SyncWiki FRA` printed `France.md: 0 row(s) updated` and `wiki/Home.md: FRA group count 22 -> 36`. `-Check FRA` printed `Validate: OK` and the 12 expected flags; only the git- and register-dependent steps failed, because the export is not a git repository.

## Outcome
Date: 2026-10-25.

`-Check FRA` summary: `Validate: OK`, `Tests: 475 Passed, 0 Failed, 0 Skipped`, `AUDIT SUMMARY FRA: GROUPS=36 AUTHORED=734/892 FLAGS=12` (`LOW_DEPTH` x8, `PLACEHOLDER_ENTRIES` x2, `NAME_LONG` x1, `UNLINKED_MOBILE` x1, all listed under "Kept on judgment"), `Diff vs HEAD: 14 group(s) changed, +385 -0 name(s)`, `Check passed`. The `-Audit FRA` lines match: the two `Vanilla:` lines and `[INFO] Workshop: [b]France[/b] 3 bullet(s), 6 [i] example(s); description 14099/17000 chars`.

Deviations:
- Docs payload: the code blocks in the plan are indented three spaces to sit inside the numbered list; that indentation was not written into the docs. A blank line was also kept between the new `FRA_ILE_01` section and the `FRA_COL_01` heading, matching the page's other sections.
- `-Check` printed `Plan: no audit plan in progress for FRA`, which the plan does not mention. It is informational and not a flag or `Docs:` warning.

## Edit batch
Applied by `build.ps1 -EditNames FRA -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{ "addGroup": true, "group": "COT_01", "selector": "Coastal Defense Divisions", "addType": "infantry",
  "fallback": "%dème Division de Défense du Littoral", "after": "GAR_01",
  "comment": "Coastal defence: the Secteurs de Défense du Littoral of 1939-40 (the Dunkerque sector became the 68e DI), the 1944-45 Atlantic pockets,\nthe garde-côtes tradition and the coastal armies and camps of 1793-1805. Own numbering, not linked to infantry.",
  "add": ["# Secteurs de Défense du Littoral (1939-1940)",
          "1=Division de Défense du Littoral de Dunkerque", "2=Division de Défense du Littoral de Boulogne-sur-Mer",
          "3=Division de Défense du Littoral du Havre", "4=Division de Défense du Littoral de Cherbourg",
          "5=Division de Défense du Littoral de Brest", "6=Division de Défense du Littoral de Lorient",
          "7=Division de Défense du Littoral de Rochefort", "8=Division de Défense du Littoral de Marseille",
          "9=Division de Défense du Littoral de Toulon", "10=Division de Défense du Littoral de Nice",
          "11=Groupement Littoral Nord",
          "# Poches de l'Atlantique (1944-1945)",
          "12=Division Gironde", "13=Division de Défense du Littoral de Saint-Nazaire",
          "14=Division de Défense du Littoral de La Rochelle", "15=Division de Défense du Littoral de Royan",
          "16=Division de Défense du Littoral de la Pointe de Grave",
          "# Autres secteurs (extrapolation)",
          "17=Division de Défense du Littoral de Calais", "18=Division de Défense du Littoral de Dieppe",
          "19=Division de Défense du Littoral de Saint-Malo", "20=Division de Défense du Littoral de Bayonne",
          "21=Division de Défense du Littoral de Sète",
          "# Garde-côtes",
          "22=Division de Garde-Côtes de Normandie", "23=Division de Garde-Côtes de Bretagne",
          "24=Division de Garde-Côtes du Cotentin", "25=Division de Garde-Côtes de Provence",
          "26=Division de Garde-Côtes de Saint-Pol-de-Léon", "27=Division de Garde-Côtes de La Hougue",
          "# Armées des côtes et camps (1793-1805)",
          "28=Division de l'Armée des Côtes de Brest", "29=Division de l'Armée des Côtes de Cherbourg",
          "30=Division de l'Armée des Côtes de La Rochelle", "31=Division de l'Armée des Côtes de l'Océan",
          "32=Division du Camp de Boulogne", "33=Division du Camp de Montreuil",
          "34=Division du Camp de Bruges", "35=Division du Camp de Saint-Omer"] }
```

```json batch
{ "addGroup": true, "group": "ILE_01", "selector": "Island & Overseas Garrisons", "addType": "infantry",
  "fallback": "%dème Division de Garnison", "after": "COT_01",
  "comment": "Garrisons of Corsica, the Atlantic and Mediterranean islands and the overseas territories outside Indochina and North Africa.",
  "add": ["# Corse",
          "1=Division de Défense du Littoral de la Corse", "2=Division de Garnison d'Ajaccio",
          "3=Division de Garnison de Bastia", "4=Division de Garnison de Bonifacio", "5=Division de Garnison de Corte",
          "# Îles du Ponant et de la Méditerranée",
          "6=Division de Garnison d'Ouessant", "7=Division de Garnison de Belle-Île",
          "8=Division de Garnison de l'Île de Groix", "9=Division de Garnison de l'Île de Ré",
          "10=Division de Garnison de l'Île d'Oléron", "11=Division de Garnison des Îles d'Hyères",
          "12=Division de Garnison des Îles de Lérins", "13=Division de Garnison du Frioul",
          "# Outre-mer",
          "14=Division de Garnison de la Martinique", "15=Division de Garnison de la Guadeloupe",
          "16=Division de Garnison de la Guyane", "17=Division de Garnison de Saint-Pierre-et-Miquelon",
          "18=Division de Garnison de La Réunion", "19=Division de Garnison de Madagascar",
          "20=Division de Garnison de Diego-Suarez", "21=Division de Garnison des Comores",
          "22=Division de Garnison de la Côte Française des Somalis", "23=Division de Garnison de la Nouvelle-Calédonie",
          "24=Division de Garnison de Tahiti", "25=Division de Garnison des Nouvelles-Hébrides",
          "26=Division de Garnison des Établissements Français de l'Inde",
          "# Troupes locales",
          "27=Division du Pacifique", "28=Division Mixte Malgache",
          "29=Division de Tirailleurs Malgaches", "30=Division de Tirailleurs Somalis"] }
```

```json batch
{ "addGroup": true, "group": "REV_01", "selector": "Volunteer Divisions", "addType": "infantry",
  "fallback": "%dème Division de Volontaires Nationaux", "canUse": "has_government = democratic", "after": "MIL_NEU_01",
  "comment": "# ===== Revolutionary traditions (1789-1799) =====\n\nDemocratic governments only (has_government = democratic).\nVolontaires nationaux of 1791-93, by département under its 1790 name.",
  "add": ["1=%dère Division de Volontaires Nationaux 'Ain'", "2=%dème Division de Volontaires Nationaux 'Aisne'",
          "3=%dème Division de Volontaires Nationaux 'Allier'", "4=%dème Division de Volontaires Nationaux 'Basses-Alpes'",
          "5=%dème Division de Volontaires Nationaux 'Hautes-Alpes'", "6=%dème Division de Volontaires Nationaux 'Ardèche'",
          "7=%dème Division de Volontaires Nationaux 'Ardennes'", "8=%dème Division de Volontaires Nationaux 'Aube'",
          "9=%dème Division de Volontaires Nationaux 'Aude'", "10=%dème Division de Volontaires Nationaux 'Aveyron'",
          "11=%dème Division de Volontaires Nationaux 'Cantal'", "12=%dème Division de Volontaires Nationaux 'Charente'",
          "13=%dème Division de Volontaires Nationaux 'Corrèze'", "14=%dème Division de Volontaires Nationaux 'Côte-d'Or'",
          "15=%dème Division de Volontaires Nationaux 'Côtes-du-Nord'", "16=%dème Division de Volontaires Nationaux 'Creuse'",
          "17=%dème Division de Volontaires Nationaux 'Dordogne'", "18=%dème Division de Volontaires Nationaux 'Doubs'",
          "19=%dème Division de Volontaires Nationaux 'Drôme'", "20=%dème Division de Volontaires Nationaux 'Eure'",
          "21=%dème Division de Volontaires Nationaux 'Gers'", "22=%dème Division de Volontaires Nationaux 'Indre'",
          "23=%dème Division de Volontaires Nationaux 'Isère'", "24=%dème Division de Volontaires Nationaux 'Jura'",
          "25=%dème Division de Volontaires Nationaux 'Landes'", "26=%dème Division de Volontaires Nationaux 'Loiret'",
          "27=%dème Division de Volontaires Nationaux 'Haute-Marne'", "28=%dème Division de Volontaires Nationaux 'Meurthe'",
          "29=%dème Division de Volontaires Nationaux 'Meuse'", "30=%dème Division de Volontaires Nationaux 'Moselle'",
          "31=%dème Division de Volontaires Nationaux 'Nièvre'", "32=%dème Division de Volontaires Nationaux 'Oise'",
          "33=%dème Division de Volontaires Nationaux 'Orne'", "34=%dème Division de Volontaires Nationaux 'Puy-de-Dôme'",
          "35=%dème Division de Volontaires Nationaux 'Hautes-Pyrénées'", "36=%dème Division de Volontaires Nationaux 'Loir-et-Cher'",
          "37=%dème Division de Volontaires Nationaux 'Haut-Rhin'", "38=%dème Division de Volontaires Nationaux 'Bas-Rhin'",
          "39=%dème Division de Volontaires Nationaux 'Haute-Saône'", "40=%dème Division de Volontaires Nationaux 'Seine-Inférieure'",
          "41=%dème Division de Volontaires Nationaux 'Haute-Vienne'", "42=%dème Division de Volontaires Nationaux 'Vosges'",
          "43=%dème Division de Volontaires Nationaux 'Yonne'", "44=%dème Division de Volontaires Nationaux 'Mont-Blanc'",
          "45=%dème Division de Volontaires Nationaux 'Mont-Terrible'"] }
```

```json batch
{ "addGroup": true, "group": "REV_02", "selector": "Republican Demi-Brigades", "addType": "infantry",
  "fallback": "%dème Demi-Brigade de Bataille", "canUse": "has_government = democratic", "after": "REV_01",
  "comment": "Democratic governments only (has_government = democratic).\nDemi-brigades of the 1793 amalgame and the armies of the Republic.",
  "add": ["# Victoires de la République",
          "1=%dère Demi-Brigade de Bataille 'Fleurus'", "2=%dème Demi-Brigade de Bataille 'Hondschoote'",
          "3=%dème Demi-Brigade de Bataille 'Wattignies'", "4=%dème Demi-Brigade de Bataille 'Geisberg'",
          "5=%dème Demi-Brigade de Bataille 'Le Boulou'", "6=%dème Demi-Brigade de Bataille 'Tourcoing'",
          "7=%dème Demi-Brigade de Bataille 'Loano'", "8=%dème Demi-Brigade de Bataille 'Neuwied'",
          "9=%dème Demi-Brigade de Bataille 'Bergen'", "10=%dème Demi-Brigade de Bataille 'Zurich'",
          "11=%dème Demi-Brigade de Bataille 'Hohenlinden'",
          "# Généraux et martyrs de la République",
          "12=%dème Demi-Brigade de Bataille 'Dampierre'", "13=%dème Demi-Brigade de Bataille 'Dugommier'",
          "14=%dème Demi-Brigade de Bataille 'Beaurepaire'", "15=%dème Demi-Brigade de Bataille 'Joubert'",
          "16=%dème Demi-Brigade de Bataille 'Championnet'", "17=%dème Demi-Brigade de Bataille 'Carnot'",
          "18=%dème Demi-Brigade de Bataille 'Bara'", "19=%dème Demi-Brigade de Bataille 'Viala'",
          "20=%dème Demi-Brigade de Bataille 'Le Peletier'",
          "# Mots d'ordre de 1789-1793",
          "21=%dème Demi-Brigade de Bataille 'Patrie en Danger'", "22=%dème Demi-Brigade de Bataille 'Levée en Masse'",
          "23=%dème Demi-Brigade de Bataille 'La Marseillaise'", "24=%dème Demi-Brigade de Bataille 'An II'",
          "25=%dème Demi-Brigade de Bataille 'Marianne'", "26=%dème Demi-Brigade de Bataille 'Jeu de Paume'",
          "27=%dème Demi-Brigade de Bataille 'Bastille'", "28=%dème Demi-Brigade de Bataille 'Fédération'",
          "# Armées de la République (1791-1801)",
          "29=Division de l'Armée du Nord", "30=Division de l'Armée des Ardennes",
          "31=Division de l'Armée de la Moselle", "32=Division de l'Armée du Rhin",
          "33=Division de l'Armée des Alpes", "34=Division de l'Armée d'Italie",
          "35=Division de l'Armée des Pyrénées-Orientales", "36=Division de l'Armée des Pyrénées-Occidentales",
          "37=Division de l'Armée de Sambre-et-Meuse", "38=Division de l'Armée de Rhin-et-Moselle",
          "39=Division de l'Armée de Mayence", "40=Division de l'Armée du Danube",
          "41=Division de l'Armée d'Helvétie", "42=Division de l'Armée des Vosges",
          "43=Division de l'Armée du Centre", "44=Division de l'Armée des Grisons",
          "45=Division de l'Armée d'Allemagne", "46=Division de l'Armée de Naples"] }
```

```json batch
{ "addGroup": true, "group": "REV_CAV_01", "selector": "Republican Cavalry", "addType": "cavalry",
  "fallback": "%dème Division de Cavalerie Républicaine", "canUse": "has_government = democratic", "after": "REV_02",
  "comment": "Democratic governments only (has_government = democratic).\nThe free cavalry corps and legions of 1792-93.",
  "add": ["# Corps francs et légions (1792-1793)",
          "1=Division des Hussards de la Mort", "2=Division des Hussards de la Liberté",
          "3=Division des Hussards Noirs", "4=Division des Hussards de la Montagne",
          "5=Division des Éclaireurs de Fabrefonds", "6=Division de la Légion des Allobroges",
          "7=Division de la Légion des Américains", "8=Division de la Légion Germanique",
          "# Cavaliers de la République",
          "9=%dème Division de Cavalerie Républicaine 'Saint-Georges'", "10=%dème Division de Cavalerie Républicaine 'Général Dumas'",
          "11=%dème Division de Cavalerie Républicaine 'Texel'"] }
```

```json batch
{ "addGroup": true, "group": "REV_COM_01", "selector": "Sans-Culotte Divisions", "addType": ["infantry", "militia"],
  "fallback": "%dème Division de l'Armée Révolutionnaire", "canUse": "has_government = communism", "after": "REV_CAV_01",
  "comment": "Communist governments only (has_government = communism).\nThe Jacobin and sans-culotte tradition: the armées révolutionnaires of 1793 and the sections of Paris.",
  "add": ["1=Division de l'Armée Révolutionnaire Parisienne",
          "# Montagnards et Égaux",
          "2=%dème Division de l'Armée Révolutionnaire 'Robespierre'", "3=%dème Division de l'Armée Révolutionnaire 'Saint-Just'",
          "4=%dème Division de l'Armée Révolutionnaire 'Couthon'", "5=%dème Division de l'Armée Révolutionnaire 'Marat'",
          "6=%dème Division de l'Armée Révolutionnaire 'Chalier'", "7=%dème Division de l'Armée Révolutionnaire 'Babeuf'",
          "8=%dème Division de l'Armée Révolutionnaire 'Buonarroti'", "9=%dème Division de l'Armée Révolutionnaire 'Ronsin'",
          "10=%dème Division de l'Armée Révolutionnaire 'Hanriot'", "11=%dème Division de l'Armée Révolutionnaire 'Jacques Roux'",
          "# Sections de Paris",
          "12=%dème Division de l'Armée Révolutionnaire 'Piques'", "13=%dème Division de l'Armée Révolutionnaire 'Bonnet-Rouge'",
          "14=%dème Division de l'Armée Révolutionnaire 'Sans-Culottes'", "15=%dème Division de l'Armée Révolutionnaire 'La Montagne'",
          "16=%dème Division de l'Armée Révolutionnaire 'Gravilliers'", "17=%dème Division de l'Armée Révolutionnaire 'Quinze-Vingts'",
          "18=%dème Division de l'Armée Révolutionnaire 'Popincourt'", "19=%dème Division de l'Armée Révolutionnaire 'Finistère'",
          "20=%dème Division de l'Armée Révolutionnaire 'Mutius-Scævola'", "21=%dème Division de l'Armée Révolutionnaire 'Contrat-Social'",
          "22=%dème Division de l'Armée Révolutionnaire 'Guillaume-Tell'", "23=%dème Division de l'Armée Révolutionnaire 'Brutus'",
          "24=%dème Division de l'Armée Révolutionnaire 'Faubourg-du-Nord'", "25=%dème Division de l'Armée Révolutionnaire 'Bon-Conseil'",
          "26=%dème Division de l'Armée Révolutionnaire 'Homme-Armé'", "27=%dème Division de l'Armée Révolutionnaire 'Indivisibilité'",
          "28=%dème Division de l'Armée Révolutionnaire 'Unité'",
          "# Symboles de 1793",
          "29=%dème Division de l'Armée Révolutionnaire 'Carmagnole'", "30=%dème Division de l'Armée Révolutionnaire 'Ça Ira'",
          "31=%dème Division de l'Armée Révolutionnaire 'Salut Public'", "32=%dème Division de l'Armée Révolutionnaire 'Égalité'",
          "33=%dème Division de l'Armée Révolutionnaire 'Égaux'"] }
```

```json batch
{ "addGroup": true, "group": "GARDE_IMP_01", "selector": "Imperial Guard Divisions", "addType": "infantry",
  "fallback": "%dème Division de la Garde Impériale", "canUse": "has_government = neutrality", "after": "REV_COM_01",
  "comment": "# ===== Bonapartist France (Third Empire) =====\n\nNeutral governments only (has_government = neutrality): vanilla's Napoléon VI path.\nThe First Empire's Garde Impériale (1804-1815).",
  "add": ["# Vieille, Moyenne et Jeune Garde",
          "1=Division de la Vieille Garde", "2=Division de la Moyenne Garde",
          "3=1ère Division de la Jeune Garde", "4=2ème Division de la Jeune Garde", "5=3ème Division de la Jeune Garde",
          "6=4ème Division de la Jeune Garde", "7=5ème Division de la Jeune Garde", "8=6ème Division de la Jeune Garde",
          "9=Division de Grenadiers de la Garde", "10=Division de Chasseurs de la Garde",
          "# Corps de la Garde",
          "11=Division des Grenadiers à Pied", "12=Division des Chasseurs à Pied",
          "13=Division des Fusiliers-Grenadiers", "14=Division des Fusiliers-Chasseurs",
          "15=Division des Tirailleurs de la Garde", "16=Division des Voltigeurs de la Garde",
          "17=Division des Flanqueurs-Grenadiers", "18=Division des Flanqueurs-Chasseurs",
          "19=Division des Pupilles de la Garde", "20=Division des Marins de la Garde",
          "# Traditions et chefs de la Garde",
          "21=%dème Division de la Garde Impériale 'Les Grognards'", "22=%dème Division de la Garde Impériale 'Les Immortels'",
          "23=%dème Division de la Garde Impériale 'Vieux de la Vieille'", "24=%dème Division de la Garde Impériale 'Friant'",
          "25=%dème Division de la Garde Impériale 'Morand'", "26=%dème Division de la Garde Impériale 'Duhesme'",
          "27=%dème Division de la Garde Impériale 'Roguet'", "28=%dème Division de la Garde Impériale 'Cambronne'",
          "29=%dème Division de la Garde Impériale 'Curial'", "30=%dème Division de la Garde Impériale 'Drouot'",
          "31=%dème Division de la Garde Impériale 'Mortier'", "32=%dème Division de la Garde Impériale 'Lefebvre'",
          "33=%dème Division de la Garde Impériale 'Dorsenne'", "34=%dème Division de la Garde Impériale 'Dumoustier'"] }
```

```json batch
{ "addGroup": true, "group": "GRA_01", "selector": "Grande Armée Divisions", "addType": "infantry",
  "fallback": "%dème Division de la Grande Armée", "canUse": "has_government = neutrality", "after": "GARDE_IMP_01",
  "comment": "Neutral governments only (has_government = neutrality).\nLine divisions after the loyal marshals and the victories of 1796-1815. Key 9: the 9e léger; key 84: the 84e de ligne.",
  "add": ["# Maréchaux d'Empire",
          "1=%dère Division de la Grande Armée 'Davout'", "2=%dème Division de la Grande Armée 'Masséna'",
          "3=%dème Division de la Grande Armée 'Lannes'", "4=%dème Division de la Grande Armée 'Ney'",
          "5=%dème Division de la Grande Armée 'Soult'", "6=%dème Division de la Grande Armée 'Suchet'",
          "7=%dème Division de la Grande Armée 'Brune'",
          "# Victoires (1796-1815)",
          "8=%dème Division de la Grande Armée 'Lodi'", "9=%dème Division de la Grande Armée 'L'Incomparable'",
          "10=%dème Division de la Grande Armée 'Arcole'", "11=%dème Division de la Grande Armée 'Rivoli'",
          "12=%dème Division de la Grande Armée 'Castiglione'", "13=%dème Division de la Grande Armée 'Montenotte'",
          "14=%dème Division de la Grande Armée 'Pyramides'", "15=%dème Division de la Grande Armée 'Aboukir'",
          "16=%dème Division de la Grande Armée 'Mont-Thabor'", "17=%dème Division de la Grande Armée 'Montebello'",
          "18=%dème Division de la Grande Armée 'Ulm'", "19=%dème Division de la Grande Armée 'Elchingen'",
          "20=%dème Division de la Grande Armée 'Friedland'", "21=%dème Division de la Grande Armée 'Eckmühl'",
          "22=%dème Division de la Grande Armée 'Ratisbonne'", "23=%dème Division de la Grande Armée 'Raab'",
          "24=%dème Division de la Grande Armée 'Essling'", "25=%dème Division de la Grande Armée 'Smolensk'",
          "26=%dème Division de la Grande Armée 'La Moskova'", "27=%dème Division de la Grande Armée 'Lützen'",
          "28=%dème Division de la Grande Armée 'Bautzen'", "29=%dème Division de la Grande Armée 'Dresde'",
          "30=%dème Division de la Grande Armée 'Hanau'", "31=%dème Division de la Grande Armée 'Champaubert'",
          "32=%dème Division de la Grande Armée 'Montmirail'", "33=%dème Division de la Grande Armée 'Montereau'",
          "34=%dème Division de la Grande Armée 'Ligny'", "35=%dème Division de la Grande Armée 'Saalfeld'",
          "36=%dème Division de la Grande Armée 'Dantzig'",
          "84=%dème Division de la Grande Armée 'Un contre dix'"] }
```

```json batch
{ "addGroup": true, "group": "GRA_ARM_01", "selector": "Cuirassier Divisions", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "%dème Division de Cuirassiers", "canUse": "has_government = neutrality", "link": "FRA_ARM_01", "after": "GRA_01",
  "comment": "Neutral governments only (has_government = neutrality).\nArmored divisions in the tradition of the Empire's heavy cavalry. Shares numbering with FRA_ARM_01.",
  "add": ["# Généraux de la grosse cavalerie",
          "1=%dère Division de Cuirassiers 'Nansouty'", "2=%dème Division de Cuirassiers 'd'Hautpoul'",
          "3=%dème Division de Cuirassiers 'Kellermann'", "4=%dème Division de Cuirassiers 'Milhaud'",
          "5=%dème Division de Cuirassiers 'Saint-Sulpice'", "6=%dème Division de Cuirassiers 'Caulaincourt'",
          "7=%dème Division de Cuirassiers 'Latour-Maubourg'", "8=%dème Division de Cuirassiers 'Montbrun'",
          "9=%dème Division de Cuirassiers 'Exelmans'", "10=%dème Division de Cuirassiers 'Klein'",
          "11=%dème Division de Cuirassiers 'Walther'", "12=%dème Division de Cuirassiers 'Sahuc'",
          "13=%dème Division de Cuirassiers 'Delort'", "14=%dème Division de Cuirassiers 'Lhéritier'",
          "15=%dème Division de Cuirassiers 'Letort'", "16=%dème Division de Cuirassiers 'Bessières'",
          "# Charges",
          "17=%dème Division de Cuirassiers 'Eylau'", "18=%dème Division de Cuirassiers 'Reichshoffen'",
          "# Cavalerie lourde de la Garde",
          "19=Division de Cavalerie Lourde de la Garde", "20=Division des Grenadiers à Cheval",
          "21=Division des Dragons de l'Impératrice", "22=Division des Carabiniers"] }
```

```json batch
{ "addGroup": true, "group": "GRA_CAV_01", "selector": "Imperial Cavalry Divisions", "addType": "cavalry",
  "fallback": "%dème Division de Cavalerie Légère", "canUse": "has_government = neutrality", "after": "GRA_ARM_01",
  "comment": "Neutral governments only (has_government = neutrality).\nThe Guard's light cavalry and the Empire's light cavalry generals.",
  "add": ["# Cavalerie légère de la Garde",
          "1=Division de Cavalerie Légère de la Garde", "2=Division des Chasseurs à Cheval de la Garde",
          "3=Division des Chevau-Légers Polonais", "4=Division des Lanciers Rouges",
          "5=Division des Mamelouks de la Garde", "6=Division des Éclaireurs de la Garde",
          "7=Division des Gardes d'Honneur", "8=Division de la Gendarmerie d'Élite",
          "# Généraux de la cavalerie légère",
          "9=%dème Division de Cavalerie Légère 'Lasalle'", "10=%dème Division de Cavalerie Légère 'Pajol'",
          "11=%dème Division de Cavalerie Légère 'Colbert'", "12=%dème Division de Cavalerie Légère 'Subervie'",
          "13=%dème Division de Cavalerie Légère 'Jacquinot'", "14=%dème Division de Cavalerie Légère 'Domon'",
          "15=%dème Division de Cavalerie Légère 'Piré'", "16=%dème Division de Cavalerie Légère 'Marulaz'",
          "17=%dème Division de Cavalerie Légère 'Curély'", "18=%dème Division de Cavalerie Légère 'Somosierra'"] }
```

```json batch
{ "addGroup": true, "group": "SEC_EMP_01", "selector": "Second Empire Divisions", "addType": "infantry",
  "fallback": "%dème Division de Voltigeurs de la Garde", "canUse": "has_government = neutrality", "after": "GRA_CAV_01",
  "comment": "Neutral governments only (has_government = neutrality).\nNapoleon III's army of 1852-1870: the Garde Impériale of 1854, the expeditions and the victories of Crimea and Italy.",
  "add": ["# Garde Impériale et expéditions",
          "1=1ère Division d'Infanterie de la Garde", "2=2ème Division d'Infanterie de la Garde",
          "3=Division des Zouaves de la Garde", "4=Division de l'Armée d'Orient",
          "5=Division du Corps Expéditionnaire du Mexique", "6=Division de l'Expédition de Chine",
          "# Victoires (1854-1863)",
          "7=%dème Division de Voltigeurs de la Garde 'Alma'", "8=%dème Division de Voltigeurs de la Garde 'Inkerman'",
          "9=%dème Division de Voltigeurs de la Garde 'Malakoff'", "10=%dème Division de Voltigeurs de la Garde 'Sébastopol'",
          "11=%dème Division de Voltigeurs de la Garde 'Tchernaïa'", "12=%dème Division de Voltigeurs de la Garde 'Kinburn'",
          "13=%dème Division de Voltigeurs de la Garde 'Bomarsund'", "14=%dème Division de Voltigeurs de la Garde 'Magenta'",
          "15=%dème Division de Voltigeurs de la Garde 'Solférino'", "16=%dème Division de Voltigeurs de la Garde 'Palestro'",
          "17=%dème Division de Voltigeurs de la Garde 'Palikao'", "18=%dème Division de Voltigeurs de la Garde 'Camerone'",
          "# Maréchaux et généraux",
          "19=%dème Division de Voltigeurs de la Garde 'Pélissier'", "20=%dème Division de Voltigeurs de la Garde 'Canrobert'",
          "21=%dème Division de Voltigeurs de la Garde 'Bosquet'", "22=%dème Division de Voltigeurs de la Garde 'Niel'",
          "23=%dème Division de Voltigeurs de la Garde 'Forey'", "24=%dème Division de Voltigeurs de la Garde 'Randon'",
          "25=%dème Division de Voltigeurs de la Garde 'Margueritte'"] }
```

```json batch
{ "addGroup": true, "group": "COMMUNE_01", "selector": "Federated Legions", "addType": ["infantry", "militia"],
  "fallback": "%dème Légion Fédérée", "canUse": "has_government = communism", "after": "SEC_EMP_01",
  "comment": "# ===== Paris Commune (1871) =====\n\nCommunist governments only (has_government = communism).\nThe Garde Nationale Fédérée, organised in légions by arrondissement.",
  "add": ["# Corps francs de la Commune",
          "1=%dère Légion Fédérée 'Vengeurs de Flourens'", "2=%dème Légion Fédérée 'Tirailleurs de la Marseillaise'",
          "# Quartiers et forts de 1871",
          "3=%dème Légion Fédérée 'Belleville'", "4=%dème Légion Fédérée 'Ménilmontant'",
          "5=%dème Légion Fédérée 'Montmartre'", "6=%dème Légion Fédérée 'La Villette'",
          "7=%dème Légion Fédérée 'Butte-aux-Cailles'", "8=%dème Légion Fédérée 'Batignolles'",
          "9=%dème Légion Fédérée 'Charonne'", "10=%dème Légion Fédérée 'Buttes-Chaumont'",
          "11=%dème Légion Fédérée 'Fort d'Issy'", "12=%dème Légion Fédérée 'Fort de Vanves'",
          "13=%dème Légion Fédérée 'Fort de Montrouge'", "14=%dème Légion Fédérée 'Fort de Bicêtre'",
          "15=%dème Légion Fédérée 'Fort de Vincennes'",
          "# Mémoire de la Commune",
          "16=%dème Légion Fédérée '18 Mars'", "17=%dème Légion Fédérée 'Semaine Sanglante'",
          "18=%dème Légion Fédérée 'Mur des Fédérés'",
          "# Communes de province (1870-1871)",
          "19=%dème Légion Fédérée 'Commune de Lyon'", "20=%dème Légion Fédérée 'Commune de Marseille'",
          "21=%dème Légion Fédérée 'Commune de Narbonne'", "22=%dème Légion Fédérée 'Commune du Creusot'",
          "23=%dème Légion Fédérée 'Ferré'", "24=%dème Légion Fédérée 'Crémieux'", "25=%dème Légion Fédérée 'Digeon'"] }
```

```json batch
{ "addGroup": true, "group": "COMMUNE_MOT_01", "selector": "Commune Motorized Divisions", "addType": ["motorized", "mechanized"],
  "fallback": "%dème Division Motorisée de la Commune", "canUse": "has_government = communism", "link": "FRA_MOT_01", "after": "COMMUNE_01",
  "comment": "Communist governments only (has_government = communism).\nCommunards of the Internationale and the workers' movement. Shares numbering with FRA_MOT_01.",
  "add": ["# Communards",
          "1=%dère Division Motorisée de la Commune 'Varlin'", "2=%dème Division Motorisée de la Commune 'Frankel'",
          "3=%dème Division Motorisée de la Commune 'Louise Michel'", "4=%dème Division Motorisée de la Commune 'Dmitrieff'",
          "5=%dème Division Motorisée de la Commune 'Blanqui'", "6=%dème Division Motorisée de la Commune 'Eugène Pottier'",
          "7=%dème Division Motorisée de la Commune 'Temps des Cerises'",
          "# Mouvement ouvrier",
          "8=%dème Division Motorisée de la Commune 'Paul Lafargue'", "9=%dème Division Motorisée de la Commune 'Henri Barbusse'",
          "10=%dème Division Motorisée de la Commune 'Vaillant-Couturier'", "11=%dème Division Motorisée de la Commune 'Canuts'",
          "12=%dème Division Motorisée de la Commune 'Croix-Rousse'", "13=%dème Division Motorisée de la Commune 'Fourmies'",
          "14=%dème Division Motorisée de la Commune 'Premier Mai'"] }
```

```json batch
{ "addGroup": true, "group": "COMMUNE_ARM_01", "selector": "Commune Armored Divisions", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "%dème Division Blindée de la Commune", "canUse": "has_government = communism", "link": "FRA_ARM_01", "after": "COMMUNE_MOT_01",
  "comment": "Communist governments only (has_government = communism).\nThe Commune's generals and delegates and its anthems. Shares numbering with FRA_ARM_01.",
  "add": ["# Généraux et délégués de la Commune",
          "1=%dère Division Blindée de la Commune 'Dombrowski'", "2=%dème Division Blindée de la Commune 'Wróblewski'",
          "3=%dème Division Blindée de la Commune 'Eudes'", "4=%dème Division Blindée de la Commune 'Duval'",
          "5=%dème Division Blindée de la Commune 'La Cécilia'", "6=%dème Division Blindée de la Commune 'Delescluze'",
          "7=%dème Division Blindée de la Commune 'Ranvier'", "8=%dème Division Blindée de la Commune 'Malon'",
          "# Chants",
          "9=%dème Division Blindée de la Commune 'Internationale'", "10=%dème Division Blindée de la Commune 'Drapeau Rouge'"] }
```
