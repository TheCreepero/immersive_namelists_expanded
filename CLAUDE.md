# Immersive Namelists Expanded (INEX) Development Rules

## 1. Workspace & Architecture
- **Single-Root**: Root directly hosts `.git/`, `descriptor.mod`, `thumbnail.png`, `build.ps1`, `common/`, `tests/`, `wiki/`, `.github/`, docs (`README.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`), and agent configs (`CLAUDE.md`, `.claude/` for Claude Code; `GEMINI.md`, `.agents/` for Google Antigravity).
- **Artifacts**: Releases -> `artifacts/` (`build.ps1 -Package`). Temp files -> `scratch/` (gitignored: research dossiers `<tag>_dossier.md` and ad hoc batches; nothing an implementer needs lives only there).
- **Per-Nation Plans**: `docs/superpowers/plans/YYYY-MM-DD-<country>-audit.md` (for audits, skeleton from `-AuditPlan`) or `<country>-namelist.md` (for authoring, copied from `TEMPLATE-namelist.md`). A plan is the hand-off between planning and implementation and is self-contained: final decisions, the group suite, numbered implementation steps with exact commands, verbatim docs text, and every name as `` ```json batch `` blocks under `## Edit batch`. Its `Status:` line runs `PLANNING` -> `READY` -> `IN PROGRESS` -> `DONE`.
- **Two Stages**: Planning (policy questions, research subagents, design, every name, proofread) ends with a report to the user and stops. Implementation starts only on the user's word: `hoi4-inex-namelist-implement` hands the plan to the `inex-implementer` subagent, which works in a fresh context from the plan file alone (no research, no naming decisions, no repeat of a planning phase), and the dispatching session verifies the result with `-Check` and `git status`.
- **Model per Stage**: Work that decides names runs on the strongest model: planning in the session's own model, the proofread on Sonnet or above. Research runs on Sonnet. Implementation is mechanical and runs on Haiku. Each subagent brief sets its own model (§8); move a stage to a cheaper model only after comparing both on a finished nation.
- **Tooling Backlog**: `docs/tooling-backlog.md` lists open problems in `build.ps1`, the tests, the skills and these rules. During a nation's planning or implementation, work around a tooling problem and add one entry there. Entries are fixed in a session of their own, and a fixed entry is deleted.

## 2. File & Group Conventions
- **Files**: `common/units/names_divisions/zz_INEX_<TAG>_names_divisions.txt`. UTF-8 without BOM [ENC-001], balanced `{}`. The `zz_` prefix is load order (§6), not decoration.
- **Group Tags**: `<TAG>_<CATEGORY>_<NUMBER>` (e.g., `EST_REG_01`, `SWE_ARM_01`). Globally unique across repo.
- **German Split**: `zz_INEX_GER_names_divisions.txt` (Heer plain/Named pairs, Jäger, mountain, airborne, marine, cavalry, garrison, and the ideology suites: Elite, Guard/Imperial, Republican, Red Army), `zz_INEX_GER_SS_names_divisions.txt` (Waffen-SS, fascist-only), `zz_INEX_GER_ADDITIONAL_names_divisions.txt` (numbered series, heavy battalions, Festung, Kampfgruppen, militias per ideology, Foreign Legions).
- **UI Selectors**: `name = "<Selector>"` must be concise; omit nation/demonym prefixes (e.g., `"Infantry Divisions"`, not `"Mexican Infantry Divisions"`) to prevent dropdown truncation.
- **Ideology-Dependent Groups**: Author distinct political, party wing, or guard groups per ideology (e.g. Fascist party militias, Communist Red Guards, Monarchist/Imperial guards, Democratic/Republican defense forces). Never mix opposing ideological traditions in one namelist. There is no artificial pool cap on ideology-gated division namelists—nations may author full specialized suites where historically or plausibly justified (e.g. Waffen-SS suites, Red Guard branches).

