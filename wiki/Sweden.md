# Sweden

**Country Tag:** `SWE` | **Source File:** [`INEX_SWE_names_divisions.txt`](../common/units/names_divisions/INEX_SWE_names_divisions.txt)

---

## Historical Overview

Sweden maintained neutrality in WWII but kept a large mobilized armed forces (*Försvarsmakten*) throughout the conflict. The Swedish Army is organized around regional brigades — a distinctive feature preserved in INEX. Each brigade carries a geographic nickname tied to its recruitment area. INEX covers infantry (*infanteribrigader*), armored (*pansarbrigader*), bicycle (*cykelbrigader*), cavalry, ski/Arctic rangers, coastal defense (*kustartilleri*), Home Guard (*Hemvärnet*), artillery, anti-air, paratroopers, royal guards, and volunteer units.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `SWE_IB_01` | Infantry Brigades | infantry, motorized | `Infanteribrigad %d` |
| `SWE_PB_01` | Armored Brigades | light_armor, medium_armor, heavy_armor, modern_armor, mechanized | `Pansarbrigad %d` |
| `SWE_CYC_01` | Bicycle Brigades | infantry, motorized | `%d. Cykelbrigaden` |
| `SWE_CAV_02` | Cavalry Brigades | cavalry, motorized | `%d. Kavalleribrigaden` |
| `SWE_MNT_02` | Ski & Mountain Brigades | mountaineers, ranger_battalion | `%d. Skidjägarbrigaden` |
| `SWE_KA_01` | Coastal Defense Brigades | marine, infantry | `%d. Kustartilleribrigaden` |
| `SWE_HV_01` | Home Guard Districts | militia, infantry | `Hemvärnsområde %d` |
| `SWE_ART_01` | Artillery Brigades | artillery, infantry | `%d. Artilleribrigaden` |
| `SWE_AA_01` | Anti-Air Brigades | anti_air, infantry | `%d. Luftvärnsbrigaden` |
| `SWE_PAR_02` | Paratrooper Brigades | paratrooper | `%d. Fallskärmsjägarbrigaden` |
| `SWE_ROYAL_01` | Royal Guards | infantry, cavalry, motorized, mechanized, light_armor, medium_armor | `%d. Kungliga Gardet` |
| `SWE_VOL_01` | Volunteer Formations | infantry, motorized | `%d. Svenska Frivilligbrigaden` |

---

## Group Details

### `SWE_IB_01` — Infantry Brigades
Swedish infantry brigades with their historical regional nicknames. 36 named entries:

| # | Name |
|:--|:---|
| 1 | *Gula brigaden* (Yellow Brigade) |
| 2 | *Hallandsbrigaden* |
| 3 | *Livbrigaden* (Life Brigade) |
| 4 | *Grenadjärbrigaden* (Grenadier Brigade) |
| 5 | *Jämtlandsbrigaden* |
| 7 | *Malmöbrigaden* |
| 8 | *Upplandsbrigaden* |
| 9 | *Skaraborgsbrigaden* |
| 10 | *Södermanlandsbrigaden* |
| 11 | *Kronobergsbrigaden* |
| 12 | *Jönköpingsbrigaden* |
| 13 | *Dalabrigaden* |
| 14 | *Hälsingebrigaden* |
| 15 | *Västgötabrigaden* |
| 16 | *Bohusbrigaden* |
| 18 | *Gotlandsbrigaden* |
| 19 | *Norrbottensbrigaden* |
| 20 | *Västerbottensbrigaden* |
| 21 | *Ångermanlandsbrigaden* |
| 26 | *Kristianstadsbrigaden* |
| 28 | *Roslagsbrigaden* |
| 33 | *Närkesbrigaden* |
| 34 | *Östgötabrigaden* |
| 35 | *Härjedalsbrigaden* |
| 38 | *Västmanlandsbrigaden* |
| 41 | *Blekingebrigaden* |
| 42 | *Norra Smålandsbrigaden* |
| 43 | *Kopparbergsbrigaden* |
| 44 | *Gästrikebrigaden* |
| 45 | *Älvsborgsbrigaden* |
| 46 | *Katrineholmsbrigaden* |
| 47 | *Göteborgsbrigaden* |
| 48 | *Stockholmsbrigaden* |
| 49 | *Kalmarbrigaden* |
| 50 | *Lapplandsbrigaden* |
| 51 | *Medelpadsbrigaden* |

### `SWE_PB_01` — Armored Brigades
Swedish armor with regional identities. 15 named brigades:
*Göta pansarbrigad*, *Skånska pansarbrigaden*, *Södermanlands pansarbrigad*, *Skaraborgs pansarbrigad*, *Göinge pansarbrigad*, *Blå brigaden* (Blue Brigade), *Malmö pansarbrigad*, *Götalands pansarbrigad*, *Svea pansarbrigad*, *Västgöta pansarbrigad*, *Smålands pansarbrigad*, *Wendes pansarbrigad*, *Gotlands pansarbrigad*, *Östergötlands pansarbrigad*, *Bergslagens pansarbrigad*.

