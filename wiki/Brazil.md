# Brazil

**Country Tag:** `BRA` | **Source File:** [`INEX_BRA_names_divisions.txt`](../common/units/names_divisions/INEX_BRA_names_divisions.txt)

---

## Historical Overview

The Brazilian Army of the 1920s-40s was built on five *Divisões de Infantaria* (1ª Rio de Janeiro, 2ª São Paulo, 3ª Porto Alegre, 4ª Juiz de Fora, 5ª Curitiba) and three *Divisões de Cavalaria* stationed along the Rio Grande do Sul frontier (Santiago, Alegrete/Uruguaiana, São Gabriel), with the *Regiões Militares* as the territorial layer. Regiments carry a number and a historical denomination (*1º RI "Regimento Sampaio"*, *6º RI "Regimento Ipiranga"*, *11º RI "Regimento Tiradentes"*, *3º RC "Regimento Osório"*). The wartime *Força Expedicionária Brasileira* fielded the *1ª Divisão de Infantaria Expedicionária* in Italy, and the Corpo de Fuzileiros Navais names its battalions after Paraguayan War battles (*Riachuelo*, *Humaitá*, *Paissandu*, *Tonelero*).

INEX replaces all nine vanilla lists, which were identical stubs with grammar slips (`%da` instead of the ordinal `%dª`, *Mecânizada*, *Divisão de Blindada*, *Pára-Quedistas*). Names are Brazilian Portuguese under the post-1990 orthography, in the nominative and in native word order: feminine ordinals `ª` for *Divisão*, *Brigada*, *Legião*, *Companhia*; masculine `º` for *Regimento*, *Batalhão*, *Corpo*, *Grupo*. Infantry, motorized, mechanized and armored divisions come as **plain and Named pairs** that share numbering. The plain list keeps the vanilla tag with a numbered fallback; the Named list adds Army patrons and regional motifs (*Duque de Caxias*, *General Osório*, *Bandeirantes*, *Farroupilha*) in quotation marks. Patron names on divisions are an extrapolation of the regimental denomination pattern.

Ideology suites are gated by government type, never by focus: **Integralist Divisions** and **Integralist Militia** (fascism), **Red Guards** and **People's Army** divisions (communism), **Constitutionalist Divisions** and **Volunteer Battalions** from the 1932 revolt (democratic), and **Imperial Guard** divisions and **Voluntários da Pátria** corps (neutrality, worded as an Empire tradition because the vanilla Brazilian neutrality government is the Estado Novo). The National Guard legions are open to democratic and neutrality governments, the Presidential Guards to every government except communism.

Vanilla's only scripted reference, `BRA_FL_01`, is commented out in `common/national_focus/brazil.txt`; INEX defines it as a live, ungated group. All nine other vanilla tags are overridden.

---

## Namelist Groups

| Group Tag | UI Name | Division Types | Fallback Name | Available To |
|:---|:---|:---|:---|:---|
| `BRA_INF_01` | Infantry Divisions | infantry | `%dª Divisão de Infantaria` | All governments |
| `BRA_INF_02` | Infantry Divisions (Named) | infantry | `%dª Divisão de Infantaria` | All governments |
| `BRA_MOT_01` | Motorized Divisions | motorized | `%dª Divisão de Infantaria Motorizada` | All governments |
| `BRA_MOT_02` | Motorized Divisions (Named) | motorized | `%dª Divisão de Infantaria Motorizada` | All governments |
| `BRA_MEC_01` | Mechanized Divisions | mechanized | `%dª Divisão de Infantaria Mecanizada` | All governments |
| `BRA_MEC_02` | Mechanized Divisions (Named) | mechanized | `%dª Divisão de Infantaria Mecanizada` | All governments |
| `BRA_ARM_01` | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%dª Divisão Blindada` | All governments |
| `BRA_ARM_02` | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%dª Divisão Blindada` | All governments |
| `BRA_CAV_01` | Cavalry Divisions | cavalry | `%dª Divisão de Cavalaria` | All governments |
| `BRA_CAV_02` | Cavalry Regiments | cavalry | `%dº Regimento de Cavalaria` | All governments |
| `BRA_PAR_01` | Paratrooper Divisions | paratrooper | `%dª Divisão Paraquedista` | All governments |
| `BRA_PAR_02` | Air Force Ground Troops | paratrooper | `%dº Batalhão de Infantaria de Guarda` | All governments |
| `BRA_MAR_01` | Marine Divisions | marine | `%dª Divisão de Fuzileiros Navais` | All governments |
| `BRA_MNT_01` | Mountain Divisions | mountaineers | `%dª Divisão de Infantaria de Montanha` | All governments |
| `BRA_FOR_01` | Coastal Fortress Garrisons | infantry | `%dº Grupo de Artilharia de Costa` | All governments |
| `BRA_GAR_01` | Garrison Divisions | infantry | `%dª Divisão de Guarnição` | All governments |
| `BRA_GNA_01` | National Guard Legions | infantry | `%dª Legião da Guarda Nacional` | Democratic or neutrality |
| `BRA_FPU_01` | State Police Forces | infantry | `%dº Batalhão da Força Pública` | All governments |
| `BRA_RES_01` | Reserve Units | infantry | `%dº Batalhão de Reserva` | All governments |
| `BRA_GUA_01` | Presidential Guards | infantry | `%dº Regimento de Guardas` | Any government except communism |
| `BRA_FRO_01` | Frontier Battalions | infantry | `%dº Batalhão de Fronteira` | All governments |
| `BRA_SEL_01` | Jungle Divisions | infantry | `%dª Divisão de Infantaria de Selva` | All governments |
| `BRA_EXP_01` | Expeditionary Divisions | infantry | `%dª Divisão de Infantaria Expedicionária` | All governments |
| `BRA_FL_01` | Foreign Legions | infantry | `%dª Legião Estrangeira` | All governments |
| `BRA_FAS_01` | Integralist Divisions | infantry | `%dª Divisão Integralista` | Fascism only |
| `BRA_FAS_02` | Integralist Militia | militia | `%dª Legião Integralista` | Fascism only |
| `BRA_RED_01` | Red Guards | militia | `%dª Guarda Vermelha` | Communism only |
| `BRA_COM_01` | People's Army Divisions | infantry | `%dª Divisão Popular de Libertação` | Communism only |
| `BRA_DEM_01` | Constitutionalist Divisions | infantry | `%dª Divisão Constitucionalista` | Democratic only |
| `BRA_DEM_02` | Volunteer Battalions | militia | `%dº Batalhão de Voluntários` | Democratic only |
| `BRA_IMP_01` | Imperial Guard Divisions | infantry | `%dª Divisão Imperial` | Neutrality only |
| `BRA_IMP_02` | Patriotic Volunteer Corps | militia | `%dº Corpo de Voluntários da Pátria` | Neutrality only |

---

## Group Details

### `BRA_INF_01` — Infantry Divisions
Division template historical names system for Brazil (BRA). Immersive Namelists Expanded (INEX)
Fallback-only (plain) list: every division is numbered `%dª Divisão de Infantaria`.

