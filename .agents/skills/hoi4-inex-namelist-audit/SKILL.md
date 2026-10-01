---
name: hoi4-inex-namelist-audit
description: >-
  Use when auditing, modernizing, or bringing an existing Immersive Namelists Expanded (INEX) national
  namelist file up to current standards - a quality pass on an already-implemented nation (placeholder
  entries, broken translations, singular or duplicate selectors, shallow lists, stale docs). Covers triage,
  fact-checking research, the audit report and the self-contained plan file; a READY plan is carried out with
  hoi4-inex-namelist-implement. For brand-new nations use hoi4-inex-namelist-authoring instead.
---

# INEX Namelist Audit & Modernization (planning)

> **Mirror**: `.claude/skills/hoi4-inex-namelist-audit/SKILL.md` (Claude Code). Apply rule changes to both (`GEMINI.md` §8).

Plans how one existing `INEX_<KEY>_names_divisions.txt` file is brought up to current project standards without breaking players' saved templates.

Entries that meet the standard stay untouched; only reported gaps are fixed. Rules: `GEMINI.md` §2–6. The script does the mechanical checking; keep your context for judgment.

`<KEY>` is the part of the filename between `INEX_` and `_names_divisions` (e.g. `LIT`, `GER_SS`, `GER_ADDITIONAL`). Audit **one file per run**.

> A plan whose `Status:` is `READY` or `IN PROGRESS` is past this skill: use `hoi4-inex-namelist-implement` and do not repeat any phase below.

## The contract
This skill produces one file, `docs/superpowers/plans/YYYY-MM-DD-<country>-audit.md`, and stops. The plan must be complete enough that a fresh session on a cheaper model can carry it out with nothing else: no conversation, no research, no naming decisions.

- **Every edit is written here.** The plan's `## Edit batch` holds all changes as `build.ps1` operations. The implementer applies it with one command and never types a name.
- **Every decision is final** and recorded, including what the user dropped at the checkpoint.
- **Every docs text is verbatim**: the prose lines to replace and what replaces them.
- **No namelist or docs file is touched in this skill.** Only the plan and `scratch/` are written.

---

## Token Discipline
- **One nation per session.**
- **Tooling problems are worked around and recorded in the plan's Rationale as a tooling note; `build.ps1`, tests and skill text are not edited during an audit.** Fix them in a fresh session, where the same edits cost a fraction.
- Start from `powershell -File .\build.ps1 -Audit <TAG>` (~40 lines: group table, findings, summary).
- Read groups with `-Audit <TAG> -Group <A>,<B> -NamesOnly` (one line per group; `<TAG>_` prefix optional, e.g. `-Group INF_01,CAV_01`); add `-Sections` to show comment headers inline and `-Keys` to prefix each entry with its ordered key (what a `"remove"` or `"set"` by index needs). Consecutive identical names collapse to `name (xN)`, so a vanilla-stub group stays one short line, and a gated group shows its `can_use`. Drop `-NamesOnly` only when you need block syntax (`division_types`, `fallback_name`, `link_numbering_with`). Never open the namelist file.
- Read only the groups a finding names and the content-risk pools. Pure regional or numbered lists get one `-NamesOnly` skim for display names; nobody reads them after you.
- Docs: grep only for prose (README and workshop rows, the `[b]<Country>[/b]` block, wiki overview or scope notes) to write the "Docs payload"; never print a whole wiki page. `-SyncWiki <TAG>` rewrites wiki display names and fallbacks during implementation.
- Plan: `-AuditPlan <TAG>` writes the skeleton and the change table; never read an older plan as a template or hand-edit the table.
- Never read a plan file whole: `## Edit batch` and `## Per-group changes` come last and can run to tens of KB. `Grep -n '^## '` for the headings, then `Read` with a `limit` that stops before them. (Older plans keep the table in the middle; read around it.)
- Run `-InspectVanilla <TAG>` only for a fallback or vanilla overlap finding.
- Subagents get context, not file access: paste the `-NamesOnly` lines of every group they must judge into their prompt (the audit researcher has web tools only). Refer to `.claude/agents/inex-audit-researcher.md`.
- The researcher verifies; you decide. Identify what you can yourself, draft candidates yourself, and send only what needs a source.

---

## 1. Non-Negotiables for Audits

