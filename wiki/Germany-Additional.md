# Germany — Additional Formations

**Country Tag:** `GER` | **Source File:** [`zz_INEX_GER_ADDITIONAL_names_divisions.txt`](../common/units/names_divisions/zz_INEX_GER_ADDITIONAL_names_divisions.txt)

> See also: [Heer](Germany) and [Waffen-SS](Germany-Waffen-SS).

---

## Historical Overview

This file holds formations that sit outside the core division series:
- **Numbered series:** heavy tank battalions, Panzer and Sturmgeschütz brigades, Reserve, Volksgrenadier and Grenadier divisions, Luftwaffe field and Flak divisions.
- **Support arms:** Panzerjäger battalions, armoured reconnaissance battalions, artillery divisions and Werfer brigades, the amphibious Tauchpanzer battalions of 1940 and the Kriegsmarine's naval commandos.
- **Garrisons and fortresses:** city commands and the 1944–45 Festungen.
- **Kampfgruppen and independent brigades.**
- **Penal units:** the Bewährungstruppe 500 and Division 999.
- **Paramilitaries:** one militia list per ideology.
- **Foreign legions.**
- **Plausible specialist formations:** Skijäger divisions, Luftwaffe Panzer divisions, armoured trains and Radfahr brigades, each grown from one real seed unit.
- **Imperial series:** the Sturm-Bataillone of 1916–18 and the Reserve, Ersatz and Landwehr divisions of 1914–18.

Reserve, Volksgrenadier and Grenadier divisions share the Heer numbering (`GER_Inf_01`) and sit on their real numbers. All other groups run their own series.

The support-arm groups list only the line battalions of their arm (anti-air, artillery, rocket artillery, anti-tank and tank destroyers, armoured cars, amphibious units, naval commandos), so a template built from those battalions takes the matching list on its own, while Panzer, motorized and infantry templates keep their main lists. Kampfgruppen list only infantry and are chosen by hand in the division designer.

The plausible lists are sized so that the main lists keep their templates: the ski list stays at 30 names, below the Jäger and Gebirgs lists, and the Luftwaffe Panzer lists stay far below the Heer Panzer and Panzergrenadier lists. The armoured trains are the exception: typed as armoured cars and larger than the Reconnaissance Battalions, they take a template of armoured-car battalions alone on their own; choose Reconnaissance Battalions in the designer for such a template.

