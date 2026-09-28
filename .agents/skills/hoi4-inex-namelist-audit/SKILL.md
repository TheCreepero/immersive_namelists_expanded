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

1. **Preserve every existing root group tag.** Players' division templates and other groups' `link_numbering_with` reference tags by name. Never rename or delete a tag. Fix it in place. Add a new tag only for a genuinely new category, or for the named variant of a plain/named pair (R10).
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
| R10 | Nicknamed infantry, motorized, mechanized, and armor lists keep a plain (un-nicknamed) variant: the existing/vanilla tag becomes the fallback-only plain group, and the nicknames move to a new `"<Selector> (Named)"` tag that shares its numbering (authoring skill §4). Not needed if vanilla already nicknames those divisions (e.g. USA). | (manual; `-Audit` shows `Variant: plain` and exempts it from R4/R5) |

Two more informational lints: `NAME_LONG` (an entry over 60 characters; only outliers, since long honorific names are common and intended) and the file-level `IDENTITY_REPEAT`, which lists quoted identities (e.g. `'Tali'`) reused across groups under different division numbers.

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
5. Read the file **group by group** (large files exceed 1,000 lines; do not dump them whole; filter out placeholder lines with Grep). Note linguistic problems the lint cannot see: wrong case, missing diacritics, machine-translated words, copy-paste selectors.
6. Skim `wiki/<Nation>.md`, the README row, and the `WORKSHOP_DESCRIPTION_GUIDELINES.md` row and BBCode entry for drift.
7. **Ask policy questions before research.** If a fix depends on a naming choice only the user can make (e.g. "verified names only, or plausible extrapolation?" for commander or honour names; whether to override a scripted vanilla group), ask it now, in one batch. Research is then scoped to the answer and does not need a second round.

### Phase 1: Targeted "Historical Research" Subagent
Dispatch only if Phase 0 found items needing native-language or historical input (Claude Code: Agent tool, general-purpose/research type; Antigravity: a `"research"` subagent with workspace `"inherit"`). Send a **specific list**, not a country-wide OOB sweep.

The researcher returns **verified facts, not finished namelist entries.** The primary agent composes the entries and does any extrapolation. Put every existing name the audit questions (e.g. all commander-named groups) into the same dispatch, so no separate verification round is needed.

```markdown
You are a Historical Research subagent for the HOI4 mod "Immersive Namelists Expanded" (INEX),
auditing an EXISTING namelist: common/units/names_divisions/INEX_<KEY>_names_divisions.txt (<Country>, <TAG>).
Return verified facts only; do not propose namelist entries or extrapolate. Do not edit files.

Items:
<numbered list, e.g.
1. LIT_MAR_01 fallback "%s. Juras Peizazas Divizija" looks machine-translated. Correct Lithuanian nominative term for a marine division?
2. LIT_INF_01: for each interwar Lithuanian infantry division 1-3, its garrison town and any honorific name.
3. Verify each of these commander-named groups existed (commander, rank, unit, year): <names>.>

Budget: WebSearch first; WebFetch only a specific page, with a targeted prompt; about 20 tool calls
at most. Stop once every item has a status.

Output: one compact table per item, no prose, at most about 1,500 words:
item | fact (native spelling, diacritics) | VERIFIED (URL) / CONTRADICTED (URL) / UNVERIFIED
Mark UNVERIFIED rather than guessing.
```

For a follow-up question, dispatch a **fresh** subagent with the relevant facts pasted in. Resuming the earlier subagent reloads its whole transcript, so resume only when that context is really needed.

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
1. Edit the namelist file per the approved list. Keep UTF-8 without BOM and the file's existing brace style (see the tool notes in hoi4-inex-namelist-authoring §6).
2. Update `wiki/<Nation>.md` namelist tables and context; update the `WORKSHOP_DESCRIPTION_GUIDELINES.md` cross-reference row and the nation's BBCode bullets (no emojis, concise; mind the ~17,000-char limit); update `README.md` only if tags or files changed.
3. Verify:
   ```powershell
   powershell -File .\build.ps1 -ValidateOnly
   powershell -File .\build.ps1 -Test
   powershell -File .\build.ps1 -Audit <KEY> -Compare HEAD   # flag reduction vs. Phase 0, plus the review list
   ```

### Phase 4: "Code Reviewer" Subagent (scoped)
Dispatch an independent reviewer (Claude Code: Agent tool; Antigravity: `"self"` subagent, workspace `"inherit"`). The build tooling is authoritative for mechanical checks, so the reviewer spends its effort on what tooling cannot judge.

```markdown
You are a Code Reviewer subagent for the HOI4 mod "Immersive Namelists Expanded" (INEX).
Review the uncommitted audit changes for INEX_<KEY>_names_divisions.txt and its docs. Do not edit files.

Approved change list:
<paste the approved items from the audit report>

1. Run `powershell -File .\build.ps1 -ValidateOnly`, `-Test` and `-Audit <KEY> -Compare HEAD`.
   Treat their output as authoritative for syntax, engine invariants, tags, links, selectors and
   encoding. Do not re-check those by hand or read the raw namelist diff.
2. From the -Compare output: no removed tags; every approved item applied; nothing unapproved changed.
   Nicknamed infantry/motorized/mechanized/armor lists keep a plain, fallback-only variant sharing
   numbering with the "(Named)" tag (R10). Check that any identities listed as shared across groups are intended.
3. Linguistics of the "Added or changed names" list: nominative case, diacritics, no machine
   translation. Web spot-check the 5-10 names you are least sure of; do not verify every name.
4. Docs match the file: `git diff -- wiki/<Nation>.md WORKSHOP_DESCRIPTION_GUIDELINES.md README.md`
   (no emojis in the workshop text).

Report: Status APPROVED or CHANGES_REQUESTED, then issues as Critical / Important / Minor with file:line. Be concise.
```

Address any `CHANGES_REQUESTED` findings and re-run Phase 3 verification. A data-only fix (names, docs) needs only the automated checks. Re-dispatch a reviewer only when `build.ps1`, tests or rule text changed, and scope it to that diff. Then summarize for the user: what changed, the lint flags before and after, and anything left intentionally unchanged. Offer the wiki push and a commit; do neither without confirmation.

---

## 4. Command Reference

```powershell
powershell -File .\build.ps1 -Audit ALL               # triage table, most flags first
powershell -File .\build.ps1 -Audit <KEY>             # per-group scorecard for one file
powershell -File .\build.ps1 -Audit <KEY> -Compare HEAD   # + removed/added tags, field changes, changed names only
powershell -File .\build.ps1 -InspectVanilla <TAG>    # vanilla groups (true entry counts, malformed entries) + scripted references
powershell -File .\build.ps1 -ValidateOnly            # syntax & engine invariants
powershell -File .\build.ps1 -Test                    # full Pester suite
powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Update <TAG> wiki after namelist audit"   # after user confirms
```