1. **Preserve every existing root group tag.** Players' division templates and other groups' `link_numbering_with` reference tags by name. Never rename or delete a tag. Fix it in place. Add a new tag only for a genuinely new category, or for the named variant of a plain/named pair (R10). Removing a tag (`"removeGroup"`) happens only on the user's explicit instruction, and the report says that saved templates on it lose their names.
2. **Keep what is already good.** Modernize; do not rewrite authored, historically sound names for the sake of it.
3. **Keep file-level conventions:** `for_countries`, the German three-file split, and any group referenced by vanilla scripts (see `-InspectVanilla`).
4. **Nothing reaches the plan's batch without approval.** The audit report is a checkpoint; the batch holds only the items the user approves.
5. **Wiki push is outward-facing.** The plan lists it as the last step, to run only after the user confirms.
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
| R10 | Nicknamed infantry, motorized, mechanized, and armor lists keep a plain (un-nicknamed) variant: the existing/vanilla tag becomes the fallback-only plain group, and the nicknames move to a new `"<Selector> (Named)"` tag that shares its numbering through `link_numbering_with = { <plain tag> }` (authoring skill §3). Not needed if vanilla already nicknames those divisions (e.g. USA). | (manual; `-Audit` shows `Variant: plain` and exempts it from R4/R5; without the link it cannot pair the two) |
| R11 | Ideology-gated groups use `has_government` and never lock behind national focuses (`has_completed_focus`), decisions, or event flags. Political names do not sit in a group every government may use. | `FOCUS_LOCKED`, `UNGATED_POLITICAL`, `POLITICAL_ENTRY` |

More informational lints:
- `DUPLICATE_NAME`: the same literal name twice in one group; `-Audit` lists the names. Remove one by index (`-NamesOnly -Keys` shows the keys).
- `STALE_COMMENT`: a comment inside a group that mentions fictional units, "start here", post-WW2 or placeholders; `-Audit` quotes it. Rename the header with `"renameSection"` or rewrite the list.
- `POLITICAL_ENTRY`: single entries with militia, party, guard or resistance vocabulary in a group that is otherwise neutral and ungated; `-Audit` lists them. Move them to a gated group, or keep them with a reason (a historic unit name such as a War of Independence partisan battalion).
- `NAME_LONG`: an entry over 60 characters; only outliers, since long honorific names are common and intended.
- `IDENTITY_REPEAT` (file level): quoted identities (e.g. `'Tali'`) reused across groups under different division numbers.
- `UNGATED_POLITICAL`: a militia, party, guard or resistance style group still on `can_use = { always = yes }`; gate it by government (R11).
- `ORDINAL_MISMATCH`: a fixed ordinal after `%d` at a key where it reads wrong (French `%dère` at key 5 renders "5ère"; English `%dth` at key 1 or `%dst` at key 2). Fix the entry with `"set"`.
- `VANILLA_COPY` (single-file `-Audit` with HOI4 installed): at least 80% of the entries are identical to the vanilla group of the same tag, so the stubs can be dropped with `"removeAll"` or `"clearOrdered"` without changing any name. The `Vanilla:` line shows the count.

Lint flags are **heuristics**. Treat them as leads, confirm by reading the group, and override with a stated reason where history justifies it.

---

## 3. Workflow

```
Phase 0  Triage & Audit Plan       -Audit, -AuditPlan
Phase 1  Targeted Research         inex-audit-researcher (budgeted fact-checker)
Phase 2  Audit Report Checkpoint   STOP for user approval
Phase 3  Write the plan            edit batch, docs payload, steps
Phase 4  Gate                      proofread or self-check; -DryRun; Status: READY
Phase 5  Hand-off                  report and STOP
```

### Phase 0: Triage & Audit Plan
1. If the user has not named a file, run `powershell -File .\build.ps1 -Audit ALL` and suggest the top candidates.
2. `powershell -File .\build.ps1 -Audit <KEY>`: per-group metrics and rubric flags.
3. `powershell -File .\build.ps1 -AuditPlan <KEY>`: creates the plan skeleton (`docs/superpowers/plans/YYYY-MM-DD-<country>-audit.md`) with `Status: PLANNING`, the initial report, TODO sections, the standard implementation steps and an empty change table.
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

Before presenting it, write it into the plan so nothing lives only in the conversation: findings and the reasoning behind each fix to `Rationale`, flags kept on purpose to `Kept on judgment`, the verified list to `Verified formations & commanders`, unverified entries to `Author confirmation`, dispatches to `Research`. After the user answers, record the decisions under `User decisions`.

### Phase 3: Write the plan
Only what the user approved goes in.