Ideology gating:
- **Fascist:** Volkssturm, SA and Foreign Legions.
- **Neutrality:** Freikorps.
- **Neutrality and democratic:** Imperial Storm Battalions, Imperial Reserve Divisions and Imperial Landwehr Divisions.
- **Democratic:** Reichsbanner.
- **Communism:** Red Front Fighters.
- **Schutztruppe:** keeps its vanilla gating.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `GER_SCHWERE_PANZERABTEILUNG_01` | Heavy Panzer Battalions | heavy_armor, medium_armor, modern_armor | `schwere Panzer-Abteilung %d` |
| `GER_SCHWERE_PANZERABTEILUNG_02` | Heavy Panzer Bns (Abbr.) | heavy_armor, medium_armor, modern_armor | `s.Pz.Abt. %d` |
| `GER_ARM_03` | Panzer Brigades | light_armor, medium_armor, heavy_armor, modern_armor | `Panzer-Brigade %d` |
| `GER_STUG_01` | Assault Gun Brigades | medium_tank_destroyer_brigade | `Sturmgeschütz-Brigade %d` |
| `GER_PZJG_01` | Panzerjäger Battalions | anti_tank_brigade, mot_anti_tank_brigade, light_tank_destroyer_brigade, heavy_tank_destroyer_brigade, modern_tank_destroyer_brigade | `Panzerjäger-Abteilung %d` |
| `GER_AUFKL_01` | Reconnaissance Battalions | armored_car | `Panzer-Aufklärungs-Abteilung %d` |
| `GER_AMPH_01` | Amphibious Panzer Units | amphibious_armor, amphibious_mechanized, amphibious_light_armor, amphibious_medium_armor, amphibious_heavy_armor | `Tauchpanzer-Abteilung %d` |
| `GER_PANZERARTILLERIE_DIVISION_01` | Artillery Divisions | artillery_brigade, mot_artillery_brigade, light_sp_artillery_brigade, medium_sp_artillery_brigade, heavy_sp_artillery_brigade, modern_sp_artillery_brigade | `%d. Artillerie-Division` |
| `GER_WERFER_01` | Rocket Artillery Brigades | rocket_artillery_brigade, mot_rocket_artillery_brigade, motorized_rocket_brigade | `Werfer-Brigade %d` |
| `GER_RESERVE_DIVISION_01` | Reserve Divisions | infantry | `%d. Reserve-Division` |
| `GER_VOLKSGRENADIER_01` | Volksgrenadier Divisions | infantry | `%d. Volksgrenadier-Division` |
| `GER_GRENADIER_DIVISION_01` | Grenadier Divisions | infantry | `%d. Grenadier-Division` |
| `GER_LUFTWAFFEN_FELD_DIVISION_01` | Luftwaffe Field Divisions | infantry | `Luftwaffen-Feld-Division %d` |
| `GER_FLAK_DIVISION_01` | Flak Divisions | anti_air_brigade, mot_anti_air_brigade, light_sp_anti_air_brigade, medium_sp_anti_air_brigade, heavy_sp_anti_air_brigade, modern_sp_anti_air_brigade | `%d. Flak-Division` |
| `GER_GAR_02` | City Garrisons | infantry | `Feldkommandantur %d` |
| `GER_FORT_01` | Fortress Divisions | infantry | `%d. Festungs-Division` |
| `GER_KAMPFGRUPPE_01` | Kampfgruppen | infantry | `Kampfgruppe %d` |
| `GER_BRIG_01` | Infantry Brigades | infantry, motorized | `Grenadier-Brigade %d` |
| `GER_MEK_01` | Naval Commandos | marine_commando | `Marine-Einsatzkommando %d` |
| `GER_PEN_01` | Penal Units | penal_battalion, infantry | `Bewährungs-Bataillon %d` |
| `GER_VOLKSSTURM_BATAILLONS_01` | Volkssturm Battalions | militia | `%d. Volkssturm-Bataillon` |
| `GER_SA_01` | SA Formations | militia | `SA-Standarte %d` |
| `GER_MIL_01` | Freikorps | militia | `%d. Freikorps-Division` |
| `GER_MIL_02` | Schutztruppe | militia | `%d. Schutztruppen-Division` |
| `GER_MIL_04` | Reichsbanner | militia | `%d. Reichsbanner-Gau` |
| `GER_MIL_03` | Red Front Fighters | militia | `%d. RFB-Gau` |
| `GER_LEG_01` | Foreign Legions | infantry, cavalry, mountaineers | `%d. Freiwilligen-Division` |
| `GER_SKI_01` | Ski Divisions | mountaineers, ranger_battalion | `%d. Skijäger-Division` |
| `GER_FJPZ_01` | Luftwaffe Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor, mechanized | `Fallschirm-Panzer-Division %d` |
| `GER_FJPZ_02` | Luftwaffe Panzer (Named) | light_armor, medium_armor, heavy_armor, modern_armor, mechanized | `Fallschirm-Panzer-Division %d` |
| `GER_PZZUG_01` | Armored Trains | armored_car | `Panzerzug %d` |
| `GER_RAD_01` | Bicycle Brigades | bicycle_battalion | `Radfahr-Jäger-Brigade %d` |
| `GER_STURM_01` | Imperial Storm Battalions | infantry, ranger_battalion | `Sturm-Bataillon Nr. %d` |
| `GER_MONRES_01` | Imperial Reserve Divisions | infantry | `%d. Reserve-Division` |
| `GER_LANDWEHR_01` | Imperial Landwehr Divisions | infantry, militia | `%d. Landwehr-Division` |

