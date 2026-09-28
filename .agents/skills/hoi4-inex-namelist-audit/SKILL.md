---
name: hoi4-inex-namelist-audit
description: >-
  Use when auditing, modernizing, or bringing an existing Immersive Namelists Expanded (INEX) national
  namelist file up to current standards - a quality pass on an already-implemented nation (placeholder
  entries, broken translations, singular or duplicate selectors, shallow lists, stale docs). For brand-new
  nations use hoi4-inex-namelist-authoring instead.
---

# INEX Namelist Audit & Modernization

Brings one existing `INEX_<KEY>_names_divisions.txt` file up to the standard of the most recent INEX namelists (PER, MEX, EST, LAT) without breaking players' saved templates.

This skill is deliberately lean. It **does not repeat** the authoring rules. It relies on:
- `hoi4-inex-namelist-authoring` §5 (historical & linguistic verification checklist) and §6 (file syntax & engine invariants).
- `CLAUDE.md` / `GEMINI.md` §3 (documentation sync) and §6 (engine invariants).

`<KEY>` is the part of the filename between `INEX_` and `_names_divisions` (e.g. `LIT`, `GER_SS`, `GER_ADDITIONAL`). Audit **one file per run**.

---

## 1. Non-Negotiables for Audits

1. **Preserve every existing root group tag.** Players' division templates and other groups' `link_numbering_with` reference tags by name. Never rename or delete a tag. Fix it in place. Add a new tag only for a genuinely new category.
2. **Keep what is already good.** Modernize; do not rewrite authored, historically sound names for the sake of it.
3. **Keep file-level conventions:** `for_countries`, the German three-file split, and any group referenced by vanilla scripts (see `-InspectVanilla`).
4. **No edits before approval.** The audit report (Phase 2) is a checkpoint; apply only the items the user approves.
5. **Wiki push is outward-facing.** Run `wiki/push-wiki.ps1` only after the user confirms.

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

Lint flags are **heuristics**. Treat them as leads, confirm by reading the group, and override with a stated reason where history justifies it.

---

## 3. Workflow

```
Phase 0  Triage (inline)          -Audit, -InspectVanilla, docs skim
Phase 1  Research subagent        only the flagged items
Phase 2  Audit report             STOP for user approval
Phase 3  Apply + sync docs        validate, test, re-audit
Phase 4  Code Reviewer subagent   diff-scoped verification
```

### Phase 0: Triage (inline, cheap)
1. If the user has not named a file, run `powershell -File .\build.ps1 -Audit ALL` and suggest the top candidates.
2. `powershell -File .\build.ps1 -Audit <KEY>`: per-group metrics and rubric flags.
3. `powershell -File .\build.ps1 -InspectVanilla <TAG>`: vanilla overlap and scripted `division_names_group` references (skip if HOI4 is not installed; note it in the report).
4. `git log --oneline -- common/units/names_divisions/INEX_<KEY>_names_divisions.txt` for history.
5. Read the file **group by group** (large files exceed 1,000 lines; do not dump them whole). Note linguistic problems the lint cannot see: wrong case, missing diacritics, machine-translated words, copy-paste selectors.
6. Skim `wiki/<Nation>.md`, the README row, and the `WORKSHOP_DESCRIPTION_GUIDELINES.md` row and BBCode entry for drift.

### Phase 1: Targeted "Historical Research" Subagent
Dispatch only if Phase 0 found items needing native-language or historical input (Claude Code: Agent tool, general-purpose/research type; Antigravity: a `"research"` subagent with workspace `"inherit"`). Send a **specific list**, not a country-wide OOB sweep.

```markdown
You are a Historical Research subagent for the HOI4 mod "Immersive Namelists Expanded" (INEX),
auditing an EXISTING namelist: common/units/names_divisions/INEX_<KEY>_names_divisions.txt (<Country>, <TAG>).
INEX favors historical plausibility: anchor names in real 1918-1945 institutions, then extrapolate plausibly.

Research only these items:
<numbered list, e.g.
1. LIT_MAR_01 fallback "%s. Juras Peizazas Divizija" looks machine-translated. Give the correct Lithuanian nominative form.
2. LIT_INF_01 has 0 authored entries. Propose 25 names grounded in interwar Lithuanian infantry divisions/regiments (garrison towns, honorific names).
3. Confirm diacritics/spelling of: "Fiame Verdi" ...>

For each item return: group tag, the problem, the corrected or proposed text (with diacritics), numbering
format (%d/%s), and a one-line source or rationale. Flag anything you are unsure of rather than guessing.
Do not edit files.
```

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

The user may approve all items, a subset, or ask for changes. Apply only what they approve.

### Phase 3: Apply & Synchronize (primary agent)
1. Edit the namelist file per the approved list. Keep UTF-8 without BOM and the file's existing brace style.
2. Update `wiki/<Nation>.md` namelist tables and context; update the `WORKSHOP_DESCRIPTION_GUIDELINES.md` cross-reference row and the nation's BBCode bullets (no emojis, concise; mind the ~17,000-char limit); update `README.md` only if tags or files changed.
3. Verify:
   ```powershell
   powershell -File .\build.ps1 -ValidateOnly
   powershell -File .\build.ps1 -Test
   powershell -File .\build.ps1 -Audit <KEY>   # show the flag reduction vs. Phase 0
   ```

### Phase 4: "Code Reviewer" Subagent (diff-scoped)
Dispatch an independent reviewer (Claude Code: Agent tool; Antigravity: `"self"` subagent, workspace `"inherit"`):

```markdown
You are a Code Reviewer subagent for the HOI4 mod "Immersive Namelists Expanded" (INEX).
Review ONLY the uncommitted audit changes for INEX_<KEY>_names_divisions.txt and its docs (git diff).

Approved change list:
<paste the approved items from the audit report>

Verify:
1. Tag preservation: every root group tag in `git show HEAD:<file>` still exists in the working copy.
2. Every approved item was applied; nothing unapproved was changed.
3. Engine invariants per hoi4-inex-namelist-authoring §6 (tokens, unique ordered keys, %d/%s fallbacks, no self-links, UTF-8 no BOM).
4. Linguistic correctness of every changed name line (nominative case, diacritics, no machine-translation artifacts).
5. Docs match the new file: wiki/<Nation>.md, WORKSHOP_DESCRIPTION_GUIDELINES.md (no emojis), README.md if applicable.
6. Run `powershell -File .\build.ps1 -ValidateOnly` and `powershell -File .\build.ps1 -Test`.

Report: Status APPROVED or CHANGES_REQUESTED, then issues as Critical / Important / Minor with file:line.
```

Address any `CHANGES_REQUESTED` findings, re-run Phase 3 verification, then summarize for the user: what changed, the lint flags before and after, and anything left intentionally unchanged. Offer the wiki push and a commit; do neither without confirmation.

---

## 4. Command Reference

```powershell
powershell -File .\build.ps1 -Audit ALL               # triage table, most flags first
powershell -File .\build.ps1 -Audit <KEY>             # per-group scorecard for one file
powershell -File .\build.ps1 -InspectVanilla <TAG>    # vanilla groups + scripted references
powershell -File .\build.ps1 -ValidateOnly            # syntax & engine invariants
powershell -File .\build.ps1 -Test                    # full Pester suite
powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Update <TAG> wiki after namelist audit"   # after user confirms
```
