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
   - Fix typos, misspellings, formatting anomalies, or broken English.
   - Known corrections applied:
     - "battallion" -> "battalion"
     - "finnish commanders" -> "Finnish commanders"
     - Proper diacritics/accents: `1ère Division de la Garde Nationale 'Paris'`, `Ryhmä Talvela`, `18 Dywizja Piechoty Ziemi Łomżyńskiej`.
     - Standardized names like *Festungsdivision* and *Volksgrenadier*.
4. **Steam Formatting (BBCode)**:
   - Always format the description using Steam's supported BBCode tags:
     - Section headings: `[h1]Heading Text[/h1]`
     - Bold text: `[b]...[/b]`
     - Italics: `[i]...[/i]` (used for foreign language division names / examples)
     - Quotes: `[quote=author]...[/quote]`
     - URLs: `[url=https://...]link text[/url]`
     - Lists: Standard hyphen bullets (`- Item`) matching the author's format.
   - Ensure clean line breaks between sections and blocks.

---

## Structure of the Description

1. **Header / Introduction**:
   - Short introductory pitch mentioning GPT-4 assistance for research/translations.
   - Author update quote (`[quote=author]...[/quote]`).
   - Call to action pointing to the discussion thread for ideas/feedback.
2. **[h1]Info:[/h1]**:
   - Compatibility notes (Ironman/Achievements, game version compatibility, mod compatibility).
   - Mod direction/focus statement (polishing existing lists and adding new nations).
   - Permissions note.
3. **[h1]Included nations:[/h1]**:
   - Disclaimer noting that this is not an exhaustive list, just highlights/examples.
   - Grouped by nation in bold (`[b]Nation[/b]`).
   - Highlighted division categories with brief descriptions or in-game examples in italics.
4. **[h1]Planned:[/h1]**:
   - Bulleted list of nations planned for expansion or future addition.

---

## Repository Cross-Reference (`common/units/names_divisions/`)

| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| `INEX_USA_names_divisions.txt` | USA | `USA` | Included (Guards, Fascist/Legion, Shock, Forts, Rangers, National Defense) |
| `INEX_GER_names_divisions.txt` | Germany | `GER` | Included (Festung, Panzer nicknames, Marine, Para, Monarchist) |
| `INEX_GER_SS_names_divisions.txt` | Germany (SS) | `GER` | Included (Historical & ahistorical SS lists, SS-Standarte) |
| `INEX_GER_ADDITIONAL_names_divisions.txt` | Germany (Extra) | `GER` | Included (Garrison, Kampfgruppen, Heavy tanks, Flak, Luftwaffe, Panzerartillerie) |
| `INEX_SWE_names_divisions.txt` | Sweden | `SWE` | Included (Provincial brigades, Pansarbrigader, Ski/Arctic, Caroleans, Volunteers) |
| `INEX_EST_names_divisions.txt` | Estonia | `EST` | Included (Historical & elite regiments, Kaitseliit malevad, Armored trains/cars, Coastal fortresses) |
| `INEX_LIT_names_divisions.txt` | Lithuania | `LIT` | Included (Grand Duke/Royal regiments, Iron Wolf cavalry, AA/Armored teams) |
| `INEX_FRA_names_divisions.txt` | France | `FRA` | Included (National Guard, Metropolitan, Heavy/Décision, Nicknames) |
| `INEX_ENG_names_divisions.txt` | United Kingdom | `ENG` | Included (Home Guard, Royal Guard, Independent, Commandos, Alt-history) |
| `INEX_FIN_names_divisions.txt` | Finland | `FIN` | Included (Local troops, groups, detachments, Swedish Volunteers SFK) |
| `INEX_POL_names_divisions.txt` | Poland | `POL` | Included (Home Army, PSZ, LWP, KOP Border Guards, Brygada Świętokrzyska) |
| `INEX_ITA_names_divisions.txt` | Italy | `ITA` | Included (Partisans, Nicknames, Defense Brigades, Colonial, Legione Romana) |
| `INEX_SOV_names_divisions.txt` | USSR | `SOV` | Included (NKVD, Guards Para, Artillery, Penal units, Cossacks) |

---

## Active Steam Workshop Description (BBCode Format)