> **Note:** `GER_SCHWERE_PANZERABTEILUNG_01` and `_02` are linked (`link_numbering_with`), so the long and abbreviated forms share one number series.

> **Note:** `GER_KAMPFGRUPPE_01` is typed as infantry only. The Heer infantry list (`GER_Inf_01`) always has more names, so the game never gives a new template Kampfgruppe names on its own; choose the list in the division designer.

> **Note:** `GER_PEN_01` overrides the vanilla tag. Vanilla ships it without names and locks it behind the focus `GER_strafbataillon`. INEX drops the focus lock, and the focus still names its penal divisions from this group.

---

## Group Details

### `GER_SCHWERE_PANZERABTEILUNG_01` / `_02` — Heavy Panzer Battalions
The Tiger battalions *schwere Panzer-Abteilung 501–510* and their 1945 renumberings (511, 424), and the radio-control battalion *(Fkl) 301*. The second group gives the abbreviated forms (*s.Pz.Abt. 501*). The heavy tank destroyer battalions are in `GER_PZJG_01`.

### `GER_ARM_03` — Panzer Brigades
The brigade staffs of the Panzer divisions of 1935–42 (*1.*–*6.* and *8. Panzer-Brigade*), the *18.* and *21.*, and the *100. Panzer-Brigade* of 1941 with captured French tanks. Then *Panzer-Brigade 10* (Kursk), the 1944 *Panzer-Brigaden 101–113* and *150*, and *Panzer-Brigade 'Norwegen'*. For small armoured templates.

### `GER_STUG_01` — Assault Gun Brigades
The Sturmartillerie of the Heer on its real numbers, *Sturmgeschütz-Brigade 177* to *914*. The independent Sturmgeschütz-Abteilungen were renamed brigades on 14 February 1944 and stayed at battalion strength (31 guns, later 45). The brigades given an escort grenadier battery later in 1944 appear as *Heeres-Sturmartillerie-Brigaden* (*236*, *239*, *667*), and *184* and *185* as *Heeres-Sturmgeschütz-Brigaden*. The list closes with *Sturmgeschütz-Lehr-Brigade 920*, *Sturmartillerie-Lehr-Brigade 111* and *Sturmgeschütz-Brigade 'Schill'*, the Luftwaffe's *Fallschirm-Sturmgeschütz-Brigaden 11*, *12* and *21*, and the *Sturmpanzer-Abteilungen 216–219*.

Typed as medium tank destroyers (StuG III and IV); the other tank destroyer and anti-tank battalions are in `GER_PZJG_01`.

### `GER_PZJG_01` — Panzerjäger Battalions
The heavy army Panzerjäger battalions on their real numbers: *schwere Panzerjäger-Abteilung 653* and *654* (Elefant), *512* (Jagdtiger), and the Nashorn and Jagdpanther battalions *88*, *93*, *519*, *525*, *559*, *560* and *655*. Then the Panzerjagd-Brigaden of 1944–45 (*Heeres-Panzerjagd-Brigade 1* and *2*, *Panzerjagd-Brigade 104*, *West*, *Panzerjäger-Brigade Oberschlesien*). Overflow uses the divisional *Panzerjäger-Abteilung*. For anti-tank and light, heavy and modern tank destroyer templates.

### `GER_AUFKL_01` — Reconnaissance Battalions
For armoured-car templates: *Aufklärungs-Abteilung 3 (mot.)* and *33 (mot.)* of the Afrikakorps and the *Panzer-Aufklärungs-Lehr-Abteilung 130* of the Panzer-Lehr-Division. Overflow uses the divisional *Panzer-Aufklärungs-Abteilung*.

