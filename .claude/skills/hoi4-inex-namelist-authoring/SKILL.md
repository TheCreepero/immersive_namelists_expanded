---
name: hoi4-inex-namelist-authoring
description: >-
  Use when adding a new nation or expanding existing national division namelists in Hearts of Iron IV
  for the Immersive Namelists Expanded (INEX) mod, including historical Order of Battle (OOB) research,
  multi-agent subagent delegation, file authoring, documentation, and verification.
---

# Hearts of Iron IV Namelist Authoring Runbook

Researching, scoping, authoring and validating division namelists for *Immersive Namelists Expanded* (INEX).

The project rules are in `CLAUDE.md` (Antigravity: `GEMINI.md`) and are not repeated here: §2 files and tags, §3 language standards, §4 docs and workshop sync, §5 `build.ps1` commands, §6 engine invariants. This runbook adds the workflow and the design guidance.

> To modernize an **existing** nation's file, use the lighter `hoi4-inex-namelist-audit` skill.

## Working rules
- **One nation per session.** `/clear` before starting another task: everything left in context is paid for again on every turn.
- **Tooling problems are worked around and noted in the plan; `build.ps1`, tests and skill text are not edited during authoring.** Fix them in a fresh session.
- Do not read a whole namelist file. Inspect with `-Audit <TAG> -NamesOnly` (add `-Group <A>,<B> -Sections -Keys` for one group) and change it through `build.ps1`.
- Subagents get context, not file access: paste what they must judge into the prompt.
- Never read a plan or dossier whole: `Grep -n '^## '` for the headings, then `Read` the sections you need with a `limit`.

## 1. Philosophy: plausibility over rigid accuracy

INEX aims for **historical plausibility**, not a list frozen at one peacetime date: a list that stops at the four divisions a country fielded in 1936 runs out as soon as a player mobilizes. Extrapolate the way that army would have named its expanded forces, drawing on:
- peacetime cadre battalions meant to mobilize into regiments (*üksikpataljonid*, *erilliset pataljoonat*);
- territorial defense leagues and volunteer militias (*Kaitseliit*, *Hemvärnet*, *Suojeluskunta*, *KOP*, *Home Guard*);
- regional and provincial naming, military heroes and cultural motifs (Estonian armored cars *Suur Tõll* and *Tasuja*, Swedish Caroleans, Finnish *Ryhmä* groups);
- doctrinal and alternate-history paths (royal regiments, volunteer corps, resistance movements).

A name is either verified or a plausible extension of a verified pattern. Never invent filler to reach a count.

## 2. Workflow

```
Phase 0  Policy questions, vanilla inspection   ask the user; -InspectVanilla <TAG>
Phase 1  Research                                inex-historical-researcher, one dossier
Phase 2  Author, sync docs, verify               primary agent; -Check <TAG>
Phase 3  Proofread (conditional)                 inex-code-reviewer for 25+ added non-English names, else a self-check
```

### Phase 0: Policy questions and vanilla inspection
1. Ask the user every naming-policy question **before** research, so the dossier is scoped once: verified names only or plausible extrapolation, which ideology suites, which lists get a plain/named pair.
2. `powershell -File .\build.ps1 -InspectVanilla <TAG>` lists the vanilla groups, fallbacks, entry counts and scripted `division_names_group` references; `-Group <GROUP>` excerpts one group. Note vanilla's grammar errors and which tags you will override (`CLAUDE.md` §6).
3. Record scope and decisions in `docs/superpowers/plans/YYYY-MM-DD-<country>-namelist.md`.

### Phase 1: Research
Dispatch `inex-historical-researcher` (`.claude/agents/inex-historical-researcher.md`; the brief sets its model, tools and call budget). Give it the country, the TAG, the Phase 0 findings, the user's policy answers and, when the nation already has a file, the `-Audit <TAG> -NamesOnly` lines (it cannot open files). It writes verified facts and candidate pools with sources to `scratch/<tag>_dossier.md`, one `##` section per directive, and returns only the path and a summary of at most 200 words. You write the entries and any extrapolation. Do not research broadly in the main context.

**Clear point.** Research fills the context and authoring needs only its results. Once the dossier exists, make sure the plan holds the Phase 0 decisions, tell the user it is safe to `/clear` (or to pick the clear-context option if the client offers one), and continue with "author the <TAG> namelist". In the fresh session invoke this skill, read the plan, and read the dossier by section as each group is authored. If the user prefers to continue in the same session, do so; nothing is lost either way.