```bbcode
More namelists! Used GPT-4 to speed up the creation process and help with translations.

[quote=author] A new update at long last! Added Sweden, Lithuania, and Estonia, along with new namelists and improvements across existing nations! [/quote]
If you have any ideas for namelists, please leave them in the discussion thread!

[h1]Info:[/h1]
- [b]Not Ironman/Achievement compatible[/b]
- [b]Unless Paradox changes how namelists work, this mod will be compatible with any future game version![/b]
- No hard incompatibilities. Namelists from other mods might override namelists from this mod in some cases.
- In addition to polishing and expanding currently included nations, new nations are periodically added where they fit.
- Feel free to use this mod however you wish.

[h1]Included nations:[/h1]
This is not a complete list of included namelists! Just some examples.

[b]USA[/b]
- Communist USA Guards Divisions
- Fascist USA Fascist & National Legion Divisions
- Shock Divisions
- Composite Units: For example Merrill's Marauders
- Armored Detachment: Named after various US forts
- Ranger Force: Historic commando & ranger battalions
- Division of National Defense: Emergency homeland defense units

[b]Germany[/b]
- Fortress (Festung) Divisions: Named after European cities
- Garrison command namelist
- Expanded SS namelist with a few dozen fictional named divisions
- SS infantry, motorized, mechanized, and armored namelists with both historical and ahistorical entries (as well as the general purpose SS list)
- SS-Standarte
- Named Armored Divisions: Panzer divisions, but every division has a nickname
- Marine & Paratrooper namelists have nicknames for divisions
- Kampfgruppen
- Grenadier & Volksgrenadier Divisions separated from the vanilla namelists
- Heavy tank battalion namelists (Schwere Panzerabteilungen)
- Panzerartillerie & Flak Divisions
- Luftwaffe Field Divisions (Luftwaffe-Felddivisionen)
- Reserve Divisions
- Volkssturm
- Monarchist / Imperial Divisions: Authentic naming conventions for the German Empire

[b]Sweden[/b]
- Infantry Brigades (Infanteribrigader): Named after Swedish provinces with regional nicknames (e.g. [i]Gula brigaden[/i], [i]Hallandsbrigaden[/i], [i]Livbrigaden[/i])
- Armored Brigades (Pansarbrigader): Historic tank brigades (e.g. [i]Göta pansarbrigad[/i], [i]Skånska pansarbrigaden[/i], [i]Blå brigaden[/i])
- Bicycle & Ranger Brigades (Cykelbrigader & Cykeljägarbrigader)
- Cavalry Brigades (Kavalleribrigader): Dragoon and hussar formations (e.g. [i]Livgardets dragoner[/i], [i]Livregementets husarer[/i])
- Ski & Arctic Ranger Brigades (Skid- & Jägarbrigader): Arctic, mountain, and frontier units (e.g. [i]Skidjägarbrigaden 'Jämtland'[/i], [i]Fjälljägarbrigaden 'Sarek'[/i], [i]Gränsjägarbrigaden 'Kalix'[/i])
- Coastal Defense & Marine Brigades (Kustartilleri & Skärgårdsbrigader): Coastal artillery and archipelago defense (e.g. [i]Vaxholm[/i], [i]Gotland[/i], [i]Stockholms skärgård[/i])
- Home Guard & Defense Areas (Hemvärnsområden & Försvarsområden)
- Artillery & Anti-Air Brigades (Artilleri- & Luftvärnsbrigader)
- Paratrooper Brigades (Fallskärmsjägarbrigader)
- Royal Guards & Carolean Formations (Kungliga Livgardet): Imperial and historical guards including [i]Carolus Rex[/i], [i]Gustavus Adolphus[/i], and [i]Livdrabantkåren[/i]
- Swedish Volunteer Units (Svenska Frivilligkåren & Skandinaviska Frivilliglegionen)

[b]Lithuania[/b]
- Historical Regiments: Infantry regiments honoring grand dukes and monarchs (e.g. [i]Lietuvos Didžiojo Kunigaikščio Gedimino[/i], [i]Vytauto[/i], [i]Algirdo[/i], [i]Karaliaus Mindaugo[/i])
- Cavalry Regiments: Historic husar, uhlan, and dragoon regiments (e.g. [i]Geležinio Vilko[/i] / Iron Wolf, [i]Radvilos[/i], [i]Birutės[/i])
- Armored & Anti-Air Teams (Šarvuočių Rinktinė & Priešlėktuvinės Apsaugos Rinktinė)
- Artillery Regiments & Infantry Brigades
- Territorial, District, and Border Garrisons

[b]Estonia[/b]
- Historical Regiments: 1.–10. Jalaväerügement and elite battalions ([i]Kuperjanovi[/i], [i]Sakala[/i], [i]Kalevlaste Maleva[/i], [i]Scoutsrügement[/i], [i]Vahirügement[/i])
- Defense Formations: Territorial Defence League formations covering all Estonian counties and cities (e.g. [i]Tallinna malev[/i], [i]Tartu malev[/i], [i]Narva malev[/i])
- Armored Trains & Armor: Renowned armored trains ([i]Kapten Irv[/i], broad & narrow gauge) and legendary armored cars ([i]Suur Tõll[/i], [i]Tasuja[/i], [i]Kalevipoeg[/i])
- Coastal Defense & Marines: Naval Fortresses ([i]Aegna Merekindlus[/i], [i]Naissaare Merekindlus[/i], [i]Suuropi Merekindlus[/i]) and marine landing formations

[b]France[/b]
- Named Infantry Divisions: Same as the regular infantry namelist, but with nicknames
- National Guard Divisions: French cities as nicknames, e.g. "[i]1ère Division de la Garde Nationale 'Paris'[/i]"
- Metropolitan Divisions: Divisions formed after the liberation of France. Credit to Heorl1!
- Heavy Infantry (Divisions d'Infanterie de Décision): Used as support for units tasked with piercing the front. Credit to Heorl1!

[b]United Kingdom[/b]
- Home Guard
- Royal Guard
- Independent Brigades
- Special Service Brigades: Commando formations
- Loyalist & Blackshirt Brigades: Alt-history ideological and civil war formations

[b]Finland[/b]
- Garrisons are now called local troops (=Paikallisjoukot): Named after various towns and cities in Finland.
- Independent Groups: Named after Finnish commanders, e.g. [i]Ryhmä Talvela[/i]
- Command Detachments: Named after smaller municipalities of Eastern Finland, e.g. [i]Ilomantsin Komennuskunta[/i]
- Swedish Volunteer Corps (Svenska Frivilligkåren): Historic volunteer companies and battle groups from the Winter War

[b]Poland[/b]
- Home Army and PSZ: Special names for units of the Polish Armed Forces and Home Army, available after capitulation.
- People's Army: Ideological-related names and nicknames for units, e.g. "[i]40 Dywizja Piechoty czasu 'W'[/i]"
- Expanded Names and Nicknames: Full names and historic nicknames, e.g. "[i]18 Dywizja Piechoty Ziemi Łomżyńskiej[/i]"
- Border Protection Corps (KOP - Korpus Ochrony Pogranicza): Dedicated border guard brigades and regiments
- Swietokrzyska Brigade (Brygada Świętokrzyska)

[b]Italy[/b]
- Guerrilla & Partisan Formations: Insurgent units of all major Italian resistance factions (Garibaldi, Giustizia e Libertà, Matteotti, Fiamme Verdi)
- Expanded Nicknames: Each unit now has the correct, historical nickname.
- Defense Brigades: Units similar to the German Festungsdivision with names of Italian cities, e.g. "[i]Brigata Difesa 'Bologna'[/i]"
- Colonial Units: Dubat bands, Savari & Spahis cavalry squadrons, and irregular bands
- Roman Legion (Legione Romana): Alt-history imperial units

[b]USSR[/b]
- NKVD Security Divisions
- Guards Paratroopers & Guards Airborne
- Artillery Divisions
- Penal Units (Shtrafbat)
- Cossack Cavalry Divisions

[h1]Planned:[/h1]
- More USSR!
- More USA!
- More Germany!
- More France!
- More UK!
- More Finland!
- More Sweden!

- Post-Austro-Hungarian countries!
- More Poland!
- Spain!
- Remaining Baltic nations (Latvia)!
- More Italy!
```
