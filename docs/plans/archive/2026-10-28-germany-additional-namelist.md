# Germany-Additional (GER_ADDITIONAL) Namelist Plan - 2026-10-28

Status: DONE

File: `common/units/names_divisions/zz_INEX_GER_ADDITIONAL_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Germany has three INEX files with 82 groups (GER 33, GER_SS 13, GER_ADDITIONAL 30, shipped and audited up to 2026-10-28). The user asked for a few new "historically plausible" namelists: lists that need no strict historical basis as long as the formations could plausibly have existed. This plan adds four such suites to the GER_ADDITIONAL file, each grown from one real seed unit the Wehrmacht fielded only once or in small numbers:
- **Ski divisions** (`GER_SKI_01`): the 1. Skijäger-Division of June 1944 extended into a series named after winter-sport regions and the Lapland front.
- **Luftwaffe Panzer divisions** (`GER_FJPZ_01` plain, `GER_FJPZ_02` named): the Fallschirm-Panzerkorps 'Hermann Göring' extended into a Luftwaffe armoured arm named by the Geschwader tradition names (Richthofen, Boelcke, Immelmann, Mölders).
- **Armoured trains** (`GER_PZZUG_01`): the Eisenbahn-Panzerzüge on their real numbers, with named trains after Prussian commanders as the extension.
- **Bicycle brigades** (`GER_RAD_01`): the Radfahr-Jäger-Brigade 10 of 1945 extended into a series named after the flat regions of the Reich.

The batch also moves the two bicycle brigades out of `GER_BRIG_01` into the new bicycle list and rewrites the file header. No vanilla tag is reused.

## Decisions
- **Policy** (the user's words): plausible extrapolation, no verified-only requirement. Every extrapolated entry is still built from a verified designation pattern and a verified place or person; the "Author confirmation" list names them all.
- **File key**: `GER_ADDITIONAL`, as the file of specialist and numbered series (guide section 2). The four suites form a new section 6 placed after the Foreign Legions and before the Imperial numbered series (`"after": "LEG_01"`).
- **Gating**: all five groups are `can_use = { always = yes }`. The Luftwaffe armour list leaves out the Nazi honour names: 'Hermann Göring' (already in `GER_ELI_01`, fascist-only), 'Horst Wessel', 'Schlageter', 'Legion Condor' (in `GER_ELI_01`), and 'Nowotny' (NSDAP member from 1938). 'Hindenburg' (Reichspräsident, died 1934, Traditionsname of KG 1) and 'Udet' (Luftwaffe general, Traditionsname of JG 3) are kept: neither held a party office. 'Totenkopf' (KG 54) is left out for its SS association.
- **Ski list size**: 30 entries, on purpose. `-PickTable GER` gives `ranger_battalion` to `GER_LTINF_01` with 31 names and `mountaineers` to `GER_Mnt_01` with 33 (communism) or `GER_MONINF_01` with 209 (democratic/neutrality), and the game gives a template the group with the most names [NAM-018]. At 30 the ski list never takes a Jäger or mountain template on its own; the group comment records the ceiling.
- **Luftwaffe pair**: the plain list keeps `Fallschirm-Panzer-Division %d` with no `ordered` block; the named list links to it. Both are typed as the four armour tokens plus `mechanized` (the Hermann Göring corps had a Panzer and a Panzergrenadier division); with 20 names they never beat `GER_Arm_01` or `GER_MEC_01` (110 each), so Panzer and Panzergrenadier templates keep their main lists. The number follows the designation, as in the real `Fallschirm-Panzer-Division 1 'Hermann Göring'`; under a fascist government the Elite list's division 1 and this list's division 1 'Richthofen' can coexist only if the player uses both lists, which is the player's choice.
- **Armoured trains**: typed `armored_car`, the only line battalion that fits. With 81 entries the list has more names than `GER_AUFKL_01` (3), so a template of armoured-car battalions alone takes the train list on its own; a mixed template with tanks keeps `GER_Arm_01` (110). Accepted: armoured-car-only templates are rare, and the Reconnaissance Battalions list stays one click away in the designer. The wiki note and the group comment say so. Designation: `Panzerzug %d` (the short period form; the full `Eisenbahn-Panzerzug` is named in the comment). Real numbers are written as entries so that a player's trains take the historical numbers in order (1, 3, 5, 6, then 2, 4, 7, 9, 10, 11, the captured and rebuilt 21-32, 51-52, the BP 42 series 61-84). The Panzertriebwagen 15-23 and 30-38 and the Panzerjäger-Triebwagen 51 are written under 9xx keys with their number in the text, since keys 30-32 belong to the trains. The named trains are pure extrapolation (the researcher found no named Wehrmacht train); the names are Prussian commanders who died before 1914, with Mackensen, Ludendorff, Kleist, Seydlitz, Schwerin, Manteuffel, Lützow and Scharnhorst left out (political, or already an identity in this file or in the Heer file's Kampfgruppen and Reichswehr lists).
- **Bicycle brigades**: brigade level, since the only attested German cyclist formation above battalion is the `Radfahr-Jäger-Brigade 10` (January 1945); no German Radfahr-Division is attested, so the fallback is `Radfahr-Jäger-Brigade %d` and the extension carries the identity after the number (`Radfahr-Jäger-Brigade 1 'Altmark'`). The two historical bicycle brigades move from `GER_BRIG_01` (keys 21 and 22) into this list; its "Mountain, ski and bicycle brigades" section is renamed. Identities are flat regions of the 1937 Reich and Austria; Kulmerland and Netzebruch (annexed 1939) and the coastal identities the Heer file already uses (Dithmarschen, Eiderstedt, Nordfriesland, Samland) are left out.
- **Ski identities**: winter-sport towns and highland regions of the Reich, Austria and the Sudetenland not yet used by the Jäger, Gebirgs and border lists (Garmisch, Harz, Riesengebirge, Isergebirge and the rest of the used list were checked with grep), plus four battle honours of the Lapland front as the Wehrmacht wrote them (Lappland, Salla, Petsamo, Kiestinki). The ski regiments and battalions of 1942-44 close the list on 9xx keys; the `1. Skijäger-Brigade` and the `MG-Ski-Brigade Finnland` stay in `GER_BRIG_01`.
- **Orthography**: mod convention (`Skijäger-Division`, `Fallschirm-Panzer-Division`, `Radfahr-Jäger-Brigade`, `Panzertriebwagen`); de.wikipedia's `Ski-Jäger-Regiment` is written `Skijäger-Regiment` after the division's own form. Identities in single quotes; the real units without.
- **Plain/named pairs**: only the armour list gets one (section 3 of the authoring skill); ski, trains and bicycles are specialist lists outside the pair rule.
- **Vanilla**: nothing to carry over; vanilla has no ski, bicycle, train or Luftwaffe armour group for GER.

## Vanilla findings (`-InspectVanilla GER`)
| Vanilla tag | Vanilla state | Action |
|---|---|---|
| (none) | Vanilla's 23 GER groups hold no ski, bicycle, armoured-train or Luftwaffe armour list; the scripted references (`GER_PEN_01`, `GER_SS_01`, `GER_MIL_01` to `_03`, `GER_CAV_01`, `GER_INF_01`) touch no tag of this plan | Five new tags; no vanilla tag reused, nothing merged |

`-PickTable GER` before the batch: `armored_car: GER_AUFKL_01 3`, `bicycle_battalion: none`, `mountaineers: ... communism GER_Mnt_01 33`, `ranger_battalion: ... GER_LTINF_01 31`, armour tokens `GER_Arm_01 110`, `mechanized ... GER_MEC_01 110`.

## Group suite
| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| `GER_BRIG_01` (existing) | Infantry Brigades | infantry, motorized | always | - | `Grenadier-Brigade %d` | 32 -> 30 (keys 21, 22 move to `GER_RAD_01`) |
| `GER_SKI_01` | Ski Divisions | mountaineers, ranger_battalion | always | - | `%d. Skijäger-Division` | 30 |
| `GER_FJPZ_01` | Luftwaffe Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor, mechanized | always | - | `Fallschirm-Panzer-Division %d` | 0 (plain) |
| `GER_FJPZ_02` | Luftwaffe Panzer (Named) | light_armor, medium_armor, heavy_armor, modern_armor, mechanized | always | `GER_FJPZ_01` | `Fallschirm-Panzer-Division %d` | 20 |
| `GER_PZZUG_01` | Armored Trains | armored_car | always | - | `Panzerzug %d` | 81 |
| `GER_RAD_01` | Bicycle Brigades | bicycle_battalion | always | - | `Radfahr-Jäger-Brigade %d` | 30 |

File after the batch: 35 groups, 1057 - 2 + 161 = 1216 names.

## Research record
- `inex-historical-researcher`, one dispatch (about 38 web calls), dossier `scratch/ger_plausible_dossier.md`. Main sources: de.wikipedia "1. Skijäger-Division", "Radfahrtruppe", "Radfahr-Jäger-Brigade 10", "Fallschirm-Panzer-Division 1 Hermann Göring", "Panzerzug" and the Geschwader pages (JG 2, JG 53, JG 54, JG 77, KG 2, KG 4, KG 26, KG 30, KG 54, ZG 1, ZG 76); Bundesarchiv "Die Traditionsgeschwader der Wehrmacht" (the eleven official tradition names); feldgrau.com "Railway Armored Trains" (train numbers); armedconflicts.com "Panzertriebwagen"; en.wikipedia "Operation Platinum Fox" (Lapland sectors).
- Verified: the 1. Skijäger-Division (brigade September 1943, division 2 June 1944, Skijäger-Regimenter 1 and 2, Skijäger-Bataillone 2, 4, 5, 7, 9, 11); the three Hermann Göring formations and the number-after-designation form; the eleven Traditionsgeschwader and the Beinamen Pik As, Herz As, Holzhammer; the train numbers 1-7, 9-11, 21-32, 51, 52, 61-84, the Panzertriebwagen 15-23 and 30-38 and the Panzerjäger-Triebwagen 51; Radfahr-Jäger-Brigade 10 (January 1945, East Prussia).
- Unverified and left out: a Heer "Ski-Bataillon Norwegen" (only the SS battalion exists), the Radfahr-Sicherungs-Regimenter, any named Wehrmacht train, the Beinamen Haifisch, Edelweiß (KG 51), Greif (KG 55) and Blitz (KG 3), and the German spellings Kandalakscha, Louhi and Liza (not used).
- Unverified but used, from the planner's own knowledge: the WWI aces Rumey and Kirschstein and the Prussian commanders Bülow, Tauentzien, Schlieffen and Nettelbeck (all died before 1933); listed under "Author confirmation".

## Author confirmation
Every entry below is an extrapolation on a verified pattern, or rests on the planner's knowledge rather than a fetched source.
- `GER_SKI_01`: keys 2-22, the 21 divisions after the real one. Identities 2-18 are winter-sport towns and highland regions (Oberhof, Oberwiesenthal, Braunlage, Winterberg, Feldberg, Oberammergau, Reit im Winkl, Ruhpolding, Kitzbühel, Arlberg, Seefeld, Semmering, Bad Gastein, Schladming, Montafon, Stubai, Altvatergebirge); 19-22 are Lapland battle honours (Lappland, Salla, Petsamo, Kiestinki). Keys 901-908 are the real regiments and battalions; `Skijäger-Regiment 1` and `2` follow the division's spelling where de.wikipedia hyphenates `Ski-Jäger-Regiment`.
- `GER_FJPZ_02`: all 20 entries. The designation pattern is the real `Fallschirm-Panzer-Division 1 'Hermann Göring'`; the names are verified Luftwaffe tradition names and Beinamen (Richthofen, Boelcke, Immelmann, General Wever, Hindenburg, Udet, Mölders, Oesau, Pik As, Herz As, Holzhammer), Luftwaffe aces who died in service (Wick, Marseille, Philipp), aviation pioneers and WWI aces who died before 1923 (Lilienthal, Zeppelin, Voss, Löwenhardt) and, from the planner's knowledge, the WWI aces Fritz Rumey (killed September 1918) and Hans Kirschstein (died July 1918).
- `GER_PZZUG_01`: keys 901-914, the fourteen named trains (Blücher, Gneisenau, Yorck, Moltke, Roon, Zieten, Derfflinger, Wrangel, Steinmetz, Goeben, Bülow, Tauentzien, Schlieffen, Nettelbeck): no named Wehrmacht train is attested; the numbered entries and the Triebwagen are real.
- `GER_RAD_01`: keys 1-9 and 11-29, the 28 brigades after the real one; the identities are regions of the 1937 Reich and Austria. Key 901 `Radfahr-Aufklärungs-Brigade Norwegen` (April 1944, Norway) has forum-level support only and moves unchanged from `GER_BRIG_01`.

## Kept on judgment
Expected after the batch (confirmed on a scratch copy; see "Review"): `Flags: PLACEHOLDER_ENTRIES x13, LOW_DEPTH x3, IDENTITY_REPEAT x1`.
- PLACEHOLDER_ENTRIES (13): the twelve groups of the 2026-10-28 audit plan (`GER_SCHWERE_PANZERABTEILUNG_01`, `_02`, `GER_ARM_03`, `GER_STUG_01`, `GER_RESERVE_DIVISION_01`, `GER_LUFTWAFFEN_FELD_DIVISION_01`, `GER_FLAK_DIVISION_01`, `GER_MEK_01`, `GER_PEN_01`, `GER_STURM_01`, `GER_MONRES_01`, `GER_LANDWEHR_01`) plus `GER_PZZUG_01`: the Wehrmacht numbered its trains and gave them no names, so the real series is written with the fallback text.
- LOW_DEPTH (3): `GER_LUFTWAFFEN_FELD_DIVISION_01`, `GER_PEN_01` and `GER_AMPH_01`, unchanged from the audit plan. `GER_FJPZ_01` is the plain variant and is exempt through its link.
- IDENTITY_REPEAT (file): the Gau and city names shared between militia, Volkssturm, Flak and Festung lists, as before; this batch adds no identity that another group of this file carries.
- The `-Audit` lines that list identities shared with the other German files are informational: 'Scharnhorst' and the like were avoided; `1. Skijäger-Division` (key 937 of `GER_Mnt_01`) is repeated on purpose as the seed of the ski list.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GER_ADDITIONAL -Batch docs/plans/2026-10-28-germany-additional-namelist.md`. Expect exactly these seven lines, in this order, and no `[ERROR]`:
  ```
  Set header of zz_INEX_GER_ADDITIONAL_names_divisions.txt
  Edited GER_BRIG_01: +0 -2 ~0
  Added GER_SKI_01: "Ski Divisions" [mountaineers ranger_battalion], 30 name(s)
  Added GER_FJPZ_01: "Luftwaffe Panzer Divisions" [light_armor medium_armor heavy_armor modern_armor mechanized], 0 name(s)
  Added GER_FJPZ_02: "Luftwaffe Panzer (Named)" [light_armor medium_armor heavy_armor modern_armor mechanized], 20 name(s), links GER_FJPZ_01
  Added GER_PZZUG_01: "Armored Trains" [armored_car], 81 name(s)
  Added GER_RAD_01: "Bicycle Brigades" [bicycle_battalion], 30 name(s)
  ```
  A different count is a stop condition.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki GER_ADDITIONAL`. Expect `Germany-Additional.md: 5 row(s) updated` with one `row added` line each for `GER_SKI_01`, `GER_FJPZ_01`, `GER_FJPZ_02`, `GER_PZZUG_01` and `GER_RAD_01` (placed after the `GER_LEG_01` row), and `wiki/Home.md: GER_ADDITIONAL group count 30 -> 35`. A prose-check line that names `Radfahr-Jäger-Brigade 10` or `Radfahr-Aufklärungs-Brigade Norwegen` may appear; step 3 handles it.
- [x] 3. Make the hand edits W1-W4 under "Docs payload" in `wiki/Germany-Additional.md` with the Edit tool.
- [x] 4. `powershell -File .\build.ps1 -SyncWiki GER_ADDITIONAL` once more. Expect `Germany-Additional.md: 0 row(s) updated`, `wiki/Home.md: GER_ADDITIONAL group count 35 (unchanged)`, no group without a row and no line about stale prose.
- [x] 5. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: make the edits G1 and G2 under "Docs payload" with the Edit tool.
- [x] 6. `powershell -File .\build.ps1 -Check GER_ADDITIONAL`. Expect `Check passed`, `AUDIT SUMMARY GER_ADDITIONAL: GROUPS=35`, `Flags: PLACEHOLDER_ENTRIES x13, LOW_DEPTH x3, IDENTITY_REPEAT x1` (must match "Kept on judgment"), no `Docs:` warning, and the `[b]Germany[/b]` block within 450 characters.
- [x] 7. `powershell -File .\build.ps1 -PickTable GER -PickTypes 'armored_car'`. Expect `GER_PZZUG_01 81` as the winner (the accepted change of "Decisions"); `-PickTypes 'mountaineers'` and `'ranger_battalion'` must not name `GER_SKI_01` as the winner for any government.
- [x] 8. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 9. Ship, on the user's word: commit with the message `Add plausible ski, Luftwaffe Panzer, armoured train and bicycle namelists (GER_ADDITIONAL)`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document the GER_ADDITIONAL ski, Luftwaffe Panzer, armoured train and bicycle namelists"`.

