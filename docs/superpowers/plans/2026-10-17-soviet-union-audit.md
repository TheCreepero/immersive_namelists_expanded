# Soviet Union (SOV) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_SOV_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit SOV`)
- AUDIT SUMMARY SOV: GROUPS=28 AUTHORED=374/1007 FLAGS=31
- [SOV_INF_01] flags: PLACEHOLDER_ENTRIES
- [SOV_CAV_01] flags: PLACEHOLDER_ENTRIES
- [SOV_MOT_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_MEC_01] flags: LOW_DEPTH, NAME_LONG
- [SOV_MEC_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH, UNLINKED_MOBILE
- [SOV_ARM_01] flags: LOW_DEPTH
- [SOV_ARM_04] flags: LOW_DEPTH
- [SOV_PAR_01] flags: LOW_DEPTH
- [SOV_MAR_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_MNT_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [SOV_GAR_01] flags: NAME_LONG
- [SOV_GRD_01] flags: NAME_LONG
- [SOV_NAT_01] flags: PLACEHOLDER_ENTRIES, NAME_LONG
- [SOV_GMC_01] flags: LOW_DEPTH, NAME_LONG
- [SOV_GTC_01] flags: LOW_DEPTH
- [SOV_CAV_02] flags: NAME_LONG
- [SOV_PEN_01] flags: LOW_DEPTH
- [SOV_NKVD_01] flags: LOW_DEPTH
- [SOV_AIR_01] flags: PLACEHOLDER_ENTRIES, NAME_LONG
- [SOV_ART_01] flags: NAME_LONG
- [SOV_IMP_01] flags: NAME_LONG
- Vanilla leftovers (planner comparison of every vanilla key): 10 INEX groups on vanilla tags leave 699 vanilla keys in the game whose text differs from the INEX fallback ([NAM-020]). Most are vanilla's stubs in its own transliteration (`%dya` without the hyphen, `Gvardyeiskaya Strelk. Div.`, `Tankovaya Korpus`). `-Audit` counts them as numbered keys past a gap, so it lists only 73. The 2026-10-15 audit listed several of these as "vanilla lines that stay on purpose". It was written under the 2026-10-09 model, in which a group on a vanilla tag replaced vanilla's entries.

## Scope
Narrow follow-up to the engine-model correction (d47fee0): only vanilla entries that still show in the game under an INEX group (R12), including plain variants whose vanilla text differs from the INEX fallback (R10). Every other flag stays as it is (see "Kept on judgment"). A full modernization of this file is out of scope.

## User decisions
- 2026-10-17, before the follow-up: narrow scope (R12 and plain-variant text); default "keep unless wrong" for vanilla names in authored groups; no online research; one Haiku implementer per nation.
- 2026-10-17: after JAP, USA, GER and ENG, the user handed the remaining nations to the orchestrating session, to run in parallel with no checkpoint until all are done ("you do not need to ask me for verification until every remaining nation ... is done"). The decisions below apply the rules used for those four.

## Research
None (user: no online research). Every replacement is the group's own fallback text, or, in `SOV_GAR_01`, one of the two designations the group already writes, so no name is new.

## Rationale
Groups on vanilla tags merge into vanilla's groups ([NAM-020], CLAUDE.md §6), so every vanilla `ordered` key the INEX group does not write still shows. The batch writes the group's own text over each key whose vanilla text is in another format, out of category, or a repeat of an identity INEX keeps elsewhere.

| Group | Keys | What still showed | Written text |
|:---|---:|:---|:---|
| `SOV_MEC_01` | 26 | `%dya Mekhanizirovanaya Diviziya` | `%d-ya Mekhanizirovannaya Diviziya` |
| `SOV_ARM_01` | 71 (1-61, 101-102, 104-105, 107-112) | Plain variant: `%dya Tankovaya Diviziya` | `%d-ya Tankovaya Diviziya` |
| `SOV_ARM_02` | 60 | `%dya Tankovaya Korpus` (feminine adjective on a masculine noun) | `%d-y Tankovyy Korpus` |
| `SOV_ARM_03` | 71 | Plain variant: `%dya Gvardeiskaya Tankovaya Korpus` | `%d-y Gvardeyskiy Tankovyy Korpus` |
| `SOV_ARM_04` | 71 | Plain variant: `%dya Tankovaya Brigada` | `%d-ya Tankovaya Brigada` |
| `SOV_PAR_01` | 36 | Plain variant: `%dya Vozdushno-Desantnaya Div.` (1-12) and vanilla's Guards airborne literals under 101-214, which `SOV_AIR_01` holds in full | `%d-ya Vozdushno-Desantnaya Diviziya` |
| `SOV_GAR_01` | 50 | Garbled NKVD stubs: `NKVD Pogranichnaya`, `NKVD SU Otdel`, `NKVD BZ Otdel`, `NKVD Zashchite Zheleznykh Div.` (railway protection), `NKVD Strelkovaya` | Railway keys 24-34: `%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog`. Rifle keys 58-66: `%d-ya Strelkovaya Diviziya Voisk NKVD`. The group already writes both designations; the other 30 keys get the fallback `%d-ya Pogranichnaya Diviziya Voisk NKVD`. |
| `SOV_GRD_01` | 89 | `%dya Gvardyeiskaya Strelk. Div.` | `%d-ya Gvardeyskaya Strelkovaya Diviziya` |
| `SOV_CAV_02` | 96 | `%dya Kazachya Kavaleriyskaya Diviziya` (89). Also the Guards cavalry literals under 307, 308 and 313-317, which are not Cossack and live in `SOV_CAV_01` (2026-10-15 audit) | `%d-ya Kazachya Kavaleriyskaya Diviziya` |
| `SOV_PEN_01` | 129 | Plain variant: `%dya Shtrafnaya Chast` (1-4 with a trailing period) | `%d-ya Shtrafnaya Chast` |

Kept: nothing. Every vanilla key these groups do not write is either written by this batch or already identical to the INEX fallback.
- Each write-over sits in a section `# Vanilla keys written again (vanilla group merges in)` at the end of the group's `ordered` block. Group comments are not touched.

## Verified formations & commanders
No name is added: every added entry is its group's fallback text, or, in `SOV_GAR_01`, one of the two designations the group already writes. The file's authored names are unchanged.

## Author confirmation
None.

## Kept on judgment
Expected `-Check SOV` flags after the batch (40, compared with 31 before):
- `PLACEHOLDER_ENTRIES` on `SOV_MEC_01`, `SOV_ARM_01`, `SOV_ARM_02`, `SOV_ARM_04`, `SOV_PAR_01`, `SOV_GAR_01`, `SOV_GRD_01`, `SOV_CAV_02`, `SOV_PEN_01` (9, new): these write their designation over vanilla's merged keys, which is the purpose of the batch. `SOV_ARM_03` stays exempt as the plain half of a pair with `SOV_GTC_01`.
- `PLACEHOLDER_ENTRIES` on `SOV_INF_01`, `SOV_CAV_01`, `SOV_MOT_01`, `SOV_MEC_02`, `SOV_MAR_02`, `SOV_MNT_01`, `SOV_NAT_01`, `SOV_AIR_01` (8, as before).
- `LOW_DEPTH` on 12 groups, `NAME_LONG` on 9, `UNLINKED_MOBILE` on `SOV_MEC_02`, and the file-level `IDENTITY_REPEAT` (as before; 2026-10-15 audit).
- No `Vanilla: ... vanilla name(s)` line remains.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (699). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames SOV -Batch docs/superpowers/plans/2026-10-17-soviet-union-audit.md`. Expect 10 green line(s), each `-0 ~0`: SOV_MEC_01 +26, SOV_ARM_01 +71, SOV_ARM_02 +60, SOV_ARM_03 +71, SOV_ARM_04 +71, SOV_PAR_01 +36, SOV_GAR_01 +50, SOV_GRD_01 +89, SOV_CAV_02 +96, SOV_PEN_01 +129. Expect no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki SOV`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check SOV`. Expect `Check passed`, with the remaining flags matching "Kept on judgment". Its diff line counts distinct names per group, so its `+N` can be smaller than the number of keys written, or equal to it; either is expected. Then run `powershell -File .\build.ps1 -Audit SOV | Select-String 'vanilla name'` and expect no output.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result. Other nations' plans and namelists may show in `git status`: they are implemented in parallel by other agents; leave them alone.
- [x] 5. Ship, on the user's word: commit with the message `Write INEX designations over vanilla's merged SOV entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write INEX designations over vanilla's merged SOV entries"`.

## Docs payload
No docs change beyond -SyncWiki. `wiki/Soviet-Union.md` already describes the merge rule ("a vanilla name that INEX does not replace under its number stays in the game"), and this batch makes that true of the listed groups.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research). Every added entry is its group's `fallback_name`, or, in `SOV_GAR_01`, one of the two designations the group already writes, generated by script. The keys come from vanilla `SOV_names_divisions.txt`: every key the INEX group does not write whose text differs from the group's fallback, minus the keeps under "Rationale". A preview on a scratch copy applied the batch, then showed the flags under "Kept on judgment" and the expected `vanilla name` output of step 3.

## Outcome
Date: 2026-10-17

`-Check SOV` summary: `AUDIT SUMMARY SOV: GROUPS=28 AUTHORED=373/1706 FLAGS=40` (before: `AUTHORED=374/1007 FLAGS=31`). Flags: PLACEHOLDER_ENTRIES x17, LOW_DEPTH x12, NAME_LONG x9, UNLINKED_MOBILE x1, IDENTITY_REPEAT x1. Tests: 434 passed, 0 failed. Diff vs HEAD: 10 group(s) changed, +560 -0 name(s). `Check passed`. `-Audit SOV | Select-String 'vanilla name'` prints nothing.

Deviations: none in the commands or the batch. Observation: AUTHORED went from 374 to 373 while the total went from 1007 to 1706 (+699, the number of keys written). The diff shows no removed name lines (-0), and the plan says authored names are unchanged, so the one-entry drop in the audit's authored count is not explained by this plan. Left for the caller to look at.

## Edit batch
Applied by `build.ps1 -EditNames SOV -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "MEC_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "69=%d-ya Mekhanizirovannaya Diviziya", "81=%d-ya Mekhanizirovannaya Diviziya", "82=%d-ya Mekhanizirovannaya Diviziya", "103=%d-ya Mekhanizirovannaya Diviziya", "109=%d-ya Mekhanizirovannaya Diviziya", "131=%d-ya Mekhanizirovannaya Diviziya", "163=%d-ya Mekhanizirovannaya Diviziya", "185=%d-ya Mekhanizirovannaya Diviziya",
    "198=%d-ya Mekhanizirovannaya Diviziya", "202=%d-ya Mekhanizirovannaya Diviziya", "204=%d-ya Mekhanizirovannaya Diviziya", "205=%d-ya Mekhanizirovannaya Diviziya", "208=%d-ya Mekhanizirovannaya Diviziya", "209=%d-ya Mekhanizirovannaya Diviziya", "210=%d-ya Mekhanizirovannaya Diviziya", "212=%d-ya Mekhanizirovannaya Diviziya",
    "213=%d-ya Mekhanizirovannaya Diviziya", "215=%d-ya Mekhanizirovannaya Diviziya", "216=%d-ya Mekhanizirovannaya Diviziya", "218=%d-ya Mekhanizirovannaya Diviziya", "219=%d-ya Mekhanizirovannaya Diviziya", "220=%d-ya Mekhanizirovannaya Diviziya", "221=%d-ya Mekhanizirovannaya Diviziya", "236=%d-ya Mekhanizirovannaya Diviziya",
    "239=%d-ya Mekhanizirovannaya Diviziya", "240=%d-ya Mekhanizirovannaya Diviziya"
  ] }
```

```json batch
{ "group": "ARM_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d-ya Tankovaya Diviziya", "2=%d-ya Tankovaya Diviziya", "3=%d-ya Tankovaya Diviziya", "4=%d-ya Tankovaya Diviziya", "5=%d-ya Tankovaya Diviziya", "6=%d-ya Tankovaya Diviziya", "7=%d-ya Tankovaya Diviziya", "8=%d-ya Tankovaya Diviziya",
    "9=%d-ya Tankovaya Diviziya", "10=%d-ya Tankovaya Diviziya", "11=%d-ya Tankovaya Diviziya", "12=%d-ya Tankovaya Diviziya", "13=%d-ya Tankovaya Diviziya", "14=%d-ya Tankovaya Diviziya", "15=%d-ya Tankovaya Diviziya", "16=%d-ya Tankovaya Diviziya",
    "17=%d-ya Tankovaya Diviziya", "18=%d-ya Tankovaya Diviziya", "19=%d-ya Tankovaya Diviziya", "20=%d-ya Tankovaya Diviziya", "21=%d-ya Tankovaya Diviziya", "22=%d-ya Tankovaya Diviziya", "23=%d-ya Tankovaya Diviziya", "24=%d-ya Tankovaya Diviziya",
    "25=%d-ya Tankovaya Diviziya", "26=%d-ya Tankovaya Diviziya", "27=%d-ya Tankovaya Diviziya", "28=%d-ya Tankovaya Diviziya", "29=%d-ya Tankovaya Diviziya", "30=%d-ya Tankovaya Diviziya", "31=%d-ya Tankovaya Diviziya", "32=%d-ya Tankovaya Diviziya",
    "33=%d-ya Tankovaya Diviziya", "34=%d-ya Tankovaya Diviziya", "35=%d-ya Tankovaya Diviziya", "36=%d-ya Tankovaya Diviziya", "37=%d-ya Tankovaya Diviziya", "38=%d-ya Tankovaya Diviziya", "39=%d-ya Tankovaya Diviziya", "40=%d-ya Tankovaya Diviziya",
    "41=%d-ya Tankovaya Diviziya", "42=%d-ya Tankovaya Diviziya", "43=%d-ya Tankovaya Diviziya", "44=%d-ya Tankovaya Diviziya", "45=%d-ya Tankovaya Diviziya", "46=%d-ya Tankovaya Diviziya", "47=%d-ya Tankovaya Diviziya", "48=%d-ya Tankovaya Diviziya",
    "49=%d-ya Tankovaya Diviziya", "50=%d-ya Tankovaya Diviziya", "51=%d-ya Tankovaya Diviziya", "52=%d-ya Tankovaya Diviziya", "53=%d-ya Tankovaya Diviziya", "54=%d-ya Tankovaya Diviziya", "55=%d-ya Tankovaya Diviziya", "56=%d-ya Tankovaya Diviziya",
    "57=%d-ya Tankovaya Diviziya", "58=%d-ya Tankovaya Diviziya", "59=%d-ya Tankovaya Diviziya", "60=%d-ya Tankovaya Diviziya", "61=%d-ya Tankovaya Diviziya", "101=%d-ya Tankovaya Diviziya", "102=%d-ya Tankovaya Diviziya", "104=%d-ya Tankovaya Diviziya",
    "105=%d-ya Tankovaya Diviziya", "107=%d-ya Tankovaya Diviziya", "108=%d-ya Tankovaya Diviziya", "109=%d-ya Tankovaya Diviziya", "110=%d-ya Tankovaya Diviziya", "111=%d-ya Tankovaya Diviziya", "112=%d-ya Tankovaya Diviziya"
  ] }
```

```json batch
{ "group": "ARM_02", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "2=%d-y Tankovyy Korpus", "3=%d-y Tankovyy Korpus", "4=%d-y Tankovyy Korpus", "6=%d-y Tankovyy Korpus", "7=%d-y Tankovyy Korpus", "8=%d-y Tankovyy Korpus", "12=%d-y Tankovyy Korpus", "13=%d-y Tankovyy Korpus",
    "14=%d-y Tankovyy Korpus", "15=%d-y Tankovyy Korpus", "16=%d-y Tankovyy Korpus", "17=%d-y Tankovyy Korpus", "21=%d-y Tankovyy Korpus", "22=%d-y Tankovyy Korpus", "24=%d-y Tankovyy Korpus", "25=%d-y Tankovyy Korpus",
    "26=%d-y Tankovyy Korpus", "27=%d-y Tankovyy Korpus", "28=%d-y Tankovyy Korpus", "30=%d-y Tankovyy Korpus", "32=%d-y Tankovyy Korpus", "33=%d-y Tankovyy Korpus", "34=%d-y Tankovyy Korpus", "35=%d-y Tankovyy Korpus",
    "36=%d-y Tankovyy Korpus", "37=%d-y Tankovyy Korpus", "38=%d-y Tankovyy Korpus", "39=%d-y Tankovyy Korpus", "40=%d-y Tankovyy Korpus", "41=%d-y Tankovyy Korpus", "42=%d-y Tankovyy Korpus", "43=%d-y Tankovyy Korpus",
    "44=%d-y Tankovyy Korpus", "45=%d-y Tankovyy Korpus", "46=%d-y Tankovyy Korpus", "47=%d-y Tankovyy Korpus", "48=%d-y Tankovyy Korpus", "49=%d-y Tankovyy Korpus", "50=%d-y Tankovyy Korpus", "51=%d-y Tankovyy Korpus",
    "52=%d-y Tankovyy Korpus", "53=%d-y Tankovyy Korpus", "54=%d-y Tankovyy Korpus", "55=%d-y Tankovyy Korpus", "56=%d-y Tankovyy Korpus", "57=%d-y Tankovyy Korpus", "58=%d-y Tankovyy Korpus", "59=%d-y Tankovyy Korpus",
    "60=%d-y Tankovyy Korpus", "61=%d-y Tankovyy Korpus", "101=%d-y Tankovyy Korpus", "102=%d-y Tankovyy Korpus", "104=%d-y Tankovyy Korpus", "105=%d-y Tankovyy Korpus", "107=%d-y Tankovyy Korpus", "108=%d-y Tankovyy Korpus",
    "109=%d-y Tankovyy Korpus", "110=%d-y Tankovyy Korpus", "111=%d-y Tankovyy Korpus", "112=%d-y Tankovyy Korpus"
  ] }
```

```json batch
{ "group": "ARM_03", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d-y Gvardeyskiy Tankovyy Korpus", "2=%d-y Gvardeyskiy Tankovyy Korpus", "3=%d-y Gvardeyskiy Tankovyy Korpus", "4=%d-y Gvardeyskiy Tankovyy Korpus", "5=%d-y Gvardeyskiy Tankovyy Korpus", "6=%d-y Gvardeyskiy Tankovyy Korpus", "7=%d-y Gvardeyskiy Tankovyy Korpus", "8=%d-y Gvardeyskiy Tankovyy Korpus",
    "9=%d-y Gvardeyskiy Tankovyy Korpus", "10=%d-y Gvardeyskiy Tankovyy Korpus", "11=%d-y Gvardeyskiy Tankovyy Korpus", "12=%d-y Gvardeyskiy Tankovyy Korpus", "13=%d-y Gvardeyskiy Tankovyy Korpus", "14=%d-y Gvardeyskiy Tankovyy Korpus", "15=%d-y Gvardeyskiy Tankovyy Korpus", "16=%d-y Gvardeyskiy Tankovyy Korpus",
    "17=%d-y Gvardeyskiy Tankovyy Korpus", "18=%d-y Gvardeyskiy Tankovyy Korpus", "19=%d-y Gvardeyskiy Tankovyy Korpus", "20=%d-y Gvardeyskiy Tankovyy Korpus", "21=%d-y Gvardeyskiy Tankovyy Korpus", "22=%d-y Gvardeyskiy Tankovyy Korpus", "23=%d-y Gvardeyskiy Tankovyy Korpus", "24=%d-y Gvardeyskiy Tankovyy Korpus",
    "25=%d-y Gvardeyskiy Tankovyy Korpus", "26=%d-y Gvardeyskiy Tankovyy Korpus", "27=%d-y Gvardeyskiy Tankovyy Korpus", "28=%d-y Gvardeyskiy Tankovyy Korpus", "29=%d-y Gvardeyskiy Tankovyy Korpus", "30=%d-y Gvardeyskiy Tankovyy Korpus", "31=%d-y Gvardeyskiy Tankovyy Korpus", "32=%d-y Gvardeyskiy Tankovyy Korpus",
    "33=%d-y Gvardeyskiy Tankovyy Korpus", "34=%d-y Gvardeyskiy Tankovyy Korpus", "35=%d-y Gvardeyskiy Tankovyy Korpus", "36=%d-y Gvardeyskiy Tankovyy Korpus", "37=%d-y Gvardeyskiy Tankovyy Korpus", "38=%d-y Gvardeyskiy Tankovyy Korpus", "39=%d-y Gvardeyskiy Tankovyy Korpus", "40=%d-y Gvardeyskiy Tankovyy Korpus",
    "41=%d-y Gvardeyskiy Tankovyy Korpus", "42=%d-y Gvardeyskiy Tankovyy Korpus", "43=%d-y Gvardeyskiy Tankovyy Korpus", "44=%d-y Gvardeyskiy Tankovyy Korpus", "45=%d-y Gvardeyskiy Tankovyy Korpus", "46=%d-y Gvardeyskiy Tankovyy Korpus", "47=%d-y Gvardeyskiy Tankovyy Korpus", "48=%d-y Gvardeyskiy Tankovyy Korpus",
    "49=%d-y Gvardeyskiy Tankovyy Korpus", "50=%d-y Gvardeyskiy Tankovyy Korpus", "51=%d-y Gvardeyskiy Tankovyy Korpus", "52=%d-y Gvardeyskiy Tankovyy Korpus", "53=%d-y Gvardeyskiy Tankovyy Korpus", "54=%d-y Gvardeyskiy Tankovyy Korpus", "55=%d-y Gvardeyskiy Tankovyy Korpus", "56=%d-y Gvardeyskiy Tankovyy Korpus",
    "57=%d-y Gvardeyskiy Tankovyy Korpus", "58=%d-y Gvardeyskiy Tankovyy Korpus", "59=%d-y Gvardeyskiy Tankovyy Korpus", "60=%d-y Gvardeyskiy Tankovyy Korpus", "61=%d-y Gvardeyskiy Tankovyy Korpus", "101=%d-y Gvardeyskiy Tankovyy Korpus", "102=%d-y Gvardeyskiy Tankovyy Korpus", "104=%d-y Gvardeyskiy Tankovyy Korpus",
    "105=%d-y Gvardeyskiy Tankovyy Korpus", "107=%d-y Gvardeyskiy Tankovyy Korpus", "108=%d-y Gvardeyskiy Tankovyy Korpus", "109=%d-y Gvardeyskiy Tankovyy Korpus", "110=%d-y Gvardeyskiy Tankovyy Korpus", "111=%d-y Gvardeyskiy Tankovyy Korpus", "112=%d-y Gvardeyskiy Tankovyy Korpus"
  ] }
```

```json batch
{ "group": "ARM_04", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d-ya Tankovaya Brigada", "2=%d-ya Tankovaya Brigada", "3=%d-ya Tankovaya Brigada", "4=%d-ya Tankovaya Brigada", "5=%d-ya Tankovaya Brigada", "6=%d-ya Tankovaya Brigada", "7=%d-ya Tankovaya Brigada", "8=%d-ya Tankovaya Brigada",
    "9=%d-ya Tankovaya Brigada", "10=%d-ya Tankovaya Brigada", "11=%d-ya Tankovaya Brigada", "12=%d-ya Tankovaya Brigada", "13=%d-ya Tankovaya Brigada", "14=%d-ya Tankovaya Brigada", "15=%d-ya Tankovaya Brigada", "16=%d-ya Tankovaya Brigada",
    "17=%d-ya Tankovaya Brigada", "18=%d-ya Tankovaya Brigada", "19=%d-ya Tankovaya Brigada", "20=%d-ya Tankovaya Brigada", "21=%d-ya Tankovaya Brigada", "22=%d-ya Tankovaya Brigada", "23=%d-ya Tankovaya Brigada", "24=%d-ya Tankovaya Brigada",
    "25=%d-ya Tankovaya Brigada", "26=%d-ya Tankovaya Brigada", "27=%d-ya Tankovaya Brigada", "28=%d-ya Tankovaya Brigada", "29=%d-ya Tankovaya Brigada", "30=%d-ya Tankovaya Brigada", "31=%d-ya Tankovaya Brigada", "32=%d-ya Tankovaya Brigada",
    "33=%d-ya Tankovaya Brigada", "34=%d-ya Tankovaya Brigada", "35=%d-ya Tankovaya Brigada", "36=%d-ya Tankovaya Brigada", "37=%d-ya Tankovaya Brigada", "38=%d-ya Tankovaya Brigada", "39=%d-ya Tankovaya Brigada", "40=%d-ya Tankovaya Brigada",
    "41=%d-ya Tankovaya Brigada", "42=%d-ya Tankovaya Brigada", "43=%d-ya Tankovaya Brigada", "44=%d-ya Tankovaya Brigada", "45=%d-ya Tankovaya Brigada", "46=%d-ya Tankovaya Brigada", "47=%d-ya Tankovaya Brigada", "48=%d-ya Tankovaya Brigada",
    "49=%d-ya Tankovaya Brigada", "50=%d-ya Tankovaya Brigada", "51=%d-ya Tankovaya Brigada", "52=%d-ya Tankovaya Brigada", "53=%d-ya Tankovaya Brigada", "54=%d-ya Tankovaya Brigada", "55=%d-ya Tankovaya Brigada", "56=%d-ya Tankovaya Brigada",
    "57=%d-ya Tankovaya Brigada", "58=%d-ya Tankovaya Brigada", "59=%d-ya Tankovaya Brigada", "60=%d-ya Tankovaya Brigada", "61=%d-ya Tankovaya Brigada", "101=%d-ya Tankovaya Brigada", "102=%d-ya Tankovaya Brigada", "104=%d-ya Tankovaya Brigada",
    "105=%d-ya Tankovaya Brigada", "107=%d-ya Tankovaya Brigada", "108=%d-ya Tankovaya Brigada", "109=%d-ya Tankovaya Brigada", "110=%d-ya Tankovaya Brigada", "111=%d-ya Tankovaya Brigada", "112=%d-ya Tankovaya Brigada"
  ] }
```

```json batch
{ "group": "PAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d-ya Vozdushno-Desantnaya Diviziya", "2=%d-ya Vozdushno-Desantnaya Diviziya", "3=%d-ya Vozdushno-Desantnaya Diviziya", "4=%d-ya Vozdushno-Desantnaya Diviziya", "5=%d-ya Vozdushno-Desantnaya Diviziya", "6=%d-ya Vozdushno-Desantnaya Diviziya", "7=%d-ya Vozdushno-Desantnaya Diviziya", "8=%d-ya Vozdushno-Desantnaya Diviziya",
    "9=%d-ya Vozdushno-Desantnaya Diviziya", "10=%d-ya Vozdushno-Desantnaya Diviziya", "11=%d-ya Vozdushno-Desantnaya Diviziya", "12=%d-ya Vozdushno-Desantnaya Diviziya", "101=%d-ya Vozdushno-Desantnaya Diviziya", "102=%d-ya Vozdushno-Desantnaya Diviziya", "103=%d-ya Vozdushno-Desantnaya Diviziya", "104=%d-ya Vozdushno-Desantnaya Diviziya",
    "105=%d-ya Vozdushno-Desantnaya Diviziya", "106=%d-ya Vozdushno-Desantnaya Diviziya", "107=%d-ya Vozdushno-Desantnaya Diviziya", "108=%d-ya Vozdushno-Desantnaya Diviziya", "109=%d-ya Vozdushno-Desantnaya Diviziya", "110=%d-ya Vozdushno-Desantnaya Diviziya", "111=%d-ya Vozdushno-Desantnaya Diviziya", "112=%d-ya Vozdushno-Desantnaya Diviziya",
    "113=%d-ya Vozdushno-Desantnaya Diviziya", "114=%d-ya Vozdushno-Desantnaya Diviziya", "115=%d-ya Vozdushno-Desantnaya Diviziya", "116=%d-ya Vozdushno-Desantnaya Diviziya", "121=%d-ya Vozdushno-Desantnaya Diviziya", "131=%d-ya Vozdushno-Desantnaya Diviziya", "176=%d-ya Vozdushno-Desantnaya Diviziya", "198=%d-ya Vozdushno-Desantnaya Diviziya",
    "203=%d-ya Vozdushno-Desantnaya Diviziya", "204=%d-ya Vozdushno-Desantnaya Diviziya", "206=%d-ya Vozdushno-Desantnaya Diviziya", "214=%d-ya Vozdushno-Desantnaya Diviziya"
  ] }
```

```json batch
{ "group": "GAR_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "3=%d-ya Pogranichnaya Diviziya Voisk NKVD", "4=%d-ya Pogranichnaya Diviziya Voisk NKVD", "5=%d-ya Pogranichnaya Diviziya Voisk NKVD", "6=%d-ya Pogranichnaya Diviziya Voisk NKVD", "7=%d-ya Pogranichnaya Diviziya Voisk NKVD", "8=%d-ya Pogranichnaya Diviziya Voisk NKVD", "9=%d-ya Pogranichnaya Diviziya Voisk NKVD", "10=%d-ya Pogranichnaya Diviziya Voisk NKVD",
    "11=%d-ya Pogranichnaya Diviziya Voisk NKVD", "12=%d-ya Pogranichnaya Diviziya Voisk NKVD", "13=%d-ya Pogranichnaya Diviziya Voisk NKVD", "15=%d-ya Pogranichnaya Diviziya Voisk NKVD", "16=%d-ya Pogranichnaya Diviziya Voisk NKVD", "17=%d-ya Pogranichnaya Diviziya Voisk NKVD", "19=%d-ya Pogranichnaya Diviziya Voisk NKVD", "24=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog",
    "25=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "26=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "27=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "28=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "29=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "30=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "31=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "32=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog",
    "33=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "34=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog", "35=%d-ya Pogranichnaya Diviziya Voisk NKVD", "36=%d-ya Pogranichnaya Diviziya Voisk NKVD", "37=%d-ya Pogranichnaya Diviziya Voisk NKVD", "38=%d-ya Pogranichnaya Diviziya Voisk NKVD", "39=%d-ya Pogranichnaya Diviziya Voisk NKVD", "45=%d-ya Pogranichnaya Diviziya Voisk NKVD",
    "46=%d-ya Pogranichnaya Diviziya Voisk NKVD", "47=%d-ya Pogranichnaya Diviziya Voisk NKVD", "48=%d-ya Pogranichnaya Diviziya Voisk NKVD", "49=%d-ya Pogranichnaya Diviziya Voisk NKVD", "50=%d-ya Pogranichnaya Diviziya Voisk NKVD", "51=%d-ya Pogranichnaya Diviziya Voisk NKVD", "52=%d-ya Pogranichnaya Diviziya Voisk NKVD", "53=%d-ya Pogranichnaya Diviziya Voisk NKVD",
    "56=%d-ya Pogranichnaya Diviziya Voisk NKVD", "58=%d-ya Strelkovaya Diviziya Voisk NKVD", "59=%d-ya Strelkovaya Diviziya Voisk NKVD", "60=%d-ya Strelkovaya Diviziya Voisk NKVD", "61=%d-ya Strelkovaya Diviziya Voisk NKVD", "62=%d-ya Strelkovaya Diviziya Voisk NKVD", "63=%d-ya Strelkovaya Diviziya Voisk NKVD", "64=%d-ya Strelkovaya Diviziya Voisk NKVD",
    "65=%d-ya Strelkovaya Diviziya Voisk NKVD", "66=%d-ya Strelkovaya Diviziya Voisk NKVD"
  ] }
```

```json batch
{ "group": "GRD_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "12=%d-ya Gvardeyskaya Strelkovaya Diviziya", "14=%d-ya Gvardeyskaya Strelkovaya Diviziya", "16=%d-ya Gvardeyskaya Strelkovaya Diviziya", "17=%d-ya Gvardeyskaya Strelkovaya Diviziya", "18=%d-ya Gvardeyskaya Strelkovaya Diviziya", "19=%d-ya Gvardeyskaya Strelkovaya Diviziya", "21=%d-ya Gvardeyskaya Strelkovaya Diviziya", "23=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "26=%d-ya Gvardeyskaya Strelkovaya Diviziya", "28=%d-ya Gvardeyskaya Strelkovaya Diviziya", "31=%d-ya Gvardeyskaya Strelkovaya Diviziya", "34=%d-ya Gvardeyskaya Strelkovaya Diviziya", "36=%d-ya Gvardeyskaya Strelkovaya Diviziya", "37=%d-ya Gvardeyskaya Strelkovaya Diviziya", "38=%d-ya Gvardeyskaya Strelkovaya Diviziya", "40=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "42=%d-ya Gvardeyskaya Strelkovaya Diviziya", "44=%d-ya Gvardeyskaya Strelkovaya Diviziya", "46=%d-ya Gvardeyskaya Strelkovaya Diviziya", "47=%d-ya Gvardeyskaya Strelkovaya Diviziya", "48=%d-ya Gvardeyskaya Strelkovaya Diviziya", "49=%d-ya Gvardeyskaya Strelkovaya Diviziya", "52=%d-ya Gvardeyskaya Strelkovaya Diviziya", "54=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "55=%d-ya Gvardeyskaya Strelkovaya Diviziya", "56=%d-ya Gvardeyskaya Strelkovaya Diviziya", "57=%d-ya Gvardeyskaya Strelkovaya Diviziya", "58=%d-ya Gvardeyskaya Strelkovaya Diviziya", "59=%d-ya Gvardeyskaya Strelkovaya Diviziya", "60=%d-ya Gvardeyskaya Strelkovaya Diviziya", "61=%d-ya Gvardeyskaya Strelkovaya Diviziya", "62=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "65=%d-ya Gvardeyskaya Strelkovaya Diviziya", "66=%d-ya Gvardeyskaya Strelkovaya Diviziya", "67=%d-ya Gvardeyskaya Strelkovaya Diviziya", "68=%d-ya Gvardeyskaya Strelkovaya Diviziya", "69=%d-ya Gvardeyskaya Strelkovaya Diviziya", "71=%d-ya Gvardeyskaya Strelkovaya Diviziya", "73=%d-ya Gvardeyskaya Strelkovaya Diviziya", "74=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "76=%d-ya Gvardeyskaya Strelkovaya Diviziya", "77=%d-ya Gvardeyskaya Strelkovaya Diviziya", "78=%d-ya Gvardeyskaya Strelkovaya Diviziya", "79=%d-ya Gvardeyskaya Strelkovaya Diviziya", "80=%d-ya Gvardeyskaya Strelkovaya Diviziya", "81=%d-ya Gvardeyskaya Strelkovaya Diviziya", "83=%d-ya Gvardeyskaya Strelkovaya Diviziya", "84=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "85=%d-ya Gvardeyskaya Strelkovaya Diviziya", "86=%d-ya Gvardeyskaya Strelkovaya Diviziya", "87=%d-ya Gvardeyskaya Strelkovaya Diviziya", "88=%d-ya Gvardeyskaya Strelkovaya Diviziya", "89=%d-ya Gvardeyskaya Strelkovaya Diviziya", "91=%d-ya Gvardeyskaya Strelkovaya Diviziya", "92=%d-ya Gvardeyskaya Strelkovaya Diviziya", "93=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "94=%d-ya Gvardeyskaya Strelkovaya Diviziya", "95=%d-ya Gvardeyskaya Strelkovaya Diviziya", "96=%d-ya Gvardeyskaya Strelkovaya Diviziya", "97=%d-ya Gvardeyskaya Strelkovaya Diviziya", "98=%d-ya Gvardeyskaya Strelkovaya Diviziya", "99=%d-ya Gvardeyskaya Strelkovaya Diviziya", "101=%d-ya Gvardeyskaya Strelkovaya Diviziya", "102=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "103=%d-ya Gvardeyskaya Strelkovaya Diviziya", "104=%d-ya Gvardeyskaya Strelkovaya Diviziya", "105=%d-ya Gvardeyskaya Strelkovaya Diviziya", "106=%d-ya Gvardeyskaya Strelkovaya Diviziya", "107=%d-ya Gvardeyskaya Strelkovaya Diviziya", "108=%d-ya Gvardeyskaya Strelkovaya Diviziya", "109=%d-ya Gvardeyskaya Strelkovaya Diviziya", "110=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "111=%d-ya Gvardeyskaya Strelkovaya Diviziya", "112=%d-ya Gvardeyskaya Strelkovaya Diviziya", "113=%d-ya Gvardeyskaya Strelkovaya Diviziya", "114=%d-ya Gvardeyskaya Strelkovaya Diviziya", "115=%d-ya Gvardeyskaya Strelkovaya Diviziya", "116=%d-ya Gvardeyskaya Strelkovaya Diviziya", "117=%d-ya Gvardeyskaya Strelkovaya Diviziya", "119=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "120=%d-ya Gvardeyskaya Strelkovaya Diviziya", "121=%d-ya Gvardeyskaya Strelkovaya Diviziya", "123=%d-ya Gvardeyskaya Strelkovaya Diviziya", "124=%d-ya Gvardeyskaya Strelkovaya Diviziya", "125=%d-ya Gvardeyskaya Strelkovaya Diviziya", "126=%d-ya Gvardeyskaya Strelkovaya Diviziya", "127=%d-ya Gvardeyskaya Strelkovaya Diviziya", "128=%d-ya Gvardeyskaya Strelkovaya Diviziya",
    "129=%d-ya Gvardeyskaya Strelkovaya Diviziya"
  ] }
```

```json batch
{ "group": "CAV_02", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "9=%d-ya Kazachya Kavaleriyskaya Diviziya", "11=%d-ya Kazachya Kavaleriyskaya Diviziya", "13=%d-ya Kazachya Kavaleriyskaya Diviziya", "14=%d-ya Kazachya Kavaleriyskaya Diviziya", "15=%d-ya Kazachya Kavaleriyskaya Diviziya", "16=%d-ya Kazachya Kavaleriyskaya Diviziya", "17=%d-ya Kazachya Kavaleriyskaya Diviziya", "18=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "19=%d-ya Kazachya Kavaleriyskaya Diviziya", "20=%d-ya Kazachya Kavaleriyskaya Diviziya", "21=%d-ya Kazachya Kavaleriyskaya Diviziya", "22=%d-ya Kazachya Kavaleriyskaya Diviziya", "23=%d-ya Kazachya Kavaleriyskaya Diviziya", "24=%d-ya Kazachya Kavaleriyskaya Diviziya", "25=%d-ya Kazachya Kavaleriyskaya Diviziya", "26=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "27=%d-ya Kazachya Kavaleriyskaya Diviziya", "28=%d-ya Kazachya Kavaleriyskaya Diviziya", "29=%d-ya Kazachya Kavaleriyskaya Diviziya", "30=%d-ya Kazachya Kavaleriyskaya Diviziya", "31=%d-ya Kazachya Kavaleriyskaya Diviziya", "32=%d-ya Kazachya Kavaleriyskaya Diviziya", "33=%d-ya Kazachya Kavaleriyskaya Diviziya", "34=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "35=%d-ya Kazachya Kavaleriyskaya Diviziya", "36=%d-ya Kazachya Kavaleriyskaya Diviziya", "38=%d-ya Kazachya Kavaleriyskaya Diviziya", "40=%d-ya Kazachya Kavaleriyskaya Diviziya", "41=%d-ya Kazachya Kavaleriyskaya Diviziya", "43=%d-ya Kazachya Kavaleriyskaya Diviziya", "44=%d-ya Kazachya Kavaleriyskaya Diviziya", "46=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "47=%d-ya Kazachya Kavaleriyskaya Diviziya", "48=%d-ya Kazachya Kavaleriyskaya Diviziya", "49=%d-ya Kazachya Kavaleriyskaya Diviziya", "50=%d-ya Kazachya Kavaleriyskaya Diviziya", "51=%d-ya Kazachya Kavaleriyskaya Diviziya", "52=%d-ya Kazachya Kavaleriyskaya Diviziya", "53=%d-ya Kazachya Kavaleriyskaya Diviziya", "54=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "55=%d-ya Kazachya Kavaleriyskaya Diviziya", "56=%d-ya Kazachya Kavaleriyskaya Diviziya", "57=%d-ya Kazachya Kavaleriyskaya Diviziya", "59=%d-ya Kazachya Kavaleriyskaya Diviziya", "60=%d-ya Kazachya Kavaleriyskaya Diviziya", "61=%d-ya Kazachya Kavaleriyskaya Diviziya", "62=%d-ya Kazachya Kavaleriyskaya Diviziya", "63=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "64=%d-ya Kazachya Kavaleriyskaya Diviziya", "66=%d-ya Kazachya Kavaleriyskaya Diviziya", "67=%d-ya Kazachya Kavaleriyskaya Diviziya", "68=%d-ya Kazachya Kavaleriyskaya Diviziya", "70=%d-ya Kazachya Kavaleriyskaya Diviziya", "72=%d-ya Kazachya Kavaleriyskaya Diviziya", "73=%d-ya Kazachya Kavaleriyskaya Diviziya", "74=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "75=%d-ya Kazachya Kavaleriyskaya Diviziya", "76=%d-ya Kazachya Kavaleriyskaya Diviziya", "77=%d-ya Kazachya Kavaleriyskaya Diviziya", "78=%d-ya Kazachya Kavaleriyskaya Diviziya", "79=%d-ya Kazachya Kavaleriyskaya Diviziya", "80=%d-ya Kazachya Kavaleriyskaya Diviziya", "81=%d-ya Kazachya Kavaleriyskaya Diviziya", "82=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "83=%d-ya Kazachya Kavaleriyskaya Diviziya", "84=%d-ya Kazachya Kavaleriyskaya Diviziya", "87=%d-ya Kazachya Kavaleriyskaya Diviziya", "91=%d-ya Kazachya Kavaleriyskaya Diviziya", "94=%d-ya Kazachya Kavaleriyskaya Diviziya", "97=%d-ya Kazachya Kavaleriyskaya Diviziya", "98=%d-ya Kazachya Kavaleriyskaya Diviziya", "99=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "100=%d-ya Kazachya Kavaleriyskaya Diviziya", "101=%d-ya Kazachya Kavaleriyskaya Diviziya", "102=%d-ya Kazachya Kavaleriyskaya Diviziya", "103=%d-ya Kazachya Kavaleriyskaya Diviziya", "104=%d-ya Kazachya Kavaleriyskaya Diviziya", "105=%d-ya Kazachya Kavaleriyskaya Diviziya", "106=%d-ya Kazachya Kavaleriyskaya Diviziya", "107=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "108=%d-ya Kazachya Kavaleriyskaya Diviziya", "109=%d-ya Kazachya Kavaleriyskaya Diviziya", "110=%d-ya Kazachya Kavaleriyskaya Diviziya", "111=%d-ya Kazachya Kavaleriyskaya Diviziya", "112=%d-ya Kazachya Kavaleriyskaya Diviziya", "113=%d-ya Kazachya Kavaleriyskaya Diviziya", "114=%d-ya Kazachya Kavaleriyskaya Diviziya", "115=%d-ya Kazachya Kavaleriyskaya Diviziya",
    "116=%d-ya Kazachya Kavaleriyskaya Diviziya", "307=%d-ya Kazachya Kavaleriyskaya Diviziya", "308=%d-ya Kazachya Kavaleriyskaya Diviziya", "313=%d-ya Kazachya Kavaleriyskaya Diviziya", "314=%d-ya Kazachya Kavaleriyskaya Diviziya", "315=%d-ya Kazachya Kavaleriyskaya Diviziya", "316=%d-ya Kazachya Kavaleriyskaya Diviziya", "317=%d-ya Kazachya Kavaleriyskaya Diviziya"
  ] }
```

```json batch
{ "group": "PEN_01", "section": "Vanilla keys written again (vanilla group merges in)",
  "add": [
    "1=%d-ya Shtrafnaya Chast", "2=%d-ya Shtrafnaya Chast", "3=%d-ya Shtrafnaya Chast", "4=%d-ya Shtrafnaya Chast", "5=%d-ya Shtrafnaya Chast", "6=%d-ya Shtrafnaya Chast", "7=%d-ya Shtrafnaya Chast", "8=%d-ya Shtrafnaya Chast",
    "9=%d-ya Shtrafnaya Chast", "10=%d-ya Shtrafnaya Chast", "11=%d-ya Shtrafnaya Chast", "12=%d-ya Shtrafnaya Chast", "13=%d-ya Shtrafnaya Chast", "14=%d-ya Shtrafnaya Chast", "15=%d-ya Shtrafnaya Chast", "16=%d-ya Shtrafnaya Chast",
    "17=%d-ya Shtrafnaya Chast", "18=%d-ya Shtrafnaya Chast", "19=%d-ya Shtrafnaya Chast", "20=%d-ya Shtrafnaya Chast", "21=%d-ya Shtrafnaya Chast", "22=%d-ya Shtrafnaya Chast", "23=%d-ya Shtrafnaya Chast", "24=%d-ya Shtrafnaya Chast",
    "25=%d-ya Shtrafnaya Chast", "26=%d-ya Shtrafnaya Chast", "27=%d-ya Shtrafnaya Chast", "28=%d-ya Shtrafnaya Chast", "29=%d-ya Shtrafnaya Chast", "30=%d-ya Shtrafnaya Chast", "31=%d-ya Shtrafnaya Chast", "32=%d-ya Shtrafnaya Chast",
    "33=%d-ya Shtrafnaya Chast", "34=%d-ya Shtrafnaya Chast", "35=%d-ya Shtrafnaya Chast", "36=%d-ya Shtrafnaya Chast", "37=%d-ya Shtrafnaya Chast", "38=%d-ya Shtrafnaya Chast", "39=%d-ya Shtrafnaya Chast", "40=%d-ya Shtrafnaya Chast",
    "41=%d-ya Shtrafnaya Chast", "42=%d-ya Shtrafnaya Chast", "43=%d-ya Shtrafnaya Chast", "44=%d-ya Shtrafnaya Chast", "45=%d-ya Shtrafnaya Chast", "46=%d-ya Shtrafnaya Chast", "47=%d-ya Shtrafnaya Chast", "48=%d-ya Shtrafnaya Chast",
    "49=%d-ya Shtrafnaya Chast", "50=%d-ya Shtrafnaya Chast", "51=%d-ya Shtrafnaya Chast", "52=%d-ya Shtrafnaya Chast", "53=%d-ya Shtrafnaya Chast", "54=%d-ya Shtrafnaya Chast", "55=%d-ya Shtrafnaya Chast", "56=%d-ya Shtrafnaya Chast",
    "57=%d-ya Shtrafnaya Chast", "58=%d-ya Shtrafnaya Chast", "59=%d-ya Shtrafnaya Chast", "60=%d-ya Shtrafnaya Chast", "61=%d-ya Shtrafnaya Chast", "62=%d-ya Shtrafnaya Chast", "63=%d-ya Shtrafnaya Chast", "64=%d-ya Shtrafnaya Chast",
    "65=%d-ya Shtrafnaya Chast", "66=%d-ya Shtrafnaya Chast", "67=%d-ya Shtrafnaya Chast", "68=%d-ya Shtrafnaya Chast", "69=%d-ya Shtrafnaya Chast", "70=%d-ya Shtrafnaya Chast", "71=%d-ya Shtrafnaya Chast", "72=%d-ya Shtrafnaya Chast",
    "73=%d-ya Shtrafnaya Chast", "74=%d-ya Shtrafnaya Chast", "75=%d-ya Shtrafnaya Chast", "76=%d-ya Shtrafnaya Chast", "77=%d-ya Shtrafnaya Chast", "78=%d-ya Shtrafnaya Chast", "79=%d-ya Shtrafnaya Chast", "80=%d-ya Shtrafnaya Chast",
    "81=%d-ya Shtrafnaya Chast", "82=%d-ya Shtrafnaya Chast", "83=%d-ya Shtrafnaya Chast", "84=%d-ya Shtrafnaya Chast", "85=%d-ya Shtrafnaya Chast", "86=%d-ya Shtrafnaya Chast", "87=%d-ya Shtrafnaya Chast", "88=%d-ya Shtrafnaya Chast",
    "89=%d-ya Shtrafnaya Chast", "90=%d-ya Shtrafnaya Chast", "91=%d-ya Shtrafnaya Chast", "92=%d-ya Shtrafnaya Chast", "93=%d-ya Shtrafnaya Chast", "94=%d-ya Shtrafnaya Chast", "95=%d-ya Shtrafnaya Chast", "96=%d-ya Shtrafnaya Chast",
    "97=%d-ya Shtrafnaya Chast", "98=%d-ya Shtrafnaya Chast", "99=%d-ya Shtrafnaya Chast", "100=%d-ya Shtrafnaya Chast", "101=%d-ya Shtrafnaya Chast", "102=%d-ya Shtrafnaya Chast", "103=%d-ya Shtrafnaya Chast", "104=%d-ya Shtrafnaya Chast",
    "105=%d-ya Shtrafnaya Chast", "106=%d-ya Shtrafnaya Chast", "107=%d-ya Shtrafnaya Chast", "108=%d-ya Shtrafnaya Chast", "109=%d-ya Shtrafnaya Chast", "110=%d-ya Shtrafnaya Chast", "111=%d-ya Shtrafnaya Chast", "112=%d-ya Shtrafnaya Chast",
    "113=%d-ya Shtrafnaya Chast", "114=%d-ya Shtrafnaya Chast", "115=%d-ya Shtrafnaya Chast", "116=%d-ya Shtrafnaya Chast", "117=%d-ya Shtrafnaya Chast", "118=%d-ya Shtrafnaya Chast", "119=%d-ya Shtrafnaya Chast", "120=%d-ya Shtrafnaya Chast",
    "121=%d-ya Shtrafnaya Chast", "122=%d-ya Shtrafnaya Chast", "123=%d-ya Shtrafnaya Chast", "124=%d-ya Shtrafnaya Chast", "125=%d-ya Shtrafnaya Chast", "126=%d-ya Shtrafnaya Chast", "127=%d-ya Shtrafnaya Chast", "128=%d-ya Shtrafnaya Chast",
    "129=%d-ya Shtrafnaya Chast"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| MEC_01 | 7 -> 33 | %d-ya Mekhanizirovannaya Diviziya (x26) | - | - |
| ARM_01 | 0 -> 71 | %d-ya Tankovaya Diviziya (x71) | - | - |
| ARM_02 | 11 -> 71 | %d-y Tankovyy Korpus (x60) | - | - |
| ARM_03 | 0 -> 71 | %d-y Gvardeyskiy Tankovyy Korpus (x71) | - | - |
| ARM_04 | 0 -> 71 | %d-ya Tankovaya Brigada (x71) | - | - |
| PAR_01 | 0 -> 36 | %d-ya Vozdushno-Desantnaya Diviziya (x36) | - | - |
| GAR_01 | 29 -> 79 | - | - | - |
| GRD_01 | 40 -> 129 | - | - | - |
| CAV_02 | 12 -> 108 | %d-ya Kazachya Kavaleriyskaya Diviziya (x96) | - | - |
| PEN_01 | 0 -> 129 | %d-ya Shtrafnaya Chast (x129) | - | - |

Unchanged: INF_01, CAV_01, MOT_01, MEC_02, MAR_01, MAR_02, MNT_01, UR_01, NAT_01, GMC_01, GTC_01, NKVD_01, AIR_01, ART_01, PRT_01, IMP_01, WHT_01, REP_01
<!-- END CHANGE TABLE -->
