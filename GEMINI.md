# Immersive Namelists Expanded (INEX) Development Rules

## 1. File Structure & Naming Conventions
- All division namelist files must reside in `common/units/names_divisions/INEX_<TAG>_names_divisions.txt`.
- Namelist group tags must follow the pattern `<TAG>_<CATEGORY>_<NUMBER>` (e.g., `EST_REG_01`, `EST_KL_01`, `SWE_ARM_01`).
- All files must be saved using UTF-8 encoding (without BOM) and maintain strictly balanced curly brackets `{}`.

## 2. Historical & Linguistic Standards
- **Linguistic Precision**: Always verify proper grammar, cases, and diacritics in the target language. Avoid vanilla Paradox errors (e.g., using genitive/partitive forms like *diviisi* instead of nominative *Jalaväediviis*).
- **Historical Plausibility over Rigid Accuracy**: The goal of INEX is historical plausibility, not rigid historical accuracy. Anchor unit designations in authentic peacetime cadre structures, mobilization schemes, regional conventions, and cultural heritage, but extrapolate plausibly to support full wartime campaigns, expanded forces, and alternate-history trajectories.

## 3. Mandatory Workshop Description Synchronization
Whenever a new country namelist is added or modified:
1. Update `WORKSHOP_DESCRIPTION_GUIDELINES.md`:
   - Add the file and summary to the **Repository Cross-Reference** table.
   - Add the nation under `[h1]Included nations:[/h1]` using standard BBCode (`[b]Nation[/b]` with bulleted categories and italicized unit examples `[i]...[/i]`).
   - Remove completed nations from `[h1]Planned:[/h1]`.
2. Strictly follow the guidelines: no emojis, direct and informative tone, standard BBCode tags.

## 4. Build & Validation Protocol
- Always run syntax and bracket validation before completing any namelist task:
  ```powershell
  powershell -File .\build.ps1 -ValidateOnly
  ```
- Use `build.ps1 -Package` to test clean staging and zip distribution (ensuring `.git`, scripts, and documentation are strictly excluded from mod releases).
- Use `build.ps1 -DevLink` when zero-copy live editing in the Paradox launcher is required.