## Docs payload
README.md: no change (no file added or removed). The group rows and the Home count are written by `-SyncWiki` (step 2).

### wiki/Germany-Additional.md (hand edits, after the first `-SyncWiki`)

**W1.** Replace
```
- **Foreign legions.**
- **Imperial series:** the Sturm-Bataillone of 1916–18 and the Reserve, Ersatz and Landwehr divisions of 1914–18.
```
with
```
- **Foreign legions.**
- **Plausible specialist formations:** Skijäger divisions, Luftwaffe Panzer divisions, armoured trains and Radfahr brigades, each grown from one real seed unit.
- **Imperial series:** the Sturm-Bataillone of 1916–18 and the Reserve, Ersatz and Landwehr divisions of 1914–18.
```

**W2.** Replace
```
The support-arm groups list only the line battalions of their arm (anti-air, artillery, rocket artillery, anti-tank and tank destroyers, armoured cars, amphibious units, naval commandos), so a template built from those battalions takes the matching list on its own, while Panzer, motorized and infantry templates keep their main lists. Kampfgruppen list only infantry and are chosen by hand in the division designer.
```
with
```
The support-arm groups list only the line battalions of their arm (anti-air, artillery, rocket artillery, anti-tank and tank destroyers, armoured cars, amphibious units, naval commandos), so a template built from those battalions takes the matching list on its own, while Panzer, motorized and infantry templates keep their main lists. Kampfgruppen list only infantry and are chosen by hand in the division designer.

The plausible lists are sized so that the main lists keep their templates: the ski list stays at 30 names, below the Jäger and Gebirgs lists, and the Luftwaffe Panzer lists stay far below the Heer Panzer and Panzergrenadier lists. The armoured trains are the exception: typed as armoured cars and larger than the Reconnaissance Battalions, they take a template of armoured-car battalions alone on their own; choose Reconnaissance Battalions in the designer for such a template.
```

