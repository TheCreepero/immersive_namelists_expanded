# Germany-Additional (GER_ADDITIONAL) Namelist Audit - 2026-10-25

Status: READY

File: `common/units/names_divisions/zz_INEX_GER_ADDITIONAL_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GER_ADDITIONAL`)
- AUDIT SUMMARY GER_ADDITIONAL: GROUPS=24 AUTHORED=556/917 FLAGS=25
- [GER_SCHWERE_PANZERABTEILUNG_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_SCHWERE_PANZERABTEILUNG_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_ARM_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_STUG_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_PANZERARTILLERIE_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_RESERVE_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_VOLKSGRENADIER_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, POLITICAL_ENTRY
- [GER_LUFTWAFFEN_FELD_DIVISION_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_FLAK_DIVISION_01] flags: PLACEHOLDER_ENTRIES
- [GER_BRIG_01] flags: PLACEHOLDER_ENTRIES
- [GER_PEN_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_STURM_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_LANDWEHR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- Found on manual review:
  - The file header names `GER_MIL_01`-`GER_MIL_03` as vanilla overrides but not `GER_PEN_01`, which is also a vanilla tag (it has no vanilla names, and the vanilla focus `GER_strafbataillon` creates divisions from it). Its gating paragraph leaves out the Imperial lists `GER_STURM_01` and `GER_LANDWEHR_01`.
  - Vanilla merge check (`-InspectVanilla GER`, [NAM-020]): the file reuses four vanilla tags. `GER_PEN_01` has no vanilla entries. INEX entries cover every vanilla key of `GER_MIL_01` (keys 1-4), `GER_MIL_02` (1-4) and `GER_MIL_03` (1-10), so no vanilla name stays in the game. No R12 action.
  - All 13 PLACEHOLDER_ENTRIES and 11 LOW_DEPTH flags are on historical number series (tooling backlog: the lint counts real numbered entries as placeholders). The only depth this audit can add is formations the army really fielded that the lists still lack.

## User decisions
- Scope (2026-10-25, before research): Imperial Reserve Divisions, early Panzer-Brigaden, and the historical gaps (Flak stations, Volksgrenadier numbers, Landwehr and Sturm-Bataillon numbers). Header and comments come along as a minor fix.
- Checkpoint (2026-10-25): ADD-1 to ADD-5 approved as reported, the Author confirmation entries included. Nothing dropped.

## Research
- One `inex-audit-researcher` dispatch, 25 web calls (Genwiki and Lexikon der Wehrmacht were blocked or returned 404).
- Main sources:
  - en.wikipedia "List of Divisions of the Imperial German Army" and the per-division pages: 1st, 3rd, 5th, 10th, 15th, 21st, 23rd, 26th, 54th and 76th Reserve Division; the 1st, 5th, 6th, 8th, 9th, 30th and 39th Bavarian Reserve Division; the 5th and 10th Ersatz Division; the Bavarian Ersatz Division; the 85th Landwehr Division.
  - de.wikipedia "24. Reserve-Division (2. Königlich Sächsische)" (de-academic mirror).
  - The unit history "Die 26. (Württembergische) Reserve-Division im Weltkrieg 1914-1918" (Stuttgart 1935).
  - en.wikipedia "List of German brigades in World War II" and "101st Panzer Brigade".
  - de.wikipedia "Volksgrenadier-Division".
  - en.wikipedia "Flak division", "5th Flak Division" and "7th Flak Division"; de-academic "21. Flak-Division".
- Vanilla: `-InspectVanilla GER`.

## Rationale
Scope (user, 2026-10-25): an Imperial Reserve list, the early Panzer-Brigaden, and the historical gaps in the numbered series. Every other group stays as it is.

- **ADD-1: new group `GER_MONRES_01` "Imperial Reserve Divisions".** The GER plan of 2026-10-25 left this list for a later plan, to go in the ADDITIONAL file beside `GER_LANDWEHR_01`.
  - Settings:
    - placed after `GER_STURM_01`, in the Imperial section;
    - types `infantry`;
    - gate `OR = { has_government = neutrality has_government = democratic }`, the gate of every Imperial list;
    - fallback `%d. Reserve-Division`;
    - its own number series (no `link_numbering_with`), like the Landwehr list.
  - It has 59 names:
    - The numbered Reserve-Divisionen, keyed on their real numbers: 1, 3, 5, 6, 7, 9-19, 21-26, 28, 33, 35, 36, 43-54, 75-82 (46 entries). The Saxon 23. and 24. carry the state in brackets, as the Saxon Landwehr divisions do (`%d. Reserve-Division (1. Königlich Sächsische)`). The 26. is written `%d. (Württembergische) Reserve-Division`, the form of the Württemberg Landwehr divisions.
    - The seven Royal Bavarian Reserve-Divisionen (their own series: 1, 5, 6, 8, 9, 30, 39) on keys 901-907. They are static text in the style of the Bavarian Landwehr entries (`1. Kgl. Bayer. Reserve-Division`).
    - The Ersatz-Divisionen 4, 5, 8, 10 and 19 and the Bavarian Ersatz-Division on keys 911-916.
  - Left out:
    - Reserve-Division 2, 4, 8, 20 and 27: not on the list page; the 27. was a regular Württemberg division.
    - Bavarian numbers 10-16: not attested.
    - The 1. and 2. Garde-Reserve-Division and the Garde-Ersatz-Division: already in the main file's Guard list.
- **ADD-2: ten earlier Panzer-Brigaden in `GER_ARM_03`,** keyed on their real numbers, under a new section header:
  - the brigade staffs of 1935-42 (1., 2., 3., 4., 5., 6., 8.);
  - the 18. and 21. Panzer-Brigade;
  - the 100. Panzer-Brigade of 1941 (captured French tanks).
  - Style: before 1944 the designation was `%d. Panzer-Brigade` (list page); the 1944 brigades already in the list are `Panzer-Brigade 101`. The new entries are therefore static `%d. Panzer-Brigade` patterns, not the fallback.
  - Not added: the first 101. Panzer-Brigade (1941), whose number the 1944 brigade on key 101 already holds.
  - Dropped: 'Kurland' (unverified), 'Westfalen' (an SS ad hoc brigade), 'Großdeutschland' (an Ersatz-Brigade).
- **ADD-3: Flak home stations in `GER_FLAK_DIVISION_01`.** Stations are added where verified, as the section header promises: 5 'Darmstadt', 7 'Köln', 21 'Wiesbaden'.
  - The 21. was raised at Darmstadt in 1943 and moved to Wiesbaden in March 1944. Wiesbaden avoids a second 'Darmstadt'.
  - Unverified stations stay plain: 6, 11, 13, 14, 15, 16, 19, 20, 25, 27, 31.
  - 10, 12, 17, 18 and 23 were field divisions and get no station.
- **ADD-4: key 264 in `GER_VOLKSGRENADIER_01`,** as `%d. Volksgrenadier-Division`. It is the one number on de.wikipedia's list that the group lacks.
  - 543, 546, 550 and 552 are not added: those 29th-wave divisions were renumbered 78, 45, 31 and 6, which the list already holds.
  - 22 is not added: it appears only in a navbox, and the main file's `GER_ALTINF_01` holds 22 as the Luftlande division.
- **ADD-5: file header (`-SetHeader`).** It names `GER_PEN_01` among the vanilla overrides and the Imperial lists in the gating paragraph.

Extrapolated names: none. Every added name is a formation on a list page or on its own page.

Checked, no change:
- `GER_LANDWEHR_01`: no 24. Landwehr-Division existed. The 6. was Bavarian and is already on key 903. The 86. and 87. were infantry divisions.
- `GER_STURM_01`: Nr. 13 never grew beyond a company (the wiki page already says so). Nr. 18 stays.
- `GER_GRENADIER_DIVISION_01`: 560 belongs to the 30th wave, which the section header names. 563 is not attested as a Grenadier-Division and is not added.

## Verified formations & commanders
- Legacy entries: the "Verified formations & commanders" sections of `docs/plans/archive/2026-10-09-germany-additional-audit.md` and `docs/superpowers/plans/2026-09-30-germany-namelist.md`.
- This audit:
  - Reserve-Divisionen 1, 3, 5, 6, 7, 9-19, 21-26, 28, 33, 35, 36, 43-54, 75-82: en.wikipedia "List of Divisions of the Imperial German Army". Own pages checked for 1, 3, 5, 10, 15, 21, 23, 26, 54 and 76.
  - 23. Reserve-Division, Royal Saxon (XII. Reserve-Korps): en.wikipedia "23rd Reserve Division".
  - 24. Reserve-Division (2. Königlich Sächsische): de.wikipedia article title (de-academic).
  - 26. (Württembergische) Reserve-Division: title of the 1935 unit history.
  - Bavarian Reserve-Divisionen 1, 5, 6, 8, 9, 30, 39: the list page and their own en.wikipedia pages. The form "39. Kgl. Bayerische Reserve-Division": en.wikipedia "39th Bavarian Reserve Division".
  - Ersatz-Divisionen 4, 5, 8, 10, 19 and the Bavarian Ersatz-Division: the list page; en.wikipedia "5th Ersatz Division", "10th Ersatz Division" and "Bavarian Ersatz Division".
  - Panzer-Brigaden 1, 2, 3, 4, 5, 6, 8, 18, 21, 100: en.wikipedia "List of German brigades in World War II".
    - 5. Panzer-Brigade (4. Panzer-Division, 1938-42): erenow "Panzer Warfare on the Eastern Front".
    - 100. and 101. Panzer-Brigade (1941): en.wikipedia "101st Panzer Brigade".
  - 264. Volksgrenadier-Division: de.wikipedia "Volksgrenadier-Division".
  - Flak stations:
    - 5. Darmstadt: en.wikipedia "5th Flak Division".
    - 7. Köln: en.wikipedia "7th Flak Division".
    - 21. Darmstadt in 1943, Wiesbaden from March 1944: de-academic "21. Flak-Division".

## Author confirmation
- `18. Panzer-Brigade` and `21. Panzer-Brigade` (`GER_ARM_03`): their existence rests on the list page alone. The 18. was a staff only, from May 1942 to January 1943 (a forum post citing Tessin).
- The parent divisions of the Panzer-Brigaden 4, 6 and 8 were not verified. The names do not depend on them.
- `264. Volksgrenadier-Division`: one source (de.wikipedia).
- `Kgl. Bayer. Ersatz-Division` (`GER_MONRES_01` key 916): the unit is verified; the abbreviated style is taken from the Bavarian Landwehr entries.
- The Bavarian Reserve entries are written "Kgl. Bayer." where the sources have "Kgl. Bayerische" or "Bayerische", to match `GER_LANDWEHR_01`.

## Kept on judgment
After the batch, `-Check GER_ADDITIONAL` shows `GROUPS=25 AUTHORED=561/987 FLAGS=27` (previewed on a scratch copy). The 27 flags, and no others:
- PLACEHOLDER_ENTRIES (14) on `GER_SCHWERE_PANZERABTEILUNG_01`, `GER_SCHWERE_PANZERABTEILUNG_02`, `GER_ARM_03`, `GER_STUG_01`, `GER_PANZERARTILLERIE_DIVISION_01`, `GER_RESERVE_DIVISION_01`, `GER_VOLKSGRENADIER_01`, `GER_LUFTWAFFEN_FELD_DIVISION_01`, `GER_FLAK_DIVISION_01`, `GER_BRIG_01`, `GER_PEN_01`, `GER_STURM_01`, `GER_MONRES_01` and `GER_LANDWEHR_01`. These are historical number series whose entries are required, because the fallback alone would count 1, 2, 3. The lint counts real numbered entries as placeholders (tooling backlog).
- LOW_DEPTH (12) on the same groups except `GER_FLAK_DIVISION_01` and `GER_BRIG_01`. Each list holds every attested formation of its series; padding would mean inventing formations.
- POLITICAL_ENTRY (1) on `GER_VOLKSGRENADIER_01`, `%d. Volks-Sturm-Division` (key 78): the designation the 78. Sturm-Division received in 1945, not a militia.

New against the 2026-10-09 plan: the PLACEHOLDER_ENTRIES and LOW_DEPTH flags of the new `GER_MONRES_01`. The Workshop description stays well under the 17,000-character limit (12,640 before the docs edits, which add about 30 characters).

## Implementation steps
- [ ] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GER_ADDITIONAL -Batch <this file>`. Expect one line per operation (four: `GER_MONRES_01` added, `GER_ARM_03`, `GER_FLAK_DIVISION_01`, `GER_VOLKSGRENADIER_01`) and no `[ERROR]`.
- [ ] 2. Replace the file header (ADD-5), run exactly as written on one line:
  `powershell -File .\build.ps1 -SetHeader GER_ADDITIONAL -HeaderText "Division template historical names system for Germany (GER): additional formations.\nImmersive Namelists Expanded (INEX)\n\nNumbered series, specialised units, garrisons and fortresses, Kampfgruppen, militias, foreign\nlegions and the Imperial series. Period German spelling and 1939-45 exonyms (Reval, Wilna, Kiew,\nCharkow); identities appended to a designation go in single quotes, historical proper names do not.\n\nNumbering: Reserve, Volksgrenadier and Grenadier divisions link to GER_Inf_01 and sit on their\nreal numbers (one Heer number series). Luftwaffe field divisions, Flak divisions, battalions,\nbrigades, garrisons, militias and the Imperial lists run their own series.\n\nIdeology gating: Volkssturm, SA and foreign legions are fascist-only; Freikorps (neutrality),\nReichsbanner (democratic) and Red Front Fighters (communism) cover the other paths. The Imperial\nSturm-Bataillone, Reserve and Landwehr divisions serve neutrality and democratic governments.\nOverrides vanilla GER_PEN_01, GER_MIL_01, GER_MIL_02 and GER_MIL_03 (all created by vanilla focuses)."`
  Expect a line confirming the header was replaced and no `[ERROR]`.
- [ ] 3. `powershell -File .\build.ps1 -SyncWiki GER_ADDITIONAL`, then make the seven edits listed under "Docs payload".
- [ ] 4. `powershell -File .\build.ps1 -Check GER_ADDITIONAL`. Expect `Check passed`; the remaining flags must match "Kept on judgment".
- [ ] 5. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 6. Ship, on the user's word: commit with the message `Audit GER_ADDITIONAL: add Imperial Reserve divisions, early Panzer-Brigaden and Flak stations`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit GER_ADDITIONAL: add Imperial Reserve divisions, early Panzer-Brigaden and Flak stations"`.

## Docs payload
README.md: no change. `-SyncWiki GER_ADDITIONAL` writes the wiki table row for `GER_MONRES_01` and the `wiki/Home.md` group count. Make these prose edits with Edit, matching the current text exactly.

**`wiki/Germany-Additional.md`**

1. Historical Overview. Current:
   `- **Imperial series:** the Sturm-Bataillone of 1916–18 and the Landwehr divisions of 1914–18.`
   Replace with:
   `- **Imperial series:** the Sturm-Bataillone of 1916–18 and the Reserve, Ersatz and Landwehr divisions of 1914–18.`

2. Ideology gating. Current:
   `- **Neutrality and democratic:** Imperial Storm Battalions and Imperial Landwehr Divisions.`
   Replace with:
   `- **Neutrality and democratic:** Imperial Storm Battalions, Imperial Reserve Divisions and Imperial Landwehr Divisions.`

3. Group Details, `GER_ARM_03`. Current:
   `*Panzer-Brigade 10* (Kursk), the 1944 *Panzer-Brigaden 101–113* and *150*, and *Panzer-Brigade 'Norwegen'*, for small armoured templates.`
   Replace with:
   `The brigade staffs of the Panzer divisions of 1935–42 (*1.*–*6.* and *8. Panzer-Brigade*), the *18.* and *21.*, and the *100. Panzer-Brigade* of 1941 with captured French tanks. Then *Panzer-Brigade 10* (Kursk), the 1944 *Panzer-Brigaden 101–113* and *150*, and *Panzer-Brigade 'Norwegen'*. For small armoured templates.`

4. Group Details, `GER_FLAK_DIVISION_01`. Current:
   `*1.–31. Flak-Division* and the two Flakscheinwerfer divisions. A home is noted where verified (*1. 'Berlin'*, *3. 'Hamburg'*, *26. 'München'*, *29. 'Oslo'*), and *9. 'Stalingrad'* marks the division destroyed there.`
   Replace with:
   `*1.–31. Flak-Division* and the two Flakscheinwerfer divisions. A home is noted where verified (*1. 'Berlin'*, *3. 'Hamburg'*, *7. 'Köln'*, *26. 'München'*, *29. 'Oslo'*), and *9. 'Stalingrad'* marks the division destroyed there.`

5. Group Details: insert this block directly before the line `### \`GER_LANDWEHR_01\` — Imperial Landwehr Divisions (neutrality/democratic)`, followed by one blank line:
   ```
   ### `GER_MONRES_01` — Imperial Reserve Divisions (neutrality/democratic)
   The Reserve divisions of 1914–18 on their real numbers (*1.* to *82. Reserve-Division*), for the Imperial path:
   - The Saxon *23.* and *24.* and the *26. (Württembergische) Reserve-Division* with their state names.
   - The seven Bavarian Reserve divisions in their own series (*1. Kgl. Bayer. Reserve-Division* to *39.*).
   - The Ersatz divisions (*4.*, *5.*, *8.*, *10.* and *19. Ersatz-Division*, and the *Kgl. Bayer. Ersatz-Division*).

   The Guard Reserve divisions are in the Guard list of the [Heer](Germany) file.
   ```

**`WORKSHOP_DESCRIPTION_GUIDELINES.md`**

6. Cross-reference row of `zz_INEX_GER_ADDITIONAL_names_divisions.txt`. Current ending:
   `Foreign Legions, Imperial Sturm-Bataillone & Landwehr) |`
   Replace with:
   `Foreign Legions, Imperial Sturm-Bataillone, Reserve & Landwehr divisions) |`

7. `[b]Germany[/b]` block, third bullet. Current fragment:
   `Sturm-Bataillone, Landwehr & Freikorps ([i]5. Kampfwagen-Division 'Mephisto'[/i])`
   Replace with:
   `Sturm-Bataillone, Reserve & Landwehr divisions, Freikorps ([i]5. Kampfwagen-Division 'Mephisto'[/i])`

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (the batch adds 70 names, almost all numbered designation patterns, so the 25-authored-name threshold for `inex-proofreader` is not met):
- Every added name is in "Verified formations & commanders" or "Author confirmation": yes (Reserve, Bavarian Reserve and Ersatz divisions; ten Panzer-Brigaden; the 264. Volksgrenadier-Division; three Flak stations).
- Extrapolated names: none, as stated in the Rationale.
- Orthography: `Königlich Sächsische`, `(Württembergische)`, `Kgl. Bayer.`, `Köln` match the forms already in `GER_LANDWEHR_01` and the sources.
- Preview on a scratch copy: the batch applied (`Added GER_MONRES_01 ... 59 name(s)`, `GER_ARM_03 +10`, `GER_FLAK_DIVISION_01 ~3`, `GER_VOLKSGRENADIER_01 +1`), and `-ValidateOnly` passed all 21 namelist files.

## Outcome
<!-- TODO(implementer): date, the -Check summary, deviations from this plan with the reason -->

## Edit batch
Applied by `build.ps1 -EditNames GER_ADDITIONAL -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{ "addGroup": true, "group": "GER_MONRES_01", "selector": "Imperial Reserve Divisions", "addType": "infantry", "fallback": "%d. Reserve-Division",
  "canUse": "OR = { has_government = neutrality has_government = democratic }", "after": "GER_STURM_01",
  "comment": "Reserve-Divisionen of 1914-18 on their real numbers, then the Bavarian series and the Ersatz-Divisionen. Own number series.",
  "add": [
    "# Reserve-Divisionen of 1914-18 on their real numbers",
    "1=%d. Reserve-Division", "3=%d. Reserve-Division", "5=%d. Reserve-Division", "6=%d. Reserve-Division", "7=%d. Reserve-Division",
    "9=%d. Reserve-Division", "10=%d. Reserve-Division", "11=%d. Reserve-Division", "12=%d. Reserve-Division", "13=%d. Reserve-Division",
    "14=%d. Reserve-Division", "15=%d. Reserve-Division", "16=%d. Reserve-Division", "17=%d. Reserve-Division", "18=%d. Reserve-Division",
    "19=%d. Reserve-Division", "21=%d. Reserve-Division", "22=%d. Reserve-Division",
    "23=%d. Reserve-Division (1. Königlich Sächsische)", "24=%d. Reserve-Division (2. Königlich Sächsische)",
    "25=%d. Reserve-Division", "26=%d. (Württembergische) Reserve-Division", "28=%d. Reserve-Division",
    "33=%d. Reserve-Division", "35=%d. Reserve-Division", "36=%d. Reserve-Division",
    "43=%d. Reserve-Division", "44=%d. Reserve-Division", "45=%d. Reserve-Division", "46=%d. Reserve-Division", "47=%d. Reserve-Division",
    "48=%d. Reserve-Division", "49=%d. Reserve-Division", "50=%d. Reserve-Division", "51=%d. Reserve-Division", "52=%d. Reserve-Division",
    "53=%d. Reserve-Division", "54=%d. Reserve-Division",
    "75=%d. Reserve-Division", "76=%d. Reserve-Division", "77=%d. Reserve-Division", "78=%d. Reserve-Division", "79=%d. Reserve-Division",
    "80=%d. Reserve-Division", "81=%d. Reserve-Division", "82=%d. Reserve-Division",
    "# Royal Bavarian Reserve-Divisionen (their own number series)",
    "901=1. Kgl. Bayer. Reserve-Division", "902=5. Kgl. Bayer. Reserve-Division", "903=6. Kgl. Bayer. Reserve-Division",
    "904=8. Kgl. Bayer. Reserve-Division", "905=9. Kgl. Bayer. Reserve-Division", "906=30. Kgl. Bayer. Reserve-Division",
    "907=39. Kgl. Bayer. Reserve-Division",
    "# Ersatz-Divisionen of 1914-18",
    "911=4. Ersatz-Division", "912=5. Ersatz-Division", "913=8. Ersatz-Division", "914=10. Ersatz-Division", "915=19. Ersatz-Division",
    "916=Kgl. Bayer. Ersatz-Division"
  ] }
```

```json batch
{ "group": "GER_ARM_03", "section": "Historical: the Panzer-Brigaden of 1935-43 and the captured-tank brigade of 1941",
  "add": ["1=%d. Panzer-Brigade", "2=%d. Panzer-Brigade", "3=%d. Panzer-Brigade", "4=%d. Panzer-Brigade", "5=%d. Panzer-Brigade",
          "6=%d. Panzer-Brigade", "8=%d. Panzer-Brigade", "18=%d. Panzer-Brigade", "21=%d. Panzer-Brigade", "100=%d. Panzer-Brigade"] }
```

```json batch
{ "group": "GER_FLAK_DIVISION_01", "set": ["5=%d. Flak-Division 'Darmstadt'", "7=%d. Flak-Division 'Köln'", "21=%d. Flak-Division 'Wiesbaden'"] }
```

```json batch
{ "group": "GER_VOLKSGRENADIER_01", "add": ["264=%d. Volksgrenadier-Division"] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
No name changes versus the base revision.
<!-- END CHANGE TABLE -->
