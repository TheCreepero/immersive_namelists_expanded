# Germany-Waffen-SS (GER_SS) Namelist Audit - 2026-10-28

Status: DONE

File: `common/units/names_divisions/zz_INEX_GER_SS_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GER_SS`)
- AUDIT SUMMARY GER_SS: GROUPS=10 AUTHORED=612/616 FLAGS=2
- File: IDENTITY_REPEAT: 'Julius Schreck' (GER_SS_01, GER_SS_02, GER_SS_03, GER_SS_04, GER_SS_05, GER_SS_06, GER_SS_07, GER_SS_STANDARTE_01)
- [GER_SS_04] flags: NAME_LONG
- Found on manual review: no defects in the ten existing groups. Gap: the Waffen-SS has no list for its paratroopers or Skorzeny's special units (`paratrooper`, `ranger_battalion`), and none for its corps rocket and heavy artillery battalions (`rocket_artillery_brigade` and the other line ids that no German group lists today).

## User decisions
All final (checkpoint of 2026-10-28):
1. Add `GER_SS_10` "SS Jagdverbände" as proposed.
2. Add the optional `GER_SS_11` "SS Werfer Battalions" and `GER_SS_12` "SS Artillery Battalions".
3. Keep the three inferred corps suffixes (501 Werfer, 501 artillery, 505 Werfer); "Author confirmation" stays as written.
4. Ship order across the three German plans: GER, then GER_ADDITIONAL, then this plan (implementation step 0).

## Research
- Fork of the planning session, acting as the audit researcher (no subagent; parallel run beside the GER_ADDITIONAL planner). 16 of 25 web calls.
- Main sources: de.wikipedia: I. SS-Panzerkorps and II. SS-Panzerkorps (Gliederung, Korpstruppen); en.wikipedia: 502nd SS Jäger Battalion; armedconflicts.com: Special Units of SS Reich Leadership (Czech list of the 500-series Sondertruppen) and SS-Jagdverband Südost (Gliederung); archivportal-d (Bundesarchiv): V. SS-Gebirgskorps (SS-Werfer-Abt. 105); tracesofwar: Hermann Wolters (SS-Werfer-Abteilung 102, later 502); v2rocket.com: SS-Werfer-Abteilung 500 (A4/V-2); warhistory.org: The Schwedt Bridgehead (the five Jagdverbände, SS-Fallschirmjäger-Bataillon 500/600).
- Nothing found for SS Kampfschwimmer, so `marine_commando` stays out of this file.

