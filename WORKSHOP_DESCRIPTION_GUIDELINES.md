# Steam Workshop Description Guidelines & Reference

This document serves as an instruction and reference guide for maintaining and updating the Steam Workshop description for **Immersive Namelists Expanded** (Workshop ID: `2967389401`).

---

## Core Rules & Constraints

1. **No Emojis**: Strictly avoid adding any emojis or emoticons to the description.
2. **Character & Length Limits**:
   - Steam Workshop descriptions have a strict character limit (~17,000 characters raw BBCode).
   - Keep bullet points concise and avoid lengthy narrative blocks.
   - Do NOT include the old author quote block (`[quote=author]...[/quote]`), as it consumed too many characters and was stripped to keep the description under the limit.
   - Monitor the overall character count of the BBCode text when adding new nations.
3. **Writing Style & Tone**:
   - Keep the tone concise, informative, direct, and enthusiastic, matching the author's original voice.
   - Use straightforward bullet points and structured section headings.
   - Do not over-embellish or use marketing buzzwords.
4. **Language & Grammar**:
   - Fix typos, misspellings, formatting anomalies, or broken English.
   - Known corrections applied:
     - "battallion" -> "battalion"
     - "finnish commanders" -> "Finnish commanders"
     - Proper diacritics/accents: `1ère Division de la Garde Nationale 'Paris'`, `Ryhmä Talvela`, `18 Dywizja Piechoty Ziemi Łomżyńskiej`.
     - Standardized names like *Festungsdivision* and *Volksgrenadier*.
5. **Steam Formatting (BBCode)**:
   - Always format the description using Steam's supported BBCode tags:
     - Section headings: `[h1]Heading Text[/h1]`
     - Bold text: `[b]...[/b]`
     - Italics: `[i]...[/i]` (used for foreign language division names / examples)
     - URLs: `[url=https://...]link text[/url]`
     - Lists: Standard hyphen bullets (`- Item`) matching the author's format.
   - Ensure clean line breaks between sections and blocks.

---

## Structure of the Description

1. **Header / Introduction**:
   - Short introductory pitch mentioning GPT-4 assistance for research/translations.
   - Call to action pointing to the discussion thread for ideas/feedback.
   - *(Note: Author quote block omitted to conserve character limit).*
2. **[h1]Info:[/h1]**:
   - Compatibility notes (Ironman/Achievements, game version compatibility, mod compatibility).
   - Mod direction/focus statement (polishing existing lists and adding new nations).
   - Permissions note.
3. **[h1]Included nations:[/h1]**:
   - Disclaimer noting that this is not an exhaustive list, just highlights/examples.
   - Grouped by nation in bold (`[b]Nation[/b]`).
   - Highlighted division categories with brief descriptions or in-game examples in italics (maintain 2-3 concise bullets per nation to conserve character limit).

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
| `INEX_LAT_names_divisions.txt` | Latvia | `LAT` | Included (Historical divisions & regiments, Aizsargu pulki, Armored cars/trains, Coastal fortresses, Cavalry) |
| `INEX_LIT_names_divisions.txt` | Lithuania | `LIT` | Included (Grand Duke/Royal regiments, Iron Wolf cavalry, AA/Armored teams) |
| `INEX_FRA_names_divisions.txt` | France | `FRA` | Included (National Guard, Metropolitan, Heavy/Décision, Nicknames) |
| `INEX_ENG_names_divisions.txt` | United Kingdom | `ENG` | Included (Home Guard, Royal Guard, Independent, Commandos, Alt-history) |
| `INEX_FIN_names_divisions.txt` | Finland | `FIN` | Included (Battle-honour divisions, Suojeluskunta districts, Ryhmä groups, Panssaridivisioona, Sissi, Swedish Volunteers SFK) |
| `INEX_POL_names_divisions.txt` | Poland | `POL` | Included (Home Army, PSZ, LWP, KOP Border Guards, Brygada Świętokrzyska) |
| `INEX_ITA_names_divisions.txt` | Italy | `ITA` | Included (Partisans, Nicknames, Defense Brigades, Colonial, Legione Romana) |
| `INEX_SOV_names_divisions.txt` | USSR | `SOV` | Included (NKVD, Guards Para, Artillery, Penal units, Cossacks) |
| `INEX_MEX_names_divisions.txt` | Mexico | `MEX` | Included (Cristero, Imperial Guard, Sinarquistas, Gold Shirts, CTM & Agrarian Militias, Anáhuac, Regular Army) |
| `INEX_PER_names_divisions.txt` | Iran / Persia | `PER` | Included (Garrison-city Lashkars, Imperial & Immortal Guard, Shahnameh armor, Cossack atriads, Tribal levies, Camel corps, Gendarmerie) |

