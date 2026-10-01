# Finland

**Country Tag:** `FIN` | **Source File:** [`INEX_FIN_names_divisions.txt`](../common/units/names_divisions/INEX_FIN_names_divisions.txt)

---

## Historical Overview

Finland fought the Soviet Union in the Winter War (1939–40) and the Continuation War (1941–44), followed by the Lapland War against Germany (1944–45). The Finnish field army mobilized through territorial Civil Guard (*Suojeluskunta*) districts, raising numbered infantry divisions and wartime infantry regiments (*Jalkaväkirykmentit*, JR 1–JR 61+). Mobile operations were spearheaded by the Jäger brigades and Maj.Gen. Ruben Lagus's *Panssaridivisioona* (1942), supported by specialized wilderness frontier jaegers (*Rajajääkärit*), coastal artillery regiments (*Rannikkotykistörykmentit*), and ad hoc battle groups (*Ryhmä*). Swedish volunteers formed the *Svenska frivilligkåren* (SFK) on the Salla front in 1940 and served in subsequent volunteer detachments.

INEX overrides 15 vanilla groups (`FIN_INF_01`, `FIN_INF_02`, `FIN_INF_04`, `FIN_CAV_01`, `FIN_MOT_01`, `FIN_ARM_01`, `FIN_MEC_01`, `FIN_GAR_01`, `FIN_GAR_02`, `FIN_MIL_01`, `FIN_MIL_02`, `FIN_PEN_01`, `FIN_MAR_01`, `FIN_MTN_01`, `FIN_PAR_01`) and adds 12 new groups (`FIN_INF_05`, `FIN_MOT_02`, `FIN_ARM_02`, `FIN_MEC_02`, `FIN_DET_01`, `FIN_DET_02`, `FIN_SVFK_01`, `FIN_SVFK_02`, `FIN_REG_01`, `FIN_FRN_01`, `FIN_CST_01`, `FIN_GUA_01`), for **27 namelist groups** in total. All empty vanilla focus-scripted stubs spawned by national focuses in *Arms Against Tyranny* are fully authored and gated cleanly by government type.

### Naming convention

Names use Finnish nominative with full native diacritics (*ä, ö*). Division and regimental nicknames are formatted in single quotes after the designation, e.g. *12. Divisioona 'Kollaa'* and *JR 7 'Tyrjän rykmentti'*. Swedish Volunteer Corps (SFK) groups and Swedish-speaking Suojeluskunta districts use Swedish.

Infantry, motorised, armoured, and mechanised divisions come in pairs: the vanilla tag is a plain, un-nicknamed variant (*12. Divisioona*), and a **(Named)** variant carries the historical battle or garrison identities (*12. Divisioona 'Kollaa'*). Each pair shares numbering through `link_numbering_with` to avoid issuing duplicate division numbers.

