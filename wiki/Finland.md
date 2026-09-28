# Finland

**Country Tag:** `FIN` | **Source File:** [`INEX_FIN_names_divisions.txt`](../common/units/names_divisions/INEX_FIN_names_divisions.txt)

---

## Historical Overview

Finland fought the Soviet Union in the Winter War (1939–40) and the Continuation War (1941–44), then fought Germany in the Lapland War (1944–45). The field army was built on numbered infantry divisions raised from regional Civil Guard (*Suojeluskunta*) districts. It was reinforced by ad hoc groups (*Ryhmä*) named after their commanders or sectors, local detachments, and a single armoured division (the *Panssaridivisioona* of Maj.Gen. Ruben Lagus, 1942). Swedish volunteers of the *Svenska frivilligkåren* (SFK) fought on the Salla front in 1940.

INEX overrides ten vanilla groups (`FIN_INF_01`, `FIN_CAV_01`, `FIN_MOT_01`, `FIN_ARM_01`, `FIN_MEC_01`, `FIN_GAR_01`, `FIN_GAR_02`, `FIN_MAR_01`, `FIN_MTN_01`, `FIN_PAR_01`). It adds eight new groups (`FIN_INF_05`, `FIN_MOT_02`, `FIN_ARM_02`, `FIN_MEC_02`, `FIN_DET_01`, `FIN_DET_02`, `FIN_SVFK_01`, `FIN_SVFK_02`), for **18 namelist groups** in total. The vanilla groups used by focus scripts for legions, militias, Soviet commandos and penal units (`FIN_INF_02`, `FIN_INF_04`, `FIN_MIL_01`, `FIN_MIL_02`, `FIN_PEN_01`) are left to vanilla.

### Naming convention

Names use Finnish nominative with full diacritics. The unit's identity is given in single quotes after the number, e.g. *12. Divisioona 'Kollaa'*. The SFK groups and the Swedish-speaking Suojeluskunta districts use Swedish.

Infantry, motorised, armoured and mechanised divisions come in pairs. The vanilla tag is a plain, un-nicknamed variant (*12. Divisioona*), and a **(Named)** variant carries the identities (*12. Divisioona 'Kollaa'*). Each pair shares numbering, so the two never issue the same number.

| Term | Meaning |
|:---|:---|
| *Divisioona* | Division |
| *Prikaati* | Brigade |
| *Ryhmä* | Group (ad hoc formation) |
| *Osasto* | Detachment |
| *Komennuskunta* | Local command detachment |
| *Paikallisjoukot* | Local (garrison) troops |
| *Suojeluskuntapiiri* | Civil Guard district |
| *Jääkäri* | Jäger / light infantry |
| *Panssari* | Armour |
| *Ratsuväki* | Cavalry |
| *Sissi* | Ranger / guerrilla |
| *Rannikko* | Coastal |
| *Laskuvarjo* | Parachute |

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `FIN_INF_01` | Infantry Divisions | infantry | `%d. Divisioona` |
| `FIN_INF_05` | Infantry Divisions (Named) | infantry | `%d. Divisioona` |
| `FIN_CAV_01` | Cavalry Brigades | cavalry | `%d. Ratsuväkiprikaati` |
| `FIN_MOT_01` | Motorised Divisions | motorized | `%d. Jääkäridivisioona` |
| `FIN_MOT_02` | Motorised Divisions (Named) | motorized | `%d. Jääkäridivisioona` |
| `FIN_ARM_01` | Armoured Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panssaridivisioona` |
| `FIN_ARM_02` | Armoured Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panssaridivisioona` |
| `FIN_MEC_01` | Mechanised Divisions | mechanized | `%d. Panssarijääkäridivisioona` |
| `FIN_MEC_02` | Mechanised Divisions (Named) | mechanized | `%d. Panssarijääkäridivisioona` |
| `FIN_GAR_01` | Garrison Divisions | infantry | `%d. Paikallisjoukot` |
| `FIN_GAR_02` | Suojeluskunta Divisions | infantry | `%d. Suojeluskuntapiiri` |
| `FIN_DET_01` | Command Detachments | infantry, motorized, mechanized | `%d. Komennuskunta` |
| `FIN_DET_02` | Separate Groups | infantry | `Ryhmä %s` |
| `FIN_MAR_01` | Marine Divisions | marine | `%d. Rannikkojääkäridivisioona` |
| `FIN_MTN_01` | Mountain Divisions | mountaineers | `%d. Sissidivisioona` |
| `FIN_PAR_01` | Paratrooper Divisions | paratrooper | `%d. Laskuvarjojääkäridivisioona` |
| `FIN_SVFK_01` | SFK Companies | infantry | `%d. Skyttekompaniet` |
| `FIN_SVFK_02` | SFK Battle Groups | infantry | `%s. Stridsgruppen` |