### `SWE_CYC_01` — Bicycle Brigades
Swedish bicycle infantry (*cykelinfanteri*) mobilized by peacetime regiments (I 1 *Svea*, I 2 *Värmland*, I 6 *Norra Skåne*, I 16 *Halland*, I 18 *Gotland*, I 15 *Älvsborg*, etc.) under the 1942 war organization, plus 4 *cykeljägarbrigader* (bicycle ranger/reconnaissance brigades) representing cavalry scout detachments (K 3, K 4).

### `SWE_CAV_02` — Cavalry Brigades
Named after historic Swedish cavalry regiments: *Livgardets dragoner*, *Skånska dragonerna*, *Livregementets husarer*, *Norrlands dragoner*, *Smålands husarer*, *Kronprinsens husarer*, *Jämtlands hästjägare*, *Östgöta ryttare*, *Västgöta ryttare*, *Bohus dragoner*.

### `SWE_MNT_02` — Ski & Mountain Brigades
Northern frontier brigades for Arctic warfare. Named by geographic area:
- *Skidjägarbrigaden*: Jämtland, Lappland, Norrbotten, Västerbotten, Härjedalen, Torneå, Kiruna, Gällivare
- *Fjälljägarbrigaden*: Sarek, Kebnekaise, Abisko
- *Gränsjägarbrigaden 'Kalix'*

### `SWE_KA_01` — Coastal Defense Brigades
Named coastal defense and marine brigades at key Swedish naval positions: *Vaxholm*, *Karlskrona*, *Gotland*, *Göteborg*, *Hemsö*, *Stockholms skärgård*, *Öresund*, *Fårösund*, *Slite*, *Marstrand*, plus *Skärgårdsbrigad* (archipelago brigades) and *Kustjägarbrigad* (coastal ranger brigades).

### `SWE_HV_01` — Home Guard Districts
The *Hemvärnet* — Sweden's Home Guard, organized by city and province. 36 named *hemvärnsområde* (Home Guard areas) and *försvarsområde* (defence areas) covering all of Sweden from Stockholm to Kiruna.

### `SWE_ART_01` — Artillery Brigades
Named Swedish artillery brigades: *Svea*, *Göta*, *Wendes*, *Norrlands*, *Upplands*, *Smålands*, *Gotlands*, *Bodens*, *Bergslagens*, *Karlsborg*, heavy siege/field artillery *Positionsartilleriet*, corps artillery, and fortress artillery brigades (*Karlskrona*, *Vaxholm*).

### `SWE_AA_01` — Anti-Air Brigades
Named anti-aircraft formations at major industrial and population centers: *Karlsborg*, *Östgöta*, *Stockholm*, *Skåne*, *Sundsvall*, *Göteborg*, *Luleå*, *Bofors*, *Malmö*, *Västerås*.

### `SWE_PAR_02` — Paratrooper Brigades
Swedish airborne formations: *Karlsborg* (home of Fallskärmsjägarskolan), *Kiruna*, *Vättern*, *Västergötland*, *Livregementet*, *Såtenäs* (F 7 transport airlift wing), *Arvidsjaur*, and *Fallskärmsjägarkåren*.

### `SWE_ROYAL_01` — Royal Guards
A prestige list combining the modern Swedish Royal Guards with evocations of the Carolean era (gated to non-communist governments):
- *Kungliga Livgardesdivisionen* (1st & 2nd)
- *Kungliga Majestäts Livgarde*
- *Kungliga Livgardet till Häst* (Horse Guards)
- *Kungliga Livgardet till Fot* (Foot Guards)
- *Kungliga Livdrabantkåren*
- *Kungliga Svea Livgardet*, *Göta Livgardet*
- Carolean-era evocations: *Carolus Rex*, *Gustavus Adolphus*, Dalregementet, Hälsinge, Jämtlands Dragonkaroliner
- Baltic and Pomeranian imperial-era regiments (*Estländska Adelsfanan*, *Livländska Dragonregementet*, *Pommerska Legionen*, *Narva Grenadjärkåren*)

### `SWE_VOL_01` — Volunteer Formations
Swedish volunteers who fought in Finland (Winter War and Continuation War), Norway, and Spain:
- *Svenska Frivilligkompaniet 'Kongsvinger'* (Norway 1940)
- *Svenska Bataljonen 'Georg Branting'* (Spanish Civil War 1936–1939)
- *Svenska Frivilligkåren* I–III *Stridsgruppen* (Winter War 1939–1940)
- *Svenska Frivilligbataljonen 'Hangö'* and *Svenska Frivilligkompaniet 'Svir'* (Continuation War 1941–1944)
- *Svenska Frivilligkåren i Norge*, *Salla*, *Ernst Linder*, and *Svenska Norgebataljonen*
- Nordic volunteer concepts (*Skandinaviska Frivilliglegionen*, *Nordiska Frivilligbrigaden*, *Svenska Frivilliga Jägarkåren*)

