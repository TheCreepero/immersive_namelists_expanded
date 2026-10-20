# Poland (POL) Namelist Audit - 2026-10-20

Status: DONE

File: `common/units/names_divisions/zz_INEX_POL_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit POL`)
- AUDIT SUMMARY POL: GROUPS=34 AUTHORED=258/462 FLAGS=34
- [POL_GA_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_AA_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, NAME_LONG
- [POL_AA_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_MOT_02] flags: LOW_DEPTH
- [POL_ARM_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_INF_01] flags: PLACEHOLDER_ENTRIES
- [POL_PSZ_01] flags: LOW_DEPTH
- [POL_PSZ_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_PSZ_03] flags: LOW_DEPTH
- [POL_LWP_01] flags: LOW_DEPTH
- [POL_LWP_02] flags: LOW_DEPTH
- [POL_LWP_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_AWL_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_LWP_00] flags: PLACEHOLDER_ENTRIES
- [POL_LWZ_00] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_LDP_00] flags: LOW_DEPTH
- [POL_OTH_01] flags: LOW_DEPTH
- [POL_MEC_01] flags: LOW_DEPTH
- [POL_PAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_PAR_02] flags: LOW_DEPTH
- [POL_GAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [POL_GAR_02] flags: LOW_DEPTH
- [POL_GAR_03] flags: LOW_DEPTH
- Found on manual review:
  - Key/number mismatch (no lint; backlog entry added 2026-10-20): `POL_AK_01`, `POL_LWP_00`, `POL_LWZ_00`, `POL_PSZ_02`, `POL_PSZ_03`, `POL_LDP_00` and `POL_AWL_03` are keyed 1..N while their names carry other numbers, so the fallback later repeats a number already shown (`POL_AK_01` key 11 = "21 Dywizja Piechoty AK", key 21 falls back to the same text). `POL_LWZ_00` also holds two names for numbers 2, 4, 8, 12, 15, 26 and 28.
  - Wrong fallbacks: `POL_LWP_02` (cavalry) and `POL_LWP_03` (anti-air) fall back to `%d Dywizja Piechoty (LWP)`; `POL_LDP_00` (armor) to `%d Ludowa Dywizja Zmechanizowana`. English abbreviations in Polish fallbacks: `(USSR)` in `POL_PSZ_02`, `(P2C)` in `POL_PSZ_03`.
  - Wrong types: `POL_LWP_03` "LWP Anti-Air Divisions" is typed `artillery` and holds two artillery names that are also in `POL_AWL_03`; `POL_LDP_00` covers `light_armor` only.
  - Selectors `Gwardia Ludowa Divisions` / `Gwardia Ludowa Cavalry` (`POL_LWP_01`, `POL_LWP_02`) name the GL partisans, but the groups hold regular LWP divisions.
  - `POL_PSZ_02` "4 Dywizja Strzelców" is not attested for Anders' Army (research).
  - `POL_LWP_00` key 1 `im.Tadeusza` lacks a space.
  - `POL_MOT_02` key 101 "Warszawska Dywizja Pancerno-Motorowa" extrapolates the real 1939 Warszawska Brygada Pancerno-Motorowa.
  - `POL_AK_01` "27 Wołyńska Dywizja Piechoty" lacks the "AK" that the Workshop text and the rest of the group use.

## User decisions
- 2026-10-20, request: audit POL and add a moderate expansion of 4 to 6 names.
- 2026-10-20, checkpoint: whole report approved, no item dropped. `POL_LWZ_00` keeps the PRL-era name for each clashing number (4 Lubuska is dropped, not moved). "11 Lubuska Dywizja Kawalerii Pancernej" moves to `POL_ARM_01` key 11.

## Research
- Run 1: `inex-audit-researcher`, 24/25 web calls, 5 topics (AK divisions, LWP artillery/AA, LWP cavalry and armor, PRL mechanized numbers, PSZ/1939). About 17 verified, 17 unverified.
- Run 2: `inex-audit-researcher`, 9/12 web calls, 6 items left unverified by run 1; all resolved.
- Sources: pl.wikipedia unit articles; "Dywizje polskie"; "Struktura organizacyjna Wojska Polskiego wiosną 1945"; "Jednostki przeciwlotnicze Wojska Polskiego"; "Polskie Siły Zbrojne w ZSRR (1941–1942)"; przystanekhistoria.pl (Śląsk w Burzy).

## Rationale
- **Re-keying (Critical).** Every re-keyed group is an INEX-only tag (no vanilla group of that name, so no vanilla names stay at the old keys [NAM-020]). Each entry moves to the key of the number it carries; an unnumbered or clashing identity goes to key 101+. Players' saved templates keep the tag; only new divisions draw the new keys.
- **`POL_LWZ_00` one name per number.** For each number the PRL-era name stays, since the group is gated to communism: 2 Warszawska (1955-89; "2 Pomorska" era unverified), 4 Pomorska im. Jana Kilińskiego (4 Lubuska is 1990-2001), 8 Drezdeńska (8 Bałtycka DOW is 1993 and already in `POL_MAR_01`), 12 Szczecińska and 15 Warmińsko-Mazurska (over the plain forms), 26/28 Rezerwowa (consistent with 30-32 Rezerwowa; "Zapasowa" unverified). 7 duplicate entries are dropped.
- **`POL_LWP_00`.** "1 Szkolna Dywizja Piechoty" (verified, spring 1945) shares number 1 with 1 Warszawska and moves to key 101.
- **`POL_LDP_00`.** Fallback `%d Ludowa Dywizja Pancerna`, all four armor types. The patron "im. gen. Aleksandra Waszkiewicza" on 5 Saska is unverified and dropped. "11 Lubuska Dywizja Kawalerii Pancernej" (Third Republic, verified) clashes with 11 Drezdeńska here and moves to the ungated `POL_ARM_01` key 11, in place of "11 Drezdeńska Dywizja Pancerna", which stays in `POL_LDP_00`.
- **`POL_LWP_03`.** Typed `anti_air`, fallback `%d Dywizja Artylerii Przeciwlotniczej`. Holds the three verified 1944-45 AA divisions; "3" becomes "3 Łużycka Dywizja Artylerii Przeciwlotniczej". The two artillery names leave (they stay in `POL_AWL_03`).
- **Fallbacks** in Polish: `%d Dywizja Kawalerii (LWP)`, `%d Dywizja Piechoty (PSZ w ZSRR)`, `%d Dywizja Piechoty (2 Korpus Polski)`.
- **Selectors**: `POL_LWP_01` "LWP Infantry Divisions", `POL_LWP_02` "LWP Cavalry Divisions".
- **Kept as researched, not changed**: 22 DP AK stays plain (its honorific is „Jarosławska”, not "Górska"); 30 DP AK stays plain ("Poleska" is not official).
- **Expansion (6 new names, all verified)**: `POL_LWP_02` 1 Warszawska Samodzielna Brygada Kawalerii; `POL_AK_01` 23 Dywizja Piechoty AK; `POL_PSZ_01` 1 Samodzielna Brygada Strzelców; `POL_PSZ_03` 14 Wielkopolska Brygada Pancerna; `POL_CAV_01` Brygada Kawalerii „Plis”; `POL_MOT_02` Warszawska Brygada Pancerno-Motorowa (replaces the extrapolated division).

## Verified formations & commanders
- AK: 2 DP Leg. AK „Pogoń”, 3 DP Leg. AK, 22 DP AK („Jarosławska”), 23 DP AK (Okręg Śląski), 27 Wołyńska DP AK, 30 DP AK („Twierdza”) (pl.wikipedia, przystanekhistoria.pl). Other AK divisions: 2026-10-01 audit.
- LWP AA: 1 DAPlot (Sumy, 1 AWP), 3 Łużycka DAPlot (2 AWP), 4 DAPlot (Grabianów, NDWP reserve) (pl.wikipedia: Jednostki przeciwlotnicze WP). Artillery: 2 Łużycka Dywizja Artylerii (2 AWP, May 1945).
- LWP: 1 Warszawska Samodzielna Brygada Kawalerii, 1 Szkolna Dywizja Piechoty (Struktura WP wiosną 1945). 11 Lubuska Dywizja Kawalerii Pancernej (pl/en.wikipedia). 2 Warszawska DZ (1955-89), 4 Pomorska DZ im. Jana Kilińskiego, 4 Lubuska DZ (1990-2001), 8 Drezdeńska DZ, 8 Bałtycka DOW (1993).
- PSZ: 5 Wileńska, 6 Lwowska, 7-10 DP (Anders, PSZ w ZSRR article); 1 Samodzielna Brygada Strzelców (renamed 9 May 1942 from 1 Brygada Strzelców); 14 Wielkopolska Brygada Pancerna (renamed 8 Mar 1945).
- 1939: Warszawska Brygada Pancerno-Motorowa (płk dypl. Stefan Rowecki); Brygada Kawalerii „Plis” (płk Kazimierz Plisowski, formed 20 Sep 1939 at Białowieża).
- Every other kept entry: 2026-10-01 audit, "Verified formations & commanders".

## Author confirmation
- `POL_AWL_03`: 1 Dywizja Artylerii; 6 and 8 Dywizja Artylerii Przełamania; 5 and 10 Dywizja Artylerii Armat (titles listed on pl.wikipedia "Dywizje polskie", details unchecked). Kept as they are, only re-keyed.
- `POL_LWP_02` / `POL_OTH_01`: 1 Warszawska Dywizja Kawalerii (title exists; not in the 1944-45 LWP). Kept.
- `POL_LWZ_00`: 26, 28, 30, 31, 32 Rezerwowa Dywizja Zmechanizowana (titles listed, eras unchecked). Kept.

## Kept on judgment
Expected after the batch: only `LOW_DEPTH`, `PLACEHOLDER_ENTRIES` and `NAME_LONG`, on groups listed in the initial report (the count of each may fall, never rise), plus `POL_AK_01`, which may gain `PLACEHOLDER_ENTRIES` or `LOW_DEPTH` from the re-keying. Reasons:
- `LOW_DEPTH` / `PLACEHOLDER_ENTRIES`: small specialist and exile lists, kept short where history is short (2026-10-01 audit; R5). The re-keyed groups now leave gaps that the fallback fills, by design.
- `NAME_LONG` on `POL_AA_01`: official patron name (2026-10-01 audit).
- `POL_MOT_02` repeats 8 identities of `POL_MOT_01`: both link to `POL_INF_01`, so a number is drawn only once and no name shows twice.
- `Vanilla: leaves out N numbered key(s) past a gap` on `POL_INF_01`, `POL_MOT_01`, `POL_MEC_01`: kept stubs (2026-10-17 audit). No `vanilla name(s)` line may appear.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames POL -Batch docs/superpowers/plans/2026-10-20-poland-audit.md`. Expect one green line for each of the 14 groups in the batch (POL_AK_01, POL_LWP_00, POL_LWP_01, POL_LWZ_00, POL_PSZ_01, POL_PSZ_02, POL_PSZ_03, POL_LDP_00, POL_ARM_01, POL_AWL_03, POL_LWP_03, POL_LWP_02, POL_CAV_01, POL_MOT_02) and no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki POL`, then make the edits listed under "Docs payload".
- [x] 3. `powershell -File .\build.ps1 -Check POL`. Expect `Check passed`; remaining flags must match "Kept on judgment". Then `powershell -File .\build.ps1 -Audit POL | Select-String 'vanilla name'`: expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 5. (Shipped 2026-10-20 in one commit with `2026-10-20-poland-namelist.md`, on the user's word: both plans changed the namelist file before either was committed. The change table below therefore covers both plans.) Ship, on the user's word: commit with the message `Audit POL namelists: fix key numbering and fallbacks, add six historical names`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit POL namelists: fix key numbering and fallbacks, add six historical names"`.

## Docs payload
Edit each line with Edit: copy the current text exactly, replace it with the new text. Wiki group tables are left to `-SyncWiki`. README: no change.

1. `wiki/Poland.md`, the `POL_PSZ_03` paragraph.
   Current: `General Władysław Anders' 2nd Polish Corps (*2 Korpus Polski*) in the Italian Campaign: 3rd Carpathian Rifle Division (*3 Dywizja Strzelców Karpackich* at Monte Cassino), 5th Kresowa Infantry Division, and 2nd Warsaw Armoured Brigade. Gated to democratic/neutral governments.`
   New: `General Władysław Anders' 2nd Polish Corps (*2 Korpus Polski*) in the Italian Campaign: 3rd Carpathian Rifle Division (*3 Dywizja Strzelców Karpackich* at Monte Cassino), 5th Kresowa Infantry Division, 2nd Warsaw Armoured Brigade, and the 14th Wielkopolska Armoured Brigade of 1945. Gated to democratic/neutral governments.`
2. `wiki/Poland.md`, heading.
   Current: `### `POL_LWP_00` to `POL_LWP_03` / `POL_AWL_03` / `POL_LWZ_00` / `POL_LDP_00` / `POL_OTH_01` — LWP & Gwardia Ludowa`
   New: `### `POL_LWP_00` to `POL_LWP_03` / `POL_AWL_03` / `POL_LWZ_00` / `POL_LDP_00` / `POL_OTH_01` — Ludowe Wojsko Polskie`
3. `wiki/Poland.md`, the paragraph under that heading.
   Current: `Soviet-equipped *Ludowe Wojsko Polskie* (LWP) and underground *Gwardia Ludowa* (GL) / *Armia Ludowa* (AL) formations: 1st 'Tadeusz Kościuszko' Infantry Division, 2nd 'Henryk Dąbrowski', Sudecka and Drezdeńska mechanized and armored divisions, and artillery divisions. Gated to communist governments.`
   New: `The Soviet-equipped *Ludowe Wojsko Polskie* (LWP) and its post-war successors: 1st 'Tadeusz Kościuszko' Infantry Division, 2nd 'Henryk Dąbrowski', the 1st Warsaw Independent Cavalry Brigade, Sudecka and Drezdeńska mechanized and armored divisions, and artillery and anti-aircraft divisions. Gated to communist governments.`
4. `wiki/Poland.md`, the `POL_AK_01` paragraph: replace `Features the 20 historical division designations` with `Features 21 historical division designations`.
5. `WORKSHOP_DESCRIPTION_GUIDELINES.md`, the Poland table row: replace `Communist LWP & GL, Nationalist NSZ)` with `Communist LWP, Nationalist NSZ)`.
6. `WORKSHOP_DESCRIPTION_GUIDELINES.md`, the third bullet under `[b]Poland[/b]`: replace `Communist LWP & GL ([i]1 Warszawska` with `Communist LWP ([i]1 Warszawska`.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (6 new authored names, below the proofreader threshold of 25; every other entry is an existing name re-keyed or respelled):
- Each of the 6 new names is in "Verified formations & commanders" with its source: passed.
- No extrapolated name is added; the batch removes one ("Warszawska Dywizja Pancerno-Motorowa"): passed.
- Every re-keyed entry's leading number equals its key; keys 101+ hold unnumbered or clashing identities: passed.
- Respellings: "im. Tadeusza" (space), "27 Wołyńska Dywizja Piechoty AK", "3 Łużycka Dywizja Artylerii Przeciwlotniczej" (research), the "5 Saska Dywizja Pancerna" patron dropped (unverified).

## Outcome
Date: 2026-10-20.

-Check POL: `Validate: OK`, `Tests: 435 Passed, 0 Failed, 0 Skipped`, `AUDIT SUMMARY POL: GROUPS=34 AUTHORED=257/456 FLAGS=34`, `Flags: LOW_DEPTH x21, PLACEHOLDER_ENTRIES x12, NAME_LONG x1` (all listed under "Kept on judgment"), `Diff vs HEAD: 13 group(s) changed, +11 -17 name(s)`, `Check passed`. `-Audit POL | Select-String 'vanilla name'` printed nothing.

Deviations from this plan: none.

## Edit batch
Applied by `build.ps1 -EditNames POL -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "AK_01", "removeAll": true, "add": [
  "2=2 Dywizja Piechoty Legionów AK „Pogoń”",
  "3=3 Dywizja Piechoty Legionów AK",
  "5=5 Dywizja Piechoty AK „Dzieci Lwowskich”",
  "6=6 Dywizja Piechoty AK Ziemi Krakowskiej „Odwet”",
  "7=7 Dywizja Piechoty AK „Orzeł”",
  "8=8 Dywizja Piechoty AK im. Romualda Traugutta",
  "9=9 Podlaska Dywizja Piechoty AK",
  "10=10 Dywizja Piechoty AK im. Macieja Rataja",
  "11=11 Karpacka Dywizja Piechoty AK",
  "12=12 Dywizja Piechoty AK",
  "21=21 Dywizja Piechoty AK",
  "22=22 Dywizja Piechoty AK",
  "23=23 Dywizja Piechoty AK",
  "24=24 Dywizja Piechoty AK",
  "25=25 Dywizja Piechoty AK",
  "26=26 Dywizja Piechoty AK",
  "27=27 Wołyńska Dywizja Piechoty AK",
  "28=28 Dywizja Piechoty AK im. Stefana Okrzei",
  "29=29 Dywizja Piechoty AK",
  "30=30 Dywizja Piechoty AK",
  "106=106 Dywizja Piechoty AK"
] }
```

```json batch
{ "group": "LWP_00", "removeAll": true, "add": [
  "1=1 Warszawska Dywizja Piechoty im. Tadeusza Kościuszki",
  "2=2 Warszawska Dywizja Piechoty im. Henryka Dąbrowskiego",
  "3=3 Pomorska Dywizja Piechoty im. Romualda Traugutta",
  "4=4 Pomorska Dywizja Piechoty im. Jana Kilińskiego",
  "5=5 Saska Dywizja Piechoty",
  "6=6 Pomorska Dywizja Piechoty",
  "7=7 Łużycka Dywizja Piechoty",
  "8=8 Drezdeńska Dywizja Piechoty",
  "9=9 Drezdeńska Dywizja Piechoty",
  "10=10 Sudecka Dywizja Piechoty",
  "11=11 Dywizja Piechoty",
  "12=12 Dywizja Piechoty",
  "13=13 Dywizja Piechoty",
  "14=14 Dywizja Piechoty",
  "15=15 Dywizja Piechoty",
  "16=16 Kaszubska Dywizja Piechoty",
  "18=18 Dywizja Piechoty",
  "21=21 Dywizja Piechoty",
  "22=22 Dywizja Piechoty",
  "23=23 Dywizja Piechoty",
  "24=24 Dywizja Piechoty",
  "25=25 Dywizja Piechoty",
  "27=27 Dywizja Piechoty",
  "29=29 Dywizja Piechoty",
  "30=30 Dywizja Piechoty",
  "34=34 Dywizja Piechoty czasu „W”",
  "37=37 Dywizja Piechoty czasu „W”",
  "40=40 Dywizja Piechoty czasu „W”",
  "101=1 Szkolna Dywizja Piechoty"
] }
```

```json batch
{ "group": "LWP_01", "selector": "LWP Infantry Divisions" }
```

```json batch
{ "group": "LWZ_00", "removeAll": true, "add": [
  "1=1 Warszawska Dywizja Zmechanizowana",
  "2=2 Warszawska Dywizja Zmechanizowana",
  "3=3 Pomorska Dywizja Zmechanizowana",
  "4=4 Pomorska Dywizja Zmechanizowana im. Jana Kilińskiego",
  "5=5 Kresowa Dywizja Zmechanizowana",
  "8=8 Drezdeńska Dywizja Zmechanizowana",
  "9=9 Drezdeńska Dywizja Zmechanizowana",
  "10=10 Sudecka Dywizja Zmechanizowana",
  "11=11 Dywizja Zmechanizowana",
  "12=12 Szczecińska Dywizja Zmechanizowana",
  "15=15 Warmińsko-Mazurska Dywizja Zmechanizowana",
  "16=16 Pomorska Dywizja Zmechanizowana",
  "19=19 Dywizja Zmechanizowana",
  "20=20 Dywizja Zmechanizowana",
  "26=26 Rezerwowa Dywizja Zmechanizowana",
  "28=28 Rezerwowa Dywizja Zmechanizowana",
  "30=30 Rezerwowa Dywizja Zmechanizowana",
  "31=31 Rezerwowa Dywizja Zmechanizowana",
  "32=32 Rezerwowa Dywizja Zmechanizowana"
] }
```

```json batch
{ "group": "PSZ_01", "add": ["101=1 Samodzielna Brygada Strzelców"] }
```

```json batch
{ "group": "PSZ_02", "fallback": "%d Dywizja Piechoty (PSZ w ZSRR)", "removeAll": true, "add": [
  "5=5 Wileńska Dywizja Piechoty",
  "6=6 Lwowska Dywizja Piechoty",
  "7=7 Dywizja Piechoty",
  "8=8 Dywizja Piechoty",
  "9=9 Dywizja Piechoty",
  "10=10 Dywizja Piechoty"
] }
```

```json batch
{ "group": "PSZ_03", "fallback": "%d Dywizja Piechoty (2 Korpus Polski)", "removeAll": true, "add": [
  "2=2 Warszawska Brygada Pancerna",
  "3=3 Dywizja Strzelców Karpackich",
  "5=5 Kresowa Dywizja Piechoty",
  "14=14 Wielkopolska Brygada Pancerna"
] }
```

```json batch
{ "group": "LDP_00", "fallback": "%d Ludowa Dywizja Pancerna", "addType": ["medium_armor", "heavy_armor", "modern_armor"], "removeAll": true, "add": [
  "5=5 Saska Dywizja Pancerna",
  "10=10 Sudecka Dywizja Pancerna",
  "11=11 Drezdeńska Dywizja Pancerna",
  "16=16 Kaszubska Dywizja Pancerna",
  "19=19 Dywizja Pancerna",
  "20=20 Dywizja Pancerna"
] }
```

```json batch
{ "group": "ARM_01", "set": ["11=11 Lubuska Dywizja Kawalerii Pancernej"] }
```

```json batch
{ "group": "AWL_03", "removeAll": true, "add": [
  "1=1 Dywizja Artylerii",
  "2=2 Łużycka Dywizja Artylerii",
  "5=5 Dywizja Artylerii Armat",
  "6=6 Dywizja Artylerii Przełamania",
  "8=8 Dywizja Artylerii Przełamania",
  "10=10 Dywizja Artylerii Armat"
] }
```

```json batch
{ "group": "LWP_03", "fallback": "%d Dywizja Artylerii Przeciwlotniczej", "addType": ["anti_air"], "removeType": ["artillery"], "removeAll": true, "add": [
  "1=1 Dywizja Artylerii Przeciwlotniczej",
  "3=3 Łużycka Dywizja Artylerii Przeciwlotniczej",
  "4=4 Dywizja Artylerii Przeciwlotniczej"
] }
```

```json batch
{ "group": "LWP_02", "selector": "LWP Cavalry Divisions", "fallback": "%d Dywizja Kawalerii (LWP)", "add": ["101=1 Warszawska Samodzielna Brygada Kawalerii"] }
```

```json batch
{ "group": "CAV_01", "add": ["136=Brygada Kawalerii „Plis”"] }
```

```json batch
{ "group": "MOT_02", "set": ["101=Warszawska Brygada Pancerno-Motorowa"] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| MOT_02 | 9 -> 9 | Warszawska Brygada Pancerno-Motorowa | Warszawska Dywizja Pancerno-Motorowa | - |
| ARM_01 | 19 -> 19 | 11 Lubuska Dywizja Kawalerii Pancernej (from LDP_00) | 11 Drezdeńska Dywizja Pancerna | - |
| PSZ_01 | 6 -> 7 | 1 Samodzielna Brygada Strzelców | - | - |
| PSZ_02 | 7 -> 6 | - | 4 Dywizja Strzelców | fallback: '%d Dywizja Piechoty (USSR)' -> '%d Dywizja Piechoty (PSZ w ZSRR)' |
| PSZ_03 | 3 -> 4 | 14 Wielkopolska Brygada Pancerna | - | fallback: '%d Dywizja Piechoty (P2C)' -> '%d Dywizja Piechoty (2 Korpus Polski)' |
| LWP_01 | 14 -> 14 | - | - | selector: 'Gwardia Ludowa Divisions' -> 'LWP Infantry Divisions' |
| LWP_02 | 1 -> 2 | 1 Warszawska Samodzielna Brygada Kawalerii | - | selector: 'Gwardia Ludowa Cavalry' -> 'LWP Cavalry Divisions'; fallback: '%d Dywizja Piechoty (LWP)' -> '%d Dywizja Kawalerii (LWP)' |
| LWP_03 | 5 -> 3 | 3 Łużycka Dywizja Artylerii Przeciwlotniczej | 2 Łużycka Dywizja Artylerii, 3 Dywizja Artylerii Przeciwlotniczej, 5 Dywizja Artylerii | division_types: [artillery] -> [anti_air]; fallback: '%d Dywizja Piechoty (LWP)' -> '%d Dywizja Artylerii Przeciwlotniczej' |
| LWP_00 | 29 -> 29 | 1 Warszawska Dywizja Piechoty im. Tadeusza Kościuszki | 1 Warszawska Dywizja Piechoty im.Tadeusza Kościuszki | - |
| LWZ_00 | 26 -> 19 | - | 2 Pomorska Dywizja Zmechanizowana, 4 Lubuska Dywizja Zmechanizowana, 8 Bałtycka Dywizja Obrony Wybrzeża, 12 Dywizja Zmechanizowana, 15 Dywizja Zmechanizowana, 26 Zapasowa Dywizja Zmechanizowana, 28 Zapasowa Dywizja Zmechanizowana | - |
| LDP_00 | 7 -> 6 | 5 Saska Dywizja Pancerna | 5 Saska Dywizja Pancerna im. gen. Aleksandra Waszkiewicza, 11 Lubuska Dywizja Kawalerii Pancernej (to ARM_01) | division_types: [light_armor] -> [light_armor medium_armor heavy_armor modern_armor]; fallback: '%d Ludowa Dywizja Zmechanizowana' -> '%d Ludowa Dywizja Pancerna' |
| AK_01 | 20 -> 21 | 23 Dywizja Piechoty AK, 27 Wołyńska Dywizja Piechoty AK | 27 Wołyńska Dywizja Piechoty | - |
| CAV_01 | 30 -> 31 | Brygada Kawalerii „Plis” | - | - |
| VOL_01 | new, 25 | 1 Dywizja Strzelców Polskich, 2 Dywizja Strzelców Polskich, 3 Dywizja Strzelców Polskich, 4 Dywizja Strzelców Polskich, 5 Dywizja Strzelców Polskich „Syberyjska”, 6 Dywizja Strzelców Polskich, 7 Dywizja Strzelców Polskich, Dywizja Ochotnicza, Dywizja Instrukcyjna, I Brygada Legionów Polskich, II Brygada Legionów Polskich „Karpacka”, III Brygada Legionów Polskich, Polski Korpus Posiłkowy, Legion Wschodni, Legion Zachodni, Legion Puławski, Bajończycy, 1 Dywizja Ułanów, 1 Pułk Ułanów Legionów Polskich, 1 Pułk Czołgów, Ochotnicza Dywizja Strzelców, Zmotoryzowana Dywizja Ochotnicza, 201 Ochotniczy Pułk Piechoty, 202 Ochotniczy Pułk Piechoty, 205 Ochotniczy Pułk Piechoty | - | - |
| VOL_02 | new, 18 | XIII Brygada Międzynarodowa im. Jarosława Dąbrowskiego, 150 Brygada Międzynarodowa, Batalion im. Jarosława Dąbrowskiego, Batalion im. Adama Mickiewicza, Batalion Palafox, Kompania im. Naftalego Botwina, Kompania im. Tarasa Szewczenki, Kompania im. Ludwika Waryńskiego, Dywizja Dąbrowszczaków, Dywizja Ochotnicza im. Jarosława Dąbrowskiego, Dywizja Ochotnicza im. Ludwika Waryńskiego, Dywizja Ochotnicza im. Adama Mickiewicza, Dywizja Ochotnicza im. Karola Świerczewskiego, Dywizja Ochotnicza im. Naftalego Botwina, Dywizja Ochotnicza im. Tarasa Szewczenki, Dywizja Ochotnicza im. Róży Luksemburg, Dywizja Ochotnicza im. Juliana Marchlewskiego, Brygada „Za Wolność Naszą i Waszą” | - | - |
| FORT_01 | new, 22 | Rejon Umocniony Hel, Ośrodek Oporu Jastarnia, Obszar Warowny „Śląsk”, Odcinek „Mikołów”, Grupa Bojowa „Wesoła”, Grupa Bojowa „Brzeziny”, Grupa Bojowa „Wirek”, Odcinek Umocniony Wizna, Pododcinek „Giełczyn”, Rejon Umocniony Sarny, Batalion Forteczny KOP „Sarny”, Dowództwo Obrony Warszawy, Twierdza Modlin, Obrona Lwowa, Orlęta Lwowskie, Twierdza Brześć, Twierdza Przemyśl, Twierdza Dęblin, Twierdza Grudziądz, Twierdza Osowiec, Batalion Forteczny „Hel”, Batalion Forteczny „Mława” | - | - |
| GUA_01 | new, 23 | Gwardia Piesza Koronna, Regiment Gwardii Konnej Koronnej, Oddział Gwardii Królewskiej, 17 Pułk Ułanów Wielkopolskich im. Króla Bolesława Chrobrego, 20 Pułk Ułanów im. Króla Jana III Sobieskiego, 27 Pułk Ułanów im. Króla Stefana Batorego, 81 Pułk Strzelców Grodzieńskich im. Króla Stefana Batorego, 1 Pułk Pancerny im. Króla Bolesława Chrobrego, Dywizja Gwardii Pieszej Koronnej, Dywizja Grenadierów Gwardii, Dywizja Piechoty Gwardii im. Króla Jana III Sobieskiego, Dywizja Piechoty Gwardii im. Króla Bolesława Chrobrego, Dywizja Piechoty Gwardii im. Króla Stefana Batorego, Dywizja Piechoty Gwardii im. Króla Kazimierza Wielkiego, Dywizja Piechoty Gwardii im. Króla Władysława Jagiełły, Dywizja Piechoty Gwardii im. Królowej Jadwigi, Dywizja Gwardii Konnej Koronnej, Dywizja Husarii im. Króla Jana III Sobieskiego, Dywizja Kawalerii Gwardii im. Króla Zygmunta Augusta, Dywizja Szwoleżerów Gwardii, Dywizja Pancerna Gwardii Królewskiej, Dywizja Pancerna Gwardii im. Króla Władysława IV Wazy, Pancerna Dywizja Husarska | - | - |
| POW_01 | new, 25 | 1 Pułk Strzelców Wielkopolskich, 2 Pułk Strzelców Wielkopolskich, 3 Pułk Strzelców Wielkopolskich, 1 Dywizja Strzelców Wielkopolskich, 2 Dywizja Strzelców Wielkopolskich, 3 Dywizja Strzelców Wielkopolskich, Armia Wielkopolska, Front Wielkopolski, Grupa „Leszno”, Toruński Pułk Strzelców, Kaszubski Pułk Strzelców, I Brygada Jazdy Wielkopolskiej, Grupa „Wschód”, Grupa „Południe”, Grupa „Północ”, Grupa „Środek”, Samodzielny Oddział Szturmowy, Grupa Destrukcyjna Wawelberga, Polska Organizacja Wojskowa Górnego Śląska, Katowicki Pułk Powstańców, Zabrski Pułk Powstańców, Rybnicki Pułk Powstańców, Tarnogórski Pułk Powstańców, Pszczyński Pułk Powstańców, Polska Organizacja Wojskowa | - | - |

Unchanged: GA_01, AA_01, AA_02, POLIC_01, ON_01, ARM_BRIGADE_01, INF_01, AWL_03, OTH_01, INF_RESERVE_01, CAV_DIVISION_01, MOT_01, MEC_01, PAR_01, PAR_02, MAR_01, MNT_01, GAR_01, GAR_02, GAR_03, BSKRZ_01
<!-- END CHANGE TABLE -->
