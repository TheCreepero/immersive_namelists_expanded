# Tooling Backlog

Open problems in `build.ps1`, the tests, the skills and the rules (`CLAUDE.md` §1). During a nation's planning or implementation a tooling problem is worked around and gets one entry here. Entries are fixed in a session of their own, and a fixed entry is deleted (git history keeps it).

An entry says what happens, where it was seen, the workaround, and what a fix would look like if that is known.

## Open

### Lints
- **`PLACEHOLDER_ENTRIES` and `LOW_DEPTH` count real numbered entries as placeholders.** An entry that matches the fallback pattern is a placeholder to the lint even when its key is a historical, non-sequential number (`GER_Inf_01`, `GER_GAR_01`), or when the name carries its identity in a suffix (`schwere SS-Panzer-Abteilung %d (I. SS-Panzerkorps)` in `GER_SS_08`). Seen in the German audits of 2026-10-09. Workaround: list the flags under "Kept on judgment". Fix idea: exempt groups whose keys are not a 1..N run, and compare the whole name, not its pattern.
- **`UNLINKED_MOBILE` reads the tag, not the role.** `GER_MEC_01_MONARNCHIST` and `GER_MEC_01_COMMUNIST` are independent ideology series but carry `_MEC_` in a vanilla tag. Workaround: "Kept on judgment".
- **`-AuditPlan`'s initial report omits file-level flags** (`IDENTITY_REPEAT`), so its flag count can be lower than `-Audit`'s. Seen in the German audit of 2026-10-09.
- **`SELECTOR_DUPLICATE` compares only the groups of the INEX file.** A vanilla group that INEX does not define stays in the game [NAM-001] and can carry the same selector for the same division types: INEX `FIN_MTN_01` and vanilla `FIN_MTN_02` were both "Mountain Divisions" for mountaineer templates. Seen in the Finland audit of 2026-10-15. Workaround: compare `-InspectVanilla <TAG>` by hand. Fix idea: with HOI4 installed, add the vanilla groups INEX leaves in place to the duplicate check, limited to groups that share a division type.

### Validation
- **`$ValidDivisionTypes` accepts `artillery`, `anti_air`, `anti_tank` and `rocket_artillery`**, which are support-company ids in vanilla (`common/units/artillery.txt`, `anti-air.txt`); the line battalions are `*_brigade`. Eleven groups use them (seen in the SOV audit of 2026-10-15): `SOV_ART_01`, `BRA` (1), `LIT` (2), `SWE` (2), `POL` (5); such a group may never be offered to an artillery template [NAM-004, untested]. Check against vanilla `common/units/` and one game launch before changing the list, then fix those groups in one pass.
- **`$ValidDivisionTypes` rejects line sub-unit ids that a group needs.** Vanilla 1.19.3 has line tank destroyers (`light_tank_destroyer_brigade`, `medium_`, `heavy_`, `modern_`), line artillery (`artillery_brigade`, `mot_artillery_brigade`, `rocket_artillery_brigade`, ...) and uses `armored_car` and `bicycle_battalion` in its own namelists [NAM-004]; `-EditNames` refuses all of them. Seen in the USA plan of 2026-10-15: `USA_TD_01` and `USA_ART_01` fall back to armour tokens with `can_use = { is_ai = no }` (the `GER_PANZERARTILLERIE_DIVISION_01` precedent), and `USA_CONST_01` goes without `armored_car`. Fix with the entry above, after one launch shows which ids a namelist group is offered for.

