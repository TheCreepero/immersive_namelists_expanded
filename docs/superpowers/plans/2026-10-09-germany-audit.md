# Germany (GER) Namelist Audit - 2026-10-09

Status: DONE

File: `common/units/names_divisions/INEX_GER_names_divisions.txt`

Apply after: `docs/superpowers/plans/2026-10-09-germany-namelist.md` has been applied and committed. That plan defines `GER_PEN_01` in the ADDITIONAL file, which step 2 below (the header) relies on. Sister plans, in any order after it: `2026-10-09-germany-waffen-ss-audit.md`, `2026-10-09-germany-additional-audit.md`. G-7 here and ADD-5 in the additional plan are one move (Legion Condor); apply both plans or neither.

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GER`)
- AUDIT SUMMARY GER: GROUPS=22 AUTHORED=770/1262 FLAGS=17
- [GER_Inf_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_MOT_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_MEC_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_Arm_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_LTARM_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_GAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [GER_MEC_01_MONARNCHIST] flags: UNLINKED_MOBILE
- [GER_MONINF_01] flags: NAME_LONG
- [GER_MONMOB_01] flags: NAME_LONG
- [GER_MEC_01_COMMUNIST] flags: UNLINKED_MOBILE
- `-Audit GER` on 2026-10-09 also printed: VANILLA_COPY on `GER_Inf_01` (254/254), `GER_MOT_01` (14/14), `GER_Arm_01` (29/29), `GER_GAR_01` (54/56), `GER_MONMOB_01` (96/111); file-level IDENTITY_REPEAT ('König', 'Prinz Karl von Bayern'). Summary line there: FLAGS=22.
- Found on manual review:
  - `GER_MAR_01`: fallback and 34 entries use "Seelande-Division", a vanilla coinage with no attestation (G-2).
  - `GER_MONINF_01` key 125: regiment title lacks "Kaiser" (G-3).
  - `GER_Arm_02`: "Panzer-Division Bergen" unverified under a "Historical ... named in 1945" header that also holds Kempf (1939) and Norwegen (1943) (G-4).
  - `GER_Arm_02`, `GER_PAR_01`: "Historical" section headers cover kept invented names (G-5).
  - `GER_Arm_02`: three kept invented names contain vehicle names (G-6).
  - File header: "GER_PEN_01 is left to vanilla" goes stale once the namelist plan is applied (G-8).
  - Raised and dropped: G-1, vanilla keys the file leaves out (see Rationale).

## User decisions
Checkpoint answered on 2026-10-09 through the orchestrating session.
- **Engine model settled by an in-game test** (user, 2026-10-09): INEX only, Germany 1936, a Panzer template on the "Panzer Divisions" list (`GER_Arm_01`), division rename list opened. Only "N. Panzer-Division" names appear; no 'Feldherrnhalle', no Panzer-Lehr. A same-tag group in INEX replaces the vanilla group. Vanilla `ordered` keys that INEX leaves out are gone, not merged.
- **G-1a, G-1b, G-1c, G-1d: void, dropped.** None of the 88 overrides is in the batch.
- **Approved:** G-2, G-3, G-4, G-5, G-6, G-7.
- **G-8, added by the user and approved:** fix the header sentence "GER_PEN_01 is left to vanilla" with a `-SetHeader GER` step.
- **Defaults confirmed:** the plain groups keep their ordered entries (no `clearOrdered`); kept invented nicknames stay apart from G-6; existing tags are not renamed; no action on the Guard/Imperial and Republican gate overlap.

## Research
- `inex-audit-researcher`, one dispatch for all three German files, 25 web calls (budget spent). Topics: "Seelande-", single suspects, Flak-Division stations, SA-Gruppen, Waffen-SS. The de.wikipedia list pages returned 404; sources were en.wikipedia division pages, de-academic, Bundesarchiv catalogue entries (Deutsche Digitale Bibliothek), axishistory.
- Planner, 3 web calls on the engine question: hoi4.paradoxwikis.com "Division modding" does not cover same-tag groups; the Paradox forum developer diary could not be fetched; one search found nothing on point. The user's in-game test settled it.
- Local sources: vanilla `common/units/names_divisions/GER_names_divisions.txt` (via `-InspectVanilla GER`), `docs/superpowers/plans/2026-09-30-germany-namelist.md` (decisions and verification of the overhaul this audit follows).
- `inex-code-reviewer`, one dispatch covering the added and changed names of all three audit plans (see Review).

## Rationale
Scope: the 22 existing groups. The batch touches four of them, a one-off script edits `GER_Arm_02` (mixed-case tag, see Tooling notes), and the header is a separate step.

### G-1 Vanilla keys the file leaves out: hypothesis tested and dropped
- Hypothesis: the vanilla file header says a same-tag group in another file appends, and overrides names only "at the same number". Read literally, the 178 vanilla keys that 11 INEX groups do not list would keep their vanilla names, among them Nazi honorifics in lists open to every government.
- Test: the user's in-game check (see User decisions).
- Result: the INEX group replaces the vanilla group whole. A key INEX does not list does not exist in game.
- Consequence: G-1a to G-1d are void. The removals of the 2026-09-30 overhaul ("honorifics moved out", "VGD moved out", "Reserve and Festung entries removed", "'Kavallerie-Division Nord' dropped") worked as intended. No docs change follows from G-1. The comparison that raised it is kept in `scratch/ger_audit_vanilla_keys.txt` as a record of which vanilla keys the file drops.
- Also settled by the replace model: an INEX block without `link_numbering_with` has no link, so `GER_MEC_01_MONARNCHIST` and `GER_MEC_01_COMMUNIST` run their own number series as intended.

### Plain groups under the replace model
`GER_Inf_01` (254 entries), `GER_MOT_01` (14), `GER_MEC_01` (9), `GER_Arm_01` (29), `GER_LTARM_01` (5), `GER_GAR_01` (56) and `GER_MONMOB_01` (111) hold their whole content in the INEX file. Their keys are the historical numbers (1-36, 44, 45, 46, 50, 52 ...; Panzer 116, 232). Keeping these entries is required, not merely safe: `"clearOrdered"` or `"removeAll"` would leave the fallback alone, which counts 1, 2, 3, and the historical numbers and the 96 Imperial cavalry titles would be lost. The VANILLA_COPY flag on five of them must not be acted on (see Tooling notes).

### G-2 `GER_MAR_01` "Seelande-Division" (R6)
Vanilla coined "Seelande-" by analogy with "Luftlande-". The researcher found no use of it in German military language; the attested terms are Marine-Division (Marinekorps Flandern, 1914-18), Marine-Infanterie-Division (Kriegsmarine, 1945) and Seebataillon. The fallback becomes `%d. Marine-Infanterie-Division`, and the 34 entries on keys 4-37 take the same designation, for example `%d. Seelande-Division 'Kiautschou'` -> `%d. Marine-Infanterie-Division 'Kiautschou'`. Keys 1-3 (`%d. Marine-Division`) are entries of the INEX file itself and stay. The identities do not change. The comment above the group, which names the vanilla word, is rewritten.
Extrapolation: only the 1., 2., 3., 11. and 16. Marine-Infanterie-Division existed (1945); divisions 4-37 under that designation are a plausible continuation, as the 34 Seelande divisions were before.

### G-3 `GER_MONINF_01` key 125
`%d. Division 'Friedrich, König von Preußen'` -> `%d. Division 'Kaiser Friedrich, König von Preußen'`. The regiment was the Infanterie-Regiment "Kaiser Friedrich, König von Preußen" (7. Württembergisches) Nr. 125; without "Kaiser" the title reads as Frederick the Great.

### G-4 `GER_Arm_02` keys 901-908
The section "Historical: Panzer divisions named in 1945" holds Kempf (1939), Norwegen (1943-44) and Bergen (no source found). The section is renamed "Historical: named Panzer divisions (1939-45)". `Panzer-Division Bergen` leaves key 908 and returns as key 926 at the end of the training-ground expansion, where an unverified training-ground name belongs. Extrapolation: `Panzer-Division Bergen` (Bergen is a real training ground; no division of that name is documented).

### G-5 Section headers that called invented names historical
- `GER_Arm_02`: keys 11 'Eisenkrieger', 18 'Stahlhagel', 22 'Eisenstern', 23 'Eisenfaust', 25 'Silberlöwe', 27 'Feuerdrache' are kept invented names under a "Historical" header.
- `GER_PAR_01`: keys 3 'Adlerkralle', 4 'Sturmfalke', 5 'Himmelsstürmer', 9 'Wolkenbruch', 10 'Schattenjäger', 11 'Sturmwächter', 20 'Silberfuchs', 21 'Windsturm' likewise.
Entries cannot move without breaking the number order, so both headers now say which numbers carry kept invented names. No name changes.

### G-6 `GER_Arm_02` kept names with vehicle names
30 'Panthersturm', 42 'Eisenpanther' and 53 'Eisentiger' are removed (the 2026-09-30 rule dropped "weapon or vehicle names"). Those numbers then come from the fallback ("30. Panzer-Division"). The expansion keeps 28 of its 31 names.

### G-7 `GER_ELI_01`: Legion Condor
`Legion Condor` was a German expeditionary force, not foreign troops, and leaves "Foreign Legions" (`GER_LEG_01`, additional plan ADD-5). It is added here as key 945 under "Historical honour formations of the Heer and Luftwaffe".

### G-8 File header
Line 22 of the header ends "GER_PEN_01 is left to vanilla." The namelist plan defines `GER_PEN_01` in `INEX_GER_ADDITIONAL_names_divisions.txt`, so the sentence becomes "GER_PEN_01 is overridden in the ADDITIONAL file." `-SetHeader` replaces the whole header; the other 21 lines are reproduced unchanged in step 2. The section banner below the header is kept by the tool.

### Tooling notes
- **`-EditNames` cannot edit a mixed-case tag.** `Resolve-GroupTag` upper-cases the name and returns its own candidate (`GER_ARM_02`), and `Edit-NamelistGroupText` then looks for that spelling case-sensitively: `Group GER_ARM_02 not found`. Affected German tags: `GER_Inf_01`, `GER_Arm_01`, `GER_Arm_02`, `GER_Cav_01`, `GER_Mnt_01`, `GER_Arm_01_ANTIFASCIST`. Workaround here: the `GER_Arm_02` edits are made by a one-off script carried in this plan (step 4), tested by the planner with `-Check`. The same weakness is behind the "no row" reports of `-SyncWiki GER`. Fix `build.ps1` in a fresh session.
- **VANILLA_COPY is misleading under the replace model.** The lint, and the audit skill's text for it ("the stubs can be dropped with `removeAll` or `clearOrdered` without changing any name"), assume that vanilla keeps supplying the entries. The in-game test shows it does not. Dropping a flagged copy would delete those names from the game. Lint and skill text are not edited in this audit; fix them in a fresh session. CLAUDE.md §6 ("Never copy identical empty vanilla stubs") needs the same second look for reused tags.
- `-Audit` compares INEX entries with vanilla but does not list vanilla keys an INEX group leaves out. The comparison was made with a read-only script (`scratch/ger_audit_vanilla_keys.py`).
- PLACEHOLDER_ENTRIES counts an entry as a placeholder when it matches the fallback pattern, even when its key is a real, non-sequential number.
- The initial report written by `-AuditPlan` omits VANILLA_COPY and IDENTITY_REPEAT (FLAGS=17 against 22 in `-Audit`).
- `$ValidDivisionTypes` accepts `artillery`, `anti_air`, `anti_tank` and `rocket_artillery`, which are support-company ids in vanilla (`common/units/artillery.txt`, `anti-air.txt`); the line battalions are `*_brigade`. No German group uses them.

## Verified formations & commanders
- Legacy entries: verification is recorded in `docs/superpowers/plans/2026-09-30-germany-namelist.md` ("Verified formations & commanders"); this audit did not repeat it.
- This audit:
  - Marine-Infanterie-Division 1, 2, 3 (1945; 11 and 16 ordered, barely formed) and the 1.-3. Marine-Division of the Marinekorps Flandern: en.wikipedia "1st Marine Division (Wehrmacht)", "3rd Marine Division (Wehrmacht)", "Marinekorps Flandern".
  - Infanterie-Regiment "Kaiser Friedrich, König von Preußen" (7. Württembergisches) Nr. 125: en.wikipedia "26th Division (German Empire)", de-academic "26. Division (1. Königlich Württembergische)".
  - Panzer-Division Holstein (10 Feb 1945), Müncheberg (8 Mar 1945), Jüterbog (20 Feb 1945), Clausewitz (April 1945), Kempf (1939): en.wikipedia pages of those divisions.
  - Legion Condor: well documented, German personnel.
  - Vanilla group contents and scripted references: `-InspectVanilla GER`.
  - Engine behaviour for a reused tag: the user's in-game test of 2026-10-09.

## Author confirmation
- `Panzer-Division Bergen` (`GER_Arm_02`, new key 926): no source found; kept as an extrapolated training-ground name.
- `'Kaiser Friedrich, König von Preußen'` (`GER_MONINF_01` 125): medium confidence from the researcher, matches the planner's knowledge.
- "Seelande-" as unattested: search only; NVA usage was not searched.
- `%d. Marine-Division` (`GER_MAR_01` 1-3, unchanged): formation verified, German hyphenation not.
- Legacy, unchanged: `Panzer-Division Schlesien` (904) and `Panzer-Division Döberitz` (911) were not found by the researcher (the planner knows Döberitz as the first name of Schlesien, February 1945); `Panzer-Division Norwegen` (906) is dated 1943-44 from a search snippet only. Everything under "Author confirmation" in the 2026-09-30 plan stays as it was.

## Kept on judgment
`-Check GER` must show these 22 flags after the batch and no others:
- PLACEHOLDER_ENTRIES and LOW_DEPTH on `GER_Inf_01`, `GER_MOT_01`, `GER_MEC_01`, `GER_Arm_01`, `GER_LTARM_01`, `GER_GAR_01` (12 flags): plain and numbered lists whose entries are the historical numbers. Required content under the replace model.
- VANILLA_COPY on `GER_Inf_01`, `GER_MOT_01`, `GER_Arm_01`, `GER_GAR_01`, `GER_MONMOB_01` (5 flags): the entries equal vanilla's and are the only copy the game reads. Never drop them.
- UNLINKED_MOBILE on `GER_MEC_01_MONARNCHIST` and `GER_MEC_01_COMMUNIST` (2 flags): the lint reads `_MEC_` in the tag; both are independent ideology series.
- NAME_LONG on `GER_MONINF_01` and `GER_MONMOB_01` (2 flags): historical honour titles.
- IDENTITY_REPEAT, file level (1 flag): 'König' and 'Prinz Karl von Bayern' name different regiments with the same patron.

Not flags, kept on purpose: selector "Panzergrenadiers (Named)" (the R10 form "Panzergrenadier Divisions (Named)" is 34 characters, limit 28); Named variants link to `GER_Inf_01` or `GER_Arm_01`, the shared Heer number series; `GER_INF_02` 297 'Bruck an der Leitha' and 717 'Bruckneudorf' name the same training ground under two place names; `GER_ELI_01` keys 939-941 are corps names; the gate `neutrality OR democratic` on the Guard and Imperial lists is vanilla's and cannot tell a monarchy from a republic without a focus or flag, which R11 forbids.

## Implementation steps
- [x] 1. Precondition: `git grep -c "^GER_PEN_01 = " HEAD -- common/units/names_divisions/INEX_GER_ADDITIONAL_names_divisions.txt`. Expect one line ending in `:1`. No output means the namelist plan is not applied and committed: stop. Then set `Status: IN PROGRESS`.
- [x] 2. Header (G-8). Run this one command exactly as written (one line; `\n` is literal):

  ```
  powershell -File .\build.ps1 -SetHeader GER -HeaderText "Division template historical names system for Germany (GER): Heer.\nImmersive Namelists Expanded (INEX)\n\nGerman nominative forms and period spelling: '%d. Infanterie-Division', '(mot.)', 'leichte Division',\n'Kgl. Bayer.'; identities appended to a designation go in single quotes, historical proper names\n(Infanterie-Division Scharnhorst, Panzer-Division Holstein) do not.\n\nPlain and Named pairs: infantry, motorized, Panzergrenadier and Panzer lists each keep the vanilla tag\nas a plain list in historical raising order and add a '(Named)' list on the same numbers. One Heer\nnumber series: every infantry-type list links to GER_Inf_01, so 29. Infanterie-Division (mot.) 'Falke'\nand 29. Panzergrenadier-Division 'Falke' are the same division. Panzer lists link to GER_Arm_01.\nA division keeps one identity in every list: its verified nickname or emblem, else its formation city.\n\nIdeology: the basic lists are open to every government. Nazi honour formations (Großdeutschland,\nFeldherrnhalle, Hermann Göring) are fascist-only; the Imperial lists and the Guard divisions cover the\nmonarchist path (neutrality/democratic), the Republican divisions the democratic path and the Red Army\ndivisions the communist path.\n\nOverrides vanilla GER_Inf_01, GER_ALTINF_01, GER_LTINF_01, GER_MOT_01, GER_MOT_02, GER_MEC_01,\nGER_MEC_01_MONARNCHIST, GER_MEC_01_COMMUNIST, GER_Mnt_01, GER_MAR_01, GER_PAR_01, GER_GAR_01, GER_Arm_01,\nGER_Arm_01_ANTIFASCIST, GER_LTARM_01, GER_Cav_01, GER_MONINF_01 and GER_MONMOB_01. Vanilla focuses\nreference GER_INF_01 and GER_CAV_01 (kept here); GER_PEN_01 is overridden in the ADDITIONAL file."
  ```

  Expect `Header of INEX_GER_names_divisions.txt replaced`. Then `git diff --numstat -- common/units/names_divisions/INEX_GER_names_divisions.txt`: expect `1	1	common/units/names_divisions/INEX_GER_names_divisions.txt` (one line changed, the last header line). Any other count: `git checkout -- common/units/names_divisions/INEX_GER_names_divisions.txt`, stop and report.
- [x] 3. Apply the batch: `powershell -File .\build.ps1 -EditNames GER -Batch docs\superpowers\plans\2026-10-09-germany-audit.md`. Expect four green lines (`GER_MAR_01`, `GER_MONINF_01`, `GER_PAR_01`, `GER_ELI_01`) and no `[ERROR]`.
- [x] 4. `GER_Arm_02` (G-4, G-5, G-6). `-EditNames` cannot address this mixed-case tag (see Tooling notes), so a one-off script makes the edits. Save the script under "GER_Arm_02 script" below as `scratch\ger_arm02_fix.ps1` with the Write tool, exactly as printed (it is plain ASCII; overwrite a file of that name if one exists). Then run `powershell -File .\scratch\ger_arm02_fix.ps1 -Check` and expect `Check OK: GER_Arm_02 2 headers renamed, 4 entries removed, 1 added, 81 entries (nothing written)`. Then run `powershell -File .\scratch\ger_arm02_fix.ps1` and expect `GER_Arm_02: 2 headers renamed, 4 entries removed, 1 added, 81 entries`. Any error: nothing was written; stop and report.
- [x] 5. `powershell -File .\build.ps1 -SyncWiki GER` (it updates the `GER_MAR_01` fallback in the wiki table; "no row" reports for the mixed-case tags `GER_Inf_01`, `GER_Arm_01`, `GER_Arm_02`, `GER_Cav_01`, `GER_Mnt_01`, `GER_Arm_01_ANTIFASCIST` are a known tool limitation). Then make the four edits listed under "Docs payload".
- [x] 6. `powershell -File .\build.ps1 -Check GER`. Expect `Check passed` and `FLAGS=22`; the flags must match "Kept on judgment". `GER_Arm_02` must show 81 entries, `GER_ELI_01` 17.
- [x] 7. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 8. After the user confirms: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit GER division namelists"`. One push covers all three German audit plans; if another of them is still to be applied in this session, push after the last.