### `BRA_INF_02` — Infantry Divisions (Named)
Named variant of BRA_INF_01; shares its numbering. Names are Army patrons, historical regiment denominations (Sampaio, Ipiranga, Tiradentes, Osório) and regional motifs extended to divisions. BRA_INF_01, MOT_01, MEC_01 and ARM_01 are plain variants that override vanilla (ordinal ª, Mecanizada, Divisão Blindada).
Shares numbering with `BRA_INF_01` (`link_numbering_with`).

30 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Infantaria "Duque de Caxias"* |
| 2 | *%dª Divisão de Infantaria "Bandeirantes"* |
| 3 | *%dª Divisão de Infantaria "General Osório"* |
| 4 | *%dª Divisão de Infantaria "Tiradentes"* |
| 5 | *%dª Divisão de Infantaria "Marechal Deodoro"* |
| 6 | *%dª Divisão de Infantaria "Marechal Floriano"* |
| 7 | *%dª Divisão de Infantaria "Regimento Sampaio"* |
| 8 | *%dª Divisão de Infantaria "Ipiranga"* |
| 9 | *%dª Divisão de Infantaria "Marechal Rondon"* |
| 10 | *%dª Divisão de Infantaria "Bento Gonçalves"* |
| 11 | *%dª Divisão de Infantaria "Visconde de Pelotas"* |
| 12 | *%dª Divisão de Infantaria "General Canabarro"* |
| 13 | *%dª Divisão de Infantaria "General Neto"* |
| 14 | *%dª Divisão de Infantaria "Andrade Neves"* |
| 15 | *%dª Divisão de Infantaria "Marechal Hermes"* |
| 16 | *%dª Divisão de Infantaria "Marechal Bittencourt"* |
| 17 | *%dª Divisão de Infantaria "Marechal Mascarenhas de Moraes"* |
| 18 | *%dª Divisão de Infantaria "Marechal Cordeiro de Farias"* |
| 19 | *%dª Divisão de Infantaria "Marechal Dutra"* |
| 20 | *%dª Divisão de Infantaria "Guararapes"* |
| 21 | *%dª Divisão de Infantaria "Henrique Dias"* |
| 22 | *%dª Divisão de Infantaria "Felipe Camarão"* |
| 23 | *%dª Divisão de Infantaria "Tuiuti"* |
| 24 | *%dª Divisão de Infantaria "Mallet"* |
| 25 | *%dª Divisão de Infantaria "Farroupilha"* |
| 26 | *%dª Divisão de Infantaria "Inconfidência Mineira"* |
| 27 | *%dª Divisão de Infantaria "Monte Castelo"* |
| 28 | *%dª Divisão de Infantaria "Montese"* |
| 29 | *%dª Divisão de Infantaria "Independência"* |
| 30 | *%dª Divisão de Infantaria "Cruzeiro do Sul"* |

### `BRA_MOT_01` — Motorized Divisions
Plain variant; overrides vanilla BRA_MOT_01 (Div. abbreviation, ordinal).
Shares numbering with `BRA_INF_01` (`link_numbering_with`).
Fallback-only (plain) list: every division is numbered `%dª Divisão de Infantaria Motorizada`.

### `BRA_MOT_02` — Motorized Divisions (Named)
Named variant of BRA_MOT_01; shares its numbering. The Escola de Infantaria motorized battalions (Regimento Escola) give the first entry.
Shares numbering with `BRA_MOT_01` (`link_numbering_with`).

24 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Infantaria Motorizada "Regimento Escola"* |
| 2 | *%dª Divisão de Infantaria Motorizada "Duque de Caxias"* |
| 3 | *%dª Divisão de Infantaria Motorizada "Marechal Rondon"* |
| 4 | *%dª Divisão de Infantaria Motorizada "Regimento Sampaio"* |
| 5 | *%dª Divisão de Infantaria Motorizada "General Osório"* |
| 6 | *%dª Divisão de Infantaria Motorizada "Marechal Deodoro"* |
| 7 | *%dª Divisão de Infantaria Motorizada "Marechal Floriano"* |
| 8 | *%dª Divisão de Infantaria Motorizada "Tiradentes"* |
| 9 | *%dª Divisão de Infantaria Motorizada "Bandeirantes"* |
| 10 | *%dª Divisão de Infantaria Motorizada "Ipiranga"* |
| 11 | *%dª Divisão de Infantaria Motorizada "Mallet"* |
| 12 | *%dª Divisão de Infantaria Motorizada "Bento Gonçalves"* |
| 13 | *%dª Divisão de Infantaria Motorizada "Andrade Neves"* |
| 14 | *%dª Divisão de Infantaria Motorizada "Marechal Hermes"* |
| 15 | *%dª Divisão de Infantaria Motorizada "Marechal Bittencourt"* |
| 16 | *%dª Divisão de Infantaria Motorizada "Mascarenhas de Moraes"* |
| 17 | *%dª Divisão de Infantaria Motorizada "Cordeiro de Farias"* |
| 18 | *%dª Divisão de Infantaria Motorizada "Marechal Dutra"* |
| 19 | *%dª Divisão de Infantaria Motorizada "Guararapes"* |
| 20 | *%dª Divisão de Infantaria Motorizada "Tuiuti"* |
| 21 | *%dª Divisão de Infantaria Motorizada "Henrique Dias"* |
| 22 | *%dª Divisão de Infantaria Motorizada "Felipe Camarão"* |
| 23 | *%dª Divisão de Infantaria Motorizada "Farroupilha"* |
| 24 | *%dª Divisão de Infantaria Motorizada "General Canabarro"* |

### `BRA_MEC_01` — Mechanized Divisions
Plain variant; overrides vanilla BRA_MEC_01 (fixes "Mecânizada").
Shares numbering with `BRA_INF_01` (`link_numbering_with`).
Fallback-only (plain) list: every division is numbered `%dª Divisão de Infantaria Mecanizada`.

### `BRA_MEC_02` — Mechanized Divisions (Named)
Named variant of BRA_MEC_01; shares its numbering. Regimento Sampaio is the tradition of the 1º BI Mec (Escola).
Shares numbering with `BRA_MEC_01` (`link_numbering_with`).

20 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Infantaria Mecanizada "Regimento Sampaio"* |
| 2 | *%dª Divisão de Infantaria Mecanizada "General Osório"* |
| 3 | *%dª Divisão de Infantaria Mecanizada "Duque de Caxias"* |
| 4 | *%dª Divisão de Infantaria Mecanizada "Mascarenhas de Moraes"* |
| 5 | *%dª Divisão de Infantaria Mecanizada "Marechal Deodoro"* |
| 6 | *%dª Divisão de Infantaria Mecanizada "Marechal Floriano"* |
| 7 | *%dª Divisão de Infantaria Mecanizada "Marechal Rondon"* |
| 8 | *%dª Divisão de Infantaria Mecanizada "Tiradentes"* |
| 9 | *%dª Divisão de Infantaria Mecanizada "Ipiranga"* |
| 10 | *%dª Divisão de Infantaria Mecanizada "Bandeirantes"* |
| 11 | *%dª Divisão de Infantaria Mecanizada "Mallet"* |
| 12 | *%dª Divisão de Infantaria Mecanizada "Bento Gonçalves"* |
| 13 | *%dª Divisão de Infantaria Mecanizada "Andrade Neves"* |
| 14 | *%dª Divisão de Infantaria Mecanizada "Marechal Hermes"* |
| 15 | *%dª Divisão de Infantaria Mecanizada "Cordeiro de Farias"* |
| 16 | *%dª Divisão de Infantaria Mecanizada "Marechal Dutra"* |
| 17 | *%dª Divisão de Infantaria Mecanizada "Guararapes"* |
| 18 | *%dª Divisão de Infantaria Mecanizada "Tuiuti"* |
| 19 | *%dª Divisão de Infantaria Mecanizada "Farroupilha"* |
| 20 | *%dª Divisão de Infantaria Mecanizada "Monte Castelo"* |

