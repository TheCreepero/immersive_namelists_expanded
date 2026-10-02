# Italy

**Country Tag:** `ITA` | **Source File:** [`INEX_ITA_names_divisions.txt`](../common/units/names_divisions/INEX_ITA_names_divisions.txt)

---

## Historical Overview

The Regio Esercito named its divisions after cities, regions, rivers and battles, and INEX keeps those names on their real division numbers. Motorized, mechanized, armored and paratrooper lists share numbering with the infantry, so *9a Divisione 'Pasubio'* is either infantry or autotrasportabile, never both. Separate lists cover the colonial troops of Libya and East Africa (divisions, bands and battalions), the cavalry, the Alpini, Bersaglieri and Arditi, the Frontier Guard, Carabinieri and Guardia di Finanza, and the 1943–45 Resistance.

Ideology-gated lists: the MVSN Blackshirt divisions, legions and specialist militias, the Social Republic's army, the Black Brigades and the Fiume and Albanian irredentist legions (fascism), a Royal Army list built on the 1943–45 Co-Belligerent Army (neutrality/democratic), Republican volunteer legions drawn from the Risorgimento (democratic), a Communist list with a Red Guards suite, and the partisan formations gated by party tradition. Legione Romana is fascist-only and never picked by the AI.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `ITA_INF_01` | Infantry Divisions | infantry | `%da Divisione di Fanteria` |
| `ITA_INF_02` | Blackshirt Divisions | militia | `%da Divisione CC.NN.` |
| `ITA_LEG_01` | Blackshirt Legions | militia | `%da Legione CC.NN.` |
| `ITA_RSI_01` | Republican Army Divisions | infantry, mountaineers, marine, paratrooper | `%da Divisione` |
| `ITA_BRN_01` | Black Brigades | militia | `%da Brigata Nera` |
| `ITA_MONCH_01` | Royal Army Divisions | infantry, mechanized, mountaineers, paratrooper, marine | `%da Divisione` |
| `ITA_COM_01` | Communist Divisions | infantry, mechanized, mountaineers, paratrooper, marine | `%da Divisione Comunista` |
| `ITA_COL_01` | Colonial Divisions | infantry | `%da Divisione Coloniale` |
| `ITA_COL_02` | Irregular Bands | irregular_infantry | `%d° Gruppo Bande Irregolari` |
| `ITA_COL_03` | Dubat Bands | irregular_infantry | `%da Banda di Confine dei Dubat` |
| `ITA_CAV_01` | Cavalry Regiments | cavalry | `%d° Reggimento di Cavalleria` |
| `ITA_CAV_02` | Cavalry Divisions | cavalry | `%da Divisione Celere` |
| `ITA_CAV_03` | Colonial Cavalry | cavalry | `%d° Gruppo Cav. Coloniale` |
| `ITA_CAV_04` | Savari Squadron Groups | cavalry | `%d° Gruppo Squadroni Savari` |
| `ITA_CAV_05` | Spahis Squadron Groups | cavalry, camelry | `%d° Gruppo Squadroni Spahis` |
| `ITA_CAV_06` | Mounted Irregular Bands | cavalry | `%d° Gruppo Bande a Cavallo` |
| `ITA_GAL_01` | Garibaldi Divisions | militia | `%da Divisione Garibaldi` |
| `ITA_GEL_01` | Giustizia e Libertà | militia | `%da Divisione GL` |
| `ITA_MAT_01` | Matteotti Formations | militia | `%da Divisione Matteotti` |
| `ITA_AUT_01` | Autonomous Formations | militia | `%da Divisione Autonoma` |
| `ITA_FAV_01` | Fiamme Verdi Formations | militia | `%da Divisione Fiamme Verdi` |
| `ITA_ALT_01` | Other Partisan Formations | militia | `%da Brigata Autonoma` |
| `ITA_MOT_01` | Motorized Divisions | motorized | `%da Divisione Motorizzata` |
| `ITA_MEC_01` | Mechanized Divisions | mechanized | `%da Divisione Meccanizzata` |
| `ITA_MEC_02` | Mechanized Divisions (Named) | mechanized | `%da Divisione Meccanizzata` |
| `ITA_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%da Divisione Corazzata` |
| `ITA_MAR_01` | Marine Regiments | marine | `%d° Reggimento da Sbarco` |
| `ITA_MAR_02` | Marine Divisions | marine | `%da Divisione Fanteria di Marina` |
| `ITA_MNT_01` | Mountain Divisions | mountaineers | `%da Divisione Alpina` |
| `ITA_PAR_01` | Paratrooper Divisions | paratrooper | `%da Divisione Paracadutisti` |
| `ITA_RGR_01` | Bersaglieri Divisions | ranger_battalion | `%da Divisione Bersaglieri` |
| `ITA_ARD_01` | Arditi Assault Units | infantry | `%da Divisione d'Assalto` |
| `ITA_FES_01` | Defence Brigades | infantry | `%da Brigata Difesa` |
| `ITA_GAR_01` | Coastal Divisions | infantry | `%da Divisione Costiera` |
| `ITA_GAF_01` | Frontier Guard Sectors | infantry | `%s Settore di Copertura` |
| `ITA_CAR_01` | Carabinieri Formations | infantry | `%da Legione Carabinieri` |
| `ITA_ROM_01` | Legione Romana | infantry, light_armor, medium_armor, heavy_armor, modern_armor | `Legio %s` |
| `ITA_MIL_01` | Blackshirt Special Militias | militia | `%da Legione Speciale CC.NN.` |
| `ITA_GDF_01` | Finance Guard Formations | infantry | `%s Battaglione Mobilitato GdF` |
| `ITA_COL_04` | Colonial Battalions | infantry | `%s Battaglione Coloniale` |
| `ITA_REP_01` | Republican Volunteer Legions | infantry, militia | `%da Legione Repubblicana` |
| `ITA_RED_01` | Red Guards | militia, infantry | `%da Guardia Rossa` |
| `ITA_IRR_01` | Irredentist Legions | infantry | `%da Legione Irredentista` |

