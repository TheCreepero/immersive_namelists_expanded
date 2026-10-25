# Germany (GER) Namelist Plan - 2026-10-25

Status: DONE

File: `common/units/names_divisions/zz_INEX_GER_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Germany has 56 INEX groups in three files: `zz_INEX_GER_names_divisions.txt` (22 groups, 1438 names: the Heer, garrison and the ideology division suites), `zz_INEX_GER_SS_names_divisions.txt` (10) and `zz_INEX_GER_ADDITIONAL_names_divisions.txt` (24). The user asked for two things: a coastal garrison list ("Grenzwacht?") and several new lists for the alternate-history paths (monarchy, democracy, communism). This plan adds eleven new groups, all to the main file, which goes from 22 to 33 groups and from 1438 to 1733 names:
- two universal lists: Coastal Defense Divisions and Border Guard Divisions;
- three monarchist lists: Jäger, Kampfwagen (A7V) and naval infantry;
- three democratic lists: the Reichswehr's Land divisions, the Volkswehr, and Panzer divisions named after democrats;
- three communist lists: workers' divisions, Red Panzer divisions and Red sailors.

No existing group is changed and no vanilla tag is reused. Written against commit `11b2313`.

## Decisions
All final.

**The user's policy answers (2026-10-25):**
- Coastal and border are two lists. *Grenzwacht* was the 1939 land-border watch on the Westwall; coastal defence was *Küstenverteidigung*.
- The alternate-history options are branch lists per ideology. Each path gains the arms it lacked beside its catch-all list.
- Plausible extrapolation is allowed, anchored in real people, places, events and formations. Every extrapolated entry is under "Author confirmation".
- Pre-1945 roots only: no Bundeswehr or NVA models, and no person known only after 1945.

**One file, one plan.** `-EditNames <KEY> -Batch` applies a plan to one file key. All eleven groups go in the main file:
- Guide §2 gives the main file the garrison list and the ideology division suites.
- The two universal lists go after `GER_GAR_01`, in section 5.
- Each ideology's lists go after that ideology's existing groups (sections 7, 8 and 9).

**Dropped on purpose.**
- *Imperial Reserve Divisions* (the 1914-18 Reserve-Divisionen). The researcher could reach no roster, and its designations stayed unverified. A numbered Imperial series would also belong in the ADDITIONAL file beside `GER_LANDWEHR_01`, so it is left for a later plan.
- Democratic or communist mountain and airborne lists: research found nothing real to anchor them on.
- The Royal Bavarian, Saxon and Württemberg contingents: `GER_MONINF_01` already has them (*1.-23. Kgl. Bayer. Division*, the *Kgl. Sächs.* and Württemberg divisions).
- Grenzschutz Ost and Grenzschutz Nord: already in `GER_MIL_01` (Freikorps).

**Gating** (`can_use` only with `has_government` [NAM-003]):
- `GER_COAST_01`, `GER_BORDER_01`: `always = yes`. They carry administrative Heer designations and regional names only, as the basic Heer lists do.
- `GER_MONJAG_01`, `GER_MONPZ_01`, `GER_MONMAR_01`: `OR = { has_government = neutrality has_government = democratic }`, the gate of every existing Imperial list.
- `GER_REPINF_01`, `GER_REPDEF_01`, `GER_REPPZ_01`: `has_government = democratic`.
- `GER_REDINF_01`, `GER_REDPZ_01`, `GER_REDMAR_01`: `has_government = communism`.

**Ideological separation.** These were left out of the democratic pools because they belong to another tradition:
- the Communist League and First International men of 1848 (August Willich, Johann Philipp Becker, Fritz and Mathilde Anneke);
- the conservative officers of 20 July (Stauffenberg, Beck, Tresckow).

These were left out of the communist pools:
- USPD or SPD men (Ernst Toller, Lothar Popp);
- anarchists (Erich Mühsam, Gustav Landauer);
- purge victims and post-war figures (Hans Kippenberger, Wilhelm Zaisser);
- the Waffen-SS honorifics *Florian Geyer* and *Michael Gaißmair*.

The 1917 mutineers and the Volksmarinedivision were USPD and MSPD as much as communist. The KPD claimed them as its tradition, and `GER_MEC_01_COMMUNIST` already holds *Volksmarinedivision* and *Kieler Matrosen*, so they stay in the communist list.

**No plain/named pairs.**
- The nine ideology lists are not plain/named pairs, like every existing ideology suite in the German files. They are alternatives to that ideology's catch-all list, each with its own designation (Jäger-, Kampfwagen-, Volkswehr-, Arbeiter-, Matrosen-Division).
- `GER_COAST_01` and `GER_BORDER_01` are garrison-type lists, not infantry, motorized, mechanized or armour lists.
- There are no `link_numbering_with` links. Each list runs its own number series, as German divisions of different designations did (*1. Panzer-Division* beside *1. Infanterie-Division*).

**division_types.**
- `GER_COAST_01`, `GER_BORDER_01`, `GER_REPINF_01`: `infantry`.
- `GER_REPDEF_01`: `infantry motorized`.
- `GER_REDINF_01`: `infantry militia` (workers' militia).
- `GER_MONJAG_01`: `infantry ranger_battalion mountaineers` (Jäger and the Alpenkorps).
- `GER_MONPZ_01`, `GER_REPPZ_01`, `GER_REDPZ_01`: `light_armor medium_armor heavy_armor modern_armor`.
- `GER_MONMAR_01`, `GER_REDMAR_01`: `marine`.
- When the game picks a group for a template by itself, it takes the available group with the most names among those that list a sub-unit of the template [NAM-021]. Every new group has fewer names than the main list of its arm (`GER_Inf_01` 308, `GER_Arm_02` 81, `GER_MAR_01` 37), so none of them takes over a template the player has not assigned.

**Keys and number format.**
- A real formation whose number is not its key is written as static text on keys 1, 2, 3 (the `GER_PEN_01` and `GER_BRIG_01` precedent): *716. (bodenständige) Infanterie-Division* at key 1, *I. Seebataillon* at key 1. Every honorific entry after them carries `%d`.
- `GER_MONJAG_01` keys 1-15 are the numbers of the Imperial Jäger-Bataillone Nr. 1-15. The Bavarian Jäger had their own series and are written *1.* and *2. Kgl. Bayer. Jäger-Division*, as `GER_MONINF_01` writes the Bavarian divisions.
- `GER_REPINF_01` keys 1-7 are the seven divisions of the 1921 Reichsheer, on their real numbers.

**Designations.**
- `GER_COAST_01`: *Küstenverteidigungs-Division*, built on the real WWI *Oberkommando der Küstenverteidigung* (1916-19) and the WWII *Küsten-Verteidigungs-Gruppen*. *Küstenschutz-Division* is not attested, and *Küstenschutz* today means flood protection. The static divisions use the attested *716. (bodenständige) Infanterie-Division* styling.
- `GER_BORDER_01`: *Grenzwacht-Division* for the western border, the 1939 Westwall term. *Grenzschutz-Division* for the eastern and southern border, where the commands were *Grenzschutz-Abschnittskommandos*. The fallback is *Grenzwacht-Division*.
- `GER_MONPZ_01`: *Kampfwagen-Division*. *Kampfwagen* is the attested Imperial term (the armed A7V against the unarmoured *Überlandwagen*); *Panzerkampfwagen* is later usage.
- `GER_REPINF_01`: the Land in brackets with a feminine adjective, *(Bayerische) Division*, after the Reichswehr's *19. (Bayerisches) Infanterie-Regiment*.
  - The Prussian divisions of 1921 are *(Preußische)*, like the Prussian regiments.
  - The expansion continues with the Weimar Länder, then the Prussian provinces.
- `GER_REDPZ_01`: *Rote Panzer-Division*, which matches the existing *Rote Division* of `GER_MEC_01_COMMUNIST`.
- `GER_REDMAR_01`: *Matrosen-Division*, because *Volksmarinedivision* is already used once.

**Collisions avoided.**
- These honorifics already stand in the main file, so the new lists do not use them:
  - *Eifel*, *Hunsrück*, *Riesengebirge*, *Erzgebirge* (`GER_LTINF_01`);
  - *Bodensee*, *Chemnitz*, *Wismar* (`GER_INF_02`);
  - *Allgäu* (`GER_Mnt_01`);
  - *Helgoland*, *Küstenwacht* (`GER_MAR_01`).
- *Aachen* and *Oberschlesien* (ADDITIONAL file) and every Fortress city of `GER_FORT_01` are also left out.
- *Siegfried* and *Wotan* (A7V names) are Waffen-SS honorifics, so they are left out.
- *König* (Bavarian Jäger) would add a third group to the shared identity 'König' (`IDENTITY_REPEAT`), so it is left out.
- English homonyms: *Jade* became *Jadebusen*; *Inn* became *Inntal*.

**Header.** The file header comment is not changed. It still describes the suites correctly: Imperial lists for the monarchist path, republican lists for the democratic path, Red Army lists for the communist path.

## Vanilla findings (`-InspectVanilla GER`)
| Vanilla tag | Vanilla state | Action |
|---|---|---|
| (none) | Vanilla GER has 23 groups, and none of them is a coastal, border, Jäger, armour-only or naval list for an ideology. | No vanilla tag is reused. All eleven groups are new tags, so no vanilla name merges into them [NAM-020]. |
| `GER_MEC_01_MONARNCHIST`, `GER_MONINF_01`, `GER_MONMOB_01`, `GER_Arm_01_ANTIFASCIST`, `GER_MEC_01_COMMUNIST` | Already overridden by INEX. | Not touched. New groups are placed after them. |
| `GER_MIL_01`-`GER_MIL_03` | Scripted by vanilla focuses; overridden in the ADDITIONAL file. | Not touched. |

## Group suite
| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `GER_COAST_01` | Coastal Defense Divisions | infantry | always | none | `%d. Küstenverteidigungs-Division` | 36 |
| `GER_BORDER_01` | Border Guard Divisions | infantry | always | none | `%d. Grenzwacht-Division` | 33 |
| `GER_MONJAG_01` | Imperial Jäger Divisions | infantry, ranger_battalion, mountaineers | neutrality or democratic | none | `%d. Jäger-Division` | 28 |
| `GER_MONPZ_01` | Imperial Panzer Divisions | light/medium/heavy/modern armor | neutrality or democratic | none | `%d. Kampfwagen-Division` | 25 |
| `GER_MONMAR_01` | Imperial Marine Divisions | marine | neutrality or democratic | none | `%d. Marine-Division` | 20 |
| `GER_REPINF_01` | Reichswehr Divisions | infantry | democratic | none | `%d. Division` | 28 |
| `GER_REPDEF_01` | Volkswehr Divisions | infantry, motorized | democratic | none | `%d. Volkswehr-Division` | 22 |
| `GER_REPPZ_01` | Republican Panzer Divisions | light/medium/heavy/modern armor | democratic | none | `%d. Panzer-Division` | 36 |
| `GER_REDINF_01` | Workers' Divisions | infantry, militia | communism | none | `%d. Arbeiter-Division` | 25 |
| `GER_REDPZ_01` | Red Panzer Divisions | light/medium/heavy/modern armor | communism | none | `%d. Rote Panzer-Division` | 30 |
| `GER_REDMAR_01` | Red Sailor Divisions | marine | communism | none | `%d. Matrosen-Division` | 12 |

Total: 11 groups, 295 names. File after the batch: 33 groups, 1733 names.

## Research record
- Two `inex-historical-researcher` runs in parallel:
  - Run A (coastal, border, Imperial Jäger, A7V armour, naval infantry, Imperial reserve) used about 38 web calls. Sources: en.wikipedia "716th Static Infantry Division (Wehrmacht)", "High Command of Coastal Defence", "526th Infantry Division", "Higher Command XXXI", "List of German divisions in World War II", "Alpenkorps (German Empire)", "A7V", "Marinekorps Flandern", "Seebataillon"; de.wikipedia "Liste deutscher Jägerbataillone vor 1918", "Jäger (Militär)", "Seebataillon"; Bundesarchiv "Das Marinekorps Flandern". GenWiki was blocked by bot protection, and several German list pages returned 404.
  - Run B (Reichswehr, republican armour and defence, Red armour, Red sailors, workers' militia) used about 12 web calls. Sources: de.wikipedia "Volksmarinedivision", "Republikanische Soldatenwehr", "Rote Ruhrarmee", "Interbrigaden", "Proletarische Hundertschaften"; en.wikipedia "1st-7th Division (Reichswehr)", "1st-3rd Cavalry Division (Reichswehr)", "Sicherheitspolizei (Weimar Republic)"; libcom.org "Order from the Commander-in-Chief of the Ruhr Red Army". Most persons are well documented, identified from general knowledge rather than looked up.
- Verified and used:
  - the static divisions 716, 709, 711, 702, 319, 332, 344, 347, 243;
  - the border commands (Grenzwacht 9, Köln; Grenzschutz 1, Deutsch-Krone; Freiburg; Küstrin);
  - the Jäger-Bataillone Nr. 1-15 and their titles; the Alpenkorps and its commander;
  - the A7V names and the 1918 actions;
  - the Seebataillone I-III, the Marine-Expeditionskorps, the Mobile Marine-Division, the Marine-Infanterie-Brigade and the Marinekorps Flandern;
  - the seven 1921 divisions and their Länder;
  - the Republikanische Soldatenwehr and the Prussian Schutzpolizei;
  - the Volksmarinedivision and its commanders Wieczorek, Tost and Radtke;
  - the Rote Ruhrarmee, the Märzkämpfe and the Hamburg rising.
- Unverified and left out:
  - the Imperial reserve roster;
  - the A7V names Käthe, Steinhardt and Uihlein (forum sources);
  - the Küsten-Jäger-Abteilung "Brandenburg";
  - the locations of the 703rd-715th and 719th divisions;
  - the Badische Volkswehr, the Regiment Reichstag and the Republikanische Schutztruppe;
  - Hettstedt, Bergedorf and Kippenberger.

## Author confirmation
Extrapolated or not fully verified entries in the batch, per group:
- `GER_COAST_01`:
  - The *(bodenständige)* styling on *702.*, *711.*, *344.*, *347.* and *243.* is extrapolated from the attested *716. (bodenständige) Infanterie-Division*. The static role of each division is sourced.
  - The designation *Küstenverteidigungs-Division* and all 27 sector names (*Sylt* ... *Kurische Nehrung*) are extrapolated. The places are real coast geography.
- `GER_BORDER_01`:
  - The hyphenation *Grenzwacht-Abschnittskommando* and *Grenzschutz-Abschnittskommando*: sources vary between *Abschnitts-Kommando* and *Abschnittskommando*.
  - *Grenzwacht-Division*, *Grenzschutz-Division* and all 29 sector names are extrapolated. The regions are real border regions of 1936-38.
- `GER_MONJAG_01`:
  - The Jäger-Division forms of keys 1-15 are extrapolated from the battalions' titles. *'Wurzen'* stands for Saxon Nr. 15, dissolved before 1914.
  - *Kgl. Bayer. Schneeschuh-Division* and *Württembergische Gebirgs-Division* are extrapolated from the Schneeschuh-Bataillone and the Württembergisches Gebirgs-Bataillon.
  - The honorifics *'Schwarze Jäger'*, *'Hermannstadt'*, *'Fleury'* and *'Kemmel'* are general knowledge of the Alpenkorps' battles, not fetched.
- `GER_MONPZ_01`:
  - The designation *Kampfwagen-Division* is extrapolated. All 25 honorifics are real tank names and actions.
- `GER_MONMAR_01`:
  - *Nieuport* and *Dixmuiden* are the German spellings of the period.
  - *'Glasenapp'* (Marine-Expeditionskorps 1904) is not verified in detail.
  - *'Taku'*, *'Peking'*, *'Somme'* and *'Arras'* are general knowledge of the battle record.
- `GER_REPINF_01`:
  - Every bracket except *(Bayerische)* and *(Sächsische)* is extrapolated: the eleven Länder and the ten Prussian provinces.
- `GER_REPDEF_01`:
  - The designation *Volkswehr-Division* and all 20 honorifics are extrapolated.
  - *Preußische Schutzpolizei* is used as a formation name.
- `GER_REPPZ_01`:
  - All 36 honorifics are well documented but were not looked up this session.
- `GER_REDINF_01`:
  - The designation *Arbeiter-Division* is extrapolated.
  - The roles of *Gotha*, *Suhl*, *Freital*, *Falkenstein*, *Zwickau*, *Wedding* and *Neukölln* as KPD strongholds are general knowledge.
- `GER_REDPZ_01`:
  - All honorifics are well documented but were not looked up this session.
  - *'Tschapaiew'* uses the older German spelling of the battalion's name.
- `GER_REDMAR_01`:
  - The 1917 mutineers *Willy Weber*, *Wilhelm Sachse* and *Hans Beckers* and the place *Schillig-Reede* are general knowledge.

## Kept on judgment
The eleven new groups add no flag. After the batch, `-Audit GER` shows `GROUPS=33 AUTHORED=1043/1733 FLAGS=8`. These are the same eight flags as before, all on existing groups and kept by earlier plans:
- `UNLINKED_MOBILE` x2 (`GER_MEC_01_MONARNCHIST`, `GER_MEC_01_COMMUNIST`). The lint reads the vanilla tag, not the role (tooling backlog).
- `PLACEHOLDER_ENTRIES` x2 (`GER_ALTINF_01`, `GER_GAR_01`) and `LOW_DEPTH` x1 (`GER_GAR_01`): real numbered entries that match the fallback pattern (tooling backlog).
- `NAME_LONG` x2 (`GER_MONINF_01`, `GER_MONMOB_01`): Imperial honour titles.
- `IDENTITY_REPEAT` x1: *'König'* and *'Prinz Karl von Bayern'* in both Imperial lists.

`GER_REDMAR_01` has 12 names and is not flagged `LOW_DEPTH`. The list was kept short rather than padded: the 1917-19 sailors' movement has no more named people or places that are verified and not already used.

The Workshop description grows from 12,064 to 12,203 characters (limit 17,000).

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GER -Batch docs\plans\2026-10-25-germany-namelist.md`. Expect eleven green lines and no `[ERROR]`:
  - `Added GER_COAST_01: "Coastal Defense Divisions" [infantry], 36 name(s)`
  - `Added GER_BORDER_01: "Border Guard Divisions" [infantry], 33 name(s)`
  - `Added GER_MONJAG_01: "Imperial Jäger Divisions" [infantry ranger_battalion mountaineers], 28 name(s)`
  - `Added GER_MONPZ_01: "Imperial Panzer Divisions" [light_armor medium_armor heavy_armor modern_armor], 25 name(s)`
  - `Added GER_MONMAR_01: "Imperial Marine Divisions" [marine], 20 name(s)`
  - `Added GER_REPINF_01: "Reichswehr Divisions" [infantry], 28 name(s)`
  - `Added GER_REPDEF_01: "Volkswehr Divisions" [infantry motorized], 22 name(s)`
  - `Added GER_REPPZ_01: "Republican Panzer Divisions" [light_armor medium_armor heavy_armor modern_armor], 36 name(s)`
  - `Added GER_REDINF_01: "Workers' Divisions" [infantry militia], 25 name(s)`
  - `Added GER_REDPZ_01: "Red Panzer Divisions" [light_armor medium_armor heavy_armor modern_armor], 30 name(s)`
  - `Added GER_REDMAR_01: "Red Sailor Divisions" [marine], 12 name(s)`