### GER_Arm_02 script
Used by step 4 only. It edits nothing outside the `GER_Arm_02` block and writes nothing unless every expected line is found exactly once.

```powershell
# One-off edit of GER_Arm_02 for docs/superpowers/plans/2026-10-09-germany-audit.md (G-4, G-5, G-6).
# -EditNames cannot address mixed-case tags, so this script makes the seven line edits itself.
# All or nothing: every expected line must occur exactly once inside the group, or nothing is written.
# -Check reports and writes nothing.
param([switch]$Check)
$ErrorActionPreference = 'Stop'
$path = Join-Path $PSScriptRoot '..\common\units\names_divisions\INEX_GER_names_divisions.txt'
$enc = New-Object System.Text.UTF8Encoding $false
$text = [System.IO.File]::ReadAllText($path, $enc)
$nl = if ($text.Contains("`r`n")) { "`r`n" } else { "`n" }
$start = $text.IndexOf("${nl}GER_Arm_02 = {")
if ($start -lt 0) { throw 'GER_Arm_02 not found' }
$end = $text.IndexOf("${nl}}", $start + 1)
if ($end -lt 0) { throw 'end of GER_Arm_02 not found' }
$block = $text.Substring($start, $end - $start)
$t = "`t`t"
$count = { param($s) ($block.Split(@($s), [System.StringSplitOptions]::None).Count - 1) }
$swap = {
    param($old, $new)
    if ((& $count $old) -ne 1) { throw "expected exactly once in GER_Arm_02: $old" }
    $script:block = $block.Replace($old, $new)
}
& $swap ($t + '# Historical: emblem or nickname, else formation city (predecessor division''s city where it was converted)' + $nl) ($t + '# Historical divisions: emblem or nickname, else formation city (predecessor division''s city where it was converted); 11, 18, 22, 23, 25 and 27 carry kept invented names' + $nl)
& $swap ($t + '# Historical: Panzer divisions named in 1945' + $nl) ($t + '# Historical: named Panzer divisions (1939-45)' + $nl)
& $swap ($t + '908 = { "Panzer-Division Bergen" }' + $nl) ''
& $swap ($t + '30 = { "%d. Panzer-Division ''Panthersturm''" }' + $nl) ''
& $swap ($t + '42 = { "%d. Panzer-Division ''Eisenpanther''" }' + $nl) ''
& $swap ($t + '53 = { "%d. Panzer-Division ''Eisentiger''" }' + $nl) ''
& $swap ($t + '925 = { "Panzer-Division Lamsdorf" }' + $nl) ($t + '925 = { "Panzer-Division Lamsdorf" }' + $nl + $t + '926 = { "Panzer-Division Bergen" }' + $nl)
$entries = ([regex]::Matches($block, '(?m)^\t\t\d+ = \{')).Count
if ($entries -ne 81) { throw "GER_Arm_02 would have $entries entries, expected 81" }
if ($Check) { Write-Host "Check OK: GER_Arm_02 2 headers renamed, 4 entries removed, 1 added, $entries entries (nothing written)"; exit 0 }
[System.IO.File]::WriteAllText($path, $text.Substring(0, $start) + $block + $text.Substring($end), $enc)
Write-Host "GER_Arm_02: 2 headers renamed, 4 entries removed, 1 added, $entries entries"
```

## Docs payload
Find each place by its text, not by a line number. If a "current text" below is not in the file exactly as shown, stop and report. None of these lines is touched by `2026-10-09-germany-namelist.md`.

### README.md and WORKSHOP_DESCRIPTION_GUIDELINES.md
No change. (The German docs do not claim that omitted vanilla entries stay active, so the engine finding needs no correction there.)

### wiki/Germany.md
The table row of `GER_MAR_01` is updated by `-SyncWiki GER`. Four prose edits.

1. Under the heading for `GER_Arm_01` / `GER_Arm_02`. Current text:

```
- **1945 named divisions:** *Panzer-Division Holstein*, *Müncheberg*, *Jüterbog*, *Clausewitz*, *Norwegen*.
```

New text:

```
- **Named divisions of 1939–45:** *Panzer-Division Kempf*, *Norwegen*, *Holstein*, *Müncheberg*, *Jüterbog*, *Clausewitz*.
```

2. Same section. Current text:

```
The expansion keeps 31 names from the earlier INEX list (*'Donnerkeil'*, *'Stahlross'*). It then follows the 1945 practice of naming divisions after training grounds (*Panzer-Division Döberitz*, *Wünsdorf*).
```

New text:

```
The expansion keeps 28 names from the earlier INEX list (*'Donnerkeil'*, *'Stahlross'*). It then follows the 1945 practice of naming divisions after training grounds (*Panzer-Division Döberitz*, *Wünsdorf*).
```

3. Under the heading for `GER_MAR_01`. Current text:

```
Germany never had a true marine corps, so the list keeps the vanilla *Seelande-Division*. It opens with the Marinekorps Flandern divisions of 1914–18. It continues with:
```

New text:

```
Germany never had a true marine corps. The list opens with the *Marine-Divisionen* of the Marinekorps Flandern (1914–18). The rest are *Marine-Infanterie-Divisionen*, the designation of the Kriegsmarine's divisions of 1945, in place of the vanilla coinage *Seelande-Division*. It continues with:
```

4. Under the heading for `GER_ELI_01`. Current text:

```
*Großdeutschland*, *Feldherrnhalle* (Panzer-Division FHH 1 and 2), *Hermann Göring*, the *Führer-Begleit-* and *Führer-Grenadier-Division*, and *Infanterie-Division Schlageter*. Overflow continues the numbered Feldherrnhalle series.
```

New text:

```
*Großdeutschland*, *Feldherrnhalle* (Panzer-Division FHH 1 and 2), *Hermann Göring*, the *Führer-Begleit-* and *Führer-Grenadier-Division*, *Infanterie-Division Schlageter* and the *Legion Condor*. Overflow continues the numbered Feldherrnhalle series.
```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the precondition in step 1 is not met; the header diff in step 2 is not exactly one line; the batch fails; the script in step 4 reports anything but the expected line; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
- `inex-code-reviewer` (dispatched because G-2 changes 34 authored German names; one run covered the names of all three audit plans): `No issues found`. It made no web lookups, so the verdict is a read for spelling, case and wording, not a source check.
- Self-check: every added or changed name is in "Verified formations & commanders" or "Author confirmation". The extrapolations (Marine-Infanterie-Division 4-37, Panzer-Division Bergen) are named in the Rationale. Keys for `"set"` and `"remove"` were taken from `-NamesOnly -Keys`. No approved fix relies on a vanilla key: every key the batch or the script sets or removes is defined in the INEX file, and keys 945 and 926 are new.
- `GER_Arm_02` script: run by the planner with `-Check` against the file as of 2026-10-09; result `Check OK ... 81 entries (nothing written)`.
- Header text: checked line by line against the current header; 21 lines identical, line 22 changed as described.

## Outcome
2026-10-09: header replaced (one line changed), batch applied, `GER_Arm_02` script run, wiki synced and the four prose edits made. `-Check GER`: `Validate: OK`, 373 tests passed, `GROUPS=22 AUTHORED=768/1260 FLAGS=22` (`PLACEHOLDER_ENTRIES x6, LOW_DEPTH x6, VANILLA_COPY x5, UNLINKED_MOBILE x2, NAME_LONG x2, IDENTITY_REPEAT x1`), `Diff vs HEAD: 4 group(s) changed, +36 -38 name(s)`, `Check passed`. `GER_Arm_02` 81 entries, `GER_ELI_01` 17. No deviations from the plan. Step 8 (wiki push) waits for the user's confirmation.

## Edit batch
Applied by `build.ps1 -EditNames GER -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{
  "group": "GER_MAR_01",
  "fallback": "%d. Marine-Infanterie-Division",
  "comment": "A proper German marine corps never existed. Keys 1-3 are the Marine-Divisionen of the Marinekorps Flandern (1914-18);\nthe rest use 'Marine-Infanterie-Division', the Kriegsmarine designation of 1945, not vanilla's unattested 'Seelande-Division'.",
  "set": [
    "4=%d. Marine-Infanterie-Division 'Kiautschou'",
    "5=%d. Marine-Infanterie-Division 'Flandern'",
    "6=%d. Marine-Infanterie-Division 'Zeebrügge'",
    "7=%d. Marine-Infanterie-Division 'Ösel'",
    "8=%d. Marine-Infanterie-Division 'Dagö'",
    "9=%d. Marine-Infanterie-Division 'Moon'",
    "10=%d. Marine-Infanterie-Division 'Albion'",
    "11=%d. Marine-Infanterie-Division 'Skagerrak'",
    "12=%d. Marine-Infanterie-Division 'Doggerbank'",
    "13=%d. Marine-Infanterie-Division 'Coronel'",
    "14=%d. Marine-Infanterie-Division 'Helgoland'",
    "15=%d. Marine-Infanterie-Division 'Brommy'",
    "16=%d. Marine-Infanterie-Division 'Prinz Adalbert'",
    "17=%d. Marine-Infanterie-Division 'Graf Spee'",
    "18=%d. Marine-Infanterie-Division 'Scheer'",
    "19=%d. Marine-Infanterie-Division 'Hipper'",
    "20=%d. Marine-Infanterie-Division 'Tirpitz'",
    "21=%d. Marine-Infanterie-Division 'Weddigen'",
    "22=%d. Marine-Infanterie-Division 'Graf Luckner'",
    "23=%d. Marine-Infanterie-Division 'von Müller'",
    "24=%d. Marine-Infanterie-Division 'Emden'",
    "25=%d. Marine-Infanterie-Division 'Seeadler'",
    "26=%d. Marine-Infanterie-Division 'Möwe'",
    "27=%d. Marine-Infanterie-Division 'Wolf'",
    "28=%d. Marine-Infanterie-Division 'Seeteufel'",
    "29=%d. Marine-Infanterie-Division 'Neptun'",
    "30=%d. Marine-Infanterie-Division 'Wellenbrecher'",
    "31=%d. Marine-Infanterie-Division 'Küstenwacht'",
    "32=%d. Marine-Infanterie-Division 'Seehund'",
    "33=%d. Marine-Infanterie-Division 'Meereswelle'",
    "34=%d. Marine-Infanterie-Division 'Sturmwelle'",
    "35=%d. Marine-Infanterie-Division 'Meerjäger'",
    "36=%d. Marine-Infanterie-Division 'Kaperfahrt'",
    "37=%d. Marine-Infanterie-Division 'Seeschlange'"
  ]
}
```

```json batch
{ "group": "GER_MONINF_01", "set": ["125=%d. Division 'Kaiser Friedrich, König von Preußen'"] }
```

```json batch
{
  "group": "GER_PAR_01",
  "renameSection": [
    "Historical: 7. Flieger-Division, then the Fallschirmjäger-Divisionen (commander or battle honour where verified)=Historical: 7. Flieger-Division, then the Fallschirmjäger-Divisionen (commander or battle honour where verified; 3-5, 9-11, 20 and 21 carry kept invented names)"
  ]
}
```

```json batch
{ "group": "GER_ELI_01", "add": ["945=Legion Condor"] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| Arm_02 | 84 -> 81 | - | %d. Panzer-Division 'Panthersturm', %d. Panzer-Division 'Eisenpanther', %d. Panzer-Division 'Eisentiger' | - |
| MAR_01 | 37 -> 37 | %d. Marine-Infanterie-Division 'Kiautschou', %d. Marine-Infanterie-Division 'Flandern', %d. Marine-Infanterie-Division 'Zeebrügge', %d. Marine-Infanterie-Division 'Ösel', %d. Marine-Infanterie-Division 'Dagö', %d. Marine-Infanterie-Division 'Moon', %d. Marine-Infanterie-Division 'Albion', %d. Marine-Infanterie-Division 'Skagerrak', %d. Marine-Infanterie-Division 'Doggerbank', %d. Marine-Infanterie-Division 'Coronel', %d. Marine-Infanterie-Division 'Helgoland', %d. Marine-Infanterie-Division 'Brommy', %d. Marine-Infanterie-Division 'Prinz Adalbert', %d. Marine-Infanterie-Division 'Graf Spee', %d. Marine-Infanterie-Division 'Scheer', %d. Marine-Infanterie-Division 'Hipper', %d. Marine-Infanterie-Division 'Tirpitz', %d. Marine-Infanterie-Division 'Weddigen', %d. Marine-Infanterie-Division 'Graf Luckner', %d. Marine-Infanterie-Division 'von Müller', %d. Marine-Infanterie-Division 'Emden', %d. Marine-Infanterie-Division 'Seeadler', %d. Marine-Infanterie-Division 'Möwe', %d. Marine-Infanterie-Division 'Wolf', %d. Marine-Infanterie-Division 'Seeteufel', %d. Marine-Infanterie-Division 'Neptun', %d. Marine-Infanterie-Division 'Wellenbrecher', %d. Marine-Infanterie-Division 'Küstenwacht', %d. Marine-Infanterie-Division 'Seehund', %d. Marine-Infanterie-Division 'Meereswelle', %d. Marine-Infanterie-Division 'Sturmwelle', %d. Marine-Infanterie-Division 'Meerjäger', %d. Marine-Infanterie-Division 'Kaperfahrt', %d. Marine-Infanterie-Division 'Seeschlange' | %d. Seelande-Division 'Kiautschou', %d. Seelande-Division 'Flandern', %d. Seelande-Division 'Zeebrügge', %d. Seelande-Division 'Ösel', %d. Seelande-Division 'Dagö', %d. Seelande-Division 'Moon', %d. Seelande-Division 'Albion', %d. Seelande-Division 'Skagerrak', %d. Seelande-Division 'Doggerbank', %d. Seelande-Division 'Coronel', %d. Seelande-Division 'Helgoland', %d. Seelande-Division 'Brommy', %d. Seelande-Division 'Prinz Adalbert', %d. Seelande-Division 'Graf Spee', %d. Seelande-Division 'Scheer', %d. Seelande-Division 'Hipper', %d. Seelande-Division 'Tirpitz', %d. Seelande-Division 'Weddigen', %d. Seelande-Division 'Graf Luckner', %d. Seelande-Division 'von Müller', %d. Seelande-Division 'Emden', %d. Seelande-Division 'Seeadler', %d. Seelande-Division 'Möwe', %d. Seelande-Division 'Wolf', %d. Seelande-Division 'Seeteufel', %d. Seelande-Division 'Neptun', %d. Seelande-Division 'Wellenbrecher', %d. Seelande-Division 'Küstenwacht', %d. Seelande-Division 'Seehund', %d. Seelande-Division 'Meereswelle', %d. Seelande-Division 'Sturmwelle', %d. Seelande-Division 'Meerjäger', %d. Seelande-Division 'Kaperfahrt', %d. Seelande-Division 'Seeschlange' | fallback: '%d. Seelande-Division' -> '%d. Marine-Infanterie-Division' |
| ELI_01 | 16 -> 17 | Legion Condor | - | - |
| MONINF_01 | 200 -> 200 | %d. Division 'Kaiser Friedrich, König von Preußen' | %d. Division 'Friedrich, König von Preußen' | - |

Unchanged: Inf_01, INF_02, ALTINF_01, LTINF_01, MOT_01, MOT_02, MEC_01, MEC_02, Arm_01, LTARM_01, Cav_01, Mnt_01, PAR_01, GAR_01, MEC_01_MONARNCHIST, MONMOB_01, Arm_01_ANTIFASCIST, MEC_01_COMMUNIST
<!-- END CHANGE TABLE -->