## 3. Historical & Linguistic Standards
- **Linguistics**: Accurate grammar, nominative cases, and diacritics in target language (avoid vanilla errors like genitive/partitive *diviisi* vs. nominative *Jalaväediviis*).
- **Plausibility over Rigidity**: Anchor in authentic peacetime cadres, mobilization schemes, regional conventions, and cultural heritage; extrapolate plausibly for full wartime/alt-history forces.

## 4. Mandatory Workshop & Docs Sync
When adding, expanding, or modifying namelists:
1. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: Update Cross-Reference table and `[h1]Included nations:[/h1]` (`[b]Nation[/b]`, 2–3 bullets, italicized unit examples `[i]...[/i]`).
2. `wiki/<Nation>.md`: Add or update the page (tables & context).
3. `powershell -File .\build.ps1 -SyncWiki <TAG>` writes what a script can derive: the wiki page's group rows and headings and the `wiki/Home.md` group count. For a new nation add `-Country "<Name>"`: it also adds the `README.md` row, the `wiki/Home.md` row and the `wiki/_Sidebar.md` line.
4. **Steam Standards**: No emojis. Max ~17k chars (omit `[quote=author]` blocks). Concise tone. Correct diacritics/grammar (`1ère`, `Ryhmä`, `Ziemi Łomżyńskiej`). BBCode: `[h1]`, `[b]`, `[i]`, `[url]`, standard `- ` bullets.
5. **In-Chat Description**: On request, output full ready-to-copy Steam BBCode description + summary of changes.
6. The wiki push (`powershell -File .\wiki\push-wiki.ps1`) is outward-facing: it runs in a plan's ship step, on the user's word.