- [x] 2. `wiki/Germany.md`: make the four edits under "Docs payload".
- [x] 3. `powershell -File .\build.ps1 -SyncWiki GER`. Expect `Germany.md: 0 row(s) updated` and `wiki/Home.md: GER group count 22 -> 33`, with no `no row in wiki table` or `stale row` line. The table rows are written in step 2, because `-SyncWiki` does not add rows for new groups (tooling backlog).
- [x] 4. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: replace the cross-reference row and the `[b]Germany[/b]` bullets with the text under "Docs payload".
- [x] 5. `powershell -File .\build.ps1 -Check GER`. Expect:
  - `Validate: OK` and the tests passing;
  - `AUDIT SUMMARY GER: GROUPS=33 AUTHORED=1043/1733 FLAGS=8`, with the flags listed under "Kept on judgment";
  - `Diff vs HEAD: 11 group(s) changed, +295 -0 name(s)`;
  - `Check passed`.

  A line `Plan: no audit plan in progress for GER` is expected.
- [x] 6. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 7. Ship, on the user's word: move this plan to `docs/plans/archive/`, commit with the message `Add GER coastal, border and alternate-path division namelists`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document GER coastal, border and alternate-path namelists"`.

## Docs payload
Find each place by its text, not by a line number. If a "current text" below is not in the file exactly as shown, stop and report. `README.md`, `wiki/_Sidebar.md` and the other two German wiki pages do not change. The `wiki/Home.md` group count is written by `-SyncWiki GER` in step 3.

