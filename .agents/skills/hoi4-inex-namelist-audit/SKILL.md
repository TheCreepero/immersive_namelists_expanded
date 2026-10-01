---
name: hoi4-inex-namelist-audit
description: >-
  Use when auditing, modernizing, or bringing an existing Immersive Namelists Expanded (INEX) national
  namelist file up to current standards - a quality pass on an already-implemented nation (placeholder
  entries, broken translations, singular or duplicate selectors, shallow lists, stale docs). For brand-new
  nations use hoi4-inex-namelist-authoring instead.
---

# INEX Namelist Audit & Modernization

> **Mirror**: `.claude/skills/hoi4-inex-namelist-audit/SKILL.md` (Claude Code). Apply rule changes to both (`GEMINI.md` §8).

Brings one existing `INEX_<KEY>_names_divisions.txt` file up to current project standards without breaking players' saved templates.

Entries that meet the standard stay untouched; only reported gaps are fixed. Rules: `GEMINI.md` §2–6. The script does the mechanical checking; keep your context for judgment.

`<KEY>` is the part of the filename between `INEX_` and `_names_divisions` (e.g. `LIT`, `GER_SS`, `GER_ADDITIONAL`). Audit **one file per run**.

---

## Token Discipline
- **One nation per session.** `/clear` before starting another task: everything left in context is paid for again on every turn.
- **Tooling problems are worked around and recorded in the plan's Rationale as a tooling note; `build.ps1`, tests and skill text are not edited during an audit.** Fix them in a fresh session, where the same edits cost a fraction.
- Start from `powershell -File .\build.ps1 -Audit <TAG>` (~40 lines: group table, findings, summary).
- Read groups with `-Audit <TAG> -Group <A>,<B> -NamesOnly` (one line per group; `<TAG>_` prefix optional, e.g. `-Group INF_01,CAV_01`); add `-Sections` to show comment headers inline and `-Keys` to prefix each entry with its ordered key (what `-EditNames -Remove`/`-Set` by index needs). Consecutive identical names collapse to `name (xN)`, so a vanilla-stub group stays one short line, and a gated group shows its `can_use`. Drop `-NamesOnly` only when you need block syntax (`division_types`, `fallback_name`, `link_numbering_with`). Never open the namelist file, not even to edit it or to add a group: use `-EditNames` (with `-Batch` and `-AddGroup`) and `-SetHeader`.
- Read only the groups a finding names and the content-risk pools. Pure regional or numbered lists get one `-NamesOnly` skim for display names; nobody reads them after you.
- Docs: `-SyncWiki <TAG>` rewrites wiki display names and fallbacks. Grep only for prose (README and workshop rows, the `[b]<Country>[/b]` block, wiki overview or scope notes) and edit only those lines; never print a whole wiki page.
- Plan: `-AuditPlan <TAG>` writes the skeleton and the change table; never read an older plan as a template or hand-edit the table. Do not read the table back: `-DiffNames <TAG>` shows the same changes, and both collapse a repeated name to `name (xN)`.
- Never read a plan file whole: `## Per-group changes` is generated, last in new plans, and can run to tens of KB. `Grep -n '^## '` for the headings, then `Read` with a `limit` that stops before it. (Older plans keep the table in the middle; read around it.)
- Run `-InspectVanilla <TAG>` only for a fallback or vanilla overlap finding.
- Subagents get context, not file access: paste the `-NamesOnly` lines of every group they must judge into their prompt (the audit researcher has web tools only). Refer to `.claude/agents/inex-audit-researcher.md`.
- The researcher verifies; you decide. Identify what you can yourself, draft candidates yourself, and send only what needs a source.

---

## 1. Non-Negotiables for Audits

1. **Preserve every existing root group tag.** Players' division templates and other groups' `link_numbering_with` reference tags by name. Never rename or delete a tag. Fix it in place. Add a new tag only for a genuinely new category, or for the named variant of a plain/named pair (R10). Removing a tag (`-EditNames -RemoveGroup`) happens only on the user's explicit instruction, and the report says that saved templates on it lose their names.
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
| R8 | No dead commented self-links, TODO notes, "barely any info" or leftover "fictional divisions start here" comments. | `DEAD_SELF_LINK_COMMENT`, `TODO_COMMENT`, `STALE_COMMENT` |
| R9 | Wiki page, README row, and workshop cross-reference/BBCode describe the file as it now is. The nation's `[b]<Country>[/b]` block has 2-3 bullets and at least two `[i]` examples; the description has no emojis and stays under 17,000 characters. | `Docs:` warnings in `-Audit` and `-Check` for the workshop block; prose is manual |
| R10 | Nicknamed infantry, motorized, mechanized, and armor lists keep a plain (un-nicknamed) variant: the existing/vanilla tag becomes the fallback-only plain group, and the nicknames move to a new `"<Selector> (Named)"` tag that shares its numbering through `link_numbering_with = { <plain tag> }` (authoring skill §4). Not needed if vanilla already nicknames those divisions (e.g. USA). | (manual; `-Audit` shows `Variant: plain` and exempts it from R4/R5; without the link it cannot pair the two) |
| R11 | Ideology-gated groups use `has_government` and never lock behind national focuses (`has_completed_focus`), decisions, or event flags. Political names do not sit in a group every government may use. | `FOCUS_LOCKED`, `UNGATED_POLITICAL`, `POLITICAL_ENTRY` |