### `GER_AMPH_01` — Amphibious Panzer Units
The four submersible battalions raised in July 1940 for Operation Seelöwe (*Panzer-Abteilung A*–*D*) and the two regiments formed from them, *Panzer-Regiment 18*, which crossed the Bug submerged in June 1941, and *Panzer-Regiment 28*. Overflow uses *Tauchpanzer-Abteilung*, an extrapolated designation.

### `GER_PANZERARTILLERIE_DIVISION_01` — Artillery Divisions
For artillery and self-propelled artillery templates. Covers the *18. Artillerie-Division*, the *Artillerie-Divisionen 309–312*, the *Volks-Artillerie-Korps* of 1944–45 and further *Heeres-Artillerie-Brigaden* (*70*, *88*, *140*, *288*, *704*, *732*, *766*, *777*, *959*).

### `GER_WERFER_01` — Rocket Artillery Brigades
The *Werfer-Brigaden 1–9* (most renamed Volks-Werfer-Brigaden in late 1944) and the *Volks-Werfer-Brigaden 15–20*, then the *Werfer-Regimenter 53*, *54*, *71*, *83* and *84*, *Stellungs-Werfer-Regiment 101*, *Stellungs-Werfer-Brigade 300* and the *Nebel-Lehr-Regiment*. For rocket artillery templates.

### `GER_RESERVE_DIVISION_01` — Reserve Divisions
The real Reserve divisions of 1942–44 (*141.–191.*), including the *188. Reserve-Gebirgs-Division*.

### `GER_VOLKSGRENADIER_01` / `GER_GRENADIER_DIVISION_01` — Volksgrenadier and Grenadier Divisions
The Volksgrenadier divisions in raising order, led by the *78. Volksgrenadier-Division*. The Grenadier list holds the 29th- and 30th-wave *Grenadier-Divisionen 541–562*, which became Volksgrenadier divisions after July 1944.

### `GER_LUFTWAFFEN_FELD_DIVISION_01` — Luftwaffe Field Divisions
*Luftwaffen-Division Meindl* and *Luftwaffen-Feld-Division 1–21*, in the Luftwaffe's own usage before the Heer took them over. The group runs its own number series.

### `GER_FLAK_DIVISION_01` — Flak Divisions
*1.–31. Flak-Division* and the two Flakscheinwerfer divisions. A home is noted where verified (*1. 'Berlin'*, *3. 'Hamburg'*, *7. 'Köln'*, *26. 'München'*, *29. 'Oslo'*), and *9. 'Stalingrad'* marks the division destroyed there. For towed, motorized and self-propelled anti-air templates.

### `GER_GAR_02` — City Garrisons
*Wehrmachtkommandantur Berlin*, *Kommandant von Groß-Paris* and the *Stadtkommandanturen* of occupied and allied capitals and major cities, using German names of the period (*Reval*, *Wilna*, *Agram*, *Laibach*). Overflow uses the numbered *Feldkommandantur*.

### `GER_FORT_01` — Fortress Divisions
The 1945 Festungs-Divisionen (*Danzig*, *Gotenhafen*, *Stettin*), the *41.* and *133. Festungs-Division*, and the fortress cities of 1944–45 (*Breslau*, *Kolberg*, *Tarnopol*). The Atlantikwall fortresses follow (*Lorient*, *St. Nazaire*, *Kanalinseln*). The expansion then runs along the Ostwall and the A–A line (*Archangelsk*–*Astrachan*).

### `GER_KAMPFGRUPPE_01` — Kampfgruppen
About 170 Kampfgruppen named after Heer commanders. They include historical ones such as *Kampfgruppe Chill* and *Kampfgruppe Scherer*. Waffen-SS Kampfgruppen are in the SS file. Typed as infantry only, so the list is chosen by hand.

