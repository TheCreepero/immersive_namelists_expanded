# Sweden

**Country Tag:** `SWE` | **Source File:** [`INEX_SWE_names_divisions.txt`](../common/units/names_divisions/INEX_SWE_names_divisions.txt)

---

## Historical Overview

Sweden maintained neutrality in WWII but kept a large mobilized armed forces (*Försvarsmakten*) throughout the conflict. The Defence Decision of 1942 expanded the war organization to the *arméfördelningar* I-IV and XI-XVI (Roman numerals until 1 October 1966), created the armor branch (*Pansartrupperna*, regiments P 1-P 4) and raised "doubling" regiments (I 31-I 51). The Swedish Army otherwise relied on regional brigades, a distinctive feature preserved in INEX.

INEX covers two layers. The **division layer** overrides the vanilla Swedish division lists: plain and Named infantry, motorized, mechanized and armored divisions (sharing numbering), plus cavalry, marine (*Kustjägare*), mountain (*Fältjägare*) and paratrooper divisions. Real divisions carried no names before 1966, so Named identities are regiment and province names paired with divisions by extrapolation; Sweden never fielded cavalry, marine or airborne divisions, so those lists are extrapolated too. The **brigade layer** covers infantry, armored, bicycle, cavalry, ski/Arctic, coastal defense, artillery, anti-air and paratrooper brigades, Home Guard (*Hemvärnet*), royal guards, and volunteer units. The ideology suites are gated by government type: fascist Stormtroopers and Legions, communist Red Guards, democratic/neutral Home Guard, Landstorm and Royal Guards, and Carolean Guards (neutral or fascist).

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
| `SWE_INF_01` | Infantry Divisions | infantry | `%s. Arméfördelningen` |
| `SWE_INF_02` | Infantry Divisions (Named) | infantry | `%s. Arméfördelningen` |
| `SWE_MOT_01` | Motorized Divisions | motorized | `%s. Motoriserade arméfördelningen` |
| `SWE_MOT_02` | Motorized Divisions (Named) | motorized | `%s. Motoriserade arméfördelningen` |
| `SWE_MEC_01` | Mechanized Divisions | mechanized | `%s. Mekaniserade fördelningen` |
| `SWE_MEC_02` | Mechanized Divisions (Named) | mechanized | `%s. Mekaniserade fördelningen` |
| `SWE_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%s. Pansarfördelningen` |
| `SWE_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%s. Pansarfördelningen` |
| `SWE_CAV_01` | Cavalry Divisions | cavalry | `%s. Kavallerifördelningen` |
| `SWE_MAR_01` | Marine Divisions | marine | `%s. Kustjägarfördelningen` |
| `SWE_MNT_01` | Mountain Divisions | mountaineers, ranger_battalion | `%s. Fältjägarfördelningen` |
| `SWE_PAR_01` | Paratrooper Divisions | paratrooper | `%s. Fallskärmsjägarfördelningen` |
| `SWE_BS_01` | Stormtroopers | militia | `%s. Stormavdelningen` |
| `SWE_FAS_01` | Fascist Legions | infantry, motorized | `%d. Kamplegionen` |
| `SWE_RG_01` | Red Guards | militia, infantry | `%d. Arbetarkåren` |
| `SWE_LS_01` | Landstorm Brigades | infantry, militia | `%d. Landstormsbrigaden` |
| `SWE_CAR_01` | Carolean Guards | infantry, cavalry, motorized, mechanized, light_armor, medium_armor | `%d. Karolinska Gardet` |

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
The *Hemvärnet* — Sweden's Home Guard (founded 29 May 1940), organized by city and province. 36 named *hemvärnsområde* (Home Guard areas) and *försvarsområde* (defence areas) covering all of Sweden from Stockholm to Kiruna. Gated to democratic and neutral governments.

### `SWE_ART_01` — Artillery Brigades
Named Swedish artillery brigades: *Svea*, *Göta*, *Wendes*, *Norrlands*, *Upplands*, *Smålands*, *Gotlands*, *Bodens*, *Bergslagens*, *Karlsborg*, heavy siege/field artillery *Positionsartilleriet*, corps artillery, and fortress artillery brigades (*Karlskrona*, *Vaxholm*).

