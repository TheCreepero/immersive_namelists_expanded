# Immersive Namelists Expanded (INEX)

A Hearts of Iron IV mod providing immersive, linguistically accurate, and historically plausible division namelists for historical and alternate-history campaigns.

Steam Workshop: [Immersive Namelists Expanded](https://steamcommunity.com/sharedfiles/filedetails/?id=2967389401) (Workshop ID: `2967389401`)

---

## Overview

Vanilla Hearts of Iron IV division namelists often leave gaps during extended campaigns, alt-history paths, and specialized division templates (e.g., separate guard, colonial, elite cadre, emergency militia, or partisan formations).

**INEX** supplements base-game namelists with:
- **Historical Plausibility & Cadre Traditions**: Designations anchored in authentic peacetime mobilization schemes, regional conventions, and national traditions, extrapolated to support large wartime militaries and alternate-history trajectories.
- **Linguistic Precision**: Proper grammatical casing, agreement, and diacritics in native languages (avoiding vanilla errors such as genitive/partitive forms in division titles).
- **Extensive Flavor**: Formations ranging from specialized guard and naval infantry to border guards, fortress garrisons, resistance groups, and historical volunteer forces.

---

## Technical Architecture & Engine Mechanics

### File Structure & Additive Loading
- All division namelists reside in:
  ```text
  common/units/names_divisions/zz_INEX_<TAG>_names_divisions.txt
  ```
- Hearts of Iron IV loads namelist files additively. Files prefixed with `zz_INEX_` do not overwrite vanilla files (`<TAG>_names_divisions.txt`), leaving base-game groups intact unless intentionally overridden.
- The game reads the folder in file name order, and when two files define the same group tag the later file wins. The `zz_` prefix makes every INEX file load after the vanilla file of its nation, and after another mod's copy of that file.

### Tag Overriding & Fallback Behavior
- **Overriding Vanilla Groups**: Declaring a group with an existing base-game tag (e.g., `SOV_INF_01`) overrides that specific group in game.
- **New Group Tags**: Custom INEX groups follow the pattern `<TAG>_<CATEGORY>_<NUMBER>` (e.g., `EST_REG_01`, `EST_KL_01`, `SWE_ARM_01`).
- **Scripted References**: Base-game focus trees and scripted effects that reference specific vanilla tags (e.g., `division_names_group = SOV_INF_02`) automatically fall back to vanilla definitions if omitted from `zz_INEX_<TAG>`. Custom identical stubs are never needed unless active replacements are authored.

### Namelist Invariants
- **Line Subunit Tokens**: In `division_types = { ... }`, only valid line combat subunits are recognized (e.g., `"infantry"`, `"marine"`, `"mountaineers"`, `"cavalry"`, `"motorized"`, `"mechanized"`, `"light_armor"`, `"medium_armor"`, `"heavy_armor"`, `"modern_armor"`). Engine tokens like `"armor"` or `"marines"` are invalid, and support-only battalions (e.g., `"military_police"`) are not accepted.
- **Ordered Blocks**: Keys inside `ordered = { ... }` must be unique integers (`1 = "..."`). Duplicate keys silently overwrite earlier entries.
- **Fallback Formats**: Every group requires a `fallback_name` containing an ordinal token (`%d` for Arabic, `%s` for Roman numerals) to prevent identically unnumbered names on overflow units.
- **Link Numbering**: `link_numbering_with` is used exclusively across separate external groups (e.g., motorized divisions drawing numbers from regular infantry). Self-referential links are invalid.
- **Encoding**: Files must be UTF-8 without BOM with balanced brackets `{}` and quotes `\"`.

---

## Developer Automation (`build.ps1`)

The repository includes a PowerShell automation tool (`build.ps1`) for validation, live local testing, release packaging, and Steam Workshop publishing.

### Key Commands

```powershell
# Validate syntax, bracket balance, double quotes, duplicate ordered keys, and subunit tokens
powershell -File .\build.ps1 -ValidateOnly

# Run full automated Pester unit test suites (namelists, documentation, build automation)
powershell -File .\build.ps1 -Test

# DevLink: Point Paradox Launcher directly to this dev folder (zero-copy live editing)
powershell -File .\build.ps1 -DevLink

# Deploy: Copy files into local Paradox Interactive mod directory
powershell -File .\build.ps1 -Deploy

# Package: Build a clean distribution zip (inex.zip) excluding git/dev artifacts
powershell -File .\build.ps1 -Package

# Inspect vanilla files and scripted focus tree references for a country tag
powershell -File .\build.ps1 -InspectVanilla LAT
powershell -File .\build.ps1 -InspectVanilla SOV -Group SOV_INF_02

# Audit namelist quality heuristics (ALL = triage table, or a file key like LIT / GER_SS)
powershell -File .\build.ps1 -Audit ALL
powershell -File .\build.ps1 -Audit LIT

# Publish update to Steam Workshop via SteamCMD (supports -DryRun)
powershell -File .\build.ps1 -PublishSteam -DryRun
powershell -File .\build.ps1 -PublishSteam -ChangeNote "Add new division namelists"
```

---

## Included Nations Summary

| Tag | Nation | Source File |
| :--- | :--- | :--- |
| `USA` | United States | `zz_INEX_USA_names_divisions.txt` |
| `GER` | Germany | `zz_INEX_GER_names_divisions.txt`, `zz_INEX_GER_SS_names_divisions.txt`, `zz_INEX_GER_ADDITIONAL_names_divisions.txt` |
| `SOV` | Soviet Union | `zz_INEX_SOV_names_divisions.txt` |
| `ENG` | United Kingdom | `zz_INEX_ENG_names_divisions.txt` |
| `FRA` | France | `zz_INEX_FRA_names_divisions.txt` |
| `ITA` | Italy | `zz_INEX_ITA_names_divisions.txt` |
| `POL` | Poland | `zz_INEX_POL_names_divisions.txt` |
| `FIN` | Finland | `zz_INEX_FIN_names_divisions.txt` |
| `SWE` | Sweden | `zz_INEX_SWE_names_divisions.txt` |
| `JAP` | Japan | `zz_INEX_JAP_names_divisions.txt` |
| `EST` | Estonia | `zz_INEX_EST_names_divisions.txt` |
| `LAT` | Latvia | `zz_INEX_LAT_names_divisions.txt` |
| `LIT` | Lithuania | `zz_INEX_LIT_names_divisions.txt` |
| `MEX` | Mexico | `zz_INEX_MEX_names_divisions.txt` |
| `BRA` | Brazil | `zz_INEX_BRA_names_divisions.txt` |
| `GRE` | Greece | `zz_INEX_GRE_names_divisions.txt` |
| `ROM` | Romania | `zz_INEX_ROM_names_divisions.txt` |
| `PER` | Iran / Persia | `zz_INEX_PER_names_divisions.txt` |
| `SPR` | Spain | `zz_INEX_SPR_names_divisions.txt` |

*(Refer to [WORKSHOP_DESCRIPTION_GUIDELINES.md](WORKSHOP_DESCRIPTION_GUIDELINES.md) for full descriptions, examples, and Steam BBCode formatting rules).*

