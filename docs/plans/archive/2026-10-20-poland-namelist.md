# Poland (POL) Namelist Plan - 2026-10-20

Status: DONE

File: `common/units/names_divisions/zz_INEX_POL_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Expansion of the existing INEX Poland file (34 groups after the 2026-10-20 audit, `docs/superpowers/plans/2026-10-20-poland-audit.md`, DONE). This plan adds five new groups for gameplay roles the file does not cover: volunteer and expeditionary divisions (with a communist Dąbrowszczacy variant), fortress and coastal-defence garrisons, a monarchist Royal Guard, and insurgent militia from the Greater Poland and Silesian uprisings. No existing group changes.

## Decisions
- 2026-10-20, user: plan suggestions 1 (volunteers), 2 (garrisons), 5 (Royal Guard), 7 (insurgents); gameplay-oriented, so plausible extrapolation is allowed where history is thin. Every extrapolated name is listed under "Author confirmation".
- 2026-10-20, user policy answers:
  - Royal Guard gated `OR = { has_government = neutrality has_government = fascism }`: vanilla's kingdom (`POL_KINGDOM`, neutrality) and the fascist Russian-throne branch (`POL_KINGDOM_RUS_fascism`). Poland starts as neutrality, so the list is selectable from 1936; a gate cannot test a cosmetic tag ([NAM-003]).
  - Broad division types: volunteers infantry, cavalry, motorized; garrisons infantry; Royal Guard infantry, cavalry, light/medium/heavy/modern armor; insurgents militia, infantry.
  - Depth 15-25 per group: verified names first, then plausible extrapolations, then the fallback.
  - Insurgents ungated (`always = yes`): national uprisings, not party units.
- Dąbrowszczacy: a separate group gated `has_government = communism` (user's request: "a communist Dąbrowszczacy variant").
- New tags (none used anywhere in the mod, checked 2026-10-20): `POL_VOL_01`, `POL_VOL_02`, `POL_FORT_01`, `POL_GUA_01`, `POL_POW_01`. No group links its numbering to another: each is its own series.
- Orthography as the rest of the file: Arabic numeral without a dot (`1 Dywizja ...`), Polish quotes „…”, `im.` for patrons.
- Placement: each group goes at the end of the file (`addGroup` without `"after"`), in the order of the batch, under one section banner in the first group's comment.

## Vanilla findings (`-InspectVanilla POL`)
| Vanilla | State | Action |
|---|---|---|
| 12 vanilla groups (`POL_INF_01`, `POL_INF_RESERVE_01`, `POL_CAV_01`, `POL_CAV_DIVISION_01`, `POL_MOT_01`, `POL_MEC_01`, `POL_ARM_01`, `POL_ARM_BRIGADE_01`, `POL_PAR_01`, `POL_MAR_01`, `POL_MNT_01`, `POL_GAR_01`) | already overridden by the INEX file; scripted references only to `POL_INF_01`, `POL_MNT_01`, `POL_CAV_01` | none: this plan reuses no vanilla tag |
| focus `POL_kings_guard` | adds idea `POL_royal_guard` and a template "Oddział Gwardii Królewskiej" on `division_names_group = POL_INF_01` | none: a focus template keeps its scripted group; players can switch it to `POL_GUA_01` |

## Group suite
Totals: 5 new groups, 113 names; the file goes from 34 groups / 456 names to 39 / 569.

| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `POL_VOL_01` | Volunteer Divisions | infantry, cavalry, motorized | always | none | `%d Dywizja Ochotnicza` | 25 |
| `POL_VOL_02` | International Brigades | infantry, cavalry, motorized | `has_government = communism` | none | `%d Brygada Międzynarodowa` | 18 |
| `POL_FORT_01` | Fortress Garrisons | infantry | always | none | `%d Batalion Forteczny` | 22 |
| `POL_GUA_01` | Royal Guard Divisions | infantry, cavalry, light/medium/heavy/modern armor | `OR = { has_government = neutrality has_government = fascism }` | none | `%d Dywizja Gwardii Królewskiej` | 23 |
| `POL_POW_01` | Uprising Regiments | militia, infantry | always | none | `%d Pułk Powstańczy` | 25 |

Keys: a name that carries a number sits on that key; unnumbered identities sit on 101+, so the fallback from 1 upward never repeats a written number (key 112 "1 Dywizja Ułanów" and keys 101-103 "1-3 Dywizja Strzelców Wielkopolskich" carry a number of another unit type than the fallback, so no text repeats).

## Research record
- `inex-historical-researcher`, 36 web calls (8 lost to 404 pages), dossier `scratch/pol_dossier.md` (raw input, not needed again). Sources: pl.wikipedia (Armia Polska we Francji, I Korpus Polski w Rosji, Armia Ochotnicza (II RP), Legiony Polskie, Rejon Umocniony Hel, Obszar Warowny „Śląsk”, Armia Wielkopolska, III powstanie śląskie, units named after Bolesław Chrobry), en.wikipedia (XIII International Brigade, Royal Guards of the Commonwealth).
- Verified: 1-7 Dywizja Strzelców Polskich (5 DSP called Dywizja Syberyjska); Dywizja Ochotnicza and Dywizja Instrukcyjna; I-III Brygada Legionów (II „Karpacka”), Polski Korpus Posiłkowy, Legion Wschodni, Legion Zachodni, Bajończycy; 1 Dywizja Ułanów (I Korpus w Rosji); 1 Pułk Ułanów Legionów; 1 Pułk Czołgów (France); Armia Ochotnicza regiments 201, 202, 205. XIII Brygada im. Jarosława Dąbrowskiego, 150 Brygada, Batalion im. J. Dąbrowskiego, Batalion Palafox, the Botwin, Szewczenko and Waryński companies. RU Hel, Ośrodek Oporu Jastarnia, OW „Śląsk”, Odcinek „Mikołów”, Grupy Bojowe „Wesoła”/„Brzeziny”/„Wirek”, OU Wizna, Pododcinek „Giełczyn”, Batalion Forteczny KOP „Sarny”, Dowództwo Obrony Warszawy. Gwardia Piesza Koronna, Regiment Gwardii Konnej Koronnej; 17, 20, 27 Pułk Ułanów and 81 Pułk Strzelców with royal patrons; AK 1 Pułk Pancerny im. Króla Bolesława Chrobrego. 1-3 Pułk and 1-3 Dywizja Strzelców Wielkopolskich, Armia and Front Wielkopolski, Grupa „Leszno”, Toruński and Kaszubski Pułk Strzelców, I Brygada Jazdy Wielkopolskiej; 1921 groups „Wschód”, „Południe”, „Północ”, „Środek”, Samodzielny Oddział Szturmowy, Grupa Destrukcyjna Wawelberga, POW Górnego Śląska.
- Unverified (left out): Pozycja Mławska, Straż Ludowa, Kompania Poznańska, Gwardia Konna Litewska, the 1815-30 Kingdom guard regiments, Batalion Forteczny „Małyńsk”, "Brygada Fortyfikacyjna".
- Vanilla template name "Oddział Gwardii Królewskiej" (focus `POL_kings_guard`) reused in `POL_GUA_01`.

## Author confirmation
Extrapolated (plausible, not historical units) or from memory:
- `POL_VOL_01`: 5 Dywizja Strzelców Polskich „Syberyjska” (styled form); Legion Puławski (memory); Ochotnicza Dywizja Strzelców, Zmotoryzowana Dywizja Ochotnicza (extrapolated); 201/202/205 Ochotniczy Pułk Piechoty (numbers verified, "Ochotniczy" wording extrapolated).
- `POL_VOL_02`: Batalion im. Adama Mickiewicza (memory); Dywizja Dąbrowszczaków, all eight "Dywizja Ochotnicza im. …", Brygada „Za Wolność Naszą i Waszą” (extrapolated, patrons are political choices for a communist Poland).
- `POL_FORT_01`: Rejon Umocniony Sarny, Twierdza Modlin, Obrona Lwowa, Orlęta Lwowskie (memory); Twierdza Brześć, Przemyśl, Dęblin, Grudziądz, Osowiec, Batalion Forteczny „Hel”, „Mława” (extrapolated as garrison names).
- `POL_GUA_01`: 1 Pułk Pancerny im. Króla Bolesława Chrobrego (an AK unit on the pl.wikipedia list of units named after Bolesław Chrobry; the proofreader could not place it); keys 109-123, every "Dywizja … Gwardii" and husaria name (extrapolated on the pattern of the verified royal guards and royal-patron regiments).
- `POL_POW_01`: Katowicki, Zabrski, Rybnicki, Tarnogórski, Pszczyński Pułk Powstańców (the 1921 regiments are verified by district; this word order is extrapolated); Polska Organizacja Wojskowa (memory).

## Kept on judgment
Expected `-Check POL` flags after the batch: the flags of the 2026-10-20 audit's "Outcome" (LOW_DEPTH x21, PLACEHOLDER_ENTRIES x12, NAME_LONG x1, all on the old groups), plus on the new groups only:
- `LOW_DEPTH` on any of the five: specialist lists of 18-25 entries (user: 15-25 per group).
- `UNGATED_POLITICAL` on `POL_POW_01`: national uprising units, ungated by user decision.
- `POLITICAL_ENTRY` on `POL_POW_01`, `POL_VOL_01` or `POL_FORT_01`: uprising, legion and city-defence names in ungated lists; kept, historical units of every Polish tradition.
- `NAME_LONG` on `POL_GUA_01` or `POL_VOL_02`: official patron names.
- `IDENTITY_REPEAT`: none expected; if one appears, report it.
Any other flag type is a stop condition.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames POL -Batch docs/superpowers/plans/2026-10-20-poland-namelist.md`. Expect five `Added POL_…` lines (VOL_01 25, VOL_02 18, FORT_01 22, GUA_01 23, POW_01 25 names) and no `[ERROR]`.
- [x] 2. `wiki/Poland.md`: insert the five table rows and append the five sections from "Docs payload" with the Edit tool.
- [x] 3. `powershell -File .\build.ps1 -SyncWiki POL`. Expect no line about groups without a row or rows without a group. A `row(s) updated` count above 0 is fine (it rewrites types and fallbacks to the file).
- [x] 4. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: make the three replacements from "Docs payload" with the Edit tool.
- [x] 5. `powershell -File .\build.ps1 -Check POL`. Expect `Check passed` and `GROUPS=39`; remaining flags must match "Kept on judgment".
- [x] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 7. (Shipped 2026-10-20 in one commit with the audit plan, on the user's word.) Ship, on the user's word, and only after the 2026-10-20 audit plan (`docs/superpowers/plans/2026-10-20-poland-audit.md`) has been committed: commit with the message `Add Polish volunteer, fortress, Royal Guard and uprising namelists`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Add Polish volunteer, fortress, Royal Guard and uprising namelists"`.

## Docs payload
README, `wiki/Home.md` and `wiki/_Sidebar.md`: no change (the nation is already registered; `-SyncWiki` updates the Home group count).

### wiki/Poland.md: table rows
Insert after the line `| `POL_BSKRZ_01` | Nationalist Brigades (NSZ) | infantry, militia | `%d Brygada NSZ` |`:
```
| `POL_VOL_01` | Volunteer Divisions | infantry, cavalry, motorized | `%d Dywizja Ochotnicza` |
| `POL_VOL_02` | International Brigades | infantry, cavalry, motorized | `%d Brygada Międzynarodowa` |
| `POL_FORT_01` | Fortress Garrisons | infantry | `%d Batalion Forteczny` |
| `POL_GUA_01` | Royal Guard Divisions | infantry, cavalry, light_armor, medium_armor, heavy_armor, modern_armor | `%d Dywizja Gwardii Królewskiej` |
| `POL_POW_01` | Uprising Regiments | militia, infantry | `%d Pułk Powstańczy` |
```

### wiki/Poland.md: sections
Append at the end of the file, after the `POL_MNT_01` section, with one blank line before each heading:
```
### `POL_VOL_01` — Volunteer Divisions
Volunteer and expeditionary formations from 1914 to 1920, for volunteers sent abroad: the Polish rifle divisions of Haller's Blue Army in France and of the Polish corps in Russia (*1–7 Dywizja Strzelców Polskich*, the Siberian Division), the three brigades of the Polish Legions, the French *Bajończycy*, and the 1920 Volunteer Army (*Dywizja Ochotnicza*, the 200-series volunteer regiments). Some entries are plausible extensions. Any government.

### `POL_VOL_02` — International Brigades (Dąbrowszczacy)
Polish volunteers of the Spanish Civil War: the XIII *Jarosław Dąbrowski* International Brigade, the Dąbrowski and Mickiewicz battalions, the Palafox battalion and the Botwin, Szewczenko and Waryński companies, extended with plausible volunteer divisions named after revolutionary patrons. Gated to communist governments.

### `POL_FORT_01` — Fortress Garrisons
Fortified areas and city defence commands for static garrison templates: the Hel Fortified Area, the Silesia Fortified Area (*Obszar Warowny „Śląsk”*) and its combat groups, the Wizna line, the Sarny fortified area on the eastern border, the Warsaw defence command, Modlin and Lwów, followed by plausible garrisons of the old fortresses (Brześć, Przemyśl, Dęblin, Grudziądz, Osowiec). Westerplatte is in `POL_MAR_01`. Any government.

### `POL_GUA_01` — Royal Guard Divisions
For a restored monarchy (the vanilla King's Guard focus): the Crown Foot and Horse Guards of the Commonwealth, interwar regiments named after Polish kings (17th, 20th and 27th Uhlans, 81st Grodno Rifles), and guard infantry, cavalry, hussar and armoured divisions named after the kings. The division names are plausible extensions. Gated to non-aligned and fascist governments.

### `POL_POW_01` — Uprising Regiments
Insurgent formations of the Greater Poland Uprising (1918–1919: *Strzelcy Wielkopolscy*, the Greater Poland Army and Front) and the Third Silesian Uprising (1921: the *Wschód*, *Południe*, *Północ* and *Środek* groups, district regiments, the Wawelberg sabotage group), with the Polish Military Organisation (POW). Any government.
```

### WORKSHOP_DESCRIPTION_GUIDELINES.md
1. Poland table row: replace `Communist LWP, Nationalist NSZ) |` with `Communist LWP, Nationalist NSZ, Royal Guard, volunteer corps, fortresses, uprisings) |`.
2. Second bullet under `[b]Poland[/b]`: replace `- Second Republic territorial defence, border protection, and cavalry brigades ([i]Krakowska Brygada Kawalerii[/i], [i]Brygada KOP 'Grodno'[/i], [i]Warszawska Brygada Obrony Narodowej[/i])` with `- Second Republic territorial defence, fortresses, border protection, cavalry and uprising regiments ([i]Krakowska Brygada Kawalerii[/i], [i]Brygada KOP 'Grodno'[/i], [i]Rejon Umocniony Hel[/i], [i]1 Pułk Strzelców Wielkopolskich[/i])`.
3. Third bullet: replace `, and Nationalist NSZ ([i]Brygada Świętokrzyska[/i])` with `, Nationalist NSZ ([i]Brygada Świętokrzyska[/i]), a monarchist Royal Guard ([i]Gwardia Piesza Koronna[/i]) and volunteer corps from the Legions to the Dąbrowszczacy`.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-code-reviewer` on all 113 names (Polish), 2026-10-20:
- `POL_VOL_02` Brygada „Za Waszą i Naszą Wolność”: the slogan reads „Za wolność naszą i waszą”. Fixed in the batch: Brygada „Za Wolność Naszą i Waszą”.
- `POL_GUA_01` 1 Pułk Pancerny im. Króla Bolesława Chrobrego (unsure, plausibility only): kept; verified by the researcher on the pl.wikipedia list of units named after Bolesław Chrobry; added to "Author confirmation".
- `POL_POW_01` Grupa Destrukcyjna Wawelberga (unsure about the form): kept; the 1921 Silesian group in pl.wikipedia "III powstanie śląskie", as the researcher fetched it.
No other issues.

## Outcome
Date: 2026-10-20.

`-Check POL` summary: GROUPS=39, AUTHORED=352/569, FLAGS=35 (LOW_DEPTH x21, PLACEHOLDER_ENTRIES x12, UNGATED_POLITICAL x1, NAME_LONG x1). The counts of LOW_DEPTH (21), PLACEHOLDER_ENTRIES (12) and NAME_LONG (1) equal the 2026-10-20 audit's, so they add no new flags; the one new flag is UNGATED_POLITICAL x1, which the plan expects on `POL_POW_01`. The summary does not print group placement per flag. No POLITICAL_ENTRY or IDENTITY_REPEAT appeared. No `Docs:` warnings. Tests: 435 passed, 0 failed.

Deviations: none from the plan's content. Side effect of `-Check`, not a deviation: it refreshed the change table in `docs/superpowers/plans/2026-10-20-poland-audit.md` (18 changed groups vs HEAD; 0 TODO sections left).

## Edit batch
Applied by `build.ps1 -EditNames POL -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "addGroup": true, "group": "POL_VOL_01", "selector": "Volunteer Divisions", "addType": ["infantry", "cavalry", "motorized"], "fallback": "%d Dywizja Ochotnicza",
  "comment": "# ===== Volunteers, fortresses, Royal Guard and insurgents =====\n\nVolunteer and expeditionary formations, 1914-1920: Polish rifle divisions in France and Russia, the Legions, the 1920 Volunteer Army.",
  "add": [
  "# Polish rifle divisions in France and Russia (1917-1920)",
  "1=1 Dywizja Strzelców Polskich",
  "2=2 Dywizja Strzelców Polskich",
  "3=3 Dywizja Strzelców Polskich",
  "4=4 Dywizja Strzelców Polskich",
  "5=5 Dywizja Strzelców Polskich „Syberyjska”",
  "6=6 Dywizja Strzelców Polskich",
  "7=7 Dywizja Strzelców Polskich",
  "# Volunteer Army (1920)",
  "101=Dywizja Ochotnicza",
  "102=Dywizja Instrukcyjna",
  "# Legions and volunteer corps (1914-1918)",
  "104=I Brygada Legionów Polskich",
  "105=II Brygada Legionów Polskich „Karpacka”",
  "106=III Brygada Legionów Polskich",
  "107=Polski Korpus Posiłkowy",
  "108=Legion Wschodni",
  "109=Legion Zachodni",
  "110=Legion Puławski",
  "111=Bajończycy",
  "# Volunteer cavalry and armour",
  "112=1 Dywizja Ułanów",
  "113=1 Pułk Ułanów Legionów Polskich",
  "114=1 Pułk Czołgów",
  "# Plausible volunteer formations",
  "116=Ochotnicza Dywizja Strzelców",
  "118=Zmotoryzowana Dywizja Ochotnicza",
  "# Volunteer Army regiments (1920)",
  "201=201 Ochotniczy Pułk Piechoty",
  "202=202 Ochotniczy Pułk Piechoty",
  "205=205 Ochotniczy Pułk Piechoty"
] }
```

```json batch
{ "addGroup": true, "group": "POL_VOL_02", "selector": "International Brigades", "addType": ["infantry", "cavalry", "motorized"], "fallback": "%d Brygada Międzynarodowa",
  "canUse": "has_government = communism",
  "comment": "# Dąbrowszczacy: Polish volunteers of the Spanish Civil War; communist governments only.",
  "add": [
  "# Spanish Civil War (1936-1939)",
  "13=XIII Brygada Międzynarodowa im. Jarosława Dąbrowskiego",
  "150=150 Brygada Międzynarodowa",
  "101=Batalion im. Jarosława Dąbrowskiego",
  "102=Batalion im. Adama Mickiewicza",
  "103=Batalion Palafox",
  "104=Kompania im. Naftalego Botwina",
  "105=Kompania im. Tarasa Szewczenki",
  "106=Kompania im. Ludwika Waryńskiego",
  "# Plausible volunteer divisions",
  "107=Dywizja Dąbrowszczaków",
  "108=Dywizja Ochotnicza im. Jarosława Dąbrowskiego",
  "109=Dywizja Ochotnicza im. Ludwika Waryńskiego",
  "110=Dywizja Ochotnicza im. Adama Mickiewicza",
  "111=Dywizja Ochotnicza im. Karola Świerczewskiego",
  "112=Dywizja Ochotnicza im. Naftalego Botwina",
  "113=Dywizja Ochotnicza im. Tarasa Szewczenki",
  "114=Dywizja Ochotnicza im. Róży Luksemburg",
  "115=Dywizja Ochotnicza im. Juliana Marchlewskiego",
  "116=Brygada „Za Wolność Naszą i Waszą”"
] }
```

```json batch
{ "addGroup": true, "group": "POL_FORT_01", "selector": "Fortress Garrisons", "addType": ["infantry"], "fallback": "%d Batalion Forteczny",
  "comment": "# Fortified areas, fortresses and city defence commands. Westerplatte is in POL_MAR_01.",
  "add": [
  "# Coast",
  "101=Rejon Umocniony Hel",
  "102=Ośrodek Oporu Jastarnia",
  "# Silesia (1939)",
  "103=Obszar Warowny „Śląsk”",
  "104=Odcinek „Mikołów”",
  "112=Grupa Bojowa „Wesoła”",
  "113=Grupa Bojowa „Brzeziny”",
  "114=Grupa Bojowa „Wirek”",
  "# Narew and the eastern border",
  "105=Odcinek Umocniony Wizna",
  "115=Pododcinek „Giełczyn”",
  "106=Rejon Umocniony Sarny",
  "107=Batalion Forteczny KOP „Sarny”",
  "# Cities",
  "108=Dowództwo Obrony Warszawy",
  "109=Twierdza Modlin",
  "110=Obrona Lwowa",
  "111=Orlęta Lwowskie",
  "# Plausible fortress garrisons",
  "116=Twierdza Brześć",
  "117=Twierdza Przemyśl",
  "118=Twierdza Dęblin",
  "119=Twierdza Grudziądz",
  "120=Twierdza Osowiec",
  "121=Batalion Forteczny „Hel”",
  "122=Batalion Forteczny „Mława”"
] }
```

```json batch
{ "addGroup": true, "group": "POL_GUA_01", "selector": "Royal Guard Divisions", "addType": ["infantry", "cavalry", "light_armor", "medium_armor", "heavy_armor", "modern_armor"], "fallback": "%d Dywizja Gwardii Królewskiej",
  "canUse": "OR = { has_government = neutrality has_government = fascism }",
  "comment": "# Royal Guard for a restored Polish monarchy (vanilla focus POL_kings_guard); neutrality and fascist governments.",
  "add": [
  "# Royal guards of the Commonwealth",
  "101=Gwardia Piesza Koronna",
  "102=Regiment Gwardii Konnej Koronnej",
  "103=Oddział Gwardii Królewskiej",
  "# Regiments with royal patrons (1919-1939)",
  "104=17 Pułk Ułanów Wielkopolskich im. Króla Bolesława Chrobrego",
  "105=20 Pułk Ułanów im. Króla Jana III Sobieskiego",
  "106=27 Pułk Ułanów im. Króla Stefana Batorego",
  "107=81 Pułk Strzelców Grodzieńskich im. Króla Stefana Batorego",
  "108=1 Pułk Pancerny im. Króla Bolesława Chrobrego",
  "# Guard infantry",
  "109=Dywizja Gwardii Pieszej Koronnej",
  "111=Dywizja Grenadierów Gwardii",
  "112=Dywizja Piechoty Gwardii im. Króla Jana III Sobieskiego",
  "113=Dywizja Piechoty Gwardii im. Króla Bolesława Chrobrego",
  "114=Dywizja Piechoty Gwardii im. Króla Stefana Batorego",
  "115=Dywizja Piechoty Gwardii im. Króla Kazimierza Wielkiego",
  "116=Dywizja Piechoty Gwardii im. Króla Władysława Jagiełły",
  "117=Dywizja Piechoty Gwardii im. Królowej Jadwigi",
  "# Guard cavalry",
  "110=Dywizja Gwardii Konnej Koronnej",
  "118=Dywizja Husarii im. Króla Jana III Sobieskiego",
  "119=Dywizja Kawalerii Gwardii im. Króla Zygmunta Augusta",
  "120=Dywizja Szwoleżerów Gwardii",
  "# Guard armour",
  "121=Dywizja Pancerna Gwardii Królewskiej",
  "122=Dywizja Pancerna Gwardii im. Króla Władysława IV Wazy",
  "123=Pancerna Dywizja Husarska"
] }
```

```json batch
{ "addGroup": true, "group": "POL_POW_01", "selector": "Uprising Regiments", "addType": ["militia", "infantry"], "fallback": "%d Pułk Powstańczy",
  "comment": "# Greater Poland Uprising (1918-1919) and Silesian Uprisings (1919-1921); any government.",
  "add": [
  "# Greater Poland Uprising (1918-1919)",
  "1=1 Pułk Strzelców Wielkopolskich",
  "2=2 Pułk Strzelców Wielkopolskich",
  "3=3 Pułk Strzelców Wielkopolskich",
  "101=1 Dywizja Strzelców Wielkopolskich",
  "102=2 Dywizja Strzelców Wielkopolskich",
  "103=3 Dywizja Strzelców Wielkopolskich",
  "104=Armia Wielkopolska",
  "105=Front Wielkopolski",
  "106=Grupa „Leszno”",
  "107=Toruński Pułk Strzelców",
  "108=Kaszubski Pułk Strzelców",
  "109=I Brygada Jazdy Wielkopolskiej",
  "# Third Silesian Uprising (1921)",
  "110=Grupa „Wschód”",
  "111=Grupa „Południe”",
  "112=Grupa „Północ”",
  "113=Grupa „Środek”",
  "114=Samodzielny Oddział Szturmowy",
  "115=Grupa Destrukcyjna Wawelberga",
  "116=Polska Organizacja Wojskowa Górnego Śląska",
  "# Uprising regiments by district",
  "117=Katowicki Pułk Powstańców",
  "118=Zabrski Pułk Powstańców",
  "119=Rybnicki Pułk Powstańców",
  "120=Tarnogórski Pułk Powstańców",
  "121=Pszczyński Pułk Powstańców",
  "# Polish Military Organisation (1914-1918)",
  "122=Polska Organizacja Wojskowa"
] }
```