### `SWE_AA_01` — Anti-Air Brigades
Named anti-aircraft formations at major industrial and population centers: *Karlsborg*, *Östgöta*, *Stockholm*, *Skåne*, *Sundsvall*, *Göteborg*, *Luleå*, *Bofors*, *Malmö*, *Västerås*.

### `SWE_PAR_02` — Paratrooper Brigades
Swedish airborne formations: *Karlsborg* (home of Fallskärmsjägarskolan), *Kiruna*, *Vättern*, *Västergötland*, *Livregementet*, *Såtenäs* (F 7 transport airlift wing), *Arvidsjaur*, and *Fallskärmsjägarkåren*.

### `SWE_ROYAL_01` — Royal Guards
The constitutional royal guard, gated to democratic and neutral governments. 16 entries built on the real guard and *Livregemente* regiments:
- *Kungliga Livgardesdivisionen* (1st & 2nd)
- *Kungliga Livgardet till Häst* (Horse Guards) and *till Fot* (Foot Guards)
- *Kungliga Livdrabantkåren*
- *Kungliga Svea Livgardet* (I 1), *Göta Livgardet* (I 2, to 1939) and *Göta Pansarlivgardet* (P 1)
- *Livgardets Dragoner* (K 1), *Livregementet till Häst*, *Livregementets Grenadjärer* (I 3), *Livregementets Husarer* (K 3), *Livgrenadjärregementet* (I 4)
- *Smålands Husarer* and *Kronprinsens Husarer*

### `SWE_CAR_01` — Carolean Guards
The Stormaktstiden (Carolean) tradition list, split from the royal guards and gated to neutral or fascist governments. No real units carry these exact names, so the list is extrapolated from Carolean battles, provinces and regiments: *Karolinska Gardesdivisionen 'Carolus Rex'* and *'Gustavus Adolphus'*, *Dalregementets Karoliner*, *Hälsinge Karoliner*, *Jämtlands Dragonkaroliner*, *Finska Gardesbataljonen*, *Estländska Adelsfanan*, *Livländska Dragonregementet*, *Pommerska Legionen*, *Narva*, *Poltava*, *Fraustadt*, *Klissow*, *Lunds Dragonkår*, *Holowczyn* and *Gadebusch*.

### `SWE_LS_01` — Landstorm Brigades
*Landstormen* (the state reserve for men aged 33-40, 1885-1942) and the voluntary defence movement (*Frivilliga skytterörelsen*, *Hemvärnet*), gated to democratic and neutral governments. The brigade form and regional pairing are extrapolated: *Landstormsbrigaden* Svea, Göta, Norrland, Skåne, Gotland, Älvsborg, Bergslagen and others, plus *Skytteförbundens Skyttebrigad* Stockholm, Göteborg and Malmö.

### `SWE_VOL_01` — Volunteer Formations
Swedish volunteers who fought in Finland (Winter War and Continuation War), Norway, and Spain:
- *Svenska Frivilligkompaniet 'Kongsvinger'* (Norway 1940)
- *Svenska Bataljonen 'Georg Branting'* (Spanish Civil War 1936–1939)
- *Svenska Frivilligkåren* I–III *Stridsgruppen* (Winter War 1939–1940)
- *Svenska Frivilligbataljonen 'Hangö'* and *Svenska Frivilligkompaniet 'Svir'* (Continuation War 1941–1944)
- *Svenska Frivilligkåren i Norge*, *Salla*, *Ernst Linder*, and *Svenska Norgebataljonen*
- Nordic volunteer concepts (*Skandinaviska Frivilliglegionen*, *Nordiska Frivilligbrigaden*, *Svenska Frivilliga Jägarkåren*)

