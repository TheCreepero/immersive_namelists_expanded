# Steam Workshop Description Guidelines & Reference

This document serves as an instruction and reference guide for maintaining and updating the Steam Workshop description for **Immersive Namelists Expanded** (Workshop ID: `2967389401`).

---

## Core Rules & Constraints

1. **No Emojis**: Strictly avoid adding any emojis or emoticons to the description.
2. **Character & Length Limits**:
   - Steam Workshop descriptions have a strict character limit (~17,000 characters raw BBCode).
   - Keep bullet points concise and avoid lengthy narrative blocks.
   - Do NOT include the old author quote block (`[quote=author]...[/quote]`), as it consumed too many characters and was stripped to keep the description under the limit.
   - Monitor the overall character count of the BBCode text when adding new nations: each nation block has a budget of 450 characters (Structure, item 3).
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
   - Short introductory pitch mentioning that AI helped with research and translations.
   - Call to action pointing to the discussion thread for ideas/feedback.
   - *(Note: Author quote block omitted to conserve character limit).*
2. **[h1]Info:[/h1]**:
   - Compatibility notes (Ironman/Achievements, game version compatibility, mod compatibility).
   - Mod direction/focus statement (polishing existing lists and adding new nations).
   - Permissions note.
3. **[h1]Included nations:[/h1]**:
   - Disclaimer noting that this is not an exhaustive list, just highlights/examples.
   - Grouped by nation in bold (`[b]Nation[/b]`).
   - Per-nation form (set 2026-10-27, when the description had reached 14,099 characters with 19 nations): `[b]Nation[/b]` and two bullets, at most 450 characters for the whole block, with 2-3 in-game examples in italics. The first bullet holds the regular and specialist forces, the second the government-gated suites. Name the lists, not every group; the wiki page carries the detail. `build.ps1 -Audit` and `-Check` warn about a block over 450 characters and a description over 16,000.

---

## Repository Cross-Reference (`common/units/names_divisions/`)

