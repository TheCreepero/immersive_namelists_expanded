# Lithuania

**Country Tag:** `LIT` | **Source File:** [`zz_INEX_LIT_names_divisions.txt`](../common/units/names_divisions/zz_INEX_LIT_names_divisions.txt)

---

## Historical Overview

The Lithuanian Army (*Lietuvos kariuomenė*) of 1920-1940 had three infantry divisions (*1-oji*, *2-oji* and *3-ioji pėstininkų divizija*), nine infantry regiments named after the rulers of the Grand Duchy (*1-asis pėstininkų Lietuvos didžiojo kunigaikščio Gedimino pulkas* to *9-asis pėstininkų Lietuvos kunigaikščio Vytenio pulkas*), four artillery regiments, three cavalry regiments (the *Jonušas Radvila* Hussars, the *Birutė* Uhlans and the *Geležinis Vilkas* Dragoons), an armoured unit (*Šarvuočių rinktinė*) and the armoured trains *Gediminas*, *Kęstutis* and *Algirdas*. Behind it stood the Riflemen's Union (*Lietuvos šaulių sąjunga*), one *rinktinė* per county. The Army wrote the ordinal with a gendered ending (*1-oji divizija*, *3-iasis pulkas*) and put an honorific in the genitive before the noun.

The divisions themselves were never named, so the Named lists extend the regiments' pattern: regions, lands of the medieval Grand Duchy and county towns for infantry (*3-ioji pėstininkų Žemaitijos divizija*), and rivers, battles and rulers for the mobile and armoured lists, in the style of the modern brigades *Žemaitija* and *Žalgiris*. Nicknames stand in straight single quotes because the game's map font has no Lithuanian quotation marks.

INEX replaces all nine vanilla lists, whose fallbacks were broken Lithuanian (*Motorizavimas*, *Apsisarvavimas*), nonsense (*Juras Peizazas*, "sea landscape", for marines) or not Lithuanian at all (the Albanian *Bjeshkë* for mountain troops). Every vanilla number is written over, so none of vanilla's texts show.

Lithuania starts in 1936 under Smetona (`neutrality`). The Royal Guard (`neutrality`), Iron Wolf (`fascism`), Red Rifle (`communism`) and Freedom Fighter (`democratic`) lists are gated by government type only and never mix traditions.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `LIT_INF_01` | Infantry Divisions | infantry | `%d-oji pėstininkų divizija` |
| `LIT_INF_02` | Infantry Divisions (Named) | infantry | `%d-oji pėstininkų divizija` |
| `LIT_REG_01` | Infantry Regiments | infantry | `%d-asis pėstininkų pulkas` |
| `LIT_MOT_01` | Motorized Divisions | motorized | `%d-oji motorizuotoji pėstininkų divizija` |
| `LIT_MEC_01` | Mechanized Divisions | mechanized | `%d-oji mechanizuotoji pėstininkų divizija` |
| `LIT_MOT_02` | Motorized Divisions (Named) | motorized | `%d-oji motorizuotoji pėstininkų divizija` |
| `LIT_MEC_02` | Mechanized Divisions (Named) | mechanized | `%d-oji mechanizuotoji pėstininkų divizija` |
| `LIT_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d-oji tankų divizija` |
| `LIT_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d-oji tankų divizija` |
| `LIT_CAV_01` | Cavalry Regiments | cavalry | `%d-asis kavalerijos pulkas` |
| `LIT_PAR_01` | Paratrooper Divisions | paratrooper | `%d-oji oro desanto divizija` |
| `LIT_MAR_01` | Marine Divisions | marine | `%d-oji jūrų pėstininkų divizija` |
| `LIT_MNT_01` | Mountain Divisions | mountaineers | `%d-oji kalnų pėstininkų divizija` |
| `LIT_GAR_01` | Garrisons & Border Guards | infantry | `%d-oji įgulos divizija` |
| `LIT_SAU_01` | Riflemen's Union | militia, infantry | `%s šaulių rinktinė` |
| `LIT_GUA_01` | Royal Guard Divisions | infantry, cavalry, light_armor, medium_armor, heavy_armor, modern_armor | `%d-oji gvardijos divizija` |
| `LIT_GV_01` | Iron Wolf Divisions | infantry, militia | `%d-oji Geležinio Vilko divizija` |
| `LIT_RED_01` | Red Rifle Divisions | infantry, motorized | `%d-oji lietuviškoji šaulių divizija` |
| `LIT_LLK_01` | Freedom Fighters | infantry, militia | `%d-oji laisvės kovotojų divizija` |