---

## Group Details

### `ITA_INF_01` — Infantry Divisions
The 1935–43 infantry divisions on their real numbers, from *1a Divisione di Fanteria 'Superga'* to *65a 'Granatieri di Savoia'*, plus the 151–159 occupation divisions (*'Perugia'*, *'Zara'*, *'Veneto'*). Key 136 is *'Giovani Fascisti'*, which shares its number with the armored *'Centauro II'*.

### `ITA_INF_02` — Blackshirt Divisions
MVSN *Camicie Nere* divisions, fascism only: the seven 1935–43 divisions (*'23 Marzo'*, *'28 Ottobre'*, *'Tevere'*, *'Cirene'*), the Spanish CTV divisions (*'Dio lo Vuole'*, *'Fiamme Nere'*, *'Penne Nere'*) and two extrapolations from MVSN legion names.

### `ITA_LEG_01` — Blackshirt Legions
Fascism only. The MVSN's numbered *Legioni CC.NN.* on their real numbers, from *1a Legione CC.NN. 'Sabauda'* (Turin) through *63a 'Tagliamento'* and *112a 'Dell'Urbe'* (Rome) to *201a 'Conte Verde'* (Rhodes).

### `ITA_RSI_01` — Republican Army Divisions
Fascism only. The Italian Social Republic's four ENR divisions (*1a Bersaglieri 'Italia'*, *2a Granatieri 'Littorio'*, *3a Fanteria di Marina 'San Marco'*, *4a Alpina 'Monterosa'*), a plausible expansion named after RSI battalions (*'Barbarigo'*, *'Lupo'*, *'Scirè'*), and the Decima MAS, GNR and paratrooper formations (*Divisione 'Etna'*, *1° Reggimento Arditi Paracadutisti 'Folgore'*).

### `ITA_BRN_01` — Black Brigades
Fascism only. The 1944–45 *Brigate Nere* by number, each named after a fallen fascist (*8a Brigata Nera 'Aldo Resega'*, Milan), plus the mobile and autonomous brigades.

### `ITA_MONCH_01` — Royal Army Divisions
Neutrality or democratic. The Co-Belligerent Army's *Gruppi di Combattimento* (*'Cremona'*, *'Friuli'*, *'Folgore'*, *'Legnano'*, *'Mantova'*, *'Piceno'*), the *1° Raggruppamento Motorizzato* and *Divisione 'Utili'*, then House of Savoy names, Great War commanders (*'Cadorna'*, *'Diaz'*) and battle honours (*'Vittorio Veneto'*, *'Porta Pia'*).

### `ITA_COM_01` — Communist Divisions
Communism only. Revolutionary titles plus Italian labour-movement traditions: *'Arditi del Popolo'*, *'Antonio Gramsci'*, *'Ordine Nuovo'*, *'Biennio Rosso'*, *'Guadalajara'*.

### `ITA_COL_01` — Colonial Divisions
*1a Divisione Libica 'Sibille'* and *2a 'Pescatori'* (1940), the 1935–36 Eritrean divisions, and the *101a* and *102a Divisione Somala* (1940–41).

### `ITA_COL_02` / `ITA_COL_03` — Irregular Bands / Dubat Bands
East African *bande*: *'Uollo Ambassel'* and *'Kai Bandera'*. The Somali Dubat bands were numbered rather than named, so `ITA_COL_03` uses its fallback only.