### `BRA_ARM_01` — Armored Divisions
Plain variant; overrides vanilla BRA_ARM_01 (fixes "Divisão de Blindada").
Fallback-only (plain) list: every division is numbered `%dª Divisão Blindada`.

### `BRA_ARM_02` — Armored Divisions (Named)
Named variant of BRA_ARM_01; shares its numbering. Osório is the cavalry and armor patron.
Shares numbering with `BRA_ARM_01` (`link_numbering_with`).

20 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão Blindada "Regimento Sampaio"* |
| 2 | *%dª Divisão Blindada "General Osório"* |
| 3 | *%dª Divisão Blindada "Duque de Caxias"* |
| 4 | *%dª Divisão Blindada "Marechal Floriano"* |
| 5 | *%dª Divisão Blindada "Marechal Deodoro"* |
| 6 | *%dª Divisão Blindada "Mascarenhas de Moraes"* |
| 7 | *%dª Divisão Blindada "Andrade Neves"* |
| 8 | *%dª Divisão Blindada "Bento Gonçalves"* |
| 9 | *%dª Divisão Blindada "Marechal Hermes"* |
| 10 | *%dª Divisão Blindada "Marechal Rondon"* |
| 11 | *%dª Divisão Blindada "General Neto"* |
| 12 | *%dª Divisão Blindada "General Canabarro"* |
| 13 | *%dª Divisão Blindada "Visconde de Pelotas"* |
| 14 | *%dª Divisão Blindada "Mallet"* |
| 15 | *%dª Divisão Blindada "Cordeiro de Farias"* |
| 16 | *%dª Divisão Blindada "Marechal Dutra"* |
| 17 | *%dª Divisão Blindada "Guararapes"* |
| 18 | *%dª Divisão Blindada "Tuiuti"* |
| 19 | *%dª Divisão Blindada "Farroupilha"* |
| 20 | *%dª Divisão Blindada "Bandeirantes"* |

### `BRA_CAV_01` — Cavalry Divisions
Overrides vanilla BRA_CAV_01. The 1ª-3ª Divisões de Cavalaria were real (HQ Santiago, Alegrete/Uruguaiana, São Gabriel); the quoted names of keys 1-3 are those headquarters. 4-12 are patrons and gaúcho motifs.

12 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Cavalaria "Santiago"* |
| 2 | *%dª Divisão de Cavalaria "Alegrete"* |
| 3 | *%dª Divisão de Cavalaria "São Gabriel"* |
| 4 | *%dª Divisão de Cavalaria "General Osório"* |
| 5 | *%dª Divisão de Cavalaria "Andrade Neves"* |
| 6 | *%dª Divisão de Cavalaria "Bento Gonçalves"* |
| 7 | *%dª Divisão de Cavalaria "General Neto"* |
| 8 | *%dª Divisão de Cavalaria "General Canabarro"* |
| 9 | *%dª Divisão de Cavalaria "Visconde de Pelotas"* |
| 10 | *%dª Divisão de Cavalaria "Marechal Hermes"* |
| 11 | *%dª Divisão de Cavalaria "Lanceiros Negros"* |
| 12 | *%dª Divisão de Cavalaria "Dragões da Independência"* |

### `BRA_CAV_02` — Cavalry Regiments
Cavalry regiments keyed to the real 1921 regiment numbers and their frontier garrison towns (1º-14º, with gaps where the garrison is not verified); 15-24 extend the gaúcho tradition.

21 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Regimento de Cavalaria "Santiago"* |
| 2 | *%dº Regimento de Cavalaria "São Borja"* |
| 3 | *%dº Regimento de Cavalaria "São Luiz Gonzaga"* |
| 5 | *%dº Regimento de Cavalaria "Uruguaiana"* |
| 6 | *%dº Regimento de Cavalaria "Alegrete"* |
| 7 | *%dº Regimento de Cavalaria "Santana do Livramento"* |
| 8 | *%dº Regimento de Cavalaria "Quaraí"* |
| 9 | *%dº Regimento de Cavalaria "São Gabriel"* |
| 12 | *%dº Regimento de Cavalaria "Bagé"* |
| 13 | *%dº Regimento de Cavalaria "Lavras do Sul"* |
| 14 | *%dº Regimento de Cavalaria "Dom Pedrito"* |
| 15 | *%dº Regimento de Cavalaria "Lanceiros Negros"* |
| 16 | *%dº Regimento de Cavalaria "Centauros do Pampa"* |
| 17 | *%dº Regimento de Cavalaria "Guarda Gaúcha"* |
| 18 | *%dº Regimento de Cavalaria "Tropeiros"* |
| 19 | *%dº Regimento de Cavalaria "Dragões do Rio Grande"* |
| 20 | *%dº Regimento de Cavalaria "Corpo de Cavalaria Ligeira"* |
| 21 | *%dº Regimento de Cavalaria "Lanceiros do Rio Grande"* |
| 22 | *%dº Regimento de Cavalaria "General Osório"* |
| 23 | *%dº Regimento de Cavalaria "Andrade Neves"* |
| 24 | *%dº Regimento de Cavalaria "Marechal Hermes"* |

### `BRA_PAR_01` — Paratrooper Divisions
Overrides vanilla BRA_PAR_01 (fixes "Pára-Quedistas"). Keys 25-27 are the real 25º, 26º and 27º BI Pqdt.

18 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão Paraquedista "Roberto de Pessôa"* |
| 2 | *%dª Divisão Paraquedista "Pioneiros"* |
| 3 | *%dª Divisão Paraquedista "Precursores"* |
| 4 | *%dª Divisão Paraquedista "Duque de Caxias"* |
| 5 | *%dª Divisão Paraquedista "Marechal Rondon"* |
| 6 | *%dª Divisão Paraquedista "Regimento Sampaio"* |
| 7 | *%dª Divisão Paraquedista "Tiradentes"* |
| 8 | *%dª Divisão Paraquedista "General Osório"* |
| 9 | *%dª Divisão Paraquedista "Marechal Mascarenhas de Moraes"* |
| 10 | *%dª Divisão Paraquedista "Marechal Cordeiro de Farias"* |
| 11 | *%dª Brigada Aeroterrestre "Pioneiros"* |
| 12 | *%dª Brigada Aeroterrestre "Precursores"* |
| 13 | *%dª Brigada Aeroterrestre "Escola de Pára-quedistas"* |
| 14 | *%dª Brigada Aeroterrestre "Roberto de Pessôa"* |
| 15 | *%dª Brigada Aeroterrestre "Duque de Caxias"* |
| 25 | *25º Batalhão de Infantaria Paraquedista* |
| 26 | *26º Batalhão de Infantaria Paraquedista* |
| 27 | *27º Batalhão de Infantaria Paraquedista* |

