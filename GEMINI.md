# Immersive Namelists Expanded (INEX) Development Rules

## 1. Workspace & Architecture
- **Single-Root**: Root directly hosts `.git/`, `descriptor.mod`, `thumbnail.png`, `build.ps1`, `common/`, `tests/`, `wiki/`, `.github/` (no nested folders).
- **Artifacts**: Releases -> `artifacts/` (`build.ps1 -Package`). Temp files -> `scratch/`.

## 2. File & Group Conventions
- **Files**: `common/units/names_divisions/INEX_<TAG>_names_divisions.txt`. UTF-8 without BOM, balanced `{}`.
- **Group Tags**: `<TAG>_<CATEGORY>_<NUMBER>` (e.g., `EST_REG_01`, `SWE_ARM_01`). Globally unique across repo.
- **German Split**: `INEX_GER_names_divisions.txt` (Wehrmacht regular), `INEX_GER_SS_names_divisions.txt` (Waffen-SS), `INEX_GER_ADDITIONAL_names_divisions.txt` (Kampfgruppen, Festung, Fallschirmjäger, Volkssturm, specialized).
- **UI Selectors**: `name = "<Selector>"` must be concise; omit nation/demonym prefixes (e.g., `"Infantry Divisions"`, not `"Mexican Infantry Divisions"`) to prevent dropdown truncation.

## 3. Historical & Linguistic Standards
- **Linguistics**: Accurate grammar, nominative cases, and diacritics in target language (avoid vanilla errors like genitive/partitive *diviisi* vs. nominative *Jalaväediviis*).
- **Plausibility over Rigidity**: Anchor in authentic peacetime cadres, mobilization schemes, regional conventions, and cultural heritage; extrapolate plausibly for full wartime/alt-history forces.

## 4. Mandatory Workshop & Docs Sync
When adding, expanding, or modifying namelists:
1. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: Update Cross-Reference table and `[h1]Included nations:[/h1]` (`[b]Nation[/b]`, 2–3 bullets, italicized unit examples `[i]...[/i]`).
2. `README.md`: Update Included Nations Summary table with tags and source files.
3. `wiki/`: Add/update `wiki/<Nation>.md` (tables & context); update `wiki/Home.md` & `wiki/_Sidebar.md`; push via `powershell -File .\wiki\push-wiki.ps1`.
4. **Steam Standards**: No emojis. Max ~17k chars (omit `[quote=author]` blocks). Concise tone. Correct diacritics/grammar (`1ère`, `Ryhmä`, `Ziemi Łomżyńskiej`). BBCode: `[h1]`, `[b]`, `[i]`, `[url]`, standard `- ` bullets.
5. **In-Chat Description**: On request, output full ready-to-copy Steam BBCode description + summary of changes.

## 5. Build & Validation Protocol
- `powershell -File .\build.ps1 -ValidateOnly` : Syntax and bracket validation.
- `powershell -File .\build.ps1 -Test`         : Full Pester unit test suite (engine invariants and documentation sync).
- `powershell -File .\build.ps1 -Audit <TAG>`  : Heuristic quality scorecard (`-Audit ALL` for full report; add `-Compare HEAD` for a review list of tag and name changes).
- `powershell -File .\build.ps1 -Package`      : Staged release zip in `artifacts/` (excludes dev/test/docs).
- `powershell -File .\build.ps1 -DevLink`      : Zero-copy live editing symlink in Paradox launcher mod directory.

## 6. Engine Invariants & Vanilla Overrides
- **Additive Loading**: Files load additively; vanilla stays active in background.
- **Tag Overrides**: Reusing vanilla tag (e.g., `SOV_INF_01`) overrides it; new tag (e.g., `EST_KL_01`) adds a group.
- **Scripted Fallbacks**: Omitted vanilla tags referenced by events/focuses fall back to vanilla automatically. Never copy identical empty vanilla stubs (exception: the plain variant below).
- **Plain/Named Variants**: Nicknamed infantry, motorized, mechanized, and armor lists keep an un-nicknamed variant: the vanilla tag stays a fallback-only plain group (no `ordered`), and the nicknames go in a new `"<Selector> (Named)"` tag that shares its numbering. Skip this only if vanilla already nicknames those divisions (e.g. USA).
- **Subunits**: `division_types = { ... }` allows only valid line combat tokens (`"infantry"`, `"marine"`, `"light_armor"`, `"medium_armor"`, `"heavy_armor"`, `"modern_armor"`, `"motorized"`). Never use invalid (`"armor"`, `"marines"`) or support-only tokens (`"military_police"`).
- **Ordered Blocks**: Unique integer keys (duplicates overwrite). No empty `ordered = { }` blocks.
- **Fallback Formatting**: `fallback_name` requires `%d` (Arabic) or `%s` (Roman). Language suffixes without `%d`/`%s` (e.g., `%er`) are invalid in fallbacks (static `ordered` only).
- **Link Numbering**: `link_numbering_with` links only to *different* external groups (e.g., motorized to infantry). Never self-referential (`link_numbering_with = { SELF }`).
- **Tag Uniqueness**: Group tags must be globally unique across all repo files.

## 7. Related Skills
- **Authoring**: `hoi4-inex-namelist-authoring` (`.claude/skills/` or `.agents/skills/`) for new/expanded namelists via Historical Research and Code Reviewer subagents.
- **Audit**: `hoi4-inex-namelist-audit` (`.claude/skills/` or `.agents/skills/`) to audit and modernize existing namelists starting from `build.ps1 -Audit <TAG>`.
