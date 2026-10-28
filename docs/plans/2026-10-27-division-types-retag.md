# Division types retag (BRA, POL, SOV, SWE, USA) - 2026-10-27

Status: READY

## For the implementer
Planning is finished. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps". This plan changes five namelist files, so it has no `## Edit batch`: each step is one `build.ps1 -EditNames` or `-SetHeader` command, given in full. Do not research or re-decide. When a stop condition applies, stop and report.

## Context
A launch on 2026-10-27 with a test mod showed how the game gives a template its name group [NAM-026] [NAM-027]: it compares `division_types` with the template's line battalions only. Line ids such as `artillery_brigade`, `anti_air_brigade`, `medium_tank_destroyer_brigade` and `armored_car` work; a support company in a template does not count, so a group that lists only the support ids `artillery` or `anti_air` is never chosen automatically (players can still pick it by hand). This plan moves the nine groups on support ids to line ids, and takes the three USA groups off their workaround (armour tokens with `can_use = { is_ai = no }`, and `USA_CONST_01` without `armored_car`). The ship step then removes the support ids from `$ValidDivisionTypes` in `build.ps1` and closes the last `docs/tooling-backlog.md` entry on the subject.

## Decisions
- Artillery groups take `artillery_brigade` and `mot_artillery_brigade`; `SOV_ART_01` (breakthrough artillery divisions) also `rocket_artillery_brigade` and `mot_rocket_artillery_brigade`. No self-propelled ids: those would make an artillery list compete for every tank template that carries self-propelled guns.
- Anti-air groups take `anti_air_brigade` and `mot_anti_air_brigade`.
- `SWE_ART_01` and `SWE_AA_01` drop `infantry` (user decision 2026-10-27), so they match only templates with artillery or anti-air battalions, like the other nations' lists.
- `USA_TD_01` takes the four tank destroyer brigade ids, `USA_ART_01` the two artillery ids; both lose the armour tokens and the `is_ai = no` gate (`can_use = { always = yes }`), and their comments and the file header say so. `USA_CONST_01` adds `armored_car`.
- A group that lists a line id also competes for mixed templates that contain that battalion, and wins only with the most names [NAM-018]. Each nation's largest infantry list is bigger than its retagged groups (INEX entries: SOV 413 against 37, USA 251 against 24, SWE 36 against 14, POL 35 against 16, BRA 35 against 27).
- None of the twelve tags is a vanilla tag, so their `division_types` are replaced outright [NAM-020].
- Out of scope: `GER_PANZERARTILLERIE_DIVISION_01` (GER_ADDITIONAL) keeps its armour tokens and `is_ai = no` gate.

## Kept on judgment
The retag changes no flag; every file keeps the flags it has before the plan (checked on a rehearsal of 2026-10-27):
- BRA: `Flags: NAME_LONG x3, IDENTITY_REPEAT x1, LOW_DEPTH x1`
- POL: `Flags: LOW_DEPTH x13, PLACEHOLDER_ENTRIES x7, KEY_NUMBER_MISMATCH x3, UNGATED_POLITICAL x1, NAME_LONG x1`
- SOV: `Flags: NAME_LONG x10, PLACEHOLDER_ENTRIES x9, LOW_DEPTH x6, UNLINKED_MOBILE x1, IDENTITY_REPEAT x1`
- SWE: `Flags: IDENTITY_REPEAT x1`
- USA: `Flags: UNGATED_POLITICAL x1, IDENTITY_REPEAT x1`
These are the files' existing audit findings, left for their own audits. Any other flag, and any `[WARN] Docs:` line, is a stop condition.

