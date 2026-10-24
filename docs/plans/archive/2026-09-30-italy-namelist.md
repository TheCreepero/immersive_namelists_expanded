# Italy (ITA) Namelist Expansion - 2026-09-30

Follows the same-day audit (`2026-09-30-italy-audit.md`). Adds 7 groups and extends 2; the file goes from 30 to 37 groups.

## User decisions
- Scope: Bersaglieri, MVSN legions, RSI plus Black Brigades, Frontier Guard plus Carabinieri; deepen Alpini (plus Arditi) and armored.
- Policy: verified names first, then clearly sectioned plausible extrapolation.

## Groups
| Tag | Selector | Gate | Entries | Notes |
|---|---|---|---|---|
| `ITA_LEG_01` (new) | Blackshirt Legions | fascism | 131 | Real MVSN legions keyed by legion number. |
| `ITA_RSI_01` (new) | Republican Army Divisions | fascism | 28 | 4 ENR divisions (1-4); extrapolated 5a-18a named after RSI battalions; historical Decima, GNR, paratrooper and ENR units as static names (21-30). |
| `ITA_BRN_01` (new) | Black Brigades | fascism | 51 | Territorial 1a-41a (39a unnamed, skipped); mobile 2a-5a; autonomous brigades. |
| `ITA_RGR_01` (vanilla override) | Bersaglieri Divisions | always | 9 | Replaces 20 identical vanilla placeholders; plausible divisions named after the founder, heroes and honours. |
| `ITA_ARD_01` (new) | Arditi Assault Units | always | 8 | Historical 1942 units plus extrapolated divisions named after Great War Arditi traditions. |
| `ITA_GAF_01` (new) | Frontier Guard Sectors | always | 24 | GaF covering sectors keyed by sector number, Roman `%s`. |
| `ITA_CAR_01` (new) | Carabinieri Formations | always | 26 | Divisions Pastrengo, Podgora, Ogaden (plus extrapolated Culqualber), mobilised units, 19 territorial legions. |
| `ITA_MNT_01` (extended) | - | - | 8 -> 21 | Keys 9-21: divisions named after Alpini battalions. |
| `ITA_ARM_01` (extended) | - | - | 8 -> 13 | Keys 139-143: postwar brigade names (Curtatone, Mameli) and cavalry traditions (Nizza, Genova, Novara). |

## Research
- Two `inex-historical-researcher` dispatches: fascist formations (14 tool calls), regular formations (27).
- Sources: nuovadifesa.altervista.org "Lista delle Legioni CC.NN."; it.wikipedia "Brigate Nere", "Esercito Nazionale Repubblicano", "Forze armate della RSI", "Xª Flottiglia MAS (RSI)", "Divisione Etna", "Bersaglieri", "Guardia alla Frontiera", "Arditi", "Storia dell'Arma dei Carabinieri", "Corpo d'armata alpino", "Brigata corazzata Ariete"; en.wikipedia "Alpini"; assocarri.it.

## Rationale
- LEG_01, BRN_01 and GAF_01 are keyed by their real numbers, so the displayed number is historical. GAF_01 uses Roman `%s` like the source ("I Settore 'Bassa Roja'").
- RSI_01 continues the four real ENR divisions as 5a+ under an explicit "Plausible expansion" header; the historical sub-divisional formations stay unnumbered static names.
- RGR_01 keeps vanilla's `ranger_battalion` type and fallback. No 1936-43 Bersaglieri regiment identities were found, so no plain regiment entries were added.
- Omitted: legion 16a 'Alpina' (duplicates 2a), 140a 'Aquilia' and 175a 'Salavaterra' (doubtful spellings), mobile brigade 'Italo Barattini' (clashes with territorial 40a), the Norma Cossetto brigade and a 'Mameli' Bersaglieri battalion (unverified). Arditi "Fiamme Verdi" was avoided because it clashes with the partisan group, and "Fiamme Nere" because it is an INF_02 division.
- 'Monterosa' is used only in RSI_01, never in MNT_01.
- Header updated: ITA_RGR_01 added to the override list, and the new fascist groups to the gating note.

