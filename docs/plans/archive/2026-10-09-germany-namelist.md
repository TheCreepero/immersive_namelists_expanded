# Germany (GER) Namelist Plan - 2026-10-09

Status: DONE

File: `common/units/names_divisions/INEX_GER_ADDITIONAL_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Germany has 51 INEX groups in three files: `INEX_GER_names_divisions.txt` (22), `INEX_GER_SS_names_divisions.txt` (10) and `INEX_GER_ADDITIONAL_names_divisions.txt` (19: heavy battalions, Panzer brigades, numbered series, Luftwaffe field and Flak divisions, garrisons, Festungen, Kampfgruppen, one militia per ideology, Foreign Legions). The user asked for a moderate number (4 to 7) of new German namelists. This plan adds five, all in the ADDITIONAL file, which goes from 19 to 24 groups and from 734 to 918 names. No existing INEX group is touched. One vanilla tag, `GER_PEN_01`, is overridden for the first time.

Order of work: this plan is meant to be applied, and committed, before the three audit plans `2026-10-09-germany*-audit.md`. Its docs payload is written against the repository at commit `5d84892`. Its batch places groups after `GER_ARM_03` and `GER_KAMPFGRUPPE_01`, so those tags must still exist when it runs.

## Decisions
All final.

**The user's rule**, verbatim: "One rule is to not have namelists for units below battallion size since single-regiment units don't work well in Hoi4 gameplay."
- Reading applied (the orchestrating session's, to be confirmed by the user): the battalion (Bataillon, Abteilung) is the floor. No group names companies, batteries, platoons, Kommandos or other sub-battalion units. Because the stated reason is that tiny units play poorly as division templates, the larger formation is preferred wherever a candidate could be named at either level, and a battalion-level list is accepted only where the battalion was the real independent unit of its arm, as with the existing heavy Panzer battalion lists.
- Consequence for this suite: no regiment-level list either. Three groups are battalion-level and are marked so they can be struck: `GER_STUG_01` (brigades in name, battalions in strength), `GER_PEN_01` and `GER_STURM_01`. The other two name brigades and divisions.
- Left out under the rule: Sturm-Kompanie Nr. 13 (a company), the Feldstrafgefangenen-Abteilungen (unarmed labour detachments that began at about 200 men), armoured trains, and the Garde-Reserve-Pionier-Regiment and Württembergisches Gebirgs-Bataillon (not Sturm-Bataillone, and sourced at forum level only).

**Policy answers.** The user could not be asked during planning. These are the orchestrating session's defaults, taken from the project rules, and the user may overrule any of them:
- Plausible extrapolation is allowed, anchored in verified formations and the army's own naming pattern. Verified names first, never filler. In this plan every formation is a real one; what is extrapolated is the wording of 21 names, listed under "Author confirmation".
- Ideology-gated groups are welcome where history supports them, gated only with `has_government`.
- A nicknamed infantry, motorized, mechanized or armor list would need a plain/named pair. None of the five groups is one: they are number series or lists of distinct formations. There are no `link_numbering_with` links.
- New groups only. No existing group is modified, extended or re-tagged.

**One file, one plan.** `-EditNames <KEY> -Batch <plan>` applies a plan to one file key. All five groups go in the ADDITIONAL file, which `CLAUDE.md` section 2 gives to numbered series, heavy battalions, Kampfgruppen and the per-ideology lists outside the main suites. The two Imperial groups are numbered series (battalions and second-line divisions), so they sit here beside the Wehrmacht's numbered series, not in the main file with the Guard and Imperial division suites.

**The five groups and why each was chosen.**
- `GER_STUG_01` Assault Gun Brigades: a distinct arm with no list, 57 real numbers and nine named or special units.
- `GER_BRIG_01` Infantry Brigades: small infantry and motorized templates had only Kampfgruppen and Panzer brigades to choose from.
- `GER_PEN_01` Penal Units: the only vanilla German tag INEX did not define. Vanilla ships it with no names and a focus lock, and the vanilla focus `GER_strafbataillon` names its locked nine-battalion template (up to 12 divisions) from it.
- `GER_STURM_01` Imperial Storm Battalions: the Imperial path had no assault formation list. The roster of 17 battalions is complete.
- `GER_LANDWEHR_01` Imperial Landwehr Divisions: the Imperial path had no second-line or garrison list of its own period.

**Gating.**
- `GER_STUG_01`, `GER_BRIG_01`, `GER_PEN_01`: any government (`always = yes`). They carry administrative Wehrmacht designations and no party honorifics, as the user decided for the basic Heer lists in the 2026-09-30 overhaul.
- `GER_STURM_01`, `GER_LANDWEHR_01`: `OR = { has_government = neutrality has_government = democratic }`, the same gate as the three existing Imperial lists.
- `GER_PEN_01` drops vanilla's `has_completed_focus` lock (strict focus ban). The `penal_battalion` unit itself stays locked by vanilla, so only the list's visibility changes.

**Reversal of an earlier choice.** The header of `INEX_GER_names_divisions.txt` says "GER_PEN_01 is left to vanilla". That was right while INEX had no names for it; this plan supplies them. A new tag was not an option, because the focus template is locked to `GER_PEN_01` and cannot be switched to another list. Follow-up outside this plan: that header sentence is now out of date and belongs to the audit of the main file (`-SetHeader GER`). This plan does not edit the main file.

**division_types.** Only line-battalion tokens are used.
- `GER_STUG_01`: `light_armor medium_armor heavy_armor modern_armor`, the same set as the neighbouring `GER_ARM_03`. Assault guns are built on tank chassis and fill armor battalions.
- `GER_BRIG_01`: `infantry motorized`. `GER_PEN_01`: `penal_battalion infantry`, as vanilla. `GER_STURM_01`: `infantry ranger_battalion`. `GER_LANDWEHR_01`: `infantry militia`.
- Every group carries at least two tokens. The game prefers the list with the fewest tokens when it picks one by itself, so the single-token main lists (`GER_Inf_01`, `GER_MOT_01`) keep priority.
- `artillery`, `rocket_artillery`, `anti_air` and `anti_tank` pass `build.ps1` but are support-company ids in vanilla (`group = support` in `common/units/artillery.txt`, `anti-air.txt`, `anti_tank.txt`); the line battalions are `artillery_brigade`, `rocket_artillery_brigade`, `motorized_rocket_brigade`, `anti_tank_brigade` and `anti_air_brigade`, which the validator rejects. `CLAUDE.md` section 6 forbids support-only tokens, so no group in this plan uses them, and the Nebelwerfer list is a runner-up for that reason.
- No `is_ai = no` gate, unlike `GER_PANZERARTILLERIE_DIVISION_01`: the other specialist lists in this file have none.

**Keys and number format.**
- `GER_STUG_01`, `GER_STURM_01` and `GER_LANDWEHR_01` are single number series: the key is the real number and the name carries `%d`, as in `GER_SCHWERE_PANZERABTEILUNG_01` and `GER_ARM_03`. Named and out-of-series units sit at 901 and above (951 and above in `GER_STUG_01`, whose real numbers reach 920), so the series comes first.
- `GER_BRIG_01` and `GER_PEN_01` mix formation types. Their real numbers are written into the names as static text on keys 1, 2, 3 and so on, so the order is the plan's (Grenadier brigades first; probation battalions, then Division 999, then its fortress battalions) and not an accident of the numbers.
- Number position follows each arm's usage: after the noun for brigades and battalions (`Sturmgeschütz-Brigade 191`, `Sturm-Bataillon Nr. 5`), ordinal before the noun for divisions (`14. Landwehr-Division`).

**Designations.**
- `GER_STUG_01` uses the 1944 designations: `Heeres-Sturmartillerie-Brigade` for the 16 brigades that received an escort grenadier battery, `Heeres-Sturmgeschütz-Brigade` for 184 and 185. `leichte` is written in lower case, like `schwere Panzer-Abteilung` in the neighbouring list.
- `GER_PEN_01`: the fallback is `Bewährungs-Bataillon %d`. "Straf-Division" (vanilla) and "Strafdivision 999" are colloquial; the Wehrmacht's term was Bewährungstruppe. `999. leichte Afrika-Division` was not found as an official designation and is not used; the list has `Afrika-Brigade 999` and `Afrika-Division 999`. The fortress battalions run I to XXIII, the count in the Bundesarchiv description; the Lexikon der Wehrmacht index goes to XXVI.
- `GER_LANDWEHR_01`: the Bavarian divisions use `Kgl. Bayer.`, as the existing Imperial lists do. The five divisions of 1914-15 that were first named after their commanders appear a second time under that name, at the end.
- One entry per formation otherwise (the Ramcke brigade is not repeated as Luftwaffen-Jäger-Brigade 1).

**Dropped.**
- `GER_STUG_01`: 197, 200, 333 and 1170 (on the Lexikon index but with no detail; 197 became schwere Panzerjäger-Abteilung 653 in 1943, which `GER_SCHWERE_PANZERABTEILUNG_01` already has; 200 and 1170 carry divisional numbers); staff 1178; a Sturmgeschütz-Brigade 'Großdeutschland' and a Führer-Begleit assault gun brigade (not found).
- `GER_BRIG_01`: Brigade Netze and Brigade Goldap (not found), Gruppe Eberhardt (a group, not a brigade), the Schützen-Brigaden (parts of Panzer divisions), cavalry and Cossack brigades (not infantry; Cossacks are in `GER_LEG_01`), Infanterie-Brigade 599 (russ.) and the Croatian training brigade (foreign), the Ersatz-Brigaden 'Großdeutschland' and 'Feldherrnhalle' and Brigade General Göring (honour formations, `GER_ELI_01`), the fortress brigades (`GER_FORT_01`), Luftwaffen-Brigade Oberrhein (never above regiment strength).
- `GER_PEN_01`: Infanterie-Bataillon z.b.V. 491 (index entry only), the SS probation units (SS file's scope).
- `GER_LANDWEHR_01`: a 97. Landwehr-Division of 1939 (not found; the Wehrmacht's 14. Landwehr-Division shares its number with the Imperial one), Landwehr-Division Königsberg and Einem (not found), the Landwehrkorps (wording unverified).

**Runners-up**, in case the user wants to swap:
- Nebelwerfer brigades (Werfer-Brigade 1 to 9, Volks-Werfer-Brigade 15 to 20, Stellungs-Werfer-Brigade 300; 16 formations, researched and ready to write): no accepted line token, see "division_types". It needs `rocket_artillery_brigade` and `motorized_rocket_brigade` added to `$ValidDivisionTypes` first.
- Heavy Panzerjäger battalions: a fourth battalion-level list; research found four entries at forum level; 653, 654 and 512 are already in `GER_SCHWERE_PANZERABTEILUNG_01`.
- Democratic volunteer legions of 1848-49 (Deutsche Demokratische Legion, Freikorps Willich, Freikorps Blenker): the best fit for the thin democratic path, but only six formations are verified at battalion strength; it needs another research pass.
- Reichswehr brigades of 1919-20 and Reichsheer divisions (democratic): numbers only, no individual names.
- International Brigade units (communist): one brigade and four or five battalions, and the names repeat `GER_MEC_01_COMMUNIST`.
- Bundeswehr or Bundesgrenzschutz formations (democratic), Kasernierte Volkspolizei or NVA formations (communist): institutions of 1951 and later; the NVA style is already vanilla's separate DDR tag.
- Artillery divisions and Volks-Artillerie-Korps, Feldausbildungs divisions, the RAD divisions of 1945, Luftlande and Sturm divisions, the Ski-Jäger division: already inside existing groups.
- Landesschützen and Landsturm: battalions only, and the role is covered by the garrison lists.
- Pioneer brigades, bicycle and armoured-car units: no accepted `division_types` token.
- Cossack formations: the divisions are in `GER_LEG_01`, the rest are regiments.
- RAD Arbeitsgaue (fascism): that path already has 14 lists.
- Army corps: a number pattern only.

Selectors are plural, at most 28 characters, unique in the file, without a demonym.

## Vanilla findings (`-InspectVanilla GER`)
| Tag | Vanilla state | Action |
|---|---|---|
| `GER_PEN_01` | "Penal Units", `penal_battalion infantry`, fallback `%d. Straf-Division`, 0 ordered names, `can_use = { has_completed_focus = GER_strafbataillon }`; referenced by `common/national_focus/germany.txt` (`division_names_group = GER_PEN_01` on a locked "Straf-Division" template, `division_cap = 12`) | overridden: same selector and types, 30 names, fallback `Bewährungs-Bataillon %d`, no focus lock |
| `GER_STUG_01`, `GER_BRIG_01`, `GER_STURM_01`, `GER_LANDWEHR_01` | not in vanilla, not used anywhere in the mod | new groups |
| the other 22 vanilla GER tags | unchanged by this plan | none |

Vanilla also ships a separate East German tag (`DDR_names_divisions.txt`), which is why no NVA-style list is proposed for a communist Germany.

## Group suite
| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `GER_STUG_01` | Assault Gun Brigades | light_armor, medium_armor, heavy_armor, modern_armor | always = yes | - | `Sturmgeschütz-Brigade %d` | 66 |
| `GER_BRIG_01` | Infantry Brigades | infantry, motorized | always = yes | - | `Grenadier-Brigade %d` | 32 |
| `GER_PEN_01` | Penal Units | penal_battalion, infantry | always = yes | - | `Bewährungs-Bataillon %d` | 30 |
| `GER_STURM_01` | Imperial Storm Battalions | infantry, ranger_battalion | OR = { has_government = neutrality has_government = democratic } | - | `Sturm-Bataillon Nr. %d` | 17 |
| `GER_LANDWEHR_01` | Imperial Landwehr Divisions | infantry, militia | OR = { has_government = neutrality has_government = democratic } | - | `%d. Landwehr-Division` | 39 |

Totals: 5 groups, 184 names. The file goes from 19 to 24 groups and from 734 to 918 names.

Size of the formations named, for the battalion rule:
- `GER_STUG_01`: battalion strength under a brigade name (three batteries, 31 guns, 45 from 1944).
- `GER_BRIG_01`: brigades (two regiments, or one reinforced regiment from May 1944).
- `GER_PEN_01`: battalions, one brigade and one division.
- `GER_STURM_01`: battalions.
- `GER_LANDWEHR_01`: divisions.

File order after the batch: `GER_STUG_01` after `GER_ARM_03`; `GER_BRIG_01` and `GER_PEN_01` after `GER_KAMPFGRUPPE_01`; `GER_STURM_01` and `GER_LANDWEHR_01` at the end of the file under a new banner.

## Research record
Three scoped `inex-historical-researcher` dispatches, run in parallel (the nation already has a full file, so no general order of battle was compiled):
- Run 1, Wehrmacht specialist arms, 37 web calls: Lexikon der Wehrmacht (Sturmgeschütz-Brigaden index with the OKH orders of 14 February and 10 June 1944, Werfer-Brigade 3, Bewährungseinheiten index, Feldstrafgefangenen-Abteilungen index), de.wikipedia (Sturmartillerietruppe, Fallschirm-Sturmgeschütz-Brigade, Werfer-Brigade 1, 4, 8, 9, Volks-Werfer-Brigade 15 to 19, Strafdivision 500 and 999), en.wikipedia "List of German brigades in World War II", Bundesarchiv RH 26-999 description (archivportal-d.de).
- Run 2, Imperial and republican rosters, about 37 web calls: de.wikipedia "Sturmbataillon", the navigation box of de.wikipedia "14. Landwehr-Division (Deutsches Kaiserreich)", de.wikipedia 1. and 5. Landwehr-Division, en.wikipedia 9th Landwehr Division, de.wikipedia "Division (Reichswehr)", en.wikipedia International Brigades order of battle. Several list pages returned 404 or a bot wall (GenWiki).
- Run 3, democratic formations of 1848-49 and 1918-20, 19 web calls: de.wikipedia Badische Revolution, Pfälzischer Aufstand, Deutsche Demokratische Legion, Schleswig-Holsteinische Armee, Republikanische Soldatenwehr. Result: too little verified at battalion strength; kept as a runner-up.
- Planner, 2 web searches after the proofread, to settle two of its doubts (see "Review").

Unverified after research and therefore left out: see "Dropped" under Decisions. Heavy Panzerjäger battalions were covered only by forum snippets. The Nebelwerfer roster is verified but has no usable token. The dossiers in `scratch/` (`ger_dossier.md`, `ger_dossier2.md`, `ger_dossier3.md`) are raw input and are not needed again.

## Author confirmation
163 of the 184 names are verified on a fetched page as written. The other 21 name real formations, but their exact wording or existence rests on a weaker source:

**GER_STUG_01** (8): `leichte Sturmgeschütz-Brigade 190` (index form, adjective lower-cased here); `Sturmgeschütz-Brigade 397` and `398` (on the Lexikon index; ordered in 1944 and never completed); `Sturmgeschütz-Brigade 'Schill'` (index entry, no dates); `Sturmpanzer-Abteilung 216`, `217`, `218`, `219` (hyphenation from search results, not from a Lexikon page).

**GER_BRIG_01** (1): `1. Skijäger-Brigade` (the position of the number; one source prints "Skijäger-Brigade 1").

**GER_PEN_01** (0).

**GER_STURM_01** (3): `Jäger-Sturm-Bataillon Nr. 3` (the source prints "3 (Jäger)"); `Kgl. Bayer. Sturm-Bataillon Nr. 6` and `Nr. 15` (Bavarian battalions; the prefix follows the existing Imperial lists).

**GER_LANDWEHR_01** (9): `2. (Württembergische) Landwehr-Division` (sources disagree on whether the state name was official); `38.`, `44.` and `48. Landwehr-Division` (navigation box only); `1.`, `2.` and `6. Kgl. Bayer. Landwehr-Division` (wording follows the existing Imperial lists); `Landwehr-Division Bredow` and `Landwehr-Division Breugel` (search digests).

## Kept on judgment
`-Check` should report `GROUPS=24 AUTHORED=548/918 FLAGS=28` and `Flags: PLACEHOLDER_ENTRIES x14, LOW_DEPTH x13, POLITICAL_ENTRY x1`.
- Nine flags come from the five new groups: `PLACEHOLDER_ENTRIES` on all five, and `LOW_DEPTH` on `GER_STUG_01`, `GER_PEN_01`, `GER_STURM_01` and `GER_LANDWEHR_01`. The audit counts every name that repeats its group's number pattern as a stub, and these lists are number series on their real numbers by design (57 assault gun brigades, 23 fortress battalions, 17 Sturm-Bataillone, 31 Landwehr divisions). The same two flags sit on the neighbouring numbered lists for the same reason. `GER_BRIG_01` has 14 distinct names of 32 and so stays above the depth line.
- The other 19 flags (`PLACEHOLDER_ENTRIES` x9, `LOW_DEPTH` x9, `POLITICAL_ENTRY` x1) were on the file before this batch, on groups it does not touch.
- No `UNGATED_POLITICAL`, `DUPLICATE_NAME`, `SELECTOR_LONG`, `NAME_LONG` or `Docs:` warning is expected.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GER_ADDITIONAL -Batch docs\superpowers\plans\2026-10-09-germany-namelist.md`. Expect five green lines and no `[ERROR]`:
  - `Added GER_STUG_01: "Assault Gun Brigades" [light_armor medium_armor heavy_armor modern_armor], 66 name(s)`
  - `Added GER_BRIG_01: "Infantry Brigades" [infantry motorized], 32 name(s)`
  - `Added GER_PEN_01: "Penal Units" [penal_battalion infantry], 30 name(s)`
  - `Added GER_STURM_01: "Imperial Storm Battalions" [infantry ranger_battalion], 17 name(s)`
  - `Added GER_LANDWEHR_01: "Imperial Landwehr Divisions" [infantry militia], 39 name(s)`