### Workshop cross-reference row
In `WORKSHOP_DESCRIPTION_GUIDELINES.md`, replace the row that starts with `` | `zz_INEX_GER_names_divisions.txt` ``. Current text:

```
| `zz_INEX_GER_names_divisions.txt` | Germany | `GER` | Included (Plain & Named infantry, motorized, Panzergrenadier and Panzer lists with garrison identities and nicknames, Jäger, Gebirgs, Fallschirmjäger, Marine, Cavalry, fascist Elite Formations, Imperial & Guard, Republican, Red Army) |
```

New text:

```
| `zz_INEX_GER_names_divisions.txt` | Germany | `GER` | Included (Plain & Named infantry, motorized, Panzergrenadier and Panzer lists with garrison identities and nicknames, Jäger, Gebirgs, Fallschirmjäger, Marine, Cavalry, Coastal Defense & Border Guard, fascist Elite Formations, Imperial & Guard with Jäger, Kampfwagen & Seebataillon lists, Republican, Reichswehr, Volkswehr & Republican Panzer, Red Army, Workers', Red Panzer & Red Sailor) |
```

### Workshop `[b]Germany[/b]` block
In the bbcode block of `WORKSHOP_DESCRIPTION_GUIDELINES.md`, keep the heading line and the first bullet, and replace the second and third bullets. Current text:

