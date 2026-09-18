# Steam Workshop Description Guidelines & Reference

This document serves as an instruction and reference guide for maintaining and updating the Steam Workshop description for **Immersive Namelists Expanded** (Workshop ID: `2967389401`).

---

## Core Rules & Constraints

1. **No Emojis**: Strictly avoid adding any emojis or emoticons to the description.
2. **Writing Style & Tone**:
   - Keep the tone concise, informative, direct, and enthusiastic, matching the author's original voice.
   - Use straightforward bullet points and structured section headings.
   - Do not over-embellish or use marketing buzzwords.
3. **Language & Grammar**:
   - You are free and encouraged to fix typos, misspellings, formatting anomalies, or broken English.
   - Examples of known corrections:
     - "battallion" -> "battalion"
     - "finnish commanders" -> "Finnish commanders"
     - Proper diacritics/accents: `1ère Division de la Garde Nationale 'Paris'`, `Ryhmä Talvela`.
4. **Steam Formatting (BBCode)**:
   - Always format the description using Steam's supported BBCode tags:
     - Section headings: `[h1]Heading Text[/h1]`
     - Bold text: `[b]...[/b]`
     - Italics: `[i]...[/i]` (used for foreign language division names / examples)
     - Quotes: `[quote=author]...[/quote]`
     - URLs: `[url=https://...]link text[/url]`
     - Lists: Standard markdown-style hyphen bullets (`- Item`) or `[list][*]Item[/list]` (the author originally used hyphens `- `).
   - Ensure clean line breaks between sections and blocks.

---

## Structure of the Description

1. **Header / Introduction**:
   - Short introductory pitch (e.g. mentions AI/GPT assistance for translations/research if relevant).
   - Author update quote (`[quote=author]...[/quote]`).
   - Call to action pointing to the discussion thread for ideas/feedback.
2. **[h1]Info:[/h1]**:
   - Compatibility notes (Ironman/Achievements, game version compatibility, mod compatibility).
   - Mod direction/focus statement (polishing existing lists vs. adding new ones).
   - Permissions note.
3. **[h1]Included nations:[/h1]**:
   - Disclaimer noting that this is not an exhaustive list, just highlights/examples.
   - Grouped by nation in bold (`[b]Nation[/b]`).
   - Highlighted division categories with brief descriptions or in-game examples in italics.
4. **[h1]Planned:[/h1]**:
   - Bulleted list of nations planned for expansion or future addition.

---

## Repository Cross-Reference (`common/units/names_divisions/`)

