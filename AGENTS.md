# Immersive Namelists Expanded (INEX) - Agent Rules

Shared rules for every mod in this tree (file encodings, build commands, engine knowledge, git) are in the Modding Manager's `../../AGENTS.md`; `CLAUDE.md` and `GEMINI.md` import this file. The long form of this mod's conventions, standards and workflow is `docs/inex-agent-guide.md`, read by section when the table below says so.

## What this mod is
- Division name lists for Hearts of Iron IV, one file per nation at `common/units/names_divisions/zz_INEX_<TAG>_names_divisions.txt`; Workshop id 2967389401.
- `tools/`, `tests/BuildEngine.Tests.ps1`, `tests/Run-Tests.ps1`, `tests/Knowledge.Tests.ps1` and `.github/workflows/ci.yml` are copies the Manager syncs; `.agents/skills/` is written by `build.ps1 -SyncMirrors`. Hooks in `.claude/hooks/` refuse edits to those files and to the namelist files, and run `-SyncMirrors` after an edit under `.claude/skills/` (guide section 8).
- Work on a nation runs in two stages: planning writes a self-contained plan under `docs/plans/` and stops (a plan that ships moves to `docs/plans/archive/`); implementation starts only on the user's word and runs from the plan alone (guide section 1).

## Mod invariants
- A namelist file changes only through `build.ps1 -EditNames` (`-Batch` for a plan's `json batch` blocks, `-DryRun` first), never by hand; a hook refuses Edit and Write on `common/units/names_divisions/`.
- Every file name starts with `zz_`: the game reads the folder in name order and a later file's group is read into the group an earlier file made under the same tag [NAM-001] [NAM-020]. A group that reuses a vanilla tag is merged into the vanilla group, not put in its place [NAM-020]; guide section 6 has the consequences.
- Group tags `<TAG>_<CATEGORY>_<NUMBER>` are unique across the repository; selectors omit the nation's name; no empty `ordered = { }` blocks (a rule of this mod, since vanilla has them [NAM-006]).
- Ideology gating only with `can_use = { has_government = ... }` [NAM-003], never a focus, decision, idea or flag.
- `fallback_name` needs `%d` or `%s` [NAM-005]; `link_numbering_with` points to another group, never itself [NAM-007]; a backslash may only precede a quote or a backslash [NAM-008].
- `build.ps1 -Check <TAG>` must end with `Check passed` before a namelist task is complete, and the docs sync of guide section 4 (Workshop text, wiki page, `-SyncWiki`) is part of the task.
- The wiki push runs in a plan's ship step, on the user's word.

## Commands beyond build.ps1
- `build.ps1` carries the mod's own switches (`-Check`, `-Audit`, `-InspectVanilla`, `-EditNames`, `-DiffNames`, `-AuditPlan`, `-SyncWiki`, `-SyncMirrors`, `-GameLog`); guide section 5 lists them and `Get-Help .\build.ps1 -Parameter <Name>` prints one.

## Read when
| Task | Read |
|---|---|
| Starting or continuing a nation | the nation's newest plan under `docs/plans/` (its `Status:` line; finished plans are under `docs/plans/archive/`), then guide sections 1 to 4 |
| Authoring a new namelist (planning) | skill `hoi4-inex-namelist-authoring` |
| Modernising an existing namelist (planning) | skill `hoi4-inex-namelist-audit` |
| Carrying out a `READY` plan | skill `hoi4-inex-namelist-implement` |
| Releasing to the Workshop | skill `hoi4-inex-release` |
| Writing Workshop text | `WORKSHOP_DESCRIPTION_GUIDELINES.md` (rules at the top), guide section 4 |
| A tooling problem in `build.ps1`, the tests or the skills | `docs/tooling-backlog.md`: add an entry, fix it in a session of its own |
| Editing skills or agent briefs | guide section 8 (skill mirrors, `-SyncMirrors`) |

## Compacting
Keep: the active nation and TAG, the plan file path and its `Status:`, whether the session is planning or implementing, the first unticked implementation step, group tags edited and their remaining TODOs, pending docs-sync steps, and the latest `-ValidateOnly`/`-Test` result. Drop raw audit, test and research output once its findings are in the plan file.

## Engine Knowledge
- Engine facts live in the Modding Manager's register, reached through the user-level `hoi4-modding-knowledge` skill: search it before a new kind of file and before asking for a game launch, cite ids here, never write a fact into this repository.
- Topics this mod leans on: `namelists`, `loading-and-overrides`, `encoding-and-syntax`.
- `tests/Knowledge.Tests.ps1` runs the register's audit for this repository; it is a copy the Manager keeps current.