- [x] 2. `README.md`: no change. The Germany row lists the tag and the three files only.
- [x] 3. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: replace the cross-reference row and the second and third bullets of `[b]Germany[/b]` with the text under "Docs payload". The description grows from 10,262 to 10,442 characters (limit 17,000).
- [x] 4. Wiki: make the six edits to `wiki/Germany-Additional.md` and the one edit to `wiki/Home.md` under "Docs payload"; `wiki/_Sidebar.md` is unchanged. Then `powershell -File .\build.ps1 -SyncWiki GER_ADDITIONAL`. Expect `Germany-Additional.md: 0 row(s) updated` and no `no row in wiki table` or `stale row` line. The line `wiki/Home.md: no GER_ADDITIONAL row` is expected and is not a fault: the Home row carries the tag `GER`, which is why the count is edited by hand.
- [x] 5. `powershell -File .\build.ps1 -Check GER_ADDITIONAL`. Expect `Validate: OK`, the tests passing, the summary and flags given under "Kept on judgment", `Diff vs HEAD: 5 group(s) changed, +184 -0 name(s)` and `Check passed`. A line `Refreshed change table in docs/superpowers/plans/2026-10-09-germany-additional-audit.md` (or `Plan: no audit plan in progress for GER_ADDITIONAL`) is expected: `-Check` refreshes the audit plan of the same file, and that table returns to the audit's own changes once this plan is committed.
- [x] 6. Fill "Outcome", set `Status: DONE`, and report the `-Check` result together with the follow-up from "Decisions" (the header sentence in `INEX_GER_names_divisions.txt`).
- [ ] 7. After the user confirms: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document GER assault gun, brigade, penal and Imperial namelists"`.