```
- Festungen, Kampfgruppen, Volksgrenadier, Luftwaffe field & Flak divisions, heavy battalions, Panzer, infantry and Sturmgeschütz brigades ([i]Heeres-Sturmartillerie-Brigade 667[/i]), and penal units ([i]Afrika-Division 999[/i])
- Ideology suites: Waffen-SS, SA & Volkssturm (fascist), Imperial Guard, Sturm-Bataillone, Landwehr & Freikorps ([i]Sturm-Bataillon Nr. 5 (Rohr)[/i]), Reichsbanner, and Red Army & Red Front
```

New text:

```
- Coastal defense and Grenzwacht border divisions ([i]716. (bodenständige) Infanterie-Division[/i]), Festungen, Kampfgruppen, Volksgrenadier, Luftwaffe field & Flak divisions, heavy battalions, Panzer, infantry and Sturmgeschütz brigades, and penal units ([i]Afrika-Division 999[/i])
- Ideology suites: Waffen-SS, SA & Volkssturm (fascist), Imperial Guard, Jäger, A7V Kampfwagen divisions, Sturm-Bataillone, Landwehr & Freikorps ([i]5. Kampfwagen-Division 'Mephisto'[/i]), Reichswehr, Volkswehr & Reichsbanner, and Red Army, Workers', Red Panzer & Red Front
```

### wiki/Germany.md
Four edits.

1. Under `## Historical Overview`, replace the ideology paragraph and its four bullets. Current text:

```
The basic lists are open to every government. Ideology-gated lists:
- **Fascist:** the Heer and Luftwaffe honour formations (*Großdeutschland*, *Feldherrnhalle*, *Hermann Göring*).
- **Monarchist (neutrality/democratic):** Imperial regiments and the Prussian Guard.
- **Democratic:** a republican army named after 1813, 1848/49 and Weimar figures.
- **Communist:** a Red Army named after German revolutionaries.
```

New text:

```
The basic lists, coastal defense and border guard included, are open to every government. Ideology-gated lists:
- **Fascist:** the Heer and Luftwaffe honour formations (*Großdeutschland*, *Feldherrnhalle*, *Hermann Göring*).
- **Monarchist (neutrality/democratic):**
  - Imperial regiments and the Prussian Guard;
  - the Jäger and the Alpenkorps;
  - Kampfwagen divisions named after the A7V tanks;
  - the Seebataillone.
- **Democratic:**
  - a republican army named after 1813, 1848/49 and Weimar figures;
  - the Reichswehr's Land divisions and the Volkswehr;
  - Panzer divisions named after democrats from 1848 to the resistance.
- **Communist:**
  - a Red Army named after German revolutionaries;
  - workers' divisions from the risings of 1920–23;
  - Red Panzer divisions and Red sailors.
```

2. In the table under `## Namelist Groups`, insert rows in four places.

After the `GER_GAR_01` row:

```
| `GER_COAST_01` | Coastal Defense Divisions | infantry | `%d. Küstenverteidigungs-Division` |
| `GER_BORDER_01` | Border Guard Divisions | infantry | `%d. Grenzwacht-Division` |
```

After the `GER_MONMOB_01` row:

```
| `GER_MONJAG_01` | Imperial Jäger Divisions | infantry, ranger_battalion, mountaineers | `%d. Jäger-Division` |
| `GER_MONPZ_01` | Imperial Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Kampfwagen-Division` |
| `GER_MONMAR_01` | Imperial Marine Divisions | marine | `%d. Marine-Division` |
```

After the `GER_Arm_01_ANTIFASCIST` row:

```
| `GER_REPINF_01` | Reichswehr Divisions | infantry | `%d. Division` |
| `GER_REPDEF_01` | Volkswehr Divisions | infantry, motorized | `%d. Volkswehr-Division` |
| `GER_REPPZ_01` | Republican Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panzer-Division` |
```

After the `GER_MEC_01_COMMUNIST` row (the last row):

```
| `GER_REDINF_01` | Workers' Divisions | infantry, militia | `%d. Arbeiter-Division` |
| `GER_REDPZ_01` | Red Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Rote Panzer-Division` |
| `GER_REDMAR_01` | Red Sailor Divisions | marine | `%d. Matrosen-Division` |
```

3. Under `## Group Details`, insert sections in two places, each followed by a blank line.

After the `GER_GAR_01` section, directly before the heading `` ### `GER_ELI_01` — Elite Formations (fascism) ``:

```
### `GER_COAST_01` — Coastal Defense Divisions
Opens with the static divisions that held the coasts of France, the Low Countries, the Channel Islands and Norway (*716. (bodenständige) Infanterie-Division*, *709.*, *319.*). The expansion is named after the *Küstenverteidigung*, the coastal defence command of 1916–19, and runs along the German coasts from *'Sylt'* to the *'Kurische Nehrung'*. Fortress cities are in the Fortress list of the Additional file.

### `GER_BORDER_01` — Border Guard Divisions
Opens with the border commands of 1939 that became divisions and corps (*Grenzwacht-Abschnittskommando 9*, *Grenzkommandantur Küstrin*). Then come:
- the *Grenzwacht* of the western border, from *'Emsland'* to *'Hegau'*;
- the *Grenzschutz* of the eastern and southern border, from *'Elchniederung'* to *'Berchtesgadener Land'*.
```

After the `GER_MONINF_01` / `GER_MONMOB_01` section, directly before the heading `` ### `GER_Arm_01_ANTIFASCIST` — Republican Divisions (democratic) ``:

```
### `GER_MONJAG_01` — Imperial Jäger Divisions (neutrality / democratic)
The Jäger-Bataillone Nr. 1–15 of 1914, raised to divisions on their numbers and titles (*1. Jäger-Division 'Graf Yorck von Wartenburg'*, *2. Pommersche Jäger-Division 'Fürst Bismarck'*). They are followed by:
- the Bavarian Jäger, the *Deutsches Alpenkorps* and the Württemberg mountain troops;
- divisions named after the Alpenkorps' commander and battles (*'Karfreit'*, *'Kemmel'*).

### `GER_MONPZ_01` — Imperial Panzer Divisions (neutrality / democratic)
An Imperial tank arm grown from the A7V detachments of 1918. Its *Kampfwagen-Divisionen* carry the names painted on the A7V tanks (*'Gretchen'*, *'Mephisto'*, *'Alter Fritz'*) and the names of their actions (*'Villers-Bretonneux'*). The A7V names *Siegfried* and *Wotan* are left out, because the Waffen-SS file already uses them.

### `GER_MONMAR_01` — Imperial Marine Divisions (neutrality / democratic)
The Kaiserliche Marine's naval infantry: the *I.–III. Seebataillon*, the *Marine-Expeditionskorps* of 1904 and the *Marinekorps Flandern*. *Marine-Divisionen* named after their stations and battles follow (*'Tsingtau'*, *'Taku'*, *'Nieuport'*).
```

4. Insert sections in two more places, each followed by a blank line.

After the `GER_Arm_01_ANTIFASCIST` section, directly before the heading `` ### `GER_MEC_01_COMMUNIST` — Red Army Divisions (communism) ``:

```
### `GER_REPINF_01` — Reichswehr Divisions (democratic)
The seven divisions of the 1921 Reichsheer on their numbers (*7. (Bayerische) Division*). The expansion raises one division for each of the other Länder, then one for each Prussian province (*8. (Badische) Division*, *19. (Ostpreußische) Division*). It writes the Land in brackets, as the Reichswehr's regiments did.

### `GER_REPDEF_01` — Volkswehr Divisions (democratic)
Opens with the *Republikanische Soldatenwehr* of 1918–19 and the Prussian *Schutzpolizei*. *Volkswehr-Divisionen* follow, named after the Länder and the Republic's defenders (*'Otto Braun'*, *'Albert Grzesinski'*, *'Weimarer Koalition'*).

### `GER_REPPZ_01` — Republican Panzer Divisions (democratic)
Panzer divisions named after:
- the revolution of 1848/49 (*'Franz Sigel'*, *'Rastatt'*);
- the liberals of the Empire (*'Rudolf Virchow'*);
- the Weimar Republic;
- the democratic resistance (*'Julius Leber'*, *'Weiße Rose'*).
```

