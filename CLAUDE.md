# Immersive Namelists Expanded (INEX) Development Rules

## 1. Workspace & Architecture
- **Single-Root**: Root directly hosts `.git/`, `descriptor.mod`, `thumbnail.png`, `build.ps1`, `common/`, `tests/`, `wiki/`, `.github/`, docs (`README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`), and agent configs (`CLAUDE.md`, `.claude/` for Claude Code; `GEMINI.md`, `.agents/` for Google Antigravity).
- **Artifacts**: Releases -> `artifacts/` (`build.ps1 -Package`). Temp files -> `scratch/`.
- **Per-Nation Plans**: `docs/superpowers/plans/YYYY-MM-DD-<country>-audit.md` (for audits) or `<country>-namelist.md` (for authoring).

## 2. File & Group Conventions
- **Files**: `common/units/names_divisions/INEX_<TAG>_names_divisions.txt`. UTF-8 without BOM, balanced `{}`.
- **Group Tags**: `<TAG>_<CATEGORY>_<NUMBER>` (e.g., `EST_REG_01`, `SWE_ARM_01`). Globally unique across repo.
- **German Split**: `INEX_GER_names_divisions.txt` (Heer plain/Named pairs, Jäger, mountain, airborne, marine, cavalry, garrison, and the ideology suites: Elite, Guard/Imperial, Republican, Red Army), `INEX_GER_SS_names_divisions.txt` (Waffen-SS, fascist-only), `INEX_GER_ADDITIONAL_names_divisions.txt` (numbered series, heavy battalions, Festung, Kampfgruppen, militias per ideology, Foreign Legions).
- **UI Selectors**: `name = "<Selector>"` must be concise; omit nation/demonym prefixes (e.g., `"Infantry Divisions"`, not `"Mexican Infantry Divisions"`) to prevent dropdown truncation.
- **Ideology-Dependent Groups**: Author distinct political, party wing, or guard groups per ideology (e.g. Fascist party militias, Communist Red Guards, Monarchist/Imperial guards, Democratic/Republican defense forces). Never mix opposing ideological traditions in one namelist. There is no artificial pool cap on ideology-gated division namelists—nations may author full specialized suites where historically or plausibly justified (e.g. Waffen-SS suites, Red Guard branches).

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
- `powershell -File .\build.ps1 -ValidateOnly` : Syntax and bracket validation. Required before completing any namelist task.
- `powershell -File .\build.ps1 -Test`         : Full Pester unit test suite (engine invariants and documentation sync).
- `powershell -File .\build.ps1 -Audit <TAG>`  : Heuristic quality scorecard (`-Audit ALL` for full report; add `-Compare HEAD` for a review list of tag and name changes; add `-Group <A>,<B> -NamesOnly [-Sections] [-Keys]` to inspect compact name lines: consecutive duplicates collapse to `name (xN)`, `-Keys` prefixes ordered keys, gated groups show `can_use`).
- `powershell -File .\build.ps1 -EditNames <TAG> -Group <A>,<B> [-Remove "A; B"] [-RemoveAll] [-Rename "Old=New"] [-Add "C; D" [-Section <header>]] [-Set "Idx=Val"] [-Selector "<Name>"] [-AddType "<type>"] [-RemoveType "<type>"] [-CanUse "<trigger>"] [-ClearOrdered] [-Comment "<text>"] [-RemoveGroup]` : Edit group names and metadata in place without opening the file; auto-handles numbering, indentation, header cleanup, and multi-group edits. `-RemoveAll -Add "# Header; 1=A; 2=B"` rewrites a whole list, `-ClearOrdered` makes a fallback-only plain group, `-Comment` sets the comment above a group, `-RemoveGroup` deletes a group (refused while another group links to it).
- `powershell -File .\build.ps1 -SetHeader <TAG> -HeaderText "<text>"` : Replace a namelist file's header comment (section banners are kept).
- `powershell -File .\build.ps1 -DiffNames <TAG> [-Base <rev>]` : Name-level diff against git (`HEAD` by default) with additions, removals, and moves.
- `powershell -File .\build.ps1 -AuditPlan <TAG>` : Create `docs/superpowers/plans/YYYY-MM-DD-<country>-audit.md` or refresh its generated change table; reports unfilled TODO sections as `PlanTodo`.
- `powershell -File .\build.ps1 -SyncWiki <TAG>`  : Sync `wiki/<Country>.md` display names, types, and fallbacks; reports stale/missing tags and prose mentions.
- `powershell -File .\build.ps1 -InspectVanilla <TAG> [-Group <GROUP>]` : Vanilla groups, counts, fallbacks, and scripted focus/event references.
- `powershell -File .\build.ps1 -Package`      : Staged release zip in `artifacts/` (excludes dev/test/docs).
- `powershell -File .\build.ps1 -DevLink`      : Zero-copy live editing symlink in Paradox launcher mod directory.