## Docs payload
Find each place by its text, not by a line number. If a "current text" below is not in the file exactly as shown, stop and report.

### README.md row
No change.

### Workshop cross-reference row
In `WORKSHOP_DESCRIPTION_GUIDELINES.md`, replace the row that starts with `` | `INEX_GER_ADDITIONAL_names_divisions.txt` ``. Current text:

```
| `INEX_GER_ADDITIONAL_names_divisions.txt` | Germany (Extra) | `GER` | Included (Heavy battalions, Panzer brigades, Volksgrenadier/Reserve/Grenadier series, Luftwaffe field & Flak, Festungen, Kampfgruppen, Volkssturm, SA, Freikorps, Schutztruppe, Reichsbanner, Red Front, Foreign Legions) |
```

New text:

```
| `INEX_GER_ADDITIONAL_names_divisions.txt` | Germany (Extra) | `GER` | Included (Heavy battalions, Panzer, infantry & Sturmgeschütz brigades, Volksgrenadier/Reserve/Grenadier series, Luftwaffe field & Flak, Festungen, Kampfgruppen, penal units, Volkssturm, SA, Freikorps, Schutztruppe, Reichsbanner, Red Front, Foreign Legions, Imperial Sturm-Bataillone & Landwehr) |
```

### Workshop `[b]Germany[/b]` block
In the bbcode block of `WORKSHOP_DESCRIPTION_GUIDELINES.md`, keep the heading line and the first bullet, and replace the second and third bullets. Current text:

