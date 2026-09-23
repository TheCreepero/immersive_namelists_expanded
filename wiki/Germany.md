# Germany — Wehrmacht (Regular)

**Country Tag:** `GER` | **Source File:** [`INEX_GER_names_divisions.txt`](../common/units/names_divisions/INEX_GER_names_divisions.txt)

> **Note on German files:** Germany is split across three files for organization. See also [Waffen-SS](Germany-Waffen-SS) and [Additional Formations](Germany-Additional).

---

## Historical Overview

The Wehrmacht's divisional naming system evolved throughout the war from the original Heer Wellen (waves) — peacetime cadres through reserve and replacement formations. INEX provides complete coverage of numbered infantry, armored, and specialized divisions including Jäger (light infantry), Gebirgsjäger (mountain), Fallschirmjäger (paratroopers), and cavalry, plus alternate-history monarchist formations.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `GER_Inf_01` | Infantry Divisions | infantry | `%d. Infanterie-Division` |
| `GER_ALTINF_01` | Late/Alternate Infantry Divisions | infantry | `%d. Volksgrenadier-Division` |
| `GER_LTINF_01` | Light Infantry Divisions | infantry | `%d. Jäger-Division` |
| `GER_MOT_01` | Motorized Divisions | motorized | `%d. Infanterie-Division (mot)` |
| `GER_MOT_02` | Motorized Divisions (alt.) | motorized | `%d. Infanterie-Division (mot)` |
| `GER_MEC_01` | Panzergrenadier Divisions | mechanized | `%d. Panzergrenadier-Division` |
| `GER_Mnt_01` | Mountain Divisions | mountaineers | `%d. Gebirgs-Division` |
| `GER_MAR_01` | Marine Divisions | marine | `%d. Seelande-Division` |
| `GER_PAR_01` | Paratrooper Divisions | paratrooper | `%d. Fallschirmjäger-Division` |
| `GER_GAR_01` | Garrison Divisions | infantry | `%d. Sicherungs-Division` |
| `GER_Arm_01` | Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panzer-Division` |
| `GER_Arm_02` | Named Panzer Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panzer-Division` |
| `GER_LTARM_01` | Light Divisions | light_armor | `%d. leichte-Division` |
| `GER_Cav_01` | Cavalry Divisions | cavalry | `%d. Kavallerie-Division` |
| `GER_MONINF_01` | Monarchist Infantry Divisions | infantry, mechanized, mountaineers, paratrooper, marine | `%d. Division` |
| `GER_MONMOB_01` | Monarchist Mobile Divisions | cavalry, light_armor, medium_armor, heavy_armor, modern_armor | `%d. Schnell-Division` |

---

## Group Details

### `GER_Inf_01` — Infantry Divisions
The core numbered infantry series. Covers all Heer divisional waves including wartime expansions, with Arabic-numeral format matching the Wehrmacht's own designation system.

- **Named entries:** 1.–299. Infanterie-Division (sequential numbered series)
- **Fallback:** `%d. Infanterie-Division`

### `GER_ALTINF_01` — Late/Alternate Infantry Divisions
Late-war and alternate-history infantry formations using the Volksgrenadier designation. Intended for players who have expanded beyond the historical numbered series.

### `GER_LTINF_01` — Light Infantry Divisions
Jäger divisions — light infantry optimized for forests, mountains, and difficult terrain. Historically Germany raised 10 Jäger divisions.

### `GER_MOT_01` / `GER_MOT_02` — Motorized Divisions
Motorized infantry divisions. Two separate lists provide variety and numbering flexibility. Uses the historical `(mot)` parenthetical suffix.

### `GER_MEC_01` — Panzergrenadier Divisions
Mechanized infantry divisions. Named after the wartime upgrade of motorized divisions to Panzergrenadier status (e.g., *Großdeutschland*, *Feldherrnhalle*).

### `GER_Mnt_01` — Mountain Divisions (Gebirgs-Divisionen)
Gebirgsjäger formations for Alpine and high-altitude combat. Germany raised 8 Gebirgs-Divisionen historically.

### `GER_MAR_01` — Marine Divisions
Naval infantry / amphibious assault divisions. Covers the *Seelande* (Sea Landing) formation concept.

### `GER_PAR_01` — Paratrooper Divisions (Fallschirmjäger)
Luftwaffe Fallschirmjäger divisions. Historically Germany fielded up to 11 Fallschirmjäger divisions including the elite *7. Flieger-Division*.

### `GER_GAR_01` — Garrison / Security Divisions (Sicherungs)
Rear-area security and occupation divisions. The Sicherungs-Divisionen policed occupied territories and anti-partisan operations.

### `GER_Arm_01` — Panzer Divisions (Numbered)
Standard numbered Panzer divisions, covering the full 1st–27th series and beyond.

### `GER_Arm_02` — Named Panzer Divisions
Distinguished panzer formations with honorific or geographic names, including:
- *Panzer-Division „Großdeutschland"*
- *Panzer-Division „Feldherrnhalle"*
- *Panzer-Division „Clausewitz"*
- *Panzer-Division „Müncheberg"*
- *Panzer-Division „Holstein"*
- *Panzer-Division „Jüterbog"*

### `GER_LTARM_01` — Light Divisions (Leichte)
Early-war light armored divisions (*leichte Divisionen*), converted to full Panzer divisions by 1941.

### `GER_Cav_01` — Cavalry Divisions
German cavalry retained a residual role in reconnaissance and security. Covers the *1. Kavallerie-Division* and expanded wartime formations.

### `GER_MONINF_01` / `GER_MONMOB_01` — Monarchist Formations
Alternate-history formations for a restored German monarchy. Infantry and mobile variants use period-appropriate Imperial-style designations.

