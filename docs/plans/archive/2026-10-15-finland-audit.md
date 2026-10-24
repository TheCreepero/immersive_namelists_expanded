# Finland (FIN) Namelist Audit - 2026-10-15

Status: DONE

File: `common/units/names_divisions/zz_INEX_FIN_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit FIN`)
- AUDIT SUMMARY FIN: GROUPS=27 AUTHORED=491/519 FLAGS=1
- File-level: `IDENTITY_REPEAT` (info). No group flags.
- Found on manual review:
  - Wrong or unattested identities: `FIN_INF_05` 4 'Porlammi' (the 8. D's battle, and not a Finnish nominative: *Porlampi*), 11 'Iskevä Kiila' (unattested nickname), 13 'Jänisjoki' (unsupported); `FIN_FRN_01` ErP 7 'Lieksa', ErP 8 'Ilomantsi', ErP 15 'Kuhmo' (wrong sectors); `FIN_DET_02` 'Ryhmä Kekkonen' (no such commander; reads as the politician).
  - Selector clash the lint cannot see: `FIN_MTN_01` "Mountain Divisions" and vanilla `FIN_MTN_02` "Mountain Divisions" (INEX does not define it, so it stays) are both offered to mountaineer templates.
  - Vanilla `FIN_GAR_01`'s named entries (Isthmus covering groups, local komennuskunnat) are gone: INEX replaced the group with *Paikallisjoukot*. `-Audit` reports only numbered keys for it because INEX defines the same keys with other names.
  - `FIN_MTN_01` 11-14 put a detachment label inside a division nickname ('Osasto Marttina').
  - `FIN_REG_01` entries use the wartime form *JR N*, the fallback the ordinal *%d. Jalkaväkirykmentti*.
  - `FIN_MIL_01`'s `has_government = fascism` gate meets a vanilla focus that gives the group to a neutrality-ruled country (see Kept on judgment, [NAM-018]).

## User decisions
- Expansion (asked before research): add three groups: Infantry Brigades (`FIN_BRIG_01`), Light Detachments (`FIN_LGT_01`), Separate Battalions (`FIN_ERP_01`). Finland-Swedish Regiments not chosen.
- Checkpoint (2026-10-15): the user approved the audit report as proposed, every item included: the identity fixes, moving the four ErP entries from `FIN_FRN_01` to `FIN_ERP_01`, the vanilla `FIN_GAR_01` names restored to `FIN_DET_01` and `FIN_DET_02`, the `FIN_MTN_01` selector "Sissi Divisions", the `FIN_REG_01` fallback, and all three new groups as drafted (including the four-name `FIN_LGT_01` and the post-war brigade extension 22-27). Nothing dropped.

## Research
- `inex-audit-researcher`, run 1 (25 web calls): brigades 1939-45, ErP and KevOs lists, suspect entries. Brigades settled from the Lysator order of battle ("The Continuation War 1941-1944") and the Doria thesis "Prikaatien käyttö kesän 1944 taisteluissa" (Nissinen 2007); no ErP or KevOs list page reachable.
- `inex-audit-researcher`, run 2 (25 web calls): ErP and KevOs numbers, three division identities, regiment nicknames. Sources: Wikipedia (IV Corps (Winter War), Battle of Ilomantsi (1939), Ingrian Battalion, Detached Battalion 4), talvisota.fi and viakarelia.fi (Suomussalmi 1939), Lysator Winter War table, Finnish National Library catalogue (unit histories). No complete ErP or KevOs list exists online that either run could reach.
- Vanilla read in this session: `common/national_focus/finland.txt` (focuses that name `FIN_MIL_01`, `FIN_MIL_02`, `FIN_INF_04`, `FIN_INF_02`, `FIN_PEN_01`, `FIN_GAR_02`) and `FIN_names_divisions.txt`. Recorded [NAM-018] in the knowledge register.

## Rationale
- **Named infantry (`FIN_INF_05`).** Numbers that existed carry their best-known battle or sector. 4 'Porlammi' is wrong twice: the Porlampi motti (1941) was the 8. D's, and the nominative is *Porlampi*. So 8 'Kannas' (a generic theatre) becomes 'Porlampi' and 4 takes 'Kuolemajärvi', its Winter War sector (its Continuation War sector 'Maaselkä' goes to 2. Jääkäriprikaati, 'Viipuri' to 20. Prikaati). 13 'Jänisjoki' becomes 'Lemetti' (Winter War IV AK: Ruhtinaanmäki and Lemetti). 11 'Iskevä Kiila' is an invented nickname; 'Jänisjärvi' is the 11. D's 1941 VI AK advance (single secondary source, author confirmation).
- **Separate battalions move to their own group.** `FIN_FRN_01` carried four ErP entries, three with a wrong sector. The new `FIN_ERP_01` is their home with sourced identities (7 'Nisalahti', 8 'Laatokan Karjala', 15 'Raate', 16 'Piispajärvi'), and `FIN_FRN_01` keeps border guard formations only; its keys 16-19 fall back to *N. Rajajääkäripataljoona*. ErP 6 'Inkeri' stays in `FIN_INF_02` (kinship legion) and is added to `FIN_ERP_01`, because the Ingrian battalion was a regular army battalion of 1943-44 and must not be fascist-only. ErP 21 stays in `FIN_PEN_01` only (its penal identity; key 21 of `FIN_ERP_01` uses the fallback).
- **`FIN_DET_02`.** 'Ryhmä Kekkonen' becomes 'Uudenkirkon Ryhmä', and keys 21-25 bring back vanilla `FIN_GAR_01`'s other groups (Muolaan, Raudun, Pohjois-Karjalan, Räsäsen, Lipolan Ryhmä) in vanilla's own spelling. Restoring vanilla's names beats the extrapolated commander groups (R12).
- **`FIN_DET_01`.** Keys 21-24 bring back vanilla `FIN_GAR_01`'s komennuskunnat that expand unambiguously (Petsamo, Lahti, Lemi, Savitaipale; Taipalsaari is already key 14). Vanilla's 'Taivalal.', 'Äänl.' and 'Hanhik.' are abbreviations with more than one reading and stay out.
- **`FIN_MTN_01`.** Selector "Sissi Divisions" matches its fallback and ends the clash with vanilla `FIN_MTN_02`; vanilla `FIN_INF_03` "Sissi Divisions" is offered only to infantry and ranger templates, so the two never share a selector list. 'Osasto X' becomes 'X' (the Er.P 4 long-range patrol leaders).
- **`FIN_REG_01` fallback** becomes *JR %d*, the form of all 70 entries and of the wartime army.
- **New `FIN_BRIG_01` "Infantry Brigades"** (*%d. Prikaati*, infantry, after `FIN_REG_01`). The 1941 Jäger brigades and the 1942-44 brigades with their sourced battles; key 12 (12. Pr, Maaselkä 1942) uses the fallback because its sector duplicates 2. JPr. Not linked to `FIN_INF_01`: in 1944 a 15. Prikaati and a 15. Divisioona coexisted. Keys 22-27 are an extrapolation: the regional brigades of the post-war army (Porin, Karjalan, Kainuun, Pohjan, Savon, Uudenmaan Prikaati), which the army of 1939-45 never fielded under those names.
- **New `FIN_ERP_01` "Separate Battalions"** (*Erillinen Pataljoona %d*, infantry, after `FIN_DET_02`). Only sourced numbers carry an identity; the fallback is the authentic designation for every other number.
- **New `FIN_LGT_01` "Light Detachments"** (*Kevyt Osasto %d*, cavalry and infantry, after `FIN_CAV_01`). Four sourced identities; the fallback is the authentic designation. `bicycle_battalion` would fit better but `-EditNames` refuses it (already in `docs/tooling-backlog.md`).

## Verified formations & commanders
- `FIN_INF_05` 1-19: the divisions of 1939-44, well documented. Changed identities: 4 'Kuolemajärvi' (Lysator: The Winter War 1939-1940, 4. D at Kuolemajärvi / Gulf of Viborg); 8 'Porlampi' (Wikipedia: Battle of Porlampi, 8th Division); 13 'Lemetti' (Lysator Winter War table, 13. D under IV AK at Ruhtinaanmäki and Lemetti).
- `FIN_REG_01` nicknames: JR 5 'Aaverykmentti' (National Library: "Aaverykmentti rauhan tiellä: JR 5 50 v."); JR 7 'Tyrjän rykmentti' (National Library: "Tyrjän rykmentin rintamalehti"); JR 11 'Ässärykmentti' (HAM Helsinki: Leijonapatsas JR 11 -muistomerkki); JR 12 'Jänkäjääkärit' (Kaleva: "Jänkäjääkäreillä yhä kerrottavaa"); JR 25 'Piikkirykmentti' (National Library: "Piikkirykmentti Kannaksella 1944"); JR 16 'Pajarin rykmentti', JR 34 'Kollaan rykmentti' well documented.
- `FIN_BRIG_01`: 1. Jääkäriprikaati 'Aunus' and 2. Jääkäriprikaati 'Maaselkä' (Lysator: The Continuation War 1941-1944); 3. Prikaati 'Ihantala', 15. Prikaati 'Nietjärvi', 19. Prikaati 'Taipale', 20. Prikaati 'Viipuri', 21. Prikaati 'Ilomantsi' (Lysator; Doria: Nissinen 2007; National Library: "Vansjärveltä Ilomantsiin"). Post-war brigades 22-27 well documented (Finnish Army 1957 onward).
- `FIN_ERP_01`: ErP 4 'Kaukopartio' (Wikipedia: Detached Battalion 4); ErP 6 'Inkeri' (Wikipedia: Ingrian Battalion); ErP 7 'Nisalahti' (National Library: "Er.P7 talvisodassa: Seivästöltä - Nisalahdelle"); ErP 8 'Laatokan Karjala' (Väisänen, "Valkeissa arkuissa - I/JR 37 ja Er.P 8 talvisodassa Laatokan Karjalassa"); ErP 11 'Mekrijärvi' (Wikipedia: Battle of Ilomantsi (1939), "the border village of Megri", Maj. Vilho Nikoskelainen; *Megri* is the non-Finnish form of Mekrijärvi, Ilomantsi); ErP 15 'Raate' (talvisota.fi: The Battle of Suomussalmi 1939; viakarelia.fi); ErP 16 'Piispajärvi' (talvisota.fi: The Battle of Suomussalmi 1939).
- `FIN_LGT_01`: KevOs 6 'Blick' (National Library: "Eversti Blickin kevytjoukko: Kevyt osasto 6 1941-1942"); KevOs 7 'Taipale' (Taipale local history, National Library record); KevOs 8 'Äänislinna' (National Library: "Kärkenä Äänislinnaan: Kevyt osasto 8:n historia"); KevOs 9 'Suomussalmi' (memoir "Veikko Hietalan sotavuodet": KevOs 9 with 9. D in Pohjois-Suomen Ryhmä).
- `FIN_DET_02` 21-25, 15 and `FIN_DET_01` 21-24: vanilla `FIN_GAR_01` (Paradox), restored as written there.
- Legacy entries not listed here were not re-checked in this audit.

## Author confirmation
- `FIN_INF_05` 11 'Jänisjärvi': one secondary mention (Wikipedia: 1941 VI AK attack toward Lake Jänisjärvi).
- `FIN_ERP_01` 14 'Kuhmo': from a talvisota.fi search summary only.
- `FIN_REG_01` JR 6 'Kannaksen kahlaajat', JR 8 'Ukko-rykmentti': unverified in two runs; kept as they are.
- `FIN_DET_02` 'Ryhmä Vuokko': unverified in two runs; kept (11-20 are plausible commander groups by the file's own comment).
- `FIN_PEN_01` 'Pärmin pirut': not found as a nickname of ErP 21 (attested: "Musta nuoli"); kept because it renders vanilla's own focus name, *Pärmi's Devils*.

## Kept on judgment
- `IDENTITY_REPEAT` (file): regional identities shared by the regional extensions of `FIN_CAV_01` and `FIN_MOT_02`, and battle identities shared by units that fought there together ('Tali', 'Ihantala', 'Taipale', 'Äänislinna', 'Suomussalmi', 'Kaukopartio', 'Inkeri', 'Kuhmo', 'Hanko'). The batch adds some of these on purpose.
- `LOW_DEPTH` on `FIN_ERP_01` (8 authored) and `FIN_LGT_01` (4 authored): only sourced identities are written; no list of either unit type is reachable, and the fallback is the authentic designation.
- `FIN_MIL_01` gate stays `has_government = fascism`. Vanilla's communist civil war (`FIN_the_second_finnish_civil_war`) creates a "Mustapaidat" template on `FIN_MIL_01` in the breakaway, whose `start_civil_war` ideology is neutrality, so that AI template moves to another list [NAM-018]. Widening the gate would offer Blackshirt legions to every non-aligned Finland. The other gated focus groups run on the matching government: `FIN_INF_02` and the `FIN_mustapaidat` focus follow `FIN_a_fascist_regime`; `FIN_MIL_02` and `FIN_INF_04` are created for the communist side.
- `FIN_INF_01` "leaves out 35 numbered keys past a gap": vanilla omits only key 16, as fallback repeats. No 16. Divisioona existed, but the named `FIN_INF_05` already uses the fallback at 16, and the plain variant stays fallback-only to match.
- `FIN_MOT_01` 1='Jääkäridivisioona' and `FIN_MEC_01` 1='PsJääkäridivisioona' (vanilla, unnumbered): the plain variants count from 1; the unnumbered historical names live in the named variants (`FIN_MOT_02` 1, `FIN_MEC_02` 1).
- `FIN_GAR_01` "leaves out 22 numbered keys": vanilla's keys 31-53 repeat its fallback *%d. Ryhmä*.
- `FIN_SVFK_02` 'Flygflottilj 19 'Kemi'' and 'Svenska Ambulansen 'Savukoski'': not ground combat units, kept as part of the SFK roster the group mirrors.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames FIN -Batch docs/superpowers/plans/2026-10-15-finland-audit.md`. Expect one line per operation, ten in all (`FIN_INF_05`, `FIN_REG_01`, `FIN_BRIG_01`, `FIN_LGT_01`, `FIN_DET_01`, `FIN_DET_02` twice, `FIN_ERP_01`, `FIN_FRN_01`, `FIN_MTN_01`), the file then holding 30 groups and 549 names, and no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki FIN`. Expect: the `FIN_MTN_01` heading becomes `Sissi Divisions (Sissidivisioona)`; the `FIN_MTN_01` row name and the `FIN_REG_01` row fallback (`JR %d`) change; `FIN_BRIG_01`, `FIN_LGT_01` and `FIN_ERP_01` are listed as groups without a row; prose lines that mention changed names may be listed (the Docs payload rewrites them). Then make every edit under "Docs payload", in the order given.
- [x] 3. `powershell -File .\build.ps1 -SyncWiki FIN` again. Expect no group without a row and no row or heading change. If it still lists a prose line that mentions a removed name, compare it with the Docs payload: a line the payload rewrote is done; any other line is a stop condition.
- [x] 4. `powershell -File .\build.ps1 -Check FIN`. Expect `Check passed`. The remaining flags must be exactly those under "Kept on judgment": `IDENTITY_REPEAT` (file), `LOW_DEPTH` on `FIN_ERP_01` and `FIN_LGT_01`.
- [x] 5. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 6. Ship, on the user's word. The working tree holds unrelated changes from other sessions, so stage only this audit's files: `git add common/units/names_divisions/zz_INEX_FIN_names_divisions.txt wiki/Finland.md wiki/Home.md WORKSHOP_DESCRIPTION_GUIDELINES.md docs/superpowers/plans/2026-10-15-finland-audit.md`, then commit with the message `Audit FIN division namelists; add brigades, separate battalions and light detachments`. Then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit FIN division namelists"`.

## Docs payload
Every edit is a literal replacement; the old text occurs once in its file.

### `wiki/Finland.md`
1. Replace `and adds 12 new groups (` with `and adds 15 new groups (`.
2. Replace `` `FIN_CST_01`, `FIN_GUA_01`), for **27 namelist groups** in total. `` with `` `FIN_CST_01`, `FIN_GUA_01`, `FIN_BRIG_01`, `FIN_LGT_01`, `FIN_ERP_01`), for **30 namelist groups** in total. ``
3. Directly after the line `| *Osasto* | Detachment |` insert these two lines:
```
| *Kevyt Osasto (KevOs)* | Light detachment (bicycle and ski reconnaissance) |
| *Erillinen Pataljoona (ErP)* | Separate battalion |
```
4. Group table. Directly after the row that starts with ``| `FIN_CAV_01` |`` insert:
```
| `FIN_LGT_01` | Light Detachments | cavalry, infantry | `Kevyt Osasto %d` | Universal |
```
   Directly after the row that starts with ``| `FIN_REG_01` |`` insert:
