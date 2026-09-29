---
name: hoi4-inex-namelist-audit
description: >-
  Use when auditing, modernizing, or bringing an existing Immersive Namelists Expanded (INEX) national
  namelist file up to current standards - a quality pass on an already-implemented nation (placeholder
  entries, broken translations, singular or duplicate selectors, shallow lists, stale docs). For brand-new
  nations use hoi4-inex-namelist-authoring instead.
---

# INEX Namelist Audit & Modernization

> **Mirror**: `.claude/skills/hoi4-inex-namelist-audit/SKILL.md` (Claude Code). Apply rule changes to both (`GEMINI.md` §9).

Brings one existing `INEX_<KEY>_names_divisions.txt` file up to current project standards without breaking players' saved templates.

Entries that meet the standard stay untouched; only reported gaps are fixed. Rules: `GEMINI.md` §2–6. The script does the mechanical checking; keep your context for judgment.

`<KEY>` is the part of the filename between `INEX_` and `_names_divisions` (e.g. `LIT`, `GER_SS`, `GER_ADDITIONAL`). Audit **one file per run**.

---

## Token Discipline
- Start from `powershell -File .\build.ps1 -Audit <TAG>` (~40 lines: group table, findings, summary).
- Read groups with `-Audit <TAG> -Group <A>,<B> -NamesOnly` (one line per group; `<TAG>_` prefix optional, e.g. `-Group INF_01,CAV_01`); add `-Sections` to show comment headers inline. Drop `-NamesOnly` only when you need block syntax (`division_types`, `fallback_name`, `link_numbering_with`, `can_use`). Never open the namelist file, not even to edit it: use `-EditNames`.
- Read only the groups a finding names and the content-risk pools. Pure regional or numbered lists get a `-NamesOnly` skim for display names; the reviewer's whole-file check covers them.
- Docs: `-SyncWiki <TAG>` rewrites wiki display names and fallbacks. Grep only for prose (README and workshop rows, the `[b]<Country>[/b]` block, wiki overview or scope notes) and edit only those lines; never print a whole wiki page.
- Plan: `-AuditPlan <TAG>` writes the skeleton and the change table; never read an older plan as a template or hand-edit the table.
- Run `-InspectVanilla <TAG>` only for a fallback or vanilla overlap finding.
- Subagents get context, not file access: paste the `-NamesOnly` lines of every group they must judge into their prompt (the audit researcher has web tools only). Refer to `.claude/agents/inex-audit-researcher.md`.
- The researcher verifies; you decide. Identify what you can yourself, draft candidates yourself, and send only what needs a source.

---

## 1. Non-Negotiables for Audits

1. **Preserve every existing root group tag.** Players' division templates and other groups' `link_numbering_with` reference tags by name. Never rename or delete a tag. Fix it in place. Add a new tag only for a genuinely new category, or for the named variant of a plain/named pair (R10).
2. **Keep what is already good.** Modernize; do not rewrite authored, historically sound names for the sake of it.
3. **Keep file-level conventions:** `for_countries`, the German three-file split, and any group referenced by vanilla scripts (see `-InspectVanilla`).
4. **No edits before approval.** The audit report is a checkpoint; apply only the items the user approves.
5. **Wiki push is outward-facing.** Run `wiki/push-wiki.ps1` only after the user confirms.
6. **Never retain focus-locked namelists (`has_completed_focus`).** Namelists must never be locked behind national focuses. Convert any legacy focus locks to pure government type checks (`has_government = <ideology>`), war state triggers (`has_war = yes`), or country tags to maximize compatibility with mods like *Road to 56* and overhaul focus trees.

---

## 2. Modern Standards Rubric

A modernized file meets all of these (reference implementation: `INEX_PER_names_divisions.txt`):