For a follow-up question, dispatch a fresh subagent with the relevant facts pasted in. A resumed subagent reloads its whole transcript.

### Phase 2: Author, sync docs, verify
0. After a `/clear`, the plan and `scratch/<tag>_dossier.md` are the inputs; do not repeat research.
1. Create `common/units/names_divisions/INEX_<TAG>_names_divisions.txt` from the template in §4 with the Write tool. After that, change it only through `build.ps1`: `-EditNames <TAG> -Batch scratch\<tag>_edits.json` for more than two edits, `-EditNames <TAG> -AddGroup ...` for a new group, `-SetHeader` for the header (`CLAUDE.md` §5 has the parameters and the batch keys).
2. Sync the docs listed in `CLAUDE.md` §4: workshop guide (cross-reference row and the `[b]<Country>[/b]` block with 2-3 bullets and italic examples), `README.md` table, `wiki/<Nation>.md`, `wiki/Home.md`, `wiki/_Sidebar.md`. `-SyncWiki <TAG>` keeps the wiki's group rows in step with the file.
3. `powershell -File .\build.ps1 -Check <TAG>`: validation, the Pester suite, audit flags, `Docs:` warnings and diff counts in about ten lines. Fix what it reports. Lint flags are leads; keep one only with a reason written in the plan.
4. Go through the checklist in §5.
5. Push the wiki with `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document <TAG> division namelists"` once the user has confirmed; it is outward-facing.

### Phase 3: Proofread (conditional)
There is no general review gate: lints cover the mechanical checks and `-Check` covers docs. What a script cannot judge is whether a new name is misspelled, in the wrong case, misattributed or invented.

**Dispatch the proofreader** (`.claude/agents/inex-code-reviewer.md`; the brief sets its model and budget) only when `-DiffNames <TAG>` shows 25 or more added authored names in a language other than English, or when the user asks for a review. Paste into the prompt:
- the added and changed names per group (the `+` parts of the `-DiffNames` lines; numbered fallback patterns can be left out),
- the language they are written in,
- the plan's list of entries held for author confirmation.

It has web tools only and no file access. It answers with problems only (`GROUP: entry -> issue -> suggested fix -> source`) or the single line `No issues found`. Fix what it found with `-EditNames`, run `-Check` again, and record the findings and what you did with each in the plan. Do not dispatch it a second time for a data-only fix.

**Otherwise run the self-check** on the `-DiffNames <TAG>` output and note the result in the plan:
- every added name is in the dossier's verified facts or on the plan's author-confirmation list;
- every extrapolated name (a plausible formation the army never fielded) is named as such in the plan;
- no flag or `Docs:` warning from `-Check` is left unexplained.

## 3. Scoping and modular design

Fit the suite to the nation's real military organization and to what a player can build. There is no fixed number of groups: author as many as the nation's depth supports.

**Common archetypes**: frontline divisions and regiments (`<TAG>_INF_01`, `<TAG>_REG_01`); territorial defense, home guard and garrisons (`<TAG>_KL_01`, `<TAG>_GAR_02`); armor, motorized and mechanized, with armored cars and trains (`<TAG>_ARM_02`, `<TAG>_MOT_02`); cavalry (`<TAG>_CAV_01`); marines, coastal fortresses, mountain and airborne troops (`<TAG>_MAR_02`, `<TAG>_MNT_02`, `<TAG>_PAR_02`); elite, guard and volunteer formations (`<TAG>_LEG_01`, `<TAG>_GUA_01`).

**Grouping**
- Split formations into separate lists when history or template choice warrants it (peacetime cavalry regiments apart from partisan squadrons; field infantry apart from territorial defense).
- Combine `division_types` tokens where units share a lineage, so players can assign the list to more templates (motorized and mechanized with armor).
- Selectors are plural, at most 28 characters, unique in the file and without a demonym (`"Red Guards"`, not `"Finnish Red Guard"`).

**Ideology-gated formations**
Where history or an alternate path gives a nation political wings (Waffen-SS, Blackshirts, Red Guards, royal or imperial guards, republican defense corps), give each ideology its own groups, gated with `can_use = { has_government = <ideology> }`. Never mix opposing traditions in one list, never gate by focus, decision, idea or flag, and do not cap the suite size (`CLAUDE.md` §2 and §6). `-Audit` flags a political group or entry that every government may use.

