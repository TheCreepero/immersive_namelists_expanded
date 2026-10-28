---
name: hoi4-inex-namelist-authoring
description: >-
  Use when planning a new nation or an expansion of national division namelists in Hearts of Iron IV
  for the Immersive Namelists Expanded (INEX) mod: policy questions, historical Order of Battle (OOB) research
  through subagents, group design, and writing the self-contained plan file with every name. Ends with a
  hand-off; a READY plan is carried out with hoi4-inex-namelist-implement.
---

# Hearts of Iron IV Namelist Authoring Runbook (planning)

Researching, scoping and writing division namelists for *Immersive Namelists Expanded* (INEX), up to a plan file that anyone can carry out.

The project rules are in `AGENTS.md` and, in long form, `docs/inex-agent-guide.md` (the guide); they are not repeated here: guide §2 files and tags, §3 language standards, §4 docs and workshop sync, §5 `build.ps1` commands, §6 engine invariants. This runbook adds the workflow and the design guidance.

> To modernize an **existing** nation's file, use the lighter `hoi4-inex-namelist-audit` skill.
> A plan whose `Status:` is `READY` or `IN PROGRESS` is past this skill: use `hoi4-inex-namelist-implement` and do not repeat any phase below.

## The contract
This skill produces one file, `docs/plans/YYYY-MM-DD-<country>-namelist.md`, and stops. The plan is carried out by the `inex-implementer` subagent, a cheap model in a fresh context, so it must be complete with nothing else: no dossier, no conversation, no research, no naming decisions.

- **Every name is written here.** The plan's `## Edit batch` holds the whole namelist as `build.ps1` operations. The implementer applies it with one command and never types a name.
- **Every decision is final.** No "to be settled during authoring", no "merge if thin": decide, and write what was decided.
- **Every docs text is verbatim.** README row, workshop row and block, wiki page, Home row, Sidebar line.
- **No namelist or docs file is touched in this skill.** Only the plan, `scratch/` and entries in `docs/tooling-backlog.md` are written.

## Working rules
- **One nation per session**, and one live plan per nation: when `docs/plans/` holds a plan for the nation whose `Status:` is not `DONE`, ship it first. `-Check` skips the change-table refresh while two are live.
- **Tooling problems are worked around and get one entry in `docs/tooling-backlog.md`; `build.ps1`, tests and skill text are not edited during planning.** A workaround the implementer must run (a one-off script, an extra command) is written into the plan's steps with its expected output.
- For an existing file, do not read it whole. Inspect with `-Audit <TAG> -NamesOnly` (add `-Group <A>,<B> -Sections -Keys` for one group).
- A plan applies to one file key: `-EditNames <KEY> -Batch` and `-Audit <KEY>` take the part of the file name between `zz_INEX_` and `_names_divisions` (`GER`, `GER_SS`, `GER_ADDITIONAL`). For a nation split over several files, put a new suite's groups in one file, or write one plan per file.
- Subagents get context, not file access: paste what they must judge into the prompt.
- Read the dossier by section: `Grep -n '^## '` for the headings, then `Read` the section for the group family you are writing.

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
Phase 1  Research                                inex-historical-researcher, dossier in scratch/
Phase 2  Design and write the plan               template, group suite, edit batch, docs payload
Phase 3  Gate                                    proofread or self-check; -DryRun; Status: READY
Phase 4  Hand-off                                report and STOP
```

### Phase 0: Policy questions and vanilla inspection
1. Ask the user every naming-policy question **before** research, so the dossier is scoped once: verified names only or plausible extrapolation, which ideology suites, which lists get a plain/named pair.
2. `powershell -File .\build.ps1 -InspectVanilla <TAG>` lists the vanilla groups, fallbacks, entry counts and scripted `division_names_group` references; `-Group <GROUP>` excerpts one group. Note vanilla's grammar errors and which tags you will override. A group that reuses a vanilla tag is merged into the vanilla group (guide §6): vanilla's entries stay in the game unless the INEX group writes another name under the same number. For each tag you override, read its vanilla entries and decide which of them the INEX group rewrites.
3. Copy `docs/plans/TEMPLATE-namelist.md` to `docs/plans/YYYY-MM-DD-<country>-namelist.md` and fill Context, Decisions and Vanilla findings. `Status:` stays `PLANNING`.

### Phase 1: Research
Dispatch `inex-historical-researcher` (`.claude/agents/inex-historical-researcher.md`; the brief sets its model, tools and call budget). Give it the country, the TAG, the Phase 0 findings, the user's policy answers and, when the nation already has a file, the `-Audit <TAG> -NamesOnly` lines (it cannot open files). It writes verified facts and candidate pools with sources to `scratch/<tag>_dossier.md`, one `##` section per directive, and returns only the path and a summary of at most 200 words. Do not research broadly in the main context.

