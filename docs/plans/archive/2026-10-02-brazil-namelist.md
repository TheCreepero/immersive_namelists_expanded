# Brazil (BRA) Namelist Plan - 2026-10-02

Status: DONE

File: `common/units/names_divisions/INEX_BRA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the authoring skill. When a stop condition applies, stop and report.

## Context
Brazil currently has 32 division namelist groups in `INEX_BRA_names_divisions.txt` covering infantry, mobile, specialist, territorial, frontier, expeditionary, and 4 ideology branches. This modest expansion adds 4 new historically plausible groups accessible to all government types (`always = yes`): Chasseur Battalions (`BRA_CAC_01`, 35 entries), Mechanized Cavalry Regiments (`BRA_RCM_01`, 25 entries), Riverine Battalions (`BRA_RIV_01`, 25 entries), and Field Artillery Regiments (`BRA_ART_01`, 27 entries). Total group count expands from 32 to 36, and authored names from 499 to 611 (+112 names).

## Decisions
- **Universal availability**: All four new groups use `can_use = { always = yes }`, accessible to democratic, neutrality, fascism, and communism. No political gates, and no political vocabulary in group names.
- **Plausibility & Extrapolation**: Formations draw from authentic peacetime cadres (1921–1922 Calógeras OOB), WWII wartime mobilization battalions, official Army/Navy *denominações históricas*, and riverine naval traditions.
- **Language & Orthography**: Brazilian Portuguese under post-1990 orthography (*Batalhão*, *Regimento*, *Caçadores*, *Mecanizada*, *Ribeirinhas*). All four groups represent masculine collective bodies (*Batalhão*, *Regimento*), using masculine ordinal abbreviations `º` (`1º`, `2º`, `3º`...).
- **Division Types**:
  - `BRA_CAC_01`: `infantry`
  - `BRA_RCM_01`: `mechanized`, `cavalry`, `light_armor`
  - `BRA_RIV_01`: `marine`, `infantry`
  - `BRA_ART_01`: `artillery`
- **Selectors**: Plural, <= 28 characters, no demonym prefixes:
  - `BRA_CAC_01`: `"Chasseur Battalions"` (19 chars)
  - `BRA_RCM_01`: `"Mechanized Cavalry Regiments"` (28 chars)
  - `BRA_RIV_01`: `"Riverine Battalions"` (19 chars)
  - `BRA_ART_01`: `"Field Artillery Regiments"` (25 chars)

## Vanilla findings (`-InspectVanilla BRA`)
| Tag | Vanilla state | Action in INEX |
|---|---|---|
| BRA_INF_01 | 20 stubs, `%da Divisão de Infantaria` | plain variant, `-ClearOrdered`, fallback `%dª Divisão de Infantaria` |
| BRA_MOT_01 / MEC_01 | 10 stubs each, link INF_01 | plain variants, keep link; fixed `Mecânizada` |
| BRA_ARM_01 | 10 stubs, `Divisão de Blindada` | plain variant, fallback `%dª Divisão Blindada` |
| BRA_CAV_01 | 10 stubs | overridden with authentic divisions |
| BRA_PAR_01 / MAR_01 / MNT_01 | 10 stubs each (MNT links INF_01) | overridden with authentic units; fixed `Pára-Quedistas` |
| BRA_GAR_01 | 20 stubs, links INF_01 | overridden with authentic RM garrisons |
| BRA_FL_01 | commented out in vanilla focus | INEX defines as live ungated group |
| BRA_CAC_01 / RCM_01 / RIV_01 / ART_01 | not in vanilla | Added as new universal groups |

## Group suite
| Tag | Selector | division_types | can_use | Links | Fallback | Names |
|---|---|---|---|---|---|---|
| BRA_INF_01 | Infantry Divisions | infantry | - | - | %dª Divisão de Infantaria | 0 (plain) |
| BRA_INF_02 | Infantry Divisions (Named) | infantry | - | BRA_INF_01 | %dª Divisão de Infantaria | 30 |
| BRA_MOT_01 | Motorized Divisions | motorized | - | BRA_INF_01 | %dª Divisão de Infantaria Motorizada | 0 (plain) |
| BRA_MOT_02 | Motorized Divisions (Named) | motorized | - | BRA_MOT_01 | %dª Divisão de Infantaria Motorizada | 24 |
| BRA_MEC_01 | Mechanized Divisions | mechanized | - | BRA_INF_01 | %dª Divisão de Infantaria Mecanizada | 0 (plain) |
| BRA_MEC_02 | Mechanized Divisions (Named) | mechanized | - | BRA_MEC_01 | %dª Divisão de Infantaria Mecanizada | 20 |
| BRA_ARM_01 | Armored Divisions | light_armor, medium_armor, heavy_armor, modern_armor | - | - | %dª Divisão Blindada | 0 (plain) |
| BRA_ARM_02 | Armored Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | - | BRA_ARM_01 | %dª Divisão Blindada | 20 |
| BRA_CAV_01 | Cavalry Divisions | cavalry | - | - | %dª Divisão de Cavalaria | 12 |
| BRA_CAV_02 | Cavalry Regiments | cavalry | - | - | %dº Regimento de Cavalaria | 21 |
| BRA_PAR_01 | Paratrooper Divisions | paratrooper | - | - | %dª Divisão Paraquedista | 18 |
| BRA_PAR_02 | Air Force Ground Troops | paratrooper | - | - | %dº Batalhão de Infantaria de Guarda | 20 |
| BRA_MAR_01 | Marine Divisions | marine | - | - | %dª Divisão de Fuzileiros Navais | 20 |
| BRA_MNT_01 | Mountain Divisions | mountaineers | - | BRA_INF_01 | %dª Divisão de Infantaria de Montanha | 20 |
| BRA_FOR_01 | Coastal Fortress Garrisons | infantry | - | - | %dº Grupo de Artilharia de Costa | 23 |
| BRA_GAR_01 | Garrison Divisions | infantry | - | BRA_INF_01 | %dª Divisão de Guarnição | 31 |
| BRA_GNA_01 | National Guard Legions | infantry | OR = { has_government = democratic has_government = neutrality } | - | %dª Legião da Guarda Nacional | 20 |
| BRA_FPU_01 | State Police Forces | infantry | - | - | %dº Batalhão da Força Pública | 23 |
| BRA_RES_01 | Reserve Units | infantry | - | - | %dº Batalhão de Reserva | 24 |
| BRA_GUA_01 | Presidential Guards | infantry | NOT = { has_government = communism } | - | %dº Regimento de Guardas | 12 |
| BRA_FRO_01 | Frontier Battalions | infantry | - | - | %dº Batalhão de Fronteira | 19 |
| BRA_SEL_01 | Jungle Divisions | infantry | - | - | %dª Divisão de Infantaria de Selva | 20 |
| BRA_EXP_01 | Expeditionary Divisions | infantry | - | - | %dª Divisão de Infantaria Expedicionária | 17 |
| BRA_FL_01 | Foreign Legions | infantry | - | - | %dª Legião Estrangeira | 6 |
| BRA_FAS_01 | Integralist Divisions | infantry | has_government = fascism | - | %dª Divisão Integralista | 14 |
| BRA_FAS_02 | Integralist Militia | militia | has_government = fascism | - | %dª Legião Integralista | 15 |
| BRA_RED_01 | Red Guards | militia | has_government = communism | - | %dª Guarda Vermelha | 14 |
| BRA_COM_01 | People's Army Divisions | infantry | has_government = communism | - | %dª Divisão Popular de Libertação | 14 |
| BRA_DEM_01 | Constitutionalist Divisions | infantry | has_government = democratic | - | %dª Divisão Constitucionalista | 20 |
| BRA_DEM_02 | Volunteer Battalions | militia | has_government = democratic | - | %dº Batalhão de Voluntários | 12 |
| BRA_IMP_01 | Imperial Guard Divisions | infantry | has_government = neutrality | - | %dª Divisão Imperial | 18 |
| BRA_IMP_02 | Patriotic Volunteer Corps | militia | has_government = neutrality | - | %dº Corpo de Voluntários da Pátria | 15 |
| BRA_CAC_01 | Chasseur Battalions | infantry | - | - | %dº Batalhão de Caçadores | 35 |
| BRA_RCM_01 | Mechanized Cavalry Regiments | mechanized, cavalry, light_armor | - | - | %dº Regimento de Cavalaria Mecanizada | 25 |
| BRA_RIV_01 | Riverine Battalions | marine, infantry | - | - | %dº Batalhão de Operações Ribeirinhas | 25 |
| BRA_ART_01 | Field Artillery Regiments | artillery | - | - | %dº Regimento de Artilharia de Campanha | 27 |

## Research record
- Dispatch: `inex_historical_researcher` (30 web calls used of 40 budget).
- Dossier: `scratch/bra_expansion_dossier.md`.
- Main sources: Exército Brasileiro (*eb.mil.br*) official decrees and portarias for cavalry, artillery, and light infantry regiments; 1921–1922 Calógeras Army OOB; Marinha do Brasil (*marinha.mil.br*) Flotilha do Amazonas and Fuzileiros Navais records; FGV CPDOC and SciELO historical archives.
- Unverified items: 0 entries.

## Author confirmation
Extrapolated entries in the Brazilian pattern:
- **BRA_CAC_01**: keys 30–35 (WWII wartime mobilization battalions: Fernando de Noronha, Campina Grande, Blumenau, Três Lagoas, Grão-Pará, Bragança) extrapolating coastal and regional defense cadres.
- **BRA_RCM_01**: keys 21–25 (cavalry tradition honorifics: Bento Gonçalves, Andrade Neves, General Osório, Dragões da Independência, Centauros do Pampa) applied to mechanized cavalry regiment lineage.
- **BRA_RIV_01**: keys 4–18 (hydrographic basin detachments: Solimões, Tapajós, Rio Madeira, Mamoré-Guaporé, Delta do Amazonas, Médio Solimões, Rio Negro, Alto Paraguai, Forte de Coimbra, Javari, Estreito de Óbidos, Lagoa dos Patos, Marajó, Rio Xingu, Tocantins-Araguaia) expanding riverine marine structure; keys 19–25 (naval heroes and river battle honors: Almirante Barroso, Marcílio Dias, Almirante Tamandaré, Guarda-Marinha Greenhalgh, Passagem de Humaitá, Passo da Pátria, Batalha do Riachuelo).
- **BRA_ART_01**: keys 1–27 (Regimento designations combining historical RAM/GAC designations: Floriano, Deodoro, Mallet, Marquês de Barbacena, Salomão da Rocha, etc. and FEB artillery battle honors: Montese, Monte Bastione).

## Kept on judgment
- `LOW_DEPTH` on `BRA_FL_01` (6 entries): from existing file; Foreign Legion list kept small to avoid fictitious filler.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames BRA -Batch docs\superpowers\plans\2026-10-02-brazil-namelist.md`. Expect 4 green lines for added groups and no `[ERROR]`.
- [x] 2. `WORKSHOP_DESCRIPTION_GUIDELINES.md`: update the cross-reference row and replace the `[b]Brazil[/b]` block from "Docs payload".
- [x] 3. Wiki: update `wiki/Brazil.md` from "Docs payload", update `wiki/Home.md` row from 32 to 36, then `powershell -File .\build.ps1 -SyncWiki BRA`. Expect 0 stale or missing tags.
- [x] 4. `powershell -File .\build.ps1 -Check BRA`. Expect `Check passed`; only the expected `LOW_DEPTH` flag on `BRA_FL_01`.
- [x] 5. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [ ] 6. After the user confirms: `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Expand Brazil division namelists with Caçadores, Mechanized Cavalry, Riverine, and Artillery"`.