### `BRA_PAR_02` — Air Force Ground Troops
Aeronáutica ground units. Infantaria de Guarda dates from the 1941 Companhia de Infantaria de Guarda; the battalion bases and the air-assault rescue squadrons are extrapolated.

20 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Batalhão de Infantaria de Guarda "Campo dos Afonsos"* |
| 2 | *%dº Batalhão de Infantaria de Guarda "Santa Cruz"* |
| 3 | *%dº Batalhão de Infantaria de Guarda "Galeão"* |
| 4 | *%dº Batalhão de Infantaria de Guarda "Parnamirim"* |
| 5 | *%dº Batalhão de Infantaria de Guarda "Ibura"* |
| 6 | *%dº Batalhão de Infantaria de Guarda "Val-de-Cans"* |
| 7 | *%dº Batalhão de Infantaria de Guarda "Canoas"* |
| 8 | *%dº Batalhão de Infantaria de Guarda "Cumbica"* |
| 9 | *%dº Batalhão de Infantaria de Guarda "Campo Grande"* |
| 10 | *%dº Batalhão de Infantaria de Guarda "Ponta Pelada"* |
| 11 | *%dª Companhia de Infantaria de Guarda* |
| 12 | *%dª Companhia de Infantaria de Guarda* |
| 13 | *%dª Companhia de Infantaria de Guarda* |
| 14 | *%dª Companhia de Infantaria de Guarda* |
| 15 | *%dª Companhia de Infantaria de Guarda* |
| 16 | *%dª Companhia de Infantaria de Guarda* |
| 17 | *%dº Esquadrão Aeroterrestre de Salvamento* |
| 18 | *%dº Esquadrão Aeroterrestre de Salvamento* |
| 19 | *%dº Esquadrão Aeroterrestre de Salvamento* |
| 20 | *%dº Esquadrão Aeroterrestre de Salvamento* |

### `BRA_MAR_01` — Marine Divisions
Overrides vanilla BRA_MAR_01 ("Divisão Marinha"). Riachuelo, Humaitá, Paissandu and Tonelero are real Corpo de Fuzileiros Navais battalion names; the rest follow the Paraguayan War and Imperial naval battle pattern.

20 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Fuzileiros Navais "Riachuelo"* |
| 2 | *%dª Divisão de Fuzileiros Navais "Humaitá"* |
| 3 | *%dª Divisão de Fuzileiros Navais "Paissandu"* |
| 4 | *%dª Divisão de Fuzileiros Navais "Tonelero"* |
| 5 | *%dª Divisão de Fuzileiros Navais "Tuiuti"* |
| 6 | *%dª Divisão de Fuzileiros Navais "Curupaiti"* |
| 7 | *%dª Divisão de Fuzileiros Navais "Itororó"* |
| 8 | *%dª Divisão de Fuzileiros Navais "Avaí"* |
| 9 | *%dª Divisão de Fuzileiros Navais "Lomas Valentinas"* |
| 10 | *%dª Divisão de Fuzileiros Navais "Passo da Pátria"* |
| 11 | *%dª Divisão de Fuzileiros Navais "Curuzu"* |
| 12 | *%dª Divisão de Fuzileiros Navais "Mercedes"* |
| 13 | *%dª Divisão de Fuzileiros Navais "Cerro Corá"* |
| 14 | *%dª Divisão de Fuzileiros Navais "Jenipapo"* |
| 15 | *%dª Divisão de Fuzileiros Navais "Itaparica"* |
| 16 | *%dª Divisão de Fuzileiros Navais "Monte Caseros"* |
| 17 | *%dª Divisão de Fuzileiros Navais "Passo do Rosário"* |
| 18 | *%dª Divisão de Fuzileiros Navais "Guararapes"* |
| 19 | *%dª Divisão de Fuzileiros Navais "Cabo Frio"* |
| 20 | *%dª Divisão de Fuzileiros Navais "Almirante Tamandaré"* |

### `BRA_MNT_01` — Mountain Divisions
Overrides vanilla BRA_MNT_01. The 11º RI "Tiradentes" at São João del-Rei is the lineage; FEB Apennine battles and Minas Gerais ranges supply the names.
Shares numbering with `BRA_INF_01` (`link_numbering_with`).

20 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Infantaria de Montanha "Tiradentes"* |
| 2 | *%dª Divisão de Infantaria de Montanha "Monte Castelo"* |
| 3 | *%dª Divisão de Infantaria de Montanha "Montese"* |
| 4 | *%dª Divisão de Infantaria de Montanha "Castelnuovo"* |
| 5 | *%dª Divisão de Infantaria de Montanha "Collecchio"* |
| 6 | *%dª Divisão de Infantaria de Montanha "Fornovo di Taro"* |
| 7 | *%dª Divisão de Infantaria de Montanha "Marano"* |
| 8 | *%dª Divisão de Infantaria de Montanha "Zocca"* |
| 9 | *%dª Divisão de Infantaria de Montanha "Gaggio Montano"* |
| 10 | *%dª Divisão de Infantaria de Montanha "Camaiore"* |
| 11 | *%dª Divisão de Infantaria de Montanha "São João del-Rei"* |
| 12 | *%dª Divisão de Infantaria de Montanha "Inconfidência"* |
| 13 | *%dª Divisão de Infantaria de Montanha "Mantiqueira"* |
| 14 | *%dª Divisão de Infantaria de Montanha "Serra do Mar"* |
| 15 | *%dª Divisão de Infantaria de Montanha "Caraça"* |
| 16 | *%dª Divisão de Infantaria de Montanha "Serra dos Órgãos"* |
| 17 | *%dª Divisão de Infantaria de Montanha "Itatiaia"* |
| 18 | *%dª Divisão de Infantaria de Montanha "Espinhaço"* |
| 19 | *%dª Divisão de Infantaria de Montanha "Ouro Preto"* |
| 20 | *%dª Divisão de Infantaria de Montanha "Sabará"* |

### `BRA_FOR_01` — Coastal Fortress Garrisons
Coastal artillery groups named for the forts. 3º GACos was the Forte de Copacabana garrison (1934-58); the Forte do Leme became Forte Duque de Caxias in 1935.