```
- Festungen, Kampfgruppen, Volksgrenadier, Luftwaffe field & Flak divisions, heavy battalions, and Panzer brigades
- Ideology suites: Waffen-SS, SA & Volkssturm (fascist), Imperial Guard & Freikorps, Reichsbanner, and Red Army & Red Front
```

New text:

```
- Festungen, Kampfgruppen, Volksgrenadier, Luftwaffe field & Flak divisions, heavy battalions, Panzer, infantry and Sturmgeschütz brigades ([i]Heeres-Sturmartillerie-Brigade 667[/i]), and penal units ([i]Afrika-Division 999[/i])
- Ideology suites: Waffen-SS, SA & Volkssturm (fascist), Imperial Guard, Sturm-Bataillone, Landwehr & Freikorps ([i]Sturm-Bataillon Nr. 5 (Rohr)[/i]), Reichsbanner, and Red Army & Red Front
```

### wiki/Germany-Additional.md
Six edits.

1. Under `## Historical Overview`, replace the list of five bullets. Current text:

```
- **Numbered series:** heavy tank battalions, Panzer brigades, Reserve, Volksgrenadier and Grenadier divisions, Luftwaffe field and Flak divisions.
- **Garrisons and fortresses:** city commands and the 1944–45 Festungen.
- **Kampfgruppen.**
- **Paramilitaries:** one militia list per ideology.
- **Foreign legions.**
```