## Docs payload

### Workshop cross-reference row
Line 64 in `WORKSHOP_DESCRIPTION_GUIDELINES.md`:
```markdown
| `INEX_BRA_names_divisions.txt` | Brazil | `BRA` | Included (Plain & Named infantry, motorized, mechanized and armored divisions with Army patrons, Caçadores, Mechanized Cavalry, Riverine battalions, Field Artillery, Cavalry, Paraquedista, Fuzileiros Navais, Mountain, coastal artillery, State Forças Públicas, Guarda Nacional, Presidential Guard, Frontier and Amazon jungle troops, FEB Expeditionary, Foreign Legions, fascist Integralist, communist Red Guards & People's Army, democratic Constitutionalist, Imperial Guard & Voluntários da Pátria) |
```

### Workshop `[b]Brazil[/b]` block
Lines 123-127 in `WORKSHOP_DESCRIPTION_GUIDELINES.md`:
```markdown
[b]Brazil[/b]
- Plain and Named infantry, motorized, mechanized and armored divisions with Army patrons ([i]1ª Divisão de Infantaria "Duque de Caxias"[/i]), plus Cavalry, Mechanized Cavalry, Paraquedista, Fuzileiros Navais, Mountain, and Field Artillery regiments ([i]3º RAC "Regimento Mallet"[/i])
- Caçadores light infantry battalions ([i]1º BC "Petrópolis"[/i]), Riverine battalions ([i]1º BtlOpRib "Amazonas"[/i]), Forças Públicas, Guarda Nacional, Presidential Guard, frontier and jungle divisions, coastal artillery, and FEB Expeditionary divisions
- Ideology suites: Integralist Divisions & Militia (fascist), Red Guards & People's Army (communist), 1932 Constitutionalist (democratic), and Imperial Guard & Voluntários da Pátria (neutrality)
```