## Implementation steps
- [ ] 1. Set `Status: IN PROGRESS`. Then run `git status --short`: it must list no file under `common/units/names_divisions/` or `wiki/` (the tooling work of 2026-10-27 is committed and the wiki pushed). If it does, stop and report.
- [ ] 2. `powershell -File .\build.ps1 -EditNames BRA -Group ART_01 -RemoveType 'artillery' -AddType 'artillery_brigade; mot_artillery_brigade'`. Expect `Edited BRA_ART_01: +0 -0 ~0 [+Types: artillery_brigade, mot_artillery_brigade; -Types: artillery]`.
- [ ] 3. `powershell -File .\build.ps1 -EditNames POL -Group GA_01,AWL_03 -RemoveType 'artillery' -AddType 'artillery_brigade; mot_artillery_brigade'`. Expect `Edited POL_GA_01: +0 -0 ~0 [+Types: artillery_brigade, mot_artillery_brigade; -Types: artillery]` and the same line for `POL_AWL_03`.
- [ ] 4. `powershell -File .\build.ps1 -EditNames POL -Group AA_01,AA_02,LWP_03 -RemoveType 'anti_air' -AddType 'anti_air_brigade; mot_anti_air_brigade'`. Expect `Edited POL_AA_01: +0 -0 ~0 [+Types: anti_air_brigade, mot_anti_air_brigade; -Types: anti_air]` and the same line for `POL_AA_02` and `POL_LWP_03`.
- [ ] 5. `powershell -File .\build.ps1 -EditNames SOV -Group ART_01 -RemoveType 'artillery' -AddType 'artillery_brigade; mot_artillery_brigade; rocket_artillery_brigade; mot_rocket_artillery_brigade'`. Expect `Edited SOV_ART_01: +0 -0 ~0 [+Types: artillery_brigade, mot_artillery_brigade, rocket_artillery_brigade, mot_rocket_artillery_brigade; -Types: artillery]`.
- [ ] 6. `powershell -File .\build.ps1 -EditNames SWE -Group ART_01 -RemoveType 'artillery; infantry' -AddType 'artillery_brigade; mot_artillery_brigade'`. Expect `Edited SWE_ART_01: +0 -0 ~0 [+Types: artillery_brigade, mot_artillery_brigade; -Types: artillery, infantry]`.
- [ ] 7. `powershell -File .\build.ps1 -EditNames SWE -Group AA_01 -RemoveType 'anti_air; infantry' -AddType 'anti_air_brigade; mot_anti_air_brigade'`. Expect `Edited SWE_AA_01: +0 -0 ~0 [+Types: anti_air_brigade, mot_anti_air_brigade; -Types: anti_air, infantry]`.
- [ ] 8. `powershell -File .\build.ps1 -EditNames USA -Group TD_01 -RemoveType 'light_armor; medium_armor; heavy_armor; modern_armor' -AddType 'light_tank_destroyer_brigade; medium_tank_destroyer_brigade; heavy_tank_destroyer_brigade; modern_tank_destroyer_brigade' -CanUse 'always = yes' -Comment 'Tank destroyer battalions, typed by their line battalions (tank destroyer brigades).\nReal battalion numbers with one battle or attachment each; own number series.'`. Expect `Edited USA_TD_01: +0 -0 ~0 [+Types: light_tank_destroyer_brigade, medium_tank_destroyer_brigade, heavy_tank_destroyer_brigade, modern_tank_destroyer_brigade; -Types: light_armor, medium_armor, heavy_armor, modern_armor; CanUse='always = yes'; Comment]`.
- [ ] 9. `powershell -File .\build.ps1 -EditNames USA -Group ART_01 -RemoveType 'light_armor; medium_armor; heavy_armor; modern_armor' -AddType 'artillery_brigade; mot_artillery_brigade' -CanUse 'always = yes' -Comment 'Field artillery, typed by its line battalions (artillery brigades).\nBrigades, groups, corps artillery and heritage regiments under their real numbers; own number series.'`. Expect `Edited USA_ART_01: +0 -0 ~0 [+Types: artillery_brigade, mot_artillery_brigade; -Types: light_armor, medium_armor, heavy_armor, modern_armor; CanUse='always = yes'; Comment]`.
- [ ] 10. `powershell -File .\build.ps1 -EditNames USA -Group CONST_01 -AddType 'armored_car'`. Expect `Edited USA_CONST_01: +0 -0 ~0 [+Types: armored_car]`.
- [ ] 11. Replace the USA file header (one command; the single quotes keep the text as it is):
  `powershell -File .\build.ps1 -SetHeader USA -HeaderText '# United States (USA) Division Namelist\n# Immersive Namelists Expanded (INEX)\n#\n# American English. Ordered entries carry their ordinal (%dst, %dnd, %drd, %dth) matched to the key;\n# fallbacks use the bare number, as vanilla does.\n#\n# Line and mobile: Infantry (1st-106th, Fortitude deceptions, postwar reserve), National Guard, Regimental Combat Teams,\n# Motorized, Mechanized, Cavalry, Armored, Armored Cavalry Regiments, Separate Tank and Tank Destroyer Battalions,\n# Field Artillery Brigades, Assault Divisions, Provisional Task Forces.\n# Specialists: Airborne, Marines, Marine Raiders, Amtrac Battalions, Mountain, Rangers.\n# Territorial: 38 WWII State Guards, State Militias, Harbor Defense Commands, Overseas Garrisons, US Constabulary (1946-52).\n# Ideology and alternate history: Red Guards, Lincoln Brigades, Red Armored (communism); Silver Legions, Nationalist Militias,\n# Confederate Divisions (fascism); Federal Emergency Forces, Continental Army (neutrality); Union Divisions,\n# Conservation Corps (democratic); Volunteer Legions, Expeditionary Forces (democratic or neutrality).\n# Tank Destroyer and Field Artillery groups list their line battalions (tank destroyer and artillery brigades).\n#\n# Overrides vanilla USA_INF_01, USA_CAV_01, USA_MOT_01, USA_MEC_01, USA_ARM_01, USA_PAR_01, USA_MAR_01,\n# USA_MNT_01 and USA_GAR_01; vanilla USA_RGR_01 (Ranger Divisions) stays as it is.\n# USA_INF_01 is named by vanilla scripted effects and the Dutch focus tree.'`
  Expect `Header of zz_INEX_USA_names_divisions.txt replaced`.
