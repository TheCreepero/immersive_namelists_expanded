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
| `INEX_USA_names_divisions.txt` | United States | `USA` | Included (Infantry, Armor, Armored Cavalry Regiments, Separate Tank Bns, National Guard, Airborne, Marines, Marine Raiders, Rangers, Harbor Defenses, State Defense Forces, Red Guards & Lincoln Brigades, Silver Legions & Confederate, MacArthur Emergency Forces) |
| `INEX_GER_names_divisions.txt` | Germany | `GER` | Included (Plain & Named infantry, motorized, Panzergrenadier and Panzer lists with garrison identities and nicknames, Jäger, Gebirgs, Fallschirmjäger, Marine, Cavalry, fascist Elite Formations, Imperial & Guard, Republican, Red Army) |
| `INEX_GER_SS_names_divisions.txt` | Germany (SS) | `GER` | Included (Fascist-only Waffen-SS divisions 1-41 by type incl. mountain & cavalry, shared honour-name expansion, heavy battalions, SS Kampfgruppen, Standarten) |
| `INEX_GER_ADDITIONAL_names_divisions.txt` | Germany (Extra) | `GER` | Included (Heavy battalions, Panzer brigades, Volksgrenadier/Reserve/Grenadier series, Luftwaffe field & Flak, Festungen, Kampfgruppen, Volkssturm, SA, Freikorps, Schutztruppe, Reichsbanner, Red Front, Foreign Legions) |
| `INEX_SWE_names_divisions.txt` | Sweden | `SWE` | Included (Provincial brigades, Pansarbrigader, Ski/Arctic, Caroleans, Volunteers) |
| `INEX_EST_names_divisions.txt` | Estonia | `EST` | Included (Historical & elite regiments, Kaitseliit malevad, Armored trains/cars, Coastal fortresses) |
| `INEX_LAT_names_divisions.txt` | Latvia | `LAT` | Included (Historical divisions & regiments, Aizsargu pulki, Armored cars/trains, Coastal fortresses, Cavalry) |
| `INEX_LIT_names_divisions.txt` | Lithuania | `LIT` | Included (Grand Duke/Royal regiments, Iron Wolf cavalry, AA/Armored teams) |
| `INEX_FRA_names_divisions.txt` | France | `FRA` | Included (1940 order of battle, Nicknames, National Guard, Metropolitan, Milice, FTP, Armistice Army) |
| `INEX_ENG_names_divisions.txt` | United Kingdom | `ENG` | Included (Home Guard, Royal Guard, Independent, Commandos, Alt-history) |
| `INEX_FIN_names_divisions.txt` | Finland | `FIN` | Included (Wartime divisions & JR 1–70 regiments, Suojeluskunta, Ryhmä groups, Frontier & Coastal brigades, Blackshirt legions, Heimojoukot, Red Guards, People's Army, Royal Guards, Penal battalions, Swedish Volunteers SFK) |
| `INEX_POL_names_divisions.txt` | Poland | `POL` | Included (Home Army, PSZ, LWP, KOP Border Guards, Brygada Świętokrzyska) |
| `INEX_ITA_names_divisions.txt` | Italy | `ITA` | Included (Historical numbering, Blackshirts, RSI, Black Brigades, Royal Army, Party-gated Partisans, Bersaglieri, Carabinieri, Frontier Guard, Colonial, Legione Romana) |
| `INEX_SOV_names_divisions.txt` | USSR | `SOV` | Included (Rifle honors, Guards Tanks & Mech Corps, Guards Airborne, Breakthrough Artillery, Moscow/Leningrad Opolcheniye, Cossacks, NKVD, Penal units) |
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

[b]United States[/b]
- Regular Army & Mobile: 1st–106th Infantry, Armored divisions ([i]1st 'Old Ironsides'[/i], [i]2nd 'Hell on Wheels'[/i]), Armored Cavalry Regiments ([i]2nd 'Second Dragoons'[/i], [i]3rd 'Brave Rifles'[/i], [i]11th 'Blackhorse'[/i]), Separate Tank Battalions ([i]761st 'Black Panthers'[/i]), and state National Guard divisions
- Airborne, Marine & Special Forces: Airborne divisions ([i]82nd 'All-American'[/i], [i]101st 'Screaming Eagles'[/i]), 1st–6th Marines, Marine Raiders ([i]1st 'Edson's'[/i], [i]2nd 'Carlson's'[/i]), Rangers ([i]1st FSSF 'The Devil's Brigade'[/i], [i]Merrill's Marauders[/i]), Mountain ([i]10th 'Climb to Glory'[/i]), and 18 Harbor Defense Commands
- Territorial & Ideology Suites: 38 authentic WWII State Defense Forces, Workers' Red Guards & Lincoln Brigades (Communist), Silver Legions & Confederate Divisions (Fascist), and Federal Emergency Forces (Military Junta)

[b]Germany[/b]
- Plain and Named Heer lists in historical raising order, with nicknames and home garrisons ([i]7. Panzer-Division 'Gespenster'[/i], [i]97. Jäger-Division 'Spielhahnjäger'[/i])
- Festungen, Kampfgruppen, Volksgrenadier, Luftwaffe field & Flak divisions, heavy battalions, and Panzer brigades
- Ideology suites: Waffen-SS, SA & Volkssturm (fascist), Imperial Guard & Freikorps, Reichsbanner, and Red Army & Red Front

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
- 1940 order of battle: [i]11ème Division d'Infanterie 'de Fer'[/i], DLM, DCR, Maginot fortress and Alpine divisions, plus colonial and North African formations
- Government-gated National Guard and Metropolitan divisions, [i]Division de la Milice Française[/i], Francs-Tireurs et Partisans, and Armistice Army

[b]United Kingdom[/b]
- Home Guard, Royal Guard, and Independent Brigades
- Special Service commando formations, plus alt-history Loyalist & Blackshirt brigades

[b]Finland[/b]
- Numbered divisions & wartime regiments ([i]12. Divisioona 'Kollaa'[/i], [i]JR 7 'Tyrjän rykmentti'[/i], [i]JR 61[/i]) and Suojeluskunta districts
- Frontier Jaegers, Coastal brigades ([i]Rannikkotykistörykmentti 1[/i]), Sissi rangers, [i]Panssaridivisioona 'Lagus'[/i], and Swedish Volunteers (SFK)
- Ideology suites: Blackshirt legions ([i]Mustapaitojen Keskuslegioona[/i]), [i]Heimopataljoona 3[/i], 1918 Red Guards, [i]Suomen Kansanarmeija[/i], and Royal Guards ([i]Suomen Kaarti[/i])

[b]Poland[/b]
- Home Army (AK) and Polish Armed Forces in the West (PSZ) post-capitulation lists
- People's Army, KOP Border Protection Corps, and Brygada Świętokrzyska

[b]Italy[/b]
- Regio Esercito divisions on their real numbers, shared across infantry, motorized and armored lists ([i]9a Divisione 'Pasubio'[/i], [i]132a Divisione Corazzata 'Ariete'[/i])
- Government-gated lists: Blackshirt legions, the Social Republic and Black Brigades ([i]8a Brigata Nera 'Aldo Resega'[/i]), Royal Army ([i]Gruppo di Combattimento 'Cremona'[/i]), Communist, and Garibaldi, GL, Matteotti, Autonome and Fiamme Verdi partisans
- Bersaglieri, Arditi, Carabinieri, Frontier Guard sectors ([i]XII Settore di Copertura 'Valtellina'[/i]), colonial troops and fascist-only imperial legions (Legione Romana)

[b]USSR[/b]
- Red Army Rifle divisions ([i]1-ya 'Moskovskaya Proletarskaya'[/i], [i]25-ya 'Chapayevskaya'[/i]), Guards Rifles ([i]8-ya Gv. 'Panfilovskaya'[/i]), and Moscow/Leningrad Narodnoe Opolcheniye
- Armor & Mechanized Corps with WWII battle honors: Guards Tank Corps ([i]4-y Gv. 'Kantemirovskiy'[/i], [i]1-y Gv. 'Donskoy'[/i]) and all 9 Guards Mechanized Corps ([i]1-y Gv. 'Venskiy'[/i])
- Specialized & Security: 1st–10th Guards Airborne ([i]7-ya Gv. 'Cherkasskaya'[/i]), Breakthrough Artillery RVGK, Cossack cavalry hosts ([i]Donskaya[/i], [i]Kubanskaya[/i]), Penal units ([i]Shtrafbat[/i]), and communist-gated NKVD Internal Troops

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