### `GER_BRIG_01` — Infantry Brigades
Independent brigades for small infantry and motorized templates:
- The *Grenadier-Brigaden* of summer 1944 (*193*, *388*, *1131–1136*) and the *Grenadier-Lehr-Brigade*.
- *Lehr-Brigade (mot.) 900* and the *Schnelle Brigaden* (*20*, *30*, *West*).
- Mountain and ski brigades (*Gebirgsjäger-Brigade 139*, *1. Skijäger-Brigade*, *MG-Ski-Brigade Finnland*); the bicycle brigades are in `GER_RAD_01`.
- *Brigade Lötzen* of 1939 and the *Sicherungs-Brigaden*.
- Luftwaffe and Kriegsmarine ground brigades (*Fallschirmjäger-Brigade Ramcke*, *Marine-Schützen-Brigade Nord*).

Armoured brigades are in `GER_ARM_03`, fortress brigades in `GER_FORT_01`.

### `GER_MEK_01` — Naval Commandos
For naval commando templates: the *Küstenjäger-Abteilung 'Brandenburg'*, the *Marine-Einsatzkommandos* of the Kriegsmarine's Kleinkampfverbände (*20*–*90*), the K-Verband's *Lehrkommandos 600* and *700*, the *1.*, *3.*, *4.* and *5. K-Division* and the *K-Regiment (mot.)*.

### `GER_PEN_01` — Penal Units
Overrides the vanilla group, which has no names. The vanilla focus `GER_strafbataillon` names its penal divisions from this list:
- The probation battalions of the Bewährungstruppe 500 (*Infanterie-Bataillon z.b.V. 500*, *540*, *550*, *560*, *561*).
- *Afrika-Brigade 999* and *Afrika-Division 999*.
- The 23 *Festungs-Infanterie-Bataillone 999* that served in Greece from 1943.

Overflow uses *Bewährungs-Bataillon*, the Wehrmacht's own term.

### Militias
- **`GER_VOLKSSTURM_BATAILLONS_01` (fascism):**
  - *Freikorps 'Adolf Hitler'*.
  - The Tirolean *Standschützen*.
  - One battalion per NSDAP Gau, east to west.
- **`GER_SA_01` (fascism):** *SA-Standarte 'Feldherrnhalle'* and *'Horst Wessel'*, and the SA-Gruppen.
- **`GER_MIL_01` (neutrality):** the Freikorps of 1918–23 (*Freikorps Epp*, *Marine-Brigade Ehrhardt*, *Eiserne Division*). Overrides vanilla.
- **`GER_MIL_02` (vanilla gating):** the colonial Schutztruppen and police forces, and the Ostasiatisches Expeditionskorps. The expansion covers *Mittelafrika* and the Schutztruppe commanders. Vanilla colonial focuses create this group.
- **`GER_MIL_04` (democratic):** *Reichsbanner Schwarz-Rot-Gold*, its Schufo, the Eiserne Front and the Reichsbanner Gaue.
- **`GER_MIL_03` (communism):**
  - *Roter Frontkämpferbund*, *Rote Marine* and *Rote Ruhrarmee*.
  - RFB Gaue following the KPD districts.
  - Overrides vanilla without its focus lock.

### `GER_LEG_01` — Foreign Legions (fascism)
The foreign divisions and legions in German service:
- *250. 'Azul'*, the Croatian *369.*, *373.* and *392.*, and the *Kosaken-Kavallerie-Divisionen*.
- The *Ostlegionen*, *Legion Wallonie*, the LVF and the Indian Legion.

### `GER_SKI_01` — Ski Divisions
Grown from the *1. Skijäger-Division*, the Heer's only ski division (brigade September 1943, division June 1944, Pripjet marshes and Carpathians). The extension names further divisions after winter-sport towns and highland regions (*'Oberhof'*, *'Kitzbühel'*, *'Stubai'*, where the Heeres-Hochgebirgsschule stood) and the Lapland front (*'Lappland'*, *'Salla'*, *'Petsamo'*, *'Kiestinki'*); the *Skijäger-Regimenter 1* and *2* and the *Skijäger-Bataillone* of 1942-43 close the list. For mountain and Jäger templates; kept at 30 names so that it never takes those templates on its own.