New text:

```
- **Numbered series:** heavy tank battalions, Panzer and Sturmgeschütz brigades, Reserve, Volksgrenadier and Grenadier divisions, Luftwaffe field and Flak divisions.
- **Garrisons and fortresses:** city commands and the 1944–45 Festungen.
- **Kampfgruppen and independent brigades.**
- **Penal units:** the Bewährungstruppe 500 and Division 999.
- **Paramilitaries:** one militia list per ideology.
- **Foreign legions.**
- **Imperial series:** the Sturm-Bataillone of 1916–18 and the Landwehr divisions of 1914–18.
```

2. In the "Ideology gating" list, insert one line after the line `- **Neutrality:** Freikorps.`:

```
- **Neutrality and democratic:** Imperial Storm Battalions and Imperial Landwehr Divisions.
```

3. In the table under `## Namelist Groups`, insert rows in three places.

After the `GER_ARM_03` row:

```
| `GER_STUG_01` | Assault Gun Brigades | light_armor, medium_armor, heavy_armor, modern_armor | `Sturmgeschütz-Brigade %d` |
```

After the `GER_KAMPFGRUPPE_01` row:

```
| `GER_BRIG_01` | Infantry Brigades | infantry, motorized | `Grenadier-Brigade %d` |
| `GER_PEN_01` | Penal Units | penal_battalion, infantry | `Bewährungs-Bataillon %d` |
```

After the `GER_LEG_01` row (the last row):

```
| `GER_STURM_01` | Imperial Storm Battalions | infantry, ranger_battalion | `Sturm-Bataillon Nr. %d` |
| `GER_LANDWEHR_01` | Imperial Landwehr Divisions | infantry, militia | `%d. Landwehr-Division` |
```

4. After the note that begins `` > **Note:** `GER_PANZERARTILLERIE_DIVISION_01` uses ``, insert a blank line and this note:

```
> **Note:** `GER_PEN_01` overrides the vanilla tag. Vanilla ships it without names and locks it behind the focus `GER_strafbataillon`. INEX drops the focus lock, and the focus still names its penal divisions from this group.
```

5. Under `## Group Details`, insert sections in two places, each followed by a blank line.

After the `GER_ARM_03` section, directly before the next `###` heading (the one for `GER_PANZERARTILLERIE_DIVISION_01`):

```
### `GER_STUG_01` — Assault Gun Brigades
The Sturmartillerie of the Heer on its real numbers, *Sturmgeschütz-Brigade 177* to *914*. The independent Sturmgeschütz-Abteilungen were renamed brigades on 14 February 1944 and stayed at battalion strength (31 guns, later 45). The brigades given an escort grenadier battery later in 1944 appear as *Heeres-Sturmartillerie-Brigaden* (*236*, *239*, *667*), and *184* and *185* as *Heeres-Sturmgeschütz-Brigaden*. The list closes with *Sturmgeschütz-Lehr-Brigade 920*, *Sturmartillerie-Lehr-Brigade 111* and *Sturmgeschütz-Brigade 'Schill'*, the Luftwaffe's *Fallschirm-Sturmgeschütz-Brigaden 11*, *12* and *21*, and the *Sturmpanzer-Abteilungen 216–219*.
```

After the `GER_KAMPFGRUPPE_01` section, directly before the heading `### Militias`:

```
### `GER_BRIG_01` — Infantry Brigades
Independent brigades for small infantry and motorized templates:
- The *Grenadier-Brigaden* of summer 1944 (*193*, *388*, *1131–1136*) and the *Grenadier-Lehr-Brigade*.
- *Lehr-Brigade (mot.) 900* and the *Schnelle Brigaden* (*20*, *30*, *West*).
- Mountain, ski and bicycle brigades (*Gebirgsjäger-Brigade 139*, *MG-Ski-Brigade Finnland*, *Radfahr-Jäger-Brigade 10*).
- *Brigade Lötzen* of 1939 and the *Sicherungs-Brigaden*.
- Luftwaffe and Kriegsmarine ground brigades (*Fallschirmjäger-Brigade Ramcke*, *Marine-Schützen-Brigade Nord*).

Armoured brigades are in `GER_ARM_03`, fortress brigades in `GER_FORT_01`.

### `GER_PEN_01` — Penal Units
Overrides the vanilla group, which has no names. The vanilla focus `GER_strafbataillon` names its penal divisions from this list:
- The probation battalions of the Bewährungstruppe 500 (*Infanterie-Bataillon z.b.V. 500*, *540*, *550*, *560*, *561*).
- *Afrika-Brigade 999* and *Afrika-Division 999*.
- The 23 *Festungs-Infanterie-Bataillone 999* that served in Greece from 1943.

Overflow uses *Bewährungs-Bataillon*, the Wehrmacht's own term.
```

