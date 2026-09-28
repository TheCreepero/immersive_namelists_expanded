---
name: hoi4-inex-namelist-authoring
description: >-
  Use when adding a new nation or expanding existing national division namelists in Hearts of Iron IV
  for the Immersive Namelists Expanded (INEX) mod, including historical Order of Battle (OOB) research,
  multi-agent subagent delegation, file authoring, documentation, and verification.
---

# Hearts of Iron IV Namelist Authoring Runbook

This skill provides step-by-step guidance for researching, scoping, authoring, and validating division namelists for *Immersive Namelists Expanded* (INEX) using a multi-agent workflow.

> To modernize an **existing** nation's namelist file rather than author a new one, use the lighter `hoi4-inex-namelist-audit` skill.

---

## 1. Guiding Philosophy: Historical Plausibility Over Rigid Accuracy

> [!IMPORTANT]
> The primary design philosophy of **Immersive Namelists Expanded** is **historical plausibility**, NOT strict historical accuracy.

### What Historical Plausibility Means in INEX:
- **Scalability for Gameplay**: Rigid historical accuracy artificially limits namelists only to what historically existed on a specific peacetime date (e.g., only 4 divisions for Estonia or only 1 armored division for Finland). When a player mobilizes, expands, or builds specialized forces (tanks, marines, paratroopers, motorized), rigid accuracy fails and runs out of names.
- **Authentic Extrapolation**: Namelists must plausibly extrapolate how that nation's military would designate expanded formations, drawing on:
  - Peacetime cadre battalions designed to mobilize into regiments (*üksikpataljonid*, *erilliset pataljoonat*).
  - Territorial defense leagues and volunteer militias (*Kaitseliit*, *Hemvärnet*, *Suojeluskunta*, *KOP*, *Home Guard*).
  - Authentic regional/provincial naming conventions, military heroes, or cultural motifs (e.g., Estonian armored units named after legendary armored cars like *Suur Tõll* and *Tasuja*, Swedish Carolean guards, Finnish *Ryhmä* and *Komennuskunta*).
  - Doctrinal and alternative-history trajectories (e.g., royal/monarchist regiments, volunteer corps, resistance movements).

---

## 2. Multi-Agent Authoring Workflow

To maintain high quality, prevent context exhaustion from broad historical research, and guarantee strict compliance with engine and linguistic invariants, agents must follow a three-phase multi-agent workflow:

```
[Phase 1: Research]       Dispatch "Historical Research" Subagent
                                  │
                                  ▼
[Phase 2: Authoring]      Primary Agent authors namelist, updates docs, runs test suite
                                  │
                                  ▼
[Phase 3: Verification]   Dispatch "Code Reviewer" Subagent
```

### Phase 1: Dispatching the "Historical Research" Subagent

The primary agent **must not** exhaust its main context window with extensive web searches, Wikipedia OOB exploration, or raw linguistic queries. Instead, dispatch a dedicated **"Historical Research"** subagent to conduct the historical and linguistic investigation.

- **Subagent Role**: `"Historical Research"` (or `"Historical Researcher"`)
- **Subagent Type**: `"research"` (or default agent with read and search capabilities)
- **Workspace**: `"inherit"`

#### Responsibilities of the "Historical Research" Subagent:
1. **Order of Battle (OOB) Investigation (1918–1945)**:
   - Identify peacetime standing units vs. mobilization cadres (e.g., cadre battalions designed to expand into full 3,000-man wartime regiments).
   - Research territorial defense leagues, home guards, and volunteer militias (*Kaitseliit*, *Hemvärnet*, *Suojeluskunta*, *KOP*, *Home Guard*).
   - Identify mobile, cavalry, armored car (*soomusautod*), and armored train (*soomusrongid*) traditions.
   - Investigate coastal artillery fortresses (*Merekindlused*, *Kustartilleri*), marine amphibious detachments (*Meredessant*), ski/mountain troops, and paratroopers.
   - Compile regional naming conventions, historical commanders, and national cultural/independence motifs.