When the summary shows thin or `UNVERIFIED` areas that the design depends on, dispatch a second, narrower run (it writes `scratch/<tag>_dossier2.md`; say so in the prompt) with the relevant facts pasted in. A resumed subagent reloads its whole transcript, so dispatch a fresh one. Ask the user only for decisions research cannot settle (for example whether to keep a thin ideology list).

### Phase 2: Design and write the plan
Research results in hand, settle everything and write it down. The dossier is raw input; what the implementer needs goes into the plan.

1. **Group suite**: decide the final tags, selectors, `division_types`, `can_use`, links and fallbacks (§3). Merge thin lists now. Fill the "Group suite" table. Check which group each kind of template will take on its own with `powershell -File .\build.ps1 -PickTable <TAG>` (`-PickTypes '<a; b>'` for a mixed template; guide §5); a new group competes with vanilla's merged groups. Grep every new honorific across `common/units/names_divisions/zz_INEX_<TAG>*.txt` before the batch is final: `-Audit` lists the identities the nation's files already share, not the ones a batch would add.
2. **Edit batch**: under `## Edit batch`, write fenced blocks whose opening line is `` ```json batch ``, in file order. Operations are the `-EditNames` batch format (guide §5):
   - New nation: the first block is `{ "newFile": true, "header": "..." }`. An existing file needs no such block; a full re-author of one starts with `{ "newFile": true, "replace": true, "header": "..." }` and adds every group again (tags it adds back keep players' templates). `{ "header": "..." }` alone replaces an existing file's header.
   - One block per group. A new group is `{ "addGroup": true, "group": ..., "selector": ..., "addType": ..., "fallback": ..., "canUse": ..., "link": ..., "comment": ..., "add": [...] }`; put its names in the same operation's `"add"`. `"add"` items are `"<key>=<name>"`, and `"# Header"` items start a comment-headed section.
   - A plain variant is an `addGroup` (or, on an existing group, `"clearOrdered": true`) with no names; its named variant follows with `"link": "<plain tag>"` (§3). `"link"` also works on an existing group (it replaces the link or a dead commented one) and takes several groups (`"INF_01; GAR_01"`), each existing when its operation runs. `"countries"` adds tags to `for_countries` for a shared group (guide §2).
   - A section banner goes in the first group's `"comment"` (`"# ===== Cavalry =====\n\nOverrides vanilla ..."`).
   - Write the names with their final diacritics and case. Nothing in the batch is a placeholder.
3. **Research record, Author confirmation, Kept on judgment**: sources and call counts; every extrapolated or unverified entry in the batch, per group; the audit flags you expect to remain (thin specialist lists) with the reason. The `-DryRun` of Phase 3 prints them: the `AUDIT SUMMARY` and `Flags:` lines of the batch's result. For the expected outputs of the docs steps (`-SyncWiki` counts, rows added), rehearse outside the repository: export HEAD into a scratchpad folder (`git archive HEAD | tar -x -C <folder>`), apply the batch there with `-EditNames <KEY> -Batch <plan>`, replay the docs payload and run `-SyncWiki`. The repository's namelist and docs files stay untouched.
4. **Docs payload**: the verbatim text a script cannot derive, each with the line it goes after: the workshop cross-reference row, the workshop block (two bullets, 2-3 italic examples, at most 450 characters, no emojis; `WORKSHOP_DESCRIPTION_GUIDELINES.md`, Structure item 3) and the whole wiki page, with a group table whose rows match the suite. The `README.md` row, the `wiki/Home.md` row and the `wiki/_Sidebar.md` line are written by `-SyncWiki <TAG> -Country "<Name>"` in the plan's steps; `<Name>` is the README nation name and, with hyphens for spaces, the wiki page name.
5. **Implementation steps**: adjust the template's steps to this nation. Each step is one action with its exact command and the output to expect. The last step is the ship step: write its commit message.

### Phase 3: Gate
1. **Proofread** the names before hand-off, so the implementer never has to judge one. When the batch adds 25 or more authored names in a language other than English, or the user asks, dispatch `inex-proofreader` (`.claude/agents/inex-proofreader.md`) with the names per group pasted from the batch, the language they are written in, and the "Author confirmation" list. It answers with problems only or `No issues found`. Apply what it found to the batch and record the findings and what you did with each under "Review". Do not dispatch it a second time for a data-only fix. Otherwise run the self-check and write "Self-check" with its result under "Review":
   - every name is in the dossier's verified facts or on the "Author confirmation" list;
   - every extrapolated name is named as such in the plan.
2. Go through the checklist in §5.
3. Set `Status: READY`, then run `powershell -File .\build.ps1 -EditNames <TAG> -Batch <plan path> -DryRun`. It applies the batch in memory and writes nothing. It must end with `Dry run OK` and print no `[WARN] Plan:` line. Fix the batch and repeat until it does. Check that the group and name totals match the "Group suite" table and that its `Flags:` line matches "Kept on judgment".

### Phase 4: Hand-off (stop here)
Report to the user and end the turn:
- the plan path, the group and name counts, the `Dry run OK` line;
- how many entries are on the "Author confirmation" list, and anything else worth a look before it is built;
- how to continue: `/hoi4-inex-namelist-implement <plan path>`, here or in a new session. Either way the work runs in the implementer's fresh context, so continuing here costs no more.

Do not start implementing in the same turn, and do not offer to. If the user then says to continue here, invoke `hoi4-inex-namelist-implement`.

## 3. Scoping and modular design

Fit the suite to the nation's real military organization and to what a player can build. There is no fixed number of groups: author as many as the nation's depth supports.

**Common archetypes**: frontline divisions and regiments (`<TAG>_INF_01`, `<TAG>_REG_01`); territorial defense, home guard and garrisons (`<TAG>_KL_01`, `<TAG>_GAR_02`); armor, motorized and mechanized, with armored cars and trains (`<TAG>_ARM_02`, `<TAG>_MOT_02`); cavalry (`<TAG>_CAV_01`); marines, coastal fortresses, mountain and airborne troops (`<TAG>_MAR_02`, `<TAG>_MNT_02`, `<TAG>_PAR_02`); elite, guard and volunteer formations (`<TAG>_LEG_01`, `<TAG>_GUA_01`).

**Grouping**
- Split formations into separate lists when history or template choice warrants it (peacetime cavalry regiments apart from partisan squadrons; field infantry apart from territorial defense).
- Combine `division_types` tokens where units share a lineage, so players can assign the list to more templates (motorized and mechanized with armor).
- Selectors are plural, at most 28 characters, unique in the file and without a demonym (`"Red Guards"`, not `"Finnish Red Guard"`).

**Ideology-gated formations**
Where history or an alternate path gives a nation political wings (Waffen-SS, Blackshirts, Red Guards, royal or imperial guards, republican defense corps), give each ideology its own groups, gated with `can_use = { has_government = <ideology> }`. Never mix opposing traditions in one list, never gate by focus, decision, idea or flag, and do not cap the suite size (guide §2 and §6). `-Audit` flags a political group or entry that every government may use.

**Groups shared with other nations**
Check the nation's `ROADMAP.md` entry and the INEX files of its neighbours for joint formations. A group goes to several tags only under guide §2 (Shared Groups); otherwise give the nation its own mirrored group. A shared group that another file owns is not authored again here: the nation's wiki page and Workshop block mention it.

**Plain and named variants (infantry, motorized, mechanized, armor)**
When these lists get nicknames or identity names (`12. Divisioona 'Kollaa'`), keep an un-nicknamed variant beside them so players can choose plain numbering:
- The **plain variant keeps the vanilla tag** (`<TAG>_INF_01`, or whatever vanilla uses) with the plain selector (`"Infantry Divisions"`) and a plain `fallback_name`. Define it in INEX so vanilla's errors are fixed and the pairing is visible; templates already on that tag keep plain names.
- **What the plain variant's `ordered` block holds** follows from the merge rule (guide §6): vanilla's entries stay in the game. Where vanilla's entries only repeat the fallback in a 1..N run and read the same as the INEX fallback, the plain variant has no `ordered` block; where their text differs (another format), it writes those numbers again with its own text. Where vanilla's keys are historical numbers with gaps (`GER_Inf_01`: 1-36, 44, 45, 46, 50), those entries stay in the game whether or not the plain variant repeats them. A vanilla nickname stays in the plain group unless it writes a plain name under that number; the named variant gets the nickname as well.
- The **named variant gets a new tag**: the next category number vanilla does not use (check `-InspectVanilla`), e.g. `FIN_INF_05`, with the selector `"<Plain Selector> (Named)"` and the same `division_types` and `fallback_name`. In the batch it is an `addGroup` with `"link": "<plain tag>"`.
- **Shared numbering**: the named variant links to its plain counterpart with `link_numbering_with`. In a mobile family, link every plain and named mobile group to one anchor (e.g. `<TAG>_MOT_01`).
- Exception: if vanilla already nicknames those divisions (USA's *1st Infantry Division "Big Red One"*), one named group is enough.
- `-Audit` shows the fallback-only group as `Variant: plain (un-nicknamed) counterpart of <TAG>` and exempts it from `PLACEHOLDER_ENTRIES` and `LOW_DEPTH`. It pairs the two through the link; without the link the pairing is missed.

## 4. What the batch produces

`common/units/names_divisions/zz_INEX_<TAG>_names_divisions.txt`, UTF-8 without BOM. Each `addGroup` operation writes a group in this layout:

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

Tokens, fallback formats, keys and links: guide §6, which cites the records of the knowledge register (`hoi4-modding-knowledge` skill, topic `namelists`). `-DryRun` catches unknown groups, invalid tokens, reused tags and bad fallbacks; `-Check` validates the file once the implementer has applied the batch. Write the plan with the Write and Edit tools (UTF-8 without BOM); never with PowerShell 5.1 `Set-Content` or Git Bash `sed -i`, which corrupt diacritics.

## 5. Checklist before `Status: READY`

- [ ] **Language**: names in the right grammatical case (usually nominative: Estonian *Jalaväediviis*, not vanilla's *diviisi*), native diacritics and capitalization, the nation's own ordinal format (`%d.`, Roman `%s.`).
- [ ] **Grounding**: names rest on real institutions, peacetime cadres, mobilization plans or traditions. Each is verified or on the "Author confirmation" list.
- [ ] **Depth**: main line lists carry 20-30+ authored entries, `fallback_name` reads naturally at any number past them, and extrapolated units follow the nation's own naming tradition.
- [ ] **Authenticity**: nicknames, honorifics and regions come from the nation's geography, history and military culture, with no anachronisms or fantasy tropes.
- [ ] **Gating**: ideology groups use `has_government`; no focus, decision, idea or flag locks; no opposing traditions in one list.
- [ ] **Plain/named**: every nicknamed infantry, motorized, mechanized or armor list has its plain variant sharing numbering.
- [ ] **Vanilla carried over**: for every reused vanilla tag, each vanilla name or historical number is in the batch or named in "Decisions" as dropped on purpose.
- [ ] **Self-contained**: no open decision, no reference to the dossier or this conversation as something the implementer must read, every docs text verbatim, every step with its command and expected output.
- [ ] **`-DryRun` is clean**: `Dry run OK`, no `[WARN] Plan:` line, totals match the "Group suite" table.