### `SWE_INF_01` / `SWE_INF_02` — Infantry Divisions (plain and Named)
The plain list overrides vanilla `SWE_INF_01` with Roman numerals (*I. Arméfördelningen*), the form used for the *arméfördelningar* I-IV and XI-XVI in 1942-66. The Named list shares its numbering and adds 28 regiment and province identities (*II. Arméfördelningen 'Jämtlands'*, *XIV. Arméfördelningen 'Östgöta'*). Real divisions carried no names before 1966, so the pairing is extrapolated.

### `SWE_MOT_01` / `SWE_MOT_02`, `SWE_MEC_01` / `SWE_MEC_02`, `SWE_ARM_01` / `SWE_ARM_02` — Mobile Divisions (plain and Named)
Each plain list overrides its vanilla tag. The mechanized and armored lists, and every Named list, link to `SWE_MOT_01`, which keeps vanilla's link to `SWE_INF_01`.
- **Motorized (Named)**: 20 infantry-regiment identities (*Svea livgarde*, *Jämtlands fältjägare*, *Värmlands*, *Norrbottens*)
- **Mechanized (Named)**: 18 cavalry-heritage identities (*Livregementets husarer*, *Norrlands dragoner*, *Skånska dragoner*, *Kronprinsens husarer*)
- **Armored (Named)**: 18 identities from the *pansarregementen* P 1-P 4 of 1942-44 (*Göta pansarlivgarde*, *Skånska pansarregementet*, *Södermanlands pansarregemente*, *Skaraborgs pansarregemente*) and armor garrison towns (*Hässleholm*, *Enköping*, *Skövde*)

### `SWE_CAV_01` — Cavalry Divisions
Overrides vanilla. 15 identities from the regiments K 1-K 4 and their pre-1928 predecessors (*Livregementet till häst*, *Livregementets husarer*, *Skånska kavalleriregementet*, *Norrlands dragonregemente*). Sweden fielded no cavalry divisions; the list is extrapolated and kept distinct from `SWE_CAV_02`.

### `SWE_MAR_01` — Marine Divisions
Overrides vanilla. 14 *Kustjägare* and *Amfibiekåren* identities with maritime regions (*Roslagen*, *Blekinge skärgård*, *Kalmarsund*, *Bottenviken*), avoiding the stations of `SWE_KA_01`. Extrapolated.

### `SWE_MNT_01` — Mountain Divisions
Overrides vanilla, with the fallback changed from *Jägarfördelningen* to *Fältjägarfördelningen* after *Jämtlands fältjägarregemente* (I 5). 15 identities: Norrland regiments (*Jämtlands fältjägare*, *Lapplands jägare*, *Norrbottens*), *Skidlöparbataljonen* and the northern rivers (*Torneälven*, *Kalixälven*, *Luleälven*).

### `SWE_PAR_01` — Paratrooper Divisions
Overrides vanilla. 12 identities (*Fallskärmsjägarskolan*, *Livregementets husarer*, *Tiveden*, *Vänern*). *Fallskärmsjägarskolan* at Karlsborg dates from 1952, so the list is an alternate-history extension.

### `SWE_BS_01` — Stormtroopers (fascism only)
Overrides vanilla `SWE_BS_01`, which focus scripts reference. Party storm detachments (*Stormavdelning*) named after the interwar Swedish fascist and national socialist movements (*Sveriges Fascistiska Kamporganisation*, *Svenska Nationalsocialistiska Partiet*, *Svensk Socialistisk Samling*, *Nysvenska Rörelsen*). The party names are historical; the formation titles are extrapolated.

### `SWE_FAS_01` — Fascist Legions (fascism only)
Field formations of a Swedish fascist state, named after the same movements (*Kamplegion*, *Legion*) and regions (*1. Kamplegionen 'Svea'*). Extrapolated; no SS or Waffen-SS names.

### `SWE_RG_01` — Red Guards (communism only)
Workers' corps (*Arbetarkår*) of a Swedish communist state, built on the 1917 *Soldat- och arbetarföreningen*, the Left Social Democrats and the *Sveriges kommunistiska parti*, with labour centres such as *Kiruna* and *Malmberget*. No source for a Swedish *Röda gardet* exists (the name belongs to the Finnish Civil War), so the formation titles are extrapolated.