```
| `FIN_BRIG_01` | Infantry Brigades | infantry | `%d. Prikaati` | Universal |
```
   Directly after the row that starts with ``| `FIN_DET_02` |`` insert:
```
| `FIN_ERP_01` | Separate Battalions | infantry | `Erillinen Pataljoona %d` | Universal |
```
5. Replace `| 4 | Porlammi | Continuation War (1941) |` with `| 4 | Kuolemajärvi | Winter War |`.
6. Directly after the line `| 7 | Sortavala | Continuation War (1941) |` insert the line `| 8 | Porlampi | Continuation War (1941) |`.
7. Replace `| 11 | *Iskevä Kiila* (nickname) | Continuation War |` with `| 11 | Jänisjärvi | Continuation War (1941) |`.
8. Replace `| 13 | Jänisjoki | Winter War |` with `| 13 | Lemetti | Winter War |`.
9. Replace `1. D (*Varsinais-Suomi*, formation area), 8. D (*Kannas*) and 19. D (*Itä-Karjala*) carry their theatre or region.` with `1. D (*Varsinais-Suomi*, formation area) and 19. D (*Itä-Karjala*) carry their theatre or region.`
10. Directly before the line ``### `FIN_FRN_01` — Frontier Jaegers (Rajajääkärit)`` insert these two lines (a section and a blank line):
```
### `FIN_BRIG_01` — Infantry Brigades (Prikaati)
The brigades of 1941–44 carry their best-known battle: *1. Jääkäriprikaati 'Aunus'* and *2. Jääkäriprikaati 'Maaselkä'* (1941), *3. Prikaati 'Ihantala'*, *15. Prikaati 'Nietjärvi'*, *19. Prikaati 'Taipale'*, *20. Prikaati 'Viipuri'* and *21. Prikaati 'Ilomantsi'* (1944). Numbers 22–27 extend the list with the regional brigades of the post-war army (*Porin*, *Karjalan*, *Kainuun*, *Pohjan*, *Savon* and *Uudenmaan Prikaati*). Not linked to the division numbering: a 15. Prikaati and a 15. Divisioona served at the same time.

```
11. Replace `the *1. Rajajääkäriprikaati* (1944), *Rajajääkäripataljoonat 1–8*, and independent border battalions (*Er.P 7*, *Er.P 8*, *Er.P 15*, *Er.P 16*).` with ``the *1. Rajajääkäriprikaati* (1944) and *Rajajääkäripataljoonat 1–8*. The separate battalions (*Erilliset Pataljoonat*) are in `FIN_ERP_01`.``
12. Directly before the line ``### `FIN_MOT_01` / `FIN_MOT_02` — Motorised Divisions (Jääkäridivisioona)`` insert:
```
### `FIN_LGT_01` — Light Detachments (Kevyt Osasto)
The bicycle and ski light detachments (*Kevyet Osastot*) of 1939–44. Numbers with a sourced sector carry it: *Kevyt Osasto 7 'Taipale'* and *Kevyt Osasto 9 'Suomussalmi'* (Winter War), *Kevyt Osasto 6 'Blick'* (Col. Blick's light force, 1941–42) and *Kevyt Osasto 8 'Äänislinna'* (Continuation War). Every other number uses the designation itself (*Kevyt Osasto %d*).

```
13. Replace `Local border defense detachments named after 20 parishes of the eastern border zone (*Ilomantsin*, *Lieksan*, *Nurmeksen* …).` with `Local border defense detachments named after 20 parishes of the eastern border zone (*Ilomantsin*, *Lieksan*, *Nurmeksen* …), and the komennuskunnat of vanilla's garrison list (*Petsamon*, *Lahden*, *Lemin*, *Savitaipaleen Komennuskunta*).`
14. Replace `*Maaselän Ryhmä*) and commander-named wartime groups 11–20 (*Pajari*, *Teittinen*, *Mäkiniemi*, *Vuokko*, *Kekkonen*, *Roininen*, *Suoranta*, *Pennanen*, *Kuussaari*, *Halsti*).` with `*Maaselän Ryhmä*), commander-named wartime groups 11–20 (*Pajari*, *Teittinen*, *Mäkiniemi*, *Vuokko*, *Roininen*, *Suoranta*, *Pennanen*, *Kuussaari*, *Halsti*), and the Winter War groups of vanilla's garrison list (*Uudenkirkon*, *Muolaan*, *Raudun*, *Pohjois-Karjalan*, *Räsäsen*, *Lipolan Ryhmä*).`
15. Directly before the line ``### `FIN_PEN_01` — Penal Battalions (Rangaistusjoukot)`` insert:
```
### `FIN_ERP_01` — Separate Battalions (Erillinen Pataljoona)
The separate battalions (*Erilliset Pataljoonat*, ErP) of 1939–44, each numbered battalion with the sector a source places it in: in the Winter War *ErP 7 'Nisalahti'*, *ErP 8 'Laatokan Karjala'*, *ErP 11 'Mekrijärvi'*, *ErP 14 'Kuhmo'*, *ErP 15 'Raate'* and *ErP 16 'Piispajärvi'*; in the Continuation War *ErP 4 'Kaukopartio'* (long-range patrols) and *ErP 6 'Inkeri'* (the Ingrian battalion). Every other number uses the designation itself. The penal *ErP 21* is in `FIN_PEN_01`.

```
16. Replace `and Er.P 4 long-range patrol detachments (*Osasto Marttina*, *Osasto Vehniäinen*, *Osasto Kuismanen*, *Osasto Paatsalo*).` with `and the leaders of the Er.P 4 long-range patrol detachments (*Marttina*, *Vehniäinen*, *Kuismanen*, *Paatsalo*). The selector reads *Sissi Divisions*, so it does not repeat vanilla's "Mountain Divisions" (`FIN_MTN_02`).`