## 5. Build & Validation Protocol
Every command is `powershell -File .\build.ps1 <switch>`. `Get-Help .\build.ps1 -Parameter <Name>` prints a switch's full description; the batch format is in the planning skills.
- `-Check <TAG> [-Base <rev>]` : One compact pass (about ten lines; errors, failed tests and warnings in full): `-ValidateOnly`, `-Test`, the `-Audit` summary with flag and docs warnings, a refresh of the audit plan in progress, and `-DiffNames` counts. Required before completing any namelist task; it must end with `Check passed`.
- `-ValidateOnly` / `-Test` : Syntax and engine invariants / the full Pester suite (both part of `-Check`).
- `-Audit <KEY>` : Heuristic quality scorecard (`ALL` for the triage table; `-Compare HEAD` for a review list of changes; `-Group <A>,<B> -NamesOnly [-Sections] [-Keys]` for compact name lines). With HOI4 installed it adds `Vanilla:` lines per group: entries identical to vanilla, and the vanilla names and numbers the group leaves out (§6).
- `-InspectVanilla <TAG> [-Group <GROUP>]` : Vanilla groups, counts, fallbacks, and scripted focus/event references.
- `-EditNames <TAG> ...` : The only way a namelist file changes. `-Batch <file.json | plan.md>` applies many operations, all or nothing (a plan's operations are its `` ```json batch `` blocks); `-DryRun` applies them in memory and is the planner's gate before hand-off (`Dry run OK`, no `[WARN] Plan:`). Single edits take `-Group <A>` with `-Add`, `-Remove`, `-Rename`, `-Set` and the metadata switches, or `-AddGroup`.
- `-SetHeader <TAG> -HeaderText "<text>"` : Replace a namelist file's header comment.
- `-DiffNames <TAG> [-Base <rev>]` : Name-level diff against git with additions, removals, and moves.
- `-AuditPlan <KEY>` : Create the audit plan skeleton, or refresh its generated change table.
- `-SyncWiki <TAG> [-Country "<Name>"]` : Docs lines derived from the namelist (§4); reports stale or missing tags and prose that mentions changed names.
- `-SyncMirrors` : Copy the Claude Code agent files over their Antigravity mirrors (§8).
- `-GameLog` : Lines of the game's `error.log` that name INEX files; run after starting the game with the mod enabled.
- `-Package`, `-DevLink`, `-PublishSteam` : Release zip in `artifacts/`, live-edit link in the launcher's mod directory, Workshop upload (`hoi4-inex-release` skill).

## 6. Engine Invariants & Vanilla Overrides
- **Additive Loading**: Namelist files load additively: a vanilla group whose tag INEX does not define stays as it is [NAM-001].
- **Load Order**: The game reads the folder in file name order, and of two files that define the same tag the later one wins [NAM-001]. Every INEX file name starts with `zz_` so that it loads after vanilla's `<TAG>_names_divisions.txt` and after another mod's copy of that file (RT56 and others). Without the prefix, a nation whose tag sorts after "INEX" loses all its groups on vanilla tags. Mod order in the playset does not change this.
- **Tag Overrides**: A group that reuses a vanilla tag (e.g., `SOV_INF_01`) replaces the vanilla group whole [NAM-002]. The INEX entries are the only ones the game reads, and every vanilla `ordered` key INEX leaves out is gone. Leaving a key out removes that vanilla name; keeping a vanilla name means writing it in the INEX group. A new tag (e.g., `EST_KL_01`) adds a group.
- **Scripted Fallbacks**: A vanilla tag that events or focuses reference keeps its vanilla definition while INEX does not define it [NAM-002]. Define a vanilla tag only to change it, or as the plain variant below.
- **Plain/Named Variants**: Nicknamed infantry, motorized, mechanized, and armor lists keep an un-nicknamed variant on the vanilla tag, and the nicknames go in a new `"<Selector> (Named)"` tag that shares its numbering via `link_numbering_with = { <plain tag> }`. The plain group is fallback-only (no `ordered`) where vanilla's entries only repeat the fallback in a 1..N run. Where vanilla's keys are historical numbers with gaps (e.g. `GER_Inf_01`: 1-36, 44, 45, 46, 50), the plain group keeps those numbered entries, because a fallback counts on without the gaps. Skip the pair only if vanilla already nicknames those divisions (e.g. USA).
- **Subunits**: `division_types = { ... }` allows any line combat token that `-ValidateOnly` accepts (the full list is `$ValidDivisionTypes` in `build.ps1`). Common ones: `"infantry"`, `"cavalry"`, `"motorized"`, `"mechanized"`, `"marine"`, `"mountaineers"`, `"paratrooper"`, `"militia"`, `"light_armor"`, `"medium_armor"`, `"heavy_armor"`, `"modern_armor"`. Never use invalid (`"armor"`, `"marines"`) or support-only tokens (`"military_police"`). The tokens vanilla uses are in [NAM-004].
- **Ideology Gating (`can_use`)**: Optional group trigger evaluated in `Country` scope [NAM-003]. Gate ideological namelists strictly via `can_use = { has_government = <ideology> }` (`democratic`, `neutrality`, `fascism`, `communism`, with boolean operators `OR = { ... }` or `NOT = { ... }`).
  - **Strict Focus Ban**: **Never lock namelists behind national focuses (`has_completed_focus`)**, decisions, ideas, or event flags. Focus locks break compatibility with overhaul mods (e.g. *Road to 56*, national focus overhauls) and fail on peaceful advisor flips, referendums, civil wars, and puppet releases. Always gate by government type instead.
- **Ordered Blocks**: Unique integer keys (duplicates overwrite). No empty `ordered = { }` blocks: a rule of this mod, since vanilla itself has them [NAM-006].
- **Strings**: An apostrophe needs no escape (`'Hobart's Funnies'`). A backslash may only precede a double quote or another backslash; the game's lexer rejects anything else and `-ValidateOnly` fails on it [NAM-008].
- **Fallback Formatting**: `fallback_name` requires `%d` (Arabic) or `%s` (Roman) [NAM-005]. Language suffixes without `%d`/`%s` (e.g., `%er`) are invalid in fallbacks (static `ordered` only).
- **Link Numbering**: `link_numbering_with` links only to *different* external groups (e.g., motorized to infantry) [NAM-007]. Never self-referential (`link_numbering_with = { SELF }`).
- **Tag Uniqueness**: Group tags must be globally unique across all repo files.

## 7. Related Skills
All four live in `.claude/skills/` and `.agents/skills/`. The first two are planning skills: they write the plan file and stop.
- **Authoring (planning)**: `hoi4-inex-namelist-authoring` plans new/expanded namelists via the Historical Research subagent and a conditional proofread.
- **Audit (planning)**: `hoi4-inex-namelist-audit` plans the modernization of an existing namelist starting from `build.ps1 -Audit <TAG>`, with a user approval checkpoint.
- **Implementation**: `hoi4-inex-namelist-implement <plan path>` dispatches the `inex-implementer` subagent for a `READY` or `IN PROGRESS` plan (it applies the batch, syncs docs, runs `-Check`), verifies the result, and ships (commit and wiki push) on the user's word. Nothing in it researches or decides; when the plan does not cover something, it stops and reports.
- **Release**: `hoi4-inex-release` publishes what is committed: preflight, the in-game check with `-GameLog`, the change note, and the Workshop upload the user runs.

## 8. Agent Config Mirrors
Claude Code and Google Antigravity use mirrored configs:
- `CLAUDE.md` ⇄ `GEMINI.md` (byte-identical).
- `.claude/skills/<skill>/SKILL.md` ⇄ `.agents/skills/<skill>/SKILL.md`, for every skill in §7 (byte-identical).
- The subagent briefs exist once, in `.claude/agents/`. Claude dispatches them as named agents; Antigravity passes their path to `invoke_subagent`.
  - `inex-historical-researcher.md`: full OOB dossier for authoring, raw input to the plan, written to `scratch/<tag>_dossier.md` with a summary of at most 200 words returned (Sonnet, web tools plus Write, about 40 web calls, `maxTurns: 50`).
  - `inex-audit-researcher.md`: budgeted fact-check for audits (Sonnet, web-only tools, ≤25 web calls, `effort: medium`, `maxTurns: 30`).
  - `inex-code-reviewer.md`: proofreader of added names, not a general review gate (Sonnet, web-only tools, ≤8 web calls, `maxTurns: 12`); dispatched by the planner before hand-off, only when a plan adds 25+ authored non-English names or the user asks, with the names pasted in. Mechanical checks are lints in `build.ps1`, not reviewer work.
  - `inex-implementer.md`: carries out a plan (Haiku, `effort: high`, file and PowerShell tools, no web tools, `maxTurns: 60`, `permissionMode: acceptEdits` so its file edits run without a prompt); it holds the whole implementation runbook.

Edit the Claude side (`CLAUDE.md`, `.claude/skills/`), then run `powershell -File .\build.ps1 -SyncMirrors`: it copies each file over its mirror. Confirm with `git status` that both sides changed before reporting completion. A change made on the Antigravity side is copied to the Claude side by hand first.

## 9. Compact Instructions
When compacting, keep: the active nation and TAG, the plan file path and its `Status:`, whether the session is planning or implementing, the first unticked implementation step, group tags edited and their remaining TODOs, pending Section 4 doc-sync steps, and the latest `-ValidateOnly`/`-Test` result. Drop raw audit, test and research output once its findings are recorded in the plan file.

## 10. Engine Knowledge
- Facts about how the game and its engine behave live in one place: the knowledge register of the Modding Manager, reached through the user-level `hoi4-modding-knowledge` skill. Search it before writing a kind of mod file for the first time in a session and before asking for a game launch.
- Do not write an engine fact into this repository (this file, `wiki/`, `docs/`, skills). Add it to the register with `Add-HoiKnowledge.ps1` and cite its id here, as in `[LOAD-010]`.
- Topics this mod leans on: `namelists`, `loading-and-overrides`, `encoding-and-syntax`.
- `tests/Knowledge.Tests.ps1` runs the register's audit for this repository. Keep it identical to the Manager's `Scripts/Knowledge/Knowledge.Tests.ps1`.