- [ ] 12. Sync the wiki tables, one command each. Expect these lines (each also prints `wiki/Home.md: <TAG> group count N (unchanged)`), and no `row added`, `no group table`, `stale row` or prose line:
  - `powershell -File .\build.ps1 -SyncWiki BRA`: `Brazil.md: 1 row(s) updated`, `BRA_ART_01: types 'artillery' -> 'artillery_brigade, mot_artillery_brigade'`.
  - `powershell -File .\build.ps1 -SyncWiki POL`: `Poland.md: 5 row(s) updated` for `POL_GA_01`, `POL_AA_01`, `POL_AA_02`, `POL_LWP_03`, `POL_AWL_03`.
  - `powershell -File .\build.ps1 -SyncWiki SOV`: `Soviet-Union.md: 1 row(s) updated`, `SOV_ART_01: types 'artillery' -> 'artillery_brigade, mot_artillery_brigade, rocket_artillery_brigade, mot_rocket_artillery_brigade'`.
  - `powershell -File .\build.ps1 -SyncWiki SWE`: `Sweden.md: 2 row(s) updated` for `SWE_ART_01` and `SWE_AA_01`.
  - `powershell -File .\build.ps1 -SyncWiki USA`: `United-States.md: 3 row(s) updated` for `USA_TD_01`, `USA_ART_01` and `USA_CONST_01`.
- [ ] 13. Make the two edits under "Docs payload" in `wiki/United-States.md` with the Edit tool.
- [ ] 14. `powershell -File .\build.ps1 -Check <TAG>` for each of `BRA`, `POL`, `SOV`, `SWE`, `USA`. Each must end `Check passed`, with `Validate: OK`, the tests passing (0 failed), its `Flags:` line exactly as under "Kept on judgment", no `[WARN]` line, and a `Diff vs HEAD:` line ending `+0 -0 name(s)` (the retag adds and removes no name).
- [ ] 15. Fill "Outcome", set `Status: DONE`, report the five `-Check` results.
- [ ] 16. Ship, on the user's word (the caller, not the implementer: it edits `build.ps1` and the tests):
  1. `build.ps1`, `$ValidDivisionTypes`: delete the line `    'artillery', 'anti_air', 'anti_tank', 'rocket_artillery'`, remove the trailing comma of the line before it (`'super_heavy_sp_anti_air_brigade', 'modern_sp_anti_air_brigade',`), and replace the comment lines above the list from `# artillery, anti_air, anti_tank and rocket_artillery are support-company ids` to the end of that comment with `# Support-company ids (artillery, anti_air, ...) are not accepted: no template matches them [NAM-026].`
  2. `tests/BuildScript.Tests.ps1`, It "Accepts the line battalions vanilla defines ...": add `foreach ($t in 'artillery', 'anti_air', 'anti_tank', 'rocket_artillery') { $ValidDivisionTypes | Should -Not -Contain $t }`.
  3. `docs/inex-agent-guide.md` §6, Subunits: replace the sentence from `A template takes a group by its line battalions only;` to `retag.md`) [NAM-026].` with `A template takes a group by its line battalions only; the support-company ids "artillery" and "anti_air" are refused, since no template matches them [NAM-026].` Delete the `### Validation` heading and its entry from `docs/tooling-backlog.md`.
  4. `powershell -File .\tests\Run-Tests.ps1 -Suite BuildScript` (0 failed), then `powershell -File .\build.ps1 -Check USA` (`Check passed`).
  5. Move this plan to `docs/plans/archive/`, commit the five namelist files, the five wiki pages, `build.ps1`, `tests/BuildScript.Tests.ps1`, `docs/inex-agent-guide.md`, `docs/tooling-backlog.md` and the archived plan with the message `Retag artillery, anti-air and tank destroyer groups to line battalion ids`.
  6. `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Retag artillery, anti-air and tank destroyer groups"`.

## Docs payload
### wiki/United-States.md
1. In the `USA_TD_01` bullet, current text:
   ```text
   Typed as armor and open to human players only (`is_ai = no`), so AI tank divisions never draw these names.
   ```
   Replacement:
   ```text
   Typed by its tank destroyer battalions, so the game can choose it for tank destroyer templates.
   ```
2. In the `USA_ART_01` bullet, current text:
   ```text
   Typed as armor and open to human players only (`is_ai = no`).
   ```
   Replacement:
   ```text
   Typed by its artillery battalions, so the game can choose it for artillery templates.
   ```

The Workshop description and README are unchanged.

## Stop conditions
Stop and report to the user, without researching or improvising, when: a command fails or prints `[ERROR]`; an output differs from what its step expects; `-Check` fails, shows a flag "Kept on judgment" does not list, or shows a `[WARN]` line; a "current text" in "Docs payload" is not in the file exactly as shown.

## Review
Self-check: the commands of steps 2-12 were run on an export of HEAD with the `build.ps1` of 2026-10-27; every expected line above is taken from that run, validation passed, and the audit flags of all five files were the same before and after.

## Outcome
<!-- TODO(implementer): date, the five -Check summary lines, deviations from this plan with the reason -->
