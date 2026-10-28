# INEX tooling: the four "Validation" entries of docs/tooling-backlog.md

Status: DONE

Repo: `mods/immersive-namelists-expanded` (its own git repository). This is a tooling-backlog session, so `build.ps1` and `tests/BuildScript.Tests.ps1` may be opened. Implementation starts only on the user's word. This plan moves to `docs/plans/archive/` in the ship commit.

## Context
The token whitelist is wrong in both directions, and the test suite keeps its own copy of it:
- `$ValidDivisionTypes` (`build.ps1:462-476`) is missing line battalions that the game defines: `amphibious_light_armor`, `amphibious_medium_armor`, `amphibious_heavy_armor` and `marine_commando`.
- `tests/Namelists.Tests.ps1:10-16` holds a separate, older `$ValidSubunitTokens`. It has no `*_brigade`, `armored_car` or `bicycle_battalion`, and it still has the bogus `motorized_rocket_artillery` [NAM-027]. Because of that, `-Check GER_ADDITIONAL` fails on `medium_tank_destroyer_brigade`, and the GER_ADDITIONAL plan (`IN PROGRESS`) is stuck at its step 3.
- Planners cannot see which group a template picks up automatically [NAM-018] [NAM-020] [NAM-026]. `-Audit` shows only the types and counts INEX writes, not the result after vanilla's merge.
- The fourth entry (support-company ids) already has a READY plan, `docs/plans/2026-10-27-division-types-retag.md`, and this plan does not redo it.

Found while planning (vanilla lookup, game 1.19.4): `super_heavy_armor`, `super_heavy_tank_destroyer_brigade`, `super_heavy_sp_artillery_brigade` and `super_heavy_sp_anti_air_brigade` are `group = support` with `combat_width = 0` (`common/units/super_heavy_armor.txt:2`, `tank_destroyer_brigade.txt:217`, `sp_artillery_brigade.txt:213`, `sp_anti-air_brigade.txt:207`). So they are support companies, not line battalions, and they come out of the whitelist. No INEX file uses them; grep found none.

Line ids, meaning sub-units under `common/units/*.txt` whose `group` is `infantry`, `mobile`, `armor`, `combat_support`, `mobile_combat_support` or `armor_combat_support`, are the current list minus the four super-heavy ids, plus the four missing ones. Six of these stay excluded on purpose: the Army HQ units `hq_infantry`, `hq_paratrooper`, `hq_motorized`, `hq_armored_car`, `hq_light_armor` and `hq_medium_armor` (`allow_in_non_army_hq = no`), `bus` (`active = no`) and `fake_intel_unit` (an internal deception unit).

User decisions (2026-10-28): the two GER_ADDITIONAL follow-up edits go into that plan, before its `-Check`. `-PickTable` covers single ids and template mixes (`-PickTypes`).

## Changes

### 1. Whitelist (backlog entry 1)
- `build.ps1:458-476`: add `'amphibious_light_armor', 'amphibious_medium_armor', 'amphibious_heavy_armor'` beside `amphibious_armor`, and `'marine_commando'` beside `marine`. Remove the four `super_heavy_*` ids. Update the comment to say game 1.19.4, that line ids are those whose `group` is not `support`, and that the support ids `artillery`, `anti_air`, `anti_tank` and `rocket_artillery` stay until the retag plan ships.
- `tests/BuildScript.Tests.ps1`, Describe "build.ps1: valid division_types list" (line 1715 on):
  - "Is defined once": change the counted token from `'super_heavy_armor'` to one that appears only in the list (check with Grep, e.g. `'bicycle_battalion'`).
  - "Accepts the line battalions ...": replace `super_heavy_sp_anti_air_brigade` with `modern_sp_anti_air_brigade`, add the four new ids, and check `Should -Not -Contain` for the four super-heavy ids.
  - New It "Matches the line battalions of the installed game", run with `-Skip:(-not (Find-Hoi4Install))` so CI without the game skips it. `Find-Hoi4Install` is already in the dot-sourced function list. It reads `common/units/*.txt` and collects each `sub_units` child id with its `group`. It then asserts that (a) every line id outside the documented exclusions is in `$ValidDivisionTypes`, and (b) every list id is a line id, except the four support ids that the retag plan is waiting to remove. Both lists (exclusions and the retag set) are named arrays in the test, so the retag ship step only has to delete one of them.

