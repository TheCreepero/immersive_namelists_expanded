# Finland

**Country Tag:** `FIN` | **Source File:** [`INEX_FIN_names_divisions.txt`](../common/units/names_divisions/INEX_FIN_names_divisions.txt)

---

## Historical Overview

Finland fought two wars against the Soviet Union (Winter War 1939–40, Continuation War 1941–44) and a separate Lapland War against Germany (1944–45). The Finnish Army combined regular numbered divisions with named tactical groups (*Ryhmä*, named after their commanders) and local defence detachments (*Komennuskunta*). Finland's force structure is notable for its unusual division numbering (garrison units were converted into full divisions out of sequence) and for the Suomalaiset Frivilliga Kåren (*SFK*) — Swedish volunteers who fought for Finland. INEX reflects all of this, linking the `FIN_GAR_01` garrison list with `FIN_INF_01` numbering so converted garrison units receive plausible division numbers.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `FIN_INF_01` | Infantry Divisions | infantry | `%d. Divisioona` |
| `FIN_CAV_01` | Cavalry Brigades | cavalry | `%d. Ratsuväkiprikaati` |
| `FIN_MOT_01` | Motorised Divisions (Jääkäri) | motorized | `%d. Jääkäridivisioona` |
| `FIN_ARM_01` | Armoured Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panssaridivisioona` |
| `FIN_MEC_01` | Mechanised Divisions | mechanized | `%d. Panssarijääkäridivisioona` |
| `FIN_GAR_01` | Garrison Divisions | infantry | `%d. Paikallisjoukot` |
| `FIN_DET_01` | Command Detachments (Komennuskunta) | infantry, motorized, mechanized | `%d. Komennuskunta` |
| `FIN_DET_02` | Separate Groups (Ryhmä) | infantry | `Ryhmä %s` |
| `FIN_MAR_01` | Marine Divisions | marine | `%d. Rannikkojääkäridiv` |
| `FIN_MTN_01` | Mountain Divisions (Sissi) | mountaineers | `%d. Sissidivisioona` |
| `FIN_PAR_01` | Paratrooper Divisions | paratrooper | `%d. Laskuvarjojääkäridiv.` |
| `FIN_SVFK_01` | SFK Companies | infantry | `%d. Skyttekompaniet` |
| `FIN_SVFK_02` | SFK Battle Groups | infantry | `%s Stridsgruppen` |

---

## Group Details

### `FIN_INF_01` — Infantry Divisions (Divisioona)
Finnish numbered infantry divisions. The ordering in the file is **non-sequential by design** — it reflects the historical activation order of Finnish divisions, which did not follow strict numerical progression (garrison units were later converted to full divisions, filling gaps non-chronologically):

Historical Finnish divisions (ordered by activation): 1D, 4D, 5D, 8D, 10D, 11D, 6D, 9D, 12D, 13D, 2D, 3D, 7D, 14D, 15D, 17D–35D.

51 total entries with fallback continuation.

### `FIN_CAV_01` — Cavalry Brigades (Ratsuväkiprikaati)
Finnish cavalry brigades. Finland maintained one active cavalry brigade (*Ratsuväkiprikaati*) which fought in both the Winter and Continuation Wars. The list provides extensive alt-history expansion through the numbered series.

### `FIN_MOT_01` — Motorised Jääkäri Divisions (Jääkäridivisioona)
*Jääkäri* — Finnish light infantry / rangers. The motorized list uses the *Jääkäridivisioona* designation, reflecting Finland's mobile warfare doctrine. First entry: *Jääkäridivisioona* (no number — historically there was only one, the *Panssaridivisioona Lagus*). Links numbering with `FIN_ARM_01` and `FIN_MEC_01`.

### `FIN_ARM_01` — Armoured Divisions (Panssaridivisioona)
Finnish armored forces. Finland had one armored division historically — *Panssaridivisioona* commanded by General Ernst Ruben Lagus (hence the named entry: *Panssaridiv. 'Lagus'*). Shares numbering with `FIN_MOT_01`.

### `FIN_MEC_01` — Mechanised Divisions (Panssarijääkäridivisioona)
Mechanized infantry. None existed historically; the list provides plausible alt-history names. Shares numbering with `FIN_MOT_01`.

### `FIN_GAR_01` — Garrison Divisions (Paikallisjoukot)
*Paikallisjoukot* (local garrison forces). Named entries are major Finnish cities and regions:
*Helsingin*, *Turun*, *Tampereen*, *Oulun*, *Jyväskylän*, *Kuopion*, *Lahden*, *Porin*, *Vaasan*, *Lappeenrannan*, *Rovaniemen*, *Kajaanin*, *Joensuun*, *Mikkelin*, *Hämeenlinnan*, *Seinäjoen*, *Kotkan*, *Kokkolan*, *Imatran*, *Savonlinnan*, *Kauhavan*, *Kemi-Tornion*, *Pohjanmaan*, *Satakunnan*, *Kainuun*, *Karjalan*, *Uudenmaan*, *Varsinais-Suomen*, *Pirkanmaan*, *Etelä-Savon*.

Shares numbering with `FIN_INF_01` so converted garrison units receive correct division numbers.

### `FIN_DET_01` — Command Detachments (Komennuskunta)
*Komennuskunta* — local tactical detachments named after Finnish parishes and municipalities in the Karelian border region and Saimaa lake district. 20 named detachments from *Ilomantsin Komennuskunta* to *Liperin Komennuskunta*.

### `FIN_DET_02` — Separate Groups (Ryhmä)
*Ryhmä* — named tactical groups commanded by a senior officer, used extensively during the Winter War. Named after their commanders:
*Ryhmä Airo*, *Heinrichs*, *Hägglund*, *Kekkonen*, *Kivimäki*, *Kopra*, *Kuussaari*, *Laatikainen*, *Lehtovaara*, *Mäkinen*, *Nenonen*, *Nikinmaa*, *Oesch*, *Paasonen*, *Palmroth*, *Rautavaara*, *Siilasvuo*, *Sihvo*, *Uotila*, *Vihma* (20 named groups).

Fallback: `Ryhmä %s` (Roman numeral format).

### `FIN_MAR_01` — Marine Divisions (Rannikkojääkäri)
*Rannikkojääkäri* (coastal ranger/marine) divisions. Finland had no marine divisions historically; the list provides plausible names for island and archipelago defence scenarios. First entry: *Rannikkojääkäridiv* (unnumbered).

### `FIN_MTN_01` — Mountain / Ranger Divisions (Sissidivisioona)
*Sissi* — the Finnish guerrilla/ranger warfare tradition. Provides names for mountain and deep-forest combat formations. None existed historically as formal divisions.

### `FIN_PAR_01` — Paratroopers (Laskuvarjojääkäri)
*Laskuvarjojääkäri* (parachute ranger) divisions. Finland had no airborne divisions; the list provides plausible designations for alt-history scenarios.

### `FIN_SVFK_01` / `FIN_SVFK_02` — Swedish Volunteer Corps (SFK)
The *Svenska Frivilligkåren* (SFK) — Swedish volunteers who fought for Finland in the Winter War, primarily organized as rifle companies and battle groups. Two lists provide company-level (*Skyttekompaniet*, *Jägarkompaniet*, *Tunga Kompaniet*) and battle-group-level (*Stridsgruppen I–V*) designations. Names are in **Swedish**, not Finnish, reflecting the SFK's organization.