| File | Nation | Tag | Status in Description |
| :--- | :--- | :--- | :--- |
| `zz_INEX_USA_names_divisions.txt` | United States | `USA` | Included (Infantry, Regimental Combat Teams, Armor, Armored Cavalry Regiments, Separate Tank & Tank Destroyer Bns, Field Artillery, National Guard, Airborne, Marines, Marine Raiders, Amtracs, Rangers, Harbor Defenses, Overseas Garrisons, Constabulary, State Defense Forces, Red Guards & Lincoln Brigades, Silver Legions & Confederate, MacArthur Emergency Forces & Continental Army, Union & Conservation Corps, Volunteer Legions & Color Plan Forces) |
| `zz_INEX_GER_names_divisions.txt` | Germany | `GER` | Included (Plain & Named infantry, motorized, Panzergrenadier and Panzer lists with garrison identities and nicknames, Jäger, Gebirgs, Fallschirmjäger, Marine, Cavalry, Coastal Defense & Border Guard, fascist Elite Formations, Imperial & Guard with Jäger, Kampfwagen & Seebataillon lists, Republican, Reichswehr, Volkswehr & Republican Panzer, Red Army, Workers', Red Panzer & Red Sailor) |
| `zz_INEX_GER_SS_names_divisions.txt` | Germany (SS) | `GER` | Included (Fascist-only Waffen-SS divisions 1-41 by type incl. mountain & cavalry, shared honour-name expansion, heavy battalions, SS Kampfgruppen, Standarten) |
| `zz_INEX_GER_ADDITIONAL_names_divisions.txt` | Germany (Extra) | `GER` | Included (Heavy battalions, Panzer, infantry & Sturmgeschütz brigades, Panzerjäger, reconnaissance, artillery & Werfer units, Tauchpanzer, naval commandos, Volksgrenadier/Reserve/Grenadier series, Luftwaffe field & Flak, Festungen, Kampfgruppen, penal units, Volkssturm, SA, Freikorps, Schutztruppe, Reichsbanner, Red Front, Foreign Legions, Imperial Sturm-Bataillone, Reserve & Landwehr divisions) |
| `zz_INEX_SWE_names_divisions.txt` | Sweden | `SWE` | Included (Plain & Named arméfördelningar, motorized, mechanized and armored divisions, Cavalry, Marine, Mountain and Paratrooper divisions, provincial brigades, Ski/Arctic, Home Guard & Landstorm, Royal & Carolean Guards, fascist Stormtroopers & Legions, communist Red Guards, Volunteers) |
| `zz_INEX_JAP_names_divisions.txt` | Japan | `JAP` | Included (Plain & Named Dai-N Shidan infantry, motorized, mechanized and Sensha armored lists with tsūshōgō, Cavalry, Teishin airborne, SNLF marines, Mountain, Garrison, Fortress, Border, Imperial Guard, Kenpeitai, militia, Rangers & Bicycle, fascist Kokutai & Yokusan, democratic Jieitai-style, communist Red Guards & People's Army) |
| `zz_INEX_BRA_names_divisions.txt` | Brazil | `BRA` | Included (Plain & Named infantry, motorized, mechanized and armored divisions with Army patrons, Caçadores, Mechanized Cavalry, Riverine battalions, Field Artillery, Cavalry, Paraquedista, Fuzileiros Navais, Mountain, coastal artillery, State Forças Públicas, Guarda Nacional, Presidential Guard, Frontier and Amazon jungle troops, FEB Expeditionary, Foreign Legions, fascist Integralist, communist Red Guards & People's Army, democratic Constitutionalist, Imperial Guard & Voluntários da Pátria) |
| `zz_INEX_GRE_names_divisions.txt` | Greece | `GRE` | Included (Plain & Named Merarchía infantry, motorized, mechanized and armored lists, Cavalry, Mountain divisions & brigades, Evzones, Raiders & Sacred Band, Paratrooper, Marine, garrison, island & Metaxas Line fortress commands, Gendarmerie, Asia Minor Army, Middle East & Korea expeditionary, royal Fourth of August Guard, fascist EON, communist ELAS & Democratic Army, democratic National Defence & Republican volunteers) |
| `zz_INEX_ROM_names_divisions.txt` | Romania | `ROM` | Included (Plain & Named Divizia infantry, motorized, mechanized and armored lists, Cavalry divisions, brigades & regiments, Mountain brigades & divisions, Marine, Paratrooper, garrison, fortified sectors, Border Guard, Gendarmerie, Royal Guard & Straja Țării, fascist Iron Guard, communist People's divisions & Patriotic Guards, democratic Volunteer & National Guard) |
| `zz_INEX_EST_names_divisions.txt` | Estonia | `EST` | Included (Plain & Named infantry, motorized, mechanized and armored divisions, War of Independence regiments & partisan battalions, cavalry regiments, Kaitseliit malevad, armored trains & cars, coastal commands & marines, garrisons & border guards, paratroopers, mountain, Ancient Freedom, Veterans' League, Red Rifle divisions, Freedom Fighters) |
| `zz_INEX_LAT_names_divisions.txt` | Latvia | `LAT` | Included (Plain & Named infantry and armored divisions, peacetime and War of Independence regiments, Latvian Riflemen, Aizsargi regiments, cavalry squadrons, garrisons & border guards, marines, paratroopers, mountain, Heritage, Thunder Cross, Red Rifle divisions, National Partisans) |
| `zz_INEX_LIT_names_divisions.txt` | Lithuania | `LIT` | Included (Plain & Named infantry, motorized, mechanized and armored divisions, Grand Duke infantry regiments, hussar, uhlan & dragoon regiments, Riflemen's Union, garrisons & border guards, marines, paratroopers, mountain, Royal Guard, Iron Wolf, Red Rifle divisions, Freedom Fighters) |
| `zz_INEX_FRA_names_divisions.txt` | France | `FRA` | Included (1940 order of battle, Nicknames, Colonial & Army of Africa, Coastal & Island Garrisons, Free French, National Guard, Metropolitan, Revolution, Bonapartist Empire, Paris Commune, Milice & Vichy legions, FTP, Armistice Army) |
| `zz_INEX_ENG_names_divisions.txt` | United Kingdom | `ENG` | Included (Regular & Territorial Army, Armoured divisions & tank brigades, Household Division, Airborne, Commandos, Anti-Aircraft Command, County Garrisons, Colonial KAR/RWAFF, Home Guard, Blackshirt & Workers' defense suites) |
| `zz_INEX_FIN_names_divisions.txt` | Finland | `FIN` | Included (Wartime divisions & JR 1–70 regiments, Prikaati brigades, Separate battalions (ErP), Light detachments (KevOs), Suojeluskunta, Ryhmä groups, Frontier & Coastal brigades, Blackshirt legions, Heimojoukot, Red Guards, People's Army, Royal Guards, Penal battalions, Swedish Volunteers SFK) |
| `zz_INEX_POL_names_divisions.txt` | Poland | `POL` | Included (1939 divisions with regional titles, Maczek's armor, KOP Border Guards, Obrona Narodowa, Armia Krajowa, PSZ exile corps, Communist LWP, Nationalist NSZ, Royal Guard, volunteer corps, fortresses, uprisings) |
| `zz_INEX_ITA_names_divisions.txt` | Italy | `ITA` | Included (Historical numbering, Blackshirts & specialist militias, RSI, Black Brigades, Royal Army, Republican volunteers, Red Guards, Party-gated Partisans, Bersaglieri, Carabinieri, Guardia di Finanza, Frontier Guard, Colonial divisions & battalions, Fiume & Albanian irredentists, Legione Romana) |
| `zz_INEX_SOV_names_divisions.txt` | USSR | `SOV` | Included (Rifle & Guards honors on historical numbers, National divisions, Fortified regions, Plain & Named Tank Corps and Tank Divisions, Guards Tank & Mech Corps, Airborne, Naval brigades, Breakthrough Artillery, Opolcheniye, Cossacks, NKVD, Penal units, Partisans, Imperial Guard, Whites, Republican shock units) |
| `zz_INEX_MEX_names_divisions.txt` | Mexico | `MEX` | Included (Cristero, Imperial Guard, Sinarquistas, Gold Shirts, CTM & Agrarian Militias, Anáhuac, Regular Army) |
| `zz_INEX_PER_names_divisions.txt` | Iran / Persia | `PER` | Included (Garrison-city Lashkars, Imperial & Immortal Guard, Shahnameh armor, Cossack atriads, Tribal levies, Camel corps, Gendarmerie) |
| `zz_INEX_SPR_names_divisions.txt` | Spain | `SPR` | Included (Plain & Named Republican and Nationalist infantry, Named armored divisions, 1936 infantry & cavalry regiments, Mountain, Marine tercios, Paratrooper banderas, garrison commands, Army of Africa & Legion, Guardia Civil, Assault Guards, Carabineros, Requeté tercios, Falange & División Azul, royal regiments, Mixed & International Brigades, socialist, communist, POUM & anarchist militias, Basque & Catalan forces, guerrillas) |

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
- Infantry, Armored and Airborne divisions with their nicknames ([i]2nd 'Hell on Wheels'[/i], [i]101st 'Screaming Eagles'[/i]), RCTs, Armored Cavalry, tank and tank destroyer battalions, Marines and Raiders, Rangers, Mountain, National Guard, harbor defenses and the Constabulary
- 38 State Defense Forces; ideology suites from Union and Continental Army to Lincoln Brigades and Silver Legions ([i]'Iron Brigade'[/i])

[b]Germany[/b]
- Plain and Named Heer lists in raising order with nicknames ([i]7. Panzer-Division 'Gespenster'[/i]), Waffen-SS, coastal and border divisions, Festungen, Kampfgruppen, Volksgrenadier, Luftwaffe field and Flak, heavy, StuG, Werfer and Panzerjäger units, penal units
- Imperial Guard and Kampfwagen divisions ([i]5. Kampfwagen-Division 'Mephisto'[/i]), Freikorps, Reichswehr and Reichsbanner, SA and Volkssturm, and Red Army lists

[b]Sweden[/b]
- Plain and Named Arméfördelningar and mobile divisions ([i]II. Arméfördelningen 'Jämtlands'[/i]), provincial brigades ([i]Gula brigaden[/i]), Fältjägare, Kustjägare and Fallskärmsjägare
- Home Guard, Landstorm and Royal Guards; Carolean Guards and Stormtroopers; communist Red Guards

[b]Japan[/b]
- Plain and Named Shidan with wartime tsūshōgō ([i]Dai-7 Shidan 'Kuma'[/i]), Sensha armored divisions, cavalry, Teishin airborne, SNLF marines ([i]Yokosuka Dai-1 Tokubetsu Rikusentai[/i]), Konoe Guard and Kenpeitai
- Kokutai and Yokusan (fascist), Jieitai-style Defense Force (democratic), Red Guards and People's Army (communist)

[b]Brazil[/b]
- Plain and Named divisions with Army patrons ([i]1ª Divisão de Infantaria "Duque de Caxias"[/i]), Caçadores ([i]1º BC "Petrópolis"[/i]), riverine battalions, Paraquedistas, Fuzileiros Navais, Forças Públicas and the FEB
- Integralist, Red Guards, 1932 Constitutionalist, and Imperial Guard and Voluntários da Pátria suites

[b]Greece[/b]
- Plain and Named Merarchíes with regional titles ([i]8i Merarchía Ipeírou[/i]), Evzones ([i]2/39 Evzonikó Sýntagma[/i]), Raiders, Metaxas Line forts, island commands, Gendarmerie and the Asia Minor Army
- Royal Guard and Fourth of August, EON, ELAS and Democratic Army, and Republican volunteers

[b]Romania[/b]
- Plain and Named divisions with regional and royal honours ([i]Divizia 6 Infanterie 'Mărășești'[/i]), cavalry, mountain, marine and paratrooper lists, Gendarmerie, Border Guard and fortified sectors ([i]Sectorul Fortificat 3 'Galați'[/i])
- Royal Guard and Straja Țării, Iron Guard, Tudor Vladimirescu and Patriotic Guards, and National Guard

[b]Lithuania[/b]
- Plain and Named divisions with regional and ruler identities ([i]1-oji tankų divizija 'Gediminas'[/i]), interwar regiments with their Grand Duke patrons, hussars and uhlans, Riflemen's Union ([i]XX Klaipėdos rinktinė[/i])
- Royal Guard, Iron Wolf, Red Rifle divisions and Freedom Fighters

[b]Estonia[/b]
- Plain and Named divisions with ancient-county identities ([i]1. jalaväediviis 'Virumaa'[/i]), War of Independence regiments and partisans ([i]Kuperjanovi partisanide pataljon[/i]), Kaitseliit malevad and coastal commands
- Ancient Freedom, Veterans' League, Red Rifle divisions and Freedom Fighters

[b]Latvia[/b]
- Plain and Named divisions with regional identities ([i]1. Kurzemes kājnieku divīzija[/i]), the interwar regiments and Latvian Riflemen ([i]1. Daugavgrīvas latviešu strēlnieku pulks[/i]), Aizsargi and cavalry squadrons
- Heritage, Thunder Cross, Red Rifle divisions and National Partisans

[b]France[/b]
- The 1940 order of battle ([i]11ème Division d'Infanterie 'de Fer'[/i]), DLM, DCR, Maginot, Alpine and coastal divisions, colonial troops and the Army of Africa
- Free French, National Guard and the Republic's demi-brigades; Imperial Guard and Grande Armée ([i]Division de la Vieille Garde[/i]); the Commune, FTP, Milice and Armistice Army

[b]United Kingdom[/b]
- Regular and Territorial divisions on authentic titles, plain and nicknamed ([i]7th Armoured Division 'Desert Rats'[/i], [i]51st (Highland) Infantry Division[/i]), Airborne, Commandos and Anti-Aircraft Command
- County Home Guard, King's African Rifles and RWAFF, Blackshirt Brigades and Workers' Defense Brigades

[b]Finland[/b]
- Numbered divisions, brigades and wartime regiments ([i]12. Divisioona 'Kollaa'[/i], [i]JR 7 'Tyrjän rykmentti'[/i]), separate battalions, Suojeluskunta, frontier and coastal brigades, Sissi rangers and the SFK
- Blackshirt legions, Heimojoukot, 1918 Red Guards, People's Army and Royal Guards ([i]Suomen Kaarti[/i])

[b]Poland[/b]
- 1939 divisions with regional and honorary titles ([i]1 Dywizja Piechoty Legionów Józefa Piłsudskiego[/i]), Maczek's armour, KOP Border Guard, Obrona Narodowa, fortresses and uprising regiments
- Armia Krajowa ([i]27 Wołyńska Dywizja Piechoty AK[/i]), PSZ in the West, LWP, NSZ, Royal Guard and volunteer corps

[b]Italy[/b]
- Regio Esercito divisions on their real numbers ([i]132a Divisione Corazzata 'Ariete'[/i]), Bersaglieri, Arditi, Carabinieri, Guardia di Finanza, Frontier Guard and colonial battalions
- Blackshirts and the RSI ([i]8a Brigata Nera 'Aldo Resega'[/i]), Royal Army, Republican volunteers, Red Guards and partisan brigades

[b]USSR[/b]
- Rifle and Guards divisions on historical numbers with their honours ([i]25-ya 'Chapayevskaya'[/i]), national divisions, Opolcheniye, fortified regions, tank and mechanized corps ([i]4-y 'Kantemirovskiy'[/i]), naval brigades and Cossacks
- NKVD and partisans, Imperial Guard, White volunteers and republican shock divisions

[b]Mexico[/b]
- Regular army with its heroes ([i]Zaragoza[/i]), mountain rangers and naval infantry, and Cristero National Guard ([i]Los Altos[/i])
- Sinarquistas, Gold Shirts, Imperial Guard, CTM and Agrarian worker militias

[b]Iran[/b]
- Garrison-city divisions ([i]Lashkar-e 15-e Piyadeh-ye Shiraz[/i]), Shahnameh-named armor ([i]Rostam[/i]), Imperial and Immortal Guard, Persian Cossack atriads
- Tribal levies, camel corps, gendarmerie and Gulf marines

[b]Spain[/b]
- People's Army divisions and Mixed Brigades ([i]XI Brigada Internacional 'Thälmann'[/i]), Nationalist divisions, the 1936 regiments, Army of Africa and Legion, Guardia Civil and Assault Guards
- Requeté tercios, Falange and División Azul, communist, POUM and anarchist militias ([i]Columna Durruti[/i]), Basque and Catalan forces

If you enjoy the mod, please give it a thumbs up and favorite!
```