---

## Active Steam Workshop Description (BBCode Format)

```bbcode
More namelists! Used AI to speed up the creation process and help with translations.

Check out my other mods:
- [url=https://steamcommunity.com/sharedfiles/filedetails/?id=3807415216]Immersive Ship Names Expanded[/url]
- [b]Immersive Air Wing Names Expanded[/b] (Coming soon!)

If you have any ideas for namelists, please leave them in the discussion thread!

[h1]Info:[/h1]
- [b]Not Ironman/Achievement compatible[/b]
- [b]Unless Paradox changes how namelists work, this mod will be compatible with any future game version![/b]
- [b]Compatible with Road to 56 (RT56) and vanilla.[/b]
- No hard incompatibilities. Namelists from other mods might override namelists from this mod in some cases.
- In addition to polishing and expanding currently included nations, new nations are periodically added where they fit.
- Feel free to use this mod however you wish.

[h1]Included nations:[/h1]
This is not a complete list of included namelists! Just some examples.

[b]USA[/b]
- Guards (Communist), Legion & Fascist divisions, and emergency National Defense units
- Shock, Rangers, Merrill's Marauders, and fort-named armored detachments

[b]Germany[/b]
- Festung & Garrison divisions named after European cities; Volksgrenadier & Volkssturm
- Nicknamed Panzer, Paratrooper & Marine divisions; Schwere Panzerabteilungen, Flak & Kampfgruppen
- Expanded historical & ahistorical SS lists and Standarten; Imperial/Monarchist armies

[b]Sweden[/b]
- Provincial Infanteribrigader ([i]Gula brigaden[/i]), Pansarbrigader, and Cykel- & Kavalleribrigader
- Ski & Arctic rangers, coastal artillery, Royal Guards (Caroleans), and Volunteers (SFK)

[b]Lithuania[/b]
- Grand Duke infantry regiments ([i]Gedimino[/i], [i]Vytauto[/i], [i]Algirdo[/i]) & [i]Geležinio Vilko[/i] cavalry
- Armored & anti-air teams, artillery regiments, border garrisons, and territorial units

[b]Estonia[/b]
- Historic infantry regiments (1.–10.) and elite battalions ([i]Kuperjanovi[/i], [i]Scouts[/i])
- Kaitseliit county malevad, armored trains/cars, and coastal naval fortresses

[b]Latvia[/b]
- Historical regional divisions, peacetime regiments, and Latviešu strēlnieki
- Aizsargi county regiments, Autotanku pulks, armored trains, and coastal fortresses

[b]France[/b]
- Nicknamed line infantry, National Guard ([i]Paris[/i]), and Metropolitan liberation divisions
- Heavy assault infantry (Divisions d'Infanterie de Décision)

[b]United Kingdom[/b]
- Home Guard, Royal Guard, and Independent Brigades
- Special Service commando formations, plus alt-history Loyalist & Blackshirt brigades

[b]Finland[/b]
- Numbered divisions with battle honours ([i]12. Divisioona 'Kollaa'[/i]) and Suojeluskunta districts
- Commander-named groups ([i]Ryhmä Talvela[/i]), [i]Panssaridivisioona 'Lagus'[/i], Sissi rangers, and Swedish Volunteers (SFK)

[b]Poland[/b]
- Home Army (AK) and Polish Armed Forces in the West (PSZ) post-capitulation lists
- People's Army, KOP Border Protection Corps, and Brygada Świętokrzyska

[b]Italy[/b]
- Partisan brigades (Garibaldi, GL, Matteotti), defense brigades, and colonial troops
- Historically nicknamed divisions and imperial Roman legions (Legione Romana)

[b]USSR[/b]
- NKVD security and penal (Shtrafbat) units
- Guards paratroopers, artillery divisions, and Cossack cavalry

[b]Mexico[/b]
- Cristero National Guard & cavalry ([i]Los Altos[/i], [i]El Catorce[/i])
- Sinarquistas, Gold Shirts, Imperial Guard, CTM & Agrarian worker militias
- Regular army, heroes ([i]Zaragoza[/i]), mountain rangers & naval infantry

[b]Iran[/b]
- Garrison-city divisions ([i]Lashkar-e 15-e Piyadeh-ye Shiraz[/i]) and Shahnameh-named armor ([i]Rostam[/i], [i]Kaveh[/i])
- Imperial & Immortal Guard ([i]Gard-e Javidan[/i]) and Persian Cossack atriads ([i]Hamadan[/i])
- Tribal levies ([i]Bakhtiari[/i], [i]Qashqai[/i]), camel corps, gendarmerie, and Gulf marines

If you enjoy the mod, please give it a thumbs up and favorite!
```
