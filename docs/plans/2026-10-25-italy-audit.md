# Italy (ITA) Namelist Audit - 2026-10-25

Status: READY

File: `common/units/names_divisions/zz_INEX_ITA_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit ITA`)
- AUDIT SUMMARY ITA: GROUPS=43 AUTHORED=809/962 FLAGS=26
- [ITA_INF_01] flags: POLITICAL_ENTRY
- [ITA_COL_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ITA_COL_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ITA_COL_03] flags: LOW_DEPTH
- [ITA_CAV_02] flags: LOW_DEPTH
- [ITA_CAV_03] flags: LOW_DEPTH
- [ITA_CAV_04] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ITA_CAV_05] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ITA_CAV_06] flags: LOW_DEPTH
- [ITA_FAV_01] flags: LOW_DEPTH
- [ITA_ALT_01] flags: LOW_DEPTH
- [ITA_MOT_01] flags: STALE_COMMENT
- [ITA_ARM_01] flags: STALE_COMMENT
- [ITA_MAR_01] flags: LOW_DEPTH
- [ITA_MAR_02] flags: LOW_DEPTH
- [ITA_PAR_01] flags: LOW_DEPTH
- [ITA_RGR_01] flags: LOW_DEPTH
- [ITA_ARD_01] flags: LOW_DEPTH
- [ITA_GAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- File-level: `TODO_COMMENT` (a false positive: the lint matches the Roman numeral XXX in `ITA_MIL_01` "XXX Battaglione d'Assalto CC.NN. 'M'"; tooling backlog entry added), `IDENTITY_REPEAT`.
- Found on manual review: `ITA_FAV_01` 4 `'Tosetti'` and `ITA_ALT_01` 4 `Brigata Risorgimento`, 5 `Divisione Italia` have no source; `ITA_ALT_01` 2 `Divisione Osoppo-Friuli` is a form the sources call an error (the formation was the `Brigate Osoppo-Friuli`).

## User decisions
- 2026-10-25, before research: deepen with sourced names `ITA_FAV_01` (Fiamme Verdi), `ITA_ALT_01` (other partisans) and `ITA_COL_01` (real colonial divisions over the placeholder keys); also extend the already extrapolated `ITA_RGR_01` (Bersaglieri), `ITA_ARD_01` (Arditi) and `ITA_MAR_02` (marine divisions) to about 15 entries each with extrapolated names drawn from battle honours and corps traditions. Every other `LOW_DEPTH` group stays as it is.
- 2026-10-25, before research: move `ITA_INF_01` 136 `'Giovani Fascisti'` to `ITA_INF_02` (fascism only) under key 136 (R11).

## Research
- `inex-audit-researcher`, run 1a (23 web calls): Fiamme Verdi, other partisan formations, colonial divisions. Main sources: it.wikipedia "Fiamme Verdi", "Brigate Osoppo", "Raffaele Menici"; ANPI MEMO trail pages; SIUSA "284ª brigata Fiamme verdi Italo"; Straginazifasciste (Mompiano 6 Feb 1944, Caserma Ottaviani 24 Feb 1944, Quinto Vicentino); en.wikipedia "Italian Libyan Colonial Division", "1st/2nd Libyan Division", "Italian Somali Divisions (101 and 102)".
- `inex-audit-researcher`, run 1b (20 web calls): Bersaglieri, Arditi and navy-infantry honours, `ITA_INF_01` key 8. Main sources: en/it.wikipedia "Bersaglieri", en.wikipedia "Arditi", it.wikipedia "Reggimento San Marco", "Caimani del Piave", en.wikipedia "8th Marching Division (Italy)", "101st Motorized Division 'Trieste'".
- `inex-audit-researcher`, run 2 (13 web calls): AOI colonial divisions, Val Toce and Beltrami. Main sources: en.wikipedia "East African campaign (World War II) order of battle", it.wikipedia "Forze armate dell'Africa Orientale Italiana", it.wikisource "Donne e Uomini della Resistenza/Alfredo Di Dio", en.wikipedia "Filippo Beltrami".

## Rationale
- **R11, `ITA_INF_01` 136 `'Giovani Fascisti'`:** a political name in a group every government uses. It moves unchanged to `ITA_INF_02` (fascism only) under key 136, in a section of its own. Key 136 of `ITA_INF_01` then shows the fallback; vanilla `ITA_INF_01` has no key 136, and `ITA_ARM_01` 136 `'Centauro II'` keeps the number in the linked series.
- **R8, stale section headers:** `ITA_MOT_01` `# Fictional` becomes `# Plausible expansion`; `ITA_ARM_01` `# Fictional (postwar cavalry brigade)` becomes `# Plausible expansion (postwar cavalry brigade)`, matching the file's other extrapolation headers.
- **`ITA_FAV_01` (8 to 12):** 4 `'Tosetti'` has no source and gives way to the sourced Pontoglio brigade `'Tarzan'`. 5-7 get the full names the sources use (`'Ferruccio Lorenzini'`, `'Giacomo Perlasca'`, `'Ermanno Margheriti'`), as 1 and 2 already do. Four sourced brigades are added.
- **`ITA_ALT_01` (6 to 12):** 2 becomes `Brigate Osoppo-Friuli`. 4 `Brigata Risorgimento` and 5 `Divisione Italia` have no source and give way to `Divisione 'Val Toce'` (Alfredo Di Dio, Catholic autonomous) and `1a Divisione Osoppo Carnia`. Added: the Osoppo brigades of the INSMLI April-May 1945 list and Beltrami's brigade. Not added: the communist `Bandiera Rossa` (would need a communist group; out of scope) and the mixed Osoppo-Garibaldi `'Ippolito Nievo'` divisions.
- **`ITA_COL_01`:** keys 3-4 and 21-26 keep the fallback text: it renders as the numbered AOI colonial divisions of 1940-41 (`3a` to `4a`, `21a` to `26a Divisione Coloniale`), which carried numbers only (en.wikipedia order of battle; low confidence, no Italian source). The 1935-36 `Divisione Coloniale 'Libia'` (Nasi, Somali front) is added as 33 beside the two Eritrean divisions, and that section is renamed `# Ethiopian war divisions (1935-36)`. No other colonial division could be sourced, so the remaining placeholder keys stay.
- **`ITA_RGR_01` (9 to 14), `ITA_ARD_01` (8 to 13), `ITA_MAR_02` (5 to 15):** extrapolated groups (Italy fielded no Bersaglieri, Arditi or marine divisions of these names). Each new name is a real battle, hero or tradition of the corps, verified for that corps except the five maritime-republic and naval-base names of `ITA_MAR_02` (`'Lepanto'`, `'Amalfi'`, `'Gaeta'`, `'Brindisi'`, `'Pola'`), which are general Italian naval tradition. Dropped as unsourced for the corps: `'Flambro'`, `'Tobruk'`, `'Col della Berretta'`, `'Cavazuccherina'`. `'Caimani del Piave'` was a navy-infantry unit, not Arditi, so it goes to `ITA_MAR_02`. `'Castelfidardo'` is the name the Bersaglieri gave their 26th battalion.
- **`ITA_INF_01` 8 `8a Divisione di Marcia`:** checked and kept: a real replacement division (Bolzano, July 1942 to May 1943).

## Verified formations & commanders
Only the groups this audit touches; the rest of the file was verified by the 2026-09-30 and 2026-10-02 plans (archive).
- `ITA_FAV_01`: Divisione 'Tito Speri' (Ragnoli), Divisione 'Astolfo Lunardi', Brigata 'Schivardi' (Valcamonica), 'Ferruccio Lorenzini' (Valcamonica), 'Giacomo Perlasca' (Val Sabbia), 'Ermanno Margheriti' (Collio): it.wikipedia "Fiamme Verdi", ANPI MEMO, Straginazifasciste. 'Tarzan' (Pontoglio, Tomaso Bertoli) and Brigata Mantovana (don Primo Mazzolari): it.wikipedia "Fiamme Verdi". 284a Brigata 'Italo' (Reggio Emilia, Sept 1944): SIUSA. 'Giacomo Cappellini' and 'Antonio Lorenzetti': ANPI MEMO trail list only.
- `ITA_ALT_01`: Brigata Maiella (Troilo; final name Gruppo Patrioti della Maiella): ANPI Patria Indipendente. Brigate Osoppo-Friuli, 1a Divisione Osoppo Carnia, 1a Brigata Osoppo Prealpi, 2a, 3a, 5a Brigata Osoppo, Brigata Osoppo 'Martelli': it.wikipedia "Brigate Osoppo" (INSMLI list, April-May 1945). Fronte Militare Clandestino (Montezemolo, Rome): well documented. Brigata 'Damiano Chiesa' (Cittadella, Veneto): Senato bill PDF, Straginazifasciste. Divisione 'Val Toce' (Di Dio, Ossola): it.wikisource. Brigata Alpina d'Assalto 'Filippo Beltrami': en.wikipedia "Filippo Beltrami".
- `ITA_COL_01`: 1a Divisione Libica 'Sibille', 2a 'Pescatori' (1940); Divisione Coloniale 'Libia' (1935-36, Nasi); 1a and 2a Divisione Eritrea; 101a and 102a Divisione Somala: en/it.wikipedia. 3a, 4a, 21a-26a Divisione Coloniale (AOI 1940-41): en.wikipedia order of battle only.
- `ITA_RGR_01` honours: Santa Lucia (6 May 1848), Col del Rosso (5th Bersaglieri, 1917-18), Monte Fior (1st Regiment cyclists, 1916), Major Giacomo Pagliari (34th Bersaglieri battalion, killed at Porta Pia 1870), Castelfidardo (26th Bersaglieri battalion name): en/it.wikipedia "Bersaglieri".
- `ITA_ARD_01` honours: Monte Asolone (IX Assault Bn, 1918), Monte Valbella (II and IV Bn, Jan 1918), Monte Pertica (VI Bn June 1918, XXV Bn Oct 1918), Fagarè (XI Bn, June 1918), Col d'Echele (I Bn, 28 Jan 1918): en.wikipedia "Arditi".
- `ITA_MAR_02` honours: Grado (1915-18), Cortellazzo (1917-18), Capo Sile (lower Piave, 1918), Andrea Bafile (Gold Medal; battalion 'Bafile' at Cassino 1944), Caimani del Piave (navy-infantry raiders, Vittorio Tur): it.wikipedia "Reggimento San Marco", "Caimani del Piave".
- `ITA_INF_01` 8: 8a Divisione di Marcia (Bolzano, 1942-43): en.wikipedia "8th Marching Division (Italy)".

## Author confirmation
- `ITA_FAV_01` 8 `Brigata Fiamme Verdi 'Dieci Giornate'` (kept): a "brigata 10 Giornate" at Chiari is attested, in contact with the 'Tarzan' group, but not listed as Fiamme Verdi.
- `ITA_FAV_01` 'Giacomo Cappellini', 'Antonio Lorenzetti' (added): sourced to the ANPI MEMO trail list only; area and level not confirmed.
- `ITA_ALT_01` 6 `Brigata 'Damiano Chiesa'` (kept): existence verified, political colour not.
- `ITA_ALT_01` `Divisione 'Val Toce'` (added): Wikisource spelling; en.wikipedia writes "Valtoce".
- `ITA_COL_01` keys 3-4, 21-26: fallback numbers backed by one English order of battle only.
- `ITA_COL_01` 33 `Divisione Coloniale 'Libia'` (added): the proofreader recalled the form "Divisione Libica"; the sources found give "Divisione Coloniale 'Libia'".

## Kept on judgment
Expected `-Check ITA` flags after the batch (19, compared with 26 before; `AUDIT SUMMARY ITA: GROUPS=43 AUTHORED=837/993 FLAGS=19`, from a rehearsal on an export of HEAD):
- `LOW_DEPTH` on 12 groups. Eleven are short because history is: `ITA_CAV_02` (the three Celere divisions), `ITA_CAV_03`, `ITA_CAV_06` (Guillet's Gruppo Bande Amhara), `ITA_PAR_01` (the four parachute and air-landing divisions), `ITA_MAR_01` (the San Marco regiment); `ITA_COL_01`, `ITA_COL_02`, `ITA_COL_03`, `ITA_CAV_04`, `ITA_CAV_05`, `ITA_GAR_01` (see next line). `ITA_ALT_01` has 12 sourced entries, but the lint counts only 9 as authored: it reads the numbered `2a`, `3a` and `5a Brigata Osoppo` as placeholders.
- `PLACEHOLDER_ENTRIES` on `ITA_COL_01`, `ITA_COL_02`, `ITA_CAV_04`, `ITA_CAV_05` (fallback text written over vanilla's merged keys by the 2026-10-17 audit; in `ITA_COL_01` keys 3-4 and 21-26 are also the real AOI division numbers) and `ITA_GAR_01` (the coastal divisions 201-231 carried numbers only). `ITA_COL_03` writes nothing: vanilla's entries equal its fallback.
- File-level `TODO_COMMENT`: false positive on the Roman numeral XXX in `ITA_MIL_01` (tooling backlog).
- File-level `IDENTITY_REPEAT`: 'Asti', 'Langhe' (separate Garibaldi, GL and autonomous formations) and 'Messina' (the infantry division and a MILMART legion): different units sharing a place name.
- `Vanilla:` lines unchanged: `ITA_INF_01` leaves out 6 names (kept by the 2026-10-17 audit), `ITA_INF_02` `13=%da Divisione CC.NN. 'Biscaccianti'`.

## Implementation steps
- [ ] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames ITA -Batch docs/plans/2026-10-25-italy-audit.md`. Expect 11 `Edited` lines and no `[ERROR]`: ITA_INF_01 `+0 -1 ~0`, ITA_INF_02 `+1 -0 ~0`, ITA_MOT_01 `+0 -0 ~0`, ITA_ARM_01 `+0 -0 ~0`, ITA_COL_01 `+1 -0 ~0`, ITA_FAV_01 `+4 -0 ~4`, ITA_ALT_01 `+6 -0 ~3`, ITA_RGR_01 `+5 -0 ~0`, ITA_ARD_01 `+5 -0 ~0`, ITA_MAR_02 `+5 -0 ~0` twice. The file then holds 43 groups and 993 names.
- [ ] 2. `powershell -File .\build.ps1 -SyncWiki ITA`. Expect `Italy.md: 0 row(s) updated` and `wiki/Home.md: ITA group count 43 (unchanged)`. Then replace the nine lines of `wiki/Italy.md` listed under "Docs payload", each whole, with Edit.
- [ ] 3. `powershell -File .\build.ps1 -Check ITA`. Expect `Check passed` and `AUDIT SUMMARY ITA: GROUPS=43 AUTHORED=837/993 FLAGS=19` (LOW_DEPTH x12, PLACEHOLDER_ENTRIES x5, IDENTITY_REPEAT x1, TODO_COMMENT x1), matching "Kept on judgment". No `STALE_COMMENT` or `POLITICAL_ENTRY` may remain.
- [ ] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and files may show in `git status` (SOV, EST, LAT plans, ROADMAP, guide, skills, tooling backlog): leave them alone.
- [ ] 5. Ship, on the user's word: move this plan to `docs/plans/archive/`, stage only `common/units/names_divisions/zz_INEX_ITA_names_divisions.txt`, `wiki/Italy.md` and the plan (its old and archive paths), commit with the message `Deepen ITA partisan, colonial and corps namelists; gate Giovani Fascisti`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Deepen ITA partisan, colonial and corps namelists; gate Giovani Fascisti"`.

## Docs payload
`README.md` and `WORKSHOP_DESCRIPTION_GUIDELINES.md`: no change (their wording still describes the file). `wiki/Italy.md`: replace each line below whole, after `-SyncWiki`. Each "Current" line is unique in the file.

1. `ITA_INF_01` section.
   - Current: `The 1935–43 infantry divisions on their real numbers, from *1a Divisione di Fanteria 'Superga'* to *65a 'Granatieri di Savoia'*, plus the 151–159 occupation divisions (*'Perugia'*, *'Zara'*, *'Veneto'*). Key 136 is *'Giovani Fascisti'*, which shares its number with the armored *'Centauro II'*.`
   - New: `The 1935–43 infantry divisions on their real numbers, from *1a Divisione di Fanteria 'Superga'* to *65a 'Granatieri di Savoia'*, plus the 151–159 occupation divisions (*'Perugia'*, *'Zara'*, *'Veneto'*) and the *8a Divisione di Marcia* (1942–43). The *136a 'Giovani Fascisti'* is in `ITA_INF_02`, fascism only.`
2. `ITA_INF_02` section.
   - Current: `MVSN *Camicie Nere* divisions, fascism only: the seven 1935–43 divisions (*'23 Marzo'*, *'28 Ottobre'*, *'Tevere'*, *'Cirene'*), the Spanish CTV divisions (*'Dio lo Vuole'*, *'Fiamme Nere'*, *'Penne Nere'*) and two extrapolations from MVSN legion names.`
   - New: `MVSN *Camicie Nere* divisions, fascism only: the seven 1935–43 divisions (*'23 Marzo'*, *'28 Ottobre'*, *'Tevere'*, *'Cirene'*), the Spanish CTV divisions (*'Dio lo Vuole'*, *'Fiamme Nere'*, *'Penne Nere'*), two extrapolations from MVSN legion names, and the *136a Divisione 'Giovani Fascisti'* of GIL volunteers (1941–43).`
3. `ITA_COL_01` section.
   - Current: `*1a Divisione Libica 'Sibille'* and *2a 'Pescatori'* (1940), the 1935–36 Eritrean divisions, and the *101a* and *102a Divisione Somala* (1940–41).`
   - New: `*1a Divisione Libica 'Sibille'* and *2a 'Pescatori'* (1940), the 1935–36 Eritrean divisions and *Divisione Coloniale 'Libia'*, and the *101a* and *102a Divisione Somala* (1940–41). The numbered colonial divisions of East Africa (*21a*–*26a Divisione Coloniale*, 1940–41) carried numbers only.`
4. `ITA_FAV_01` section.
   - Current: `Catholic formations of Brescia (neutrality or democratic): *Divisione 'Tito Speri'*, *Divisione 'Astolfo Lunardi'* and their brigades (*'Dieci Giornate'*, *'Perlasca'*).`
   - New: `Catholic formations, mostly of Brescia (neutrality or democratic): *Divisione 'Tito Speri'*, *Divisione 'Astolfo Lunardi'* and their brigades (*'Ferruccio Lorenzini'*, *'Giacomo Perlasca'*, *'Tarzan'*), plus the Reggio Emilia *284a Brigata 'Italo'* and Mazzolari's *Brigata Mantovana*.`
5. `ITA_ALT_01` section.
   - Current: `Formations outside the party networks, available to any non-fascist government: *Brigata Maiella*, *Divisione Osoppo-Friuli*, *Fronte Militare Clandestino*.`
   - New: `Formations outside the party networks, available to any non-fascist government: *Brigata Maiella*, the Friulian *Brigate Osoppo-Friuli* and their brigades, Di Dio's *Divisione 'Val Toce'*, *Fronte Militare Clandestino*.`
6. `ITA_MOT_01` section.
   - Current: `Autotrasportabile and motorized divisions on their infantry numbers (*9a 'Pasubio'*, *101a Motorizzata 'Trieste'*); 106–108 are fictional. `ITA_MEC_01` is the plain mechanized list; `ITA_MEC_02` carries postwar names (*'Granatieri di Sardegna'*, *'Folgore'*, *'Goito'*).`
   - New: `Autotrasportabile and motorized divisions on their infantry numbers (*9a 'Pasubio'*, *101a Motorizzata 'Trieste'*); 106–108 are plausible extrapolations. `ITA_MEC_01` is the plain mechanized list; `ITA_MEC_02` carries postwar names (*'Granatieri di Sardegna'*, *'Folgore'*, *'Goito'*).`
7. `ITA_MAR_01` / `ITA_MAR_02` section.
   - Current: `The *'San Marco'* regiment and a postwar-style *Reggimento Lagunari 'Serenissima'*; fictional *Divisioni Fanteria di Marina*.`
   - New: `The *'San Marco'* regiment and a postwar-style *Reggimento Lagunari 'Serenissima'*; plausible *Divisioni Fanteria di Marina* named after port cities, the Marina regiment's Great War battles on the lower Piave (*'Grado'*, *'Cortellazzo'*, *'Capo Sile'*) and naval tradition (*'Lepanto'*, *'Andrea Bafile'*).`
8. `ITA_RGR_01` section.
   - Current: `Overrides vanilla's placeholder list. Plausible Bersaglieri divisions named after the corps' founder, heroes and honours (*'Alessandro La Marmora'*, *'Enrico Toti'*, *'Cernaia'*, *'Porta Pia'*) and its *Fiamme Cremisi* tradition.`
   - New: `Overrides vanilla's placeholder list. Plausible Bersaglieri divisions named after the corps' founder, heroes and honours (*'Alessandro La Marmora'*, *'Enrico Toti'*, *'Cernaia'*, *'Porta Pia'*, *'Col del Rosso'*) and its *Fiamme Cremisi* tradition.`
9. `ITA_ARD_01` section.
   - Current: `The *10° Reggimento Arditi* and *1° Battaglione Speciale Arditi* (1942), plus plausible assault divisions named after Great War Arditi traditions (*'Col Moschin'*, *'Sdricca di Manzano'*, *'Giuseppe Bassi'*).`
   - New: `The *10° Reggimento Arditi* and *1° Battaglione Speciale Arditi* (1942), plus plausible assault divisions named after the Great War Arditi's school, founder and actions (*'Sdricca di Manzano'*, *'Giuseppe Bassi'*, *'Col Moschin'*, *'Monte Valbella'*, *'Fagarè'*).`

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader` (40 added or changed names, Italian). No spelling or grammar issues. Three "unsure" points, all from memory without a lookup; each is kept, since the research runs sourced it:
- `ITA_FAV_01` 11 `284a Brigata Fiamme Verdi 'Italo'`: kept (SIUSA archive record "284ª brigata Fiamme verdi Italo").
- `ITA_FAV_01` 4 `'Tarzan'`: kept (it.wikipedia "Fiamme Verdi": Brigata "Tarzan", Pontoglio, Tomaso Bertoli).
- `ITA_COL_01` 33 `Divisione Coloniale 'Libia'` versus "Divisione Libica": kept (en.wikipedia "Italian Libyan Colonial Division"; it.wikipedia Regio corpo truppe coloniali navbox), and added to "Author confirmation".
It confirmed 'Giacomo Pagliari' independently (Giornale di Brescia, 14 Sept 2021). The batch is unchanged. A rehearsal on an export of HEAD applied the batch, renamed the three section headers, and gave the flags under "Kept on judgment" and the step outputs above.

## Outcome
<!-- TODO(implementer): date, the -Check summary, deviations from this plan with the reason -->

## Edit batch
Applied by `build.ps1 -EditNames ITA -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_01", "remove": ["136"] }
```

```json batch
{ "group": "INF_02", "section": "Giovani Fascisti, GIL volunteers (1941-43)", "add": ["136=%da Divisione 'Giovani Fascisti'"] }
```

```json batch
{ "group": "MOT_01", "renameSection": ["Fictional=Plausible expansion"] }
```

```json batch
{ "group": "ARM_01", "renameSection": ["Fictional (postwar cavalry brigade)=Plausible expansion (postwar cavalry brigade)"] }
```

```json batch
{ "group": "COL_01", "renameSection": ["Eritrean divisions (1935-36)=Ethiopian war divisions (1935-36)"], "after": "2a Divisione Eritrea", "add": ["33=Divisione Coloniale 'Libia'"] }
```

```json batch
{ "group": "FAV_01",
  "set": ["4=Brigata Fiamme Verdi 'Tarzan'", "5=Brigata Fiamme Verdi 'Ferruccio Lorenzini'", "6=Brigata Fiamme Verdi 'Giacomo Perlasca'", "7=Brigata Fiamme Verdi 'Ermanno Margheriti'"],
  "add": ["9=Brigata Fiamme Verdi 'Giacomo Cappellini'", "10=Brigata Fiamme Verdi 'Antonio Lorenzetti'", "11=284a Brigata Fiamme Verdi 'Italo'", "12=Brigata Mantovana Fiamme Verdi"] }
```

```json batch
{ "group": "ALT_01",
  "set": ["2=Brigate Osoppo-Friuli", "4=Divisione 'Val Toce'", "5=1a Divisione Osoppo Carnia"],
  "add": ["7=1a Brigata Osoppo Prealpi", "8=2a Brigata Osoppo", "9=3a Brigata Osoppo", "10=5a Brigata Osoppo", "11=Brigata Osoppo 'Martelli'", "12=Brigata Alpina d'Assalto 'Filippo Beltrami'"] }
```

```json batch
{ "group": "RGR_01", "section": "Founder, heroes and battle honours",
  "add": ["10=%da Divisione Bersaglieri 'Santa Lucia'", "11=%da Divisione Bersaglieri 'Castelfidardo'", "12=%da Divisione Bersaglieri 'Giacomo Pagliari'", "13=%da Divisione Bersaglieri 'Monte Fior'", "14=%da Divisione Bersaglieri 'Col del Rosso'"] }
```

```json batch
{ "group": "ARD_01", "section": "Plausible expansion (Great War Arditi)",
  "add": ["6=%da Divisione d'Assalto 'Monte Valbella'", "7=%da Divisione d'Assalto 'Col d'Echele'", "8=%da Divisione d'Assalto 'Monte Asolone'", "9=%da Divisione d'Assalto 'Fagarè'", "10=%da Divisione d'Assalto 'Monte Pertica'"] }
```

```json batch
[
  { "group": "MAR_02", "section": "Great War battles of the Reggimento Marina (1915-18)",
    "add": ["6=%da Divisione Fanteria di Marina 'Grado'", "7=%da Divisione Fanteria di Marina 'Cortellazzo'", "8=%da Divisione Fanteria di Marina 'Capo Sile'", "9=%da Divisione Fanteria di Marina 'Caimani del Piave'", "10=%da Divisione Fanteria di Marina 'Andrea Bafile'"] },
  { "group": "MAR_02", "section": "Naval tradition",
    "add": ["11=%da Divisione Fanteria di Marina 'Lepanto'", "12=%da Divisione Fanteria di Marina 'Amalfi'", "13=%da Divisione Fanteria di Marina 'Gaeta'", "14=%da Divisione Fanteria di Marina 'Brindisi'", "15=%da Divisione Fanteria di Marina 'Pola'"] }
]
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
No name changes versus the base revision.
<!-- END CHANGE TABLE -->