More informational lints:
- `DUPLICATE_NAME`: the same literal name twice in one group; `-Audit` lists the names. Remove one by index (`-NamesOnly -Keys` shows the keys).
- `STALE_COMMENT`: a comment inside a group that mentions fictional units, "start here", post-WW2 or placeholders; `-Audit` quotes it. Rename the header with `-RenameSection` or rewrite the list.
- `POLITICAL_ENTRY`: single entries with militia, party, guard or resistance vocabulary in a group that is otherwise neutral and ungated; `-Audit` lists them. Move them to a gated group, or keep them with a reason (a historic unit name such as a War of Independence partisan battalion).
- `NAME_LONG`: an entry over 60 characters; only outliers, since long honorific names are common and intended.
- `IDENTITY_REPEAT` (file level): quoted identities (e.g. `'Tali'`) reused across groups under different division numbers.
- `UNGATED_POLITICAL`: a militia, party, guard or resistance style group still on `can_use = { always = yes }`; gate it by government (R11).
- `ORDINAL_MISMATCH`: a fixed ordinal after `%d` at a key where it reads wrong (French `%dère` at key 5 renders "5ère"; English `%dth` at key 1 or `%dst` at key 2). Fix the entry with `-Set`.
- `VANILLA_COPY` (single-file `-Audit` with HOI4 installed): at least 80% of the entries are identical to the vanilla group of the same tag, so the stubs can be dropped with `-RemoveAll` or `-ClearOrdered` without changing any name. The `Vanilla:` line shows the count.

Lint flags are **heuristics**. Treat them as leads, confirm by reading the group, and override with a stated reason where history justifies it.

---

## 3. Workflow

```
Phase 0  Triage & Audit Plan       -Audit, -AuditPlan
Phase 1  Targeted Research         inex-audit-researcher (budgeted fact-checker)
Phase 2  Audit Report Checkpoint   STOP for user approval
Phase 3  Apply in Place            -EditNames, -Batch, -AddGroup (no full-file rewrites)
Phase 4  Verify                    -Check
Phase 5  Docs Delta                -SyncWiki, README & workshop rows
Phase 6  Proofread (conditional)   inex-code-reviewer for 25+ added non-English names, else a self-check
Phase 7  Push & Confirm            wiki/push-wiki.ps1 (after confirmation)
```

### Phase 0: Triage & Audit Plan
1. If the user has not named a file, run `powershell -File .\build.ps1 -Audit ALL` and suggest the top candidates.
2. `powershell -File .\build.ps1 -Audit <KEY>`: per-group metrics and rubric flags.
3. `powershell -File .\build.ps1 -AuditPlan <KEY>`: creates the plan skeleton (`docs/superpowers/plans/YYYY-MM-DD-<country>-audit.md`) with the initial report, TODO sections, and empty change table.
4. Only for a fallback or vanilla overlap finding: `powershell -File .\build.ps1 -InspectVanilla <TAG>` (vanilla groups and scripted `division_names_group` references; skip if HOI4 is not installed and note it in the report).
5. Read flagged groups with `powershell -File .\build.ps1 -Audit <KEY> -Group <GROUP> -NamesOnly -Sections`. Never dump the full file.
6. Check for linguistic problems the lint cannot see: wrong case, missing diacritics, machine-translated words, copy-paste selectors.
7. Ask policy questions (e.g. naming conventions, plain vs named variants) before research.

### Phase 1: Targeted "Historical Research" Subagent
Dispatch a budgeted fact-checker subagent using `.claude/agents/inex-audit-researcher.md` (role `"Audit Researcher"`; the brief sets its model and budget):
- Web-only tools, maximum 25 web calls.
- Send a **specific list** of questionable entries, fallbacks, or garrison titles needing native-language verification.
- Paste the `-NamesOnly` lines of the relevant groups into the prompt.
- Keep the ask narrow: 4-5 topics at most, highest value first, with the exact entries to check rather than whole topic areas. A wide ask spends the 25 calls on skimming and returns many UNVERIFIED.
- Ask for numbered formation lists with official names and ordinals. Nicknames and epithets are scarce and usually only on secondary sources (forums, fan wikis); weigh them accordingly. Send a second, smaller run only for what stayed UNVERIFIED.
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