1. **Edit batch**: under `## Edit batch`, write fenced blocks whose opening line is `` ```json batch ``, one per group, in the order they must run. The format is in §4. Take keys for `"remove"` and `"set"` from `-NamesOnly -Keys`.
2. **Docs payload**: for each prose line that changes in `wiki/<Nation>.md`, `README.md` and `WORKSHOP_DESCRIPTION_GUIDELINES.md`, the current text and its replacement, verbatim (no emojis, concise BBCode). Wiki table rows are left to `-SyncWiki`. Write "No docs change beyond -SyncWiki" when that is the case.
3. **Implementation steps**: adjust the generated steps to this audit. Each step is one action with its exact command and the output to expect.
4. **Kept on judgment**: every flag `-Check` will still show after the batch, with its reason, so the implementer can tell an expected flag from a new one.

### Phase 4: Gate
1. **Proofread** before hand-off, so the implementer never has to judge a name. When the batch adds 25 or more authored names in a language other than English, or the user asks, dispatch `inex-code-reviewer` (`.claude/agents/inex-code-reviewer.md`; the brief sets its model and budget) with the added and changed names per group pasted from the batch (numbered fallback patterns can be left out), the language they are written in, and the "Author confirmation" list. It has web tools only, and answers with problems only (`GROUP: entry -> issue -> suggested fix -> source`) or `No issues found`. Apply what it found to the batch and record the findings and what you did with each under `Review`. Do not dispatch it a second time for a data-only fix. Otherwise run the self-check and write "Self-check" with its result under `Review`:
   - every added name is in "Verified formations & commanders" or "Author confirmation";
   - every extrapolated name (a plausible formation the army never fielded) is named as such in the Rationale.
2. Set `Status: READY`, then run `powershell -File .\build.ps1 -EditNames <TAG> -Batch <plan path> -DryRun`. It applies the batch in memory and writes nothing. It must end with `Dry run OK` and print no `[WARN] Plan:` line (a planner `<!-- TODO:` section left unfilled, or the status). Fix the plan and repeat until it does.

### Phase 5: Hand-off (stop here)
Report to the user and end the turn:
- the plan path, how many groups the batch touches, the `Dry run OK` line;
- the "Author confirmation" count and anything else worth a look before it is applied;
- the three ways to continue: say "continue" in this session, `/clear` and continue, or open a new session (any model), each with the same prompt: `/hoi4-inex-namelist-implement <plan path>`.

Do not start applying in the same turn, and do not offer to. If the user then says to continue here, invoke `hoi4-inex-namelist-implement` and work from the plan file as a fresh session would.

---

## 4. Edit batch format

Each fenced block is one operation object or an array of them; the keys are the `-EditNames` parameter names. List values are arrays, so names with apostrophes, quotes or semicolons need no escaping beyond JSON's own.
```json
[
  { "group": "INF_02", "rename": ["Old name=New name"], "remove": ["7", "Some Name"], "add": ["12ème Division d'Infanterie 'de Fer'"], "section": "1940" },
  { "group": "CAV_01", "removeAll": true, "add": ["# Light cavalry", "1=1ère Division Légère de Cavalerie", "2=2ème Division Légère de Cavalerie"] },
  { "addGroup": true, "group": "INF_03", "selector": "Infantry Divisions (Named)", "addType": "infantry", "fallback": "%dème Division d'Infanterie",
    "link": "INF_01", "after": "INF_01", "comment": "Named variant; shares numbering with FRA_INF_01.", "add": ["1=1ère Division d'Infanterie 'Nord'"] }
]
```
- Keys: `"group"` plus any of `"add"`, `"remove"`, `"rename"`, `"set"`, `"after"`, `"section"`, `"renameSection"`, `"selector"`, `"fallback"`, `"addType"`, `"removeType"`, `"canUse"`, `"removeAll"`, `"clearOrdered"`, `"removeGroup"`, `"comment"`, `"addGroup"`, `"link"`.
- Operations run in order across all blocks, all or nothing: a failed operation leaves the file untouched and names the operation.
- `"addGroup"` creates a new group (named variant, new category) in the file template layout, at the end of the file or after `"after": "<group>"`. It needs a selector, at least one division type and a fallback, refuses a tag used anywhere in the mod, and carries its names in its own `"add"`.
- Rewrite a whole list: `"removeAll": true` with `"add": ["# Section A", "1=...", "2=...", "# Section B", "40=..."]` (a `# Header` item starts a comment-headed section). Use it to replace vanilla stubs with authored names; get the keys of what stays from `-NamesOnly -Keys`.
- `"clearOrdered"` turns a group into the fallback-only plain variant (R10). `"comment"` replaces the comment above a group (`\n` splits lines; add a banner plus a blank line for a section banner).
- The file header (R1) is not a batch key: give `powershell -File .\build.ps1 -SetHeader <TAG> -HeaderText "<text>"` its own implementation step.
- `"removeGroup"` is refused while another group links to it; see non-negotiable 1 before using it.
- Indentation, numbering and line endings are preserved; section headers that removals leave empty are dropped; duplicate names and invalid indices are reported.

---

## 5. Command Reference

```powershell
powershell -File .\build.ps1 -Audit ALL               # triage table, most flags first
powershell -File .\build.ps1 -Audit <KEY>             # per-group scorecard for one file
powershell -File .\build.ps1 -Audit <KEY> -NamesOnly  # compact name list (one line per group)
powershell -File .\build.ps1 -Audit <KEY> -Group <G> -NamesOnly -Sections  # inspect one group with section comments
powershell -File .\build.ps1 -Audit <KEY> -Group <G> -NamesOnly -Keys  # same, with ordered keys (duplicate runs collapse to name (xN))
powershell -File .\build.ps1 -AuditPlan <KEY>         # create plan skeleton or refresh change table
powershell -File .\build.ps1 -InspectVanilla <TAG>    # vanilla groups + scripted references
powershell -File .\build.ps1 -EditNames <KEY> -Batch <plan path> -DryRun  # hand-off gate: apply the plan's batch in memory, write nothing
```