### `ITA_CAV_01` — Cavalry Regiments
The regiments in service in June 1940 on their own numbers: *1° 'Nizza Cavalleria'*, *2° 'Piemonte Reale Cavalleria'*, *5° 'Lancieri di Novara'*, *9° 'Lancieri di Firenze'*, *19° 'Cavalleggeri Guide'* and others.

### `ITA_CAV_02` — Cavalry Divisions
The three *Divisioni Celeri*: *'Eugenio di Savoia'*, *'Emanuele Filiberto Testa di Ferro'*, *'Principe Amedeo Duca d'Aosta'*.

### `ITA_CAV_03` / `ITA_CAV_04` / `ITA_CAV_05` / `ITA_CAV_06` — Colonial Cavalry
*'Penne di Falco'* colonial cavalry; Libyan *Savari* (regular) and *Spahis* (irregular) squadron groups, which use their fallbacks only; and Amedeo Guillet's *Gruppo Bande a Cavallo 'Amhara'* with its bands *'Guillet'*, *'Togni'*, *'Cara'*, *'Lucarelli'* and *'Battizzocco'*.

### `ITA_GAL_01` — Garibaldi Divisions
PCI-led *Brigate Garibaldi*, communism only, grouped by region: Piemonte (*2a 'Redi'*, *12a 'Nedo'*), Lombardia, Liguria (*'Pinan-Cichero'*, *'Cascione'*), Emilia-Romagna (*28a Brigata 'Mario Gordini'*), Veneto (*'Nino Nannetti'*, *'Ateo Garemi'*) and the *Divisione Italiana Partigiana 'Garibaldi'* in Montenegro.

### `ITA_GEL_01` — Giustizia e Libertà
Partito d'Azione formations (democratic or communist): the Piedmontese *Divisioni Alpine GL* (*5a 'Sergio Toja'*, *7a 'Pedro Ferreira'*), the *Gruppo Mobile Operativo*, *2a 'Massenzio Masia'*, Brescia's *'Monte Suello'* and the Genoese *Divisione GL 'Matteotti'*.

### `ITA_MAT_01` — Matteotti Formations
PSIUP formations (democratic or communist) named after Giacomo Matteotti: *'Bruno Buozzi'*, *'Italo Rossi'*, *'Giorgio D'Avito'*, *'Renzo Cattaneo'*, *1a Brigata d'Assalto Matteotti*.

### `ITA_AUT_01` — Autonomous Formations
Military and non-party formations (neutrality or democratic), led by Mauri's *1° Gruppo Divisioni Alpine*: *1a* and *2a 'Langhe'*, *5a 'Monferrato'*, *12a 'Bra'*, *103a Brigata 'Amendola'*.

### `ITA_FAV_01` — Fiamme Verdi Formations (Green Flames)
Catholic formations of Brescia (neutrality or democratic): *Divisione 'Tito Speri'*, *Divisione 'Astolfo Lunardi'* and their brigades (*'Dieci Giornate'*, *'Perlasca'*).

### `ITA_ALT_01` — Other Partisan Formations
Formations outside the party networks, available to any non-fascist government: *Brigata Maiella*, *Divisione Osoppo-Friuli*, *Fronte Militare Clandestino*.

### `ITA_MOT_01` / `ITA_MEC_01` / `ITA_MEC_02` — Motorized and Mechanized Divisions
Autotrasportabile and motorized divisions on their infantry numbers (*9a 'Pasubio'*, *101a Motorizzata 'Trieste'*); 106–108 are fictional. `ITA_MEC_01` is the plain mechanized list; `ITA_MEC_02` carries postwar names (*'Granatieri di Sardegna'*, *'Folgore'*, *'Goito'*).

### `ITA_ARM_01` — Armored Divisions (Divisioni Corazzate)
*131a 'Centauro'*, *132a 'Ariete'*, *133a 'Littorio'*, the abortive *134a 'Freccia'*, *135a 'Ariete II'*, *136a 'Centauro II'* and the CC.NN. *'M'* division; *'Pozzuolo del Friuli'*, *'Curtatone'*, *'Mameli'* (postwar brigade names) and *'Nizza'*, *'Genova'*, *'Novara'* (cavalry traditions) are plausible extrapolations.

### `ITA_MAR_01` / `ITA_MAR_02` — Marines
The *'San Marco'* regiment and a postwar-style *Reggimento Lagunari 'Serenissima'*; fictional *Divisioni Fanteria di Marina*.

### `ITA_MNT_01` — Mountain Divisions (Divisioni Alpine)
*'Taurinense'*, *'Tridentina'*, *'Julia'*, *'Cuneense'*, *'Pusteria'*, *'Alpi Graie'*, plus the postwar *'Orobica'* and *'Cadore'*. A plausible expansion names further divisions after famous Alpini battalions (*'Monte Cervino'*, *'Edolo'*, *'Mondovì'*).