23 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Grupo de Artilharia de Costa "Imbuí"* |
| 2 | *%dº Grupo de Artilharia de Costa "São João"* |
| 3 | *%dº Grupo de Artilharia de Costa "Copacabana"* |
| 4 | *%dº Grupo de Artilharia de Costa "Duque de Caxias"* |
| 5 | *%dº Grupo de Artilharia de Costa "Santa Cruz"* |
| 6 | *%dº Grupo de Artilharia de Costa "Vigia"* |
| 7 | *%dº Grupo de Artilharia de Costa "Itaipu"* |
| 8 | *%dº Grupo de Artilharia de Costa "Dois Irmãos"* |
| 9 | *%dº Grupo de Artilharia de Costa "Laje"* |
| 10 | *%dº Grupo de Artilharia de Costa "Ilha das Cobras"* |
| 11 | *%dº Grupo de Artilharia de Costa "Santo Antônio"* |
| 12 | *%dº Grupo de Artilharia de Costa "São Marcelo"* |
| 13 | *%dº Grupo de Artilharia de Costa "Brum"* |
| 14 | *%dº Grupo de Artilharia de Costa "Cinco Pontas"* |
| 15 | *%dº Grupo de Artilharia de Costa "Santa Catarina"* |
| 16 | *%dº Grupo de Artilharia de Costa "Santo Amaro"* |
| 17 | *%dº Grupo de Artilharia de Costa "Anhatomirim"* |
| 18 | *%dº Grupo de Artilharia de Costa "São José"* |
| 19 | *%dº Grupo de Artilharia de Costa "Monte Serrat"* |
| 20 | *%dº Grupo de Artilharia de Costa "Bertioga"* |
| 21 | *%dº Grupo de Artilharia de Costa "Remédios"* |
| 22 | *%dº Grupo de Artilharia de Costa "Coimbra"* |
| 23 | *%dº Grupo de Artilharia de Costa "Príncipe da Beira"* |

### `BRA_GAR_01` — Garrison Divisions
Overrides vanilla BRA_GAR_01. Keys 1-12 are the Região Militar seats; 13+ are Army garrison towns.
Shares numbering with `BRA_INF_01` (`link_numbering_with`).

31 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Guarnição "Rio de Janeiro"* |
| 2 | *%dª Divisão de Guarnição "São Paulo"* |
| 3 | *%dª Divisão de Guarnição "Porto Alegre"* |
| 4 | *%dª Divisão de Guarnição "Juiz de Fora"* |
| 5 | *%dª Divisão de Guarnição "Curitiba"* |
| 6 | *%dª Divisão de Guarnição "Salvador"* |
| 7 | *%dª Divisão de Guarnição "Recife"* |
| 8 | *%dª Divisão de Guarnição "Belém"* |
| 9 | *%dª Divisão de Guarnição "Campo Grande"* |
| 10 | *%dª Divisão de Guarnição "Fortaleza"* |
| 11 | *%dª Divisão de Guarnição "Cuiabá"* |
| 12 | *%dª Divisão de Guarnição "Manaus"* |
| 13 | *%dª Divisão de Guarnição "Vila Militar"* |
| 14 | *%dª Divisão de Guarnição "Praia Vermelha"* |
| 15 | *%dª Divisão de Guarnição "Quitaúna"* |
| 16 | *%dª Divisão de Guarnição "Taubaté"* |
| 17 | *%dª Divisão de Guarnição "Lorena"* |
| 18 | *%dª Divisão de Guarnição "Jundiaí"* |
| 19 | *%dª Divisão de Guarnição "Pelotas"* |
| 20 | *%dª Divisão de Guarnição "Rosário do Sul"* |
| 21 | *%dª Divisão de Guarnição "Itu"* |
| 22 | *%dª Divisão de Guarnição "Natal"* |
| 23 | *%dª Divisão de Guarnição "Aquidauana"* |
| 24 | *%dª Divisão de Guarnição "Santa Maria"* |
| 25 | *%dª Divisão de Guarnição "Cruz Alta"* |
| 26 | *%dª Divisão de Guarnição "Rio Grande"* |
| 27 | *%dª Divisão de Guarnição "São João del-Rei"* |
| 28 | *%dª Divisão de Guarnição "Belo Horizonte"* |
| 29 | *%dª Divisão de Guarnição "Caçapava"* |
| 30 | *%dª Divisão de Guarnição "Araraquara"* |
| 31 | *%dª Divisão de Guarnição "Piracicaba"* |

### `BRA_GNA_01` — National Guard Legions
Guarda Nacional (1831-1922): numbered Legiões by comarca. Provinces are an extrapolation of the "Legião da Guarda Nacional da Comarca de ..." pattern.

20 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Legião da Guarda Nacional "Rio Grande do Sul"* |
| 2 | *%dª Legião da Guarda Nacional "São Paulo"* |
| 3 | *%dª Legião da Guarda Nacional "Minas Gerais"* |
| 4 | *%dª Legião da Guarda Nacional "Bahia"* |
| 5 | *%dª Legião da Guarda Nacional "Pernambuco"* |
| 6 | *%dª Legião da Guarda Nacional "Pará"* |
| 7 | *%dª Legião da Guarda Nacional "Paraná"* |
| 8 | *%dª Legião da Guarda Nacional "Santa Catarina"* |
| 9 | *%dª Legião da Guarda Nacional "Mato Grosso"* |
| 10 | *%dª Legião da Guarda Nacional "Goiás"* |
| 11 | *%dª Legião da Guarda Nacional "Rio de Janeiro"* |
| 12 | *%dª Legião da Guarda Nacional "Ceará"* |
| 13 | *%dª Legião da Guarda Nacional "Maranhão"* |
| 14 | *%dª Legião da Guarda Nacional "Amazonas"* |
| 15 | *%dª Legião da Guarda Nacional "Piauí"* |
| 16 | *%dª Legião da Guarda Nacional "Alagoas"* |
| 17 | *%dª Legião da Guarda Nacional "Sergipe"* |
| 18 | *%dª Legião da Guarda Nacional "Paraíba"* |
| 19 | *%dª Legião da Guarda Nacional "Rio Grande do Norte"* |
| 20 | *%dª Legião da Guarda Nacional "Espírito Santo"* |

### `BRA_FPU_01` — State Police Forces
Forças Públicas and Polícias Militares. The São Paulo Força Pública had ten infantry battalions in 1932; Regimento Bento Gonçalves, Batalhão de Ferro, the Rio Pardo cavalry and the 9 de Julho mounted police are real.

23 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Batalhão da Força Pública de São Paulo* |
| 2 | *%dº Batalhão da Força Pública de São Paulo* |
| 3 | *%dº Batalhão da Força Pública de São Paulo* |
| 4 | *%dº Batalhão da Força Pública de São Paulo* |
| 5 | *%dº Batalhão da Força Pública de São Paulo* |
| 6 | *%dº Batalhão da Força Pública de São Paulo* |
| 7 | *%dº Batalhão da Força Pública de São Paulo* |
| 8 | *%dº Batalhão da Força Pública de São Paulo* |
| 9 | *%dº Batalhão da Força Pública de São Paulo* |
| 10 | *%dº Batalhão da Força Pública de São Paulo* |
| 11 | *Regimento Bento Gonçalves* |
| 12 | *Batalhão de Ferro* |
| 13 | *Regimento de Cavalaria do Rio Pardo* |
| 14 | *Regimento de Polícia Montada "9 de Julho"* |
| 15 | *Brigada Militar do Rio Grande do Sul* |
| 16 | *Força Pública de Minas Gerais* |
| 17 | *Força Pública do Mato Grosso* |
| 18 | *Força Pública do Paraná* |
| 19 | *Força Policial do Pará* |
| 20 | *Brigada Policial de Santa Catarina* |
| 21 | *Polícia Militar do Distrito Federal* |
| 22 | *Força Pública de São Paulo* |
| 23 | *Escola de Polícia Militar* |