**W3.** Replace
```
- Mountain, ski and bicycle brigades (*Gebirgsjäger-Brigade 139*, *MG-Ski-Brigade Finnland*, *Radfahr-Jäger-Brigade 10*).
```
with
```
- Mountain and ski brigades (*Gebirgsjäger-Brigade 139*, *1. Skijäger-Brigade*, *MG-Ski-Brigade Finnland*); the bicycle brigades are in `GER_RAD_01`.
```

**W4.** Insert directly before the heading `` ### `GER_STURM_01` — Imperial Storm Battalions (neutrality/democratic) ``, with one blank line before and after the block:
```
### `GER_SKI_01` — Ski Divisions
Grown from the *1. Skijäger-Division*, the Heer's only ski division (brigade September 1943, division June 1944, Pripjet marshes and Carpathians). The extension names further divisions after winter-sport towns and highland regions (*'Oberhof'*, *'Kitzbühel'*, *'Stubai'*, where the Heeres-Hochgebirgsschule stood) and the Lapland front (*'Lappland'*, *'Salla'*, *'Petsamo'*, *'Kiestinki'*); the *Skijäger-Regimenter 1* and *2* and the *Skijäger-Bataillone* of 1942-43 close the list. For mountain and Jäger templates; kept at 30 names so that it never takes those templates on its own.

### `GER_FJPZ_01` / `GER_FJPZ_02` — Luftwaffe Panzer Divisions (plain / Named)
The Luftwaffe raised the *Fallschirm-Panzer-Division 1 'Hermann Göring'* and a second Panzergrenadier division; these lists extend that into a Luftwaffe armoured arm named by the Geschwader tradition names and the aces the Luftwaffe honoured (*Fallschirm-Panzer-Division 1 'Richthofen'*, *'Boelcke'*, *'Immelmann'*, *'General Wever'*, *'Mölders'*, *'Pik As'*, *'Holzhammer'*) and by aviation pioneers (*'Lilienthal'*, *'Zeppelin'*). The Nazi honour names stay in the fascist-only Elite Formations of the [Heer](Germany) file. The plain list gives bare numbers and shares them with the Named list.

### `GER_PZZUG_01` — Armored Trains
For armoured-car templates. The Wehrmacht's *Eisenbahn-Panzerzüge* on their real numbers and in their order of raising: the 1938-39 trains *1*, *3*, *5*, *6* and *2*, *4*, *7*, *9*-*11*, the captured and rebuilt trains *21*-*32*, *51* and *52*, and the BP 42 series *61*-*84*; then the *Panzertriebwagen 15*-*23* and *30*-*38* and the *Panzerjäger-Triebwagen 51*. The extension names trains after Prussian commanders (*Panzerzug 'Blücher'*, *'Gneisenau'*, *'Yorck'*), which no real train carried.

### `GER_RAD_01` — Bicycle Brigades
For bicycle templates. The *Radfahr-Jäger-Brigade 10* (East Prussia, January 1945) and the *Radfahr-Aufklärungs-Brigade Norwegen* are the real units; the extension raises further brigades named after the flat regions of the Reich and Austria (*Radfahr-Jäger-Brigade 1 'Altmark'*, *'Havelland'*, *'Münsterland'*, *'Marchfeld'*). Germany never formed a bicycle division, so the list stays at brigade level.
```

