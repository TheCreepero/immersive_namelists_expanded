# Iran

**Country Tag:** `PER` | **Source File:** [`INEX_PER_names_divisions.txt`](../common/units/names_divisions/INEX_PER_names_divisions.txt)

---

## Historical & Alternate-History Overview

After the 1921 coup led by Reza Khan's Hamadan detachment of the Persian Cossack Division, the Cossacks, the Swedish-officered Gendarmerie, and assorted provincial forces were merged into a single national army (*Artesh*). The new army was first organized into five regional divisions (Central/Tehran, Northwest/Tabriz, West/Hamadan, South/Isfahan, East/Mashhad) and grew to roughly 16–18 divisions by 1941. It also formed an Imperial Guard and a small armored brigade in Tehran equipped with Czechoslovak ČKD TNH tanks and AH-IV tankettes. Reza Shah's campaigns to settle and disarm the tribes never fully broke the military power of the great confederations (Bakhtiari, Qashqai, the Kurdish and Lur tribes), which re-emerged after the Anglo-Soviet invasion of August 1941.

The vanilla game provides nine single-entry placeholder groups for Iran, none of which are referenced by focus trees or scripted effects. INEX overrides all nine with full lists and adds four new groups, for **13 namelist groups** in total. The vanilla focus tree already names *Imperial Guard* and *Immortal Legion* divisions (`PER_expand_imperial_guard`, `PER_expand_unique_unit`) and links the Bakhtiari to mountain warfare (`PER_recruit_bakhtiari`). INEX builds on those precedents.

### Romanization

Hearts of Iron IV cannot render Perso-Arabic script, so all names use a plain, readable transliteration without macrons. The Persian *izafe* linker is written `-e` after consonants and `-ye` after vowels: *Lashkar-e 1-e Piyadeh-ye Tehran* ("1st Infantry Division of Tehran"). Place names follow Pahlavi-era usage (*Rezaiyeh*, *Bandar Shahpur*, *Bandar Pahlavi*, *Bandar Shah*), while the Cossack list uses the older Qajar names (*Astarabad*, *Soltanabad*, *Urmia*).

| Term | Meaning |
|:---|:---|
| *Lashkar* | Division |
| *Tip* | Brigade |
| *Gordan* | Battalion |
| *Atriad* | Detachment (Cossack usage, from Russian *otryad*) |
| *Piyadeh* | Infantry |
| *Motori* / *Mekanizeh* | Motorized / Mechanized |
| *Zerehi* | Armored |
| *Savar* | Cavalry |
| *Kuhestani* | Mountain |
| *Chatrbaz* | Paratrooper |
| *Tofangdar-e Daryayi* | Naval rifleman (marine) |
| *Shotorsavar* | Camel rider |
| *Cherik-e Ashayeri* | Tribal irregulars |
| *Gard-e Shahanshahi* / *Gard-e Javidan* | Imperial Guard / Immortal Guard |
| *Amniyeh* / *Zhandarmeri* | Rural security force / Gendarmerie |

---

## Namelist Groups Summary