### Editing
- **`-AddGroup` cannot create a group whose tag does not start with the file's country tag.** It puts `<TAG>_` in front, so vanilla's `SPA_INF_01` and `SPD_INF_01` to `SPD_INF_06` (all in the SPR file) come out as `SPR_SPA_INF_01` and so on, and the vanilla groups are not overridden. Seen in the Spain plan of 2026-10-09. Workaround: a one-line rename after the batch, written as a step of that plan. Fix idea: keep a tag that already has the `<XXX>_<CAT>_<NN>` form, or add a batch key that marks the tag as final.
- **`-Comment` adds a second comment block when a blank line separates the existing one from its group.** `Set-NamelistGroupComment` walks back from the group tag over comment lines and stops at the first blank line, so in a file laid out as banner, comment, blank line, group (all of `zz_INEX_USA_names_divisions.txt`) it inserts instead of replacing. Seen for `JAP_CAV_01` (2026-10-01) and found by reading the code in the USA plan of 2026-10-15. Workaround: the USA plan fixes nine comment lines with a one-off regex replacement step. Fix idea: also take the comment block above a single blank line when nothing else stands between it and the group.

- **`-Link` works only with `-AddGroup`.** An existing group cannot be given `link_numbering_with` (`-Link applies only to -AddGroup`), so a vanilla tag cannot become the named variant of another vanilla tag through the batch. Seen in the SOV plan of 2026-10-15 (`SOV_GTC_01` links `SOV_ARM_03`). Workaround: a one-off regex step after the batch that turns the group's dead `#link_numbering_with` comment into the link. Fix idea: accept `"link"` on an existing group, replacing any link or commented link it has.

### Game log
- **`-GameLog` fails while the game is running.** `ReadAllLines` cannot open `error.log` because the game holds it open for writing. Seen on 2026-10-11. Workaround: close the game first. Fix idea: open the log with `FileShare.ReadWrite`.

### Docs
- **`-SyncWiki` does not add table rows for new groups.** It updates existing rows and prints `no row in wiki table (add by hand): <tags>`, although `CLAUDE.md` §4.3 says it writes the group rows. Seen in the USA plan of 2026-10-15 (11 new groups). Workaround: the plan's docs payload carries the rows verbatim, and a second `-SyncWiki` run checks them. Fix idea: insert the missing rows in file order, after the row of the group that precedes each new group in the namelist.
- **`Get-CountryName` hard-codes the three German wiki pages.** A second multi-file nation needs the same mapping. Fix idea: read the page from the `wiki/Home.md` row of the file.
- **The Workshop description grows about 530 characters per nation**: 10,443 of 17,000 with 18 nations (2026-10-09), so the limit test fails around 12 nations from now. Decide on a shorter per-nation form before then.

## Follow-ups from the engine correction of 2026-10-09
A group that reuses a vanilla tag replaces the vanilla group whole (`CLAUDE.md` §6). Work done before that was known may have left vanilla names out without meaning to. `-Audit <KEY>` now lists them as `Vanilla: leaves out ...` lines. Totals on 2026-10-09:

| File | Vanilla names left out | Groups | Identity kept in another list | Numbered keys past a gap |
|:---|---:|---:|---:|---:|
| `ENG` | 120 | 6 | 0 | 218 |
| `FIN` | 2 | 3 | 1 | 57 |
| `FRA` | 94 | 4 | 0 | 169 |
| `GER` | 166 | 11 | 10 | 2 |
| `GRE` | 0 | 0 | 0 | 3 |
| `ITA` | 7 | 2 | 9 | 46 |
| `JAP` | 396 | 6 | 108 | 136 |
| `PER` | 0 | 0 | 0 | 5 |
| `POL` | 23 | 3 | 0 | 28 |
| `ROM` | 4 | 1 | 0 | 73 |
| `SOV` | 71 | 7 | 3 | 594 |
| `SWE` | 0 | 0 | 0 | 44 |
| `USA` | 205 | 5 | 164 | 34 |

`BRA`, `EST`, `LAT`, `LIT`, `MEX`, `GER_SS` and `GER_ADDITIONAL` leave nothing out.

Many of these are deliberate: Germany's were decided in its 2026-09-30 overhaul and confirmed in the 2026-10-09 audit, and a renamed designation counts as left out. Each of the other files gets the decision in its next audit (audit skill, R12). The report is a heuristic: it compares names by pattern, so a respelled vanilla name also shows as left out.