> **Note:** Ordinals carry Lithuanian definite endings: feminine *-oji* for *divizija* and *rinktinė*, masculine *-asis* for *pulkas*, with *-ioji* and *-iasis* after a final 3 (*3-ioji*, *23-iasis*, but *13-oji*). The fallback cannot change the ending, so the plain lists write their numbers out (infantry to 40, the others to 25); a fallback number past them that ends in 3 shows *-oji*. The Riflemen's Union keeps the Roman numerals it used (*XX Klaipėdos rinktinė*).

---

## Group Details

### Field army

### `LIT_INF_01` — Infantry Divisions
Overrides vanilla LIT_INF_01 (the group the vanilla focus *Anti-Communist Militia* gives its template) as the plain variant. Keys 1-40 are written out, so vanilla's *I. Divizija* texts do not show and 23 and 33 take *-ioji*.

### `LIT_INF_02` — Infantry Divisions (Named)
Shares numbering with LIT_INF_01. The three interwar divisions by their 1940 areas (*1-oji pėstininkų Vilniaus divizija*, *2-oji ... Kauno*, *3-ioji ... Žemaitijos*), then the ethnographic regions (*Aukštaitija*, *Dzūkija*, *Suvalkija*, *Mažoji Lietuva*), the lands of the medieval Grand Duchy (*Deltuva*, *Nalšia*, *Upytė*, *Skalva*) and county towns. All names are extensions of the regiment pattern *10-asis pėstininkų Marijampolės pulkas*.

### `LIT_REG_01` — Infantry Regiments
The army's regiments with their official patrons: Gediminas, Algirdas, Vytautas, King Mindaugas, Kęstutis, Margis of Pilėnai, Butegeidis of Samogitia, Vaidotas of Kaunas and Vytenis (keys 1-9), the *Marijampolės*, *Kauno* and volunteer (*savanorių*) regiments of 1919-1924 (keys 10, 12, 13). Keys 11 and 14-27 extend the pattern with further dukes and heroes of the independence wars (*Antanas Juozapavičius*, *Povilas Lukšys*).

### Motorized, mechanized and armour

### `LIT_MOT_01` — Motorized Divisions
Overrides vanilla LIT_MOT_01 as the plain variant and anchors the numbering of the four mobile groups.

### `LIT_MEC_01` — Mechanized Divisions
Overrides vanilla LIT_MEC_01 as the plain variant; shares numbering with LIT_MOT_01.

### `LIT_MOT_02` — Motorized Divisions (Named)
Rivers, after the modern brigades *Žemaitija* and *Aukštaitija*: *1-oji motorizuotoji pėstininkų divizija 'Nemunas'*, *'Neris'*, *'Nevėžis'*, *'Dubysa'*. Shares numbering with LIT_MOT_01.

### `LIT_MEC_02` — Mechanized Divisions (Named)
Battles of the Grand Duchy (*'Saulė'*, *'Durbė'*, *'Žalgiris'*, *'Orša'*) and of the 1919-1920 wars (*'Giedraičiai'*, *'Širvintos'*, *'Radviliškis'*). Shares numbering with LIT_MOT_01.

### `LIT_ARM_01` — Armored Divisions
Overrides vanilla LIT_ARM_01 as the plain variant.

### `LIT_ARM_02` — Armored Divisions (Named)
Named after the armoured trains of 1920-1935 (*'Gediminas'*, *'Kęstutis'*, *'Algirdas'*), further rulers and thunder and lightning (*'Perkūnas'*, *'Žaibas'*), with the interwar *Šarvuočių rinktinė*. Shares numbering with LIT_ARM_01.