| Group Tag | UI Selector Name | Division Types | Fallback Format |
|:---|:---|:---|:---|
| `PER_INF_01` | Infantry Divisions | infantry | `Lashkar-e %d-e Piyadeh` |
| `PER_MOT_01` | Motorized Divisions | motorized | `Lashkar-e %d-e Piyadeh-ye Motori` |
| `PER_MEC_01` | Mechanized Divisions | mechanized | `Lashkar-e %d-e Piyadeh-ye Mekanizeh` |
| `PER_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `Lashkar-e %d-e Zerehi` |
| `PER_CAV_01` | Cavalry Divisions | cavalry | `Lashkar-e %d-e Savar` |
| `PER_GRD_01` | Imperial Guard | infantry, motorized, mechanized | `Lashkar-e %d-e Gard-e Shahanshahi` |
| `PER_COS_01` | Cossack Detachments | cavalry, motorized | `Atriad-e %d-e Qazzaq` |
| `PER_GAR_01` | Garrison & Gendarmerie | infantry | `Tip-e %d-e Amniyeh` |
| `PER_MTN_01` | Mountain Brigades | mountaineers | `Tip-e %d-e Kuhestani` |
| `PER_MAR_01` | Marine Brigades | marine | `Tip-e %d-e Tofangdar-e Daryayi` |
| `PER_PAR_01` | Paratroopers | paratrooper | `Gordan-e %d-e Chatrbaz` |
| `PER_TRL_01` | Tribal Levies | infantry, cavalry | `Tip-e %d-e Cherik-e Ashayeri` |
| `PER_CAM_01` | Camel Corps | camelry | `Gordan-e %d-e Shotorsavar` |

All groups use `can_use = { always = yes }`. `PER_MOT_01` and `PER_MEC_01` share numbering with `PER_INF_01` through `link_numbering_with`.

---

## Detailed Group Descriptions

### 1. Regular Army (*Artesh-e Shahanshahi*)

- **`PER_INF_01` — Infantry Divisions** (45 entries): Numbered divisions tied to a garrison city. The list starts with the capital and the key garrisons of the original regional commands (Tehran, Tabriz, Hamadan, Kermanshah, Isfahan, Shiraz, Mashhad) and extends across every province, from *Lashkar-e 1-e Piyadeh-ye Tehran* to *Lashkar-e 45-e Piyadeh-ye Shahrud*.
- **`PER_MOT_01` / `PER_MEC_01` — Motorized & Mechanized Divisions**: Linked to the infantry numbering, so a given number always belongs to the same garrison city whatever the unit type (*Lashkar-e 27-e Piyadeh-ye Motori-ye Ahvaz*, *Lashkar-e 4-e Piyadeh-ye Mekanizeh-ye Tabriz*). This reflects the lorry-borne infantry that the Trans-Iranian Railway and truck imports of the 1930s made possible.
- **`PER_ARM_01` — Armored Divisions**: An extrapolation from the 1941 Tehran armored brigade. The first eight divisions are regional (*Lashkar-e 1-e Zerehi-ye Tehran*, *Lashkar-e 3-e Zerehi-ye Khuzestan*). The rest are named after heroes of Ferdowsi's *Shahnameh* and ancient kings: *Kaveh* the blacksmith, *Rostam* and his horse *Rakhsh*, the invulnerable *Esfandiyar-e Ruyintan*, the royal banner *Derafsh-e Kaviani*, *Kourosh*, *Dariush*, and *Nader*.
- **`PER_CAV_01` — Cavalry Divisions**: Provincial horse cavalry from the traditional horse-breeding regions: Azerbaijan, the Moghan steppe, Kurdistan, Turkaman Sahra, Quchan, Fars, and Luristan.

### 2. Imperial Guard (*Gard-e Shahanshahi*)

- **`PER_GRD_01` — Imperial Guard**: Extends the vanilla focus-spawned *1st/2nd Imperial Guard* and *Immortal Legion* divisions into a full elite list. It starts with the *Gard-e Shahanshahi* and the Achaemenid-revival *Gard-e Javidan* (Immortal Guard), then adds divisions honoring Persian rulers and heroes from Cyrus the Great (*Kourosh-e Bozorg*) and Darius, through Ardashir, Shapur, and Khosrow Anushiravan, to Shah Abbas the Great, Nader Shah, and Karim Khan Zand.

### 3. Persian Cossacks (*Qazzaq-khaneh*, 1879–1921)

- **`PER_COS_01` — Cossack Detachments**: The Russian-officered Persian Cossack Brigade (later Division) garrisoned the provinces in *atriads* (detachments). The Hamadan atriad under Reza Khan carried out the February 1921 coup. The list uses Qajar-era city names (*Atriad-e 2-e Qazzaq-e Hamadan*, *Atriad-e 12-e Qazzaq-e Astarabad*) and suits monarchist or Qajar-restoration play.

### 4. Garrison & Gendarmerie (*Amniyeh / Zhandarmeri*)

- **`PER_GAR_01` — Garrison & Gendarmerie**: Provincial security commands (*Zhandarmeri-ye Azerbaijan*, *Zhandarmeri-ye Baluchistan va Sistan*, *Zhandarmeri-ye Pusht-e Kuh*). They carry on the Swedish-officered Government Gendarmerie (1911–1921) and the Amniyeh road guards that policed roads, tribes, and borders under Reza Shah. Numbered overflow units become *Tip-e %d-e Amniyeh*.

### 5. Specialized Formations

- **`PER_MTN_01` — Mountain Brigades**: Named after the Bakhtiari highlands and Iran's mountain ranges and peaks: Zagros, Alborz, Damavand, Sabalan, Sahand, Dena, Zardkuh, Oshtorankuh, Talesh, Binalud, and Taftan. Replaces vanilla's invalid *Kuhnabard*.
- **`PER_MAR_01` — Marine Brigades**: Naval rifle brigades for the Persian Gulf ports (Khorramshahr, Bandar Shahpur, Abadan, Bushehr, Bandar Abbas, Jask, Chabahar), the Gulf islands (Qeshm, Hormoz, Khark, Kish), and the Caspian coast (Bandar Pahlavi, Bandar Shah, Noshahr, Babolsar, Astara).
- **`PER_PAR_01` — Paratroopers**: Airborne battalions named after the birds of Persian myth and falconry: the *Simorgh*, the royal *Homa*, the eagle (*Oqab*), and the falcons *Shahin* and *Baz*. Later battalions are named after cities.

### 6. Tribal Levies & Frontier Forces

- **`PER_TRL_01` — Tribal Levies**: Irregular brigades from Iran's tribal confederations and clans. These include the Bakhtiari, Qashqai, and Khamseh of the south; the Lur Mamasani, Boir Ahmad, Kuhgiluyeh, and Papi; the Kurdish Kalhor, Sanjabi, Guran, Jaf, Mokri, Shikak, and Herki; the Shahsevan and Afshar of Azerbaijan; the Turkmen Yomut and Goklan; and the Baluch, the Arab Bani Ka'b and Bani Torof, and the Hazara.
- **`PER_CAM_01` — Camel Corps**: Camel-mounted frontier battalions for Baluchistan and Sistan (Zahedan, Zabol, Khash, Saravan) and the great deserts (*Gordan-e 13-e Shotorsavar-e Dasht-e Lut*, *Dasht-e Kavir*).