### WORKSHOP_DESCRIPTION_GUIDELINES.md

**G1.** In the table row that starts `` | `zz_INEX_GER_ADDITIONAL_names_divisions.txt` ``, replace
```
Volksgrenadier/Reserve/Grenadier series, Luftwaffe field & Flak, Festungen, Kampfgruppen, penal units,
```
with
```
Volksgrenadier/Reserve/Grenadier series, Luftwaffe field & Flak, Festungen, Kampfgruppen, penal units, plausible Skijäger, Luftwaffe Panzer, armoured train & Radfahr lists,
```

**G2.** Replace the first bullet of the `[b]Germany[/b]` block
```
- Plain and Named Heer lists in raising order with nicknames ([i]7. Panzer-Division 'Gespenster'[/i]), Waffen-SS, coastal and border divisions, Festungen, Kampfgruppen, Volksgrenadier, Luftwaffe field and Flak, heavy, StuG, Werfer and Panzerjäger units, penal units
```
with
```
- Plain and Named Heer lists with nicknames ([i]7. Panzer-Division 'Gespenster'[/i]), Waffen-SS, coastal, border and Festung divisions, Kampfgruppen, Volksgrenadier, Luftwaffe field, Flak and Panzer, heavy, StuG and Werfer units, Skijäger, Panzerzüge and Radfahr brigades
```
(The whole block then has 2 bullets, 2 examples and 448 characters, counted on the rehearsal copy without line breaks.)

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Rehearsal (2026-10-28, HEAD exported to a scratchpad folder, batch applied there with `-EditNames GER_ADDITIONAL -Batch`, docs payload replayed, `-SyncWiki` run twice): the seven batch lines of step 1 as written; `-SyncWiki` added the five rows after `GER_LEG_01` and set the Home count to 35, then reported `0 row(s) updated` after the hand edits (its prose check needs git and was skipped there); `-Audit GER_ADDITIONAL`: `GROUPS=35 AUTHORED=810/1216 FLAGS=17`, per group `PLACEHOLDER_ENTRIES` on the twelve groups of the audit plan plus `GER_PZZUG_01`, `LOW_DEPTH` on `GER_AMPH_01`, `GER_LUFTWAFFEN_FELD_DIVISION_01` and `GER_PEN_01`, file-level `IDENTITY_REPEAT`, `GER_FJPZ_01` shown as `Variant: plain (un-nicknamed) counterpart of GER_FJPZ_02`; one informational cross-file line, `'Gneisenau': GER_PZZUG_01, GER_Arm_01_ANTIFASCIST` (kept: a train and a Republican division may share the name). `-PickTable GER` there: `armored_car: GER_PZZUG_01 81 > GER_AUFKL_01 3` (accepted in "Decisions"), `bicycle_battalion: GER_RAD_01 30`, `ranger_battalion: GER_LTINF_01 31 > GER_SKI_01 30`, `mountaineers: ... communism GER_Mnt_01 33 > GER_SKI_01 30`, armour and mechanized unchanged. `[b]Germany[/b]` block: 448 characters, 2 bullets, 2 examples.