## Rationale
- **New `GER_SS_10` "SS Jagdverbände"** (`paratrooper`, `ranger_battalion`; fascism; fallback `SS-Jäger-Bataillon %d`). One group, not two: the Waffen-SS had only two parachute battalions (500, renumbered 600 on 1 October 1944), and on 10 November 1944 600 was put under the Jagdverbände with Skorzeny's other units, so they belong to one lineage. A paratrooper list of two names would be too thin to stand alone. The fallback is the attested designation of 1944 (SS-Jäger-Bataillon 502). Draft order (file order decides which name a new division takes, NAM-021): `500=SS-Fallschirmjäger-Bataillon %d`; `1=SS-Sonderverband z.b.V. Friedenthal`; `502=SS-Jäger-Bataillon %d`; `600=SS-Fallschirmjäger-Bataillon %d`; `2..6=SS-Jagdverband Mitte / Ost / Südost / Südwest / Nordwest`; section "Jagdeinsätze of SS-Jagdverband Südost": `7..13=SS-Jagdeinsatz Rumänien / Serbien/Kroatien / Bulgarien / Ungarn / Griechenland / Slowakei / Albanien`; `14=SS-Jagdkommando Donau`. 17 entries; the fallback continues at 601.
- **Optional `GER_SS_11` "SS Werfer Battalions"** (`rocket_artillery_brigade`, `mot_rocket_artillery_brigade`, `motorized_rocket_brigade`; fascism; fallback `SS-Werfer-Abteilung %d`). In September 1944 the SS corps' heavy tank, artillery, Flak and Werfer battalions became Sondertruppen of the Reichsführung-SS and were renumbered from 1xx to 5xx; the Werfer battalions were 500-506. Draft: `500=SS-Werfer-Abteilung %d` (the A4/V-2 battalion); `501=SS-Werfer-Abteilung %d (I. SS-Panzerkorps)`; `502=SS-Werfer-Abteilung %d (II. SS-Panzerkorps)`; `503`, `504` plain; `505=SS-Werfer-Abteilung %d (V. SS-Gebirgskorps)`; 506 comes from the fallback. Same corps-suffix style as `GER_SS_08`. Keys 500-505 are all written so the numbering does not jump past 503 and 504: once the `ordered` entries are used, the fallback takes one above the highest number in use (NAM-021), so 506, 507 and on follow without an entry.
- **Optional `GER_SS_12` "SS Artillery Battalions"** (`artillery_brigade`, `mot_artillery_brigade`; fascism; fallback `schwere SS-Artillerie-Abteilung %d`). Entries `500` (plain) and `501=schwere SS-Artillerie-Abteilung %d (I. SS-Panzerkorps)`; 502-505 and on come from the fallback (NAM-021), so no plain stubs are written for them. All real numbers.
- Both approved, decision 2. Sizes against the Heer lists of the GER_ADDITIONAL plan: the Heer Werfer group has about 23 names, against 6 in `GER_SS_11`; the artillery group has 25 names after its approved additions, against 2 in `GER_SS_12`. Both Heer lists outnumber the SS groups, so the automatic pick for rocket and artillery templates stays with the Heer and the SS lists are a manual choice. That holds only once the GER_ADDITIONAL plan is applied, hence step 0.
- **Not proposed:** SS Flak (only SS-Flak-Abteilung 101, 505, 506 and 509 found, a mixed series), SS Panzerjäger (only 509) and SS Sturmgeschütz (divisional battalions numbered after their divisions). There is too little independent material for any of them.
- **Automatic pick for a fascist Germany (NAM-018, NAM-026: among available groups that list a line battalion of the template, the one with the most names wins):**
  - Pure paratrooper template: today `GER_PAR_01` (25 INEX entries, vanilla's 12 merged in; no other fascist group lists `paratrooper`). `GER_SS_10` (17) loses. The SS list is chosen by hand in the designer, as intended: SS names should not take over every Fallschirmjäger template.
  - Pure ranger template: today `GER_LTINF_01` (31 entries; `ranger_battalion` comes from vanilla's group merged in). `GER_SS_10` loses; manual choice.
  - Mixed infantry templates with a para or ranger battalion: `GER_Inf_01` (308) wins as before.
  - Rocket and artillery templates: no German group lists these ids today. The GER_ADDITIONAL plan adds Heer Werfer and artillery groups; if each is larger than 7 and 6 names (the existing Artillery Divisions group has 16), the SS groups lose and stay manual. If `GER_SS_11`/`GER_SS_12` ship before the GER_ADDITIONAL plan, they would be the only match and would name every rocket or artillery template of a fascist Germany with SS names. The implementation steps will order this plan after GER_ADDITIONAL's.
- Existing groups unchanged.

## Verified formations & commanders
- SS-Fallschirmjäger-Bataillon 500 (formed 1943, Drvar raid May 1944), renumbered 600 on 1 October 1944, put under the Jagdverbände 10 November 1944: warhistory.org: The Schwedt Bridgehead; armedconflicts.com: Special Units of SS Reich Leadership. Well documented.
- SS-Sonderverband z.b.V. Friedenthal (16 June 1943 - 17 April 1944), SS-Jäger-Bataillon 502 (17 April - 10 November 1944), SS-Jagdverband Mitte (from 10 November 1944): en.wikipedia: 502nd SS Jäger Battalion.
- SS-Jagdverband Mitte, Ost, Südost, Südwest, Nordwest: warhistory.org: The Schwedt Bridgehead; weaponsandwarfare.com (Skorzeny's Jagdverbände).
- SS-Jagdeinsatz Rumänien, Serbien/Kroatien, Bulgarien, Ungarn, Griechenland, Slowakei, Albanien; SS-Jagdkommando Donau (under Jagdeinsatz Ungarn): armedconflicts.com: SS-Jagdverband Südost (Gliederung; a secondary wiki-style source).
- SS-Werfer-Abteilung 101 (I. SS-Panzerkorps) and 102 (II. SS-Panzerkorps): de.wikipedia: I. / II. SS-Panzerkorps. 102 later 502: tracesofwar: Hermann Wolters. SS-Werfer-Abt. 105 (V. SS-Gebirgskorps): archivportal-d: V. SS-Gebirgskorps (Bestand). SS-Werfer-Abteilung 500 (A4): v2rocket.com. Series 500-506 and the 1xx-to-5xx renumbering of September 1944: armedconflicts.com: Special Units of SS Reich Leadership.
- schwere SS-Artillerie-Abteilung 101 (I. SS-Panzerkorps): de.wikipedia: I. SS-Panzerkorps. Series 500-505: armedconflicts.com: Special Units of SS Reich Leadership.
- Existing groups: verified in the 2026-10-09 Waffen-SS audit (docs/plans/archive/2026-10-09-germany-waffen-ss-audit.md); not re-checked.

## Author confirmation
- The corps suffixes on 501 (Werfer and artillery, from 101) and 505 (Werfer, from 105) follow the sourced renumbering rule (1xx became 5xx); no single source names "501 = former 101" for those two arms. 502 is confirmed directly.
- The corps of SS-Werfer-Abteilung 503, 504, 506 and schwere SS-Artillerie-Abteilung 500, 502-505 are not given, so those entries carry no suffix.
- SS-Jagdeinsatz names rest on one secondary source (armedconflicts.com).

## Kept on judgment
- `IDENTITY_REPEAT` 'Julius Schreck': key 61 in the linked `GER_SS_01`-`GER_SS_07` is one division under whichever type takes the number (the file's shared honour-name scheme); `1. SS-Standarte 'Julius Schreck'` in `GER_SS_STANDARTE_01` is the historical Munich Standarte. Intended.
- `NAME_LONG` in `GER_SS_04`: official designations such as `%d. SS-Freiwilligen-Panzergrenadier-Division 'Horst Wessel'`; shortening would falsify the title.
- The plain entries of `GER_SS_11` (500, 503, 504) and `GER_SS_12` (500) repeat the fallback on real numbers so the keys stay historical (as in `GER_SS_08`); the -DryRun raised no flag for them. Expected after the batch: `Flags: NAME_LONG x1, IDENTITY_REPEAT x1`.

## Implementation steps
- [x] 0. Precondition: the GER and GER_ADDITIONAL plans (`docs/plans/2026-10-28-germany-audit.md`, `docs/plans/2026-10-28-germany-additional-audit.md`) are `Status: DONE` and moved to `docs/plans/archive/`. Check with `Test-Path docs/plans/2026-10-28-germany-audit.md, docs/plans/2026-10-28-germany-additional-audit.md`: expect `False` twice, and both files present under `docs/plans/archive/`. If either is still live, stop and report: the Heer Werfer and artillery lists must exist, and be larger than `GER_SS_11`/`GER_SS_12`, before these SS groups are added.
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GER_SS -Batch <this file>`. Expect one green line per group (three added groups: `GER_SS_10`, `GER_SS_11`, `GER_SS_12`) and no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki GER_SS`. Expect the three new rows in the "Namelist Groups" table of `wiki/Germany-Waffen-SS.md`. Then make the edit listed under "Docs payload".
- [x] 3. `powershell -File .\build.ps1 -Check GER_SS`. Expect `Check passed`; remaining flags must match "Kept on judgment".
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 5. Ship, on the user's word: commit with the message `Add SS Jagdverbände, Werfer and artillery namelists (GER_SS)`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Add SS Jagdverbände, Werfer and artillery namelists (GER_SS)"`.

## Docs payload
Workshop block and README: handled by the GER_ADDITIONAL plan. No other file than `wiki/Germany-Waffen-SS.md` changes.

`wiki/Germany-Waffen-SS.md`: append after the last line of the file, which is the `GER_SS_STANDARTE_01` details paragraph (`The SS-Verfügungstruppe Standarten (*Deutschland*, ... *1. SS-Standarte 'Julius Schreck'*.`), one blank line, then verbatim:

```markdown
### `GER_SS_10` — SS Jagdverbände
The only parachute battalion of the Waffen-SS (*SS-Fallschirmjäger-Bataillon 500*, renumbered *600* in October 1944) and Otto Skorzeny's special units: *SS-Sonderverband z.b.V. Friedenthal*, *SS-Jäger-Bataillon 502*, the five *SS-Jagdverbände* (*Mitte*, *Ost*, *Südost*, *Südwest*, *Nordwest*) and the *Jagdeinsätze* of Jagdverband Südost. Paratrooper and ranger templates take the Heer lists by default; choose this list in the division designer.

### `GER_SS_11` — SS Werfer Battalions
The corps rocket battalions of the Waffen-SS on their late-1944 numbers, *SS-Werfer-Abteilung 500–506*. *500* fired the A4 (V-2); *501*, *502* and *505* served the I. and II. SS-Panzerkorps and the V. SS-Gebirgskorps. Rocket artillery templates take the Heer list by default; choose this list in the division designer.

### `GER_SS_12` — SS Artillery Battalions
The heavy corps artillery battalions of the Waffen-SS, *schwere SS-Artillerie-Abteilung 500–505*; *501* served the I. SS-Panzerkorps. Artillery templates take the Heer list by default; choose this list in the division designer.
```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (2026-10-28): passed.
- Every added name is in "Verified formations & commanders"; the three corps suffixes and the Jagdeinsatz names are also listed under "Author confirmation".
- Extrapolated names: only the fallback continuations past the real series (`SS-Jäger-Bataillon 601` and up, `SS-Werfer-Abteilung 507` and up, `schwere SS-Artillerie-Abteilung 506` and up), as the Rationale states. No authored entry is extrapolated.
- 25 entries added, 18 of them authored per the -DryRun (612 to 630), below the proofreader threshold of 25; the coordinator may still dispatch `inex-proofreader`.
- -DryRun 2026-10-28: `Dry run OK: 3 operation(s); the file would hold 13 group(s), 641 name(s).`, `Flags: NAME_LONG x1, IDENTITY_REPEAT x1`, no `[WARN] Plan:` line.

## Outcome
- Date: 2026-10-28. Step 0 precondition held (both GER and GER_ADDITIONAL plans archived).
- `-Check GER_SS`: Validate OK; Tests 521 Passed, 0 Failed; `AUDIT SUMMARY GER_SS: GROUPS=13 AUTHORED=630/641 FLAGS=2`; `Flags: NAME_LONG x1, IDENTITY_REPEAT x1` (both listed under "Kept on judgment"); no `Docs:` warnings; `Check passed`.
- Diff vs HEAD: 3 group(s) changed, +25 -0 name(s).
- Deviations: none. Ship step (5) left unticked for the caller.

## Edit batch
Applied by `build.ps1 -EditNames GER_SS -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "addGroup": true, "group": "GER_SS_10", "selector": "SS Jagdverbände", "addType": "paratrooper; ranger_battalion",
  "canUse": "has_government = fascism", "fallback": "SS-Jäger-Bataillon %d", "after": "GER_SS_STANDARTE_01",
  "comment": "SS parachute battalion and Skorzeny's special units (1943-45); real battalion numbers as keys.",
  "add": [
    "# Historical: SS-Fallschirmjäger-Bataillon 500/600 and the Friedenthal units, in order of formation",
    "500=SS-Fallschirmjäger-Bataillon %d",
    "1=SS-Sonderverband z.b.V. Friedenthal",
    "502=SS-Jäger-Bataillon %d",
    "600=SS-Fallschirmjäger-Bataillon %d",
    "# Historical: the five SS-Jagdverbände (November 1944)",
    "2=SS-Jagdverband Mitte",
    "3=SS-Jagdverband Ost",
    "4=SS-Jagdverband Südost",
    "5=SS-Jagdverband Südwest",
    "6=SS-Jagdverband Nordwest",
    "# Historical: the Jagdeinsätze of SS-Jagdverband Südost",
    "7=SS-Jagdeinsatz Rumänien",
    "8=SS-Jagdeinsatz Serbien/Kroatien",
    "9=SS-Jagdeinsatz Bulgarien",
    "10=SS-Jagdeinsatz Ungarn",
    "11=SS-Jagdeinsatz Griechenland",
    "12=SS-Jagdeinsatz Slowakei",
    "13=SS-Jagdeinsatz Albanien",
    "14=SS-Jagdkommando Donau"
  ] }
```

```json batch
{ "addGroup": true, "group": "GER_SS_11", "selector": "SS Werfer Battalions",
  "addType": "rocket_artillery_brigade; mot_rocket_artillery_brigade; motorized_rocket_brigade",
  "canUse": "has_government = fascism", "fallback": "SS-Werfer-Abteilung %d", "after": "GER_SS_10",
  "comment": "Corps rocket battalions of the Waffen-SS, renumbered 1xx to 5xx in September 1944; the fallback continues at 506.",
  "add": [
    "# Historical: Sondertruppen der Reichsführung-SS (late 1944)",
    "500=SS-Werfer-Abteilung %d",
    "501=SS-Werfer-Abteilung %d (I. SS-Panzerkorps)",
    "502=SS-Werfer-Abteilung %d (II. SS-Panzerkorps)",
    "503=SS-Werfer-Abteilung %d",
    "504=SS-Werfer-Abteilung %d",
    "505=SS-Werfer-Abteilung %d (V. SS-Gebirgskorps)"
  ] }
```

```json batch
{ "addGroup": true, "group": "GER_SS_12", "selector": "SS Artillery Battalions",
  "addType": "artillery_brigade; mot_artillery_brigade",
  "canUse": "has_government = fascism", "fallback": "schwere SS-Artillerie-Abteilung %d", "after": "GER_SS_11",
  "comment": "Heavy corps artillery battalions of the Waffen-SS (500-505); the fallback continues from 502.",
  "add": [
    "# Historical: Sondertruppen der Reichsführung-SS (late 1944)",
    "500=schwere SS-Artillerie-Abteilung %d",
    "501=schwere SS-Artillerie-Abteilung %d (I. SS-Panzerkorps)"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| 10 | new, 17 | SS-Fallschirmjäger-Bataillon %d (x2), SS-Sonderverband z.b.V. Friedenthal, SS-Jäger-Bataillon %d, SS-Jagdverband Mitte, SS-Jagdverband Ost, SS-Jagdverband Südost, SS-Jagdverband Südwest, SS-Jagdverband Nordwest, SS-Jagdeinsatz Rumänien, SS-Jagdeinsatz Serbien/Kroatien, SS-Jagdeinsatz Bulgarien, SS-Jagdeinsatz Ungarn, SS-Jagdeinsatz Griechenland, SS-Jagdeinsatz Slowakei, SS-Jagdeinsatz Albanien, SS-Jagdkommando Donau | - | - |
| 11 | new, 6 | SS-Werfer-Abteilung %d (x3), SS-Werfer-Abteilung %d (I. SS-Panzerkorps), SS-Werfer-Abteilung %d (II. SS-Panzerkorps), SS-Werfer-Abteilung %d (V. SS-Gebirgskorps) | - | - |
| 12 | new, 2 | schwere SS-Artillerie-Abteilung %d, schwere SS-Artillerie-Abteilung %d (I. SS-Panzerkorps) | - | - |

Unchanged: 01, 02, 03, 04, 05, 06, 07, 08, 09, STANDARTE_01
<!-- END CHANGE TABLE -->