### Cavalry

### `LIT_CAV_01` — Cavalry Regiments
Overrides vanilla LIT_CAV_01. The three interwar regiments (*1-asis husarų kunigaikščio Jonušo Radvilos pulkas*, *2-asis ulonų Lietuvos didžiosios kunigaikštienės Birutės pulkas*, *3-iasis dragūnų Geležinio Vilko pulkas*), then extrapolated hussars after the Grand Hetmans, uhlans after grand duchesses and queens, and dragoons after the legendary princes of the chronicles.

### Specialist troops

### `LIT_PAR_01` — Paratrooper Divisions
Lithuania had no airborne troops; the list honours its aviators and aircraft: *'Lituanica'*, *'Steponas Darius'*, *'Stasys Girėnas'*, *'Feliksas Vaitkus'*, *'ANBO'*.

### `LIT_MAR_01` — Marine Divisions
Places of the Klaipėda coast and the Curonian Spit: *'Klaipėda'*, *'Palanga'*, *'Nida'*, *'Juodkrantė'*, *'Kuršių nerija'*.

### `LIT_MNT_01` — Mountain Divisions
Lithuania has no mountains: the highest hills and the great hillforts (*'Aukštojas'*, *'Medvėgalis'*, *'Šatrija'*, *'Rambynas'*, *'Kernavė'*, *'Apuolė'*). Shares numbering with LIT_INF_01, as vanilla does.

### Garrisons and territorial defence

### `LIT_GAR_01` — Garrisons & Border Guards
The garrison towns of the interwar army, from the Kaunas Fortress (*Kauno tvirtovės įgula*) to Ukmergė, Panevėžys and Tauragė, and the border guard division, brigade and regiments of 1919-1924. Shares numbering with LIT_INF_01, as vanilla does.

### `LIT_SAU_01` — Riflemen's Union
The county *rinktinės* of the *Lietuvos šaulių sąjunga* in the Union's own form: *II Utenos*, *XIV Marijampolės*, *XX Klaipėdos* (dissolved in 1939), the railwaymen's *XXII Geležinkelių* and the *XXIII Vilniaus* formed in 1939, then the counties whose numbers are not known. The fallback fills the free Roman numbers.

### Ideology suites

### `LIT_GUA_01` — Royal Guard Divisions (neutrality)
For the monarchy path (the vanilla focus *Institute Royal Guards*): guard divisions after the 1918 king Mindaugas II and the kings of the union with Poland (*Jogaila*, *Žygimantas Augustas*, *Steponas Batoras*), and the guard, vanguard and Tatar regiments of the Grand Duchy (*LDK pėstininkų gvardijos regimentas*, *7-asis Lietuvos totorių pulkas*). The division names are extensions.

### `LIT_GV_01` — Iron Wolf Divisions (fascism)
Voldemaras's Iron Wolf (*Geležinis Vilkas*, 1927-1930), by its county groups: Kaunas, Panevėžys, Raseiniai, the Vilnius region, Pagėgiai, Šilutė and Klaipėda are attested, the rest are extensions. No formation of 1941 is used.

### `LIT_RED_01` — Red Rifle Divisions (communism)
The 16th Lithuanian Rifle Division (*16-oji lietuviškoji šaulių divizija*, Klaipėda honorific of 1945), the 29th Territorial Rifle Corps of 1940-1941 with its 179th and 184th Rifle Divisions, each on its own number, the Lithuanian Division of 1919, and extended Red divisions and patrons (*Vinco Kapsuko divizija*).

### `LIT_LLK_01` — Freedom Fighters (democratic)
The armed resistance of the Union of Lithuanian Freedom Fighters (LLKS), whose 1949 declaration set a democratic republic as its aim: its districts (*Vyčio*, *Tauro*, *Dainavos*, *Žemaičių apygarda*), the three regions of the declaration, the *Šarūno rinktinė* and the Lithuanian Liberty Army.