### wiki/Home.md row
Line 30 in `wiki/Home.md`:
```markdown
| [Brazil](Brazil) | `BRA` | 36 | `INEX_BRA_names_divisions.txt` |
```

### wiki/Brazil.md (whole page)
```markdown
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
| `BRA_CAC_01` | Chasseur Battalions | infantry | `%dº Batalhão de Caçadores` | All governments |
| `BRA_RCM_01` | Mechanized Cavalry Regiments | mechanized, cavalry, light_armor | `%dº Regimento de Cavalaria Mecanizada` | All governments |
| `BRA_RIV_01` | Riverine Battalions | marine, infantry | `%dº Batalhão de Operações Ribeirinhas` | All governments |
| `BRA_ART_01` | Field Artillery Regiments | artillery | `%dº Regimento de Artilharia de Campanha` | All governments |

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


### `BRA_CAC_01` — Chasseur Battalions
Independent light infantry battalions stationed across Brazilian states and territories (1921-1922 Calógeras OOB and WWII mobilization units).

35 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Batalhão de Caçadores "Petrópolis"* |
| 2 | *%dº Batalhão de Caçadores "Martim Afonso"* |
| 3 | *%dº Batalhão de Caçadores "Tibúrcio"* |
| 4 | *%dº Batalhão de Caçadores "São Paulo"* |
| 5 | *%dº Batalhão de Caçadores "Lorena"* |
| 6 | *%dº Batalhão de Caçadores "Ipameri"* |
| 7 | *%dº Batalhão de Caçadores "Porto Alegre"* |
| 8 | *%dº Batalhão de Caçadores "São Leopoldo"* |
| 9 | *%dº Batalhão de Caçadores "Pelotas"* |
| 10 | *%dº Batalhão de Caçadores "Goiás"* |
| 11 | *%dº Batalhão de Caçadores "Diamantina"* |
| 12 | *%dº Batalhão de Caçadores "Curvelo"* |
| 13 | *%dº Batalhão de Caçadores "Joinville"* |
| 14 | *%dº Batalhão de Caçadores "Florianópolis"* |
| 15 | *%dº Batalhão de Caçadores "Curitiba"* |
| 16 | *%dº Batalhão de Caçadores "Cuiabá"* |
| 17 | *%dº Batalhão de Caçadores "Corumbá"* |
| 18 | *%dº Batalhão de Caçadores "Campo Grande"* |
| 19 | *%dº Batalhão de Caçadores "Pirajá"* |
| 20 | *%dº Batalhão de Caçadores "Maceió"* |
| 21 | *%dº Batalhão de Caçadores "Natal"* |
| 22 | *%dº Batalhão de Caçadores "Paraíba"* |
| 23 | *%dº Batalhão de Caçadores "Fortaleza"* |
| 24 | *%dº Batalhão de Caçadores "Barão de Caxias"* |
| 25 | *%dº Batalhão de Caçadores "Teresina"* |
| 26 | *%dº Batalhão de Caçadores "Belém"* |
| 27 | *%dº Batalhão de Caçadores "Manaus"* |
| 28 | *%dº Batalhão de Caçadores "Aracaju"* |
| 29 | *%dº Batalhão de Caçadores "Potiguar"* |
| 30 | *%dº Batalhão de Caçadores "Fernando de Noronha"* |
| 31 | *%dº Batalhão de Caçadores "Campina Grande"* |
| 32 | *%dº Batalhão de Caçadores "Blumenau"* |
| 33 | *%dº Batalhão de Caçadores "Três Lagoas"* |
| 34 | *%dº Batalhão de Caçadores "Grão-Pará"* |
| 35 | *%dº Batalhão de Caçadores "Bragança"* |

### `BRA_RCM_01` — Mechanized Cavalry Regiments
Mechanized cavalry and armored reconnaissance regiments carrying official Army historical denominations and cavalry traditions.

25 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Regimento de Cavalaria Mecanizada "Regimento Sá Britto"* |
| 2 | *%dº Regimento de Cavalaria Mecanizada "Regimento João Manoel"* |
| 3 | *%dº Regimento de Cavalaria Mecanizada "Regimento Forte de Santa Tecla"* |
| 4 | *%dº Regimento de Cavalaria Mecanizada "Regimento Passo do Rosário"* |
| 5 | *%dº Regimento de Cavalaria Mecanizada "Cavalaria da Legião de Tropas Ligeiras"* |
| 6 | *%dº Regimento de Cavalaria Mecanizada "Regimento José de Abreu"* |
| 7 | *%dº Regimento de Cavalaria Mecanizada "Regimento Brigadeiro Vasco Alves Pereira"* |
| 8 | *%dº Regimento de Cavalaria Mecanizada "Regimento Conde de Porto Alegre"* |
| 9 | *%dº Regimento de Cavalaria Mecanizada "Regimento João Propício"* |
| 10 | *%dº Regimento de Cavalaria Mecanizada "Regimento Antônio João"* |
| 11 | *%dº Regimento de Cavalaria Mecanizada "Regimento Marechal Dutra"* |
| 12 | *%dº Regimento de Cavalaria Mecanizada "Regimento Marechal José Pessoa"* |
| 13 | *%dº Regimento de Cavalaria Mecanizada "Regimento Anhanguera"* |
| 14 | *%dº Regimento de Cavalaria Mecanizada "Regimento Lanceiros do Ponche Verde"* |
| 15 | *%dº Regimento de Cavalaria Mecanizada "Regimento General Pitaluga"* |
| 16 | *%dº Regimento de Cavalaria Mecanizada "Regimento Piragibe"* |
| 17 | *%dº Regimento de Cavalaria Mecanizada "Regimento Solon Ribeiro"* |
| 18 | *%dº Regimento de Cavalaria Mecanizada "Regimento Boa Vista"* |
| 19 | *%dº Regimento de Cavalaria Mecanizada "Regimento San Martín"* |
| 20 | *%dº Regimento de Cavalaria Mecanizada "Regimento Cidade de Campo Grande"* |
| 21 | *%dº Regimento de Cavalaria Mecanizada "Regimento Bento Gonçalves"* |
| 22 | *%dº Regimento de Cavalaria Mecanizada "Regimento Andrade Neves"* |
| 23 | *%dº Regimento de Cavalaria Mecanizada "Regimento General Osório"* |
| 24 | *%dº Regimento de Cavalaria Mecanizada "Regimento Dragões da Independência"* |
| 25 | *%dº Regimento de Cavalaria Mecanizada "Regimento Centauros do Pampa"* |

### `BRA_RIV_01` — Riverine Battalions
Riverine assault and amphibious infantry battalions guarding the Amazon, Solimões, and Pantanal waterways.

25 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Batalhão de Operações Ribeirinhas "Amazonas"* |
| 2 | *%dº Batalhão de Operações Ribeirinhas "Grão-Pará"* |
| 3 | *%dº Batalhão de Operações Ribeirinhas "Pantanal"* |
| 4 | *%dº Batalhão de Operações Ribeirinhas "Solimões"* |
| 5 | *%dº Batalhão de Operações Ribeirinhas "Tapajós"* |
| 6 | *%dº Batalhão de Operações Ribeirinhas "Rio Madeira"* |
| 7 | *%dº Batalhão de Operações Ribeirinhas "Mamoré-Guaporé"* |
| 8 | *%dº Batalhão de Operações Ribeirinhas "Delta do Amazonas"* |
| 9 | *%dº Batalhão de Operações Ribeirinhas "Médio Solimões"* |
| 10 | *%dº Batalhão de Operações Ribeirinhas "Rio Negro"* |
| 11 | *%dº Batalhão de Operações Ribeirinhas "Alto Paraguai"* |
| 12 | *%dº Batalhão de Operações Ribeirinhas "Forte de Coimbra"* |
| 13 | *%dº Batalhão de Operações Ribeirinhas "Javari"* |
| 14 | *%dº Batalhão de Operações Ribeirinhas "Estreito de Óbidos"* |
| 15 | *%dº Batalhão de Operações Ribeirinhas "Lagoa dos Patos"* |
| 16 | *%dº Batalhão de Operações Ribeirinhas "Marajó"* |
| 17 | *%dº Batalhão de Operações Ribeirinhas "Rio Xingu"* |
| 18 | *%dº Batalhão de Operações Ribeirinhas "Tocantins-Araguaia"* |
| 19 | *%dº Batalhão de Operações Ribeirinhas "Almirante Barroso"* |
| 20 | *%dº Batalhão de Operações Ribeirinhas "Marcílio Dias"* |
| 21 | *%dº Batalhão de Operações Ribeirinhas "Almirante Tamandaré"* |
| 22 | *%dº Batalhão de Operações Ribeirinhas "Guarda-Marinha Greenhalgh"* |
| 23 | *%dº Batalhão de Operações Ribeirinhas "Passagem de Humaitá"* |
| 24 | *%dº Batalhão de Operações Ribeirinhas "Passo da Pátria"* |
| 25 | *%dº Batalhão de Operações Ribeirinhas "Batalha do Riachuelo"* |

### `BRA_ART_01` — Field Artillery Regiments
Traditional field and mounted artillery regiments tracing the historical RAM and GAC lineages.

27 entries:

| # | Name |
|:--|:---|
| 1 | *%dº Regimento de Artilharia de Campanha "Regimento Floriano"* |
| 2 | *%dº Regimento de Artilharia de Campanha "Regimento Deodoro"* |
| 3 | *%dº Regimento de Artilharia de Campanha "Regimento Mallet"* |
| 4 | *%dº Regimento de Artilharia de Campanha "Regimento Marquês de Barbacena"* |
| 5 | *%dº Regimento de Artilharia de Campanha "Regimento Salomão da Rocha"* |
| 6 | *%dº Regimento de Artilharia de Campanha "Regimento Marquês de Tamandaré"* |
| 7 | *%dº Regimento de Artilharia de Campanha "Regimento Olinda"* |
| 8 | *%dº Regimento de Artilharia de Campanha "Regimento Brigadeiro Gurjão"* |
| 9 | *%dº Regimento de Artilharia de Campanha "Regimento Major Cantuária"* |
| 10 | *%dº Regimento de Artilharia de Campanha "Regimento General Manoel Theóphilo"* |
| 11 | *%dº Regimento de Artilharia de Campanha "Regimento Montese"* |
| 12 | *%dº Regimento de Artilharia de Campanha "Regimento Barão de Jundiahy"* |
| 13 | *%dº Regimento de Artilharia de Campanha "Regimento General Polidoro"* |
| 14 | *%dº Regimento de Artilharia de Campanha "Regimento Fernão Dias"* |
| 15 | *%dº Regimento de Artilharia de Campanha "Regimento General Sisson"* |
| 16 | *%dº Regimento de Artilharia de Campanha "Regimento Visconde de São Leopoldo"* |
| 17 | *%dº Regimento de Artilharia de Campanha "Regimento Potiguar"* |
| 18 | *%dº Regimento de Artilharia de Campanha "Regimento Rondonópolis"* |
| 19 | *%dº Regimento de Artilharia de Campanha "Regimento Barão de Batovy"* |
| 20 | *%dº Regimento de Artilharia de Campanha "Regimento Bandeirante"* |
| 21 | *%dº Regimento de Artilharia de Campanha "Regimento Monte Bastione"* |
| 22 | *%dº Regimento de Artilharia de Campanha "Regimento Uruguaiana"* |
| 23 | *%dº Regimento de Artilharia de Campanha "Regimento Agulhas Negras"* |
| 24 | *%dº Regimento de Artilharia de Campanha "Regimento Artilharia de Bagé"* |
| 25 | *%dº Regimento de Artilharia de Campanha "Regimento Severiano da Fonseca"* |
| 26 | *%dº Regimento de Artilharia de Campanha "Regimento Humaitá"* |
| 27 | *%dº Regimento de Artilharia de Campanha "Regimento Dom Pedro I"* |

---

## Notes

- **Extrapolation**: Verified names are the divisions' headquarters cities, regimental denominations (Sampaio, Ipiranga, Tiradentes, Osório, Bento Gonçalves, Andrade Neves), the Marine battalions (Riachuelo, Humaitá, Paissandu, Tonelero), the FEB battles, the 25º, 26º and 27º BI Pqdt, the Guarda Presidencial lineage, the 1932 Constitutionalist units (MMDC, Legião Negra, Conselheiro Rebouças, Batalhão de Ferro) and the AIB vocabulary (*Camisas-Verdes*, *Anauê*, *Sigma*). Patron names on divisions, the numbered garrison, reserve and Aeronáutica lists, the provincial National Guard and Integralist legions, and every formation of the Red Guard and Imperial lists beyond the named historical bodies are extrapolated in the Brazilian pattern.
- **Mountain, jungle and airborne**: *Infantaria de Montanha*, *Infantaria de Selva* and *Paraquedista* are post-war doctrinal terms (the airborne school dates from 1945); INEX uses them as extrapolations for the wartime and alternate-history forces.
- **Spelling**: *Paraquedista* and *Mecanizada* follow the post-1990 orthography; *Pára-quedistas* is kept only in the name of the historical *Escola de Pára-quedistas*. *Collecchio* is the Italian spelling of the FEB battle the Brazilian sources write *Colecchio*.
- **Neutrality**: the Imperial lists use `has_government = neutrality` because focus or flag locks are not used; the Estado Novo style of names (Vargas-era units, Guarda Presidencial) stays in the ungated lists.
```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check:
- Linguistic and orthographic audit performed across all 112 authored names. All unit designations verify correct Portuguese gender agreements (`o Batalhão`, `o Regimento` -> masculine ordinal `º`), correct diacritics (*ç, ã, õ, é, ê, á, í, ó, ú*), and modern orthography (*Mecanizada*, *Paraquedista*).
- All 112 names confirmed free of ungated political vocabulary (no *milícia*, *guarda nacional*, *guarda vermelha*, *imperial*, *fascista*, *comunista*).
- Every name is verified or listed under "Author confirmation".

