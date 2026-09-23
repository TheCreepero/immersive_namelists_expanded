# Lithuania

**Country Tag:** `LIT` | **Source File:** [`INEX_LIT_names_divisions.txt`](../common/units/names_divisions/INEX_LIT_names_divisions.txt)

---

## Historical Overview

The Lithuanian Army (*Lietuvos kariuomenė*) was a small but well-organized force, with infantry regiments named after legendary Grand Dukes of Lithuania — Gediminas, Algirdas, Vytautas, Mindaugas — and cavalry regiments bearing the titles of Husars, Uhlans, and Dragoons with historic heraldic names (*Geležinis Vilkas* — Iron Wolf, *Birutė*). The army was organized around 3 infantry divisions and maintained a tradition of historical naming extending back to the medieval Grand Duchy of Lithuania.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `LIT_INF_01` | Infantry Division | infantry | `%s. Divizija` (Roman) |
| `LIT_CAV_01` | Cavalry Division | cavalry | `%s. Kavalerija Divizija` |
| `LIT_MOT_01` | Motorized Division | motorized | `%s. Motorizavimas Divizija` |
| `LIT_MEC_01` | Mechanized Division | mechanized | `%s. Mechanizavimas Divizija` |
| `LIT_ARM_01` | Armored Division | light_armor, medium_armor, heavy_armor, modern_armor | `%s. Apsisarvavimas Divizija` |
| `LIT_PAR_01` | Paratrooper Division | paratrooper | `%s. Gabenamas Divizija` |
| `LIT_MAR_01` | Marine Division | marine | `%s. Juras Peizazas Divizija` |
| `LIT_MNT_01` | Mountain Division | mountaineers | `%s Bjeshkë Divizija` |
| `LIT_GAR_01` | Garrison Division | infantry | `%s. Divizija` |
| `LIT_GAR_02` | District Garrison Division | infantry | `%s. District` |
| `LIT_REG_01` | Infantry Regiment | infantry | `%s. Pėstininkų Pulkas` |
| `LIT_REG_02` | Cavalry Regiment | cavalry | `%s. Kavalerija Pulkas` |
| `LIT_REG_03` | Artillery Regiment | artillery | `%s. Artilerijos Pulkas` |
| `LIT_REG_04` | Armored Team (Šarvuočių Rinktinė) | light_armor | `%s. Šarvuočių Rinktinė` |
| `LIT_AA_01` | Anti-Air Protection Team | anti_air, infantry | `%s. Priešlėktuvinės Apsaugos Rinktinė` |
| `LIT_INF_BRG_01` | Infantry Brigade | infantry | `%s. Pėstininkų brigada` |

> **Note:** Lithuania uses **Roman numeral** ordinals (`%s`) throughout, matching the *Lietuvos kariuomenė*'s own convention (*I. Divizija*, *II. Divizija*).

---

## Group Details

### `LIT_INF_01` — Infantry Divisions (Divizija)
Lithuanian numbered infantry divisions using Roman numerals (I.–XX.). Historically Lithuania maintained 3 infantry divisions (*I., II., III. Divizija*); the list extrapolates plausibly to 20 for full campaign coverage.

### `LIT_CAV_01` — Cavalry Divisions
*Kavalerija Divizija* in Roman numerals. Lithuania had one cavalry brigade historically; the list provides expansion through X.

### `LIT_MOT_01` / `LIT_MEC_01` — Motorized / Mechanized
*Motorizavimas Divizija* and *Mechanizavimas Divizija* in Roman numerals.

### `LIT_ARM_01` — Armored Division (Apsisarvavimas Divizija)
Lithuanian armor in Roman numerals.

### `LIT_PAR_01` — Paratrooper (*Gabenamas*)
*Gabenamas Divizija* — the Lithuanian term for airborne/transported division.

### `LIT_MAR_01` — Marine (*Juras Peizazas*)
Coastal and marine formations. Lithuania had very limited coastline (Memelland / Klaipėda), providing minimal historical basis, but the list provides plausible expansion.

### `LIT_MNT_01` — Mountain Division
Links numbering with `LIT_INF_01`. Uses generic *Divizija* names with Roman numerals.

### `LIT_GAR_01` — Garrison Division
Garrison divisions sharing numbering with `LIT_INF_01`, ensuring no duplicate numbers.

### `LIT_GAR_02` — District Garrison Divisions (Named Districts)
Named garrison formations for each major Lithuanian administrative district — 19 named entries:

| # | Name |
|:--|:---|
| 1 | District *Kaunas* |
| 2 | District *Klaipėda* |
| 3 | District *Utenos* |
| 4 | District *Telšių* |
| 5 | District *Tauragė* |
| 6 | District *Panevėžys* |
| 7 | District *Šiauliai* |
| 8 | District *Alytus* |
| 9 | District *Birštonas* |
| 10 | District *Palanga* |
| 11 | District *Neringa* |
| 12 | District *Marijampolė* |
| 13 | District *Vilnius* |
| 14 | District *Nemenčinė* |
| 15 | District *Kėdainiai* |
| 16 | District *Plungė* |
| 17 | District *Mažeikiai* |
| 18 | District *Jurbarkas* |
| 19 | District *Švenčionys* |

### `LIT_REG_01` — Infantry Regiments (Pėstininkų Pulkas)
Nine infantry regiments named after Grand Dukes and princes of the medieval Grand Duchy of Lithuania:
| # | Name |
|:--|:---|
| I | *Pėst. Lietuvos Didžiojo Kunigaikščio Gedimino Pulkas* |
| II | *Pėst. Lietuvos Didžiojo Kunigaikščio Algirdo Pulkas* |
| III | *Pėst. Lietuvos Didžiojo Kunigaikščio Vytauto Pulkas* |
| IV | *Pėst. Lietuvos Karaliaus Mindaugo Pulkas* |
| V | *Pėst. Lietuvos Karaliaus Mindaugo Pulkas* (variant) |
| VI | *Pėst. Pilėnų Kunigaikščio Margio Pulkas* |
| VII | *Pėst. Žemaičių Kunigaikščio Butegeidžio Pulkas* |
| VIII | *Pėst. Kauno Kunigaikščio Vaidoto Pulkas* |
| IX | *Pėst. Lietuvos Kunigaikščio Vytenio Pulkas* |

### `LIT_REG_02` — Cavalry Regiments (Kavalerija Pulkas)
Three cavalry regiments with full heraldic names:
| # | Name |
|:--|:---|
| I | *Husarų Lietuvos Didžiojo Etmono Jonušo Radvilos Pulkas* (Hussar) |
| II | *Ulonų Lietuvos Kunigaikštienės Birutės Pulkas* (Uhlan) |
| III | *Dragūnų Geležinio Vilko Pulkas* (Dragoon — "Iron Wolf") |

### `LIT_REG_03` — Artillery Regiments
Four artillery regiments (*Artilerijos Pulkas* I–IV) in Roman numerals.

### `LIT_REG_04` — Armored Team (Šarvuočių Rinktinė)
The single historical *Šarvuočių Rinktinė* — Lithuania's armored car platoon/company, one of the smallest armored formations in the INEX mod.

### `LIT_AA_01` — Anti-Air (Priešlėktuvinės Apsaugos Rinktinė)
The single historical *Priešlėktuvinės Apsaugos Rinktinė* — Lithuania's AA protection unit.

### `LIT_INF_BRG_01` — Infantry Brigades
Three infantry brigades (*Pėstininkų brigada* I–III) for brigade-level template assignment.

