# Germany — Waffen-SS

**Country Tag:** `GER` | **Source File:** [`INEX_GER_SS_names_divisions.txt`](../common/units/names_divisions/INEX_GER_SS_names_divisions.txt)

> See also: [Heer](Germany) and [Additional Formations](Germany-Additional).

---

## Historical Overview

The Waffen-SS grew from a small guard formation into 38 numbered divisions by 1945, and three more were planned. Every group in this file is fascist-only (`has_government = fascism`).

The type lists (infantry, motorized, Panzergrenadier, Panzer, mountain, cavalry) link to `GER_SS_01`, so every SS division keeps one number across its forms: *1. SS-Division (mot.)* becomes *1. SS-Panzer-Division 'Leibstandarte SS Adolf Hitler'*. Historical divisions sit on their real numbers.

Numbers 23, 29, 30 and 33 were reassigned during the war, so two different divisions share each of them, as they did historically.

From number 42 upward, every SS list carries the same honour name for the same number. Whichever type claims a number gets its name. The sequence starts with the names of SS regiments and Standarten (*Deutschland*, *Germania*, *Der Führer*, *Westland*, *Norge*, *Danmark*). It then continues with the Germanic and heraldic names kept from the earlier INEX lists (*Siegfried*, *Walhalla*, *Eichenschild*).

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `GER_SS_01` | SS Divisions | infantry, motorized, medium_armor, mechanized | `%d. SS-Division` |
| `GER_SS_02` | SS Infantry Divisions | infantry | `%d. SS-Grenadier-Division` |
| `GER_SS_03` | SS Motorized Divisions | motorized | `%d. SS-Division (mot.)` |
| `GER_SS_04` | SS Panzergrenadier Divisions | mechanized | `%d. SS-Panzergrenadier-Division` |
| `GER_SS_05` | SS Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. SS-Panzer-Division` |
| `GER_SS_06` | SS Mountain Divisions | mountaineers | `%d. SS-Gebirgs-Division` |
| `GER_SS_07` | SS Cavalry Divisions | cavalry | `%d. SS-Kavallerie-Division` |
| `GER_SS_08` | SS Heavy Panzer Battalions | heavy_armor, medium_armor, modern_armor | `schwere SS-Panzer-Abteilung %d` |
| `GER_SS_09` | SS Kampfgruppen | infantry, motorized, mechanized, light_armor, medium_armor, heavy_armor | `SS-Kampfgruppe %d` |
| `GER_SS_STANDARTE_01` | SS Standarten | infantry | `%d. SS-Standarte` |

---

## Group Details

### `GER_SS_01` — SS Divisions
Overrides vanilla `GER_SS_01`, which vanilla focuses and SS scripted effects use to create divisions. It holds all 38 divisions with their final honour titles, the planned *39. 'Andreas Hofer'*, *40. 'Feldherrnhalle'* and *41. 'Kalevala'*, and the shared extension.

### `GER_SS_02` — SS Infantry Divisions
The SS divisions that served as infantry or grenadiers, in their exact designations:
- *4. SS-Polizei-Division* and *35. SS- und Polizei-Grenadier-Division*.
- The Waffen-Grenadier-Divisionen der SS, for example *15. (lettische Nr. 1)* and *33. 'Charlemagne'*.
- The SS-Freiwilligen-Grenadier-Divisionen, for example *27. 'Langemarck'*.

### `GER_SS_03` / `GER_SS_04` / `GER_SS_05` — SS Motorized, Panzergrenadier and Panzer Divisions
The 1940–42 motorized forms (*SS-Division (mot.) 'Wiking'*), the 1942–45 Panzergrenadier forms (*11. SS-Freiwilligen-Panzergrenadier-Division 'Nordland'*) and the seven SS Panzer divisions.

### `GER_SS_06` / `GER_SS_07` — SS Mountain and Cavalry Divisions
Mountain:
- *6. SS-Gebirgs-Division 'Nord'* and *7. 'Prinz Eugen'*.
- The Waffen-Gebirgs-Divisionen *'Handschar'*, *'Skanderbeg'* and *'Kama'*, and the *Karstjäger*.

Cavalry:
- *8. SS-Kavallerie-Division 'Florian Geyer'*, *22. 'Maria Theresia'* and *37. 'Lützow'*.

### `GER_SS_08` — SS Heavy Panzer Battalions
*schwere SS-Panzer-Abteilung 501–503*, formed as 101–103 and each attached to its SS Panzer corps. The plausible expansion adds battalions for the IV. and XI. SS-Panzerkorps.

### `GER_SS_09` — SS Kampfgruppen
Historical Waffen-SS Kampfgruppen (*Kampfgruppe Peiper*, *Hansen*, *Knittel*), then SS division commanders.

### `GER_SS_STANDARTE_01` — SS Standarten
The SS-Verfügungstruppe Standarten (*Deutschland*, *Germania*, *Der Führer*), the *SS-Totenkopfstandarten I–XVI*, and the Allgemeine-SS *1. SS-Standarte 'Julius Schreck'*.