### `ITA_PAR_01` — Paratrooper Divisions (Paracadutisti)
*80a Divisione Fanteria Aviotrasportabile 'La Spezia'* and the paratrooper divisions *183a 'Ciclone'*, *184a 'Nembo'*, *185a 'Folgore'*.

### `ITA_RGR_01` — Bersaglieri Divisions
Overrides vanilla's placeholder list. Plausible Bersaglieri divisions named after the corps' founder, heroes and honours (*'Alessandro La Marmora'*, *'Enrico Toti'*, *'Cernaia'*, *'Porta Pia'*) and its *Fiamme Cremisi* tradition.

### `ITA_ARD_01` — Arditi Assault Units
The *10° Reggimento Arditi* and *1° Battaglione Speciale Arditi* (1942), plus plausible assault divisions named after Great War Arditi traditions (*'Col Moschin'*, *'Sdricca di Manzano'*, *'Giuseppe Bassi'*).

### `ITA_FES_01` / `ITA_GAR_01` — Defence Brigades and Coastal Divisions
Fictional city defence brigades (*'Roma'*, *'Trieste'*, *'Zara'*) and the historical coastal divisions 201–231, which carried numbers only.

### `ITA_GAF_01` — Frontier Guard Sectors
The *Guardia alla Frontiera* covering sectors of the Vallo Alpino on their Roman numbers, from *I Settore di Copertura 'Bassa Roja'* on the French border to *XXVII 'Fiume'*.

### `ITA_CAR_01` — Carabinieri Formations
The Carabinieri Reali divisions *'Pastrengo'*, *'Podgora'* and *'Ogaden'*, the mobilised *1° Gruppo* of Culqualber and the *1° Battaglione Paracadutisti*, and the territorial legions (*Legione Carabinieri di Torino*).

### `ITA_ROM_01` — Legione Romana
Imperial legions by number and cognomen (*Legio I Germanica*, *Legio XX Valeria Victrix*). Fascism only, and never picked by the AI.

### `ITA_MIL_01` — Blackshirt Special Militias
Fascism only. The 22 'M' assault battalions of 1941–43 on their Roman numerals (*XLII*, *XLIII*, *L* and *LX* were the Malta landing group), the *Gruppi Battaglioni M* of the Russian front, the ten MILMART coastal-artillery legions by naval base (*1a Legione MILMART 'Venezia'*, *14a 'Reggio Calabria'*) with their autonomous groups, and the specialist militias (*Milizia Ferroviaria*, *Milizia Portuaria*, *Moschettieri del Duce*).

### `ITA_GDF_01` — Finance Guard Formations
The Guardia di Finanza as a fighting corps: the mobilised battalions of 1940–43 (*I Battaglione Mobilitato GdF 'Cefalonia'*, *VI 'Montenegro'*), battalions named for their theatres, and the territorial legions (*3a Legione Territoriale GdF 'Milano'*, *11a 'Salentina'*). Frontier sectors stay with `ITA_GAF_01`.

### `ITA_COL_04` — Colonial Battalions
The Regio Corpo Truppe Coloniali's Eritrean battalions named for their first commanders (*I Battaglione Eritreo 'Turitto'*, *IV 'Toselli'*, *III 'Galliano'*, *II 'Hidalgo'*), the Libyan and Arabo-Somali battalions, the Saharan groupings (*Raggruppamento Sahariano 'Maletti'*) and the colonial police (*Gruppo Zaptiè d'Eritrea*, *Reparto PAI*).

### `ITA_REP_01` — Republican Volunteer Legions
Democratic only. The volunteer tradition of Mazzini and Garibaldi: the Roman Republic of 1849 (*Legione Italiana 'Garibaldi'*, *Bersaglieri Lombardi 'Manara'*), the *Legione Garibaldina 'Argonne'* of 1914–15, Ricciotti Garibaldi's 1897 legion, and alt-history Republican divisions named for Mazzini, Saffi and Manin. It gives a democratic Italy a republican tradition apart from the House of Savoy names of `ITA_MONCH_01`.

### `ITA_RED_01` — Red Guards
Communism only. The *Centuria 'Gastone Sozzi'* and *Colonna 'Guido Picelli'* of the Spanish war, the *Formazioni di Difesa Proletaria* of the 1922 Parma barricades, Arditi del Popolo sections by city, and Red Guard formations named for labour-movement figures (*'Giuseppe Di Vittorio'*, *'Ilio Barontini'*, *'Oltretorrente'*).

### `ITA_IRR_01` — Irredentist Legions
Fascism only. D'Annunzio's Fiume legions of 1919–20 (*Legione 'Fiumana'*, *Legione del Carnaro*, *XII Reparto d'Assalto 'Irriducibili'*), the four legions of the Milizia Fascista Albanese, the Corsican battalion raised in Sardinia in 1942, and alt-history legions for Malta, Nice, Tunisia and Dalmatia.