### `WORKSHOP_DESCRIPTION_GUIDELINES.md`
17. Cross-reference row: replace `Included (Wartime divisions & JR 1–70 regiments, Suojeluskunta,` with `Included (Wartime divisions & JR 1–70 regiments, Prikaati brigades, Separate battalions (ErP), Light detachments (KevOs), Suojeluskunta,`.
18. `[b]Finland[/b]` block: replace `- Numbered divisions & wartime regiments ([i]12. Divisioona 'Kollaa'[/i], [i]JR 7 'Tyrjän rykmentti'[/i], [i]JR 61[/i]) and Suojeluskunta districts` with `- Numbered divisions, brigades & wartime regiments ([i]12. Divisioona 'Kollaa'[/i], [i]20. Prikaati 'Viipuri'[/i], [i]JR 7 'Tyrjän rykmentti'[/i]), separate battalions and Suojeluskunta districts`.

### `README.md`
No change (the Finland row names only the tag and the file).

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-code-reviewer` (1 web call) on the 43 added and changed names. Findings and what was done:
- `FIN_ERP_01` ErP 11 'Megri': the Finnish name of the Ilomantsi border village is *Mekrijärvi*. Confirmed with one search (Wikipedia: Battle of Ilomantsi (1939); viakarelia.fi: Battles in Ilomantsi 10-16 December 1939). Respelled to 'Mekrijärvi' in the batch and the Docs payload.
- `FIN_ERP_01` ErP 7 'Nisalahti' (spelling unsure): kept; it is the nominative of *Nisalahdelle* in the unit-history title.
- `FIN_INF_05` 13 'Lemetti' vs 'Ruhtinaanmäki' (unsure): kept; the source names both, and Lemetti is the better-known battle.
- Confirmed as written: 'Piispajärvi'; *Pohjan Prikaati* (a brigade distinct from *Pohjanmaan Prikaati*); the genitive modifiers of `FIN_DET_01` and `FIN_DET_02`; the fallbacks *JR %d*, *Kevyt Osasto %d*, *Erillinen Pataljoona %d* and *%d. Prikaati*.

## Outcome
Date: 2026-10-15.

`-Check FIN`: Validate OK; Tests 432 Passed, 0 Failed; `AUDIT SUMMARY FIN: GROUPS=30 AUTHORED=521/549 FLAGS=3`; flags `LOW_DEPTH` x2 (`FIN_ERP_01`, `FIN_LGT_01`) and `IDENTITY_REPEAT` x1 (file). All three are listed under "Kept on judgment". Check passed. Diff vs HEAD: 9 groups changed, +43 -13 names.

Deviations: none. The `-Check` run refreshed the change table in the "Per-group changes" section, which is the tool's own output.

## Edit batch
Applied by `build.ps1 -EditNames FIN -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_05", "rename": [
  "4. Divisioona 'Porlammi'=4. Divisioona 'Kuolemajärvi'",
  "8. Divisioona 'Kannas'=8. Divisioona 'Porlampi'",
  "11. Divisioona 'Iskevä Kiila'=11. Divisioona 'Jänisjärvi'",
  "13. Divisioona 'Jänisjoki'=13. Divisioona 'Lemetti'"
] }
```

```json batch
{ "group": "REG_01", "fallback": "JR %d" }
```

```json batch
{ "addGroup": true, "group": "BRIG_01", "selector": "Infantry Brigades", "addType": ["infantry"], "fallback": "%d. Prikaati", "after": "REG_01",
  "comment": "Infantry brigades (Prikaatit): the 1941 Jäger brigades and the 1941-44 brigades with their\nbest-known battle; 22+ extend the list with the regional brigades of the post-war army.\nNot linked to FIN_INF_01: in 1944 a 15. Prikaati and a 15. Divisioona served at the same time.",
  "add": [
    "# Jäger brigades of 1941",
    "1=1. Jääkäriprikaati 'Aunus'",
    "2=2. Jääkäriprikaati 'Maaselkä'",
    "# Brigades of 1941-44",
    "3=3. Prikaati 'Ihantala'",
    "15=15. Prikaati 'Nietjärvi'",
    "19=19. Prikaati 'Taipale'",
    "20=20. Prikaati 'Viipuri'",
    "21=21. Prikaati 'Ilomantsi'",
    "# Extension: regional brigades of the post-war army",
    "22=Porin Prikaati",
    "23=Karjalan Prikaati",
    "24=Kainuun Prikaati",
    "25=Pohjan Prikaati",
    "26=Savon Prikaati",
    "27=Uudenmaan Prikaati"
  ] }