| # | Standard | Lint flag |
|---|---|---|
| R1 | Short INEX header: country + tag, language/orthography notes, note on which vanilla groups are overridden. No vanilla boilerplate. | `HEADER_BOILERPLATE` |
| R2 | Section banners grouping related groups; a one-line comment above a group when it overrides vanilla or links numbering. | - |
| R3 | Selector `name` is plural, concise (<= 28 chars), unique within the file, no demonym. | `SELECTOR_SINGULAR`, `SELECTOR_LONG`, `SELECTOR_DUPLICATE` |
| R4 | `ordered` entries are authored (nicknames, garrison cities, honorifics, historical titles), not the fallback repeated. A single trailing fallback-pattern entry is fine. | `PLACEHOLDER_ENTRIES` |
| R5 | Main line groups (infantry, armor, cavalry) carry 20-30+ authored entries; small specialist groups may be shorter when history justifies it. | `LOW_DEPTH` |
| R6 | Fallbacks are correct target-language nominative with `%d`/`%s`, no machine-translated compounds. | (manual) |
| R7 | Motorized/mechanized groups `link_numbering_with` field infantry where the nation's doctrine plausibly shared numbering. | `UNLINKED_MOBILE` |
| R8 | No dead commented self-links, TODO notes, or "barely any info" comments. | `DEAD_SELF_LINK_COMMENT`, `TODO_COMMENT` |
| R9 | Wiki page, README row, and workshop cross-reference/BBCode describe the file as it now is. | (manual) |
| R10 | Nicknamed infantry, motorized, mechanized, and armor lists keep a plain (un-nicknamed) variant: the existing/vanilla tag becomes the fallback-only plain group, and the nicknames move to a new `"<Selector> (Named)"` tag that shares its numbering (authoring skill §4). Not needed if vanilla already nicknames those divisions (e.g. USA). | (manual; `-Audit` shows `Variant: plain` and exempts it from R4/R5) |
| R11 | Ideology-gated groups use `has_government` and never lock behind national focuses (`has_completed_focus`), decisions, or event flags. | `FOCUS_LOCKED` |

Two more informational lints: `NAME_LONG` (an entry over 60 characters; only outliers, since long honorific names are common and intended) and the file-level `IDENTITY_REPEAT`, which lists quoted identities (e.g. `'Tali'`) reused across groups under different division numbers.

Lint flags are **heuristics**. Treat them as leads, confirm by reading the group, and override with a stated reason where history justifies it.

---

## 3. Workflow

```
Phase 0  Triage & Audit Plan       -Audit, -AuditPlan, -InspectVanilla
Phase 1  Targeted Research         inex-audit-researcher (budgeted fact-checker)
Phase 2  Audit Report Checkpoint   STOP for user approval
Phase 3  Apply in Place            -EditNames (no full-file rewrites)
Phase 4  Verify                    -ValidateOnly, -Test, -DiffNames, -AuditPlan refresh
Phase 5  Docs Delta                -SyncWiki, README & workshop rows
Phase 6  Code Reviewer Subagent    inex-code-reviewer (diff-scoped reading economy)
Phase 7  Push & Confirm            wiki/push-wiki.ps1 (after confirmation)
```

### Phase 0: Triage & Audit Plan
1. If the user has not named a file, run `powershell -File .\build.ps1 -Audit ALL` and suggest the top candidates.
2. `powershell -File .\build.ps1 -Audit <KEY>`: per-group metrics and rubric flags.
3. `powershell -File .\build.ps1 -AuditPlan <KEY>`: creates the plan skeleton (`docs/superpowers/plans/YYYY-MM-DD-<country>-audit.md`) with the initial report, TODO sections, and empty change table.
4. `powershell -File .\build.ps1 -InspectVanilla <TAG>`: vanilla overlap and scripted `division_names_group` references (skip if HOI4 is not installed; note it in the report).
5. Read flagged groups with `powershell -File .\build.ps1 -Audit <KEY> -Group <GROUP> -NamesOnly -Sections`. Never dump the full file.
6. Check for linguistic problems the lint cannot see: wrong case, missing diacritics, machine-translated words, copy-paste selectors.
7. Ask policy questions (e.g. naming conventions, plain vs named variants) before research.

### Phase 1: Targeted "Historical Research" Subagent
Dispatch a budgeted fact-checker subagent using `.claude/agents/inex-audit-researcher.md` (role `"Audit Researcher"`, model `"flash"`):
- Web-only tools, maximum 25 web calls.
- Send a **specific list** of questionable entries, fallbacks, or garrison titles needing native-language verification.
- Paste the `-NamesOnly` lines of the relevant groups into the prompt.
- The researcher returns **verified facts, not finished namelist entries**. Mark UNVERIFIED rather than guessing.