Self-check: every name in the batch is in the dossier's verified facts (the 1. Skijäger-Division and its regiments and battalions, the train numbers and Triebwagen, the Traditionsnamen and Beinamen, Radfahr-Jäger-Brigade 10) or on the "Author confirmation" list (every extrapolated identity, the named trains, Rumey, Kirschstein, Bülow, Tauentzien, Schlieffen, Nettelbeck, the moved Norwegen brigade). Result: pass.

Proofreader (`inex-proofreader`, 2026-10-28, 161 German entries pasted with the "Author confirmation" list): no spelling, case, diacritic or misattribution errors. Findings and what was done:
- `Panzertriebwagen` confirmed as the single-word designation; `Panzerjäger-Triebwagen 51` reads as the real designation but was not looked up (it is verified in the dossier from armedconflicts.com). No change.
- Rumey and Kirschstein confirmed as correctly spelled WWI aces who died in 1918 (from the proofreader's knowledge). They stay on "Author confirmation". No change.
- No party office known for Wick, Marseille, Philipp, Oesau, Mölders or Udet. No change.
- 'Kiestinki' confirmed as the Finnish-derived form used in the German wartime literature (en.wikipedia "Battles of Kiestinki"); marked "unsure" for lack of a German-language page. Kept; it stays on "Author confirmation".

## Outcome
Date: 2026-10-28.

`-Check GER_ADDITIONAL`: Validate OK; Tests 521 Passed, 0 Failed; `AUDIT SUMMARY GER_ADDITIONAL: GROUPS=35 AUTHORED=810/1216 FLAGS=17`; `Flags: PLACEHOLDER_ENTRIES x13, LOW_DEPTH x3, IDENTITY_REPEAT x1` (all listed under "Kept on judgment"); `Diff vs HEAD: 6 group(s) changed, +161 -2 name(s)`; no `Docs:` warning; `Check passed`.

`-PickTable GER`: `armored_car: GER_PZZUG_01 81 > GER_AUFKL_01 3`; `mountaineers` and `ranger_battalion` do not pick `GER_SKI_01` (`ranger_battalion: GER_LTINF_01 31 > GER_SKI_01 30`; `mountaineers: ... communism GER_Mnt_01 33 > GER_SKI_01 30`).

Deviations:
- Step 4: the second `-SyncWiki GER_ADDITIONAL` printed a stale-prose line that step 4 did not expect, `L185` of `wiki/Germany-Additional.md` (the GER_RAD_01 paragraph, naming Radfahr-Jäger-Brigade 10 and Radfahr-Aufklärungs-Brigade Norwegen as moved or removed since HEAD). The run stopped there. The user accepted it as a known false positive, so W4 stays as written and step 4 is ticked on that basis. No other stale-prose line appeared.

## Edit batch
Applied by `build.ps1 -EditNames GER_ADDITIONAL -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{ "header": "# Division template historical names system for Germany (GER): additional formations.\n# Immersive Namelists Expanded (INEX)\n#\n# Numbered series, specialised units, garrisons and fortresses, Kampfgruppen, militias, foreign\n# legions, plausible specialist formations and the Imperial series. Period German spelling and 1939-45\n# exonyms (Reval, Wilna, Kiew, Charkow); identities appended to a designation go in single quotes,\n# historical proper names do not.\n#\n# Numbering: Reserve, Volksgrenadier and Grenadier divisions link to GER_Inf_01 and sit on their\n# real numbers (one Heer number series). Luftwaffe field divisions, Flak divisions, battalions,\n# brigades, garrisons, militias and the Imperial lists run their own series.\n#\n# Division types: the support-arm lists (StuG, Panzerjäger, reconnaissance, amphibious, artillery,\n# Werfer, Flak, naval commandos) list only their arm's line battalions, and Kampfgruppen list only\n# infantry, so the automatic choice keeps Panzer, motorized and infantry templates on their main lists.\n#\n# Plausible specialist formations (section 6): Skijäger divisions, Luftwaffe Panzer divisions, armoured\n# trains and Radfahr brigades, each grown from one real seed unit; own number series. The ski list stays\n# below the Jäger and Gebirgs lists in size, so those templates keep their main lists; the train list\n# (armored_car) is larger than GER_AUFKL_01 and takes armoured-car-only templates on its own.\n#\n# Ideology gating: Volkssturm, SA and foreign legions are fascist-only; Freikorps (neutrality),\n# Reichsbanner (democratic) and Red Front Fighters (communism) cover the other paths. The Imperial\n# Sturm-Bataillone, Reserve and Landwehr divisions serve neutrality and democratic governments.\n# Overrides vanilla GER_PEN_01, GER_MIL_01, GER_MIL_02 and GER_MIL_03 (all created by vanilla focuses)." }
```

```json batch
{ "group": "BRIG_01",
  "remove": ["21", "22"],
  "renameSection": ["Mountain, ski and bicycle brigades=Mountain and ski brigades (the bicycle brigades are in GER_RAD_01)"] }
```

```json batch
{ "addGroup": true, "group": "SKI_01", "selector": "Ski Divisions", "after": "LEG_01",
  "addType": ["mountaineers", "ranger_battalion"],
  "fallback": "%d. Skijäger-Division",
  "comment": "# ==============================================================================\n# 6. PLAUSIBLE SPECIALIST FORMATIONS\n# ==============================================================================\n\n# Ski divisions grown from the 1. Skijäger-Division (brigade September 1943, division 2 June 1944; Pripjet marshes, Carpathians).\n# Plausible expansion: winter-sport towns and highland regions, then Lapland battle honours; the real regiments and battalions on 9xx keys.\n# Size ceiling: keep this list below 31 names. GER_LTINF_01 (ranger_battalion, 31) and GER_Mnt_01 (mountaineers, 33) must stay larger,\n# or Jäger and mountain templates take the ski list on their own [NAM-018].",
  "add": [
    "# Historical: the Heer's only ski division",
    "1=%d. Skijäger-Division",
    "# Plausible expansion: winter-sport towns and highland regions of the Reich, Austria and the Sudetenland",
    "2=%d. Skijäger-Division 'Oberhof'",
    "3=%d. Skijäger-Division 'Oberwiesenthal'",
    "4=%d. Skijäger-Division 'Braunlage'",
    "5=%d. Skijäger-Division 'Winterberg'",
    "6=%d. Skijäger-Division 'Feldberg'",
    "7=%d. Skijäger-Division 'Oberammergau'",
    "8=%d. Skijäger-Division 'Reit im Winkl'",
    "9=%d. Skijäger-Division 'Ruhpolding'",
    "10=%d. Skijäger-Division 'Kitzbühel'",
    "11=%d. Skijäger-Division 'Arlberg'",
    "12=%d. Skijäger-Division 'Seefeld'",
    "13=%d. Skijäger-Division 'Semmering'",
    "14=%d. Skijäger-Division 'Bad Gastein'",
    "15=%d. Skijäger-Division 'Schladming'",
    "16=%d. Skijäger-Division 'Montafon'",
    "17=%d. Skijäger-Division 'Stubai'",
    "18=%d. Skijäger-Division 'Altvatergebirge'",
    "# Plausible expansion: battle honours of the Lapland front (20. Gebirgs-Armee, 1941-44)",
    "19=%d. Skijäger-Division 'Lappland'",
    "20=%d. Skijäger-Division 'Salla'",
    "21=%d. Skijäger-Division 'Petsamo'",
    "22=%d. Skijäger-Division 'Kiestinki'",
    "# Historical: the ski regiments and battalions of 1942-44 (the brigade and the MG-Ski-Brigade Finnland are in GER_BRIG_01)",
    "901=Skijäger-Regiment 1",
    "902=Skijäger-Regiment 2",
    "903=Skijäger-Bataillon 2",
    "904=Skijäger-Bataillon 4",
    "905=Skijäger-Bataillon 5",
    "906=Skijäger-Bataillon 7",
    "907=Skijäger-Bataillon 9",
    "908=Skijäger-Bataillon 11"
  ] }
```

```json batch
{ "addGroup": true, "group": "FJPZ_01", "selector": "Luftwaffe Panzer Divisions", "after": "SKI_01",
  "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor", "mechanized"],
  "fallback": "Fallschirm-Panzer-Division %d",
  "comment": "# Luftwaffe armoured arm grown from the Fallschirm-Panzerkorps 'Hermann Göring' (number after the designation, as in the real units).\n# Plain variant (bare numbers); the Named list GER_FJPZ_02 shares its numbering. Far smaller than GER_Arm_01 and GER_MEC_01, so Panzer and\n# Panzergrenadier templates keep their main lists. The Nazi honour names ('Hermann Göring', 'Legion Condor') are in GER_ELI_01, fascist-only." }
```

```json batch
{ "addGroup": true, "group": "FJPZ_02", "selector": "Luftwaffe Panzer (Named)", "after": "FJPZ_01",
  "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor", "mechanized"],
  "fallback": "Fallschirm-Panzer-Division %d", "link": "FJPZ_01",
  "comment": "# Named variant of GER_FJPZ_01: the Luftwaffe's Geschwader tradition names and Beinamen, the aces it honoured, and aviation pioneers.\n# Apolitical names only: 'Horst Wessel', 'Schlageter', 'Legion Condor', 'Hermann Göring' (all real Traditionsnamen) and 'Nowotny' (NSDAP member) are left out.",
  "add": [
    "# Plausible expansion: the Traditionsgeschwader names of 1935-44",
    "1=Fallschirm-Panzer-Division %d 'Richthofen'",
    "2=Fallschirm-Panzer-Division %d 'Boelcke'",
    "3=Fallschirm-Panzer-Division %d 'Immelmann'",
    "4=Fallschirm-Panzer-Division %d 'General Wever'",
    "5=Fallschirm-Panzer-Division %d 'Hindenburg'",
    "6=Fallschirm-Panzer-Division %d 'Udet'",
    "7=Fallschirm-Panzer-Division %d 'Mölders'",
    "8=Fallschirm-Panzer-Division %d 'Oesau'",
    "# Plausible expansion: aces who died in service 1940-43",
    "9=Fallschirm-Panzer-Division %d 'Wick'",
    "10=Fallschirm-Panzer-Division %d 'Marseille'",
    "11=Fallschirm-Panzer-Division %d 'Philipp'",
    "# Plausible expansion: Geschwader emblems (JG 53, JG 77, KG 2)",
    "12=Fallschirm-Panzer-Division %d 'Pik As'",
    "13=Fallschirm-Panzer-Division %d 'Herz As'",
    "14=Fallschirm-Panzer-Division %d 'Holzhammer'",
    "# Plausible expansion: aviation pioneers and aces of 1914-18",
    "15=Fallschirm-Panzer-Division %d 'Lilienthal'",
    "16=Fallschirm-Panzer-Division %d 'Zeppelin'",
    "17=Fallschirm-Panzer-Division %d 'Voss'",
    "18=Fallschirm-Panzer-Division %d 'Löwenhardt'",
    "19=Fallschirm-Panzer-Division %d 'Rumey'",
    "20=Fallschirm-Panzer-Division %d 'Kirschstein'"
  ] }
```

```json batch
{ "addGroup": true, "group": "PZZUG_01", "selector": "Armored Trains", "after": "FJPZ_02",
  "addType": ["armored_car"],
  "fallback": "Panzerzug %d",
  "comment": "# The Wehrmacht's Eisenbahn-Panzerzüge on their real numbers, in raising order, and the Panzertriebwagen; short period form 'Panzerzug N'.\n# Plausible expansion: named trains after Prussian commanders who died before 1914 (no real Wehrmacht train carried a name).\n# Typed armored_car and larger than GER_AUFKL_01 (3): a template of armoured-car battalions alone takes this list on its own [NAM-018];\n# a mixed template with tanks keeps GER_Arm_01. Choose Reconnaissance Battalions in the designer for pure armoured-car templates.",
  "add": [
    "# Historical: the trains of 1938-39 (1, 3, 5 and 6 under III., VII., IX. and I. Armeekorps; then the rest of the first series)",
    "1=Panzerzug %d",
    "3=Panzerzug %d",
    "5=Panzerzug %d",
    "6=Panzerzug %d",
    "2=Panzerzug %d",
    "4=Panzerzug %d",
    "7=Panzerzug %d",
    "9=Panzerzug %d",
    "10=Panzerzug %d",
    "11=Panzerzug %d",
    "# Historical: captured Polish and Soviet trains rebuilt 1940-41 (21-32) and the 1942 conversions (51, 52)",
    "21=Panzerzug %d",
    "22=Panzerzug %d",
    "23=Panzerzug %d",
    "24=Panzerzug %d",
    "25=Panzerzug %d",
    "26=Panzerzug %d",
    "27=Panzerzug %d",
    "28=Panzerzug %d",
    "29=Panzerzug %d",
    "30=Panzerzug %d",
    "31=Panzerzug %d",
    "32=Panzerzug %d",
    "51=Panzerzug %d",
    "52=Panzerzug %d",
    "# Historical: the BP 42 series of 1942-44 (61-84)",
    "61=Panzerzug %d",
    "62=Panzerzug %d",
    "63=Panzerzug %d",
    "64=Panzerzug %d",
    "65=Panzerzug %d",
    "66=Panzerzug %d",
    "67=Panzerzug %d",
    "68=Panzerzug %d",
    "69=Panzerzug %d",
    "70=Panzerzug %d",
    "71=Panzerzug %d",
    "72=Panzerzug %d",
    "73=Panzerzug %d",
    "74=Panzerzug %d",
    "75=Panzerzug %d",
    "76=Panzerzug %d",
    "77=Panzerzug %d",
    "78=Panzerzug %d",
    "79=Panzerzug %d",
    "80=Panzerzug %d",
    "81=Panzerzug %d",
    "82=Panzerzug %d",
    "83=Panzerzug %d",
    "84=Panzerzug %d",
    "# Historical: the Panzertriebwagen (own series; the number is in the text)",
    "915=Panzertriebwagen 15",
    "916=Panzertriebwagen 16",
    "917=Panzertriebwagen 17",
    "918=Panzertriebwagen 18",
    "919=Panzertriebwagen 19",
    "920=Panzertriebwagen 20",
    "921=Panzertriebwagen 21",
    "922=Panzertriebwagen 22",
    "923=Panzertriebwagen 23",
    "930=Panzertriebwagen 30",
    "931=Panzertriebwagen 31",
    "932=Panzertriebwagen 32",
    "933=Panzertriebwagen 33",
    "934=Panzertriebwagen 34",
    "935=Panzertriebwagen 35",
    "936=Panzertriebwagen 36",
    "937=Panzertriebwagen 37",
    "938=Panzertriebwagen 38",
    "951=Panzerjäger-Triebwagen 51",
    "# Plausible expansion: named trains after Prussian commanders",
    "901=Panzerzug 'Blücher'",
    "902=Panzerzug 'Gneisenau'",
    "903=Panzerzug 'Yorck'",
    "904=Panzerzug 'Moltke'",
    "905=Panzerzug 'Roon'",
    "906=Panzerzug 'Zieten'",
    "907=Panzerzug 'Derfflinger'",
    "908=Panzerzug 'Wrangel'",
    "909=Panzerzug 'Steinmetz'",
    "910=Panzerzug 'Goeben'",
    "911=Panzerzug 'Bülow'",
    "912=Panzerzug 'Tauentzien'",
    "913=Panzerzug 'Schlieffen'",
    "914=Panzerzug 'Nettelbeck'"
  ] }
```

```json batch
{ "addGroup": true, "group": "RAD_01", "selector": "Bicycle Brigades", "after": "PZZUG_01",
  "addType": ["bicycle_battalion"],
  "fallback": "Radfahr-Jäger-Brigade %d",
  "comment": "# Bicycle brigades grown from the Radfahr-Jäger-Brigade 10 (East Prussia, January 1945), the only German cyclist formation above battalion;\n# no Radfahr-Division is attested, so the list stays at brigade level. Plausible expansion: flat regions of the 1937 Reich and Austria.\n# The two real brigades moved here from GER_BRIG_01 on 2026-10-28.",
  "add": [
    "# Historical: the brigades of 1944-45",
    "10=Radfahr-Jäger-Brigade %d",
    "901=Radfahr-Aufklärungs-Brigade Norwegen",
    "# Plausible expansion: the North German plain and the Prussian east",
    "1=Radfahr-Jäger-Brigade %d 'Altmark'",
    "2=Radfahr-Jäger-Brigade %d 'Uckermark'",
    "3=Radfahr-Jäger-Brigade %d 'Havelland'",
    "4=Radfahr-Jäger-Brigade %d 'Prignitz'",
    "5=Radfahr-Jäger-Brigade %d 'Fläming'",
    "6=Radfahr-Jäger-Brigade %d 'Magdeburger Börde'",
    "7=Radfahr-Jäger-Brigade %d 'Hildesheimer Börde'",
    "8=Radfahr-Jäger-Brigade %d 'Münsterland'",
    "9=Radfahr-Jäger-Brigade %d 'Wesermarsch'",
    "11=Radfahr-Jäger-Brigade %d 'Angeln'",
    "12=Radfahr-Jäger-Brigade %d 'Wendland'",
    "13=Radfahr-Jäger-Brigade %d 'Holsteinische Schweiz'",
    "14=Radfahr-Jäger-Brigade %d 'Mecklenburgische Seenplatte'",
    "15=Radfahr-Jäger-Brigade %d 'Niederlausitz'",
    "16=Radfahr-Jäger-Brigade %d 'Spreewald'",
    "17=Radfahr-Jäger-Brigade %d 'Oderbruch'",
    "18=Radfahr-Jäger-Brigade %d 'Warthebruch'",
    "19=Radfahr-Jäger-Brigade %d 'Natangen'",
    "20=Radfahr-Jäger-Brigade %d 'Ermland'",
    "# Plausible expansion: the south-west and Austria",
    "21=Radfahr-Jäger-Brigade %d 'Kraichgau'",
    "22=Radfahr-Jäger-Brigade %d 'Rheinhessen'",
    "23=Radfahr-Jäger-Brigade %d 'Wetterau'",
    "24=Radfahr-Jäger-Brigade %d 'Marchfeld'",
    "25=Radfahr-Jäger-Brigade %d 'Weinviertel'",
    "26=Radfahr-Jäger-Brigade %d 'Waldviertel'",
    "27=Radfahr-Jäger-Brigade %d 'Mühlviertel'",
    "28=Radfahr-Jäger-Brigade %d 'Innviertel'",
    "29=Radfahr-Jäger-Brigade %d 'Hausruck'"
  ] }
```