2. **Linguistic & Grammatical Precision**:
   - Verify correct grammatical cases in the target language (nominative case rather than genitive/partitive, e.g., Estonian *Jalaväediviis* instead of vanilla's incorrect *diviisi*).
   - Preserve native diacritics (*ä, ö, õ, ü, š, ž, ł, ś, etc.*).
   - Determine standard ordinal numbering conventions (e.g., `%d.` with period or Roman `%s.`).
3. **Vanilla Inspection via Build Tool**:
   - Run `powershell -File .\build.ps1 -InspectVanilla <TAG>` to extract vanilla groups, fallbacks, and entry counts.
   - Scan focus trees and scripted effects for existing `division_names_group` references.

#### Sample Dispatch Prompt for "Historical Research" Subagent:
```markdown
You are a specialized Historical Research subagent for the Hearts of Iron IV mod "Immersive Namelists Expanded" (INEX).
Target Country: <Country Name> (<TAG>)

Your task is to conduct an in-depth Order of Battle (OOB), linguistic, and historical investigation for <Country Name> (<TAG>) and return a structured research brief.

Directives:
1. Investigate the 1918–1945 military structure, standing peacetime units, cadre battalions, territorial defense organizations (militias, home guards), armored/cavalry traditions, coastal fortresses, and specialized units.
2. Run `powershell -File .\build.ps1 -InspectVanilla <TAG>` to inspect existing vanilla namelists and scripted references in focus trees.
3. Verify target language grammar and orthography: ensure nominative case (avoid genitive/partitive bugs), verify native diacritics, and determine authentic numbering formats (%d. or %s.).
4. Formulate authentic extrapolation for wartime gameplay scalability (e.g., 20–30+ division names per major category).

Deliver a structured Research Brief containing:
- Recommended namelist groups with tags (<TAG>_<CATEGORY>_<NUM>) and concise UI selector names (e.g., "Infantry Divisions", not "<Country> Infantry Divisions").
- Valid line combat division tokens for `division_types = { ... }`.
- Ordered lists of historical names with verified diacritics and numbering formats.
- Fallback name patterns (`fallback_name = "%d. <Unit>"`).
- Brief historical summaries and 2–3 in-game unit examples for the workshop description.
```

---

### Phase 2: Implementation & Synchronization (Primary Agent)

Upon receiving the Research Brief from the "Historical Research" subagent, the primary agent:
1. **Authors the Namelist File**: Creates `common/units/names_divisions/INEX_<TAG>_names_divisions.txt` adhering to Section 6 syntax and engine invariants.
2. **Synchronizes Documentation**: Updates `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `README.md`, `wiki/<Nation>.md`, `wiki/Home.md`, and `wiki/_Sidebar.md` following Section 7.
3. **Executes Build & Validation Suite**: Runs `powershell -File .\build.ps1 -ValidateOnly` and `powershell -File .\build.ps1 -Test` to verify syntax and test invariants locally.

---

### Phase 3: Dispatching the "Code Reviewer" Subagent

After implementing the files and running local validation, the primary agent **must dispatch a dedicated "Code Reviewer" subagent** to independently audit and verify all changes before declaring the task complete.

- **Subagent Role**: `"Code Reviewer"`
- **Subagent Type**: `"self"` (or subagent equipped with read, git, and command execution tools)
- **Workspace**: `"inherit"`

#### Responsibilities of the "Code Reviewer" Subagent:
The "Code Reviewer" subagent must independently inspect the git diff and run verification to confirm:
1. **Engine Invariants & File Syntax**:
   - File path is strictly `common/units/names_divisions/INEX_<TAG>_names_divisions.txt`.
   - File is saved in UTF-8 without BOM; curly brackets `{}` are strictly balanced.
   - Group tags strictly follow `<TAG>_<CATEGORY>_<NUM>` and are globally unique across the mod.
   - `division_types = { ... }` contains only valid line combat subunit tokens (e.g., `"infantry"`, `"light_armor"`, `"marine"`; never `"armor"`, `"marines"`, or support tokens like `"military_police"`).
   - Keys in `ordered = { ... }` are unique integers; no duplicate keys; no empty `ordered = { }` blocks.
   - `fallback_name` includes a valid `%d` or `%s` format token.
   - `link_numbering_with` only links to external groups, never self-referential.
   - UI selector `name = "<Selector>"` is concise and omits redundant country names / demonym prefixes.
   - Nicknamed infantry, motorized, mechanized, and armor groups have a plain (un-nicknamed) variant on the vanilla tag that shares their numbering (Section 4), unless vanilla already nicknames them.
2. **Linguistic & Historical Authenticity**:
   - Grammar cases are correct (nominative, not genitive/partitive).
   - Diacritics are accurate and properly encoded.
   - Sufficient depth is provided for full wartime campaigns (20–30+ entries or robust fallbacks).
3. **Documentation & Workshop Sync**:
   - `WORKSHOP_DESCRIPTION_GUIDELINES.md`: Row added to Repository Cross-Reference table; country entry added to `[h1]Included nations:[/h1]` in standard BBCode format with 2–3 concise bullets and italicized examples (`[i]...[/i]`).
   - Strictly **no emojis** in Steam workshop descriptions; character limit respected.
   - `README.md`: Country added to Included Nations Summary table.
   - `wiki/<Nation>.md`: Detailed wiki documentation created; links added in `wiki/Home.md` and `wiki/_Sidebar.md`.
4. **Automated Test Validation**:
   - Runs `powershell -File .\build.ps1 -ValidateOnly` and confirms zero syntax/invariant errors.
   - Runs `powershell -File .\build.ps1 -Test` and confirms all Pester unit tests pass with zero failures.

#### Sample Dispatch Prompt for "Code Reviewer" Subagent:
```markdown
You are a specialized Code Reviewer subagent for the Hearts of Iron IV mod "Immersive Namelists Expanded" (INEX).
Target Country: <Country Name> (<TAG>)

Your task is to independently audit all changes made for <TAG> across code, documentation, and tests.

Review Checklist:
1. Inspect `common/units/names_divisions/INEX_<TAG>_names_divisions.txt`:
   - Valid group tags (<TAG>_<CAT>_<NUM>), globally unique.
   - Clean UTF-8 without BOM, balanced braces `{}`.
   - Valid line combat subunit tokens in `division_types` (no "armor", "marines", or support tokens).
   - Integer keys in `ordered` strictly unique, no empty blocks.
   - Valid `fallback_name` with `%d` or `%s`.
   - No self-referential `link_numbering_with`.
   - Concise UI selector names without country demonyms.
   - Plain (un-nicknamed) variant kept beside every nicknamed infantry/motorized/mechanized/armor group, sharing numbering (unless vanilla already nicknames them).
   - Correct grammatical cases (nominative) and verified diacritics.
2. Inspect Documentation Synchronization:
   - `WORKSHOP_DESCRIPTION_GUIDELINES.md` table and BBCode bullets updated (no emojis, character limits observed).
   - `README.md` table updated.
   - `wiki/<Nation>.md`, `wiki/Home.md`, and `wiki/_Sidebar.md` created/updated.
3. Run Validation Commands:
   - Execute `powershell -File .\build.ps1 -ValidateOnly`
   - Execute `powershell -File .\build.ps1 -Test`

Deliver a structured Code Review Report:
- Status: `APPROVED` or `CHANGES_REQUESTED`
- Checklist of verified items
- Detailed list of any issues (Critical, Important, Minor) with file paths and line numbers
```

If the Code Reviewer requests changes, the primary agent must address the findings and re-verify before finalizing.

---

## 3. Research Protocol & Historical Investigation

(Detailed guidelines for the historical investigation conducted by the "Historical Research" subagent)

### Order of Battle (OOB) Investigation
1. **Peacetime vs. Wartime Mobilization**:
   - Investigate the target country's military structure between 1918 and 1945.
   - Differentiate standing peacetime units from mobilization cadres. Many smaller powers used peacetime cadre battalions designed to expand into full 3,000-man wartime regiments.
2. **Specialized & Paramilitary Wings**:
   - **Territorial Defense & Militias**: Check for national volunteer defense organizations (*Kaitseliit*, *Hemvärnet*, *Suojeluskunta*, *KOP*, *Home Guard*).
   - **Elite & Partisan Battalions**: Identify famous volunteer, partisan, or historic units from wars of independence or regional conflicts (e.g., *Kuperjanov*, *Sakala*, *Kalev*, *Scouts*).
   - **Mobile & Armored Heritage**: Check for armored trains (*soomusrongid*), named armored cars (*soomusautod*), ski/bicycle troops, or independent tank companies.
   - **Coastal Defense & Fortresses**: Coastal artillery fortresses (*Merekindlused*, *Kustartilleri*), archipelago commands, and marine amphibious detachments (*Meredessant*).

### Vanilla Comparison & Interaction Rules
1. **Automated Vanilla Inspection (Token-Efficient)**:
   Instead of loading large, raw vanilla files into context, use the build script's built-in inspector:
   ```powershell
   powershell -File .\build.ps1 -InspectVanilla <TAG>
   ```
   - Automatically parses vanilla namelist groups, subunit types, fallbacks, and entry counts.
   - Automatically scans `common/national_focus/` and `common/scripted_effects/` for any `division_names_group = <TAG>_*` references.
   - To inspect a single specific group without reading the full file:
     ```powershell
     powershell -File .\build.ps1 -InspectVanilla <TAG> -Group <GROUP_TAG>
     ```
2. **Inspect Existing Coverage & Errors**:
   - Check what unit types vanilla covers (often generic `%s Infantry Division` placeholders).
   - Identify grammatical errors in vanilla (e.g., wrong cases like genitive/partitive instead of nominative, missing diacritics, awkward translations).
3. **Additive Loading & Tag Overrides**:
   - Files in `common/units/names_divisions/` are loaded additively by the game. Because INEX files are prefixed (`INEX_<TAG>_names_divisions.txt`), vanilla files remain active.
   - If an INEX group shares the same tag as vanilla (e.g. `<TAG>_INF_01`), INEX **overrides** that vanilla group.
   - If a tag is omitted from INEX, the vanilla definition continues to exist untouched in game.
4. **Scripted References in Focus Trees & Events**:
   - Check if any vanilla namelist tag is referenced by national focus trees (`common/national_focus/`) or scripted effects (`common/scripted_effects/`) via `division_names_group = <TAG>_<TYPE>_<NUM>`.
   - Never copy empty vanilla stubs into INEX. If an empty vanilla tag is referenced by scripts (e.g. `SOV_INF_02`), omitting it from INEX is completely safe because the engine falls back to the vanilla definition. Only define the tag in INEX if actively providing a fully authored, non-empty namelist for it. The one exception is the fallback-only plain variant of a plain/named pair (Section 4).

---

## 4. Namelist Scoping & Modular Design

Tailor the namelist suite to the nation's genuine military organization, historical branches, mobilization doctrines, and gameplay opportunities. Avoid arbitrary limits on the number or types of groups—author as many or as few distinct namelists as make sense for that nation's depth.

### Common Modular Archetypes (Inspiration & Reference):
- **Frontline Divisions & Regiments**: Peacetime cadre regiments, wartime division mobilization schemes, or historical regional designations (e.g. `<TAG>_INF_01`, `<TAG>_REG_01`).
- **Territorial Defense, Home Guard & Garrisons**: National defense leagues, county militias, border guards, or fortress garrisons (e.g. `<TAG>_KL_01`, `<TAG>_AIZ_01`, `<TAG>_GAR_02`).
- **Armored, Motorized & Mechanized**: Tank battalions, armored car traditions, mechanized brigades, and armored trains (e.g. `<TAG>_ARM_02`, `<TAG>_MOT_02`).
- **Cavalry & Mounted Troops**: Dedicated cavalry regiments, independent reconnaissance squadrons, or partisan horse detachments (e.g. `<TAG>_CAV_01`, `<TAG>_CAV_02`).
- **Specialized / Amphibious / Mountain / Airborne**: Coastal artillery fortresses, marine assault groups, archipelago defense commands, ski rangers, or paratroopers (e.g. `<TAG>_MAR_02`, `<TAG>_MNT_02`, `<TAG>_PAR_02`).
- **Elite, Guards & Volunteer Formations**: Historical volunteer legions, royal/presidential guards, resistance movements, or legendary independence battalions (e.g. `<TAG>_LEG_01`, `<TAG>_GUA_01`).

### Grouping Flexibility:
- **Split vs. Combine**: Separate specialized formations into distinct namelists when historical flavor or player template differentiation warrants it (e.g. splitting peacetime cavalry regiments from volunteer partisan squadrons, or separating field infantry from territorial defense).
- **Template Compatibility**: Group unit tokens in `division_types = { ... }` logically to give players flexibility when assigning templates (e.g. combining motorized and mechanized with armor if mobile units share lineage).

### Plain & Named Variants (Mandatory for Infantry, Motorized, Mechanized, Armor)
When regular infantry, motorized, mechanized, or armored divisions get nicknamed or identity names (e.g. `12. Divisioona 'Kollaa'`), always keep an **un-nicknamed variant** beside them so players can choose plain numbering:
- **Plain variant keeps the vanilla tag** (`<TAG>_INF_01`, `<TAG>_MOT_01`, `<TAG>_ARM_01`, `<TAG>_MEC_01`, or whatever vanilla uses) with the plain selector (`"Infantry Divisions"`), a plain `fallback_name` (`"%d. Divisioona"`), and **no `ordered` block** (fallback-only, like vanilla stubs). Define it explicitly in INEX so vanilla errors are fixed and the pairing is visible. Players' existing templates on that tag keep plain names.
- **Named variant gets a new tag**: the next category number not used by vanilla (check `-InspectVanilla`), e.g. `FIN_INF_05`. Give it the selector `"<Plain Selector> (Named)"` (at most 28 characters) and the same `division_types` and `fallback_name`.
- **Shared numbering**: the named variant uses `link_numbering_with` on its plain counterpart (`{ <TAG>_INF_01 }`). In a mobile family, link every plain and named mobile group to one anchor (e.g. `<TAG>_MOT_01`).
- **Exception**: if the vanilla group already carries nicknames (e.g. USA's *1st Infantry Division "Big Red One"*), a single named group is enough.
- `build.ps1 -Audit` reports such a fallback-only group as `Variant: plain (un-nicknamed) counterpart of <TAG>` and does not flag it `PLACEHOLDER_ENTRIES` or `LOW_DEPTH`.

---

## 5. Historical & Linguistic Verification Protocol

Before completing any namelist, agents and reviewers **must verify** that the namelist satisfies each of the following criteria:

- [ ] **1. Linguistic & Grammatical Plausibility**:
  - Are all names written in the grammatically appropriate case (usually nominative rather than genitive/partitive, e.g. Estonian *Jalaväediviis* instead of vanilla's incorrect *diviisi*)?
  - Are native diacritics (*ä, ö, õ, ü, š, ž, etc.*) and capitalization rules respected?
  - Does numbering follow the target country's standard (e.g., `%d.` for period-suffixed ordinals like *1. Diviis* or Roman `%s.` where appropriate)?

- [ ] **2. Doctrinal & Institutional Grounding**:
  - Are names anchored in real-world institutions, peacetime cadres, mobilization plans, or historical traditions (e.g., peacetime single battalions expanding to regiments, territorial leagues, fortress commands)?

- [ ] **3. Gameplay Scalability (Plausible Wartime Depth)**:
  - Does the list provide sufficient depth for a full Hearts of Iron IV campaign? (A list should rarely stop at 3–4 entries; provide 20–30+ ordered entries or robust fallback names so a mobilizing player doesn't run out of immersive names).
  - Are plausibly extrapolated units (e.g., higher division numbers, armored or marine formations) natural extensions of the nation's military naming traditions?

- [ ] **4. Cultural & Historical Authenticity**:
  - Are nicknames, honorary titles, and regional designations grounded in the nation's genuine geography, history, and military culture, avoiding anachronisms or modern fantasy tropes?

- [ ] **5. Fallback Plausibility**:
  - Does `fallback_name` use an authentic pattern (`%d. <Unit Type>`) that remains natural even if the player produces units beyond the ordered list?

---

## 6. Namelist File Syntax & Engine Invariants

File location: `common/units/names_divisions/INEX_<TAG>_names_divisions.txt`

```txt
# Division template historical names system for <Country> (<TAG>).
# Immersive Namelists Expanded (INEX)

<TAG>_<CATEGORY>_<NUM> = 
{
	name = "<English UI Selector Name>"

	for_countries = { <TAG> }

	can_use = { always = yes }

	division_types = { "<unit_token_1>" "<unit_token_2>" }

	# Number reservation system: only link to a DIFFERENT group if shared numbering is desired (e.g. motorized linking with regular infantry). Omit or comment out if not linking to another group. NEVER link a group to itself.
	# link_numbering_with = { <OTHER_TAG_CATEGORY_NUM> }

	fallback_name = "%d. <Fallback Name>"

	# Names with numbers (only one number per entry).
	ordered =
	{
		1 = { "<Historical Name 1>" }
		2 = { "<Historical Name 2>" }
		...
		26 = { "%d. <Fallback Name>" }
	}
}
```

### Important Syntax Rules & Engine Invariants:
- **Encoding**: Ensure clean UTF-8 encoding without BOM.
- **Quotes**: Arguments must be wrapped in matching double quotes `""`.
- **UI Selector Names (`name = "..."`)**: Keep in-game selector names concise, functional, and devoid of national demonyms (e.g. `"Alpine Cazadores"` or `"Cavalry Regiments"`, not `"Mexican Alpine Cazadores"`). The in-game division template dropdown UI is narrow and truncates long names.
- **Number Formats & Fallback Tokens**: Use `%d` for Arabic numbers (`1.`, `2.`) and `%s` for Roman numerals (`I.`, `II.`). Always ensure `fallback_name` includes a literal `%d` or `%s` token (e.g., `%d.`, `%dº`, `%da`, `%s.`) so overflow units do not share identical names. Do not use custom placeholders like `%er` in fallback names (reserve language-specific contractions for static entries in `ordered = { ... }`).
- **Bracket Balance**: Brackets `{}` must be strictly balanced.
- **Division Subunit Tokens**: In `division_types = { ... }`, specify only valid line subunit tokens (e.g., `"infantry"`, `"cavalry"`, `"motorized"`, `"mechanized"`, `"light_armor"`, `"medium_armor"`, `"heavy_armor"`, `"modern_armor"`, `"marine"`, `"mountaineers"`, `"paratrooper"`). Do not use `"armor"` or `"marines"`, and avoid support-only tokens like `"military_police"`.
- **Ordered Blocks & Keys**: Each integer index in `ordered = { ... }` must be unique. Duplicate keys silently overwrite previous entries. Avoid leaving empty `ordered = { }` blocks; a fallback-only group (such as a plain variant) omits `ordered` entirely.
- **Link Numbering**: `link_numbering_with` is strictly for cross-referencing *external* groups to prevent duplicate division numbers. Never set a group to link with itself (`link_numbering_with = { GROUP_NAME }`).
- **Global Group Tag Uniqueness**: Root-level group tags (e.g. `<TAG>_<CAT>_<NUM>`) must be strictly unique across the entire mod. Never duplicate a group tag within a file or across multiple files.

---

## 7. Documentation & Workshop Synchronization

Whenever a country is added or updated, immediately update `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `README.md`, and `wiki/`:
1. **Repository Cross-Reference (`WORKSHOP_DESCRIPTION_GUIDELINES.md`)**:
   Add a row to the markdown table:
   `| INEX_<TAG>_names_divisions.txt | <Country> | <TAG> | Included (<Summary of highlights>) |`
2. **Active Steam Workshop Description (`WORKSHOP_DESCRIPTION_GUIDELINES.md`)**:
   Add the nation under `[h1]Included nations:[/h1]` using standard BBCode format (2–3 concise bullet points to respect the character limit):
   ```bbcode
   [b]<Country>[/b]
   - <Category Name>: Brief description with italicized in-game examples ([i]Unit Name[/i])
   ```
3. **README Summary Table (`README.md`)**:
   Add newly added country tags, names, and file paths to the **Included Nations Summary** table.
4. **Wiki Documentation (`wiki/`)**:
   - Create or update the detailed documentation page for the country at `wiki/<Nation>.md`.
   - If adding a new country, add links to `wiki/Home.md` and `wiki/_Sidebar.md`.
   - Deploy updates to the remote GitHub wiki via:
     ```powershell
     powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document <TAG> division namelists"
     ```
5. **Steam Description Invariants**:
   - Strictly no emojis anywhere in the description.
   - Respect Steam's ~17,000 character limit: keep bullets concise and omit author update quote blocks (`[quote=author]...[/quote]`).
   - Maintain the author's concise, direct, bullet-focused voice.
   - Ensure proper diacritics and grammar on historical unit titles.
   - If the user asks for the updated description in chat, present the complete BBCode in a single code block ready for copy-pasting.

---

## 8. Build, Validation & Test Protocol

Always run the build automation scripts from the mod root:

```powershell
# 1. Syntax, engine invariant, and bracket validation
powershell -File .\build.ps1 -ValidateOnly

# 2. Automated Pester unit test suite (engine rules, docs sync, build script)
powershell -File .\build.ps1 -Test

# 3. Release packaging test (ensures clean ZIP excluding dev artifacts)
powershell -File .\build.ps1 -Package

# 4. Live development link (optional: links Paradox launcher to git repo)
powershell -File .\build.ps1 -DevLink
```