### 2. One list for the Namelists suite (backlog entry 2)
- `tests/Namelists.Tests.ps1:10-16`: replace `$script:ValidSubunitTokens` with the extraction `tests/BuildScript.Tests.ps1:17-21` already uses: a regex `(?s)\$ValidDivisionTypes = @\(.*?\)` over `build.ps1`, then a dot-source of the ScriptBlock. If the match fails, throw, so a missing list can't let everything pass. Line 120 then checks `$ValidDivisionTypes`.

### 3. Pick table and merged view (backlog entry 3)
`build.ps1`, reusing `Get-NamelistAuditData`, `Find-Hoi4Install`, `Get-Hoi4CountryTags` and `Resolve-GroupTag`:
- `Get-NamelistAuditData`: add `ForCountries` (tags of `for_countries`), `UniqueCount` (`unique` + `unordered` names, which the game counts [NAM-018] [NAM-025]) and `NameType` (the `type` key, default `army`). These are additive fields, so existing callers are unaffected.
- New `Get-MergedNameGroups -Country <TAG> -Hoi4Dir`: reads every vanilla `common/units/names_divisions/*.txt` and every `zz_INEX_*` file in byte order of file name [LOAD-013]. It merges groups by tag without regard to case, using the rules of [NAM-020]: `name`, `can_use` and `fallback` replaced; `division_types` and `for_countries` added; `ordered` as the union of keys; `unique` appended. It keeps army groups whose `for_countries` is empty or holds the country, records the first-load position (for ties) and the source files, and gives `MergedCount = ordered keys + unique` and `MergedTypes`. Types are filtered to real sub-unit ids, so a group whose tokens are all invalid counts as typeless [NAM-027].
- New `Test-CanUseForGovernment -CanUse <text> -Government <ideology>`: a small evaluator for `has_government`, `OR`, `AND`, `NOT` and `always`. It treats `has_dlc` as true and returns `$null` (conditional) for anything else (`is_ai`, flags), which the report marks with `?`.
- New `Get-NamePickTable -Groups -Types <string[]> -Government`: candidates are the available groups that list one of the types, or that have no valid type [NAM-018]. It returns the winner (most names), the runner-up, and a `tie` flag when the top counts are equal, because the game takes the first of equals and that order isn't knowable from the files.
- New switch `-PickTable <TAG>` (with `-Hoi4Dir`): one row per id in `$ValidDivisionTypes` and per government (`democratic`, `communism`, `fascism`, `neutrality`), in the form `id | gov | winner (merged count) | runner-up (count)`, with groups that compete only under a conditional `can_use` flagged. `-PickTypes 'motorized; medium_tank_destroyer_brigade'` adds the rows for that template mix. Without a game install it prints `[ERROR]` and exits 1. Add a `.PARAMETER PickTable` / `.PARAMETER PickTypes` help entry and parameter declarations next to `-InspectVanilla`.
- `Invoke-NamelistAudit`, per group, when the game is found and the tag also exists outside this file: one extra grey line, `  Merged:   +<types vanilla adds>; <MergedCount> names after the merge (<files>)`. The `Types:` line itself doesn't change, and nothing new is a flag or a `[WARN]`, so `-Check` and the plans' "Kept on judgment" expectations stay valid.
- `tests/BuildScript.Tests.ps1`: add the new functions to the dot-source list (line 23), plus fixture tests on in-memory text (no game needed):
  - merging the same tag twice (types union, ordered key union, unique appended, case-insensitive tag)
  - `for_countries` filtering
  - `can_use` evaluation (`OR`, `NOT`, `has_dlc`, unknown -> `$null`)
  - a typeless and an all-invalid-token group competing everywhere
  - picking the most names, the runner-up and a tie
  - a `-PickTypes` mix taking the union of candidates

### 4. Support ids (backlog entry 4): adjust the READY retag plan, don't redo it
`docs/plans/2026-10-27-division-types-retag.md`, step 16 (ship):
- 16.1: match the new list text (the line before the support ids is no longer `'super_heavy_sp_anti_air_brigade', ...`, and the comment text changes).
- 16.2: delete the retag exception array from the new game-match test, instead of adding a `Should -Not -Contain` loop. Keep the loop if it's still useful.
- 16.3: "delete the support-id entry from `docs/tooling-backlog.md`, and the `### Validation` heading if it is then empty".
This plan ships before the retag plan.