At the end of the file, after the `GER_MEC_01_COMMUNIST` section, append a blank line and:

```
### `GER_REDINF_01` — Workers' Divisions (communism)
*Arbeiter-Divisionen* named after:
- the towns of the Rote Ruhrarmee of 1920 (*'Essen'*, *'Remscheid'*);
- the Märzkämpfe of 1921;
- the Hamburg rising of 1923 (*'Barmbek'*);
- the KPD's strongholds (*'Wedding'*).

### `GER_REDPZ_01` — Red Panzer Divisions (communism)
*Rote Panzer-Divisionen* named after:
- revolutions and risings (*'Novemberrevolution'*, *'Leuna'*);
- the Peasants' War (*'Bundschuh'*);
- the International Brigades (*'Tschapaiew'*);
- the communist resistance (*'Anton Saefkow'*, *'Rote Kapelle'*).

### `GER_REDMAR_01` — Red Sailor Divisions (communism)
*Matrosen-Divisionen* named after the naval mutinies of 1917 and 1918 (*'Max Reichpietsch'*, *'Albin Köbis'*) and the Volksmarinedivision of 1918–19.
```

## Stop conditions
Stop and report to the user, without researching or improvising, when:
- the batch fails;
- `-Check` fails after one retry of a fix this plan describes;
- a step has no command for what it asks;
- a "current text" of the docs payload is not in the file exactly as shown;
- a name in the output looks wrong;
- a flag appears that "Kept on judgment" does not list.

## Review
**Proofreader** (`inex-proofreader`, all 295 names, no web calls) found no definite error. It raised four doubts. The planner checked each one, and none changed the batch:
- `GER_MONJAG_01` key 6 *Schlesische Jäger-Division*: the proofreader recalled Nr. 6 as Thüringisches. Kept: de.wikipedia "Liste deutscher Jägerbataillone vor 1918" gives *2. Schlesisches Jäger-Bataillon Nr. 6*, Oels.
- `GER_MONJAG_01` key 11 *Kurhessische* and key 15 *'Wurzen'*: kept. The same page gives *Kurhessisches Jäger-Bataillon Nr. 11*, Marburg, and the Saxon *3. Jäger-Bataillon Nr. 15* "Wurzener Jäger" (1810-1900).
- `GER_MONPZ_01` *'Prinz August Wilhelm'* and *'Kronprinz Wilhelm'*: kept. en.wikipedia "A7V" lists *Kronprinz Wilhelm* for chassis 502/503 and *Prinz August Wilhelm* for 505.
- `GER_REDPZ_01` *'Tschapaiew'* (the proofreader suggested *Tschapajew*): kept. The battalion's German name was *Tschapaiew*, as in Alfred Kantorowicz's 1938 book *"Tschapaiew", das Bataillon der 21 Nationen* and the International Brigades Memorial Trust.

**Rehearsal.** The batch and the whole docs payload were applied to an export of `11b2313` outside the repository, and every "current text" was found once. Results on that copy:
- `-ValidateOnly`: all 21 files passed.
- `-SyncWiki GER`: `Germany.md: 0 row(s) updated`, `wiki/Home.md: GER group count 22 -> 33`.
- Test suites `Namelists`: 212 passed. `Documentation`: 29 passed.
- `-Audit GER`: as under "Kept on judgment".

The implementer does not re-judge any of these.

## Outcome
Date: 2026-10-25.

`-Check GER`: `Validate: OK`; tests 472 passed, 0 failed, 0 skipped; `AUDIT SUMMARY GER: GROUPS=33 AUTHORED=1043/1733 FLAGS=8` (UNLINKED_MOBILE x2, PLACEHOLDER_ENTRIES x2, NAME_LONG x2, IDENTITY_REPEAT x1, LOW_DEPTH x1, all listed under "Kept on judgment"); `Plan: no audit plan in progress for GER`; `Diff vs HEAD: 11 group(s) changed, +295 -0 name(s)`; `Check passed`.

Deviations: none.

