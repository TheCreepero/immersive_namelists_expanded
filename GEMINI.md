# Immersive Namelists Expanded (INEX) Development Rules

## 1. File Structure & Naming Conventions
- All division namelist files must reside in `common/units/names_divisions/INEX_<TAG>_names_divisions.txt`.
- Namelist group tags must follow the pattern `<TAG>_<CATEGORY>_<NUMBER>` (e.g., `EST_REG_01`, `EST_KL_01`, `SWE_ARM_01`).
- All files must be saved using UTF-8 encoding (without BOM) and maintain strictly balanced curly brackets `{}`.
- **German Namelist Convention**: Germany is intentionally split into three separate files for organization: `INEX_GER_names_divisions.txt` (Wehrmacht regular), `INEX_GER_SS_names_divisions.txt` (Waffen-SS), and `INEX_GER_ADDITIONAL_names_divisions.txt` (Kampfgruppen, Festung, Fallschirmjäger, Volkssturm, and specialized formations).

## 2. Historical & Linguistic Standards
- **Linguistic Precision**: Always verify proper grammar, cases, and diacritics in the target language. Avoid vanilla Paradox errors (e.g., using genitive/partitive forms like *diviisi* instead of nominative *Jalaväediviis*).
- **Historical Plausibility over Rigid Accuracy**: The goal of INEX is historical plausibility, not rigid historical accuracy. Anchor unit designations in authentic peacetime cadre structures, mobilization schemes, regional conventions, and cultural heritage, but extrapolate plausibly to support full wartime campaigns, expanded forces, and alternate-history trajectories.

## 3. Mandatory Workshop & Documentation Synchronization
Whenever a new country namelist is added, expanded, or modified:
1. **Update `WORKSHOP_DESCRIPTION_GUIDELINES.md`**:
   - Add/update the file and summary in the **Repository Cross-Reference** table.
   - Add/update the nation under `[h1]Included nations:[/h1]` using standard BBCode (`[b]Nation[/b]` with bulleted categories and italicized unit examples `[i]...[/i]`).
   - Remove completed nations from `[h1]Planned:[/h1]`.
2. **Update `README.md`**:
   - Add any newly introduced country tags and source files to the **Included Nations Summary** table.
3. **Update Wiki Documentation (`wiki/`)**:
   - Add or update the nation documentation page in `wiki/<Nation>.md`, ensuring full namelist tables and historical context are detailed.
   - Update `wiki/Home.md` and `wiki/_Sidebar.md` when introducing a new nation.
   - Synchronize updates to the live GitHub wiki using `powershell -File .\wiki\push-wiki.ps1`.
4. **Steam Description Standards**:
   - **No Emojis**: Strictly avoid emojis anywhere in the description.
   - **Character Limit**: Steam Workshop descriptions have a max character limit (~17,000 characters). Keep bullet points concise and do NOT include author update quote blocks (`[quote=author]...[/quote]`) to avoid hitting this limit.
   - **Writing Style**: Keep the tone concise, direct, and informative, matching the author's original style.
   - **Grammar & Linguistic Corrections**: Fix any typos, broken English, or missing diacritics in historical names (e.g., `1ère`, `Ryhmä`, `Ziemi Łomżyńskiej`).
   - **Steam BBCode**: Strictly follow Steam's formatting rules (`[h1]`, `[b]`, `[i]`, `[url]`, or standard `- ` bullets).
5. **In-Chat Description Generation**:
   - Whenever the user requests an updated description in chat, output the complete, ready-to-copy Steam BBCode description block directly in the chat alongside a concise summary of additions and changes.

## 4. Build & Validation Protocol
- Always run syntax and bracket validation before completing any namelist task:
  ```powershell
  powershell -File .\build.ps1 -ValidateOnly
  ```
- Run the full Pester unit test suite to verify engine invariants and documentation synchronization:
  ```powershell
  powershell -File .\build.ps1 -Test
  ```
- Use `build.ps1 -Package` to test clean staging and zip distribution (ensuring `.git`, `.github`, `tests`, scripts, and documentation are strictly excluded from mod releases).
- Use `build.ps1 -DevLink` when zero-copy live editing in the Paradox launcher is required.

## 5. Vanilla Tag Overrides & Scripted References
- **Additive Loading**: Hearts of Iron IV loads all files in `common/units/names_divisions/` additively. Because INEX uses the `INEX_<TAG>` filename prefix, vanilla files (e.g. `SOV_names_divisions.txt`) remain active in the background.
- **Tag Overriding**: Defining a group with an existing vanilla tag (e.g., `SOV_INF_01`) overrides that specific group in game. Defining a new tag (e.g., `EST_KL_01`) adds a new group.
- **Pruning & Scripted Fallbacks**: If a vanilla tag is referenced by base game focus trees, scripted effects, or decisions (e.g., `division_names_group = SOV_INF_02`), omitting it from `INEX_<TAG>` is completely safe—the engine automatically falls back to the vanilla definition. Do not copy identical empty vanilla stubs into INEX unless actively authoring custom names for them.

## 6. Engine Namelist Invariants
- **Subunit Tokens**: In `division_types = { ... }`, only use valid line combat subunit tokens (e.g., `"marine"`, `"infantry"`, `"light_armor"`, `"medium_armor"`, `"heavy_armor"`, `"modern_armor"`). Never use `"armor"`, `"marines"`, or support-only tokens like `"military_police"`.
- **Ordered Blocks**: Integer keys in `ordered = { ... }` must be strictly unique. Duplicate keys silently overwrite earlier entries. Never leave empty `ordered = { }` blocks.
- **Fallback Formatting**: Every `fallback_name` must include an ordinal format string (`%d` for Arabic, `%s` for Roman numerals) to prevent overflow units from generating identical unnumbered names.
- **Link Numbering**: `link_numbering_with` must only be used to link to *different* external groups (e.g., motorized linking to field infantry). Never define self-referential links (`link_numbering_with = { SELF }`).