**Make the checkpoint a safe place to `/clear`.** Research and triage are done and fill the context; applying edits needs only the decisions. Before presenting the report, put it where a fresh session can find it:
- Write the report into the plan: findings and the reasoning behind each fix to `Rationale`, flags kept on purpose to `Kept on judgment`, the verified list to `Verified formations & commanders`, unverified entries to `Author confirmation`, dispatches to `Research`.
- Draft every proposed edit as one batch file, `scratch/<tag>_edits.json` (Phase 3 format), and name it in the report.
- After the user answers, record the decisions under `User decisions`. If they dropped items, edit the batch to match.
- Then tell the user it is safe to `/clear` (or to pick the clear-context option if the client offers one) and continue with "apply the <TAG> audit". The decisions and the batch are on disk; nothing else needs to carry over.

**Resuming after `/clear`:** invoke this skill, read the plan up to `## Per-group changes` (Token Discipline), inspect only the groups the batch touches with `-Audit <TAG> -Group <A>,<B> -NamesOnly -Keys`, then go to Phase 3 and apply the batch.

### Phase 3: Apply in Place via `-EditNames`
Edit groups in place using `build.ps1 -EditNames`. **For more than two edits, write them all to one batch file and apply it in one call**; a failed operation leaves the file untouched and names the operation.
```powershell
powershell -File .\build.ps1 -EditNames <TAG> -Batch scratch\<tag>_edits.json
powershell -File .\build.ps1 -EditNames <TAG> -Group <GROUP> [-Remove "A; B"] [-RemoveAll] [-Rename "Old=New"] [-Add "C; D" [-Section "Header" | -After "<name>"]] [-Set "Idx=NewName"] [-RenameSection "Old=New"] [-Selector "<Name>"] [-Fallback "<pattern>"] [-AddType "<type>"] [-RemoveType "<type>"] [-CanUse "<trigger>"] [-ClearOrdered] [-Comment "<text>"] [-RemoveGroup]
powershell -File .\build.ps1 -EditNames <TAG> -AddGroup -Group <NEW> -Selector "<Name>" -AddType "<type>" -Fallback "<pattern>" [-CanUse "<trigger>"] [-Link <group>] [-Add "A; B"] [-Comment "<text>"] [-After <group>]
powershell -File .\build.ps1 -SetHeader <TAG> -HeaderText "<header text>"
```
The batch file is UTF-8 JSON (write it with the Write tool): an array of operations whose keys are the parameter names. List values are arrays, so names with apostrophes, quotes or semicolons need no escaping beyond JSON's own.
```json
[
  { "group": "INF_02", "rename": ["Old name=New name"], "remove": ["7", "Some Name"], "add": ["12ème Division d'Infanterie 'de Fer'"], "section": "1940" },
  { "group": "CAV_01", "removeAll": true, "add": ["# Light cavalry", "1=1ère Division Légère de Cavalerie", "2=2ème Division Légère de Cavalerie"] },
  { "addGroup": true, "group": "INF_03", "selector": "Infantry Divisions (Named)", "addType": "infantry", "fallback": "%dème Division d'Infanterie",
    "link": "INF_01", "after": "INF_01", "comment": "Named variant; shares numbering with FRA_INF_01.", "add": ["1=1ère Division d'Infanterie 'Nord'"] }
]
```
- Operations run in order, so a later one can edit a group an earlier one added. Output is one summary line per group; add `-Verbose` only when you need the resulting names.
- `-AddGroup` creates a new group (named variant, new category) in the file template layout, at the end of the file or after `-After <group>`. It needs a selector, at least one division type and a fallback, and refuses a tag used anywhere in the mod.
- Supports metadata edits (`-Selector`, `-Fallback`, `-AddType`, `-RemoveType`, `-CanUse`) and multi-group updates (`-Group G1,G2`).
- Rewrite a whole list in one call: `-RemoveAll -Add "# Section A; 1=...; 2=...; # Section B; 40=..."` (a `# Header` item starts a comment-headed section). Use it to replace vanilla stubs with authored names; get the keys of what stays from `-NamesOnly -Keys`.
- `-ClearOrdered` turns a group into the fallback-only plain variant (R10). `-Comment` replaces the comment above a group (`\n` splits lines; add a banner plus a blank line for a section banner). `-SetHeader` replaces the file header (R1) and keeps section banners.
- `-RemoveGroup` is refused while another group links to it; see non-negotiable 1 before using it.
- Preserves indentation, numbering, and line endings automatically.
- Drops section headers that removals leave empty.
- Automatically reports duplicate names or invalid indices.
- Never edit the namelist file by hand.