```

```json batch
{ "addGroup": true, "group": "LGT_01", "selector": "Light Detachments", "addType": ["cavalry", "infantry"], "fallback": "Kevyt Osasto %d", "after": "CAV_01",
  "comment": "Light detachments (Kevyet Osastot): the bicycle and ski reconnaissance units of 1939-44.\nOnly sourced numbers carry an identity; the fallback is the authentic designation.",
  "add": [
    "# Winter War, 1939-40",
    "7=Kevyt Osasto 7 'Taipale'",
    "9=Kevyt Osasto 9 'Suomussalmi'",
    "# Continuation War, 1941-44",
    "6=Kevyt Osasto 6 'Blick'",
    "8=Kevyt Osasto 8 'Äänislinna'"
  ] }
```

```json batch
{ "group": "DET_01", "section": "Komennuskunnat of vanilla FIN_GAR_01", "add": [
  "21=Petsamon Komennuskunta",
  "22=Lahden Komennuskunta",
  "23=Lemin Komennuskunta",
  "24=Savitaipaleen Komennuskunta"
] }
```

```json batch
[
  { "group": "DET_02", "rename": ["Ryhmä Kekkonen=Uudenkirkon Ryhmä"],
    "comment": "Ad hoc groups: 1-10 are historical formations (1939-44), 11-20 plausible groups named after\nregiment and detachment commanders of the period. 15 and 21-25 are the Winter War groups of\nvanilla FIN_GAR_01." },
  { "group": "DET_02", "section": "Winter War groups of vanilla FIN_GAR_01", "add": [
    "21=Muolaan Ryhmä",
    "22=Raudun Ryhmä",
    "23=Pohjois-Karjalan Ryhmä",
    "24=Räsäsen Ryhmä",
    "25=Lipolan Ryhmä"
  ] }
]
```

```json batch
{ "addGroup": true, "group": "ERP_01", "selector": "Separate Battalions", "addType": ["infantry"], "fallback": "Erillinen Pataljoona %d", "after": "DET_02",
  "comment": "Separate battalions (Erilliset Pataljoonat). Only sourced numbers carry an identity; the fallback\nis the authentic designation. The penal ErP 21 is in FIN_PEN_01.",
  "add": [
    "# Winter War, 1939-40",
    "7=Erillinen Pataljoona 7 'Nisalahti'",
    "8=Erillinen Pataljoona 8 'Laatokan Karjala'",
    "11=Erillinen Pataljoona 11 'Mekrijärvi'",
    "14=Erillinen Pataljoona 14 'Kuhmo'",
    "15=Erillinen Pataljoona 15 'Raate'",
    "16=Erillinen Pataljoona 16 'Piispajärvi'",
    "# Continuation War, 1941-44",
    "4=Erillinen Pataljoona 4 'Kaukopartio'",
    "6=Erillinen Pataljoona 6 'Inkeri'"
  ] }
