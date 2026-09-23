---
name: hoi4-inex-namelist-authoring
description: >-
  Runbook for researching historical Order of Battle (OOB) and authoring immersive division
  namelists for Hearts of Iron IV in the Immersive Namelists Expanded (INEX) mod. Use when
  adding a new nation or expanding existing national division namelists.
---

# Hearts of Iron IV Namelist Authoring Runbook

This skill provides step-by-step guidance for researching, scoping, authoring, and validating division namelists for *Immersive Namelists Expanded* (INEX).

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

## 2. Research Protocol

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
   - Never copy empty vanilla stubs into INEX. If an empty vanilla tag is referenced by scripts (e.g. `SOV_INF_02`), omitting it from INEX is completely safe because the engine falls back to the vanilla definition. Only define the tag in INEX if actively providing a fully authored, non-empty namelist for it.

---

## 3. Namelist Scoping & Design

When creating namelists for a new nation, target 3 to 5 high-impact, authentic categories:
1. **Regimental / Frontline Infantry**: Historical numbered regiments and elite named battalions (`<TAG>_REG_01` or `<TAG>_INF_02`).
2. **Territorial Militia / Garrisons**: Regional defense leagues, home guard units, or military district garrisons (`<TAG>_KL_01` or `<TAG>_GAR_02`).
3. **Armored & Mobile**: Armored trains, named armored vehicles, tanks, and motorized/mechanized brigades (`<TAG>_ARM_02` or `<TAG>_MOT_02`).
4. **Specialized / Coastal / Mountain / Marine**: Coastal fortresses, marine assault groups, or mountain/ski rangers (`<TAG>_MAR_02` or `<TAG>_MNT_02`).

---

## 4. Historical Plausibility Verification Protocol

Before completing any namelist, agents **must verify** that the namelist satisfies each of the following criteria:

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

## 5. Namelist File Syntax

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

### Important Syntax Rules:
- **Encoding**: Ensure clean UTF-8 encoding without BOM.
- **Quotes**: Arguments must be wrapped in matching double quotes `""`.
- **Number Formats**: Use `%d` for Arabic numbers (`1.`, `2.`) and `%s` for Roman numerals (`I.`, `II.`). Always ensure `fallback_name` includes a `%d` or `%s` token so overflow units do not share identical names.
- **Bracket Balance**: Brackets `{}` must be strictly balanced.
- **Division Subunit Tokens**: In `division_types = { ... }`, specify only valid line subunit tokens (e.g., `"infantry"`, `"cavalry"`, `"motorized"`, `"mechanized"`, `"light_armor"`, `"medium_armor"`, `"heavy_armor"`, `"modern_armor"`, `"marine"`, `"mountaineers"`, `"paratrooper"`). Do not use `"armor"` or `"marines"`, and avoid support-only tokens like `"military_police"`.
- **Ordered Blocks & Keys**: Each integer index in `ordered = { ... }` must be unique. Duplicate keys silently overwrite previous entries. Avoid leaving empty `ordered = { }` blocks.
- **Link Numbering**: `link_numbering_with` is strictly for cross-referencing *external* groups to prevent duplicate division numbers. Never set a group to link with itself (`link_numbering_with = { GROUP_NAME }`).

---

## 6. Documentation & Guidelines Synchronization

Whenever a country is added or updated, immediately update `WORKSHOP_DESCRIPTION_GUIDELINES.md`:
1. **Repository Cross-Reference**:
   Add a row to the markdown table:
   `| INEX_<TAG>_names_divisions.txt | <Country> | <TAG> | Included (<Summary of highlights>) |`
2. **Active Steam Workshop Description**:
   Add the nation under `[h1]Included nations:[/h1]` using standard BBCode format:
   ```bbcode
   [b]<Country>[/b]
   - <Category Name>: Brief description with italicized in-game examples ([i]Unit Name[/i])
   ```
3. **Planned List**:
   Remove the completed country from `[h1]Planned:[/h1]`.
4. **Steam Description Invariants**:
   - Strictly no emojis anywhere in the description.
   - Maintain the author's concise, direct, bullet-focused voice.
   - Ensure proper diacritics and grammar on historical unit titles.
   - If the user asks for the updated description in chat, present the complete BBCode in a single code block ready for copy-pasting.

---

## 7. Build & Validation Protocol

Always run the build automation scripts from the mod root:

```powershell
# 1. Syntax and bracket validation
powershell -File .\build.ps1 -ValidateOnly

# 2. Release packaging test (ensures clean ZIP excluding dev artifacts)
powershell -File .\build.ps1 -Package

# 3. Live development link (optional: links Paradox launcher to git repo)
powershell -File .\build.ps1 -DevLink
```
