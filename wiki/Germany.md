# Germany — Heer

**Country Tag:** `GER` | **Source File:** [`zz_INEX_GER_names_divisions.txt`](../common/units/names_divisions/zz_INEX_GER_names_divisions.txt)

> **Note on German files:** Germany is split across three files. See also [Waffen-SS](Germany-Waffen-SS) and [Additional Formations](Germany-Additional).

---

## Historical Overview

The Wehrmacht numbered its divisions in one series across branch types and raised them in waves (*Aufstellungswellen*), so numbers were not issued in order: after 1.–36. came 44., 45., 46., 61., 50. and so on. INEX keeps that raising order. Every infantry-type list shares the `GER_Inf_01` numbering, so *29. Infanterie-Division (mot.) 'Falke'* and *29. Panzergrenadier-Division 'Falke'* are the same division.

Infantry, motorized, Panzergrenadier and Panzer divisions each come as a pair:
- **Plain list** (vanilla tag): numbers only, in historical raising order.
- **Named list**: the same numbers, each with one identity used across every list. The identity is a verified nickname or emblem (*12. Infanterie-Division 'Wilder Stier'*, *7. Panzer-Division 'Gespenster'*), otherwise the division's formation city or training ground (*1. Infanterie-Division 'Königsberg'*). Divisions without a verified, unique identity are left out of the Named list.

The basic lists, coastal defense and border guard included, are open to every government. Ideology-gated lists:
- **Fascist:** the Heer and Luftwaffe honour formations (*Großdeutschland*, *Feldherrnhalle*, *Hermann Göring*).
- **Monarchist (neutrality/democratic):**
  - Imperial regiments and the Prussian Guard;
  - the Jäger and the Alpenkorps;
  - Kampfwagen divisions named after the A7V tanks;
  - the Seebataillone.
- **Democratic:**
  - a republican army named after 1813, 1848/49 and Weimar figures;
  - the Reichswehr's Land divisions and the Volkswehr;
  - Panzer divisions named after democrats from 1848 to the resistance.
- **Communist:**
  - a Red Army named after German revolutionaries;
  - workers' divisions from the risings of 1920–23;
  - Red Panzer divisions and Red sailors.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `GER_Inf_01` | Infantry Divisions | infantry | `%d. Infanterie-Division` |
