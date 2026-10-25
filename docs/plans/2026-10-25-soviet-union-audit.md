# Soviet Union (SOV) Namelist Audit - 2026-10-25

Status: READY

File: `common/units/names_divisions/zz_INEX_SOV_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit SOV`)
- AUDIT SUMMARY SOV: GROUPS=28 AUTHORED=373/1706 FLAGS=40
- [SOV_INF_01] flags: PLACEHOLDER_ENTRIES
- [SOV_CAV_01] flags: PLACEHOLDER_ENTRIES
- [SOV_MOT_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_MEC_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, NAME_LONG
- [SOV_MEC_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, UNLINKED_MOBILE
- [SOV_ARM_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_ARM_02] flags: PLACEHOLDER_ENTRIES
- [SOV_ARM_04] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_PAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_MAR_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_MNT_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_GAR_01] flags: PLACEHOLDER_ENTRIES, NAME_LONG
- [SOV_GRD_01] flags: PLACEHOLDER_ENTRIES, NAME_LONG
- [SOV_NAT_01] flags: PLACEHOLDER_ENTRIES, NAME_LONG
- [SOV_GMC_01] flags: LOW_DEPTH, NAME_LONG
- [SOV_GTC_01] flags: LOW_DEPTH
- [SOV_CAV_02] flags: PLACEHOLDER_ENTRIES, NAME_LONG
- [SOV_PEN_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_NKVD_01] flags: LOW_DEPTH
- [SOV_AIR_01] flags: PLACEHOLDER_ENTRIES, NAME_LONG
- [SOV_ART_01] flags: NAME_LONG
- [SOV_IMP_01] flags: NAME_LONG
- Found on manual review: `SOV_CAV_01` 14 'Bessarabskaya' is wrong (the Bessarabian division was the 3rd; the 14th was *imeni Parkhomenko*); `SOV_CAV_02` 311/312 are Don Cossack divisions of the 5th Guards Don corps, but the section header says 4th Guards Cossack Cavalry Corps and the entries omit *Donskaya*; `SOV_ARM_02` holds honorifics on the vanilla tag with no plain variant (R10).

## User decisions
Policy answers before research (2026-10-25):
- Scope: depth pass with verified honorifics on Guards Rifle (`SOV_GRD_01`), Rifle Divisions (`SOV_INF_01`), armour (`SOV_ARM_01`, `SOV_ARM_02`, `SOV_GTC_01`) and cavalry, mountain and motor rifle (`SOV_CAV_01`, `SOV_CAV_02`, `SOV_MNT_01`, `SOV_MOT_01`). ROADMAP item 4.
- Honorific policy carried over from the 2026-10-15 audit: a real division number gets an honorific only when research verifies it; vanilla's own honorifics count as sourced; invented titles only on numbers that never existed, named as extrapolated.
- Tank divisions: `SOV_ARM_01` stays plain; a new "Tank Divisions (Named)" tag linked to `SOV_ARM_01` holds the honorifics (R10).
- Tank corps: split (R10). `SOV_ARM_02` becomes plain; its honorifics and any new ones move to a new "Tank Corps (Named)" tag linked to `SOV_ARM_02`.
- Research: one `inex-audit-researcher` per area in parallel (up to three), then a small follow-up for what stays unverified.

Checkpoint answer (2026-10-25): the audit report is approved as presented, including every "Author confirmation" entry.

## Research
Perechni No. 3-5 (the official wartime lists) were unreachable in every run (404, web.archive.org blocked). Findings are in `scratch/sov_research_*.md`.
- `inex-audit-researcher`, Guards rifle (22 web calls): ru.wikipedia "Список стрелковых, горнострелковых, мотострелковых, моторизованных и воздушно-десантных дивизий РККА, дивизий НКВД (1941—1945)", Guards entries; navbox "Гвардейские стрелковые дивизии РККА в годы ВОВ"; per-division articles for 15, 29, 75, 77, 118, 122.
- `inex-audit-researcher`, rifle, mountain and motor rifle (25 web calls): the same list via the dic.academic.ru mirror (ruwiki/1595987), end-of-war title per number, keys 11-248. Mountain and motorized sections print bare numbers only.
- `inex-audit-researcher`, follow-up rifle 250-474 (10 web calls): same mirror, readable to 422; 250-292 quoted verbatim, 293-417 from a summarised extraction with the "no honorific" entries re-quoted verbatim.
- `inex-audit-researcher`, armour and cavalry (25 web calls): ru.wikipedia "Танковый корпус (СССР)" (1945 roster), "Танковая дивизия РККА" (NKO Order No. 0013, 10 June 1945), "4-й гвардейский кавалерийский корпус", "5-й гвардейский кавалерийский корпус", "Кавалерийская дивизия РККА"; ruwiki.ru "5-я гвардейская кавалерийская дивизия" (snippet); aukedevlieger.nl (weak secondary, not used alone).

## Rationale
Depth pass (ROADMAP item 4): end-of-war city and battle honorifics on the plain historical numbers, from one list source per arm. Orders (*Krasnoznamennaya*, *ordena Suvorova*) are left out, as in the rest of the file. Russian is romanised in the file's style (*Kiyevskaya*, *Yelninskaya*, *Rogachevskaya*: е after a vowel or word-initially as *ye*, ё as *e*, soft sign dropped) by one script, so the spelling is uniform. A double honorific stays one compound inside the quotes (*'Dalnevostochnaya Novgorod-Severskaya'*), like vanilla's *'Moskovskaya Proletarskaya'*.
- `SOV_INF_01`: 242 plain keys get the title of the formation in service in May 1945 (September 1945 in the Far East), written in place with `"set"` (the group has one section). Keys 11-422 were covered. A number whose title carries only orders stays plain, as do 405, 407, 410, 412 and 418-474, which the source did not cover (several were short-lived formation numbers). 134 stays plain (the list's *Вердинская* could not be checked). 169 takes *Rogachevskaya* from its own article; the list's *Киевско-* prefix is unconfirmed.
- `SOV_GRD_01`: 74 plain keys get honorifics. The group is rewritten in key order (`"removeAll"` and `"add"`) so that the new honours do not sit in the section "Vanilla keys written again"; every other entry is carried over as it is now. 9, 46, 103, 104 and 106 held no city honorific and stay plain; 111-113, 115, 116 and 123-127 are unverified and stay plain. Plain keys still write over vanilla's merged stubs (2026-10-17 audit), which is what the new section header says.
- `SOV_CAV_01`: 14 *Bessarabskaya* -> *imeni Parkhomenko* (the 3rd held *Bessarabskaya*, *imeni Kotovskogo*); 30 *Novobugskaya* and 63 *Korsunskaya* (in the 4th and 5th Guards Cavalry Corps in May 1945); 5th Guards *Tannenbergskaya* (Order No. 023, 19 February 1945).
- `SOV_CAV_02`: the 11th and 12th Guards were Don Cossack divisions of the 5th Guards Don Cossack Cavalry Corps; they gain *Donskaya*, and the section header names both corps. The 9th and 10th Guards Kuban divisions held no city honorific, so their *'Kubanskaya'* stays.
- Tank corps (R10, user decision): `SOV_ARM_02` becomes the plain variant and writes `%d-y Tankovyy Korpus` over every vanilla key (vanilla's `%dya Tankovaya Korpus` would show otherwise). The 11 honorifics move unchanged to the new `SOV_ARM_05` "Tank Corps (Named)", linked to `SOV_ARM_02`. All 11 were reconfirmed against the 1945 roster; the 25th held none.
- Tank divisions (R10, user decision): new `SOV_ARM_06` "Tank Divisions (Named)", linked to `SOV_ARM_01`. NKO Order No. 0013 (10 June 1945) turned the tank corps into tank divisions with the same number, honorific, orders and banner, so the 11 honoured non-Guards corps become 11 honoured tank divisions in the feminine form. The 2nd and 3rd tank divisions came from rifle divisions and are left out. No 1941 tank division title was found. `SOV_ARM_01` gets a comment naming its twin.

## Verified formations & commanders
- Every honorific added to `SOV_INF_01` and `SOV_GRD_01`: ru.wikipedia list of rifle divisions 1941-1945 (title column), as listed per number in `scratch/sov_research_rifle.md` and `scratch/sov_research_guards.md`. Existing GRD keys 15, 29, 75, 77, 118 and 122 were reconfirmed by their own articles.
- `SOV_ARM_02`/`SOV_ARM_05` 1, 5, 9, 10, 11, 18, 19, 20, 23, 29, 31: ru.wikipedia "Танковый корпус (СССР)", 1945 roster. 8th Guards Tank Corps: no city honorific (same page), so `SOV_GTC_01` 8 stays plain.
- `SOV_ARM_06`: ru.wikipedia "Танковая дивизия РККА" (NKO Order No. 0013; April 1946 table: same numbers as the corps).
- `SOV_CAV_01` 14 *imeni Parkhomenko*, 3 *Bessarabskaya*: ru.wikipedia "Кавалерийская дивизия РККА". 30 *Novobugskaya*, 9th/10th Guards Kuban: ru.wikipedia "4-й гвардейский кавалерийский корпус". 63 *Korsunskaya*, 11th Guards Don *Volnovakhskaya*, 12th Guards Don *Korsunskaya*: ru.wikipedia "5-й гвардейский кавалерийский корпус". 13th Guards *Rovenskaya*: ruwiki.ru.
- Legacy entries not listed here were verified in the 2026-10-15 audit and are unchanged.

## Author confirmation
Included in the batch pending the user's word at the checkpoint:
- `SOV_GRD_01` 38 *Lozovskaya*: the list prints the same honorific for 35 and 38; both Guards divisions fought at Lozovaya in 1943, but one may be a list error.
- `SOV_GRD_01` 62 *Zvenigorodsko-Budapeshtskaya*: the list prints a typo (*Будапештстская*); the division's own article snippet gives only *Budapeshtskaya* (5 April 1945).
- `SOV_CAV_01` 305 *Tannenbergskaya*: one search snippet of the division's article, with the order number.
- `SOV_INF_01` 293-417: list-sourced but read through a summarised extraction (250-292 were quoted verbatim).

Not added (weak or out of category), named here so they are not re-researched: `SOV_CAV_01` 4 *imeni Voroshilova* Don Cossack (aukedevlieger.nl only), 11 *Gomelskaya* (navbox label, unchecked); `SOV_MNT_01` 138 *Karpatskaya*, 232, 302 *Tarnopolskaya* (later rifle-division titles, not mountain); 20 *Baranovichskaya*, 58, 79 (low confidence).

## Kept on judgment
After the batch `-Audit SOV` shows `GROUPS=30 AUTHORED=521/1728 FLAGS=38` (test-applied on a scratch copy of the repository). AUTHORED counts distinct texts, so an honorific that several divisions share (*Vitebskaya* on six rifle numbers) counts once (tooling backlog, Lints). Each remaining flag is expected:
- File `IDENTITY_REPEAT`: Soviet honorifics were given to many formations of different arms (2026-10-15 audit); the batch adds more shared identities of the same kind.
- `PLACEHOLDER_ENTRIES` (15): `SOV_INF_01`, `SOV_GRD_01` (numbers whose division held no honorific, or that the source did not cover); `SOV_CAV_01`, `SOV_MOT_01`, `SOV_MNT_01`, `SOV_MAR_02`, `SOV_MEC_02`, `SOV_NAT_01`, `SOV_AIR_01`, `SOV_CAV_02` (historical numbered keys, strict honorific policy); `SOV_MEC_01`, `SOV_ARM_04`, `SOV_PAR_01`, `SOV_GAR_01`, `SOV_PEN_01` (fallback text written over vanilla's merged stubs, 2026-10-17 audit). `SOV_ARM_01` and `SOV_ARM_02` drop the flag: they are now plain variants.
- `LOW_DEPTH` (11): `SOV_MOT_01`, `SOV_MEC_01`, `SOV_MEC_02`, `SOV_MNT_01`, `SOV_MAR_02`, `SOV_NKVD_01` (only verified honorifics); `SOV_ARM_04`, `SOV_PAR_01`, `SOV_PEN_01` (plain lists); `SOV_GMC_01`, `SOV_GTC_01` (complete orders of battle). `SOV_ARM_05` and `SOV_ARM_06` (11 each, the complete 1945 roster) are not flagged.
- `NAME_LONG` (10): the nine of the 2026-10-15 audit plus `SOV_INF_01`, whose double honorifics (*'Sredneaziatskaya Novgorod-Severskaya'*, *'Rostovsko-Tamanskaya Brandenburgskaya'*) are the official titles.
- `UNLINKED_MOBILE`: `SOV_MEC_02` (own series; 2026-10-15 audit).
- `-SyncWiki SOV` reports `no row in wiki table (add by hand): SOV_ARM_06, SOV_ARM_05`; the rows are in "Docs payload".

## Implementation steps
All commands run from the repository root.
- [ ] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames SOV -Batch docs/plans/2026-10-25-soviet-union-audit.md`. Expect these 8 lines and no `[ERROR]`:
  `Edited SOV_INF_01: +0 -0 ~242`, `Edited SOV_GRD_01: +129 -0 ~0 [RemoveAll]`, `Edited SOV_CAV_01: +0 -0 ~4`, `Edited SOV_CAV_02: +0 -0 ~2`, `Edited SOV_ARM_01: +0 -0 ~0 [Comment]`, `Added SOV_ARM_06: "Tank Divisions (Named)" ... 11 name(s), links SOV_ARM_01`, `Edited SOV_ARM_02: +71 -0 ~0 [RemoveAll; Comment]`, `Added SOV_ARM_05: "Tank Corps (Named)" ... 11 name(s), links SOV_ARM_02`.
- [ ] 2. `powershell -File .\build.ps1 -SyncWiki SOV`. Expect `no row in wiki table (add by hand): SOV_ARM_06, SOV_ARM_05` and `wiki/Home.md: SOV group count 28 -> 30`. Then make every edit under "Docs payload", in `wiki/Soviet-Union.md` and `WORKSHOP_DESCRIPTION_GUIDELINES.md`.
- [ ] 3. `powershell -File .\build.ps1 -Check SOV`. Expect `Check passed` and `AUDIT SUMMARY SOV: GROUPS=30 AUTHORED=521/1728 FLAGS=38`, with the flags under "Kept on judgment".
- [ ] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and files may show in `git status` (they are in progress in parallel); leave them alone.
- [ ] 5. Ship, on the user's word. Run `git status --short -- WORKSHOP_DESCRIPTION_GUIDELINES.md wiki/Home.md wiki/`: if `git diff` of `WORKSHOP_DESCRIPTION_GUIDELINES.md` or `wiki/Home.md` shows changes outside the SOV lines, or any wiki page other than `Soviet-Union.md` and `Home.md` is modified, stop and report (another plan's changes would be committed or pushed with this one). Otherwise move this plan to `docs/plans/archive/`, stage only `common/units/names_divisions/zz_INEX_SOV_names_divisions.txt`, `wiki/Soviet-Union.md`, `wiki/Home.md`, `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `docs/tooling-backlog.md` (its SOV entry only; if it holds other uncommitted entries, leave it unstaged and say so) and the plan (old and archive paths), commit with the message `Add verified SOV honorifics and named tank corps and divisions`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Add verified SOV honorifics and named tank corps and divisions"`.

## Docs payload
`README.md`: no change. Every other edit is a verbatim replacement of a whole line.

### `wiki/Soviet-Union.md`
1. Table: after the line that starts ``| `SOV_ARM_01` |``, insert:
   ```
   | `SOV_ARM_06` | Tank Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d-ya Tankovaya Diviziya` |
   ```
   After the line that starts ``| `SOV_ARM_02` |``, insert:
   ```
   | `SOV_ARM_05` | Tank Corps (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Tankovyy Korpus` |
   ```
2. Replace the note under the table (the line that starts `> Groups on vanilla tags are merged`) with:
   ```
   > Groups on vanilla tags are merged into the vanilla groups: a vanilla name that INEX does not replace under its number stays in the game. `SOV_MEC_02`, `SOV_ARM_05`, `SOV_ARM_06`, `SOV_MAR_02`, `SOV_UR_01`, `SOV_NAT_01`, `SOV_NKVD_01`, `SOV_AIR_01`, `SOV_ART_01` and the four government-gated groups are new tags. Vanilla's `SOV_INF_02`, `SOV_INF_03` and `SOV_JAP_INF`, which focuses and scripted effects use, stay as vanilla defines them.
   ```
3. Replace the paragraph under ``### `SOV_INF_01` — Rifle Divisions (*Strelkovaya Diviziya*)`` with:
   ```
   The backbone of the Red Army, in vanilla's historical numbering: the list skips the numbers of the mountain and motorized divisions that share its pool, so they keep theirs. Pre-war and Civil War honorifics sit on their own divisions (*Moskovskaya Proletarskaya*, *Chapayevskaya*, *Samaro-Ulyanovskaya*, *imeni Proletariata Donbassa*), and some 240 more numbers carry the city or battle honour their division held in 1945 (*171-ya Idritsko-Berlinskaya*, *230-ya Stalinskaya*, *300-ya Kharbinskaya*). Numbers whose division held no honorific stay plain.
   ```
4. Replace the heading ``### `SOV_ARM_01` / `SOV_ARM_02` / `SOV_ARM_04` — Tank Formations`` with:
   ```
   ### `SOV_ARM_01` / `SOV_ARM_06` / `SOV_ARM_02` / `SOV_ARM_05` / `SOV_ARM_04` — Tank Formations
   ```
   and the two bullets that start `- **Tank Divisions (` and `- **Tank Corps (` with:
   ```
   - **Tank Divisions (`SOV_ARM_01`)** — the 1940–41 tank divisions, a plain fallback-only list. `SOV_ARM_06` is the named variant and shares its numbering: the tank divisions of 1945–46, which kept the number and honour of the tank corps they were formed from (*1-ya Insterburgskaya*, *9-ya Bobruysko-Berlinskaya*).
   - **Tank Corps (`SOV_ARM_02`)** — the plain variant, numbers only. `SOV_ARM_05` is the named variant and shares its numbering: every non-Guards tank corps that held a battle honour in 1945 (*Insterburgskiy*, *Dvinskiy*, *Bobruysko-Berlinskiy*, *Vislenskiy*).
   ```
5. Replace the paragraph under ``### `SOV_GRD_01` — Guards Rifle Divisions (*Gvardeyskaya Strelkovaya Diviziya*)`` with:
   ```
   Guards rifle divisions with the battle honour each held in 1945, about a hundred of the 129 (*Panfilovskaya*, *Yelninskaya*, *Dukhovshchinsko-Khinganskaya*, *Belgorodsko-Kharkovskaya*), including the Latvian 43rd *Rizhskaya* and the Estonian 118th *Tallinnskaya*. Numbers whose division held no honorific stay plain.
   ```

### `WORKSHOP_DESCRIPTION_GUIDELINES.md`
1. In the cross-reference row for `zz_INEX_SOV_names_divisions.txt`, replace `Fortified regions, Guards Tank & Mech Corps,` with `Fortified regions, Plain & Named Tank Corps and Tank Divisions, Guards Tank & Mech Corps,` (the rest of the row stays).
2. In the `[b]USSR[/b]` block, replace the second bullet (it starts `- Armor & Mechanized Corps with WWII battle honors:`) with:
   ```
   - Armor & Mechanized Corps with WWII battle honors: plain and named tank corps and the tank divisions of 1945 ([i]9-ya 'Bobruysko-Berlinskaya'[/i]), Guards Tank Corps ([i]4-y 'Kantemirovskiy'[/i]), all 9 Guards Mechanized Corps ([i]1-y 'Venskiy'[/i]), Guards Airborne, Breakthrough Artillery, naval infantry brigades ([i]63-ya 'Kirkenesskaya'[/i]), Cossack cavalry and penal units
   ```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
`inex-proofreader` (Russian romanisation, 3 web calls): no romanisation or grammar errors. *Shumlinsko-Venskaya* (Шумла, the Russian name of Shumen), *Mozyrskaya*, *Chistyakovskaya* and *Korsunskaya* for Корсуньская (soft sign dropped, as in INF 206) are well-formed. It was unsure of three source spellings:
- *Grudzenskaya* (142): kept. en.wikipedia "142nd Rifle Division (Soviet Union)" gives the honour *Graudenz*; Грудзенская is the Soviet-era adjective the list prints.
- *Kulaginskaya* (178): kept. en.wikipedia "178th Rifle Division" gives the honorific *Kulaginskaya*.
- *Ribshevskaya* (306): kept as printed in the list (Ribshevo, Smolensk oblast).
The batch is unchanged by the review. Test-applied on a scratch copy of the repository: `-ValidateOnly` passes and `-Audit` gives the figures under "Kept on judgment".

## Outcome
<!-- TODO(implementer): date, the -Check summary, deviations from this plan with the reason -->

## Edit batch
Applied by `build.ps1 -EditNames SOV -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{
  "group": "INF_01",
  "set": [
    "11=%d-ya 'Leningradsko-Valginskaya' Strelkovaya Diviziya",
    "18=%d-ya 'Mginskaya' Strelkovaya Diviziya",
    "38=%d-ya 'Dnestrovskaya' Strelkovaya Diviziya",
    "42=%d-ya 'Smolenskaya' Strelkovaya Diviziya",
    "43=%d-ya 'Tartuskaya' Strelkovaya Diviziya",
    "49=%d-ya 'Roslavlskaya' Strelkovaya Diviziya",
    "52=%d-ya 'Shumlinsko-Venskaya' Strelkovaya Diviziya",
    "53=%d-ya 'Novoukrainskaya' Strelkovaya Diviziya",
    "54=%d-ya 'Mazurskaya' Strelkovaya Diviziya",
    "64=%d-ya 'Rezhitskaya' Strelkovaya Diviziya",
    "65=%d-ya 'Novgorodskaya' Strelkovaya Diviziya",
    "69=%d-ya 'Sevskaya' Strelkovaya Diviziya",
    "70=%d-ya 'Verkhnedneprovskaya' Strelkovaya Diviziya",
    "73=%d-ya 'Novozybkovskaya' Strelkovaya Diviziya",
    "78=%d-ya 'Zaporozhskaya' Strelkovaya Diviziya",
    "81=%d-ya 'Kalinkovichskaya' Strelkovaya Diviziya",
    "82=%d-ya 'Yartsevskaya' Strelkovaya Diviziya",
    "85=%d-ya 'Leningradsko-Pavlovskaya' Strelkovaya Diviziya",
    "87=%d-ya 'Perekopskaya' Strelkovaya Diviziya",
    "88=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "90=%d-ya 'Ropshinskaya' Strelkovaya Diviziya",
    "91=%d-ya 'Melitopolskaya' Strelkovaya Diviziya",
    "92=%d-ya 'Krakovskaya' Strelkovaya Diviziya",
    "97=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "98=%d-ya 'Ropshinskaya' Strelkovaya Diviziya",
    "99=%d-ya 'Zhitomirskaya' Strelkovaya Diviziya",
    "100=%d-ya 'Lvovskaya' Strelkovaya Diviziya",
    "102=%d-ya 'Dalnevostochnaya Novgorod-Severskaya' Strelkovaya Diviziya",
    "106=%d-ya 'Zabaykalsko-Dneprovskaya' Strelkovaya Diviziya",
    "107=%d-ya 'Kremenetskaya' Strelkovaya Diviziya",
    "108=%d-ya 'Bobruyskaya' Strelkovaya Diviziya",
    "110=%d-ya 'Verkhnedneprovskaya' Strelkovaya Diviziya",
    "111=%d-ya 'Aleksandriyskaya' Strelkovaya Diviziya",
    "112=%d-ya 'Rylsko-Korostenskaya' Strelkovaya Diviziya",
    "113=%d-ya 'Nizhnednestrovskaya' Strelkovaya Diviziya",
    "114=%d-ya 'Svirskaya' Strelkovaya Diviziya",
    "115=%d-ya 'Kholmskaya' Strelkovaya Diviziya",
    "116=%d-ya 'Kharkovskaya' Strelkovaya Diviziya",
    "117=%d-ya 'Poznanskaya' Strelkovaya Diviziya",
    "118=%d-ya 'Melitopolskaya' Strelkovaya Diviziya",
    "121=%d-ya 'Rylsko-Kiyevskaya' Strelkovaya Diviziya",
    "123=%d-ya 'Luzhskaya' Strelkovaya Diviziya",
    "124=%d-ya 'Mginsko-Khinganskaya' Strelkovaya Diviziya",
    "125=%d-ya 'Krasnoselskaya' Strelkovaya Diviziya",
    "126=%d-ya 'Gorlovskaya' Strelkovaya Diviziya",
    "127=%d-ya 'Chistyakovskaya' Strelkovaya Diviziya",
    "128=%d-ya 'Pskovskaya' Strelkovaya Diviziya",
    "129=%d-ya 'Orlovskaya' Strelkovaya Diviziya",
    "130=%d-ya 'Taganrogskaya' Strelkovaya Diviziya",
    "132=%d-ya 'Bakhmachsko-Varshavskaya' Strelkovaya Diviziya",
    "133=%d-ya 'Smolenskaya' Strelkovaya Diviziya",
    "135=%d-ya 'Krakovskaya' Strelkovaya Diviziya",
    "136=%d-ya 'Kiyevskaya' Strelkovaya Diviziya",
    "137=%d-ya 'Bobruyskaya' Strelkovaya Diviziya",
    "139=%d-ya 'Roslavlskaya' Strelkovaya Diviziya",
    "140=%d-ya 'Sibirskaya Novgorod-Severskaya' Strelkovaya Diviziya",
    "141=%d-ya 'Kiyevskaya' Strelkovaya Diviziya",
    "142=%d-ya 'Grudzenskaya' Strelkovaya Diviziya",
    "143=%d-ya 'Konotopsko-Korostenskaya' Strelkovaya Diviziya",
    "144=%d-ya 'Vilenskaya' Strelkovaya Diviziya",
    "145=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "146=%d-ya 'Ostrovskaya' Strelkovaya Diviziya",
    "148=%d-ya 'Chernigovskaya' Strelkovaya Diviziya",
    "149=%d-ya 'Novograd-Volynskaya' Strelkovaya Diviziya",
    "151=%d-ya 'Zhmerinsko-Budapeshtskaya' Strelkovaya Diviziya",
    "152=%d-ya 'Dnepropetrovskaya' Strelkovaya Diviziya",
    "153=%d-ya 'Smolenskaya' Strelkovaya Diviziya",
    "155=%d-ya 'Stanislavskaya' Strelkovaya Diviziya",
    "157=%d-ya 'Nemanskaya' Strelkovaya Diviziya",
    "158=%d-ya 'Vitebsko-Lioznenskaya' Strelkovaya Diviziya",
    "160=%d-ya 'Brestskaya' Strelkovaya Diviziya",
    "161=%d-ya 'Stanislavskaya' Strelkovaya Diviziya",
    "162=%d-ya 'Sredneaziatskaya Novgorod-Severskaya' Strelkovaya Diviziya",
    "164=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "165=%d-ya 'Sedletskaya' Strelkovaya Diviziya",
    "167=%d-ya 'Sumsko-Kiyevskaya' Strelkovaya Diviziya",
    "168=%d-ya 'Rizhskaya' Strelkovaya Diviziya",
    "169=%d-ya 'Rogachevskaya' Strelkovaya Diviziya",
    "170=%d-ya 'Rechitskaya' Strelkovaya Diviziya",
    "171=%d-ya 'Idritsko-Berlinskaya' Strelkovaya Diviziya",
    "172=%d-ya 'Pavlogradskaya' Strelkovaya Diviziya",
    "173=%d-ya 'Orshanskaya' Strelkovaya Diviziya",
    "174=%d-ya 'Borisovskaya' Strelkovaya Diviziya",
    "175=%d-ya 'Uralsko-Kovelskaya' Strelkovaya Diviziya",
    "176=%d-ya 'Mazurskaya' Strelkovaya Diviziya",
    "177=%d-ya 'Lyubanskaya' Strelkovaya Diviziya",
    "178=%d-ya 'Kulaginskaya' Strelkovaya Diviziya",
    "179=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "180=%d-ya 'Kiyevskaya' Strelkovaya Diviziya",
    "181=%d-ya 'Stalingradskaya' Strelkovaya Diviziya",
    "182=%d-ya 'Dnovskaya' Strelkovaya Diviziya",
    "183=%d-ya 'Kharkovskaya' Strelkovaya Diviziya",
    "184=%d-ya 'Dukhovshchinskaya' Strelkovaya Diviziya",
    "186=%d-ya 'Brestskaya' Strelkovaya Diviziya",
    "188=%d-ya 'Nizhnedneprovskaya' Strelkovaya Diviziya",
    "189=%d-ya 'Kingiseppskaya' Strelkovaya Diviziya",
    "191=%d-ya 'Novgorodskaya' Strelkovaya Diviziya",
    "193=%d-ya 'Dneprovskaya' Strelkovaya Diviziya",
    "195=%d-ya 'Novomoskovskaya' Strelkovaya Diviziya",
    "199=%d-ya 'Smolenskaya' Strelkovaya Diviziya",
    "200=%d-ya 'Dvinskaya' Strelkovaya Diviziya",
    "201=%d-ya 'Gatchinskaya' Strelkovaya Diviziya",
    "203=%d-ya 'Zaporozhsko-Khinganskaya' Strelkovaya Diviziya",
    "206=%d-ya 'Korsunskaya' Strelkovaya Diviziya",
    "207=%d-ya 'Pomeranskaya' Strelkovaya Diviziya",
    "211=%d-ya 'Chernigovskaya' Strelkovaya Diviziya",
    "214=%d-ya 'Kremenchugsko-Aleksandriyskaya' Strelkovaya Diviziya",
    "217=%d-ya 'Unechskaya' Strelkovaya Diviziya",
    "222=%d-ya 'Smolensko-Brandenburgskaya' Strelkovaya Diviziya",
    "224=%d-ya 'Gatchinskaya' Strelkovaya Diviziya",
    "225=%d-ya 'Novgorodskaya' Strelkovaya Diviziya",
    "226=%d-ya 'Kiyevsko-Glukhovskaya' Strelkovaya Diviziya",
    "228=%d-ya 'Voznesenskaya' Strelkovaya Diviziya",
    "229=%d-ya 'Oderskaya' Strelkovaya Diviziya",
    "230=%d-ya 'Stalinskaya' Strelkovaya Diviziya",
    "232=%d-ya 'Sibirskaya Sumsko-Kiyevskaya' Strelkovaya Diviziya",
    "233=%d-ya 'Kremenchugsko-Znamenskaya' Strelkovaya Diviziya",
    "234=%d-ya 'Lomonosovsko-Prazhskaya' Strelkovaya Diviziya",
    "235=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "237=%d-ya 'Piryatinskaya' Strelkovaya Diviziya",
    "238=%d-ya 'Karachevskaya' Strelkovaya Diviziya",
    "241=%d-ya 'Vinnitskaya' Strelkovaya Diviziya",
    "243=%d-ya 'Nikopolsko-Khinganskaya' Strelkovaya Diviziya",
    "244=%d-ya 'Zaporozhskaya' Strelkovaya Diviziya",
    "245=%d-ya 'Valginsko-Rezhitskaya' Strelkovaya Diviziya",
    "246=%d-ya 'Shumskaya' Strelkovaya Diviziya",
    "247=%d-ya 'Roslavlskaya' Strelkovaya Diviziya",
    "248=%d-ya 'Odesskaya' Strelkovaya Diviziya",
    "250=%d-ya 'Bobruyskaya' Strelkovaya Diviziya",
    "251=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "252=%d-ya 'Kharkovsko-Bratislavskaya' Strelkovaya Diviziya",
    "253=%d-ya 'Kalinkovichskaya' Strelkovaya Diviziya",
    "254=%d-ya 'Cherkasskaya' Strelkovaya Diviziya",
    "256=%d-ya 'Narvskaya' Strelkovaya Diviziya",
    "257=%d-ya 'Sivashskaya' Strelkovaya Diviziya",
    "259=%d-ya 'Artemovskaya' Strelkovaya Diviziya",
    "260=%d-ya 'Kovelskaya' Strelkovaya Diviziya",
    "262=%d-ya 'Demidovsko-Khinganskaya' Strelkovaya Diviziya",
    "263=%d-ya 'Sivashskaya' Strelkovaya Diviziya",
    "264=%d-ya 'Ussuriyskaya' Strelkovaya Diviziya",
    "265=%d-ya 'Vyborgskaya' Strelkovaya Diviziya",
    "266=%d-ya 'Artemovsko-Berlinskaya' Strelkovaya Diviziya",
    "267=%d-ya 'Sivashskaya' Strelkovaya Diviziya",
    "268=%d-ya 'Mginskaya' Strelkovaya Diviziya",
    "269=%d-ya 'Rogachevskaya' Strelkovaya Diviziya",
    "270=%d-ya 'Demidovskaya' Strelkovaya Diviziya",
    "272=%d-ya 'Svirsko-Pomeranskaya' Strelkovaya Diviziya",
    "273=%d-ya 'Bezhitskaya' Strelkovaya Diviziya",
    "274=%d-ya 'Yartsevskaya' Strelkovaya Diviziya",
    "275=%d-ya 'Khinganskaya' Strelkovaya Diviziya",
    "277=%d-ya 'Roslavlskaya' Strelkovaya Diviziya",
    "278=%d-ya 'Khinganskaya' Strelkovaya Diviziya",
    "279=%d-ya 'Lisichanskaya' Strelkovaya Diviziya",
    "280=%d-ya 'Konotopsko-Korostenskaya' Strelkovaya Diviziya",
    "281=%d-ya 'Lyubanskaya' Strelkovaya Diviziya",
    "282=%d-ya 'Tartuskaya' Strelkovaya Diviziya",
    "283=%d-ya 'Gomelskaya' Strelkovaya Diviziya",
    "284=%d-ya 'Khinganskaya' Strelkovaya Diviziya",
    "285=%d-ya 'Dombrovskaya' Strelkovaya Diviziya",
    "286=%d-ya 'Leningradskaya' Strelkovaya Diviziya",
    "287=%d-ya 'Novograd-Volynskaya' Strelkovaya Diviziya",
    "288=%d-ya 'Dnovskaya' Strelkovaya Diviziya",
    "290=%d-ya 'Mogilevskaya' Strelkovaya Diviziya",
    "291=%d-ya 'Gatchinskaya' Strelkovaya Diviziya",
    "292=%d-ya 'Khinganskaya' Strelkovaya Diviziya",
    "294=%d-ya 'Cherkasskaya' Strelkovaya Diviziya",
    "295=%d-ya 'Khersonskaya' Strelkovaya Diviziya",
    "297=%d-ya 'Kirovogradsko-Slavyanskaya' Strelkovaya Diviziya",
    "298=%d-ya 'Khinganskaya' Strelkovaya Diviziya",
    "299=%d-ya 'Kharkovskaya' Strelkovaya Diviziya",
    "300=%d-ya 'Kharbinskaya' Strelkovaya Diviziya",
    "301=%d-ya 'Stalinskaya' Strelkovaya Diviziya",
    "303=%d-ya 'Verkhnedneprovskaya' Strelkovaya Diviziya",
    "304=%d-ya 'Zhitomirskaya' Strelkovaya Diviziya",
    "305=%d-ya 'Belgorodskaya' Strelkovaya Diviziya",
    "306=%d-ya 'Ribshevskaya' Strelkovaya Diviziya",
    "307=%d-ya 'Novozybkovskaya' Strelkovaya Diviziya",
    "310=%d-ya 'Novgorodskaya' Strelkovaya Diviziya",
    "311=%d-ya 'Dvinskaya' Strelkovaya Diviziya",
    "312=%d-ya 'Smolenskaya' Strelkovaya Diviziya",
    "313=%d-ya 'Svirsko-Petrozavodskaya' Strelkovaya Diviziya",
    "314=%d-ya 'Kingiseppskaya' Strelkovaya Diviziya",
    "315=%d-ya 'Melitopolskaya' Strelkovaya Diviziya",
    "317=%d-ya 'Budapeshtskaya' Strelkovaya Diviziya",
    "320=%d-ya 'Yenakiyevskaya' Strelkovaya Diviziya",
    "321=%d-ya 'Chudovsko-Dnovskaya' Strelkovaya Diviziya",
    "323=%d-ya 'Bryanskaya' Strelkovaya Diviziya",
    "324=%d-ya 'Verkhnedneprovskaya' Strelkovaya Diviziya",
    "325=%d-ya 'Dvinskaya' Strelkovaya Diviziya",
    "326=%d-ya 'Roslavlskaya' Strelkovaya Diviziya",
    "328=%d-ya 'Varshavskaya' Strelkovaya Diviziya",
    "329=%d-ya 'Keletskaya' Strelkovaya Diviziya",
    "330=%d-ya 'Mogilevskaya' Strelkovaya Diviziya",
    "332=%d-ya 'Ivanovsko-Polotskaya' Strelkovaya Diviziya",
    "333=%d-ya 'Sinelnikovskaya' Strelkovaya Diviziya",
    "334=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "336=%d-ya 'Zhitomirskaya' Strelkovaya Diviziya",
    "337=%d-ya 'Lubnenskaya' Strelkovaya Diviziya",
    "339=%d-ya 'Rostovsko-Tamanskaya Brandenburgskaya' Strelkovaya Diviziya",
    "340=%d-ya 'Sumsko-Kiyevskaya' Strelkovaya Diviziya",
    "343=%d-ya 'Belostokskaya' Strelkovaya Diviziya",
    "344=%d-ya 'Roslavlskaya' Strelkovaya Diviziya",
    "346=%d-ya 'Debaltsevskaya' Strelkovaya Diviziya",
    "348=%d-ya 'Bobruyskaya' Strelkovaya Diviziya",
    "350=%d-ya 'Zhitomirsko-Sandomirskaya' Strelkovaya Diviziya",
    "351=%d-ya 'Shepetovskaya' Strelkovaya Diviziya",
    "352=%d-ya 'Orshanskaya' Strelkovaya Diviziya",
    "353=%d-ya 'Dneprodzerzhinskaya' Strelkovaya Diviziya",
    "354=%d-ya 'Kalinkovichskaya' Strelkovaya Diviziya",
    "356=%d-ya 'Kalinkovichskaya' Strelkovaya Diviziya",
    "358=%d-ya 'Leningradsko-Khinganskaya' Strelkovaya Diviziya",
    "359=%d-ya 'Yartsevskaya' Strelkovaya Diviziya",
    "360=%d-ya 'Nevelskaya' Strelkovaya Diviziya",
    "361=%d-ya 'Amurskaya' Strelkovaya Diviziya",
    "362=%d-ya 'Verkhnedneprovskaya' Strelkovaya Diviziya",
    "364=%d-ya 'Tosnenskaya' Strelkovaya Diviziya",
    "368=%d-ya 'Pechengskaya' Strelkovaya Diviziya",
    "369=%d-ya 'Karachevskaya' Strelkovaya Diviziya",
    "370=%d-ya 'Brandenburgskaya' Strelkovaya Diviziya",
    "371=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
    "372=%d-ya 'Novgorodskaya' Strelkovaya Diviziya",
    "373=%d-ya 'Mirgorodskaya' Strelkovaya Diviziya",
    "374=%d-ya 'Lyubanskaya' Strelkovaya Diviziya",
    "375=%d-ya 'Kharkovsko-Bukharestskaya' Strelkovaya Diviziya",
    "376=%d-ya 'Kuzbassko-Pskovskaya' Strelkovaya Diviziya",
    "377=%d-ya 'Valginskaya' Strelkovaya Diviziya",
    "378=%d-ya 'Novgorodskaya' Strelkovaya Diviziya",
    "379=%d-ya 'Rezhitskaya' Strelkovaya Diviziya",
    "380=%d-ya 'Orlovskaya' Strelkovaya Diviziya",
    "381=%d-ya 'Leningradskaya' Strelkovaya Diviziya",
    "382=%d-ya 'Novgorodskaya' Strelkovaya Diviziya",
    "383=%d-ya 'Feodosiysko-Brandenburgskaya' Strelkovaya Diviziya",
    "387=%d-ya 'Perekopskaya' Strelkovaya Diviziya",
    "388=%d-ya 'Kharbinskaya' Strelkovaya Diviziya",
    "389=%d-ya 'Berdichevsko-Keletskaya' Strelkovaya Diviziya",
    "391=%d-ya 'Rezhitskaya' Strelkovaya Diviziya",
    "395=%d-ya 'Tamanskaya' Strelkovaya Diviziya",
    "397=%d-ya 'Sarnenskaya' Strelkovaya Diviziya",
    "399=%d-ya 'Novozybkovskaya' Strelkovaya Diviziya",
    "413=%d-ya 'Brestskaya' Strelkovaya Diviziya",
    "415=%d-ya 'Mozyrskaya' Strelkovaya Diviziya",
    "417=%d-ya 'Sivashskaya' Strelkovaya Diviziya"
  ]
}
```

```json batch
{
  "group": "GRD_01",
  "removeAll": true,
  "add": [
    "# Guards rifle divisions with the honour each held in 1945 (plain numbers write over vanilla's merged entries)",
    "1=%d-ya 'Moskovsko-Minskaya' Gvardeyskaya Strelkovaya Diviziya",
    "2=%d-ya 'Tamanskaya' Gvardeyskaya Strelkovaya Diviziya",
    "3=%d-ya 'Volnovakhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "4=%d-ya 'Apostolovsko-Venskaya' Gvardeyskaya Strelkovaya Diviziya",
    "5=%d-ya 'Gorodokskaya' Gvardeyskaya Strelkovaya Diviziya",
    "6=%d-ya 'Rovenskaya' Gvardeyskaya Strelkovaya Diviziya",
    "7=%d-ya 'Rezhitskaya' Gvardeyskaya Strelkovaya Diviziya",
    "8=%d-ya 'Panfilovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "9=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "10=%d-ya 'Pechengskaya' Gvardeyskaya Strelkovaya Diviziya",
    "11=%d-ya 'Gorodokskaya' Gvardeyskaya Strelkovaya Diviziya",
    "12=%d-ya 'Pinskaya' Gvardeyskaya Strelkovaya Diviziya",
    "13=%d-ya 'Poltavskaya' Gvardeyskaya Strelkovaya Diviziya",
    "14=%d-ya 'Vinnitskaya' Gvardeyskaya Strelkovaya Diviziya",
    "15=%d-ya 'Kharkovsko-Prazhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "16=%d-ya 'Karachevskaya' Gvardeyskaya Strelkovaya Diviziya",
    "17=%d-ya 'Dukhovshchinsko-Khinganskaya' Gvardeyskaya Strelkovaya Diviziya",
    "18=%d-ya 'Insterburgskaya' Gvardeyskaya Strelkovaya Diviziya",
    "19=%d-ya 'Rudnensko-Khinganskaya' Gvardeyskaya Strelkovaya Diviziya",
    "20=%d-ya 'Krivorozhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "21=%d-ya 'Nevelskaya' Gvardeyskaya Strelkovaya Diviziya",
    "22=%d-ya 'Rizhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "23=%d-ya 'Dnovsko-Berlinskaya' Gvardeyskaya Strelkovaya Diviziya",
    "24=%d-ya 'Yevpatoriyskaya' Gvardeyskaya Strelkovaya Diviziya",
    "25=%d-ya 'Sinelnikovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "26=%d-ya 'Vostochno-Sibirskaya Gorodokskaya' Gvardeyskaya Strelkovaya Diviziya",
    "27=%d-ya 'Novobugskaya' Gvardeyskaya Strelkovaya Diviziya",
    "28=%d-ya 'Kharkovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "29=%d-ya 'Yelninskaya' Gvardeyskaya Strelkovaya Diviziya",
    "30=%d-ya 'Rizhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "31=%d-ya 'Vitebskaya' Gvardeyskaya Strelkovaya Diviziya",
    "32=%d-ya 'Tamanskaya' Gvardeyskaya Strelkovaya Diviziya",
    "33=%d-ya 'Sevastopolskaya' Gvardeyskaya Strelkovaya Diviziya",
    "34=%d-ya 'Yenakiyevskaya' Gvardeyskaya Strelkovaya Diviziya",
    "35=%d-ya 'Lozovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "36=%d-ya 'Verkhnedneprovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "37=%d-ya 'Rechitskaya' Gvardeyskaya Strelkovaya Diviziya",
    "38=%d-ya 'Lozovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "39=%d-ya 'Barvenkovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "40=%d-ya 'Yenakiyevsko-Dunayskaya' Gvardeyskaya Strelkovaya Diviziya",
    "41=%d-ya 'Korsunsko-Dunayskaya' Gvardeyskaya Strelkovaya Diviziya",
    "42=%d-ya 'Prilukskaya' Gvardeyskaya Strelkovaya Diviziya",
    "43=%d-ya 'Rizhskaya' Latyshskaya Gvardeyskaya Strelkovaya Diviziya",
    "44=%d-ya 'Baranovichskaya' Gvardeyskaya Strelkovaya Diviziya",
    "45=%d-ya 'Krasnoselskaya' Gvardeyskaya Strelkovaya Diviziya",
    "46=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "47=%d-ya 'Nizhnedneprovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "48=%d-ya 'Krivorozhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "49=%d-ya 'Khersonskaya' Gvardeyskaya Strelkovaya Diviziya",
    "50=%d-ya 'Stalinskaya' Gvardeyskaya Strelkovaya Diviziya",
    "51=%d-ya 'Vitebskaya' Gvardeyskaya Strelkovaya Diviziya",
    "52=%d-ya 'Rizhsko-Berlinskaya' Gvardeyskaya Strelkovaya Diviziya",
    "53=%d-ya 'Tartuskaya' Gvardeyskaya Strelkovaya Diviziya",
    "54=%d-ya 'Makeyevskaya' Gvardeyskaya Strelkovaya Diviziya",
    "55=%d-ya 'Irkutsko-Pinskaya Tamanskaya' Gvardeyskaya Strelkovaya Diviziya",
    "56=%d-ya 'Smolenskaya' Gvardeyskaya Strelkovaya Diviziya",
    "57=%d-ya 'Novobugskaya' Gvardeyskaya Strelkovaya Diviziya",
    "58=%d-ya 'Krasnogradsko-Prazhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "59=%d-ya 'Kramatorskaya' Gvardeyskaya Strelkovaya Diviziya",
    "60=%d-ya 'Pavlogradskaya' Gvardeyskaya Strelkovaya Diviziya",
    "61=%d-ya 'Slavyanskaya' Gvardeyskaya Strelkovaya Diviziya",
    "62=%d-ya 'Zvenigorodsko-Budapeshtskaya' Gvardeyskaya Strelkovaya Diviziya",
    "63=%d-ya 'Krasnoselskaya' Gvardeyskaya Strelkovaya Diviziya",
    "64=%d-ya 'Krasnoselskaya' Gvardeyskaya Strelkovaya Diviziya",
    "65=%d-ya 'Rizhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "66=%d-ya 'Poltavskaya' Gvardeyskaya Strelkovaya Diviziya",
    "67=%d-ya 'Vitebskaya' Gvardeyskaya Strelkovaya Diviziya",
    "68=%d-ya 'Proskurovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "69=%d-ya 'Zvenigorodskaya' Gvardeyskaya Strelkovaya Diviziya",
    "70=%d-ya 'Glukhovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "71=%d-ya 'Kharkovsko-Vitebskaya' Gvardeyskaya Strelkovaya Diviziya",
    "72=%d-ya 'Krasnogradskaya' Gvardeyskaya Strelkovaya Diviziya",
    "73=%d-ya 'Stalingradsko-Dunayskaya' Gvardeyskaya Strelkovaya Diviziya",
    "74=%d-ya 'Nizhnedneprovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "75=%d-ya 'Bakhmachskaya' Gvardeyskaya Strelkovaya Diviziya",
    "76=%d-ya 'Chernigovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "77=%d-ya 'Chernigovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "78=%d-ya 'Stalingradsko-Vislenskaya' Gvardeyskaya Strelkovaya Diviziya",
    "79=%d-ya 'Zaporozhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "80=%d-ya 'Umanskaya' Gvardeyskaya Strelkovaya Diviziya",
    "81=%d-ya 'Krasnogradskaya' Gvardeyskaya Strelkovaya Diviziya",
    "82=%d-ya 'Zaporozhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "83=%d-ya 'Gorodokskaya' Gvardeyskaya Strelkovaya Diviziya",
    "84=%d-ya 'Karachevskaya' Gvardeyskaya Strelkovaya Diviziya",
    "85=%d-ya 'Rizhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "86=%d-ya 'Nikolayevskaya' Gvardeyskaya Strelkovaya Diviziya",
    "87=%d-ya 'Perekopskaya' Gvardeyskaya Strelkovaya Diviziya",
    "88=%d-ya 'Zaporozhsko-Zhitomirskaya' Gvardeyskaya Strelkovaya Diviziya",
    "89=%d-ya 'Belgorodsko-Kharkovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "90=%d-ya 'Vitebsko-Novgorodskaya' Gvardeyskaya Strelkovaya Diviziya",
    "91=%d-ya 'Dukhovshchinsko-Khinganskaya' Gvardeyskaya Strelkovaya Diviziya",
    "92=%d-ya 'Krivorozhskaya' Gvardeyskaya Strelkovaya Diviziya",
    "93=%d-ya 'Kharkovskaya' Gvardeyskaya Strelkovaya Diviziya",
    "94=%d-ya 'Zvenigorodsko-Berlinskaya' Gvardeyskaya Strelkovaya Diviziya",
    "95=%d-ya 'Poltavskaya' Gvardeyskaya Strelkovaya Diviziya",
    "96=%d-ya 'Ilovayskaya' Gvardeyskaya Strelkovaya Diviziya",
    "97=%d-ya 'Poltavskaya' Gvardeyskaya Strelkovaya Diviziya",
    "98=%d-ya 'Svirskaya' Gvardeyskaya Strelkovaya Diviziya",
    "99=%d-ya 'Svirskaya' Gvardeyskaya Strelkovaya Diviziya",
    "100=%d-ya 'Svirskaya' Gvardeyskaya Strelkovaya Diviziya",
    "101=%d-ya 'Pechengskaya' Gvardeyskaya Strelkovaya Diviziya",
    "102=%d-ya 'Novgorodsko-Pomeranskaya' Gvardeyskaya Strelkovaya Diviziya",
    "103=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "104=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "105=%d-ya 'Venskaya' Gvardeyskaya Strelkovaya Diviziya",
    "106=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "107=%d-ya 'Pervomayskaya' Gvardeyskaya Strelkovaya Diviziya",
    "108=%d-ya 'Nikolayevskaya' Gvardeyskaya Strelkovaya Diviziya",
    "109=%d-ya 'Berislavsko-Khinganskaya' Gvardeyskaya Strelkovaya Diviziya",
    "110=%d-ya 'Aleksandriysko-Khinganskaya' Gvardeyskaya Strelkovaya Diviziya",
    "111=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "112=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "113=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "114=%d-ya 'Venskaya' Gvardeyskaya Strelkovaya Diviziya",
    "115=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "116=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "117=%d-ya 'Berdichevskaya' Gvardeyskaya Strelkovaya Diviziya",
    "119=%d-ya 'Rezhitskaya' Gvardeyskaya Strelkovaya Diviziya",
    "120=%d-ya 'Rogachevskaya' Gvardeyskaya Strelkovaya Diviziya",
    "121=%d-ya 'Gomelskaya' Gvardeyskaya Strelkovaya Diviziya",
    "123=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "124=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "125=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "126=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "127=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "128=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "129=%d-ya 'Zhitomirskaya' Gvardeyskaya Strelkovaya Diviziya",
    "# Estonian Guards rifle divisions",
    "118=%d-ya 'Tallinnskaya' Estonskaya Gvardeyskaya Strelkovaya Diviziya",
    "122=%d-ya 'Estonskaya' Gvardeyskaya Strelkovaya Diviziya"
  ]
}
```

```json batch
{
  "group": "CAV_01",
  "set": [
    "14=%d-ya 'imeni Parkhomenko' Kavaleriyskaya Diviziya",
    "30=%d-ya 'Novobugskaya' Kavaleriyskaya Diviziya",
    "63=%d-ya 'Korsunskaya' Kavaleriyskaya Diviziya",
    "305=5-ya Gvardeyskaya 'Tannenbergskaya' Kavaleriyskaya Diviziya"
  ]
}
```

```json batch
{
  "group": "CAV_02",
  "set": [
    "311=11-ya Gvardeyskaya 'Volnovakhskaya' Donskaya Kazachya Kavaleriyskaya Diviziya",
    "312=12-ya Gvardeyskaya 'Korsunskaya' Donskaya Kazachya Kavaleriyskaya Diviziya"
  ],
  "renameSection": ["Guards Cossack cavalry divisions (4th Guards Cossack Cavalry Corps)=Guards Cossack cavalry divisions (4th Guards Kuban and 5th Guards Don Cossack Cavalry Corps)"]
}
```

```json batch
{
  "group": "ARM_01",
  "comment": "# ===== Armored Formations =====\nOverrides vanilla SOV_ARM_01 as the plain variant. SOV_ARM_06 is the named variant and shares this numbering."
}
```

```json batch
{
  "addGroup": true,
  "group": "ARM_06",
  "selector": "Tank Divisions (Named)",
  "addType": "light_armor; medium_armor; heavy_armor; modern_armor",
  "fallback": "%d-ya Tankovaya Diviziya",
  "link": "ARM_01",
  "after": "ARM_01",
  "comment": "Named variant of SOV_ARM_01 and shares its numbering. The tank divisions of 1945-46 took the number and honour\nof the tank corps they were formed from (NKO Order No. 0013, 10 June 1945).",
  "add": [
    "# Tank divisions of 1945-46, formed from the tank corps of the same number",
    "1=%d-ya 'Insterburgskaya' Tankovaya Diviziya",
    "5=%d-ya 'Dvinskaya' Tankovaya Diviziya",
    "9=%d-ya 'Bobruysko-Berlinskaya' Tankovaya Diviziya",
    "10=%d-ya 'Dneprovskaya' Tankovaya Diviziya",
    "11=%d-ya 'Radomsko-Berlinskaya' Tankovaya Diviziya",
    "18=%d-ya 'Znamensko-Budapeshtskaya' Tankovaya Diviziya",
    "19=%d-ya 'Perekopskaya' Tankovaya Diviziya",
    "20=%d-ya 'Zvenigorodskaya' Tankovaya Diviziya",
    "23=%d-ya 'Budapeshtskaya' Tankovaya Diviziya",
    "29=%d-ya 'Znamenskaya' Tankovaya Diviziya",
    "31=%d-ya 'Vislenskaya' Tankovaya Diviziya"
  ]
}
```

```json batch
{
  "group": "ARM_02",
  "removeAll": true,
  "comment": "Overrides vanilla SOV_ARM_02 as the plain variant. SOV_ARM_05 is the named variant and shares this numbering.",
  "add": [
    "# Vanilla keys written again (vanilla group merges in)",
    "1=%d-y Tankovyy Korpus", "2=%d-y Tankovyy Korpus", "3=%d-y Tankovyy Korpus", "4=%d-y Tankovyy Korpus", "5=%d-y Tankovyy Korpus",
    "6=%d-y Tankovyy Korpus", "7=%d-y Tankovyy Korpus", "8=%d-y Tankovyy Korpus", "9=%d-y Tankovyy Korpus", "10=%d-y Tankovyy Korpus",
    "11=%d-y Tankovyy Korpus", "12=%d-y Tankovyy Korpus", "13=%d-y Tankovyy Korpus", "14=%d-y Tankovyy Korpus", "15=%d-y Tankovyy Korpus",
    "16=%d-y Tankovyy Korpus", "17=%d-y Tankovyy Korpus", "18=%d-y Tankovyy Korpus", "19=%d-y Tankovyy Korpus", "20=%d-y Tankovyy Korpus",
    "21=%d-y Tankovyy Korpus", "22=%d-y Tankovyy Korpus", "23=%d-y Tankovyy Korpus", "24=%d-y Tankovyy Korpus", "25=%d-y Tankovyy Korpus",
    "26=%d-y Tankovyy Korpus", "27=%d-y Tankovyy Korpus", "28=%d-y Tankovyy Korpus", "29=%d-y Tankovyy Korpus", "30=%d-y Tankovyy Korpus",
    "31=%d-y Tankovyy Korpus", "32=%d-y Tankovyy Korpus", "33=%d-y Tankovyy Korpus", "34=%d-y Tankovyy Korpus", "35=%d-y Tankovyy Korpus",
    "36=%d-y Tankovyy Korpus", "37=%d-y Tankovyy Korpus", "38=%d-y Tankovyy Korpus", "39=%d-y Tankovyy Korpus", "40=%d-y Tankovyy Korpus",
    "41=%d-y Tankovyy Korpus", "42=%d-y Tankovyy Korpus", "43=%d-y Tankovyy Korpus", "44=%d-y Tankovyy Korpus", "45=%d-y Tankovyy Korpus",
    "46=%d-y Tankovyy Korpus", "47=%d-y Tankovyy Korpus", "48=%d-y Tankovyy Korpus", "49=%d-y Tankovyy Korpus", "50=%d-y Tankovyy Korpus",
    "51=%d-y Tankovyy Korpus", "52=%d-y Tankovyy Korpus", "53=%d-y Tankovyy Korpus", "54=%d-y Tankovyy Korpus", "55=%d-y Tankovyy Korpus",
    "56=%d-y Tankovyy Korpus", "57=%d-y Tankovyy Korpus", "58=%d-y Tankovyy Korpus", "59=%d-y Tankovyy Korpus", "60=%d-y Tankovyy Korpus",
    "61=%d-y Tankovyy Korpus", "101=%d-y Tankovyy Korpus", "102=%d-y Tankovyy Korpus", "104=%d-y Tankovyy Korpus", "105=%d-y Tankovyy Korpus",
    "107=%d-y Tankovyy Korpus", "108=%d-y Tankovyy Korpus", "109=%d-y Tankovyy Korpus", "110=%d-y Tankovyy Korpus", "111=%d-y Tankovyy Korpus",
    "112=%d-y Tankovyy Korpus"
  ]
}
```

```json batch
{
  "addGroup": true,
  "group": "ARM_05",
  "selector": "Tank Corps (Named)",
  "addType": "light_armor; medium_armor; heavy_armor; modern_armor",
  "fallback": "%d-y Tankovyy Korpus",
  "link": "ARM_02",
  "after": "ARM_02",
  "comment": "Named variant of SOV_ARM_02 and shares its numbering. Every non-Guards tank corps that held a battle honour in 1945.",
  "add": [
    "# Tank corps that held a battle honour in 1945",
    "1=%d-y 'Insterburgskiy' Tankovyy Korpus",
    "5=%d-y 'Dvinskiy' Tankovyy Korpus",
    "9=%d-y 'Bobruysko-Berlinskiy' Tankovyy Korpus",
    "10=%d-y 'Dneprovskiy' Tankovyy Korpus",
    "11=%d-y 'Radomsko-Berlinskiy' Tankovyy Korpus",
    "18=%d-y 'Znamensko-Budapeshtskiy' Tankovyy Korpus",
    "19=%d-y 'Perekopskiy' Tankovyy Korpus",
    "20=%d-y 'Zvenigorodskiy' Tankovyy Korpus",
    "23=%d-y 'Budapeshtskiy' Tankovyy Korpus",
    "29=%d-y 'Znamenskiy' Tankovyy Korpus",
    "31=%d-y 'Vislenskiy' Tankovyy Korpus"
  ]
}
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
No name changes versus the base revision.
<!-- END CHANGE TABLE -->
