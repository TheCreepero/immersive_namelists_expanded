# Tooling Backlog

Open problems in `build.ps1`, the tests, the skills and the rules (`CLAUDE.md` §1). During a nation's planning or implementation a tooling problem is worked around and gets one entry here. Entries are fixed in a session of their own, and a fixed entry is deleted (git history keeps it).

An entry says what happens, where it was seen, the workaround, and what a fix would look like if that is known.

## Open

### Lints
- **`PLACEHOLDER_ENTRIES` and `LOW_DEPTH` count real numbered entries as placeholders.** An entry that matches the fallback pattern is a placeholder to the lint even when its key is a historical, non-sequential number (`GER_Inf_01`, `GER_GAR_01`), or when the name carries its identity in a suffix (`schwere SS-Panzer-Abteilung %d (I. SS-Panzerkorps)` in `GER_SS_08`). Seen in the German audits of 2026-10-09. Workaround: list the flags under "Kept on judgment". Fix idea: exempt groups whose keys are not a 1..N run, and compare the whole name, not its pattern.
- **`UNLINKED_MOBILE` reads the tag, not the role.** `GER_MEC_01_MONARNCHIST` and `GER_MEC_01_COMMUNIST` are independent ideology series but carry `_MEC_` in a vanilla tag. Workaround: "Kept on judgment".
- **`-AuditPlan`'s initial report omits file-level flags** (`IDENTITY_REPEAT`), so its flag count can be lower than `-Audit`'s. Seen in the German audit of 2026-10-09.

### Validation
- **`$ValidDivisionTypes` accepts `artillery`, `anti_air`, `anti_tank` and `rocket_artillery`**, which are support-company ids in vanilla (`common/units/artillery.txt`, `anti-air.txt`); the line battalions are `*_brigade`. No group uses them today. Check against vanilla `common/units/` before changing the list.

### Editing
- **`-Comment` with a banner on a group that already has one may add a second banner.** Seen once for `JAP_CAV_01` (2026-10-01) and removed by hand; not re-tested since.

### Docs
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
