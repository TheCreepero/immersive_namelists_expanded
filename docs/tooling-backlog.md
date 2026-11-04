# Tooling Backlog

Open problems in `build.ps1`, the tests, the skills and the rules (`docs/inex-agent-guide.md` §1). During a nation's planning or implementation a tooling problem is worked around and gets one entry here. Entries are fixed in a session of their own, and a fixed entry is deleted (git history keeps it).

An entry says what happens, where it was seen, the workaround, and what a fix would look like if that is known.

## Open

### Lints
- **A `-Check` rehearsal on an export of HEAD fails `tests/Knowledge.Tests.ps1`.** The register's audit finds the export's `.claude/skills/hoi4-inex-*` as a second copy of the registered mod's skills ("the same skill name also exists in: immersive-namelists-expanded"), so `-Check` ends `Check FAILED: tests` although the real repository passes. Seen in the CHI plan of 2026-10-25. Since 2026-10-27 `-DryRun` prints the flags, so a planner rehearses only for the docs step outputs and needs no `-Check` there. Workaround: run the Knowledge suite in the real repository. Fix idea: in the Manager's `Scripts/Knowledge/Knowledge.Tests.ps1` (synced here), skip the duplicate-skill finding when `$RepoRoot` is not under the Manager's `mods/`. The Manager's hooks refuse reads of `Scripts/Knowledge` from a mod session, so the fix runs in a Manager session.

### Workshop description
- **`Get-WorkshopDocStats` in `build.ps1` and `tests/Documentation.Tests.ps1` (lines 83-93) read the raw `bbcode` block, so they count the two `<!-- cross-links:begin -->` and `<!-- cross-links:end -->` marker lines.** Seen on 2026-11-04, when the Manager's `Sync-WorkshopCrossLinks.ps1` put the shared "More from the author" block between those markers: the engine leaves the two lines out of the uploaded description, so the real size is 7,409 bytes and the stats show 44 more (the raw text is 7,453). Harmless today (both under 7,500), but the stats and the size test measure a text that is not the one uploaded. Workaround: none needed; the Manager's `Sync-WorkshopCrossLinks.ps1 -Check` and `Test-ModSeo.ps1` print the uploaded size. Fix idea: take the block through `Get-ModWorkshopDescriptionFromText` (in `tools/HoiModBuild.ps1`, synced) in both places.

### Validation
- **`$ValidDivisionTypes` still accepts the support-company ids `artillery`, `anti_air`, `anti_tank` and `rocket_artillery`, which no template matches [NAM-026].** The launch of 2026-10-27 settled it: line ids work, support companies do not count. Nine groups use support ids (`BRA_ART_01`, `POL_GA_01`, `POL_AA_01`, `POL_AA_02`, `POL_LWP_03`, `POL_AWL_03`, `SOV_ART_01`, `SWE_ART_01`, `SWE_AA_01`), so the game never gives them a template on its own; `USA_TD_01`, `USA_ART_01` and `USA_CONST_01` are on workarounds. Fix: `docs/plans/2026-10-27-division-types-retag.md` (READY) retags the twelve groups, and its ship step removes the support ids and this entry.