| `GER_INF_02` | Infantry Divisions (Named) | infantry | `%d. Infanterie-Division` |
| `GER_ALTINF_01` | Special Infantry Divisions | infantry | `%d. Infanterie-Division` |
| `GER_LTINF_01` | Light Infantry Divisions | infantry | `%d. Jäger-Division` |
| `GER_MOT_01` | Motorized Divisions | motorized | `%d. Infanterie-Division (mot.)` |
| `GER_MOT_02` | Motorized Divisions (Named) | motorized | `%d. Infanterie-Division (mot.)` |
| `GER_MEC_01` | Panzergrenadier Divisions | mechanized | `%d. Panzergrenadier-Division` |
| `GER_MEC_02` | Panzergrenadiers (Named) | mechanized | `%d. Panzergrenadier-Division` |
| `GER_Arm_01` | Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panzer-Division` |
| `GER_Arm_02` | Panzer Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panzer-Division` |
| `GER_LTARM_01` | Light Divisions | light_armor | `%d. leichte Division` |
| `GER_Cav_01` | Cavalry Divisions | cavalry | `%d. Kavallerie-Division` |
| `GER_Mnt_01` | Mountain Divisions | mountaineers | `%d. Gebirgs-Division` |
| `GER_PAR_01` | Paratrooper Divisions | paratrooper | `%d. Fallschirmjäger-Division` |
| `GER_MAR_01` | Marine Divisions | marine | `%d. Marine-Infanterie-Division` |
| `GER_GAR_01` | Garrison Divisions | infantry | `%d. Sicherungs-Division` |
| `GER_COAST_01` | Coastal Defense Divisions | infantry | `%d. Küstenverteidigungs-Division` |
| `GER_BORDER_01` | Border Guard Divisions | infantry | `%d. Grenzwacht-Division` |
| `GER_ELI_01` | Elite Formations | infantry, motorized, mechanized, light_armor, medium_armor, heavy_armor, modern_armor | `Division 'Feldherrnhalle %d'` |
| `GER_MEC_01_MONARNCHIST` | Guard Divisions | infantry, motorized, mechanized, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Garde-Division` |
| `GER_MONINF_01` | Imperial Infantry Divisions | infantry, mechanized, mountaineers, paratrooper, marine | `%d. Division` |
| `GER_MONMOB_01` | Imperial Mobile Divisions | cavalry, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Schnell-Division` |
| `GER_MONJAG_01` | Imperial Jäger Divisions | infantry, ranger_battalion, mountaineers | `%d. Jäger-Division` |
| `GER_MONPZ_01` | Imperial Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Kampfwagen-Division` |
| `GER_MONMAR_01` | Imperial Marine Divisions | marine | `%d. Marine-Division` |
| `GER_Arm_01_ANTIFASCIST` | Republican Divisions | infantry, motorized, mechanized, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Reichswehr-Division` |
| `GER_REPINF_01` | Reichswehr Divisions | infantry | `%d. Division` |
| `GER_REPDEF_01` | Volkswehr Divisions | infantry, motorized | `%d. Volkswehr-Division` |
| `GER_REPPZ_01` | Republican Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panzer-Division` |
| `GER_MEC_01_COMMUNIST` | Red Army Divisions | infantry, motorized, mechanized, marine, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Rote Division` |
| `GER_REDINF_01` | Workers' Divisions | infantry, militia | `%d. Arbeiter-Division` |
| `GER_REDPZ_01` | Red Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Rote Panzer-Division` |
| `GER_REDMAR_01` | Red Sailor Divisions | marine | `%d. Matrosen-Division` |

---

## Group Details

### `GER_Inf_01` / `GER_INF_02` — Infantry Divisions (plain / Named)
The plain list holds the 254 vanilla division numbers in raising order, from the peacetime cadres to the 35th wave. The Named list (135 entries) keeps that order and adds each division's identity:
- **Nicknames and emblems:** *44. 'Hoch- und Deutschmeister'*, *26. 'Kölner Dom'*, *205. 'Fliegenpilz'*, *70. 'Weißbrot'*, *719. 'Sitzender Hase'*.
- **Formation cities and training grounds:** *5. 'Ulm'*, *161. 'Arys'*.

### `GER_ALTINF_01` — Special Infantry Divisions
Air-landing (*22. Infanterie-Division (Luftlande)*), *78. Sturm-Division*, *44. Reichsgrenadier-Division 'Hoch- und Deutschmeister'*, the 1945 Marine-Infanterie and Luftwaffen-Sturm divisions, and the named divisions of 1944–45 (*Infanterie-Division Scharnhorst*, *Ulrich von Hutten*, *Theodor Körner*, *Kurland*). Volksgrenadier divisions are in the Additional file.

### `GER_LTINF_01` — Light Infantry Divisions (Jäger)
The eleven Jäger divisions (*97. Jäger-Division 'Spielhahnjäger'*), then a plausible expansion named after German forests and uplands (*'Eifel'*, *'Rominter Heide'*).

### `GER_MOT_01` / `GER_MOT_02` — Motorized Divisions (plain / Named)
The 1937–43 motorized infantry divisions and the *90.* and *164. leichte Afrika-Division*. The Named list continues with the first-wave peacetime divisions, motorized under their own identities.

### `GER_MEC_01` / `GER_MEC_02` — Panzergrenadier Divisions (plain / Named)
The 1943–45 Panzergrenadier divisions (*15. 'Sizilien'*, *90. 'Sardinien'*, *Panzergrenadier-Division Brandenburg*, *Kurmark*). The Named list then continues with the other motorized and first-wave divisions.

### `GER_Arm_01` / `GER_Arm_02` — Panzer Divisions (plain / Named)
Named identities include:
- **Emblems and nicknames:** *3. 'Berliner Bär'*, *7. 'Gespenster'*, *116. 'Windhund'*.
- **Formation cities:** *1. 'Weimar'*. A division converted from an infantry division keeps its predecessor's city (*14. 'Dresden'* from 4. Infanterie-Division).
- **Named divisions of 1939–45:** *Panzer-Division Kempf*, *Norwegen*, *Holstein*, *Müncheberg*, *Jüterbog*, *Clausewitz*.

The expansion keeps 28 names from the earlier INEX list (*'Donnerkeil'*, *'Stahlross'*). It then follows the 1945 practice of naming divisions after training grounds (*Panzer-Division Döberitz*, *Wünsdorf*).

### `GER_LTARM_01` — Light Divisions
The four *leichte Divisionen* of 1938–39 and the *5. leichte Division* of the Afrikakorps. Each is keyed by the number of the Panzer division it became.

### `GER_Cav_01` — Cavalry Divisions
*1. Kavallerie-Division 'Insterburg'*, the 1945 cavalry divisions and the army group cavalry regiments (*Kavallerie-Regiment Mitte*). The expansion is named after state studs and cavalry schools (*'Trakehnen'*, *'Krampnitz'*).

### `GER_Mnt_01` — Mountain Divisions
*1. Gebirgs-Division 'Edelweiß'*, *4. 'Enzian'*, *5. 'Gams'*, the *1. Skijäger-Division* and *Gebirgs-Division Steiermark*. The expansion covers Gebirgsjäger garrisons and peaks (*'Mittenwald'*, *'Zugspitze'*).

### `GER_PAR_01` — Paratrooper Divisions
Opens with the *7. Flieger-Division*. The Fallschirmjäger divisions carry:
- **Commanders or battle honours:** *1. 'Kreta'*, *7. 'Erdmann'*.
- **Names kept from the earlier INEX list:** *'Himmelsstürmer'*.
- **Airborne operations** in the expansion: *'Eben-Emael'*, *'Monte Cassino'*.

### `GER_MAR_01` — Marine Divisions
Germany never had a true marine corps. The list opens with the *Marine-Divisionen* of the Marinekorps Flandern (1914–18). The rest are *Marine-Infanterie-Divisionen*, the designation of the Kriegsmarine's divisions of 1945, in place of the vanilla coinage *Seelande-Division*. It continues with:
- the Seebataillon and naval tradition: *'Kiautschou'*, *'Ösel'*, *'Skagerrak'*, *'Graf Spee'*, *'Graf Luckner'*;
- kept names: *'Seeteufel'*.

### `GER_GAR_01` — Garrison Divisions
Sicherungs, Feldausbildungs and Ausbildungs divisions and the Divisionen z.b.V. Reserve and Festung divisions have their own lists in the Additional file.

### `GER_COAST_01` — Coastal Defense Divisions
Opens with the static divisions that held the coasts of France, the Low Countries, the Channel Islands and Norway (*716. (bodenständige) Infanterie-Division*, *709.*, *319.*). The expansion is named after the *Küstenverteidigung*, the coastal defence command of 1916–19, and runs along the German coasts from *'Sylt'* to the *'Kurische Nehrung'*. Fortress cities are in the Fortress list of the Additional file.

### `GER_BORDER_01` — Border Guard Divisions
Opens with the border commands of 1939 that became divisions and corps (*Grenzwacht-Abschnittskommando 9*, *Grenzkommandantur Küstrin*). Then come:
- the *Grenzwacht* of the western border, from *'Emsland'* to *'Hegau'*;
- the *Grenzschutz* of the eastern and southern border, from *'Elchniederung'* to *'Berchtesgadener Land'*.

### `GER_ELI_01` — Elite Formations (fascism)
*Großdeutschland*, *Feldherrnhalle* (Panzer-Division FHH 1 and 2), *Hermann Göring*, the *Führer-Begleit-* and *Führer-Grenadier-Division*, *Infanterie-Division Schlageter* and the *Legion Condor*. Overflow continues the numbered Feldherrnhalle series.

### `GER_MEC_01_MONARNCHIST` — Guard Divisions (neutrality / democratic)
The Prussian Garde-Korps (*1.–5. Garde-Infanterie-Division*, *Garde-Füsilier-Division 'Maikäfer'*) and the Leib regiments of the other German states. The expansion is named after residences and orders (*'Sanssouci'*, *'Schwarzer Adler'*). Overrides the focus-locked vanilla group.

### `GER_MONINF_01` / `GER_MONMOB_01` — Imperial Divisions (neutrality / democratic)
The Imperial infantry and cavalry regiments of 1914, raised to divisions with their honour titles (*'König Friedrich der Große'*, *Leib-Husaren-Division*). Guard and Leib regiments moved to the Guard list.

### `GER_MONJAG_01` — Imperial Jäger Divisions (neutrality / democratic)
The Jäger-Bataillone Nr. 1–15 of 1914, raised to divisions on their numbers and titles (*1. Jäger-Division 'Graf Yorck von Wartenburg'*, *2. Pommersche Jäger-Division 'Fürst Bismarck'*). They are followed by:
- the Bavarian Jäger, the *Deutsches Alpenkorps* and the Württemberg mountain troops;
- divisions named after the Alpenkorps' commander and battles (*'Karfreit'*, *'Kemmel'*).

### `GER_MONPZ_01` — Imperial Panzer Divisions (neutrality / democratic)
An Imperial tank arm grown from the A7V detachments of 1918. Its *Kampfwagen-Divisionen* carry the names painted on the A7V tanks (*'Gretchen'*, *'Mephisto'*, *'Alter Fritz'*) and the names of their actions (*'Villers-Bretonneux'*). The A7V names *Siegfried* and *Wotan* are left out, because the Waffen-SS file already uses them.

### `GER_MONMAR_01` — Imperial Marine Divisions (neutrality / democratic)
The Kaiserliche Marine's naval infantry: the *I.–III. Seebataillon*, the *Marine-Expeditionskorps* of 1904 and the *Marinekorps Flandern*. *Marine-Divisionen* named after their stations and battles follow (*'Tsingtau'*, *'Taku'*, *'Nieuport'*).

### `GER_Arm_01_ANTIFASCIST` — Republican Divisions (democratic)
A Weimar Reichswehr named after 1813, 1848/49 and Weimar figures (*'Schwarz-Rot-Gold'*, *'Paulskirche'*, *'Friedrich Ebert'*, *'Freiherr vom Stein'*).

### `GER_REPINF_01` — Reichswehr Divisions (democratic)
The seven divisions of the 1921 Reichsheer on their numbers (*7. (Bayerische) Division*). The expansion raises one division for each of the other Länder, then one for each Prussian province (*8. (Badische) Division*, *19. (Ostpreußische) Division*). It writes the Land in brackets, as the Reichswehr's regiments did.

### `GER_REPDEF_01` — Volkswehr Divisions (democratic)
Opens with the *Republikanische Soldatenwehr* of 1918–19 and the Prussian *Schutzpolizei*. *Volkswehr-Divisionen* follow, named after the Länder and the Republic's defenders (*'Otto Braun'*, *'Albert Grzesinski'*, *'Weimarer Koalition'*).

### `GER_REPPZ_01` — Republican Panzer Divisions (democratic)
Panzer divisions named after:
- the revolution of 1848/49 (*'Franz Sigel'*, *'Rastatt'*);
- the liberals of the Empire (*'Rudolf Virchow'*);
- the Weimar Republic;
- the democratic resistance (*'Julius Leber'*, *'Weiße Rose'*).

### `GER_MEC_01_COMMUNIST` — Red Army Divisions (communism)
The *Volksmarinedivision* and the Bavarian Red Army, then divisions named after German revolutionaries and International Brigades figures (*'Spartakus'*, *'Karl Liebknecht'*, *'Ernst Thälmann'*, *'Hans Beimler'*).

### `GER_REDINF_01` — Workers' Divisions (communism)
*Arbeiter-Divisionen* named after:
- the towns of the Rote Ruhrarmee of 1920 (*'Essen'*, *'Remscheid'*);
- the Märzkämpfe of 1921;
- the Hamburg rising of 1923 (*'Barmbek'*);
- the KPD's strongholds (*'Wedding'*).

### `GER_REDPZ_01` — Red Panzer Divisions (communism)
*Rote Panzer-Divisionen* named after:
- revolutions and risings (*'Novemberrevolution'*, *'Leuna'*);
- the Peasants' War (*'Bundschuh'*);
- the International Brigades (*'Tschapaiew'*);
- the communist resistance (*'Anton Saefkow'*, *'Rote Kapelle'*).

### `GER_REDMAR_01` — Red Sailor Divisions (communism)
*Matrosen-Divisionen* named after the naval mutinies of 1917 and 1918 (*'Max Reichpietsch'*, *'Albin Köbis'*) and the Volksmarinedivision of 1918–19.