6. At the end of the file, after the `GER_LEG_01` section, append a blank line and:

```
### `GER_STURM_01` — Imperial Storm Battalions (neutrality/democratic)
The army-level assault battalions of 1916–18, *Sturm-Bataillon Nr. 1* to *Nr. 18*, with *Sturm-Bataillon Nr. 5 (Rohr)*, *Jäger-Sturm-Bataillon Nr. 3* and the Bavarian *Nr. 6* and *Nr. 15*. Number 13 never grew beyond a company and is left to the overflow.

### `GER_LANDWEHR_01` — Imperial Landwehr Divisions (neutrality/democratic)
The Landwehr divisions of 1914–18 on their real numbers (*1.* to *85. Landwehr-Division*), a second-line list for the Imperial path:
- The Württemberg (*2.*, *7.*, *26.*) and Saxon (*45.–47.*) divisions with their state names.
- The three Bavarian Landwehr divisions.
- The divisions of 1914–15 under the names of their first commanders (*Landwehr-Division Goltz*, *Landwehr-Division Bredow*).
```

### wiki/Home.md row
In the Germany (Additional) row change the group count `19` to `24`. New text of the row:

```
| [Germany (Additional)](Germany-Additional) | `GER` | 24 | `INEX_GER_ADDITIONAL_names_divisions.txt` |
```