## 6. Engine Invariants & Vanilla Overrides
- **Additive Loading**: Files load additively; vanilla stays active in background.
- **Tag Overrides**: Reusing vanilla tag (e.g., `SOV_INF_01`) overrides it; new tag (e.g., `EST_KL_01`) adds a group.
- **Scripted Fallbacks**: Omitted vanilla tags referenced by events/focuses fall back to vanilla automatically. Never copy identical empty vanilla stubs (exception: the plain variant below).
- **Plain/Named Variants**: Nicknamed infantry, motorized, mechanized, and armor lists keep an un-nicknamed variant: the vanilla tag stays a fallback-only plain group (no `ordered`), and the nicknames go in a new `"<Selector> (Named)"` tag that shares its numbering via `link_numbering_with = { <plain tag> }`. Skip this only if vanilla already nicknames those divisions (e.g. USA).
- **Subunits**: `division_types = { ... }` allows only valid line combat tokens (`"infantry"`, `"marine"`, `"light_armor"`, `"medium_armor"`, `"heavy_armor"`, `"modern_armor"`, `"motorized"`). Never use invalid (`"armor"`, `"marines"`) or support-only tokens (`"military_police"`).
- **Ideology Gating (`can_use`)**: Optional group trigger evaluated in `Country` scope. Gate ideological namelists strictly via `can_use = { has_government = <ideology> }` (`democratic`, `neutrality`, `fascism`, `communism`, with boolean operators `OR = { ... }` or `NOT = { ... }`).
  - **Strict Focus Ban**: **Never lock namelists behind national focuses (`has_completed_focus`)**, decisions, ideas, or event flags. Focus locks break compatibility with overhaul mods (e.g. *Road to 56*, national focus overhauls) and fail on peaceful advisor flips, referendums, civil wars, and puppet releases. Always gate by government type instead.
- **Ordered Blocks**: Unique integer keys (duplicates overwrite). No empty `ordered = { }` blocks.
- **Fallback Formatting**: `fallback_name` requires `%d` (Arabic) or `%s` (Roman). Language suffixes without `%d`/`%s` (e.g., `%er`) are invalid in fallbacks (static `ordered` only).
- **Link Numbering**: `link_numbering_with` links only to *different* external groups (e.g., motorized to infantry). Never self-referential (`link_numbering_with = { SELF }`).
- **Tag Uniqueness**: Group tags must be globally unique across all repo files.

## 7. Related Skills
- **Authoring**: `hoi4-inex-namelist-authoring` (`.claude/skills/` or `.agents/skills/`) for new/expanded namelists via Historical Research and Code Reviewer subagents.
- **Audit**: `hoi4-inex-namelist-audit` (`.claude/skills/` or `.agents/skills/`) to audit and modernize existing namelists starting from `build.ps1 -Audit <TAG>`.

## 8. Agent Config Mirrors
Claude Code and Google Antigravity use mirrored configs:
- `CLAUDE.md` ⇄ `GEMINI.md` (byte-identical).
- `.claude/skills/<skill>/SKILL.md` ⇄ `.agents/skills/<skill>/SKILL.md`, for `hoi4-inex-namelist-authoring` and `hoi4-inex-namelist-audit` (byte-identical).
- The subagent briefs exist once, in `.claude/agents/`: `inex-historical-researcher.md` (full OOB dossier for authoring), `inex-audit-researcher.md` (budgeted fact-check for audits: web-only tools, ≤25 web calls, `effort: medium`, `maxTurns: 30`) and `inex-code-reviewer.md`. Claude dispatches them as named agents; Antigravity passes their path to `invoke_subagent`.

When a rule, standard or runbook step changes in one file, change its mirror in the same task. The project rules stay identical. Confirm with `git status` that both sides changed before reporting completion.

## 9. Compact Instructions
When compacting, keep: the active nation and TAG, the plan file path, group tags edited and their remaining TODOs, pending Section 4 doc-sync steps, and the latest `-ValidateOnly`/`-Test` result. Drop raw audit, test and research output once its findings are recorded in the plan file.