| File | Nation | Tag | Notes / In Description |
| :--- | :--- | :--- | :--- |
| `INEX_USA_names_divisions.txt` | USA | `USA` | Included (Guards, Fascist, Shock, Forts, etc.) |
| `INEX_GER_names_divisions.txt` | Germany | `GER` | Included (Festung, Nicknames, Marine, Para, etc.) |
| `INEX_GER_SS_names_divisions.txt` | Germany (SS) | `GER` | Included (Historical & ahistorical SS lists) |
| `INEX_GER_ADDITIONAL_names_divisions.txt` | Germany (Extra) | `GER` | Included (Garrison, Kampfgruppen, etc.) |
| `INEX_FRA_names_divisions.txt` | France | `FRA` | Included (National Guard, Metropolitan, etc.) |
| `INEX_ENG_names_divisions.txt` | United Kingdom | `ENG` | Included (Home Guard, Royal Guard, etc.) |
| `INEX_FIN_names_divisions.txt` | Finland | `FIN` | Included (Local troops, groups, detachments) |
| `INEX_POL_names_divisions.txt` | Poland | `POL` | Included (Home Army, PSZ, People's Army) |
| `INEX_ITA_names_divisions.txt` | Italy | `ITA` | Included (Guerrilla, Nicknames, Defense Brigades) |
| `INEX_SOV_names_divisions.txt` | USSR | `SOV` | Included (NKVD, Guards Para, Artillery) |
| `INEX_LIT_names_divisions.txt` | Lithuania | `LIT` | Added to repo (Previously in "Planned: The Baltics") |
| `INEX_SWE_names_divisions.txt` | Sweden | `SWE` | Added to repo (Ready to be documented when requested) |

---

## Current Baseline Description (BBCode Format)

```bbcode
More namelists! Used GPT4 to speed up the creation process and help with translations.

[quote=author] A new update at long last! [/quote]
If you have any ideas for namelists, please leave them in the discussion thread!

[h1]Info:[/h1]
- [b]Not Ironman/Achievement compatible[/b]
- [b]Unless Paradox changes how namelists work, this mod will be compatible with any future game version![/b]
- No hard incompatibilities. Namelists from other mods might override namelists from this mod in some cases.
- Now that I've finished adding the initially planned nations, I will start polishing the nations that have been added instead of adding new ones. That means new namelists where I feel they are needed and changes to existing namelists.
- Feel free to use this mod however you wish.

[h1]Included nations:[/h1]
This is not a complete list of included namelists! Just some examples.

[b]USA[/b]
- Communist USA Guards Divisions
- Fascist USA Fascist Divisions
- Shock Divisions
- Composite Units: For example Merrill's Marauders
- Armored Detachment: Named after various US forts

[b]Germany[/b]
- Fortress (Festung) Divisions: Named after European cities
- Garrison command namelist
- Expanded SS namelist with a few dozen fictional named divisions
- New SS infantry, motorized, mechanized, and armoured namelists with both historical and ahistorical entries. I've also kept the old general purpose SS namelist for those who prefer that.
- Named Armored Divisions: Panzer-divisions, but every division has a nickname
- Marine & Paratrooper namelists have nicknames for divisions
- Kampfgruppen
- Grenadier & Volks-Grenadier Divisions separated from the vanilla namelists
- Heavy tank battalion namelists
- Volkssturm

[b]France[/b]
- Named Infantry Divisions: Same as the regular infantry namelist, but with nicknames
- National Guard Divisions: French cities as nicknames, e.g. "[i]1ère Division de la Garde Nationale 'Paris'[/i]"
- Metropolitan Divisions: Divisions formed after the liberation of France. Credit to Heorl1!
- Heavy Infantry: Used as support for the units tasked with piercing the front. Credit to Heorl1!

[b]United Kingdom[/b]
- Home Guard
- Royal Guard
- Independent Brigades

[b]Finland[/b]
- Garrisons are now called local troops (=Paikallisjoukot): Named after various towns and cities in Finland.
- Independent Groups: Named after Finnish commanders, e.g. [i]Ryhmä Talvela[/i]
- Command Detachments: Named after smaller municipalities of Eastern Finland, e.g. [i]Ilomantsin Komennuskunta[/i]

[b]Poland[/b]
- Home Army and PSZ: Special names for units of the Polish Armed Forces and Home Army, available after capitulation.
- People's Army: Ideological-related names and nicknames for units, e.g. "[i]40 Dywizja Piechoty czasu 'W'[/i]"
- Expanded Names and Nicknames: Now units will have full names and nicknames, e.g. "[i]18 Dywizja Piechoty Ziemii Lomzynskiej[/i]"

[b]Italy[/b]
- Guerrilla Units: Names for insurgent units of all major factions in Italy.
- Expanded Nicknames: Each unit now has the correct, historical nickname.
- Defense Brigades: Units similar to the German [i]Festung Division[/i] with the names of Italian cities, e.g. "[i]Brigata Difesa 'Bologna'[/i]"

[b]USSR[/b]
- NKVD Security Divisions
- Guards Paratroopers
- Artillery Divisions

[h1]Planned:[/h1]
- More USSR!
- More USA!
- More Germany!
- More France!
- More UK!
- More Finland!

- Post-Austro-Hungarian countries!
- More Poland!
- Spain!
- The Baltics!
- More Italy!
```

