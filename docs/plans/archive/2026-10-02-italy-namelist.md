# Italy (ITA) Namelist Plan - 2026-10-02

Status: DONE

File: `common/units/names_divisions/INEX_ITA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
`INEX_ITA_names_divisions.txt` already holds 37 groups (territorial infantry, Blackshirt divisions and legions, RSI, Black Brigades, Royal Army, Communist and five partisan families, Carabinieri, frontier sectors, Arditi, Bersaglieri, Legione Romana and others). This expansion adds six small to medium lists on the same file: Blackshirt specialist militias, Guardia di Finanza formations, colonial battalions, Republican volunteer legions, Red Guards and irredentist legions. The file goes from 37 to 43 groups. No existing group is touched and no vanilla tag is overridden.

## Decisions
- Scope (user answers): the six lists above. Sourcing is a verified core plus extrapolation that follows the army's own naming pattern; every extrapolated or unverified entry is on "Author confirmation". The vanilla colonial stubs (`ITA_COL_03`, `ITA_CAV_04`, `ITA_CAV_05`, `ITA_CAM_01`, `ITA_CAM_02`) stay untouched.
- No plain/named pair: none of the six lists is a nicknamed infantry, motorized, mechanized or armor list, so there are no `link_numbering_with` links.
- Real numerals are written into the names as static text (`V Battaglione d'Assalto CC.NN. 'M'`, `1a Legione MILMART 'Venezia'`), the way the existing file already writes `1a Divisione Alpina 'Taurinense'`. This keeps a historical numeral correct whatever order a player builds the divisions in. Fallbacks use `%da` (feminine) or `%s` (Roman numerals, for battalions and sectors) as the existing file does.
- Gating: `ITA_MIL_01` and `ITA_IRR_01` fascism; `ITA_REP_01` democratic; `ITA_RED_01` communism; `ITA_GDF_01` and `ITA_COL_04` any government (`always = yes`). Government-based only, no focus locks, no opposing traditions in one list.
- Red Guards stays a separate list although the dossier called it thin: it reaches 19 entries, above the 15-entry line, and the user asked for it. Its names that are only honorifics are on "Author confirmation".
- Excluded as overlap with existing lists: every territorial legion epithet already in `ITA_LEG_01`, Randaccio, San Marco, Battisti, Sauro, Venezia Giulia, Damiano Chiesa, the 'Arditi del Popolo' / 'Guardie Rosse' / 'Ordine Nuovo' names already in `ITA_COM_01`, Matteotti and Garibaldi partisan names, the Carabinieri legions, the 'M' armored division (already `1a Divisione Corazzata CC.NN. 'M'` in `ITA_ARM_01`), and the colonial divisions and irregular bands.
- Dropped for lack of a source: Milizia Radiotelegrafisti, a GIL battalion list, a 'Giovani Fascisti' formation (already an infantry division name), Ticino, the Lancieri 'Masina', and the Libyan paratrooper battalion.
- Selectors are at most 28 characters and carry no demonym.

## Vanilla findings (`-InspectVanilla ITA`)
| Tag | Vanilla state | Action |
|---|---|---|
| `ITA_MIL_01`, `ITA_GDF_01`, `ITA_REP_01`, `ITA_RED_01`, `ITA_IRR_01` | not in vanilla, unused anywhere in the mod | new groups |
| `ITA_COL_04` | vanilla stops at `ITA_COL_03`; INEX has `ITA_COL_01`-`03` | new group |
| `ITA_COL_03`, `ITA_CAV_04`, `ITA_CAV_05`, `ITA_CAM_01`, `ITA_CAM_02` | empty vanilla stubs referenced by focuses (`division_names_group`) | left alone by decision |

## Group suite
| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `ITA_MIL_01` | Blackshirt Special Militias | militia | has_government = fascism | - | `%da Legione Speciale CC.NN.` | 54 |
| `ITA_GDF_01` | Finance Guard Formations | infantry | always = yes | - | `%s Battaglione Mobilitato GdF` | 26 |
| `ITA_COL_04` | Colonial Battalions | infantry | always = yes | - | `%s Battaglione Coloniale` | 36 |
| `ITA_REP_01` | Republican Volunteer Legions | infantry, militia | has_government = democratic | - | `%da Legione Repubblicana` | 27 |
| `ITA_RED_01` | Red Guards | militia, infantry | has_government = communism | - | `%da Guardia Rossa` | 19 |
| `ITA_IRR_01` | Irredentist Legions | infantry | has_government = fascism | - | `%da Legione Irredentista` | 35 |