| Term | Meaning |
|:---|:---|
| *Divisioona* | Division |
| *Prikaati* | Brigade |
| *Jalkaväkirykmentti (JR)* | Infantry Regiment |
| *Rajajääkäri* | Frontier / Border Jaeger |
| *Rannikkoprikaati* | Coastal Brigade |
| *Rannikkotykistörykmentti (RT)* | Coastal Artillery Regiment |
| *Ryhmä* | Group (ad hoc formation) |
| *Osasto* | Detachment |
| *Komennuskunta* | Local command detachment |
| *Paikallisjoukot* | Local (garrison) troops |
| *Suojeluskuntapiiri* | Civil Guard district |
| *Jääkäri* | Jäger / light infantry |
| *Panssari* | Armour |
| *Ratsuväki* | Cavalry |
| *Sissi* | Ranger / guerrilla |
| *Rangaistuspataljoona* | Penal battalion |
| *Mustapaitalegioona* | Blackshirt legion (IKL) |
| *Heimolegioona* | Kindred peoples volunteer legion |
| *Punakaarti* | Red Guard |
| *Kansanarmeija* | People's Army (Terijoki government) |
| *Kuninkaallinen Kaarti* | Royal Guard (Kingdom of Finland) |

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name | Gating / Notes |
|:---|:---|:---|:---|:---|
| `FIN_INF_01` | Infantry Divisions | infantry | `%d. Divisioona` | Universal (Plain variant) |
| `FIN_INF_05` | Infantry Divisions (Named) | infantry | `%d. Divisioona` | Universal (Links: `FIN_INF_01`) |
| `FIN_CAV_01` | Cavalry Brigades | cavalry | `%d. Ratsuväkiprikaati` | Universal |
| `FIN_REG_01` | Infantry Regiments | infantry | `%d. Jalkaväkirykmentti` | Universal (JR 1–70) |
| `FIN_MOT_01` | Motorised Divisions | motorized | `%d. Jääkäridivisioona` | Universal (Plain variant) |
| `FIN_MOT_02` | Motorised Divisions (Named) | motorized | `%d. Jääkäridivisioona` | Universal (Links: `FIN_MOT_01`) |
| `FIN_ARM_01` | Armoured Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panssaridivisioona` | Universal (Plain variant, links: `FIN_MOT_01`) |
| `FIN_ARM_02` | Armoured Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d. Panssaridivisioona` | Universal (Links: `FIN_MOT_01`) |
| `FIN_MEC_01` | Mechanised Divisions | mechanized | `%d. Panssarijääkäridivisioona` | Universal (Plain variant, links: `FIN_MOT_01`) |
| `FIN_MEC_02` | Mechanised Divisions (Named) | mechanized | `%d. Panssarijääkäridivisioona` | Universal (Links: `FIN_MOT_01`) |
| `FIN_GAR_01` | Garrison Divisions | infantry | `%d. Paikallisjoukot` | Universal (Links: `FIN_INF_01`) |
| `FIN_GAR_02` | Suojeluskunta Divisions | infantry | `%d. Suojeluskuntapiiri` | `has_dlc = "Arms Against Tyranny"` |
| `FIN_DET_01` | Command Detachments | infantry, motorized, mechanized | `%d. Komennuskunta` | Universal |
| `FIN_DET_02` | Separate Groups | infantry | `Ryhmä %s` | Universal |
| `FIN_PEN_01` | Penal Battalions | penal_battalion, infantry | `%d. Rangaistuspataljoona` | Universal (Vanilla focus override) |
| `FIN_MAR_01` | Marine Divisions | marine | `%d. Rannikkojääkäridivisioona` | Universal |
| `FIN_MTN_01` | Mountain Divisions | mountaineers | `%d. Sissidivisioona` | Universal |
| `FIN_FRN_01` | Frontier Jaegers | infantry, mountaineers | `%d. Rajajääkäripataljoona` | Universal |
| `FIN_CST_01` | Coastal Brigades | infantry, marine | `%d. Rannikkoprikaati` | Universal |
| `FIN_PAR_01` | Paratrooper Divisions | paratrooper | `%d. Laskuvarjojääkäridivisioona` | Universal |
| `FIN_SVFK_01` | SFK Companies | infantry | `%d. Skyttekompaniet` | Universal (Swedish) |
| `FIN_SVFK_02` | SFK Battle Groups | infantry | `%s. Stridsgruppen` | Universal (Swedish) |
| `FIN_MIL_01` | Blackshirt Legions | infantry, militia | `%d. Mustapaitalegioona` | `has_government = fascism` (Vanilla focus override) |
| `FIN_INF_02` | Legions of Honor | infantry | `%d. Heimolegioona` | `has_government = fascism` (Vanilla focus override) |
| `FIN_MIL_02` | Red Guard Divisions | infantry, militia | `%d. Punakaartin Divisioona` | `has_government = communism` (Vanilla focus override) |
| `FIN_INF_04` | People's Army Divisions | infantry | `%d. Kansanarmeijan Divisioona` | `has_government = communism` (Vanilla focus override) |
| `FIN_GUA_01` | Royal Guards | infantry | `%d. Kuninkaallinen Kaartinrykmentti` | `has_government = neutrality` |

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

1. D (*Varsinais-Suomi*, formation area), 8. D (*Kannas*) and 19. D (*Itä-Karjala*) carry their theatre or region. No 16. Divisioona was raised, so key 16 uses the fallback. Numbers 20–30 represent extended mobilization anchored to Suojeluskunta regions (*Pohjois-Savo*, *Satakunta*, *Etelä-Häme* … *Pohjois-Häme*).

### `FIN_REG_01` — Infantry Regiments (Jalkaväkirykmentit)
Covers historical Finnish wartime regiments (**JR 1 – JR 65+**) with famous commander, battle, and regional identities:
- *JR 7 'Tyrjän rykmentti'* (Adolf Ehrnrooth, 2. D)
- *JR 8 'Ukko-rykmentti'* (Pietari Autti, 11. D)
- *JR 11 'Ässärykmentti'* & *JR 12 'Jänkäjääkärit'* (Albert Puroma, 6. D)
- *JR 16 'Pajarin rykmentti'* (Aaro Pajari, Tolvajärvi)
- *JR 23 'Laurilan rykmentti'* (Matti Laurila, Taipale)
- *JR 28 'Sakkolan rykmentti'* & *JR 29 'Susi-Paavon rykmentti'* (Paavo Susitaival)
- *JR 34 'Kollaan rykmentti'* (Wilhelm Teittinen)
- *JR 47 'Vallilan rykmentti'* & *JR 49 'Vuosalmen rykmentti'* (Ragnar Wahlbeck)
- *JR 50 'Vorna'* & *JR 53 'Kiestinki'* (Jussi Turtola)
- *JR 61 'Tienhaaran rykmentti'* (Alpo Marttinen, Swedish-speaking Vasa distrikt)
- *JR 64 'Suomussalmi'* & *JR 65 'Raatteen rykmentti'* (Winter War border battles)

