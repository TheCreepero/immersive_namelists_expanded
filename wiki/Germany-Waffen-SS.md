# Germany — Waffen-SS

**Country Tag:** `GER` | **Source File:** [`INEX_GER_SS_names_divisions.txt`](../common/units/names_divisions/INEX_GER_SS_names_divisions.txt)

> See also: [Wehrmacht Regular](Germany) and [Additional Formations](Germany-Additional).

---

## Historical Overview

The Waffen-SS grew from a small personal guard into a multi-ethnic force of 38 numbered divisions by 1945. INEX provides the full vanilla override (`GER_SS_01`) with all 38 historical divisions plus extensive alt-history expansions, as well as four separate type-specific groups (infantry, motorized, mechanized, armored) and a pre-war *SS-Standarte* regimental list.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `GER_SS_01` | SS Divisions (Vanilla override) | infantry, motorized, medium_armor, mechanized | `%d. SS-Division` |
| `GER_SS_02` | SS Infantry Divisions | infantry | `%d. SS-Infanterie-Division` |
| `GER_SS_03` | SS Motorized Divisions | motorized | `%d. SS-Motorisierte-Division` |
| `GER_SS_04` | SS Mechanized Divisions | mechanized | `%d. SS-Panzergrenadier-Division` |
| `GER_SS_05` | SS Armoured Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. SS-Panzer-Division` |
| `GER_SS_STANDARTE_01` | SS-Standarte | infantry | `%d. SS-Standarte` |

---

## Group Details

### `GER_SS_01` — SS Divisions (Vanilla override)
Overrides the base-game `GER_SS_01`. Contains all 38 historical Waffen-SS numbered divisions plus an extended alt-history series (entries 39–100+).

Historical entries include:
| # | Name |
|:--|:---|
| 1 | *Leibstandarte Adolf Hitler* |
| 2 | *Das Reich* |
| 3 | *Totenkopf* |
| 4 | *Polizei* |
| 6 | *Nord* |
| 7 | *Prinz Eugen* |
| 8 | *Florian Geyer* |
| 9 | *Hohenstaufen* |
| 10 | *Frundsberg* |
| 11 | *Nordland* |
| 12 | *Hitlerjugend* |
| 13 | *Handschar* |
| 14 | (ukrain. Nr. 1) |
| 16 | *Reichsführer-SS* |
| 17 | *Götz von Berlichingen* |
| 18 | *Horst Wessel* |
| 21 | *Skanderbeg* |
| 22 | *Maria Theresia* |
| 24 | *Karstjäger* |
| 25 | *Hunyadi* |
| 29 | RONA (russische Nr. 1) |
| 30 | (russisch Nr. 2) |
| 32 | *30. Januar* |
| 34 | *Landstorm Nederland* |
| 36 | *Dirlewanger* |
| 37 | *Lützow* |
| 38 | *Nibelungen* |

Alt-history continuation (entries 39–100+) uses evocative Germanic names (*Siegfried*, *Wotan*, *Odin*, *Walhalla*, *Donnerschlag*, *Sturmfalken*, etc.).

### `GER_SS_02` — SS Infantry Divisions
Pure infantry-typed SS formations for players preferring type-matched namelist selection.

### `GER_SS_03` — SS Motorized Divisions
Motorized SS formations using the *SS-Motorisierte-Division* designation, reflecting the early-war motor-infantry doctrine before the Panzergrenadier redesignation.

### `GER_SS_04` — SS Mechanized / Panzergrenadier Divisions
Mechanized SS formations under the *SS-Panzergrenadier-Division* title used from 1943 onward.

### `GER_SS_05` — SS Armoured Divisions (Panzer)
The SS panzer divisions. Historically the premier armored formations of the Wehrmacht, including *Leibstandarte*, *Das Reich*, *Totenkopf*, *Hohenstaufen*, *Frundsberg*, and *Hitlerjugend* as the named panzer-type entries.

### `GER_SS_STANDARTE_01` — SS-Standarte
Pre-war and early-war regimental-level SS formations (*Standarten*), before the division-level expansion of the Waffen-SS.