**Plain and named variants (infantry, motorized, mechanized, armor)**
When these lists get nicknames or identity names (`12. Divisioona 'Kollaa'`), keep an un-nicknamed variant beside them so players can choose plain numbering:
- The **plain variant keeps the vanilla tag** (`<TAG>_INF_01`, or whatever vanilla uses) with the plain selector (`"Infantry Divisions"`), a plain `fallback_name` and **no `ordered` block**. Define it in INEX so vanilla's errors are fixed and the pairing is visible; templates already on that tag keep plain names.
- The **named variant gets a new tag**: the next category number vanilla does not use (check `-InspectVanilla`), e.g. `FIN_INF_05`, with the selector `"<Plain Selector> (Named)"` and the same `division_types` and `fallback_name`. Create it with `-AddGroup ... -Link <plain tag>`.
- **Shared numbering**: the named variant links to its plain counterpart with `link_numbering_with`. In a mobile family, link every plain and named mobile group to one anchor (e.g. `<TAG>_MOT_01`).
- Exception: if vanilla already nicknames those divisions (USA's *1st Infantry Division "Big Red One"*), one named group is enough.
- `-Audit` shows the fallback-only group as `Variant: plain (un-nicknamed) counterpart of <TAG>` and exempts it from `PLACEHOLDER_ENTRIES` and `LOW_DEPTH`. It pairs the two through the link; without the link the pairing is missed.
- To turn an existing list into the plain variant: `-EditNames <TAG> -Group <GROUP> -ClearOrdered -Comment "<override note>"`, then add the nicknames to the named group.

## 4. File template

`common/units/names_divisions/INEX_<TAG>_names_divisions.txt`, UTF-8 without BOM. `-AddGroup` writes groups in this layout.

```txt
# Division template historical names system for <Country> (<TAG>).
# Immersive Namelists Expanded (INEX)

<TAG>_<CATEGORY>_<NUM> = 
{
	name = "<English UI Selector Name>"

	for_countries = { <TAG> }

	# always = yes for universal groups; has_government = <ideology> for ideological wings.
	can_use = { always = yes }

	division_types = { "<unit_token_1>" "<unit_token_2>" }

	# Only to a DIFFERENT group, when shared numbering is wanted. Omit otherwise.
	link_numbering_with = { <OTHER_GROUP_TAG> }

	fallback_name = "%d. <Fallback Name>"

	# One number per entry; gaps are fine. A fallback-only (plain) group has no ordered block.
	ordered =
	{
		1 = { "<Historical Name 1>" }
		2 = { "<Historical Name 2>" }
	}
}
```

- Tokens, fallback formats, keys and links: `CLAUDE.md` §6; `-ValidateOnly` enforces them.
- **Editing on Windows**: edit namelists and docs with `build.ps1`, the Edit/Write tools, or `[IO.File]::WriteAllText($path, $text, (New-Object Text.UTF8Encoding $false))`. Never use Windows PowerShell 5.1 `Set-Content`/`Get-Content` (they read ANSI and write a BOM, which corrupts diacritics) or Git Bash `sed -i` on UTF-8 files. Do not normalize line endings; git's `core.autocrlf` handles them on commit.

## 5. Checklist before completion

- [ ] **Language**: names in the right grammatical case (usually nominative: Estonian *Jalaväediviis*, not vanilla's *diviisi*), native diacritics and capitalization, the nation's own ordinal format (`%d.`, Roman `%s.`).
- [ ] **Grounding**: names rest on real institutions, peacetime cadres, mobilization plans or traditions.
- [ ] **Depth**: main line lists carry 20-30+ authored entries, `fallback_name` reads naturally at any number past them, and extrapolated units follow the nation's own naming tradition.
- [ ] **Authenticity**: nicknames, honorifics and regions come from the nation's geography, history and military culture, with no anachronisms or fantasy tropes.
- [ ] **Gating**: ideology groups use `has_government`; no focus, decision, idea or flag locks; no opposing traditions in one list.
- [ ] **Plain/named**: every nicknamed infantry, motorized, mechanized or armor list has its plain variant sharing numbering.
- [ ] **Docs**: workshop row and block, README row, wiki page, Home and Sidebar are updated (`CLAUDE.md` §4).
- [ ] **`-Check <TAG>` passes**, and every flag it still shows has a reason in the plan.