### Phase 2: Audit Report (checkpoint)
Present this report and **stop for user approval**:

```markdown
## Audit: INEX_<KEY>_names_divisions.txt
Scorecard: <groups> groups, <authored>/<ordered> authored entries, <n> lint flags, last touched <date>

### Critical  (broken language, wrong names, invariant risks)
- [TAG] problem -> proposed fix
### Important (rubric R1-R9 violations)
- [TAG] problem -> proposed fix
### Minor (cosmetic, comments, formatting)
- ...
### Intentionally unchanged
- [TAG] flag X kept because <historical reason>
### Docs impact
- wiki/<Nation>.md: <tables/sections to update>; WORKSHOP_DESCRIPTION_GUIDELINES.md: <row/BBCode>; README.md: <only if tags/files change>
```

Apply only what the user approves.

### Phase 3: Apply in Place via `-EditNames`
Edit groups in place using `build.ps1 -EditNames`:
```powershell
powershell -File .\build.ps1 -EditNames <TAG> -Group <GROUP> [-Remove "A; B"] [-Rename "Old=New"] [-Add "C; D" [-Section "Header"]] [-Set "Idx=NewName"] [-Selector "<Name>"] [-AddType "<type>"] [-RemoveType "<type>"] [-CanUse "<trigger>"]
```
- Supports metadata edits (`-Selector`, `-AddType`, `-RemoveType`, `-CanUse`) and multi-group updates (`-Group G1,G2`).
- Preserves indentation, numbering, and line endings automatically.
- Drops section headers that removals leave empty.
- Automatically reports duplicate names or invalid indices.
- Never edit the namelist file by hand unless adding a completely new group block or plain variant.

### Phase 4: Verification & Audit Plan Refresh
1. `powershell -File .\build.ps1 -ValidateOnly`
2. `powershell -File .\build.ps1 -Test`
3. `powershell -File .\build.ps1 -DiffNames <TAG>`: compact overview of name additions, removals, and moves.
4. `powershell -File .\build.ps1 -AuditPlan <TAG>`: automatically refreshes the markdown change table between markers in the plan. Fill the remaining TODO sections in the plan.

### Phase 5: Docs Delta
1. `powershell -File .\build.ps1 -SyncWiki <TAG>`: automatically updates wiki table rows (selectors, types, fallbacks) and reports stale/missing tags and prose mentions.
2. Edit prose lines in `wiki/<Nation>.md`, `README.md`, and `WORKSHOP_DESCRIPTION_GUIDELINES.md` (no emojis, concise BBCode).

### Phase 6: Code Reviewer Subagent
Dispatch an independent reviewer following `.claude/agents/inex-code-reviewer.md` (role `"Code Reviewer"`, model `"flash"`):
- Strict reading economy: reads `-DiffNames <TAG>`, `-Audit <TAG> -NamesOnly`, and `git diff` for docs. Never opens the namelist file.
- Verifies named individuals, diacritics, and native forms.
- Confirms the audit plan matches the actual diff.

### Phase 7: Push & Confirm
Run `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit <TAG> division namelists"` only after user confirmation.

---

## 4. Command Reference

```powershell
powershell -File .\build.ps1 -Audit ALL               # triage table, most flags first
powershell -File .\build.ps1 -Audit <KEY>             # per-group scorecard for one file
powershell -File .\build.ps1 -Audit <KEY> -NamesOnly  # compact name list (one line per group)
powershell -File .\build.ps1 -Audit <KEY> -Group <G> -NamesOnly -Sections  # inspect one group with section comments
powershell -File .\build.ps1 -EditNames <KEY> -Group <G> -Add "Name" -Section "Header" # edit group in place
powershell -File .\build.ps1 -DiffNames <KEY>         # name-level diff vs HEAD with moves
powershell -File .\build.ps1 -AuditPlan <KEY>         # create plan skeleton or refresh change table
powershell -File .\build.ps1 -SyncWiki <KEY>          # sync wiki table rows and report prose mentions
powershell -File .\build.ps1 -InspectVanilla <TAG>    # vanilla groups + scripted references
powershell -File .\build.ps1 -ValidateOnly            # syntax & engine invariants
powershell -File .\build.ps1 -Test                    # full Pester suite
powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Update <TAG> wiki after namelist audit"
```