---

## Group Details

### `FIN_INF_01` / `FIN_INF_05` — Infantry Divisions (Divisioona)
`FIN_INF_01` is the plain variant (*%d. Divisioona*). In the named `FIN_INF_05`, division numbers that existed in 1939–44 carry their best-known battle or sector:

| No. | Identity | War |
|:---|:---|:---|
| 2 | Vuosalmi | Continuation War (1944) |
| 3 | Kiestinki | Continuation War (1941) |
| 4 | Porlammi | Continuation War (1941) |
| 5 | Syväri | Continuation War (1941) |
| 6 | Salla | Continuation War (1941) |
| 7 | Sortavala | Continuation War (1941) |
| 9 | Suomussalmi | Winter War |
| 10 | Valkeasaari | Continuation War (1944) |
| 11 | *Iskevä Kiila* (nickname) | Continuation War |
| 12 | Kollaa | Winter War |
| 13 | Jänisjoki | Winter War |
| 14 | Rukajärvi | Continuation War |
| 15 | Hiitola | Continuation War (1941) |
| 17 | Hanko | Continuation War (1941) |
| 18 | Tali | Continuation War (1944) |

1. D (*Varsinais-Suomi*, its formation area), 8. D (*Kannas*) and 19. D (*Itä-Karjala*) carry their theatre or region. No 16. Divisioona was ever raised, so number 16 uses the fallback. Numbers 20–30 represent extended mobilization and are anchored to Suojeluskunta regions (*Pohjois-Savo*, *Satakunta*, *Etelä-Häme* … *Pohjois-Häme*). Higher numbers use the fallback.

### `FIN_CAV_01` — Cavalry Brigades (Ratsuväkiprikaati)
Finland fielded one cavalry brigade, the *Ratsuväkiprikaati*, formed from the Uusimaa Dragoons and the Häme Cavalry Regiment and carrying the Thirty Years' War *Hakkapeliitta* tradition. Entry 1 is the historical brigade. Entries 2–3 take its heritage names (*Uudenmaan Rakuunat*, *Hakkapeliitta*), and 4–15 its garrison (*Lappeenranta*) and Finnish regions.

### `FIN_MOT_01` / `FIN_MOT_02` — Motorised Divisions (Jääkäridivisioona)
`FIN_MOT_01` is the plain variant and the numbering anchor for all six mobile groups. The named `FIN_MOT_02` is named after the *Jääkäri* tradition: the 27th Jäger Battalion's training camp at *Lockstedt*, its first battles on the *Misse* and *Aajoki* rivers (1916), the Jääkäripataljoona 1 garrison at *Terijoki*, and the Jägers' 1918 landing at *Vaasa*. Later entries are regional. Numbering is intentionally **not** linked to `FIN_INF_01`: the Jääkäriprikaati and the Panssaridivisioona were never part of the infantry division sequence.

### `FIN_ARM_01` / `FIN_ARM_02` — Armoured Divisions (Panssaridivisioona)
`FIN_ARM_01` is the plain variant. In the named `FIN_ARM_02`, entry 1 is the historical *Panssaridivisioona 'Lagus'* (1942–44, Maj.Gen. Ruben Lagus). Entries 2–6 carry its battles: *Äänislinna*, *Kuuterselkä*, *Tali*, *Ihantala*, *Portinhoikka*. Entries 7–12 are plausible garrisons of an expanded armoured arm (*Parola*, *Hattula*, *Hämeenlinna*, *Riihimäki*, *Hyrylä*, *Santahamina*). Shares numbering with `FIN_MOT_01`.

### `FIN_MEC_01` / `FIN_MEC_02` — Mechanised Divisions (Panssarijääkäridivisioona)
`FIN_MEC_01` is the plain variant. Armoured infantry divisions did not exist historically, so the named `FIN_MEC_02` uses Finnish garrison towns (*Hamina*, *Kouvola*, *Mikkeli*, *Kuopio* …). Shares numbering with `FIN_MOT_01`.