### `FIN_FRN_01` — Frontier Jaegers (Rajajääkärit)
Border guard battalions and wilderness detachments of the Finnish Border Guard (*Rajavartiolaitos*): *Lapin*, *Kainuun*, *Pohjois-Karjalan*, *Salmin*, and *Kannaksen Rajavartiostot*, Capt. Antti Pennanen's *Petsamon Erillisosasto*, the *1. Rajajääkäriprikaati* (1944), *Rajajääkäripataljoonat 1–8*, and independent border battalions (*Er.P 7*, *Er.P 8*, *Er.P 15*, *Er.P 16*).

### `FIN_CST_01` — Coastal Brigades (Rannikkoprikaatit)
Coastal artillery regiments (*Rannikkotykistörykmentit RT 1 – RT 5*) and fortress brigades protecting the Gulf of Finland, Lake Ladoga, and Lake Onega: *1.–4. Rannikkoprikaatit*, *11.–12. Rannikkoprikaatit*, *Uudenmaan*, *Itä-Suomenlahden*, *Saaristomeren*, *Laatokan*, and *Äänisen Rannikkoprikaatit*.

### `FIN_CAV_01` — Cavalry Brigades (Ratsuväkiprikaati)
Finland fielded the *Ratsuväkiprikaati*, combining the Uusimaa Dragoons and Häme Cavalry Regiment. Entry 1 is the historical brigade, entries 2–3 carry its heritage (*Uudenmaan Rakuunat*, *Hakkapeliitta*), and 4–15 its garrison (*Lappeenranta*) and Finnish regions.

### `FIN_MOT_01` / `FIN_MOT_02` — Motorised Divisions (Jääkäridivisioona)
`FIN_MOT_01` is the plain variant and numbering anchor for all mobile groups. The named `FIN_MOT_02` draws from the Jäger movement: *Lockstedt*, *Misse*, *Aajoki*, *Terijoki*, and *Vaasa*. Later entries are regional.

### `FIN_ARM_01` / `FIN_ARM_02` — Armoured Divisions (Panssaridivisioona)
`FIN_ARM_01` is the plain variant. `FIN_ARM_02` features the historical *Panssaridivisioona 'Lagus'* (1942–44), its battles (*Äänislinna*, *Kuuterselkä*, *Tali*, *Ihantala*, *Portinhoikka*), and armoured garrisons (*Parola*, *Hattula*, *Hämeenlinna*, *Riihimäki*, *Hyrylä*, *Santahamina*).

### `FIN_MEC_01` / `FIN_MEC_02` — Mechanised Divisions (Panssarijääkäridivisioona)
`FIN_MEC_01` is the plain variant; `FIN_MEC_02` names mechanised jäger formations after major garrison cities (*Hamina*, *Kouvola*, *Mikkeli*, *Kuopio* …).

### `FIN_GAR_01` — Garrison Divisions (Paikallisjoukot)
Local garrison troops of 30 cities and regions, from *Helsingin Paikallisjoukot* to *Etelä-Savon Paikallisjoukot*. Links numbering with `FIN_INF_01`.

### `FIN_GAR_02` — Suojeluskunta Divisions (Suojeluskuntapiiri)
Overrides the vanilla group spawned by the Suojeluskunta focus (*Arms Against Tyranny*). Features all 41 historical civil guard districts with correct Finnish and Swedish orthography.

### `FIN_DET_01` — Command Detachments (Komennuskunta)
Local border defense detachments named after 20 parishes of the eastern border zone (*Ilomantsin*, *Lieksan*, *Nurmeksen* …).

### `FIN_DET_02` — Separate Groups (Ryhmä)
Ad hoc corps-level groups: historical formations 1–10 (*Talvela*, *Siilasvuo*, *Susi*, *Sihvo*, *Oinonen*, *Raappana*, *Lapin*, *Pohjois-Suomen*, *Aunuksen*, *Maaselän Ryhmä*) and commander-named wartime groups 11–20 (*Pajari*, *Teittinen*, *Mäkiniemi*, *Vuokko*, *Kekkonen*, *Roininen*, *Suoranta*, *Pennanen*, *Kuussaari*, *Halsti*).

### `FIN_PEN_01` — Penal Battalions (Rangaistusjoukot)
Overrides the vanilla focus-spawned stub (`%d. Rangaistusdivisioona`). Features Maj. Nikke Pärmi's renowned *Erillinen Pataljoona 21 'Pärmin pirut'*, the disciplinary camp companies of *Kovera*, *Kangasjärvi*, and *Säämäjärvi*, the Huuhanmäki training center, and fortress labor battalions.

