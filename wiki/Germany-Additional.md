# Germany — Additional Formations

**Country Tag:** `GER` | **Source File:** [`INEX_GER_ADDITIONAL_names_divisions.txt`](../common/units/names_divisions/INEX_GER_ADDITIONAL_names_divisions.txt)

> See also: [Wehrmacht Regular](Germany) and [Waffen-SS](Germany-Waffen-SS).

---

## Historical Overview

This file covers the specialized, late-war, and niche German formations that don't fit the core numbered division series: heavy tank battalions (*schwere Panzerabteilungen*), reserve and security divisions, Luftwaffe field divisions, Volksgrenadier, Volkssturm, Festung (fortress) garrisons, Kampfgruppen, and Flak (anti-aircraft) divisions.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `GER_SCHWERE_PANZERABTEILUNG_01` | Schwere Panzerabteilung | heavy_armor, medium_armor, modern_armor | `schwere Panzerabteilung %d` |
| `GER_SCHWERE_PANZERABTEILUNG_02` | Schwere Panzerabteilung (Short) | heavy_armor, medium_armor, modern_armor | `sPz Abt %d` |
| `GER_PANZERARTILLERIE_DIVISION_01` | Panzerartillerie Division | heavy_armor, medium_armor, light_armor, modern_armor | `%d. Panzerartillerie-Division` |
| `GER_RESERVE_DIVISION_01` | Reserve Divisions | infantry | `%d. Reserve-Division` |
| `GER_LUFTWAFFEN_FELD_DIVISION_01` | Luftwaffe Field Divisions | infantry | `Luftwaffen-Feld-Division %d` |
| `GER_VOLKSGRENADIER_01` | Volksgrenadier Divisions | infantry | `%d. Volks-Grenadier-Division` |
| `GER_GRENADIER_DIVISION_01` | Grenadier Divisions | infantry | `%d. Grenadier-Division` |
| `GER_GAR_02` | City Garrisons | infantry | `%d. Garnisonkommando` |
| `GER_VOLKSSTURM_BATAILLONS_01` | Volkssturm Battalions | infantry | `%d. Volkssturm-Bataillon` |
| `GER_FLAK_DIVISION_01` | Flak Divisions | infantry | `%d. Flak-Division` |

> **Note:** `GER_SCHWERE_PANZERABTEILUNG_01` and `_02` are linked (`link_numbering_with`) to share the historical 501–510 numbering series in both long and short display formats.

> **Note:** `GER_PANZERARTILLERIE_DIVISION_01` uses `can_use = { is_ai = no }` — it is only available to human players.

---

## Group Details

### `GER_SCHWERE_PANZERABTEILUNG_01` / `_02` — Heavy Tank Battalions
Covers the independent heavy tank battalions (*schwere Panzerabteilungen*) numbered 501–510, which operated Tiger I and Tiger II (King Tiger) tanks. Two linked groups provide long-form (*schwere Panzerabteilung 501*) and short-form (*sPz Abt 501*) display names. The `link_numbering_with` ensures the two lists share a single numbering pool.

### `GER_PANZERARTILLERIE_DIVISION_01` — Panzerartillerie Divisions
Player-only armored artillery division designations. Human-only (`is_ai = no`).

### `GER_RESERVE_DIVISION_01` — Reserve Divisions
Replacement and reserve infantry divisions (*Reserve-Divisionen*) used for occupation, training, and anti-partisan duties. Numbered in the 100s series historically.

### `GER_LUFTWAFFEN_FELD_DIVISION_01` — Luftwaffe Field Divisions
The 22 *Luftwaffen-Feld-Divisionen* formed in 1942–43 from surplus Luftwaffe ground personnel. These divisions were initially outside Wehrmacht command and had a poor combat reputation before being transferred to Army command in late 1943.

### `GER_VOLKSGRENADIER_01` — Volksgrenadier Divisions
Late-war *Volksgrenadier-Divisionen* (*Volks-Grenadier-Division*) — rebuilt or newly raised divisions from autumn 1944 onward. Named differently from standard infantry to reflect the National Socialist propaganda framing.

### `GER_GRENADIER_DIVISION_01` — Grenadier Divisions
Mid-war *Grenadier-Divisionen*, a redesignation of infantry divisions introduced in 1942 that later reverted or upgraded.

### `GER_GAR_02` — City Garrisons (Garnisonkommando)
Urban garrison commands (*Garnisonkommando*) assigned to hold specific cities and fortified positions. Covers major German city garrisons and fortress zones.

### `GER_VOLKSSTURM_BATAILLONS_01` — Volkssturm Battalions
The *Volkssturm* — the German national militia, levied in October 1944 from men not previously eligible for service. Organized at district (*Kreis*) and regional (*Gau*) level. These represent the last-ditch manpower of Nazi Germany in HoI4 terms.

### `GER_FLAK_DIVISION_01` — Flak Divisions
The *Flak-Divisionen* — large anti-aircraft formations that also provided significant anti-tank firepower on the Eastern and Western Fronts. Germany fielded up to 18 numbered Flak divisions.