### `BRA_RES_01` — Reserve Units
Tiro de Guerra shooting societies (from 1902) in Army garrison towns, then reserve battalions in the state capitals; the numbering is extrapolated.

24 entries:

| # | Name |
|:--|:---|
| 1 | *Tiro de Guerra nº %d "Taubaté"* |
| 2 | *Tiro de Guerra nº %d "Lorena"* |
| 3 | *Tiro de Guerra nº %d "Jundiaí"* |
| 4 | *Tiro de Guerra nº %d "Pelotas"* |
| 5 | *Tiro de Guerra nº %d "Itu"* |
| 6 | *Tiro de Guerra nº %d "Natal"* |
| 7 | *Tiro de Guerra nº %d "Santa Maria"* |
| 8 | *Tiro de Guerra nº %d "Cruz Alta"* |
| 9 | *Tiro de Guerra nº %d "Piracicaba"* |
| 10 | *Tiro de Guerra nº %d "Araraquara"* |
| 11 | *Tiro de Guerra nº %d "Caçapava"* |
| 12 | *Tiro de Guerra nº %d "Juiz de Fora"* |
| 13 | *%dº Batalhão de Reserva "Rio de Janeiro"* |
| 14 | *%dº Batalhão de Reserva "São Paulo"* |
| 15 | *%dº Batalhão de Reserva "Porto Alegre"* |
| 16 | *%dº Batalhão de Reserva "Belo Horizonte"* |
| 17 | *%dº Batalhão de Reserva "Curitiba"* |
| 18 | *%dº Batalhão de Reserva "Salvador"* |
| 19 | *%dº Batalhão de Reserva "Recife"* |
| 20 | *%dº Batalhão de Reserva "Belém"* |
| 21 | *%dº Batalhão de Reserva "Fortaleza"* |
| 22 | *%dº Batalhão de Reserva "Manaus"* |
| 23 | *%dº Batalhão de Reserva "Cuiabá"* |
| 24 | *%dº Batalhão de Reserva "Campo Grande"* |

### `BRA_GUA_01` — Presidential Guards
Guarda Presidencial lineage: Batalhão do Imperador (1823) to the Batalhão da Guarda Presidencial, and the 1º RCG (Dragões da Independência). Estado Novo guard names are extrapolated.

12 entries:

| # | Name |
|:--|:---|
| 1 | *Dragões da Independência* |
| 2 | *2º Regimento de Cavalaria de Guardas "Andrade Neves"* |
| 3 | *Batalhão da Guarda Presidencial* |
| 4 | *1º Batalhão de Guardas* |
| 5 | *2º Batalhão de Guardas* |
| 6 | *Guarda Pessoal do Presidente* |
| 7 | *Esquadrão de Cavalaria da Guarda Presidencial* |
| 8 | *Regimento de Guardas do Palácio* |
| 9 | *Batalhão de Guardas do Catete* |
| 10 | *Guarda de Honra do Palácio do Catete* |
| 11 | *Batalhão de Guardas do Palácio Guanabara* |
| 12 | *Esquadrão de Honra dos Dragões* |

### `BRA_FRO_01` — Frontier Battalions
Batalhões de Fronteira keyed to border garrison towns, north to south. The 4º Pelotão Especial de Fronteira dates from 1940; the Comissão Rondon is the tradition.

19 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Batalhão de Fronteira "Oiapoque"* |
| 2 | *%dº Batalhão de Fronteira "Clevelândia"* |
| 3 | *%dº Batalhão de Fronteira "Rio Branco"* |
| 4 | *%dº Batalhão de Fronteira "Tabatinga"* |
| 5 | *%dº Batalhão de Fronteira "São Gabriel da Cachoeira"* |
| 6 | *%dº Batalhão de Fronteira "Iauaretê"* |
| 7 | *%dº Batalhão de Fronteira "Guajará-Mirim"* |
| 8 | *%dº Batalhão de Fronteira "Cáceres"* |
| 9 | *%dº Batalhão de Fronteira "Corumbá"* |
| 10 | *%dº Batalhão de Fronteira "Bela Vista"* |
| 11 | *%dº Batalhão de Fronteira "Ponta Porã"* |
| 12 | *%dº Batalhão de Fronteira "Foz do Iguaçu"* |
| 13 | *%dº Batalhão de Fronteira "Dionísio Cerqueira"* |
| 14 | *%dº Batalhão de Fronteira "São Borja"* |
| 15 | *%dº Batalhão de Fronteira "Uruguaiana"* |
| 16 | *%dº Batalhão de Fronteira "Quaraí"* |
| 17 | *%dº Batalhão de Fronteira "Santana do Livramento"* |
| 18 | *%dº Batalhão de Fronteira "Bagé"* |
| 19 | *%dº Batalhão de Fronteira "Jaguarão"* |

### `BRA_SEL_01` — Jungle Divisions
Amazon and Pantanal river basins plus the Rondon and rubber-tapper (Soldados da Borracha) traditions. "Infantaria de Selva" is a later doctrinal term, used here as an extrapolation.

20 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Infantaria de Selva "Rio Negro"* |
| 2 | *%dª Divisão de Infantaria de Selva "Solimões"* |
| 3 | *%dª Divisão de Infantaria de Selva "Tapajós"* |
| 4 | *%dª Divisão de Infantaria de Selva "Madeira"* |
| 5 | *%dª Divisão de Infantaria de Selva "Branco"* |
| 6 | *%dª Divisão de Infantaria de Selva "Juruá"* |
| 7 | *%dª Divisão de Infantaria de Selva "Purus"* |
| 8 | *%dª Divisão de Infantaria de Selva "Tocantins"* |
| 9 | *%dª Divisão de Infantaria de Selva "Xingu"* |
| 10 | *%dª Divisão de Infantaria de Selva "Araguaia"* |
| 11 | *%dª Divisão de Infantaria de Selva "Amazonas"* |
| 12 | *%dª Divisão de Infantaria de Selva "Pantanal"* |
| 13 | *%dª Divisão de Infantaria de Selva "Guaporé"* |
| 14 | *%dª Divisão de Infantaria de Selva "Javari"* |
| 15 | *%dª Divisão de Infantaria de Selva "Trombetas"* |
| 16 | *%dª Divisão de Infantaria de Selva "Içá"* |
| 17 | *%dª Divisão de Infantaria de Selva "Marechal Rondon"* |
| 18 | *%dª Divisão de Infantaria de Selva "Comissão Rondon"* |
| 19 | *%dª Divisão de Infantaria de Selva "Seringueiros"* |
| 20 | *%dª Divisão de Infantaria de Selva "Soldados da Borracha"* |

### `BRA_EXP_01` — Expeditionary Divisions
FEB tradition: the 1ª DIE and its regiments (1º RI Sampaio, 6º RI Ipiranga, 11º RI Tiradentes), with Italian campaign battles naming the later divisions.

