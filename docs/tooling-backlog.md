# Tooling Backlog

Open problems in `build.ps1`, the tests, the skills and the rules (`docs/inex-agent-guide.md` §1). During a nation's planning or implementation a tooling problem is worked around and gets one entry here. Entries are fixed in a session of their own, and a fixed entry is deleted (git history keeps it).

An entry says what happens, where it was seen, the workaround, and what a fix would look like if that is known.

## Open

### Lints
- **A `-Check` rehearsal on an export of HEAD fails `tests/Knowledge.Tests.ps1`.** The register's audit finds the export's `.claude/skills/hoi4-inex-*` as a second copy of the registered mod's skills ("the same skill name also exists in: immersive-namelists-expanded"), so `-Check` ends `Check FAILED: tests` although the real repository passes. Seen in the CHI plan of 2026-10-25. Since 2026-10-27 `-DryRun` prints the flags, so a planner rehearses only for the docs step outputs and needs no `-Check` there. Workaround: run the Knowledge suite in the real repository. Fix idea: in the Manager's `Scripts/Knowledge/Knowledge.Tests.ps1` (synced here), skip the duplicate-skill finding when `$RepoRoot` is not under the Manager's `mods/`. The Manager's hooks refuse reads of `Scripts/Knowledge` from a mod session, so the fix runs in a Manager session.

### Validation
- **`$ValidDivisionTypes` still accepts the support-company ids `artillery`, `anti_air`, `anti_tank` and `rocket_artillery`, which no template matches [NAM-026].** The launch of 2026-10-27 settled it: line ids work, support companies do not count. Nine groups use support ids (`BRA_ART_01`, `POL_GA_01`, `POL_AA_01`, `POL_AA_02`, `POL_LWP_03`, `POL_AWL_03`, `SOV_ART_01`, `SWE_ART_01`, `SWE_AA_01`), so the game never gives them a template on its own; `USA_TD_01`, `USA_ART_01` and `USA_CONST_01` are on workarounds. Fix: `docs/plans/2026-10-27-division-types-retag.md` (READY) retags the twelve groups, and its ship step removes the support ids and this entry.