Totals: 6 groups, 197 names (the file goes from 37 to 43 groups).

## Research record
- Dispatch 1: `inex-historical-researcher`, 31 web calls (it.wikipedia MVSN, Battaglioni M, MILMART, Regio corpo truppe coloniali d'Eritrea, Forze armate fiumane, Milizia Fascista Albanese, Repubblica Romana 1849, gdf.gov.it museum, Parma barricades). Five fetches failed (wikiwand, regioesercito.it, libero.it, it.wikipedia Somalia, one PDF).
- Unverified after research: MILMART legions 10-13, all numbering of the MVSN branch units, GdF legion numbers apart from 3a Milano and 11a Salentina, Libyan and Somali battalion numbers, the Italian wording of several Risorgimento unit names, Malta/Nice/Tunisia volunteer units. All of these are either extrapolated by pattern or left out, and listed below.

## Author confirmation
**ITA_MIL_01**: `Gruppo Battaglioni M 'Tagliamento'`, `'Montebello'`, `'Leonessa'`, `'Valle Scrivia'` (groups verified in English; Italian wording extrapolated); the `Battaglione d'Assalto CC.NN. 'M'` wording for the 22 verified numerals; `Gruppo MILMART` wording for the two group commands and four autonomous groups; the ten specialist-branch names (organisations verified, no unit names exist) ; `1° and 2° Gruppo Battaglioni CC.NN. d'Africa` (existence verified, wording extrapolated).
**ITA_GDF_01**: the place epithets on battalions I ('Cefalonia'), III ('Albania'), VI and XV ('Montenegro'); all ten theatre battalions `Battaglione Mobilitato GdF '<theatre>'`; the ten city legions `Legione Territoriale GdF di <city>` (no numbers verified).
**ITA_COL_04**: `I`-`VI Battaglione Libico` numbering; `I`-`III Battaglione Arabo-Somalo` numbering; the three `Gruppo Zaptiè` and two `Reparto PAI` entries.
**ITA_REP_01**: `Legione Italiana di Montevideo`, `Legione dei Mille`, `Legione 'Medici'`, `Battaglione 'Bandiera e Moro'`, `Battaglione Universitario 'Curtatone e Montanara'` (documented but not fetched); `Legione Garibaldina 'Ricciotti'` and `Legione Italiana 'Pacciardi'` epithets; entries 17-27 (martyr and Giovine Italia names, `Repubblicana 'Mazzini'`, `'Daniele Manin'`, `'Carlo Armellini'`) are alt-history extrapolation.
**ITA_RED_01**: `Formazioni di Difesa Proletaria` (Italian form of the English-sourced name); the six `Sezione Arditi del Popolo di <city>` entries (cities verified, section naming extrapolated); the ten honoree names (Picelli, Secondari, Di Vittorio, Togliatti, Terracini, Longo, Barontini, 'Oltretorrente', 'Spartaco', 'Mondine') as unit names.
**ITA_IRR_01**: `Legione 'Fabio Filzi'`, `'Guglielmo Oberdan'`, `'Nicolò Tommaseo'` (named after Fiume company honorees, used as legions); `Battaglione Alpini Legionari Fiumani` wording; MFA legions 1a-4a and 12a Forestale wording; `Legione Corsa`, `Gruppo Corso 'Giovacchini'`, `Legione Maltese`, `Legione 'Nizza'`, `Legione Tunisina`, `Legione 'Zara'`, `Legione 'Spalato'` (extrapolated).

## Kept on judgment
- `ITA_RED_01` (19) and `ITA_GDF_01` (26, mostly extrapolated) may carry `LOW_DEPTH` or similar thin-list flags: small specialist lists are the stated goal and padding is worse.
- File-level `IDENTITY_REPEAT` and `TODO_COMMENT` flags already exist on the file before this batch and are not caused by it.
- Names that repeat an epithet used in another group (`Tagliamento`, `Sebenico`, `Rismondo`) differ as full names; no `DUPLICATE_NAME` is expected.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames ITA -Batch docs\superpowers\plans\2026-10-02-italy-namelist.md`. Expect one green line per group (six), no `[ERROR]`, and 43 groups in the file.
- [x] 2. `README.md`: no change. The Italy row (`| ITA | Italy | INEX_ITA_names_divisions.txt |`) lists tag and file only.
- [x] 3. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: replace the Italy row in the cross-reference table and the three bullets of `[b]Italy[/b]` with the text under "Docs payload". The description stays under 17,000 characters (about +330).
- [x] 4. Wiki: apply the `wiki/Italy.md` edits and the `wiki/Home.md` count change under "Docs payload"; `wiki/_Sidebar.md` is unchanged. Then `powershell -File .\build.ps1 -SyncWiki ITA`. Expect no stale or missing tags.
- [x] 5. `powershell -File .\build.ps1 -Check ITA`. Expect `Check passed`; remaining flags must match "Kept on judgment".
- [x] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 7. After the user confirms: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document ITA specialist, colonial and volunteer namelists"`.

## Docs payload
### README.md row
No change.

### Workshop cross-reference row
Replace line 74 (the row starting `| \`INEX_ITA_names_divisions.txt\``) with:

```
| `INEX_ITA_names_divisions.txt` | Italy | `ITA` | Included (Historical numbering, Blackshirts & specialist militias, RSI, Black Brigades, Royal Army, Republican volunteers, Red Guards, Party-gated Partisans, Bersaglieri, Carabinieri, Guardia di Finanza, Frontier Guard, Colonial divisions & battalions, Fiume & Albanian irredentists, Legione Romana) |
```

### Workshop `[b]Italy[/b]` block
Replace the three bullets under `[b]Italy[/b]` (keep the heading line) with:

```
- Regio Esercito divisions on their real numbers, shared across infantry, motorized and armored lists ([i]9a Divisione 'Pasubio'[/i], [i]132a Divisione Corazzata 'Ariete'[/i])
- Government-gated lists: Blackshirt legions and specialist militias ([i]XLII Battaglione d'Assalto CC.NN. 'M'[/i]), the Social Republic and Black Brigades ([i]8a Brigata Nera 'Aldo Resega'[/i]), Royal Army ([i]Gruppo di Combattimento 'Cremona'[/i]), Republican volunteer legions (democratic), Communist Red Guards, and Garibaldi, GL, Matteotti, Autonome and Fiamme Verdi partisans
- Bersaglieri, Arditi, Carabinieri, Guardia di Finanza, Frontier Guard sectors ([i]XII Settore di Copertura 'Valtellina'[/i]), Eritrean and Libyan colonial battalions ([i]IV Battaglione Eritreo 'Toselli'[/i]), and fascist-only Fiume and Albanian irredentist legions with Legione Romana
```

### wiki/Italy.md
1. Replace the first paragraph under `## Historical Overview` (line 9) with:

```
The Regio Esercito named its divisions after cities, regions, rivers and battles, and INEX keeps those names on their real division numbers. Motorized, mechanized, armored and paratrooper lists share numbering with the infantry, so *9a Divisione 'Pasubio'* is either infantry or autotrasportabile, never both. Separate lists cover the colonial troops of Libya and East Africa (divisions, bands and battalions), the cavalry, the Alpini, Bersaglieri and Arditi, the Frontier Guard, Carabinieri and Guardia di Finanza, and the 1943–45 Resistance.
```

2. Replace the second paragraph (line 11) with:

```
Ideology-gated lists: the MVSN Blackshirt divisions, legions and specialist militias, the Social Republic's army, the Black Brigades and the Fiume and Albanian irredentist legions (fascism), a Royal Army list built on the 1943–45 Co-Belligerent Army (neutrality/democratic), Republican volunteer legions drawn from the Risorgimento (democratic), a Communist list with a Red Guards suite, and the partisan formations gated by party tradition. Legione Romana is fascist-only and never picked by the AI.
```

3. Insert after the `ITA_ROM_01` table row (line 55):

```
| `ITA_MIL_01` | Blackshirt Special Militias | militia | `%da Legione Speciale CC.NN.` |
| `ITA_GDF_01` | Finance Guard Formations | infantry | `%s Battaglione Mobilitato GdF` |
| `ITA_COL_04` | Colonial Battalions | infantry | `%s Battaglione Coloniale` |
| `ITA_REP_01` | Republican Volunteer Legions | infantry, militia | `%da Legione Repubblicana` |
| `ITA_RED_01` | Red Guards | militia, infantry | `%da Guardia Rossa` |
| `ITA_IRR_01` | Irredentist Legions | infantry | `%da Legione Irredentista` |
```

4. Append at the end of the file, after the `ITA_ROM_01` section:

```

### `ITA_MIL_01` — Blackshirt Special Militias
Fascism only. The 22 'M' assault battalions of 1941–43 on their Roman numerals (*XLII*, *XLIII*, *L* and *LX* were the Malta landing group), the *Gruppi Battaglioni M* of the Russian front, the ten MILMART coastal-artillery legions by naval base (*1a Legione MILMART 'Venezia'*, *14a 'Reggio Calabria'*) with their autonomous groups, and the specialist militias (*Milizia Ferroviaria*, *Milizia Portuaria*, *Moschettieri del Duce*).

### `ITA_GDF_01` — Finance Guard Formations
The Guardia di Finanza as a fighting corps: the mobilised battalions of 1940–43 (*I Battaglione Mobilitato GdF 'Cefalonia'*, *VI 'Montenegro'*), battalions named for their theatres, and the territorial legions (*3a Legione Territoriale GdF 'Milano'*, *11a 'Salentina'*). Frontier sectors stay with `ITA_GAF_01`.

### `ITA_COL_04` — Colonial Battalions
The Regio Corpo Truppe Coloniali's Eritrean battalions named for their first commanders (*I Battaglione Eritreo 'Turitto'*, *IV 'Toselli'*, *III 'Galliano'*, *II 'Hidalgo'*), the Libyan and Arabo-Somali battalions, the Saharan groupings (*Raggruppamento Sahariano 'Maletti'*) and the colonial police (*Gruppo Zaptiè d'Eritrea*, *Reparto PAI*).

### `ITA_REP_01` — Republican Volunteer Legions
Democratic only. The volunteer tradition of Mazzini and Garibaldi: the Roman Republic of 1849 (*Legione Italiana 'Garibaldi'*, *Bersaglieri Lombardi 'Manara'*), the *Legione Garibaldina 'Argonne'* of 1914–15, Ricciotti Garibaldi's 1897 legion, and alt-history Republican divisions named for Mazzini, Saffi and Manin. It gives a democratic Italy a republican tradition apart from the House of Savoy names of `ITA_MONCH_01`.

### `ITA_RED_01` — Red Guards
Communism only. The *Centuria 'Gastone Sozzi'* and *Colonna 'Guido Picelli'* of the Spanish war, the *Formazioni di Difesa Proletaria* of the 1922 Parma barricades, Arditi del Popolo sections by city, and Red Guard formations named for labour-movement figures (*'Giuseppe Di Vittorio'*, *'Ilio Barontini'*, *'Oltretorrente'*).

### `ITA_IRR_01` — Irredentist Legions
Fascism only. D'Annunzio's Fiume legions of 1919–20 (*Legione 'Fiumana'*, *Legione del Carnaro*, *XII Reparto d'Assalto 'Irriducibili'*), the four legions of the Milizia Fascista Albanese, the Corsican battalion raised in Sardinia in 1942, and alt-history legions for Malta, Nice, Tunisia and Dalmatia.
```

### wiki/Home.md row
In the Italy row change the group count `37` to `43`: `| [Italy](Italy) | \`ITA\` | 43 | \`INEX_ITA_names_divisions.txt\` |`

### wiki/_Sidebar.md line
No change.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Proofreader (`inex-code-reviewer`, 1 web call) read all 197 names. Findings and handling:
- `Battaglione di Alpini Legionari Fiumani` breaks the neighbouring pattern: fixed in the batch to `Battaglione Alpini Legionari Fiumani`.
- `Milizia della Strada` against the form `Milizia Stradale`: kept. The researcher's source (it.wikipedia MVSN) gives `Milizia della Strada` as the official name of the branch.
- Epithet `'Montenegro'` on both VI and XV Battaglione Mobilitato GdF: kept, both battalions are documented as serving in Montenegro and the full names differ by numeral.
- Unsure items kept as researched, each from the dossier's fetched sources: `Legione 'Bianca-San Michele'` and `XII Reparto d'Assalto 'Irriducibili'` (it.wikipedia "Forze armate fiumane"), the Eritrean battalion epithets and numerals (it.wikipedia "Regio corpo truppe coloniali d'Eritrea"), and `Raggruppamento Sahariano 'Mannerini'` (it.wikipedia Libia). The implementer does not re-judge these.

## Outcome
2026-10-02. `-Check ITA`: `Validate: OK`, `373 Passed, 0 Failed`, `GROUPS=43 AUTHORED=809/909 FLAGS=24`, diff vs HEAD `6 group(s) changed, +197 -0 name(s)`, `Check passed`. The 24 remaining flags (LOW_DEPTH x16, STALE_COMMENT x2, PLACEHOLDER_ENTRIES x2, VANILLA_COPY, TODO_COMMENT, POLITICAL_ENTRY, IDENTITY_REPEAT) all sit on groups that existed before this batch; none of the six new groups carries a flag.

Deviation: the first `-Check` flagged `SELECTOR_LONG` on `ITA_GDF_01`, because "Guardia di Finanza Formations" is 29 characters against the 28 limit (a planning miscount). On the user's decision the selector became "Finance Guard Formations" via `-EditNames ITA -Group ITA_GDF_01 -Selector "Finance Guard Formations"`, and the `ITA_GDF_01` wiki row and heading, this plan's Group suite row, wiki payload and batch block were updated to match. The Guardia di Finanza name stays in the group's names and in the docs prose.

## Edit batch
Applied by `build.ps1 -EditNames ITA -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{
  "addGroup": true,
  "group": "ITA_MIL_01",
  "selector": "Blackshirt Special Militias",
  "addType": ["militia"],
  "fallback": "%da Legione Speciale CC.NN.",
  "canUse": "has_government = fascism",
  "comment": "# ===== Specialist, police and volunteer formations =====\n\nBlackshirt specialist militias, fascism only: the 'M' assault battalions, MILMART coastal artillery and the MVSN special branches.",
  "add": [
    "# 'M' assault battalions (1941-43)",
    "1=V Battaglione d'Assalto CC.NN. 'M'",
    "2=VI Battaglione d'Assalto CC.NN. 'M'",
    "3=VIII Battaglione d'Assalto CC.NN. 'M'",
    "4=X Battaglione d'Assalto CC.NN. 'M'",
    "5=XII Battaglione d'Assalto CC.NN. 'M'",
    "6=XIV Battaglione d'Assalto CC.NN. 'M'",
    "7=XV Battaglione d'Assalto CC.NN. 'M'",
    "8=XVI Battaglione d'Assalto CC.NN. 'M'",
    "9=XXIX Battaglione d'Assalto CC.NN. 'M'",
    "10=XXX Battaglione d'Assalto CC.NN. 'M'",
    "11=XXXIV Battaglione d'Assalto CC.NN. 'M'",
    "12=XXXVIII Battaglione d'Assalto CC.NN. 'M'",
    "13=XLI Battaglione d'Assalto CC.NN. 'M'",
    "14=XLII Battaglione d'Assalto CC.NN. 'M'",
    "15=XLIII Battaglione d'Assalto CC.NN. 'M'",
    "16=L Battaglione d'Assalto CC.NN. 'M'",
    "17=LX Battaglione d'Assalto CC.NN. 'M'",
    "18=LXIII Battaglione d'Assalto CC.NN. 'M'",
    "19=LXXI Battaglione d'Assalto CC.NN. 'M'",
    "20=LXXIX Battaglione d'Assalto CC.NN. 'M'",
    "21=LXXXI Battaglione d'Assalto CC.NN. 'M'",
    "22=LXXXV Battaglione d'Assalto CC.NN. 'M'",
    "# Battalion groups of the Russian front",
    "23=Gruppo Battaglioni M 'Tagliamento'",
    "24=Gruppo Battaglioni M 'Montebello'",
    "25=Gruppo Battaglioni M 'Leonessa'",
    "26=Gruppo Battaglioni M 'Valle Scrivia'",
    "# MILMART, Milizia Marittima di Artiglieria",
    "27=1a Legione MILMART 'Venezia'",
    "28=2a Legione MILMART 'La Spezia'",
    "29=3a Legione MILMART 'La Maddalena'",
    "30=4a Legione MILMART 'Cagliari'",
    "31=5a Legione MILMART 'Taranto'",
    "32=6a Legione MILMART 'Messina'",
    "33=7a Legione MILMART 'Augusta'",
    "34=8a Legione MILMART 'Trapani'",
    "35=9a Legione MILMART 'Pantelleria'",
    "36=14a Legione MILMART 'Reggio Calabria'",
    "37=1° Gruppo MILMART 'Messina'",
    "38=2° Gruppo MILMART 'La Spezia'",
    "39=Gruppo Autonomo MILMART 'Siracusa'",
    "40=Gruppo Autonomo MILMART 'Tripoli'",
    "41=Gruppo Autonomo MILMART 'Asmara'",
    "42=Gruppo Autonomo MILMART 'Mogadiscio'",
    "# Special branches of the MVSN",
    "43=Milizia Ferroviaria",
    "44=Milizia Forestale",
    "45=Milizia Portuaria",
    "46=Milizia Postelegrafonica",
    "47=Milizia della Strada",
    "48=Moschettieri del Duce",
    "49=Milizia Confinaria",
    "50=Milizia Universitaria",
    "51=Milizia Coloniale",
    "52=Milizia DICAT",
    "# Blackshirts in East Africa (1935)",
    "53=1° Gruppo Battaglioni CC.NN. d'Africa",
    "54=2° Gruppo Battaglioni CC.NN. d'Africa"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ITA_GDF_01",
  "selector": "Finance Guard Formations",
  "addType": ["infantry"],
  "fallback": "%s Battaglione Mobilitato GdF",
  "canUse": "always = yes",
  "comment": "# Guardia di Finanza as a fighting corps: the mobilised battalions of 1940-43 and the territorial legions.",
  "add": [
    "# Mobilised battalions (battaglioni mobilitati)",
    "1=I Battaglione Mobilitato GdF 'Cefalonia'",
    "2=III Battaglione Mobilitato GdF 'Albania'",
    "3=VI Battaglione Mobilitato GdF 'Montenegro'",
    "4=XV Battaglione Mobilitato GdF 'Montenegro'",
    "# Battalions by theatre of deployment",
    "5=Battaglione Mobilitato GdF 'Francia'",
    "6=Battaglione Mobilitato GdF 'Grecia'",
    "7=Battaglione Mobilitato GdF 'Slovenia'",
    "8=Battaglione Mobilitato GdF 'Croazia'",
    "9=Battaglione Mobilitato GdF 'Dalmazia'",
    "10=Battaglione Mobilitato GdF 'Erzegovina'",
    "11=Battaglione Mobilitato GdF 'Africa Settentrionale'",
    "12=Battaglione Mobilitato GdF 'Somalia'",
    "13=Battaglione Mobilitato GdF 'Etiopia'",
    "14=Battaglione Mobilitato GdF 'Eritrea'",
    "# Territorial legions",
    "15=3a Legione Territoriale GdF 'Milano'",
    "16=11a Legione Territoriale GdF 'Salentina'",
    "17=Legione Territoriale GdF di Torino",
    "18=Legione Territoriale GdF di Genova",
    "19=Legione Territoriale GdF di Venezia",
    "20=Legione Territoriale GdF di Trieste",
    "21=Legione Territoriale GdF di Bologna",
    "22=Legione Territoriale GdF di Firenze",
    "23=Legione Territoriale GdF di Roma",
    "24=Legione Territoriale GdF di Napoli",
    "25=Legione Territoriale GdF di Palermo",
    "26=Legione Territoriale GdF di Cagliari"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ITA_COL_04",
  "selector": "Colonial Battalions",
  "addType": ["infantry"],
  "fallback": "%s Battaglione Coloniale",
  "canUse": "always = yes",
  "comment": "# Regio Corpo Truppe Coloniali battalions, Saharan groupings and colonial police. Complements the colonial divisions in ITA_COL_01.",
  "add": [
    "# Eritrean battalions",
    "1=I Battaglione Eritreo 'Turitto'",
    "2=II Battaglione Eritreo 'Hidalgo'",
    "3=III Battaglione Eritreo 'Galliano'",
    "4=IV Battaglione Eritreo 'Toselli'",
    "5=V Battaglione Eritreo 'Ameglio'",
    "6=VI Battaglione Eritreo 'Cossu'",
    "7=VII Battaglione Eritreo 'Prestinari'",
    "8=VIII Battaglione Eritreo 'Gamerra'",
    "9=IX Battaglione Eritreo 'Guastoni'",
    "10=XI Battaglione Eritreo",
    "11=XII Battaglione Eritreo",
    "12=XIII Battaglione Eritreo 'Roma'",
    "13=XV Battaglione Eritreo 'Billia'",
    "14=XVI Battaglione Eritreo 'Adi Caieh'",
    "15=XVII Battaglione Eritreo 'Nebri'",
    "16=XIX Battaglione Eritreo 'Cafaro'",
    "17=XX Battaglione Eritreo",
    "18=XXII Battaglione Eritreo",
    "19=XXIV Battaglione Eritreo",
    "# Libyan battalions",
    "20=I Battaglione Libico",
    "21=II Battaglione Libico",
    "22=III Battaglione Libico",
    "23=IV Battaglione Libico",
    "24=V Battaglione Libico",
    "25=VI Battaglione Libico",
    "# Arab-Somali battalions",
    "26=I Battaglione Arabo-Somalo",
    "27=II Battaglione Arabo-Somalo",
    "28=III Battaglione Arabo-Somalo",
    "# Saharan groupings",
    "29=Raggruppamento Sahariano della Cirenaica",
    "30=Raggruppamento Sahariano 'Maletti'",
    "31=Raggruppamento Sahariano 'Mannerini'",
    "# Colonial police",
    "32=Gruppo Zaptiè d'Eritrea",
    "33=Gruppo Zaptiè di Libia",
    "34=Gruppo Zaptiè di Somalia",
    "35=Reparto PAI 'Africa Orientale'",
    "36=Reparto PAI 'Libia'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ITA_REP_01",
  "selector": "Republican Volunteer Legions",
  "addType": ["infantry", "militia"],
  "fallback": "%da Legione Repubblicana",
  "canUse": "has_government = democratic",
  "comment": "# Republican volunteer tradition of Mazzini and Garibaldi, democratic only. A republican counterpart to the Savoyard names of ITA_MONCH_01.",
  "add": [
    "# Risorgimento volunteer corps",
    "1=Legione Italiana di Montevideo",
    "2=Legione dei Mille",
    "3=Legione Italiana 'Garibaldi'",
    "4=Legione Romana",
    "5=Legione 'Medici'",
    "6=Battaglione Bersaglieri Lombardi 'Manara'",
    "7=Battaglione Universitario Romano",
    "8=Battaglione Universitario 'Curtatone e Montanara'",
    "9=Battaglione 'Bandiera e Moro'",
    "10=Reggimento dell'Unione",
    "11=1° Reggimento Leggero",
    "12=2° Reggimento Leggero",
    "13=Corpo d'Operazione 'Durando'",
    "# Volunteer legions after unification",
    "14=Legione Garibaldina 'Argonne'",
    "15=Legione Garibaldina 'Ricciotti'",
    "16=Legione Italiana 'Pacciardi'",
    "# Republican martyrs and Giovine Italia",
    "17=Legione 'Fratelli Bandiera'",
    "18=Brigata 'Carlo Pisacane'",
    "19=Legione 'Goffredo Mameli'",
    "20=Brigata 'Ciro Menotti'",
    "21=Brigata 'Carlo Cattaneo'",
    "22=%da Legione Repubblicana 'Mazzini'",
    "23=%da Divisione Repubblicana 'Mazzini'",
    "24=%da Brigata Repubblicana 'Aurelio Saffi'",
    "25=%da Divisione 'Daniele Manin'",
    "26=%da Divisione 'Giovine Italia'",
    "27=%da Brigata 'Carlo Armellini'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ITA_RED_01",
  "selector": "Red Guards",
  "addType": ["militia", "infantry"],
  "fallback": "%da Guardia Rossa",
  "canUse": "has_government = communism",
  "comment": "# Proletarian militias of the Italian left, communism only. Complements ITA_COM_01 and the Garibaldi brigades.",
  "add": [
    "# Spanish war and proletarian defence",
    "1=Centuria 'Gastone Sozzi'",
    "2=Colonna 'Guido Picelli'",
    "3=Formazioni di Difesa Proletaria",
    "# Arditi del Popolo sections",
    "4=Sezione Arditi del Popolo di Roma",
    "5=Sezione Arditi del Popolo di Civitavecchia",
    "6=Sezione Arditi del Popolo di Pisa",
    "7=Sezione Arditi del Popolo di Parma",
    "8=Sezione Arditi del Popolo di Sarzana",
    "9=Sezione Arditi del Popolo di Torino",
    "# Red Guard formations named for labour-movement figures",
    "10=%da Guardia Rossa 'Guido Picelli'",
    "11=%da Guardia Rossa 'Argo Secondari'",
    "12=%da Guardia Rossa 'Giuseppe Di Vittorio'",
    "13=%da Guardia Rossa 'Palmiro Togliatti'",
    "14=%da Guardia Rossa 'Umberto Terracini'",
    "15=%da Guardia Rossa 'Luigi Longo'",
    "16=%da Guardia Rossa 'Ilio Barontini'",
    "17=%da Guardia Rossa 'Oltretorrente'",
    "18=%da Guardia Rossa 'Spartaco'",
    "19=%da Guardia Rossa 'Mondine'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ITA_IRR_01",
  "selector": "Irredentist Legions",
  "addType": ["infantry"],
  "fallback": "%da Legione Irredentista",
  "canUse": "has_government = fascism",
  "comment": "# Irredentist and expansionist volunteer legions, fascism only: Fiume 1919-20, the Albanian Fascist Militia and alt-history overseas legions.",
  "add": [
    "# Fiume legions (Reggenza del Carnaro, 1919-20)",
    "1=Legione 'Fiumana'",
    "2=Legione 'Volontari Fiumani'",
    "3=Legione 'Bianca-San Michele'",
    "4=Legione 'Dalmata'",
    "5=Legione 'Trentina'",
    "6=Legione 'Falzè di Piave'",
    "7=Legione 'Sernaglia'",
    "8=Legione di Ronchi",
    "9=Legione Bersaglieri di Fiume",
    "10=Legione del Carnaro",
    "# Fiume battalions and assault units",
    "11=Battaglione Volontari 'Francesco Rismondo'",
    "12=Battaglione Volontari 'Sebenico'",
    "13=Battaglione Volontari Dalmati",
    "14=Battaglione Marina 'Luigi Rizzo'",
    "15=Battaglione Alpini Legionari Fiumani",
    "16=1° Battaglione Fiumano",
    "17=2° Battaglione Fiumano",
    "18=XII Reparto d'Assalto 'Irriducibili'",
    "19=Compagnia Arditi 'La Disperata'",
    "# Irredentist martyrs",
    "20=Legione 'Fabio Filzi'",
    "21=Legione 'Guglielmo Oberdan'",
    "22=Legione 'Nicolò Tommaseo'",
    "# Albanian Fascist Militia (1939-43)",
    "23=1a Legione MFA 'Tirana'",
    "24=2a Legione MFA 'Coriza'",
    "25=3a Legione MFA 'Valona'",
    "26=4a Legione MFA 'Scutari'",
    "27=12a Legione Forestale MFA",
    "# Alt-history overseas and Adriatic legions",
    "28=Battaglione Corso CC.NN.",
    "29=Legione Corsa",
    "30=Gruppo Corso 'Giovacchini'",
    "31=Legione Maltese",
    "32=Legione 'Nizza'",
    "33=Legione Tunisina",
    "34=Legione 'Zara'",
    "35=Legione 'Spalato'"
  ]
}
```