17 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão de Infantaria Expedicionária* |
| 2 | *%dª Divisão de Infantaria Expedicionária "Monte Castelo"* |
| 3 | *%dª Divisão de Infantaria Expedicionária "Montese"* |
| 4 | *%dª Divisão de Infantaria Expedicionária "Castelnuovo"* |
| 5 | *%dª Divisão de Infantaria Expedicionária "Collecchio"* |
| 6 | *%dª Divisão de Infantaria Expedicionária "Fornovo di Taro"* |
| 7 | *%dª Divisão de Infantaria Expedicionária "Marano"* |
| 8 | *%dª Divisão de Infantaria Expedicionária "Zocca"* |
| 9 | *%dª Divisão de Infantaria Expedicionária "Gaggio Montano"* |
| 10 | *%dª Divisão de Infantaria Expedicionária "Camaiore"* |
| 12 | *Corpo Expedicionário Brasileiro* |
| 13 | *Regimento Sampaio* |
| 14 | *Regimento Ipiranga* |
| 15 | *Regimento Tiradentes* |
| 16 | *9º Batalhão de Engenharia de Combate* |
| 17 | *Esquadrão de Reconhecimento Expedicionário* |
| 18 | *Batalhão de Saúde Expedicionário* |

### `BRA_FL_01` — Foreign Legions
Defines the group that vanilla leaves commented out in the Brazil focus tree. Imperial-era foreign mercenary battalions (German and Irish, 1820s) are the only Brazilian precedent.

6 entries:

| # | Name |
|:--|:---|
| 1 | *Legião Estrangeira* |
| 2 | *Batalhão de Estrangeiros* |
| 3 | *Batalhão Alemão* |
| 4 | *Batalhão Irlandês* |
| 5 | *Legião Portuguesa* |
| 6 | *Legião de Voluntários Estrangeiros* |

### `BRA_FAS_01` — Integralist Divisions
Fascism: Ação Integralista Brasileira (AIB), Camisas-Verdes, Plínio Salgado, Anauê.

14 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão Integralista "Plínio Salgado"* |
| 2 | *%dª Divisão Integralista "Anauê"* |
| 3 | *%dª Divisão Integralista "Sigma"* |
| 4 | *%dª Divisão Integralista "Deus, Pátria e Família"* |
| 5 | *%dª Divisão Integralista "Camisas-Verdes"* |
| 6 | *%dª Divisão Integralista "Chefe Nacional"* |
| 7 | *%dª Divisão Integralista "Vanguarda Integralista"* |
| 8 | *%dª Divisão Integralista "Jovens Integralistas"* |
| 9 | *%dª Divisão Integralista "A Offensiva"* |
| 10 | *%dª Divisão Integralista "Estado Integral"* |
| 11 | *%dª Divisão Integralista "Cruzeiro do Sul"* |
| 12 | *%dª Divisão Integralista "Tupi"* |
| 13 | *%dª Divisão Integralista "Gustavo Barroso"* |
| 14 | *%dª Divisão Integralista "Raimundo Padilha"* |

### `BRA_FAS_02` — Integralist Militia
AIB legions by province; the Legião and Núcleo structure is extrapolated from the AIB hierarchy.

15 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Legião Integralista "São Paulo"* |
| 2 | *%dª Legião Integralista "Rio Grande do Sul"* |
| 3 | *%dª Legião Integralista "Minas Gerais"* |
| 4 | *%dª Legião Integralista "Rio de Janeiro"* |
| 5 | *%dª Legião Integralista "Bahia"* |
| 6 | *%dª Legião Integralista "Pernambuco"* |
| 7 | *%dª Legião Integralista "Ceará"* |
| 8 | *%dª Legião Integralista "Paraná"* |
| 9 | *%dª Legião Integralista "Santa Catarina"* |
| 10 | *%dª Legião Integralista "Pará"* |
| 11 | *%dª Legião Integralista "Amazonas"* |
| 12 | *%dª Legião Integralista "Maranhão"* |
| 13 | *%dª Legião Integralista "Goiás"* |
| 14 | *%dª Legião Integralista "Mato Grosso"* |
| 15 | *%dª Legião Integralista "Espírito Santo"* |

### `BRA_RED_01` — Red Guards
Communism: 1935 uprising garrisons (Natal, Recife, Rio de Janeiro) and the Aliança Nacional Libertadora.

14 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Guarda Vermelha "Praia Vermelha"* |
| 2 | *%dª Guarda Vermelha "Vila Militar"* |
| 3 | *%dª Guarda Vermelha "Campo dos Afonsos"* |
| 4 | *%dª Guarda Vermelha "Natal"* |
| 5 | *%dª Guarda Vermelha "Recife"* |
| 6 | *%dª Guarda Vermelha "Rio de Janeiro"* |
| 7 | *%dª Guarda Vermelha "Aliança Nacional Libertadora"* |
| 8 | *%dª Guarda Vermelha "Libertadora"* |
| 9 | *%dª Guarda Vermelha "Escola de Aviação Militar"* |
| 10 | *%dª Guarda Vermelha "Batalhão de Comunicações"* |
| 11 | *%dª Guarda Vermelha "Comitê Popular Revolucionário"* |
| 12 | *%dª Guarda Vermelha "21º Batalhão de Caçadores"* |
| 13 | *%dª Guarda Vermelha "29º Batalhão de Caçadores"* |
| 14 | *%dª Guarda Vermelha "Governo Popular"* |

### `BRA_COM_01` — People's Army Divisions
Coluna Prestes (formally the 1ª Divisão Revolucionária) and its commanders.

14 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão Popular de Libertação "Coluna Prestes"* |
| 2 | *%dª Divisão Popular de Libertação "Luís Carlos Prestes"* |
| 3 | *%dª Divisão Popular de Libertação "Siqueira Campos"* |
| 4 | *%dª Divisão Popular de Libertação "Miguel Costa"* |
| 5 | *%dª Divisão Popular de Libertação "João Alberto"* |
| 6 | *%dª Divisão Popular de Libertação "Djalma Dutra"* |
| 7 | *%dª Divisão Popular de Libertação "Cavaleiro da Esperança"* |
| 8 | *%dª Divisão Popular de Libertação "Revolucionária"* |
| 9 | *%dª Divisão Popular de Libertação "Olga Benário"* |
| 10 | *%dª Divisão Popular de Libertação "Agildo Barata"* |
| 11 | *%dª Divisão Popular de Libertação "Gregório Bezerra"* |
| 12 | *%dª Divisão Popular de Libertação "Astrojildo Pereira"* |
| 13 | *%dª Divisão Popular de Libertação "João Cândido"* |
| 14 | *%dª Divisão Popular de Libertação "Revolta da Chibata"* |

### `BRA_DEM_01` — Constitutionalist Divisions
Democracy: the 1932 Revolução Constitucionalista (MMDC, 9 de Julho, Frente Única Gaúcha, Maracaju).