## Edit batch
Applied by `build.ps1 -EditNames GER -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{
  "addGroup": true,
  "group": "GER_COAST_01",
  "after": "GER_GAR_01",
  "selector": "Coastal Defense Divisions",
  "addType": ["infantry"],
  "fallback": "%d. Küstenverteidigungs-Division",
  "comment": "Coastal defence on the model of the WWI Oberkommando der Küstenverteidigung and the static (bodenständige) divisions of the Atlantic Wall and Norway; own number series.",
  "add": [
    "# Static (bodenständige) divisions on the coasts of France, the Low Countries, the Channel Islands and Norway",
    "1=716. (bodenständige) Infanterie-Division",
    "2=709. (bodenständige) Infanterie-Division",
    "3=711. (bodenständige) Infanterie-Division",
    "4=702. (bodenständige) Infanterie-Division",
    "5=319. (bodenständige) Infanterie-Division",
    "6=332. (bodenständige) Infanterie-Division",
    "7=344. (bodenständige) Infanterie-Division",
    "8=347. (bodenständige) Infanterie-Division",
    "9=243. (bodenständige) Infanterie-Division",
    "# North Sea coast sectors, from the Danish border to the Ems",
    "10=%d. Küstenverteidigungs-Division 'Sylt'",
    "11=%d. Küstenverteidigungs-Division 'Föhr'",
    "12=%d. Küstenverteidigungs-Division 'Nordfriesland'",
    "13=%d. Küstenverteidigungs-Division 'Eiderstedt'",
    "14=%d. Küstenverteidigungs-Division 'Dithmarschen'",
    "15=%d. Küstenverteidigungs-Division 'Elbmündung'",
    "16=%d. Küstenverteidigungs-Division 'Cuxhaven'",
    "17=%d. Küstenverteidigungs-Division 'Wesermündung'",
    "18=%d. Küstenverteidigungs-Division 'Jadebusen'",
    "19=%d. Küstenverteidigungs-Division 'Wangerooge'",
    "20=%d. Küstenverteidigungs-Division 'Norderney'",
    "21=%d. Küstenverteidigungs-Division 'Borkum'",
    "22=%d. Küstenverteidigungs-Division 'Ostfriesland'",
    "23=%d. Küstenverteidigungs-Division 'Emsmündung'",
    "# Baltic coast sectors, from Flensburg to the Kurische Nehrung",
    "24=%d. Küstenverteidigungs-Division 'Flensburger Förde'",
    "25=%d. Küstenverteidigungs-Division 'Eckernförder Bucht'",
    "26=%d. Küstenverteidigungs-Division 'Fehmarn'",
    "27=%d. Küstenverteidigungs-Division 'Lübecker Bucht'",
    "28=%d. Küstenverteidigungs-Division 'Wismarbucht'",
    "29=%d. Küstenverteidigungs-Division 'Rostock'",
    "30=%d. Küstenverteidigungs-Division 'Darß'",
    "31=%d. Küstenverteidigungs-Division 'Rügen'",
    "32=%d. Küstenverteidigungs-Division 'Usedom'",
    "33=%d. Küstenverteidigungs-Division 'Pommersche Bucht'",
    "34=%d. Küstenverteidigungs-Division 'Frische Nehrung'",
    "35=%d. Küstenverteidigungs-Division 'Samland'",
    "36=%d. Küstenverteidigungs-Division 'Kurische Nehrung'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_BORDER_01",
  "after": "GER_COAST_01",
  "selector": "Border Guard Divisions",
  "addType": ["infantry"],
  "fallback": "%d. Grenzwacht-Division",
  "comment": "Border guard on the model of the 1939 Grenzwacht of the Westwall and the Grenzschutz commands of the eastern border; own number series.",
  "add": [
    "# Border commands of 1939 that became divisions or corps",
    "1=Grenzwacht-Abschnittskommando 9",
    "2=Grenzschutz-Abschnittskommando 1",
    "3=Grenzschutz-Abschnittskommando Freiburg",
    "4=Grenzkommandantur Küstrin",
    "# Grenzwacht of the western border, from the Ems to Lake Constance",
    "5=%d. Grenzwacht-Division 'Emsland'",
    "6=%d. Grenzwacht-Division 'Bentheim'",
    "7=%d. Grenzwacht-Division 'Selfkant'",
    "8=%d. Grenzwacht-Division 'Mosel'",
    "9=%d. Grenzwacht-Division 'Saar'",
    "10=%d. Grenzwacht-Division 'Bienwald'",
    "11=%d. Grenzwacht-Division 'Pfälzerwald'",
    "12=%d. Grenzwacht-Division 'Oberrhein'",
    "13=%d. Grenzwacht-Division 'Kaiserstuhl'",
    "14=%d. Grenzwacht-Division 'Markgräflerland'",
    "15=%d. Grenzwacht-Division 'Hochrhein'",
    "16=%d. Grenzwacht-Division 'Hegau'",
    "# Grenzschutz of the eastern and southern border, from East Prussia to the Alps",
    "17=%d. Grenzschutz-Division 'Elchniederung'",
    "18=%d. Grenzschutz-Division 'Masuren'",
    "19=%d. Grenzschutz-Division 'Johannisburger Heide'",
    "20=%d. Grenzschutz-Division 'Weichsel'",
    "21=%d. Grenzschutz-Division 'Netze'",
    "22=%d. Grenzschutz-Division 'Grenzmark'",
    "23=%d. Grenzschutz-Division 'Glatzer Bergland'",
    "24=%d. Grenzschutz-Division 'Isergebirge'",
    "25=%d. Grenzschutz-Division 'Zittauer Gebirge'",
    "26=%d. Grenzschutz-Division 'Oberlausitz'",
    "27=%d. Grenzschutz-Division 'Vogtland'",
    "28=%d. Grenzschutz-Division 'Fichtelgebirge'",
    "29=%d. Grenzschutz-Division 'Oberpfalz'",
    "30=%d. Grenzschutz-Division 'Bayerischer Wald'",
    "31=%d. Grenzschutz-Division 'Inntal'",
    "32=%d. Grenzschutz-Division 'Chiemgau'",
    "33=%d. Grenzschutz-Division 'Berchtesgadener Land'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_MONJAG_01",
  "after": "GER_MONMOB_01",
  "selector": "Imperial Jäger Divisions",
  "addType": ["infantry", "ranger_battalion", "mountaineers"],
  "fallback": "%d. Jäger-Division",
  "canUse": "OR = { has_government = neutrality has_government = democratic }",
  "comment": "The Imperial Jäger-Bataillone Nr. 1-15 raised to divisions on their numbers, with their titles, then the Bavarian Jäger and the Alpenkorps.",
  "add": [
    "# Jäger-Bataillone Nr. 1-15 of the Prussian, Saxon and Mecklenburg contingents",
    "1=%d. Jäger-Division 'Graf Yorck von Wartenburg'",
    "2=%d. Pommersche Jäger-Division 'Fürst Bismarck'",
    "3=%d. Brandenburgische Jäger-Division",
    "4=%d. Magdeburgische Jäger-Division",
    "5=%d. Jäger-Division 'von Neumann'",
    "6=%d. Schlesische Jäger-Division",
    "7=%d. Westfälische Jäger-Division",
    "8=%d. Rheinische Jäger-Division",
    "9=%d. Lauenburgische Jäger-Division",
    "10=%d. Hannoversche Jäger-Division",
    "11=%d. Kurhessische Jäger-Division",
    "12=%d. Kgl. Sächs. Jäger-Division",
    "13=%d. Kgl. Sächs. Jäger-Division",
    "14=%d. Großherzoglich Mecklenburgische Jäger-Division",
    "15=%d. Kgl. Sächs. Jäger-Division 'Wurzen'",
    "# Bavarian Jäger (own series), the Alpenkorps and Württemberg",
    "16=1. Kgl. Bayer. Jäger-Division",
    "17=2. Kgl. Bayer. Jäger-Division",
    "18=Deutsches Alpenkorps",
    "19=Kgl. Bayer. Schneeschuh-Division",
    "20=Württembergische Gebirgs-Division",
    "21=%d. Jäger-Division 'Schwarze Jäger'",
    "# The Alpenkorps' commander and battles",
    "22=%d. Jäger-Division 'Krafft von Dellmensingen'",
    "23=%d. Jäger-Division 'Dolomiten'",
    "24=%d. Jäger-Division 'Hermannstadt'",
    "25=%d. Jäger-Division 'Fleury'",
    "26=%d. Jäger-Division 'Karfreit'",
    "27=%d. Jäger-Division 'Matajur'",
    "28=%d. Jäger-Division 'Kemmel'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_MONPZ_01",
  "after": "GER_MONJAG_01",
  "selector": "Imperial Panzer Divisions",
  "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "%d. Kampfwagen-Division",
  "canUse": "OR = { has_government = neutrality has_government = democratic }",
  "comment": "An Imperial tank arm grown from the Sturm-Panzer-Kraftwagen-Abteilungen of 1918: divisions named after the A7V tanks and their actions.",
  "add": [
    "# The A7V Sturmpanzerwagen of 1918",
    "1=%d. Kampfwagen-Division 'Gretchen'",
    "2=%d. Kampfwagen-Division 'Faust'",
    "3=%d. Kampfwagen-Division 'Schnuck'",
    "4=%d. Kampfwagen-Division 'Baden I'",
    "5=%d. Kampfwagen-Division 'Mephisto'",
    "6=%d. Kampfwagen-Division 'Cyklop'",
    "7=%d. Kampfwagen-Division 'Lotti'",
    "8=%d. Kampfwagen-Division 'Hagen'",
    "9=%d. Kampfwagen-Division 'Nixe'",
    "10=%d. Kampfwagen-Division 'Heiland'",
    "11=%d. Kampfwagen-Division 'Elfriede'",
    "12=%d. Kampfwagen-Division 'Alter Fritz'",
    "13=%d. Kampfwagen-Division 'Herkules'",
    "14=%d. Kampfwagen-Division 'Prinz Oskar'",
    "15=%d. Kampfwagen-Division 'Prinz Eitel Friedrich'",
    "16=%d. Kampfwagen-Division 'Prinz August Wilhelm'",
    "17=%d. Kampfwagen-Division 'Kronprinz Wilhelm'",
    "18=%d. Kampfwagen-Division 'Adalbert'",
    "19=%d. Kampfwagen-Division 'Bulle'",
    "# The tank actions of 1918",
    "20=%d. Kampfwagen-Division 'St. Quentin'",
    "21=%d. Kampfwagen-Division 'Villers-Bretonneux'",
    "22=%d. Kampfwagen-Division 'Reims'",
    "23=%d. Kampfwagen-Division 'Frémicourt'",
    "24=%d. Kampfwagen-Division 'Iwuy'",
    "25=%d. Kampfwagen-Division 'Séranvillers'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_MONMAR_01",
  "after": "GER_MONPZ_01",
  "selector": "Imperial Marine Divisions",
  "addType": ["marine"],
  "fallback": "%d. Marine-Division",
  "canUse": "OR = { has_government = neutrality has_government = democratic }",
  "comment": "The Kaiserliche Marine's naval infantry: the Seebataillone, the expeditionary corps and the Marinekorps Flandern, then divisions named after their stations and battles.",
  "add": [
    "# Seebataillone and naval infantry formations, 1852-1918",
    "1=I. Seebataillon",
    "2=II. Seebataillon",
    "3=III. Seebataillon",
    "4=Marine-Expeditionskorps",
    "5=Mobile Marine-Division",
    "6=Marine-Infanterie-Brigade",
    "7=Marinekorps Flandern",
    "# East Asia and Flanders",
    "8=%d. Marine-Division 'Tsingtau'",
    "9=%d. Marine-Division 'Taku'",
    "10=%d. Marine-Division 'Peking'",
    "11=%d. Marine-Division 'Brügge'",
    "12=%d. Marine-Division 'Ostende'",
    "13=%d. Marine-Division 'Middelkerke'",
    "14=%d. Marine-Division 'Nieuport'",
    "15=%d. Marine-Division 'Dixmuiden'",
    "16=%d. Marine-Division 'Yser'",
    "17=%d. Marine-Division 'Somme'",
    "18=%d. Marine-Division 'Arras'",
    "# Commanders",
    "19=%d. Marine-Division 'von Schröder'",
    "20=%d. Marine-Division 'Glasenapp'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_REPINF_01",
  "after": "GER_Arm_01_ANTIFASCIST",
  "selector": "Reichswehr Divisions",
  "addType": ["infantry"],
  "fallback": "%d. Division",
  "canUse": "has_government = democratic",
  "comment": "The seven divisions of the 1921 Reichsheer on their numbers, then an expanded republican army raised by Land and Prussian province.",
  "add": [
    "# The divisions of the 1921 Reichsheer (Königsberg, Stettin, Berlin, Dresden, Stuttgart, Münster, München)",
    "1=%d. (Preußische) Division",
    "2=%d. (Preußische) Division",
    "3=%d. (Preußische) Division",
    "4=%d. (Sächsische) Division",
    "5=%d. (Württembergische) Division",
    "6=%d. (Preußische) Division",
    "7=%d. (Bayerische) Division",
    "# The other Länder of the Weimar Republic",
    "8=%d. (Badische) Division",
    "9=%d. (Hessische) Division",
    "10=%d. (Thüringische) Division",
    "11=%d. (Mecklenburgische) Division",
    "12=%d. (Oldenburgische) Division",
    "13=%d. (Braunschweigische) Division",
    "14=%d. (Anhaltische) Division",
    "15=%d. (Lippische) Division",
    "16=%d. (Hamburgische) Division",
    "17=%d. (Bremische) Division",
    "18=%d. (Lübeckische) Division",
    "# The Prussian provinces",
    "19=%d. (Ostpreußische) Division",
    "20=%d. (Pommersche) Division",
    "21=%d. (Brandenburgische) Division",
    "22=%d. (Schlesische) Division",
    "23=%d. (Oberschlesische) Division",
    "24=%d. (Hannoversche) Division",
    "25=%d. (Westfälische) Division",
    "26=%d. (Rheinische) Division",
    "27=%d. (Schleswig-Holsteinische) Division",
    "28=%d. (Hessen-Nassauische) Division"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_REPDEF_01",
  "after": "GER_REPINF_01",
  "selector": "Volkswehr Divisions",
  "addType": ["infantry", "motorized"],
  "fallback": "%d. Volkswehr-Division",
  "canUse": "has_government = democratic",
  "comment": "Defence forces of the Republic on the model of the 1918-19 Volkswehr and the Republikanische Soldatenwehr, named after the Länder and the Republic's defenders.",
  "add": [
    "# The Republic's own armed bodies, 1918-33",
    "1=Republikanische Soldatenwehr",
    "2=Preußische Schutzpolizei",
    "# The Länder",
    "3=%d. Volkswehr-Division 'Freistaat Preußen'",
    "4=%d. Volkswehr-Division 'Freistaat Bayern'",
    "5=%d. Volkswehr-Division 'Freistaat Sachsen'",
    "6=%d. Volkswehr-Division 'Volksstaat Württemberg'",
    "7=%d. Volkswehr-Division 'Republik Baden'",
    "8=%d. Volkswehr-Division 'Volksstaat Hessen'",
    "# Defenders of the Republic",
    "9=%d. Volkswehr-Division 'Otto Braun'",
    "10=%d. Volkswehr-Division 'Albert Grzesinski'",
    "11=%d. Volkswehr-Division 'Bernhard Weiß'",
    "12=%d. Volkswehr-Division 'Johannes Hoffmann'",
    "13=%d. Volkswehr-Division 'Erhard Auer'",
    "14=%d. Volkswehr-Division 'Wilhelm Keil'",
    "15=%d. Volkswehr-Division 'Rudolf Hilferding'",
    "16=%d. Volkswehr-Division 'Hugo Sinzheimer'",
    "17=%d. Volkswehr-Division 'Gustav Radbruch'",
    "18=%d. Volkswehr-Division 'Friedrich Stampfer'",
    "19=%d. Volkswehr-Division 'Wilhelm Sollmann'",
    "20=%d. Volkswehr-Division 'Weimarer Koalition'",
    "21=%d. Volkswehr-Division 'Generalstreik'",
    "22=%d. Volkswehr-Division 'Reichstag'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_REPPZ_01",
  "after": "GER_REPDEF_01",
  "selector": "Republican Panzer Divisions",
  "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "%d. Panzer-Division",
  "canUse": "has_government = democratic",
  "comment": "Panzer divisions of a democratic Germany, named after the revolution of 1848/49, the liberals of the Empire, the Weimar Republic and the democratic resistance.",
  "add": [
    "# The revolution of 1848/49",
    "1=%d. Panzer-Division 'Franz Sigel'",
    "2=%d. Panzer-Division 'Lorenz Brentano'",
    "3=%d. Panzer-Division 'Georg Herwegh'",
    "4=%d. Panzer-Division 'Ludwig Blenker'",
    "5=%d. Panzer-Division 'Max Dortu'",
    "6=%d. Panzer-Division 'Gottfried Kinkel'",
    "7=%d. Panzer-Division 'Heinrich von Gagern'",
    "8=%d. Panzer-Division 'Gabriel Riesser'",
    "9=%d. Panzer-Division 'Rastatt'",
    "10=%d. Panzer-Division 'Offenburg'",
    "11=%d. Panzer-Division 'Heppenheim'",
    "# Liberals and parliamentarians of the Empire",
    "12=%d. Panzer-Division 'Johann Jacoby'",
    "13=%d. Panzer-Division 'Eugen Richter'",
    "14=%d. Panzer-Division 'Ludwig Windthorst'",
    "15=%d. Panzer-Division 'Rudolf Virchow'",
    "16=%d. Panzer-Division 'Schulze-Delitzsch'",
    "17=%d. Panzer-Division 'Eduard Lasker'",
    "18=%d. Panzer-Division 'Ludwig Bamberger'",
    "19=%d. Panzer-Division 'Theodor Mommsen'",
    "20=%d. Panzer-Division 'Friedrich Naumann'",
    "21=%d. Panzer-Division 'Ludwig Quidde'",
    "# The Weimar Republic",
    "22=%d. Panzer-Division 'Hermann Müller'",
    "23=%d. Panzer-Division 'Joseph Wirth'",
    "24=%d. Panzer-Division 'Wilhelm Marx'",
    "25=%d. Panzer-Division 'Erich Koch-Weser'",
    "26=%d. Panzer-Division 'Conrad Haußmann'",
    "# The democratic resistance, 1933-45",
    "27=%d. Panzer-Division 'Julius Leber'",
    "28=%d. Panzer-Division 'Wilhelm Leuschner'",
    "29=%d. Panzer-Division 'Carl von Ossietzky'",
    "30=%d. Panzer-Division 'Carlo Mierendorff'",
    "31=%d. Panzer-Division 'Theodor Haubach'",
    "32=%d. Panzer-Division 'Adolf Reichwein'",
    "33=%d. Panzer-Division 'Dietrich Bonhoeffer'",
    "34=%d. Panzer-Division 'Geschwister Scholl'",
    "35=%d. Panzer-Division 'Weiße Rose'",
    "36=%d. Panzer-Division 'Kreisauer Kreis'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_REDINF_01",
  "after": "GER_MEC_01_COMMUNIST",
  "selector": "Workers' Divisions",
  "addType": ["infantry", "militia"],
  "fallback": "%d. Arbeiter-Division",
  "canUse": "has_government = communism",
  "comment": "Workers' divisions named after the towns of the Rote Ruhrarmee (1920), the Märzkämpfe (1921), the Hamburg rising (1923) and the KPD's strongholds.",
  "add": [
    "# The Rote Ruhrarmee, March-April 1920",
    "1=%d. Arbeiter-Division 'Essen'",
    "2=%d. Arbeiter-Division 'Dortmund'",
    "3=%d. Arbeiter-Division 'Bochum'",
    "4=%d. Arbeiter-Division 'Elberfeld'",
    "5=%d. Arbeiter-Division 'Barmen'",
    "6=%d. Arbeiter-Division 'Remscheid'",
    "7=%d. Arbeiter-Division 'Solingen'",
    "8=%d. Arbeiter-Division 'Mülheim an der Ruhr'",
    "9=%d. Arbeiter-Division 'Duisburg'",
    "10=%d. Arbeiter-Division 'Hamborn'",
    "11=%d. Arbeiter-Division 'Gelsenkirchen'",
    "12=%d. Arbeiter-Division 'Dinslaken'",
    "13=%d. Arbeiter-Division 'Wesel'",
    "14=%d. Arbeiter-Division 'Pelkum'",
    "# The Märzkämpfe of 1921 and the Hamburg rising of 1923",
    "15=%d. Arbeiter-Division 'Eisleben'",
    "16=%d. Arbeiter-Division 'Merseburg'",
    "17=%d. Arbeiter-Division 'Barmbek'",
    "18=%d. Arbeiter-Division 'Schiffbek'",
    "# KPD strongholds in Saxony, Thuringia and Berlin",
    "19=%d. Arbeiter-Division 'Zwickau'",
    "20=%d. Arbeiter-Division 'Freital'",
    "21=%d. Arbeiter-Division 'Falkenstein'",
    "22=%d. Arbeiter-Division 'Gotha'",
    "23=%d. Arbeiter-Division 'Suhl'",
    "24=%d. Arbeiter-Division 'Wedding'",
    "25=%d. Arbeiter-Division 'Neukölln'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_REDPZ_01",
  "after": "GER_REDINF_01",
  "selector": "Red Panzer Divisions",
  "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "%d. Rote Panzer-Division",
  "canUse": "has_government = communism",
  "comment": "Red Panzer divisions named after revolutions and risings, the Peasants' War, the International Brigades and the communist resistance.",
  "add": [
    "# Revolutions and risings",
    "1=%d. Rote Panzer-Division 'Novemberrevolution'",
    "2=%d. Rote Panzer-Division 'Pariser Kommune'",
    "3=%d. Rote Panzer-Division 'Leuna'",
    "4=%d. Rote Panzer-Division 'Mansfelder Land'",
    "5=%d. Rote Panzer-Division 'Hamburger Aufstand'",
    "# The Peasants' War and its forerunners",
    "6=%d. Rote Panzer-Division 'Bundschuh'",
    "7=%d. Rote Panzer-Division 'Armer Konrad'",
    "8=%d. Rote Panzer-Division 'Joß Fritz'",
    "9=%d. Rote Panzer-Division 'Jörg Ratgeb'",
    "10=%d. Rote Panzer-Division 'Jäcklein Rohrbach'",
    "11=%d. Rote Panzer-Division 'Pfeifer von Niklashausen'",
    "# The International Brigades and the Bavarian Soviet Republic",
    "12=%d. Rote Panzer-Division 'Tschapaiew'",
    "13=%d. Rote Panzer-Division 'Ludwig Renn'",
    "14=%d. Rote Panzer-Division 'Artur Becker'",
    "15=%d. Rote Panzer-Division 'Max Levien'",
    "# The communist resistance, 1933-45",
    "16=%d. Rote Panzer-Division 'Anton Saefkow'",
    "17=%d. Rote Panzer-Division 'Robert Uhrig'",
    "18=%d. Rote Panzer-Division 'Bernhard Bästlein'",
    "19=%d. Rote Panzer-Division 'Werner Seelenbinder'",
    "20=%d. Rote Panzer-Division 'John Sieg'",
    "21=%d. Rote Panzer-Division 'Herbert Baum'",
    "22=%d. Rote Panzer-Division 'Georg Schumann'",
    "23=%d. Rote Panzer-Division 'Theodor Neubauer'",
    "24=%d. Rote Panzer-Division 'Albert Kuntz'",
    "25=%d. Rote Panzer-Division 'Käthe Niederkirchner'",
    "26=%d. Rote Panzer-Division 'Liselotte Herrmann'",
    "27=%d. Rote Panzer-Division 'Hans Coppi'",
    "28=%d. Rote Panzer-Division 'Harro Schulze-Boysen'",
    "29=%d. Rote Panzer-Division 'Arvid Harnack'",
    "30=%d. Rote Panzer-Division 'Rote Kapelle'"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "GER_REDMAR_01",
  "after": "GER_REDPZ_01",
  "selector": "Red Sailor Divisions",
  "addType": ["marine"],
  "fallback": "%d. Matrosen-Division",
  "canUse": "has_government = communism",
  "comment": "Red sailors' divisions named after the naval mutinies of 1917 and 1918 and the Volksmarinedivision of 1918-19.",
  "add": [
    "# The naval mutiny of 1917",
    "1=%d. Matrosen-Division 'Max Reichpietsch'",
    "2=%d. Matrosen-Division 'Albin Köbis'",
    "3=%d. Matrosen-Division 'Willy Weber'",
    "4=%d. Matrosen-Division 'Wilhelm Sachse'",
    "5=%d. Matrosen-Division 'Hans Beckers'",
    "# November 1918",
    "6=%d. Matrosen-Division 'Karl Artelt'",
    "7=%d. Matrosen-Division 'Schillig-Reede'",
    "# The Volksmarinedivision, Berlin 1918-19",
    "8=%d. Matrosen-Division 'Paul Wieczorek'",
    "9=%d. Matrosen-Division 'Otto Tost'",
    "10=%d. Matrosen-Division 'Fritz Radtke'",
    "11=%d. Matrosen-Division 'Marstall'",
    "12=%d. Matrosen-Division 'Weihnachtskämpfe'"
  ]
}
```