## Verified formations & commanders
- nuovadifesa legion list: all LEG_01 entries (the 63a type conflict with Wikipedia's "d'Assalto" is moot because the entries omit the type qualifier).
- it.wikipedia Brigate Nere: BRN_01 territorial, mobile and autonomous brigades.
- it.wikipedia ENR / Forze armate della RSI / Xª MAS / Divisione Etna: RSI_01 divisions 1-4, keys 21-30, and the battalion names used for the extrapolated 5a-18a (Barbarigo, Lupo, Fulmine, Sagittario, Valanga, Scirè, Castagnacci, Risoluti, Nazario Sauro, San Giorgio, Pontida, Venezia Giulia, Mazzarini, Fiamme Bianche).
- it.wikipedia Guardia alla Frontiera: GAF_01 sectors I-XVII, XXI-XXIII, XXV-XXVII and 'Levanna'.
- it.wikipedia Storia dell'Arma / 1° Rgt "Piemonte": CAR_01 divisions, legions (search-snippet level), 1° Gruppo Mobilitato (Culqualber), 1° Battaglione Mobilitato, 1° Battaglione Paracadutisti.
- it.wikipedia Arditi: 10° Reggimento Arditi, 1° Battaglione Speciale Arditi, sciatori arditi.
- it.wikipedia Bersaglieri: La Marmora, Goito, Cernaia, Porta Pia, Fiamme Cremisi, piumetto.
- Alpini battalion names (en/it.wikipedia Alpini, Corpo d'armata alpino): Monte Cervino, Mondovì, Ceva, Susa, Val Pellice, Saluzzo, Ivrea, Edolo, Vestone, Feltre, Tolmezzo, Gemona, Cividale.
- Postwar armored brigades (it.wikipedia / assocarri): Curtatone, Mameli.
- Well documented: Enrico Toti, Luciano Manara, Sciara Sciat (1911), Col Moschin, San Gabriele, Grave di Papadopoli, Sdricca di Manzano, Giuseppe Bassi.

## Author confirmation
- RSI_01 extrapolated 5a-18a (plausible expansion; names are real, the divisions are not).
- RGR_01 all entries (plausible divisions; honours and heroes verified or well documented).
- ARD_01 keys 1-5 and CAR_01 'Culqualber' (plausible expansion).
- MNT_01 keys 9-21 and ARM_01 keys 139-143 (plausible expansion).
- CAR_01 legion list at search-snippet level; GAF_01 sector XXIV not found in the source and therefore omitted.
- LEG_01 Latin-form names 'Hyblae', 'Syracusae', 'Agrigentum' taken from the source as given.

## Kept on judgment
- LOW_DEPTH on RGR_01 (9) and ARD_01 (8): specialist traditions with thin verified material; no invented fillers.
- IDENTITY_REPEAT 'Asti' and 'Langhe' (partisan groups): different formations, pre-existing.
- 'Goito' and 'Porta Pia' appear in both Royal Army and Bersaglieri lists: both are defining Bersaglieri honours.

## Review
- `inex-code-reviewer`: APPROVE, no Critical or Important findings. Gating, ideology separation, GAF_01 `%s` semantics, key uniqueness, the ARM_01 linked-number gap (139-143 unused by INF_01), counts and docs verified.
- Minor, kept: RSI_01 "Reggimento Alpini 'Tagliamento'" (verified in it.wikipedia "Forze armate della RSI"); inner apostrophes in LEG_01 names ('Dell'Urbe', 'L'Aquila') follow the real names; LEG_01 Latin forms and the CAR_01 snippet-level legion list stay under Author confirmation.
- wiki/_Sidebar.md needs no change (nation link only, no group count).