20 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão Constitucionalista "MMDC"* |
| 2 | *%dª Divisão Constitucionalista "9 de Julho"* |
| 3 | *%dª Divisão Constitucionalista "Paulista"* |
| 4 | *%dª Divisão Constitucionalista "Piratininga"* |
| 5 | *%dª Divisão Constitucionalista "Legião Negra"* |
| 6 | *%dª Divisão Constitucionalista "Conselheiro Rebouças"* |
| 7 | *%dª Divisão Constitucionalista "Frente Única"* |
| 8 | *%dª Divisão Constitucionalista "Maracaju"* |
| 9 | *%dª Divisão Constitucionalista "Martins"* |
| 10 | *%dª Divisão Constitucionalista "Miragaia"* |
| 11 | *%dª Divisão Constitucionalista "Dráusio"* |
| 12 | *%dª Divisão Constitucionalista "Camargo"* |
| 13 | *%dª Divisão Constitucionalista "Bertoldo Klinger"* |
| 14 | *%dª Divisão Constitucionalista "Isidoro Dias Lopes"* |
| 15 | *%dª Divisão Constitucionalista "Pedro de Toledo"* |
| 16 | *%dª Divisão Constitucionalista "Borges de Medeiros"* |
| 17 | *%dª Divisão Constitucionalista "Euclides Figueiredo"* |
| 18 | *%dª Divisão Constitucionalista "Constituição"* |
| 19 | *%dª Divisão Constitucionalista "Voluntários de São Paulo"* |
| 20 | *%dª Divisão Constitucionalista "Rio Pardo"* |

### `BRA_DEM_02` — Volunteer Battalions
1932 volunteer units; about 200,000 enlisted. Piratininga is the old name of São Paulo.

12 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Batalhão de Voluntários "Piratininga"* |
| 2 | *%dº Batalhão de Voluntários "Legião Negra"* |
| 3 | *%dº Batalhão de Voluntários "Conselheiro Rebouças"* |
| 4 | *%dº Batalhão de Voluntários "Pérolas Negras"* |
| 5 | *%dº Batalhão de Voluntários "Regimento 9 de Julho"* |
| 6 | *%dº Batalhão de Voluntários "Voluntários de São Paulo"* |
| 7 | *%dº Batalhão de Voluntários "Frente Única Gaúcha"* |
| 8 | *%dº Batalhão de Voluntários "Estado de Maracaju"* |
| 9 | *%dº Batalhão de Voluntários "Rio Pardo"* |
| 10 | *%dº Batalhão de Voluntários "Quitaúna"* |
| 11 | *%dº Batalhão de Voluntários "MMDC"* |
| 12 | *%dº Batalhão de Voluntários "Constitucionalista"* |

### `BRA_IMP_01` — Imperial Guard Divisions
Empire tradition: Batalhão do Imperador (1823), Dragões da Independência and Imperial heroes. Gated on neutrality only; Estado Novo style names live in the ungated lists.

18 entries:

| # | Name |
|:--|:---|
| 1 | *%dª Divisão Imperial "Guarda Imperial"* |
| 2 | *%dª Divisão Imperial "Imperial Guarda de Honra"* |
| 3 | *%dª Divisão Imperial "Batalhão do Imperador"* |
| 4 | *%dª Divisão Imperial "Dragões do Imperador"* |
| 5 | *%dª Divisão Imperial "Lanceiros Imperiais"* |
| 6 | *%dª Divisão Imperial "Dragões da Independência"* |
| 7 | *%dª Divisão Imperial "Guarda Nacional"* |
| 8 | *%dª Divisão Imperial "Dom Pedro I"* |
| 9 | *%dª Divisão Imperial "Dom Pedro II"* |
| 10 | *%dª Divisão Imperial "Princesa Isabel"* |
| 11 | *%dª Divisão Imperial "Duque de Caxias"* |
| 12 | *%dª Divisão Imperial "Conde d'Eu"* |
| 13 | *%dª Divisão Imperial "Almirante Tamandaré"* |
| 14 | *%dª Divisão Imperial "Independência"* |
| 15 | *%dª Divisão Imperial "Cruzeiro"* |
| 16 | *%dª Divisão Imperial "Ipiranga"* |
| 17 | *%dª Divisão Imperial "Voluntários da Pátria"* |
| 18 | *%dª Divisão Imperial "Guararapes"* |

### `BRA_IMP_02` — Patriotic Volunteer Corps
Voluntários da Pátria, raised by Decree 3.371 of 7 January 1865 for the Paraguayan War.

15 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Corpo de Voluntários da Pátria "Zuavos Baianos"* |
| 2 | *%dº Corpo de Voluntários da Pátria "Dom Pedro II"* |
| 3 | *%dº Corpo de Voluntários da Pátria "Duque de Caxias"* |
| 4 | *%dº Corpo de Voluntários da Pátria "Bahia"* |
| 5 | *%dº Corpo de Voluntários da Pátria "Pernambuco"* |
| 6 | *%dº Corpo de Voluntários da Pátria "São Paulo"* |
| 7 | *%dº Corpo de Voluntários da Pátria "Rio Grande do Sul"* |
| 8 | *%dº Corpo de Voluntários da Pátria "Minas Gerais"* |
| 9 | *%dº Corpo de Voluntários da Pátria "Rio de Janeiro"* |
| 10 | *%dº Corpo de Voluntários da Pátria "Ceará"* |
| 11 | *%dº Corpo de Voluntários da Pátria "Pará"* |
| 12 | *%dº Corpo de Voluntários da Pátria "Maranhão"* |
| 13 | *%dº Corpo de Voluntários da Pátria "Paraná"* |
| 14 | *%dº Corpo de Voluntários da Pátria "Santa Catarina"* |
| 15 | *%dº Corpo de Voluntários da Pátria "Mato Grosso"* |

---

## Notes

- **Extrapolation**: Verified names are the divisions' headquarters cities, regimental denominations (Sampaio, Ipiranga, Tiradentes, Osório, Bento Gonçalves, Andrade Neves), the Marine battalions (Riachuelo, Humaitá, Paissandu, Tonelero), the FEB battles, the 25º, 26º and 27º BI Pqdt, the Guarda Presidencial lineage, the 1932 Constitutionalist units (MMDC, Legião Negra, Conselheiro Rebouças, Batalhão de Ferro) and the AIB vocabulary (*Camisas-Verdes*, *Anauê*, *Sigma*). Patron names on divisions, the numbered garrison, reserve and Aeronáutica lists, the provincial National Guard and Integralist legions, and every formation of the Red Guard and Imperial lists beyond the named historical bodies are extrapolated in the Brazilian pattern.
- **Mountain, jungle and airborne**: *Infantaria de Montanha*, *Infantaria de Selva* and *Paraquedista* are post-war doctrinal terms (the airborne school dates from 1945); INEX uses them as extrapolations for the wartime and alternate-history forces.
- **Spelling**: *Paraquedista* and *Mecanizada* follow the post-1990 orthography; *Pára-quedistas* is kept only in the name of the historical *Escola de Pára-quedistas*. *Collecchio* is the Italian spelling of the FEB battle the Brazilian sources write *Colecchio*.
- **Neutrality**: the Imperial lists use `has_government = neutrality` because focus or flag locks are not used; the Estado Novo style of names (Vargas-era units, Guarda Presidencial) stays in the ungated lists.