```

```json batch
{ "group": "FRN_01", "remove": [
  "Erillinen Pataljoona 7 'Lieksa'",
  "Erillinen Pataljoona 8 'Ilomantsi'",
  "Erillinen Pataljoona 15 'Kuhmo'",
  "Erillinen Pataljoona 16 'Suomussalmi'"
] }
```

```json batch
{ "group": "MTN_01", "selector": "Sissi Divisions", "rename": [
  "11. Sissidivisioona 'Osasto Marttina'=11. Sissidivisioona 'Marttina'",
  "12. Sissidivisioona 'Osasto Vehniäinen'=12. Sissidivisioona 'Vehniäinen'",
  "13. Sissidivisioona 'Osasto Kuismanen'=13. Sissidivisioona 'Kuismanen'",
  "14. Sissidivisioona 'Osasto Paatsalo'=14. Sissidivisioona 'Paatsalo'"
] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_05 | 29 -> 29 | 4. Divisioona 'Kuolemajärvi', 8. Divisioona 'Porlampi', 11. Divisioona 'Jänisjärvi', 13. Divisioona 'Lemetti' | 4. Divisioona 'Porlammi', 8. Divisioona 'Kannas', 11. Divisioona 'Iskevä Kiila', 13. Divisioona 'Jänisjoki' | - |
| REG_01 | 70 -> 70 | - | - | fallback: '%d. Jalkaväkirykmentti' -> 'JR %d' |
| DET_01 | 20 -> 24 | Petsamon Komennuskunta, Lahden Komennuskunta, Lemin Komennuskunta, Savitaipaleen Komennuskunta | - | - |
| DET_02 | 20 -> 25 | Uudenkirkon Ryhmä, Muolaan Ryhmä, Raudun Ryhmä, Pohjois-Karjalan Ryhmä, Räsäsen Ryhmä, Lipolan Ryhmä | Ryhmä Kekkonen | - |
| MTN_01 | 16 -> 16 | 11. Sissidivisioona 'Marttina', 12. Sissidivisioona 'Vehniäinen', 13. Sissidivisioona 'Kuismanen', 14. Sissidivisioona 'Paatsalo' | 11. Sissidivisioona 'Osasto Marttina', 12. Sissidivisioona 'Osasto Vehniäinen', 13. Sissidivisioona 'Osasto Kuismanen', 14. Sissidivisioona 'Osasto Paatsalo' | selector: 'Mountain Divisions' -> 'Sissi Divisions' |
| FRN_01 | 28 -> 24 | - | Erillinen Pataljoona 7 'Lieksa', Erillinen Pataljoona 8 'Ilomantsi', Erillinen Pataljoona 15 'Kuhmo', Erillinen Pataljoona 16 'Suomussalmi' | - |
| LGT_01 | new, 4 | Kevyt Osasto 7 'Taipale', Kevyt Osasto 9 'Suomussalmi', Kevyt Osasto 6 'Blick', Kevyt Osasto 8 'Äänislinna' | - | - |
| BRIG_01 | new, 13 | 1. Jääkäriprikaati 'Aunus', 2. Jääkäriprikaati 'Maaselkä', 3. Prikaati 'Ihantala', 15. Prikaati 'Nietjärvi', 19. Prikaati 'Taipale', 20. Prikaati 'Viipuri', 21. Prikaati 'Ilomantsi', Porin Prikaati, Karjalan Prikaati, Kainuun Prikaati, Pohjan Prikaati, Savon Prikaati, Uudenmaan Prikaati | - | - |
| ERP_01 | new, 8 | Erillinen Pataljoona 7 'Nisalahti', Erillinen Pataljoona 8 'Laatokan Karjala', Erillinen Pataljoona 11 'Mekrijärvi', Erillinen Pataljoona 14 'Kuhmo', Erillinen Pataljoona 15 'Raate', Erillinen Pataljoona 16 'Piispajärvi', Erillinen Pataljoona 4 'Kaukopartio', Erillinen Pataljoona 6 'Inkeri' | - | - |

Unchanged: INF_01, CAV_01, MOT_01, MOT_02, ARM_01, ARM_02, MEC_01, MEC_02, GAR_01, GAR_02, PEN_01, MAR_01, CST_01, PAR_01, SVFK_01, SVFK_02, MIL_01, INF_02, MIL_02, INF_04, GUA_01
<!-- END CHANGE TABLE -->
