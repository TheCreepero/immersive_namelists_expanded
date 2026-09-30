# Germany — Heer

**Country Tag:** `GER` | **Source File:** [`INEX_GER_names_divisions.txt`](../common/units/names_divisions/INEX_GER_names_divisions.txt)

> **Note on German files:** Germany is split across three files. See also [Waffen-SS](Germany-Waffen-SS) and [Additional Formations](Germany-Additional).

---

## Historical Overview

The Wehrmacht numbered its divisions in one series across branch types and raised them in waves (*Aufstellungswellen*), so numbers were not issued in order: after 1.–36. came 44., 45., 46., 61., 50. and so on. INEX keeps that raising order. Every infantry-type list shares the `GER_Inf_01` numbering, so *29. Infanterie-Division (mot.) 'Falke'* and *29. Panzergrenadier-Division 'Falke'* are the same division.

Infantry, motorized, Panzergrenadier and Panzer divisions each come as a pair:
- **Plain list** (vanilla tag): numbers only, in historical raising order.
- **Named list**: the same numbers, each with one identity used across every list. The identity is a verified nickname or emblem (*12. Infanterie-Division 'Wilder Stier'*, *7. Panzer-Division 'Gespenster'*), otherwise the division's formation city or training ground (*1. Infanterie-Division 'Königsberg'*). Divisions without a verified, unique identity are left out of the Named list.

The basic lists are open to every government. Ideology-gated lists:
- **Fascist:** the Heer and Luftwaffe honour formations (*Großdeutschland*, *Feldherrnhalle*, *Hermann Göring*).
- **Monarchist (neutrality/democratic):** Imperial regiments and the Prussian Guard.
- **Democratic:** a republican army named after 1813, 1848/49 and Weimar figures.
- **Communist:** a Red Army named after German revolutionaries.

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
| `GER_MAR_01` | Marine Divisions | marine | `%d. Seelande-Division` |
| `GER_GAR_01` | Garrison Divisions | infantry | `%d. Sicherungs-Division` |
| `GER_ELI_01` | Elite Formations | infantry, motorized, mechanized, light_armor, medium_armor, heavy_armor, modern_armor | `Division 'Feldherrnhalle %d'` |
| `GER_MEC_01_MONARNCHIST` | Guard Divisions | infantry, motorized, mechanized, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Garde-Division` |
| `GER_MONINF_01` | Imperial Infantry Divisions | infantry, mechanized, mountaineers, paratrooper, marine | `%d. Division` |
| `GER_MONMOB_01` | Imperial Mobile Divisions | cavalry, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Schnell-Division` |
| `GER_Arm_01_ANTIFASCIST` | Republican Divisions | infantry, motorized, mechanized, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Reichswehr-Division` |
| `GER_MEC_01_COMMUNIST` | Red Army Divisions | infantry, motorized, mechanized, marine, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Rote Division` |

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
- **1945 named divisions:** *Panzer-Division Holstein*, *Müncheberg*, *Jüterbog*, *Clausewitz*, *Norwegen*.

The expansion keeps 31 names from the earlier INEX list (*'Donnerkeil'*, *'Stahlross'*). It then follows the 1945 practice of naming divisions after training grounds (*Panzer-Division Döberitz*, *Wünsdorf*).

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
Germany never had a true marine corps, so the list keeps the vanilla *Seelande-Division*. It opens with the Marinekorps Flandern divisions of 1914–18. It continues with:
- the Seebataillon and naval tradition: *'Kiautschou'*, *'Ösel'*, *'Skagerrak'*, *'Graf Spee'*, *'Graf Luckner'*;
- kept names: *'Seeteufel'*.

### `GER_GAR_01` — Garrison Divisions
Sicherungs, Feldausbildungs and Ausbildungs divisions and the Divisionen z.b.V. Reserve and Festung divisions have their own lists in the Additional file.

### `GER_ELI_01` — Elite Formations (fascism)
*Großdeutschland*, *Feldherrnhalle* (Panzer-Division FHH 1 and 2), *Hermann Göring*, the *Führer-Begleit-* and *Führer-Grenadier-Division*, and *Infanterie-Division Schlageter*. Overflow continues the numbered Feldherrnhalle series.

### `GER_MEC_01_MONARNCHIST` — Guard Divisions (neutrality / democratic)
The Prussian Garde-Korps (*1.–5. Garde-Infanterie-Division*, *Garde-Füsilier-Division 'Maikäfer'*) and the Leib regiments of the other German states. The expansion is named after residences and orders (*'Sanssouci'*, *'Schwarzer Adler'*). Overrides the focus-locked vanilla group.

### `GER_MONINF_01` / `GER_MONMOB_01` — Imperial Divisions (neutrality / democratic)
The Imperial infantry and cavalry regiments of 1914, raised to divisions with their honour titles (*'König Friedrich der Große'*, *Leib-Husaren-Division*). Guard and Leib regiments moved to the Guard list.

### `GER_Arm_01_ANTIFASCIST` — Republican Divisions (democratic)
A Weimar Reichswehr named after 1813, 1848/49 and Weimar figures (*'Schwarz-Rot-Gold'*, *'Paulskirche'*, *'Friedrich Ebert'*, *'Freiherr vom Stein'*).

### `GER_MEC_01_COMMUNIST` — Red Army Divisions (communism)
The *Volksmarinedivision* and the Bavarian Red Army, then divisions named after German revolutionaries and International Brigades figures (*'Spartakus'*, *'Karl Liebknecht'*, *'Ernst Thälmann'*, *'Hans Beimler'*).