### 5. GER_ADDITIONAL follow-up (user decision)
`docs/plans/2026-10-28-germany-additional-audit.md`:
- Insert step 2b before step 3:
  - `-EditNames GER_ADDITIONAL -Group AMPH_01 -AddType 'amphibious_light_armor; amphibious_medium_armor; amphibious_heavy_armor'`
  - `-EditNames GER_ADDITIONAL -Group MEK_01 -AddType 'marine_commando' -RemoveType 'marine'`
  - then `-SyncWiki GER_ADDITIONAL`, expecting 2 rows updated (`GER_AMPH_01` and `GER_MEK_01` types); fix any prose line it reports.
  - Take the exact expected `Edited ...` lines from a `-DryRun` during implementation.
- Rewrite Group design lines 86-87 and the Rationale row at line 61 from "interim/not part of this plan" to the final typing, and update the group table (lines 164, 174).
- Ask the user whether `GER_MEK_01` can now take naval-commando templates automatically: run `-PickTable GER -PickTypes marine_commando`.

### 6. Docs
- `docs/inex-agent-guide.md` §5: add a `-PickTable <TAG> [-PickTypes '<a; b>']` bullet and the `Merged:` line in the `-Audit` bullet. In §6 Subunits, add `"marine_commando"` and `"amphibious_*_armor"` to the examples and say that super-heavy ids are support companies in 1.19.4 (a game-file fact from the lookup, cited as `common/units/...`, not an engine fact).
- Skills `.claude/skills/hoi4-inex-namelist-authoring/SKILL.md` (step 1, Group suite, line 68) and `hoi4-inex-namelist-audit/SKILL.md` (its group-suite step): "Check the automatic pick with `-PickTable <TAG>` (and `-PickTypes` for mixed templates) before fixing `division_types`." The hook runs `-SyncMirrors`.
- `docs/tooling-backlog.md`: delete entries 1-3 under `### Validation` and leave entry 4 for the retag plan.

## Verification
1. `powershell -File .\tests\Run-Tests.ps1 -Suite BuildScript` and `-Suite Namelists`: 0 failed, and the game-match test runs here (game installed).
2. `powershell -File .\build.ps1 -PickTable GER`: the rows should match the hand-made table in the GER_ADDITIONAL plan's Rationale, for example `GER_Inf_01` 308 for infantry and `GER_KAMPFGRUPPE_01` 166 for mobile templates on HEAD. Spot-check `-PickTypes 'motorized; medium_tank_destroyer_brigade'` and `-PickTable USA` (USA_TD_01 on its workaround).
3. `powershell -File .\build.ps1 -Audit GER_ADDITIONAL`: a `Merged:` line on `GER_LTINF_01` shows `+ranger_battalion`, and the flags are unchanged.
4. `powershell -File .\build.ps1 -Check GER_ADDITIONAL` after step 2b of that plan: `Check passed`, with the flags as in its "Kept on judgment" section. Also `-Check USA` (unchanged flags) to confirm nothing else moved.
5. From the Manager root: `Scripts/Knowledge/Test-HoiKnowledge.ps1` (docs, skills and rules changed), used as its reference describes.
6. `git status` in the mod. No commit until the user says so; then the ship commit moves this plan to `docs/plans/archive/`.

## Outcome
2026-10-28, implemented in the session that planned it. Deviations from the plan above, with the reason:
- Seven Army HQ units, not six: the game also defines `hq_heavy_armor` (`common/units/hq_support.txt:1030`). The game-match test excludes all seven.
- `Get-NamelistAuditData` is unchanged except that its block split moved into `Split-NamelistGroupBlocks`. The merge reads its fields through a new light reader, `Get-NameGroupFields`, because running the full audit over the 100 vanilla files and 21 INEX files took 40 s. `-PickTable` now takes about 2.5 s.
- `-PickTypes` prints only the mix line instead of adding it to the table, which keeps the output short for a planner.
- The GER_ADDITIONAL plan's W3 and W5 rows are docs payload already applied, so they were left as they are; its new step 2b runs `-SyncWiki`, which rewrites those two wiki rows.
- Retag plan, step 16.2: the `Should -Not -Contain` loop is kept, and the exception array is deleted as well.
