# Germany — Additional Formations

**Country Tag:** `GER` | **Source File:** [`INEX_GER_ADDITIONAL_names_divisions.txt`](../common/units/names_divisions/INEX_GER_ADDITIONAL_names_divisions.txt)

> See also: [Heer](Germany) and [Waffen-SS](Germany-Waffen-SS).

---

## Historical Overview

This file holds formations that sit outside the core division series:
- **Numbered series:** heavy tank battalions, Panzer brigades, Reserve, Volksgrenadier and Grenadier divisions, Luftwaffe field and Flak divisions.
- **Garrisons and fortresses:** city commands and the 1944–45 Festungen.
- **Kampfgruppen.**
- **Paramilitaries:** one militia list per ideology.
- **Foreign legions.**

Reserve, Volksgrenadier and Grenadier divisions share the Heer numbering (`GER_Inf_01`) and sit on their real numbers. All other groups run their own series.

Ideology gating:
- **Fascist:** Volkssturm, SA and Foreign Legions.
- **Neutrality:** Freikorps.
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
| `GER_PANZERARTILLERIE_DIVISION_01` | Panzer Artillery Divisions | heavy_armor, medium_armor, light_armor, modern_armor | `%d. Panzer-Artillerie-Division` |
| `GER_RESERVE_DIVISION_01` | Reserve Divisions | infantry | `%d. Reserve-Division` |
| `GER_VOLKSGRENADIER_01` | Volksgrenadier Divisions | infantry | `%d. Volksgrenadier-Division` |
| `GER_GRENADIER_DIVISION_01` | Grenadier Divisions | infantry | `%d. Grenadier-Division` |
| `GER_LUFTWAFFEN_FELD_DIVISION_01` | Luftwaffe Field Divisions | infantry | `Luftwaffen-Feld-Division %d` |
| `GER_FLAK_DIVISION_01` | Flak Divisions | infantry | `%d. Flak-Division` |
| `GER_GAR_02` | City Garrisons | infantry | `Feldkommandantur %d` |
| `GER_FORT_01` | Fortress Divisions | infantry | `%d. Festungs-Division` |
| `GER_KAMPFGRUPPE_01` | Kampfgruppen | infantry, motorized, mechanized, light_armor, medium_armor, heavy_armor | `Kampfgruppe %d` |
| `GER_VOLKSSTURM_BATAILLONS_01` | Volkssturm Battalions | militia | `%d. Volkssturm-Bataillon` |
| `GER_SA_01` | SA Formations | militia | `SA-Standarte %d` |
| `GER_MIL_01` | Freikorps | militia | `%d. Freikorps-Division` |
| `GER_MIL_02` | Schutztruppe | militia | `%d. Schutztruppen-Division` |
| `GER_MIL_04` | Reichsbanner | militia | `%d. Reichsbanner-Gau` |
| `GER_MIL_03` | Red Front Fighters | militia | `%d. RFB-Gau` |
| `GER_LEG_01` | Foreign Legions | infantry, cavalry, mountaineers | `%d. Freiwilligen-Division` |

> **Note:** `GER_SCHWERE_PANZERABTEILUNG_01` and `_02` are linked (`link_numbering_with`), so the long and abbreviated forms share one number series.

> **Note:** `GER_PANZERARTILLERIE_DIVISION_01` uses `can_use = { is_ai = no }`, so only human players can use it.

---

## Group Details

### `GER_SCHWERE_PANZERABTEILUNG_01` / `_02` — Heavy Panzer Battalions
The Tiger battalions *schwere Panzer-Abteilung 501–510* and their 1945 renumberings (511, 424). Also the radio-control battalion *(Fkl) 301* and the heavy tank destroyer battalions *653*, *654* and *512*. The second group gives the abbreviated forms (*s.Pz.Abt. 501*, *s.Pz.Jg.Abt. 653*).

### `GER_ARM_03` — Panzer Brigades
*Panzer-Brigade 10* (Kursk), the 1944 *Panzer-Brigaden 101–113* and *150*, and *Panzer-Brigade 'Norwegen'*, for small armoured templates.

### `GER_PANZERARTILLERIE_DIVISION_01` — Panzer Artillery Divisions
Players only. Covers the *18. Artillerie-Division*, the *Artillerie-Divisionen 309–312* and the *Volks-Artillerie-Korps* of 1944–45.

### `GER_RESERVE_DIVISION_01` — Reserve Divisions
The real Reserve divisions of 1942–44 (*141.–191.*), including the *157.* and *188. Reserve-Gebirgs-Division*.

### `GER_VOLKSGRENADIER_01` / `GER_GRENADIER_DIVISION_01` — Volksgrenadier and Grenadier Divisions
The Volksgrenadier divisions in raising order, led by the *78. Volks-Sturm-Division*. The Grenadier list holds the 29th- and 30th-wave *Grenadier-Divisionen 541–562*, which became Volksgrenadier divisions after July 1944.

### `GER_LUFTWAFFEN_FELD_DIVISION_01` — Luftwaffe Field Divisions
*Luftwaffen-Division Meindl* and *Luftwaffen-Feld-Division 1–21*, in the Luftwaffe's own usage before the Heer took them over. The group runs its own number series.

### `GER_FLAK_DIVISION_01` — Flak Divisions
*1.–31. Flak-Division* and the two Flakscheinwerfer divisions. A home is noted where verified (*1. 'Berlin'*, *29. 'Oslo'*), and *9. 'Stalingrad'* marks the division destroyed there.

### `GER_GAR_02` — City Garrisons
*Wehrmachtkommandantur Berlin*, *Kommandant von Groß-Paris* and the *Stadtkommandanturen* of occupied and allied capitals and major cities, using German names of the period (*Reval*, *Wilna*, *Agram*, *Laibach*). Overflow uses the numbered *Feldkommandantur*.

### `GER_FORT_01` — Fortress Divisions
The 1945 Festungs-Divisionen (*Danzig*, *Gotenhafen*, *Stettin*), the *41.* and *133. Festungs-Division*, and the fortress cities of 1944–45 (*Breslau*, *Kolberg*, *Tarnopol*). The Atlantikwall fortresses follow (*Lorient*, *St. Nazaire*, *Kanalinseln*). The expansion then runs along the Ostwall and the A–A line (*Archangelsk*–*Astrachan*).

### `GER_KAMPFGRUPPE_01` — Kampfgruppen
About 170 Kampfgruppen named after Heer commanders. They include historical ones such as *Kampfgruppe Chill* and *Kampfgruppe Scherer*. Waffen-SS Kampfgruppen are in the SS file.

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
- The *Ostlegionen*, *Legion Condor*, *Legion Wallonie*, the LVF and the Indian Legion.