### `GER_FJPZ_01` / `GER_FJPZ_02` — Luftwaffe Panzer Divisions (plain / Named)
The Luftwaffe raised the *Fallschirm-Panzer-Division 1 'Hermann Göring'* and a second Panzergrenadier division; these lists extend that into a Luftwaffe armoured arm named by the Geschwader tradition names and the aces the Luftwaffe honoured (*Fallschirm-Panzer-Division 1 'Richthofen'*, *'Boelcke'*, *'Immelmann'*, *'General Wever'*, *'Mölders'*, *'Pik As'*, *'Holzhammer'*) and by aviation pioneers (*'Lilienthal'*, *'Zeppelin'*). The Nazi honour names stay in the fascist-only Elite Formations of the [Heer](Germany) file. The plain list gives bare numbers and shares them with the Named list.

### `GER_PZZUG_01` — Armored Trains
For armoured-car templates. The Wehrmacht's *Eisenbahn-Panzerzüge* on their real numbers and in their order of raising: the 1938-39 trains *1*, *3*, *5*, *6* and *2*, *4*, *7*, *9*-*11*, the captured and rebuilt trains *21*-*32*, *51* and *52*, and the BP 42 series *61*-*84*; then the *Panzertriebwagen 15*-*23* and *30*-*38* and the *Panzerjäger-Triebwagen 51*. The extension names trains after Prussian commanders (*Panzerzug 'Blücher'*, *'Gneisenau'*, *'Yorck'*), which no real train carried.

### `GER_RAD_01` — Bicycle Brigades
For bicycle templates. The *Radfahr-Jäger-Brigade 10* (East Prussia, January 1945) and the *Radfahr-Aufklärungs-Brigade Norwegen* are the real units; the extension raises further brigades named after the flat regions of the Reich and Austria (*Radfahr-Jäger-Brigade 1 'Altmark'*, *'Havelland'*, *'Münsterland'*, *'Marchfeld'*). Germany never formed a bicycle division, so the list stays at brigade level.

### `GER_STURM_01` — Imperial Storm Battalions (neutrality/democratic)
The army-level assault battalions of 1916–18, *Sturm-Bataillon Nr. 1* to *Nr. 18*, with *Sturm-Bataillon Nr. 5 (Rohr)*, *Jäger-Sturm-Bataillon Nr. 3* and the Bavarian *Nr. 6* and *Nr. 15*. Number 13 never grew beyond a company and is left to the overflow.

### `GER_MONRES_01` — Imperial Reserve Divisions (neutrality/democratic)
The Reserve divisions of 1914–18 on their real numbers (*1.* to *82. Reserve-Division*), for the Imperial path:
- The Saxon *23.* and *24.* and the *26. (Württembergische) Reserve-Division* with their state names.
- The seven Bavarian Reserve divisions in their own series (*1. Kgl. Bayer. Reserve-Division* to *39.*).
- The Ersatz divisions (*4.*, *5.*, *8.*, *10.* and *19. Ersatz-Division*, and the *Kgl. Bayer. Ersatz-Division*).

The Guard Reserve divisions are in the Guard list of the [Heer](Germany) file.

### `GER_LANDWEHR_01` — Imperial Landwehr Divisions (neutrality/democratic)
The Landwehr divisions of 1914–18 on their real numbers (*1.* to *85. Landwehr-Division*), a second-line list for the Imperial path:
- The Württemberg (*2.*, *7.*, *26.*) and Saxon (*45.–47.*) divisions with their state names.
- The three Bavarian Landwehr divisions.
- The divisions of 1914–15 under the names of their first commanders (*Landwehr-Division Goltz*, *Landwehr-Division Bredow*).