### `FIN_MAR_01` — Marine Divisions (Rannikkojääkäridivisioona)
Coastal assault divisions named after key island fortresses: *Ahvenanmaa*, *Hanko*, *Porkkala*, *Suursaari*, *Tytärsaari*, *Koivisto*, *Saarenpää*, *Utö*, *Örö*, *Kotka*.

### `FIN_MTN_01` — Mountain Divisions (Sissidivisioona)
Wilderness ranger divisions for the northern front (*Kuhmo*, *Kuusamo*, *Petsamo*, *Pelkosenniemi*, *Ivalo* …) and Er.P 4 long-range patrol detachments (*Osasto Marttina*, *Osasto Vehniäinen*, *Osasto Kuismanen*, *Osasto Paatsalo*).

### `FIN_PAR_01` — Paratrooper Divisions (Laskuvarjojääkäridivisioona)
Airborne divisions named after the long-range patrol tradition (*Kaukopartio*) and Finnish Air Force air bases (*Utti*, *Immola*, *Malmi*, *Kauhava*, *Tikkakoski* …).

### `FIN_SVFK_01` / `FIN_SVFK_02` — Swedish Volunteer Corps (SFK)
The *Svenska frivilligkåren* (1940). `FIN_SVFK_01` contains the complete 20-company roster (rifle, jäger, and heavy companies). `FIN_SVFK_02` lists *I.–III. Stridsgruppen*, *Svenska Frivilligbataljonen 'Hangö'* (1941), *Svenska Frivilligkompaniet 'Svir'* (1942–44), commander battle groups (*Dyrssen*, *Tamm*, *Hanngren*, *Ehrensvärd*, *Berggren*, *Linder*), and the volunteer air wing *Flygflottilj 19 'Kemi'*. All entries in **Swedish**.

### `FIN_MIL_01` — Blackshirt Legions (Mustapaitalegioonat)
Fascist party militias overriding vanilla `FIN_MIL_01` (`can_use = { has_government = fascism }`). Features *Isänmaallinen kansanliike* (IKL), *Sinimustat*, and *Akateeminen Karjala-Seura* (AKS) shock battalions, martyr units (*Bobi Sivén*, *Elmo Kaila*, *Vihan Veljet*), provincial chapters, and *Suur-Suomi* assault brigades (*Aunus*, *Viena*, *Inkeri*, *Kuola*).

### `FIN_INF_02` — Legions of Honor (Heimolegioonat)
Kindred peoples and foreign volunteer formations overriding vanilla `FIN_INF_02` (`can_use = { has_government = fascism }`): *Heimopataljoona 3* (Ingrian/Karelian volunteers), *JR 200 'Suomen-pojat'* (Estonian volunteers), *Pohjan Poikain Rykmentti*, *I Suomalainen Vapaajoukko*, *Aunuksen Karjalan Rykmentit*, *Vienan Rykmentti*, *Pohjois-Inkerin Rykmentti*, and Nordic/international volunteer corps.

### `FIN_MIL_02` — Red Guard Divisions (Punakaartin Divisioona)
Communist revolutionary militias overriding vanilla `FIN_MIL_02` (`can_use = { has_government = communism }`). Features historical 1918 Red Guard regional regiments (*Helsinki 1.–3.*, *Porttu*, *Sörnäinen*, *Kallio*, *Tampere*, *Häme*, *Turku*, *Viipuri*, *Kymenlaakso*, *Kotka*, *Kouvola*, *Lahti*, *Pori*, *Lappeenranta*, *Pietarin suomalainen punakaarti*) and industrial workers' battalions.

### `FIN_INF_04` — People's Army Divisions (Kansanarmeijan Divisioona)
Overrides vanilla `FIN_INF_04` (`can_use = { has_government = communism }`). Features regular formations of the 1939–1940 Terijoki puppet government (*Suomen Kansanarmeijan 1.–4. Divisioona*, *1. Kansanpanssarirykmentti*) and Finnish-Karelian Red Army partisan detachments (*Taisto*, *Ukko*, *Bolshevik*, *Napapiiri*, *Punatähti*).

### `FIN_GUA_01` — Royal Guards (Kuninkaallinen Kaarti)
Monarchist guard formations (`can_use = { has_government = neutrality }`) for the 1918 Kingdom of Finland path under King Kaarle I (Friedrich Karl of Hesse). Anchored in the *Suomen Kaarti* (Life Guards) heritage, *Kaartin Jääkärirykmentti*, *Kuninkaallinen Henkivartioväki*, Queen Margarete and Crown Prince Wolfgang regiments, and historical provincial royal regiments.