### wiki/_Sidebar.md line
No change.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails (an `-After group ... not found` error means an audit plan was applied first); `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a "current text" of the docs payload is not in the file as shown; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Proofreader (`inex-code-reviewer`, no web calls) read all 184 names and reported no spelling, case or diacritic error. It raised one finding and four doubts. None changed the batch:
- `7. (Württembergische) Landwehr-Division`: the proofreader recalled the 7th as Prussian. Kept. A planner lookup settled it: en.wikipedia "7th Landwehr Division (German Empire)" says the division was raised in the Kingdom of Württemberg, and GenWiki (LIR 120) gives "2. (Württembergische) Landwehr-Division" from 19 December 1915.
- `Division Mühlenfels` (the proofreader could not place it): kept. Research run 2 fetched en.wikipedia "9th Landwehr Division": formed in January 1915 as Division Mühlenfels, numbered on 14 February 1915.
- `Radfahr-Jäger-Brigade 10`, `Marine-Schützen-Brigade Nord`, `Brigade 1005` (not confirmed from memory): kept. All three are on the fetched en.wikipedia "List of German brigades in World War II".
- `Infanterie-Bataillon z.b.V. 500` (the proofreader thought 500 might have carried another form): kept. It is the form on the Lexikon der Wehrmacht index of Bewährungseinheiten, with the formation date 1 April 1941.
- `I. Festungs-Infanterie-Bataillon 999` (the numeral reads like an ordinal): kept. The Bundesarchiv description of RH 26-999 counts 23 Festungs-Infanterie-Bataillone 999, and unit records quoted on feldgrau.net write "V. Festungs-Infanterie-Bataillon 999".

The implementer does not re-judge these. The batch and the docs payload were also run in memory against the current files: the batch gives the summary under "Kept on judgment", every "current text" is present, and the wiki rows match the groups.

## Outcome
2026-10-09: batch applied and docs synced. `-Check GER_ADDITIONAL`: `Validate: OK`, 373 tests passed, `GROUPS=24 AUTHORED=548/918 FLAGS=28` (`PLACEHOLDER_ENTRIES x14, LOW_DEPTH x13, POLITICAL_ENTRY x1`), `Diff vs HEAD: 5 group(s) changed, +184 -0 name(s)`, `Check passed`. No deviations from the plan. Step 7 (wiki push) waits for the user's confirmation. Follow-up: the header sentence about `GER_PEN_01` in `INEX_GER_names_divisions.txt` is handled by `2026-10-09-germany-audit.md`.

## Edit batch
Applied by `build.ps1 -EditNames GER_ADDITIONAL -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{
  "addGroup": true,
  "group": "GER_STUG_01",
  "after": "GER_ARM_03",
  "selector": "Assault Gun Brigades",
  "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "Sturmgeschütz-Brigade %d",
  "comment": "Sturmartillerie: the Heer's independent Sturmgeschütz-Abteilungen, renamed Brigaden on 14 February 1944 (battalion strength). Real numbers, own number series.",
  "add": [
    "# Heer: Sturmgeschütz-Brigaden on their real numbers, with the Heeres-Sturmartillerie and Heeres-Sturmgeschütz designations of 1944",
    "177=Sturmgeschütz-Brigade %d",
    "184=Heeres-Sturmgeschütz-Brigade %d",
    "185=Heeres-Sturmgeschütz-Brigade %d",
    "189=Sturmgeschütz-Brigade %d",
    "190=leichte Sturmgeschütz-Brigade %d",
    "191=Sturmgeschütz-Brigade %d",
    "201=Sturmgeschütz-Brigade %d",
    "202=Heeres-Sturmartillerie-Brigade %d",
    "203=Sturmgeschütz-Brigade %d",
    "209=Sturmgeschütz-Brigade %d",
    "210=Sturmgeschütz-Brigade %d",
    "226=Heeres-Sturmartillerie-Brigade %d",
    "228=Sturmgeschütz-Brigade %d",
    "232=Sturmgeschütz-Brigade %d",
    "236=Heeres-Sturmartillerie-Brigade %d",
    "237=Sturmgeschütz-Brigade %d",
    "239=Heeres-Sturmartillerie-Brigade %d",
    "242=Sturmgeschütz-Brigade %d",
    "243=Heeres-Sturmartillerie-Brigade %d",
    "244=Sturmgeschütz-Brigade %d",
    "245=Sturmgeschütz-Brigade %d",
    "249=Heeres-Sturmartillerie-Brigade %d",
    "259=Sturmgeschütz-Brigade %d",
    "261=Heeres-Sturmartillerie-Brigade %d",
    "270=Sturmgeschütz-Brigade %d",
    "276=Sturmgeschütz-Brigade %d",
    "277=Heeres-Sturmartillerie-Brigade %d",
    "278=Sturmgeschütz-Brigade %d",
    "279=Sturmgeschütz-Brigade %d",
    "280=Sturmgeschütz-Brigade %d",
    "281=Sturmgeschütz-Brigade %d",
    "286=Sturmgeschütz-Brigade %d",
    "300=Heeres-Sturmartillerie-Brigade %d",
    "301=Sturmgeschütz-Brigade %d",
    "303=Heeres-Sturmartillerie-Brigade %d",
    "311=Sturmgeschütz-Brigade %d",
    "322=Sturmgeschütz-Brigade %d",
    "325=Sturmgeschütz-Brigade %d",
    "341=Sturmgeschütz-Brigade %d",
    "393=Heeres-Sturmartillerie-Brigade %d",
    "394=Sturmgeschütz-Brigade %d",
    "395=Sturmgeschütz-Brigade %d",
    "396=Sturmgeschütz-Brigade %d",
    "397=Sturmgeschütz-Brigade %d",
    "398=Sturmgeschütz-Brigade %d",
    "600=Heeres-Sturmartillerie-Brigade %d",
    "667=Heeres-Sturmartillerie-Brigade %d",
    "901=Sturmgeschütz-Brigade %d",
    "902=Sturmgeschütz-Brigade %d",
    "904=Sturmgeschütz-Brigade %d",
    "905=Heeres-Sturmartillerie-Brigade %d",
    "907=Sturmgeschütz-Brigade %d",
    "909=Sturmgeschütz-Brigade %d",
    "911=Heeres-Sturmartillerie-Brigade %d",
    "912=Heeres-Sturmartillerie-Brigade %d",
    "914=Sturmgeschütz-Brigade %d",
    "920=Sturmgeschütz-Lehr-Brigade %d",
    "# Lehr and named brigades",
    "951=Sturmartillerie-Lehr-Brigade 111",
    "952=Sturmgeschütz-Brigade 'Schill'",
    "# Luftwaffe: Fallschirm-Sturmgeschütz-Brigaden (designations of June 1944 and January 1945)",
    "953=Fallschirm-Sturmgeschütz-Brigade 11",
    "954=Fallschirm-Sturmgeschütz-Brigade 12",
    "955=Fallschirm-Sturmgeschütz-Brigade 21",
    "# Panzertruppe: Sturmpanzer-Abteilungen (Sturmpanzer IV)",
    "956=Sturmpanzer-Abteilung 216",
    "957=Sturmpanzer-Abteilung 217",
    "958=Sturmpanzer-Abteilung 218",
    "959=Sturmpanzer-Abteilung 219"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_BRIG_01",
  "after": "GER_KAMPFGRUPPE_01",
  "selector": "Infantry Brigades",
  "addType": ["infantry", "motorized"],
  "fallback": "Grenadier-Brigade %d",
  "comment": "Independent Heer, Luftwaffe and Kriegsmarine brigades for small infantry and motorized templates. Real numbers are written into the names. Armoured brigades are in GER_ARM_03, fortress brigades in GER_FORT_01.",
  "add": [
    "# Grenadier-Brigaden of summer 1944",
    "1=Grenadier-Brigade 193",
    "2=Grenadier-Brigade 388",
    "3=Grenadier-Brigade 503",
    "4=Grenadier-Brigade 761",
    "5=Grenadier-Brigade 1131",
    "6=Grenadier-Brigade 1132",
    "7=Grenadier-Brigade 1133",
    "8=Grenadier-Brigade 1134",
    "9=Grenadier-Brigade 1135",
    "10=Grenadier-Brigade 1136",
    "11=Grenadier-Lehr-Brigade",
    "# Motorized and fast brigades",
    "12=Lehr-Brigade (mot.) 900",
    "13=Grenadier-Brigade (mot.) 92",
    "14=Grenadier-Brigade (mot.) 1027",
    "15=Schnelle Brigade 20",
    "16=Schnelle Brigade 30",
    "17=Schnelle Brigade West",
    "# Mountain, ski and bicycle brigades",
    "18=Gebirgsjäger-Brigade 139",
    "19=1. Skijäger-Brigade",
    "20=MG-Ski-Brigade Finnland",
    "21=Radfahr-Aufklärungs-Brigade Norwegen",
    "22=Radfahr-Jäger-Brigade 10",
    "# Border and security brigades",
    "23=Brigade Lötzen",
    "24=Sicherungs-Brigade 74",
    "25=Sicherungs-Brigade 201",
    "26=Sicherungs-Brigade 202",
    "27=Sicherungs-Brigade 203",
    "# Luftwaffe and Kriegsmarine ground brigades",
    "28=Fallschirmjäger-Brigade Ramcke",
    "29=Marine-Schützen-Brigade Nord",
    "30=Marine-Brigade Weber",
    "# Emergency brigades of 1945",
    "31=Brigade 1005",
    "32=Brigade z.b.V. 100"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_PEN_01",
  "after": "GER_BRIG_01",
  "selector": "Penal Units",
  "addType": ["penal_battalion", "infantry"],
  "fallback": "Bewährungs-Bataillon %d",
  "comment": "Overrides vanilla GER_PEN_01, which has no names and a focus lock. The vanilla focus GER_strafbataillon names its locked template from this group. Bewährungstruppe 500 and Division 999; real numbers are written into the names.",
  "add": [
    "# Bewährungstruppe 500: probation battalions (1941)",
    "1=Infanterie-Bataillon z.b.V. 500",
    "2=Infanterie-Bataillon z.b.V. 540",
    "3=Infanterie-Bataillon z.b.V. 550",
    "4=Infanterie-Bataillon z.b.V. 560",
    "5=Infanterie-Bataillon z.b.V. 561",
    "# Division 999 (1942-43)",
    "6=Afrika-Brigade 999",
    "7=Afrika-Division 999",
    "# Festungs-Infanterie-Bataillone 999 (Greece, from June 1943)",
    "8=I. Festungs-Infanterie-Bataillon 999",
    "9=II. Festungs-Infanterie-Bataillon 999",
    "10=III. Festungs-Infanterie-Bataillon 999",
    "11=IV. Festungs-Infanterie-Bataillon 999",
    "12=V. Festungs-Infanterie-Bataillon 999",
    "13=VI. Festungs-Infanterie-Bataillon 999",
    "14=VII. Festungs-Infanterie-Bataillon 999",
    "15=VIII. Festungs-Infanterie-Bataillon 999",
    "16=IX. Festungs-Infanterie-Bataillon 999",
    "17=X. Festungs-Infanterie-Bataillon 999",
    "18=XI. Festungs-Infanterie-Bataillon 999",
    "19=XII. Festungs-Infanterie-Bataillon 999",
    "20=XIII. Festungs-Infanterie-Bataillon 999",
    "21=XIV. Festungs-Infanterie-Bataillon 999",
    "22=XV. Festungs-Infanterie-Bataillon 999",
    "23=XVI. Festungs-Infanterie-Bataillon 999",
    "24=XVII. Festungs-Infanterie-Bataillon 999",
    "25=XVIII. Festungs-Infanterie-Bataillon 999",
    "26=XIX. Festungs-Infanterie-Bataillon 999",
    "27=XX. Festungs-Infanterie-Bataillon 999",
    "28=XXI. Festungs-Infanterie-Bataillon 999",
    "29=XXII. Festungs-Infanterie-Bataillon 999",
    "30=XXIII. Festungs-Infanterie-Bataillon 999"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_STURM_01",
  "selector": "Imperial Storm Battalions",
  "addType": ["infantry", "ranger_battalion"],
  "fallback": "Sturm-Bataillon Nr. %d",
  "canUse": "OR = { has_government = neutrality has_government = democratic }",
  "comment": "# ===== Imperial numbered series (neutrality and democratic) =====\n\nThe army-level Sturm-Bataillone of 1916-18 on their real numbers. Nr. 13 never grew beyond a company and has no entry.",
  "add": [
    "# Sturm-Bataillone of the Imperial German Army (1916-18)",
    "1=Sturm-Bataillon Nr. %d",
    "2=Sturm-Bataillon Nr. %d",
    "3=Jäger-Sturm-Bataillon Nr. %d",
    "4=Sturm-Bataillon Nr. %d",
    "5=Sturm-Bataillon Nr. %d (Rohr)",
    "6=Kgl. Bayer. Sturm-Bataillon Nr. %d",
    "7=Sturm-Bataillon Nr. %d",
    "8=Sturm-Bataillon Nr. %d",
    "9=Sturm-Bataillon Nr. %d",
    "10=Sturm-Bataillon Nr. %d",
    "11=Sturm-Bataillon Nr. %d",
    "12=Sturm-Bataillon Nr. %d",
    "14=Sturm-Bataillon Nr. %d",
    "15=Kgl. Bayer. Sturm-Bataillon Nr. %d",
    "16=Sturm-Bataillon Nr. %d",
    "17=Sturm-Bataillon Nr. %d",
    "18=Sturm-Bataillon Nr. %d"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_LANDWEHR_01",
  "selector": "Imperial Landwehr Divisions",
  "addType": ["infantry", "militia"],
  "fallback": "%d. Landwehr-Division",
  "canUse": "OR = { has_government = neutrality has_government = democratic }",
  "comment": "The Landwehr divisions of 1914-18 on their real numbers, the Bavarian series, and the divisions of 1914-15 under the names of their first commanders.",
  "add": [
    "# Landwehr-Divisionen of 1914-18 on their real numbers",
    "1=%d. Landwehr-Division",
    "2=%d. (Württembergische) Landwehr-Division",
    "3=%d. Landwehr-Division",
    "4=%d. Landwehr-Division",
    "5=%d. Landwehr-Division",
    "7=%d. (Württembergische) Landwehr-Division",
    "8=%d. Landwehr-Division",
    "9=%d. Landwehr-Division",
    "10=%d. Landwehr-Division",
    "11=%d. Landwehr-Division",
    "12=%d. Landwehr-Division",
    "13=%d. Landwehr-Division",
    "14=%d. Landwehr-Division",
    "15=%d. Landwehr-Division",
    "16=%d. Landwehr-Division",
    "17=%d. Landwehr-Division",
    "18=%d. Landwehr-Division",
    "19=%d. Landwehr-Division",
    "20=%d. Landwehr-Division",
    "21=%d. Landwehr-Division",
    "22=%d. Landwehr-Division",
    "23=%d. Landwehr-Division",
    "25=%d. Landwehr-Division",
    "26=%d. (Württembergische) Landwehr-Division",
    "38=%d. Landwehr-Division",
    "44=%d. Landwehr-Division",
    "45=%d. Landwehr-Division (1. Königlich Sächsische)",
    "46=%d. Landwehr-Division (2. Königlich Sächsische)",
    "47=%d. Landwehr-Division (3. Königlich Sächsische)",
    "48=%d. Landwehr-Division",
    "85=%d. Landwehr-Division",
    "# Bavarian Landwehr divisions (their own number series)",
    "901=1. Kgl. Bayer. Landwehr-Division",
    "902=2. Kgl. Bayer. Landwehr-Division",
    "903=6. Kgl. Bayer. Landwehr-Division",
    "# Divisions of 1914-15 under the names of their first commanders",
    "911=Landwehr-Division Goltz",
    "912=Landwehr-Division Bredow",
    "913=Division Waldow",
    "914=Landwehr-Division Breugel",
    "915=Division Mühlenfels"
  ]
}
```