### Phase 4: Verification & Audit Plan Refresh
1. `powershell -File .\build.ps1 -Check <TAG>`: validation, the Pester suite, the audit summary with remaining flags and `Docs:` warnings, the plan's change-table refresh and the diff counts, in about ten lines. Errors, failed tests and warnings print in full; it exits 1 when validation or a test fails.
2. `powershell -File .\build.ps1 -DiffNames <TAG>` when you need the names behind the counts (for the self-check or the proofreader's prompt).
3. Fill the remaining TODO sections in the plan. Each flag `-Check` still shows is fixed or listed under "Kept on judgment".

### Phase 5: Docs Delta
1. `powershell -File .\build.ps1 -SyncWiki <TAG>`: automatically updates wiki table rows (selectors, types, fallbacks) and reports stale/missing tags, prose mentions of removed names, and prose that claims a numbering link the namelist does not have.
2. Edit prose lines in `wiki/<Nation>.md`, `README.md`, and `WORKSHOP_DESCRIPTION_GUIDELINES.md` (no emojis, concise BBCode).

### Phase 6: Proofread (conditional)
There is no general review gate: lints cover the mechanical checks and `-Check` covers plan and docs. What a script cannot judge is whether a new name is misspelled, in the wrong case, misattributed or invented.

**Dispatch the proofreader** (`.claude/agents/inex-code-reviewer.md`; the brief sets its model and budget) only when `-DiffNames <TAG>` shows 25 or more added authored names in a language other than English, or when the user asks for a review. Paste into the prompt:
- the added and changed names per group (the `+` parts of the `-DiffNames` lines; numbered fallback patterns can be left out),
- the language they are written in,
- the plan's "Author confirmation" list.

It has web tools only and no file access. It answers with problems only (`GROUP: entry -> issue -> suggested fix -> source`) or the single line `No issues found`. Fix what it found with `-EditNames`, run `-Check` again, and record the findings and what you did with each in the plan's Review section. Do not dispatch it a second time for a data-only fix.

**Otherwise run the self-check** on the `-DiffNames <TAG>` output and write "Self-check" with its result in the plan's Review section:
- every added name is in the plan's "Verified formations & commanders" or "Author confirmation" list;
- every extrapolated name (a plausible formation the army never fielded) is named as such in the Rationale;
- no flag or `Docs:` warning from `-Check` is left unexplained.

### Phase 7: Push & Confirm
Run `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit <TAG> division namelists"` only after user confirmation.

---

## 4. Command Reference

```powershell
powershell -File .\build.ps1 -Audit ALL               # triage table, most flags first
powershell -File .\build.ps1 -Audit <KEY>             # per-group scorecard for one file
powershell -File .\build.ps1 -Audit <KEY> -NamesOnly  # compact name list (one line per group)
powershell -File .\build.ps1 -Audit <KEY> -Group <G> -NamesOnly -Sections  # inspect one group with section comments
powershell -File .\build.ps1 -Audit <KEY> -Group <G> -NamesOnly -Keys  # same, with ordered keys (duplicate runs collapse to name (xN))
powershell -File .\build.ps1 -EditNames <KEY> -Group <G> -Add "Name" -Section "Header" # edit group in place
powershell -File .\build.ps1 -EditNames <KEY> -Group <G> -RemoveAll -Add "# Header; 1=A; 2=B" # rewrite a whole list
powershell -File .\build.ps1 -EditNames <KEY> -Group <G> -ClearOrdered -Comment "Plain variant" # fallback-only group
powershell -File .\build.ps1 -EditNames <KEY> -Batch scratch\<key>_edits.json  # many edits from one JSON file, all or nothing
powershell -File .\build.ps1 -EditNames <KEY> -AddGroup -Group <NEW> -Selector "<Name>" -AddType "<type>" -Fallback "<pattern>" # new group
powershell -File .\build.ps1 -SetHeader <KEY> -HeaderText "INEX - <Country> (<TAG>)"  # replace file header
powershell -File .\build.ps1 -Check <KEY>             # validate + tests + audit summary + plan refresh + diff counts
powershell -File .\build.ps1 -DiffNames <KEY>         # name-level diff vs HEAD with moves (repeats collapse to name (xN))
powershell -File .\build.ps1 -AuditPlan <KEY>         # create plan skeleton or refresh change table
powershell -File .\build.ps1 -SyncWiki <KEY>          # sync wiki table rows and report prose mentions
powershell -File .\build.ps1 -InspectVanilla <TAG>    # vanilla groups + scripted references
powershell -File .\build.ps1 -ValidateOnly            # syntax & engine invariants (part of -Check)
powershell -File .\build.ps1 -Test                    # full Pester suite (part of -Check)
powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Update <TAG> wiki after namelist audit"
```