### `FIN_GAR_01` — Garrison Divisions (Paikallisjoukot)
*Paikallisjoukot* (local troops, as opposed to the field army) of 30 cities and regions, from *Helsingin Paikallisjoukot* to *Etelä-Savon Paikallisjoukot*. Shares numbering with `FIN_INF_01` so that garrison formations converted to field divisions receive a number from the infantry sequence.

### `FIN_GAR_02` — Suojeluskunta Divisions (Suojeluskuntapiiri)
Overrides the vanilla group spawned by the Suojeluskunta focus (requires *Arms Against Tyranny*). Keys 1–6 keep the vanilla focus-spawned districts. INEX fixes vanilla's broken quoting, a duplicated *Lahden* entry, and an Åland entry: demilitarized Åland had no Suojeluskunta. It adds the 1939 districts vanilla omitted (*Etelä-Hämeen*, *Viipurin*, *Sortavalan*, *Keski-Pohjanmaan*, *Pohjois-Hämeen*), for 41 districts in all. The Swedish-speaking districts keep their Swedish names (*Vasa Skyddskårsdistrikt*, *Nylands Södra Skyddskårsdistrikt*, *Raseborgs Skyddskårsdistrikt*).

### `FIN_DET_01` — Command Detachments (Komennuskunta)
Local detachments named after parishes of the North Karelian, Savonian and South Karelian border zone, from *Ilomantsin Komennuskunta* to *Liperin Komennuskunta* (20 entries).

### `FIN_DET_02` — Separate Groups (Ryhmä)
Entries 1–10 are historical ad hoc formations: *Ryhmä Talvela* (Tolvajärvi), *Ryhmä Siilasvuo* (Suomussalmi), *Ryhmä Susi*, *Ryhmä Sihvo*, *Ryhmä Oinonen*, *Ryhmä Raappana* (Ilomantsi 1944), *Lapin Ryhmä*, *Pohjois-Suomen Ryhmä*, *Aunuksen Ryhmä*, *Maaselän Ryhmä*. Entries 11–20 are plausible groups named after real regiment and detachment commanders of the period: *Pajari* (JR 16, Tolvajärvi), *Teittinen* (JR 34, Kollaa), *Mäkiniemi* (JR 27), *Vuokko* (Kuhmo), *Kekkonen* (Kuhmo), *Roininen* (Salla), *Suoranta* (Pelkosenniemi), *Pennanen* (Petsamo), *Kuussaari* (Aunus) and *Halsti* (JR 11, Lapland War). Fallback: `Ryhmä %s` (Roman numerals).

### `FIN_MAR_01` — Marine Divisions (Rannikkojääkäridivisioona)
Finland had no marine divisions. Coastal jäger divisions are named after the fortresses and islands of the coastal defence: *Ahvenanmaa*, *Hanko*, *Porkkala*, *Suursaari*, *Tytärsaari*, *Koivisto*, *Saarenpää*, *Utö*, *Örö*, *Kotka*.

### `FIN_MTN_01` — Mountain Divisions (Sissidivisioona)
*Sissi* (ranger) divisions for the northern wilderness front, named after Lapland and Kainuu localities (*Kuhmo*, *Kuusamo*, *Petsamo*, *Pelkosenniemi*, *Ivalo* …). Four entries are named after the long-range patrol companies of Erillinen Pataljoona 4: *Osasto Marttina*, *Osasto Vehniäinen*, *Osasto Kuismanen*, *Osasto Paatsalo*. Vanilla `FIN_INF_03` "Sissi Divisions" links its numbering to this group.

### `FIN_PAR_01` — Paratrooper Divisions (Laskuvarjojääkäridivisioona)
Finland had no airborne divisions. The list is named after the long-range patrol tradition (*Kaukopartio*) and Finnish Air Force bases (*Utti*, *Immola*, *Malmi*, *Kauhava*, *Tikkakoski* …).

### `FIN_SVFK_01` / `FIN_SVFK_02` — Swedish Volunteer Corps (SFK)
The *Svenska frivilligkåren* fought on the Salla front in 1940, organized in battle groups (*Stridsgrupper*). Each group had three rifle companies, a jäger company and a heavy company. `FIN_SVFK_01` mirrors that company layout (*Skyttekompaniet*, *Jägarkompaniet*, *Tunga Kompaniet*). `FIN_SVFK_02` lists *I.–III. Stridsgruppen*, plus the later Swedish volunteer units at Hanko (*Svenska Frivilligbataljonen 'Hangö'*, 1941) and on the Svir (*Svenska Frivilligkompaniet 'Svir'*, 1942–44). Names are in **Swedish**.

---
