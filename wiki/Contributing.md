# Contributing

This page describes how to contribute new namelists or expand existing ones in the INEX project.

---

## Quick Start

1. **Clone the repository:**
   ```
   git clone https://github.com/TheCreepero/immersive_namelists_expanded.git
   ```
2. **Set up a dev link** so changes are live in your Paradox launcher immediately:
   ```powershell
   powershell -File .\build.ps1 -DevLink
   ```
3. **Validate** before committing:
   ```powershell
   powershell -File .\build.ps1 -ValidateOnly
   ```

---

## File Structure

All division namelist files live in:
```
common/units/names_divisions/zz_INEX_<TAG>_names_divisions.txt
```

Germany is intentionally split across three files — see [Germany](Germany), [Germany Waffen-SS](Germany-Waffen-SS), and [Germany Additional](Germany-Additional).

---

## Authoring a New Namelist

### Step 1 — Research

Before writing a single line, research the target country's military structure:

- **Peacetime vs. wartime mobilization:** Many small powers had peacetime cadre battalions designed to expand into wartime regiments on mobilization.
- **Regional conventions:** Were units named by province, city, commanding officer, or historical battle?
- **Specialized branches:** Check for volunteer defence organizations, border guards, armored cars/trains, coastal fortresses, cavalry.
- **Alt-history trajectories:** What would a fully mobilized, expanded military plausibly name its formations?

### Step 2 — Check Vanilla Coverage

Use the build script to inspect what vanilla already provides:
```powershell
# Show all vanilla groups and entries for a tag
powershell -File .\build.ps1 -InspectVanilla LAT

# Show a specific vanilla group
powershell -File .\build.ps1 -InspectVanilla SOV -Group SOV_INF_02
```

Only define a group in INEX if you are actively authoring custom names for it. Omitted groups fall back to vanilla automatically.

### Step 3 — Write the Namelist

A namelist file changes only through the build script, never by hand. `build.ps1 -EditNames <TAG> -AddGroup -Group <TAG>_<CAT>_<NN> -Selector "..." -AddType infantry -Fallback "%d. ..."` creates a group, `-EditNames <TAG> -Group <GROUP> -Add "1=..."` adds names, and `-EditNames <TAG> -Batch <file.json>` applies many operations at once (`-DryRun` previews them); `Get-Help .\build.ps1 -Parameter EditNames` lists every switch. The script writes each group in the layout below (see [Engine Mechanics](Engine-Mechanics) for what each key does):

```
TAG_CATEGORY_NUM = 
{
    name = "UI Display Name"

    for_countries = { TAG }

    can_use = { always = yes }

    division_types = { "infantry" }

    fallback_name = "%d. Unit Name"

    ordered =
    {
        1  = { "First Specific Name" }
        2  = { "Second Specific Name" }
    }
}
```

**Quality checklist before submitting:**

- [ ] **Linguistic precision** — correct grammatical case (nominative, not genitive), native diacritics, proper ordinal format
- [ ] **Doctrinal grounding** — names anchored in real institutions, peacetime cadres, or historical traditions
- [ ] **Gameplay scalability** — at least 20–30 ordered entries; fallback covers overflow
- [ ] **Cultural authenticity** — geographic, historical, and heraldic references are accurate
- [ ] **Fallback plausibility** — `fallback_name` remains natural even at high unit counts

### Step 4 — Validate

```powershell
powershell -File .\build.ps1 -ValidateOnly
powershell -File .\build.ps1 -Check <TAG>
```

`-Check` runs the validator, the tests, the quality audit and a name diff in one pass and must end with `Check passed`. The validator checks:
- Bracket balance `{}`
- Quote balance
- Duplicate `ordered` keys within each group
- Invalid subunit tokens in `division_types`
- Missing `fallback_name` ordinal tokens

Fix all reported errors before proceeding.

### Step 5 — Update Documentation

Whenever a nation is added or significantly expanded, update:

1. **`README.md`**, **`wiki/Home.md`** and **`wiki/_Sidebar.md`** — `build.ps1 -SyncWiki <TAG> -Country "<Name>"` adds a new nation's rows and sidebar line and keeps the wiki page's group rows current
2. **`WORKSHOP_DESCRIPTION_GUIDELINES.md`** — add the nation under `[h1]Included nations:[/h1]` (2–3 concise bullets) and update the cross-reference table
3. **This wiki** — add or update the nation's page (`wiki/<Name>.md`); `-SyncWiki` fills its group table from the file

---

## Build System Reference

The repository includes `build.ps1` for all automation tasks:

```powershell
# Validate syntax and structure
powershell -File .\build.ps1 -ValidateOnly

# Create a dev symlink in the Paradox launcher (live editing)
powershell -File .\build.ps1 -DevLink

# Deploy files to the local Paradox mod folder
powershell -File .\build.ps1 -Deploy

# Build a clean distribution ZIP (excludes git/, scripts, docs)
powershell -File .\build.ps1 -Package

# Inspect vanilla namelists for a country tag
powershell -File .\build.ps1 -InspectVanilla <TAG>
powershell -File .\build.ps1 -InspectVanilla <TAG> -Group <GROUP_TAG>

# Audit namelist quality heuristics (ALL = triage table, or a file key like LIT / GER_SS)
powershell -File .\build.ps1 -Audit ALL
powershell -File .\build.ps1 -Audit <KEY>

# One pass before a change is complete: validation, tests, audit summary, name diff
powershell -File .\build.ps1 -Check <TAG>
```

Publishing to the Steam Workshop is done by the maintainer.

---

## Style Guide

### Language & Diacritics
- Always use the **target language** for unit names, not English translations.
- Preserve all native diacritics (ä, ö, ü, ą, ę, ū, ā, č, š, ž, ő, etc.). Test that your editor saves in UTF-8 without BOM.
- Use the correct grammatical case — typically **nominative** for unit names, not genitive/partitive (a common vanilla error).

### Ordinal Format
- **Arabic ordinals** (`%d.`): used by Germany, Estonia, Latvia, Finland, Sweden, France, etc.
- **Roman numeral ordinals** (`%s.`): used by Lithuania, and some Finnish/Italian groups.
- Match the convention used historically by that nation's military.

### Historical Scope
INEX targets the **1936–1945** window (the HoI4 timeframe) with roots in the interwar period (1918–1936) for peacetime organizational context. Post-war formations may be included if they are relevant to alt-history trajectories.

### Naming Tone
- Avoid generic fantasy names — all names should be grounded in real geography, history, or institutional tradition.
- When extrapolating beyond historical numbers, draw on regional geography, heraldry, or military history for inspiration.

---

## Updating the Wiki

The wiki is maintained in the `wiki/` directory of the repository. To push changes to GitHub:

```powershell
powershell -File .\wiki\push-wiki.ps1
```

The script clones the `.wiki.git` remote, copies the `wiki/` directory contents into it, and pushes.