## Outcome
- Date: 2026-10-02
- `-Check BRA` result: `Check passed` (Validate OK, 373 tests passed, 0 failed, 0 skipped).
- Counts: GROUPS=36, AUTHORED=611/634 (+4 groups, +112 authored names added).
- Groups added: BRA_CAC_01 (35), BRA_RCM_01 (25), BRA_RIV_01 (25), BRA_ART_01 (27).
- Flags: LOW_DEPTH x1 (BRA_FL_01, kept on judgment), NAME_LONG x3 (regimental titles), IDENTITY_REPEAT x1 ("Grão-Pará" shared by BRA_CAC_01 and BRA_RIV_01).
- Deviations from plan: None.

## Edit batch

```json batch
{
  "addGroup": true,
  "group": "BRA_CAC_01",
  "selector": "Chasseur Battalions",
  "addType": [
    "infantry"
  ],
  "fallback": "%dº Batalhão de Caçadores",
  "canUse": "always = yes",
  "comment": "# ===== Light infantry / Chasseur battalions =====\n\nIndependent light infantry battalions stationed across Brazilian states and territories.",
  "add": [
    "# Peacetime garrisons and WWII mobilization battalions",
    "1=1º Batalhão de Caçadores \\\"Petrópolis\\\"",
    "2=2º Batalhão de Caçadores \\\"Martim Afonso\\\"",
    "3=3º Batalhão de Caçadores \\\"Tibúrcio\\\"",
    "4=4º Batalhão de Caçadores \\\"São Paulo\\\"",
    "5=5º Batalhão de Caçadores \\\"Lorena\\\"",
    "6=6º Batalhão de Caçadores \\\"Ipameri\\\"",
    "7=7º Batalhão de Caçadores \\\"Porto Alegre\\\"",
    "8=8º Batalhão de Caçadores \\\"São Leopoldo\\\"",
    "9=9º Batalhão de Caçadores \\\"Pelotas\\\"",
    "10=10º Batalhão de Caçadores \\\"Goiás\\\"",
    "11=11º Batalhão de Caçadores \\\"Diamantina\\\"",
    "12=12º Batalhão de Caçadores \\\"Curvelo\\\"",
    "13=13º Batalhão de Caçadores \\\"Joinville\\\"",
    "14=14º Batalhão de Caçadores \\\"Florianópolis\\\"",
    "15=15º Batalhão de Caçadores \\\"Curitiba\\\"",
    "16=16º Batalhão de Caçadores \\\"Cuiabá\\\"",
    "17=17º Batalhão de Caçadores \\\"Corumbá\\\"",
    "18=18º Batalhão de Caçadores \\\"Campo Grande\\\"",
    "19=19º Batalhão de Caçadores \\\"Pirajá\\\"",
    "20=20º Batalhão de Caçadores \\\"Maceió\\\"",
    "21=21º Batalhão de Caçadores \\\"Natal\\\"",
    "22=22º Batalhão de Caçadores \\\"Paraíba\\\"",
    "23=23º Batalhão de Caçadores \\\"Fortaleza\\\"",
    "24=24º Batalhão de Caçadores \\\"Barão de Caxias\\\"",
    "25=25º Batalhão de Caçadores \\\"Teresina\\\"",
    "26=26º Batalhão de Caçadores \\\"Belém\\\"",
    "27=27º Batalhão de Caçadores \\\"Manaus\\\"",
    "28=28º Batalhão de Caçadores \\\"Aracaju\\\"",
    "29=29º Batalhão de Caçadores \\\"Potiguar\\\"",
    "30=30º Batalhão de Caçadores \\\"Fernando de Noronha\\\"",
    "31=31º Batalhão de Caçadores \\\"Campina Grande\\\"",
    "32=32º Batalhão de Caçadores \\\"Blumenau\\\"",
    "33=33º Batalhão de Caçadores \\\"Três Lagoas\\\"",
    "34=34º Batalhão de Caçadores \\\"Grão-Pará\\\"",
    "35=35º Batalhão de Caçadores \\\"Bragança\\\""
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "BRA_RCM_01",
  "selector": "Mechanized Cavalry Regiments",
  "addType": [
    "mechanized",
    "cavalry",
    "light_armor"
  ],
  "fallback": "%dº Regimento de Cavalaria Mecanizada",
  "canUse": "always = yes",
  "comment": "# ===== Mechanized cavalry =====\n\nMechanized cavalry and armored reconnaissance regiments.",
  "add": [
    "# Regimentos de Cavalaria Mecanizada and cavalry traditions",
    "1=1º Regimento de Cavalaria Mecanizada \\\"Regimento Sá Britto\\\"",
    "2=2º Regimento de Cavalaria Mecanizada \\\"Regimento João Manoel\\\"",
    "3=3º Regimento de Cavalaria Mecanizada \\\"Regimento Forte de Santa Tecla\\\"",
    "4=4º Regimento de Cavalaria Mecanizada \\\"Regimento Passo do Rosário\\\"",
    "5=5º Regimento de Cavalaria Mecanizada \\\"Cavalaria da Legião de Tropas Ligeiras\\\"",
    "6=6º Regimento de Cavalaria Mecanizada \\\"Regimento José de Abreu\\\"",
    "7=7º Regimento de Cavalaria Mecanizada \\\"Regimento Brigadeiro Vasco Alves Pereira\\\"",
    "8=8º Regimento de Cavalaria Mecanizada \\\"Regimento Conde de Porto Alegre\\\"",
    "9=9º Regimento de Cavalaria Mecanizada \\\"Regimento João Propício\\\"",
    "10=10º Regimento de Cavalaria Mecanizada \\\"Regimento Antônio João\\\"",
    "11=11º Regimento de Cavalaria Mecanizada \\\"Regimento Marechal Dutra\\\"",
    "12=12º Regimento de Cavalaria Mecanizada \\\"Regimento Marechal José Pessoa\\\"",
    "13=13º Regimento de Cavalaria Mecanizada \\\"Regimento Anhanguera\\\"",
    "14=14º Regimento de Cavalaria Mecanizada \\\"Regimento Lanceiros do Ponche Verde\\\"",
    "15=15º Regimento de Cavalaria Mecanizada \\\"Regimento General Pitaluga\\\"",
    "16=16º Regimento de Cavalaria Mecanizada \\\"Regimento Piragibe\\\"",
    "17=17º Regimento de Cavalaria Mecanizada \\\"Regimento Solon Ribeiro\\\"",
    "18=18º Regimento de Cavalaria Mecanizada \\\"Regimento Boa Vista\\\"",
    "19=19º Regimento de Cavalaria Mecanizada \\\"Regimento San Martín\\\"",
    "20=20º Regimento de Cavalaria Mecanizada \\\"Regimento Cidade de Campo Grande\\\"",
    "21=21º Regimento de Cavalaria Mecanizada \\\"Regimento Bento Gonçalves\\\"",
    "22=22º Regimento de Cavalaria Mecanizada \\\"Regimento Andrade Neves\\\"",
    "23=23º Regimento de Cavalaria Mecanizada \\\"Regimento General Osório\\\"",
    "24=24º Regimento de Cavalaria Mecanizada \\\"Regimento Dragões da Independência\\\"",
    "25=25º Regimento de Cavalaria Mecanizada \\\"Regimento Centauros do Pampa\\\""
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "BRA_RIV_01",
  "selector": "Riverine Battalions",
  "addType": [
    "marine",
    "infantry"
  ],
  "fallback": "%dº Batalhão de Operações Ribeirinhas",
  "canUse": "always = yes",
  "comment": "# ===== Riverine operations =====\n\nRiverine assault and amphibious infantry battalions for the Amazon, Solimões, and Pantanal waterways.",
  "add": [
    "# Amazon, Pantanal, and riverine operating battalions",
    "1=1º Batalhão de Operações Ribeirinhas \\\"Amazonas\\\"",
    "2=2º Batalhão de Operações Ribeirinhas \\\"Grão-Pará\\\"",
    "3=3º Batalhão de Operações Ribeirinhas \\\"Pantanal\\\"",
    "4=4º Batalhão de Operações Ribeirinhas \\\"Solimões\\\"",
    "5=5º Batalhão de Operações Ribeirinhas \\\"Tapajós\\\"",
    "6=6º Batalhão de Operações Ribeirinhas \\\"Rio Madeira\\\"",
    "7=7º Batalhão de Operações Ribeirinhas \\\"Mamoré-Guaporé\\\"",
    "8=8º Batalhão de Operações Ribeirinhas \\\"Delta do Amazonas\\\"",
    "9=9º Batalhão de Operações Ribeirinhas \\\"Médio Solimões\\\"",
    "10=10º Batalhão de Operações Ribeirinhas \\\"Rio Negro\\\"",
    "11=11º Batalhão de Operações Ribeirinhas \\\"Alto Paraguai\\\"",
    "12=12º Batalhão de Operações Ribeirinhas \\\"Forte de Coimbra\\\"",
    "13=13º Batalhão de Operações Ribeirinhas \\\"Javari\\\"",
    "14=14º Batalhão de Operações Ribeirinhas \\\"Estreito de Óbidos\\\"",
    "15=15º Batalhão de Operações Ribeirinhas \\\"Lagoa dos Patos\\\"",
    "16=16º Batalhão de Operações Ribeirinhas \\\"Marajó\\\"",
    "17=17º Batalhão de Operações Ribeirinhas \\\"Rio Xingu\\\"",
    "18=18º Batalhão de Operações Ribeirinhas \\\"Tocantins-Araguaia\\\"",
    "19=19º Batalhão de Operações Ribeirinhas \\\"Almirante Barroso\\\"",
    "20=20º Batalhão de Operações Ribeirinhas \\\"Marcílio Dias\\\"",
    "21=21º Batalhão de Operações Ribeirinhas \\\"Almirante Tamandaré\\\"",
    "22=22º Batalhão de Operações Ribeirinhas \\\"Guarda-Marinha Greenhalgh\\\"",
    "23=23º Batalhão de Operações Ribeirinhas \\\"Passagem de Humaitá\\\"",
    "24=24º Batalhão de Operações Ribeirinhas \\\"Passo da Pátria\\\"",
    "25=25º Batalhão de Operações Ribeirinhas \\\"Batalha do Riachuelo\\\""
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "BRA_ART_01",
  "selector": "Field Artillery Regiments",
  "addType": [
    "artillery"
  ],
  "fallback": "%dº Regimento de Artilharia de Campanha",
  "canUse": "always = yes",
  "comment": "# ===== Field artillery =====\n\nTraditional field and mounted artillery regiments.",
  "add": [
    "# Regimentos de Artilharia de Campanha and historical artillery traditions",
    "1=1º Regimento de Artilharia de Campanha \\\"Regimento Floriano\\\"",
    "2=2º Regimento de Artilharia de Campanha \\\"Regimento Deodoro\\\"",
    "3=3º Regimento de Artilharia de Campanha \\\"Regimento Mallet\\\"",
    "4=4º Regimento de Artilharia de Campanha \\\"Regimento Marquês de Barbacena\\\"",
    "5=5º Regimento de Artilharia de Campanha \\\"Regimento Salomão da Rocha\\\"",
    "6=6º Regimento de Artilharia de Campanha \\\"Regimento Marquês de Tamandaré\\\"",
    "7=7º Regimento de Artilharia de Campanha \\\"Regimento Olinda\\\"",
    "8=8º Regimento de Artilharia de Campanha \\\"Regimento Brigadeiro Gurjão\\\"",
    "9=9º Regimento de Artilharia de Campanha \\\"Regimento Major Cantuária\\\"",
    "10=10º Regimento de Artilharia de Campanha \\\"Regimento General Manoel Theóphilo\\\"",
    "11=11º Regimento de Artilharia de Campanha \\\"Regimento Montese\\\"",
    "12=12º Regimento de Artilharia de Campanha \\\"Regimento Barão de Jundiahy\\\"",
    "13=13º Regimento de Artilharia de Campanha \\\"Regimento General Polidoro\\\"",
    "14=14º Regimento de Artilharia de Campanha \\\"Regimento Fernão Dias\\\"",
    "15=15º Regimento de Artilharia de Campanha \\\"Regimento General Sisson\\\"",
    "16=16º Regimento de Artilharia de Campanha \\\"Regimento Visconde de São Leopoldo\\\"",
    "17=17º Regimento de Artilharia de Campanha \\\"Regimento Potiguar\\\"",
    "18=18º Regimento de Artilharia de Campanha \\\"Regimento Rondonópolis\\\"",
    "19=19º Regimento de Artilharia de Campanha \\\"Regimento Barão de Batovy\\\"",
    "20=20º Regimento de Artilharia de Campanha \\\"Regimento Bandeirante\\\"",
    "21=21º Regimento de Artilharia de Campanha \\\"Regimento Monte Bastione\\\"",
    "22=22º Regimento de Artilharia de Campanha \\\"Regimento Uruguaiana\\\"",
    "23=23º Regimento de Artilharia de Campanha \\\"Regimento Agulhas Negras\\\"",
    "24=24º Regimento de Artilharia de Campanha \\\"Regimento Artilharia de Bagé\\\"",
    "25=25º Regimento de Artilharia de Campanha \\\"Regimento Severiano da Fonseca\\\"",
    "26=26º Regimento de Artilharia de Campanha \\\"Regimento Humaitá\\\"",
    "27=27º Regimento de Artilharia de Campanha \\\"Regimento Dom Pedro I\\\""
  ]
}
```
