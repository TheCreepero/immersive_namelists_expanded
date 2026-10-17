# Japan (JAP) Namelist Audit - 2026-10-17

Status: DONE

File: `common/units/names_divisions/zz_INEX_JAP_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit JAP`)
- AUDIT SUMMARY JAP: GROUPS=32 AUTHORED=470/502 FLAGS=8
- [JAP_PAR_01] flags: LOW_DEPTH
- [JAP_MAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [JAP_GAR_02] flags: LOW_DEPTH
- [JAP_IMB_01] flags: LOW_DEPTH
- [JAP_GUA_01] flags: LOW_DEPTH
- [JAP_MIL_01] flags: UNGATED_POLITICAL
- [JAP_DEM_03] flags: LOW_DEPTH
- Vanilla leftovers (`Vanilla: leaves out` lines, plus a planner comparison of every vanilla key): 10 INEX groups on vanilla tags leave 703 vanilla entries in the game. Vanilla JAP groups merge into INEX's ([NAM-020]), and the 2026-10-01 authoring believed an override replaced the whole group.
- Found on manual review: `-Audit` does not list vanilla stubs in vanilla's own format inside the 1..N run (e.g. `%d Hohei Shidan` at keys 1-168 of `JAP_INF_01`; the stubs of `PAR_01`, `RGR_01`, `BIC_01`) or identities kept in another list (backlog entry, 2026-10-17).

## Scope
Narrow follow-up to the engine-model correction (d47fee0): only vanilla entries that still show in the game under an INEX group (R12), and plain variants whose vanilla text differs from the INEX fallback (R10). Every other flag stays as it is (see "Kept on judgment").

## User decisions
- 2026-10-17, before the audit: narrow scope (R12 plus plain-variant text); default "keep unless wrong" for vanilla names in authored groups; no online research; one Haiku implementer per nation.
- 2026-10-17, checkpoint: proposal approved as reported, including the replacement of `JAP_IMB_01` 201-204 with the numbered form.

## Research
None (user: no online research). Every replacement is the group's own INEX fallback text, so no name is new.

## Rationale
The 2026-10-01 authoring plan meant every JAP override to drop vanilla's lists ("`JAP_IMB_01` is fallback-only ... vanilla's 129 stub entries are dropped"; the plain variants were made fallback-only). Under the merge rule those vanilla entries still show. The fix writes the INEX fallback text over every vanilla key the group does not already write, so each key renders in INEX's form:

| Group | Vanilla keys written again | What still showed |
|:---|---:|:---|
| `JAP_INF_01` (plain) | 168 | vanilla tsūshōgō nicknames (`%d 'Sachi' Hohei Shidan` ...), `Konoe Shidan` at 168, and the `%d Hohei Shidan` form |
| `JAP_MOT_01` (plain) | 162 | nicknames and the `%d Jidoushaka Shidan` form |
| `JAP_MEC_01` (plain) | 162 | nicknames and the `%d Kikaika Shidan` form |
| `JAP_ARM_01` (plain) | 4 | `Sensha Dai-%d 'Taku'/'Geki'/'Taki'/'Hagane' Shidan` (keys 1-4; the identities live on in `JAP_ARM_02`) |
| `JAP_PAR_01` | 12 (9-20) | `%d Kutei Shidan` (no macron, never an IJA form) |
| `JAP_MNT_01` | 14 | `%d 'Chaina' Sangaku Shidan` (27) and `%d Sangaku Shidan` stubs (29, 32-41, 52, 104) |
| `JAP_GAR_01` | 41 | `%d Tokubetsu Keibitai` (form not attested) under historical keys 30-167 |
| `JAP_IMB_01` | 129 | `%d Dokuritsu Konsei Ryodan` stubs (1-136 with gaps) and named 201-204: `Karafuto`, `Konoe`, `2 Konoe`, `Taiwan Dokuritsu Konsei Ryodan` |
| `JAP_RGR_01` | 6 (15-20) | `%d Betsudotai` stubs |
| `JAP_BIC_01` | 5 (16-20) | `%d Ginrinbutai` stubs |

`JAP_CAV_01`, `JAP_MAR_01` and `JAP_MIL_01` already write every vanilla key. `JAP_MIL_02` is left to vanilla on purpose (2026-10-01).
- Each write-over sits in a section `# Vanilla keys written again with the fallback (vanilla group merges in)`, and each group's comment is rewritten to say so. `JAP_INF_01` gets its first comment. The file header is kept.
- `JAP_IMB_01` 201-204: the 2026-10-01 plan made the group numbered-only, and vanilla's forms insert *Dokuritsu* into brigades that were not independent mixed brigades. They are replaced with the numbered form, not kept or respelled (no research).
- Tooling: the plain groups had no `ordered` block, so `-EditNames -Add` refused them. Fixed in 263f5ca (`-Add` creates the block). 5b8f388 makes `-Audit` treat a group with no authored names as a plain variant, so the four plain groups stay exempt from `PLACEHOLDER_ENTRIES`/`LOW_DEPTH`.

## Verified formations & commanders
No name is added: every added entry is the group's existing fallback pattern. The file's authored names are unchanged; see the 2026-10-01 plan.

## Author confirmation
None.

## Kept on judgment
Expected `-Check JAP` flags after the batch (11, compared with 8 before):
- `PLACEHOLDER_ENTRIES` on `JAP_PAR_01`, `JAP_GAR_01`, `JAP_IMB_01` (new), and on `JAP_MAR_01` (as before): these write their fallback over vanilla's keys, which is the purpose of the batch. MAR_01's SNLF designations share a pattern by design (2026-10-01).
- `LOW_DEPTH` on `JAP_PAR_01`, `JAP_MAR_01`, `JAP_GAR_02`, `JAP_IMB_01`, `JAP_GUA_01`, `JAP_DEM_03`: unchanged from 2026-10-01 (small arms; IMB numbered-only by design).
- `UNGATED_POLITICAL` on `JAP_MIL_01`: focus-referenced by two paths, so it cannot be gated (2026-10-01).
- No `Vanilla: leaves out` line remains.
- `error.log` gets one `Adding a duplicate ORDERED division name` line per written key (703). This is expected under CLAUDE.md §6.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames JAP -Batch docs/superpowers/plans/2026-10-17-japan-audit.md`. Expect 10 green `Edited JAP_...` lines: INF_01 +168, MOT_01 +162, MEC_01 +162, ARM_01 +4, PAR_01 +12, MNT_01 +14, GAR_01 +41, IMB_01 +129, RGR_01 +6, BIC_01 +5, each with `[Comment]`, and no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki JAP`. No docs edits beyond what it writes (see "Docs payload").
- [x] 3. `powershell -File .\build.ps1 -Check JAP`. Expect `Check passed`, with the remaining flags matching "Kept on judgment" (11 flags). Then run `powershell -File .\build.ps1 -Audit JAP | Select-String 'Vanilla:'` and expect no `leaves out` line.
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 5. Ship, on the user's word: commit with the message `Write the INEX fallback over vanilla's merged JAP entries`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Write the INEX fallback over vanilla's merged JAP entries"`.

## Docs payload
No docs change beyond -SyncWiki. The wiki's "Fallback-only (plain) list: every division is numbered ..." lines and "INEX replaces the vanilla Japanese lists" describe the file after this batch.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: no authored name is added, and the user ruled out online research): every added entry is its group's own `fallback_name`, copied by script from the file. No extrapolated name is added. The keys come from vanilla 1.19 `JAP_names_divisions.txt`: every key the INEX group does not already write. A preview on a scratch copy showed no `Vanilla: leaves out` line and the 11 flags under "Kept on judgment".

## Outcome
Date: 2026-10-17

-Check summary: `Check JAP:` Validate OK; Tests 434 Passed, 0 Failed, 0 Skipped; `AUDIT SUMMARY JAP: GROUPS=32 AUTHORED=470/1205 FLAGS=11`; Flags: LOW_DEPTH x6, PLACEHOLDER_ENTRIES x4, UNGATED_POLITICAL x1; `Check passed`. The 11 flags match "Kept on judgment". No `Docs:` warning. `-Audit JAP | Select-String 'Vanilla:'` printed no line.

Batch: all 10 groups applied (+703 entries, -0, ~0), each with `[Comment]`, no `[ERROR]`.

Deviations: none. (`-Check` refreshed the change table in this plan, "10 changed group(s) vs HEAD; 1 TODO section(s) left", as the tool does.)

## Edit batch
Applied by `build.ps1 -EditNames JAP -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{ "group": "INF_01", "comment": "Plain variant on vanilla's tag. Vanilla JAP_INF_01 merges into this group, so every vanilla key is written\\nagain with the plain fallback: vanilla's nicknames and its '%d Hohei Shidan' form do not show. Nicknames: JAP_INF_02.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "1=Dai-%d Shidan", "2=Dai-%d Shidan", "3=Dai-%d Shidan", "4=Dai-%d Shidan", "5=Dai-%d Shidan", "6=Dai-%d Shidan", "7=Dai-%d Shidan", "8=Dai-%d Shidan",
    "9=Dai-%d Shidan", "10=Dai-%d Shidan", "11=Dai-%d Shidan", "12=Dai-%d Shidan", "13=Dai-%d Shidan", "14=Dai-%d Shidan", "15=Dai-%d Shidan", "16=Dai-%d Shidan",
    "17=Dai-%d Shidan", "18=Dai-%d Shidan", "19=Dai-%d Shidan", "20=Dai-%d Shidan", "21=Dai-%d Shidan", "22=Dai-%d Shidan", "23=Dai-%d Shidan", "24=Dai-%d Shidan",
    "25=Dai-%d Shidan", "26=Dai-%d Shidan", "27=Dai-%d Shidan", "28=Dai-%d Shidan", "29=Dai-%d Shidan", "30=Dai-%d Shidan", "31=Dai-%d Shidan", "32=Dai-%d Shidan",
    "33=Dai-%d Shidan", "34=Dai-%d Shidan", "35=Dai-%d Shidan", "36=Dai-%d Shidan", "37=Dai-%d Shidan", "38=Dai-%d Shidan", "39=Dai-%d Shidan", "40=Dai-%d Shidan",
    "41=Dai-%d Shidan", "42=Dai-%d Shidan", "43=Dai-%d Shidan", "44=Dai-%d Shidan", "46=Dai-%d Shidan", "47=Dai-%d Shidan", "48=Dai-%d Shidan", "49=Dai-%d Shidan",
    "50=Dai-%d Shidan", "51=Dai-%d Shidan", "52=Dai-%d Shidan", "53=Dai-%d Shidan", "54=Dai-%d Shidan", "55=Dai-%d Shidan", "56=Dai-%d Shidan", "57=Dai-%d Shidan",
    "58=Dai-%d Shidan", "59=Dai-%d Shidan", "60=Dai-%d Shidan", "61=Dai-%d Shidan", "62=Dai-%d Shidan", "63=Dai-%d Shidan", "64=Dai-%d Shidan", "65=Dai-%d Shidan",
    "66=Dai-%d Shidan", "68=Dai-%d Shidan", "69=Dai-%d Shidan", "70=Dai-%d Shidan", "71=Dai-%d Shidan", "72=Dai-%d Shidan", "73=Dai-%d Shidan", "77=Dai-%d Shidan",
    "79=Dai-%d Shidan", "81=Dai-%d Shidan", "84=Dai-%d Shidan", "86=Dai-%d Shidan", "88=Dai-%d Shidan", "89=Dai-%d Shidan", "91=Dai-%d Shidan", "93=Dai-%d Shidan",
    "94=Dai-%d Shidan", "96=Dai-%d Shidan", "100=Dai-%d Shidan", "101=Dai-%d Shidan", "102=Dai-%d Shidan", "103=Dai-%d Shidan", "104=Dai-%d Shidan", "105=Dai-%d Shidan",
    "106=Dai-%d Shidan", "107=Dai-%d Shidan", "108=Dai-%d Shidan", "109=Dai-%d Shidan", "110=Dai-%d Shidan", "111=Dai-%d Shidan", "112=Dai-%d Shidan", "114=Dai-%d Shidan",
    "115=Dai-%d Shidan", "116=Dai-%d Shidan", "117=Dai-%d Shidan", "118=Dai-%d Shidan", "119=Dai-%d Shidan", "120=Dai-%d Shidan", "121=Dai-%d Shidan", "122=Dai-%d Shidan",
    "123=Dai-%d Shidan", "124=Dai-%d Shidan", "125=Dai-%d Shidan", "127=Dai-%d Shidan", "128=Dai-%d Shidan", "129=Dai-%d Shidan", "130=Dai-%d Shidan", "131=Dai-%d Shidan",
    "132=Dai-%d Shidan", "133=Dai-%d Shidan", "134=Dai-%d Shidan", "135=Dai-%d Shidan", "136=Dai-%d Shidan", "137=Dai-%d Shidan", "138=Dai-%d Shidan", "139=Dai-%d Shidan",
    "140=Dai-%d Shidan", "142=Dai-%d Shidan", "143=Dai-%d Shidan", "144=Dai-%d Shidan", "145=Dai-%d Shidan", "146=Dai-%d Shidan", "147=Dai-%d Shidan", "148=Dai-%d Shidan",
    "149=Dai-%d Shidan", "150=Dai-%d Shidan", "151=Dai-%d Shidan", "152=Dai-%d Shidan", "153=Dai-%d Shidan", "154=Dai-%d Shidan", "155=Dai-%d Shidan", "156=Dai-%d Shidan",
    "157=Dai-%d Shidan", "158=Dai-%d Shidan", "160=Dai-%d Shidan", "161=Dai-%d Shidan", "168=Dai-%d Shidan", "201=Dai-%d Shidan", "202=Dai-%d Shidan", "205=Dai-%d Shidan",
    "206=Dai-%d Shidan", "209=Dai-%d Shidan", "212=Dai-%d Shidan", "214=Dai-%d Shidan", "216=Dai-%d Shidan", "221=Dai-%d Shidan", "222=Dai-%d Shidan", "224=Dai-%d Shidan",
    "225=Dai-%d Shidan", "229=Dai-%d Shidan", "230=Dai-%d Shidan", "231=Dai-%d Shidan", "234=Dai-%d Shidan", "303=Dai-%d Shidan", "308=Dai-%d Shidan", "312=Dai-%d Shidan",
    "316=Dai-%d Shidan", "320=Dai-%d Shidan", "321=Dai-%d Shidan", "322=Dai-%d Shidan", "344=Dai-%d Shidan", "351=Dai-%d Shidan", "354=Dai-%d Shidan", "355=Dai-%d Shidan"
  ] }
```

```json batch
{ "group": "MOT_01", "comment": "Plain variant; vanilla JAP_MOT_01 merges in, so every vanilla key is written again with the plain form.\\nThe IJA fielded no motorized divisions: the form follows its branch-first pattern (extrapolated).\\nAnchor of the mobile family.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "1=Jidōsha Dai-%d Shidan", "2=Jidōsha Dai-%d Shidan", "3=Jidōsha Dai-%d Shidan", "4=Jidōsha Dai-%d Shidan", "5=Jidōsha Dai-%d Shidan", "6=Jidōsha Dai-%d Shidan", "7=Jidōsha Dai-%d Shidan", "8=Jidōsha Dai-%d Shidan",
    "9=Jidōsha Dai-%d Shidan", "10=Jidōsha Dai-%d Shidan", "11=Jidōsha Dai-%d Shidan", "12=Jidōsha Dai-%d Shidan", "13=Jidōsha Dai-%d Shidan", "14=Jidōsha Dai-%d Shidan", "15=Jidōsha Dai-%d Shidan", "16=Jidōsha Dai-%d Shidan",
    "17=Jidōsha Dai-%d Shidan", "18=Jidōsha Dai-%d Shidan", "19=Jidōsha Dai-%d Shidan", "20=Jidōsha Dai-%d Shidan", "21=Jidōsha Dai-%d Shidan", "22=Jidōsha Dai-%d Shidan", "23=Jidōsha Dai-%d Shidan", "24=Jidōsha Dai-%d Shidan",
    "25=Jidōsha Dai-%d Shidan", "26=Jidōsha Dai-%d Shidan", "27=Jidōsha Dai-%d Shidan", "28=Jidōsha Dai-%d Shidan", "29=Jidōsha Dai-%d Shidan", "30=Jidōsha Dai-%d Shidan", "31=Jidōsha Dai-%d Shidan", "32=Jidōsha Dai-%d Shidan",
    "33=Jidōsha Dai-%d Shidan", "34=Jidōsha Dai-%d Shidan", "35=Jidōsha Dai-%d Shidan", "36=Jidōsha Dai-%d Shidan", "37=Jidōsha Dai-%d Shidan", "38=Jidōsha Dai-%d Shidan", "39=Jidōsha Dai-%d Shidan", "40=Jidōsha Dai-%d Shidan",
    "41=Jidōsha Dai-%d Shidan", "42=Jidōsha Dai-%d Shidan", "43=Jidōsha Dai-%d Shidan", "44=Jidōsha Dai-%d Shidan", "46=Jidōsha Dai-%d Shidan", "47=Jidōsha Dai-%d Shidan", "48=Jidōsha Dai-%d Shidan", "49=Jidōsha Dai-%d Shidan",
    "50=Jidōsha Dai-%d Shidan", "51=Jidōsha Dai-%d Shidan", "52=Jidōsha Dai-%d Shidan", "53=Jidōsha Dai-%d Shidan", "54=Jidōsha Dai-%d Shidan", "55=Jidōsha Dai-%d Shidan", "56=Jidōsha Dai-%d Shidan", "57=Jidōsha Dai-%d Shidan",
    "58=Jidōsha Dai-%d Shidan", "59=Jidōsha Dai-%d Shidan", "60=Jidōsha Dai-%d Shidan", "61=Jidōsha Dai-%d Shidan", "62=Jidōsha Dai-%d Shidan", "63=Jidōsha Dai-%d Shidan", "64=Jidōsha Dai-%d Shidan", "65=Jidōsha Dai-%d Shidan",
    "66=Jidōsha Dai-%d Shidan", "68=Jidōsha Dai-%d Shidan", "69=Jidōsha Dai-%d Shidan", "70=Jidōsha Dai-%d Shidan", "71=Jidōsha Dai-%d Shidan", "72=Jidōsha Dai-%d Shidan", "73=Jidōsha Dai-%d Shidan", "77=Jidōsha Dai-%d Shidan",
    "79=Jidōsha Dai-%d Shidan", "81=Jidōsha Dai-%d Shidan", "84=Jidōsha Dai-%d Shidan", "86=Jidōsha Dai-%d Shidan", "88=Jidōsha Dai-%d Shidan", "89=Jidōsha Dai-%d Shidan", "91=Jidōsha Dai-%d Shidan", "93=Jidōsha Dai-%d Shidan",
    "94=Jidōsha Dai-%d Shidan", "96=Jidōsha Dai-%d Shidan", "100=Jidōsha Dai-%d Shidan", "101=Jidōsha Dai-%d Shidan", "102=Jidōsha Dai-%d Shidan", "103=Jidōsha Dai-%d Shidan", "104=Jidōsha Dai-%d Shidan", "105=Jidōsha Dai-%d Shidan",
    "106=Jidōsha Dai-%d Shidan", "107=Jidōsha Dai-%d Shidan", "108=Jidōsha Dai-%d Shidan", "109=Jidōsha Dai-%d Shidan", "110=Jidōsha Dai-%d Shidan", "111=Jidōsha Dai-%d Shidan", "112=Jidōsha Dai-%d Shidan", "114=Jidōsha Dai-%d Shidan",
    "115=Jidōsha Dai-%d Shidan", "116=Jidōsha Dai-%d Shidan", "117=Jidōsha Dai-%d Shidan", "118=Jidōsha Dai-%d Shidan", "119=Jidōsha Dai-%d Shidan", "120=Jidōsha Dai-%d Shidan", "121=Jidōsha Dai-%d Shidan", "122=Jidōsha Dai-%d Shidan",
    "123=Jidōsha Dai-%d Shidan", "124=Jidōsha Dai-%d Shidan", "125=Jidōsha Dai-%d Shidan", "127=Jidōsha Dai-%d Shidan", "128=Jidōsha Dai-%d Shidan", "129=Jidōsha Dai-%d Shidan", "130=Jidōsha Dai-%d Shidan", "131=Jidōsha Dai-%d Shidan",
    "132=Jidōsha Dai-%d Shidan", "133=Jidōsha Dai-%d Shidan", "134=Jidōsha Dai-%d Shidan", "135=Jidōsha Dai-%d Shidan", "136=Jidōsha Dai-%d Shidan", "137=Jidōsha Dai-%d Shidan", "138=Jidōsha Dai-%d Shidan", "139=Jidōsha Dai-%d Shidan",
    "140=Jidōsha Dai-%d Shidan", "142=Jidōsha Dai-%d Shidan", "143=Jidōsha Dai-%d Shidan", "144=Jidōsha Dai-%d Shidan", "145=Jidōsha Dai-%d Shidan", "146=Jidōsha Dai-%d Shidan", "147=Jidōsha Dai-%d Shidan", "148=Jidōsha Dai-%d Shidan",
    "149=Jidōsha Dai-%d Shidan", "150=Jidōsha Dai-%d Shidan", "151=Jidōsha Dai-%d Shidan", "152=Jidōsha Dai-%d Shidan", "153=Jidōsha Dai-%d Shidan", "154=Jidōsha Dai-%d Shidan", "155=Jidōsha Dai-%d Shidan", "156=Jidōsha Dai-%d Shidan",
    "157=Jidōsha Dai-%d Shidan", "158=Jidōsha Dai-%d Shidan", "160=Jidōsha Dai-%d Shidan", "161=Jidōsha Dai-%d Shidan", "167=Jidōsha Dai-%d Shidan", "201=Jidōsha Dai-%d Shidan", "202=Jidōsha Dai-%d Shidan", "205=Jidōsha Dai-%d Shidan",
    "206=Jidōsha Dai-%d Shidan", "209=Jidōsha Dai-%d Shidan", "212=Jidōsha Dai-%d Shidan", "214=Jidōsha Dai-%d Shidan", "216=Jidōsha Dai-%d Shidan", "221=Jidōsha Dai-%d Shidan", "222=Jidōsha Dai-%d Shidan", "224=Jidōsha Dai-%d Shidan",
    "225=Jidōsha Dai-%d Shidan", "229=Jidōsha Dai-%d Shidan", "230=Jidōsha Dai-%d Shidan", "231=Jidōsha Dai-%d Shidan", "234=Jidōsha Dai-%d Shidan", "303=Jidōsha Dai-%d Shidan", "308=Jidōsha Dai-%d Shidan", "312=Jidōsha Dai-%d Shidan",
    "316=Jidōsha Dai-%d Shidan", "320=Jidōsha Dai-%d Shidan"
  ] }
```

```json batch
{ "group": "MEC_01", "comment": "Plain variant; vanilla JAP_MEC_01 merges in, so every vanilla key is written again with the plain form.\\nKikaika (mechanization) is period vocabulary; the division form is extrapolated from the 1930s Kwantung\\nmechanized brigade experiment.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "1=Kikaika Dai-%d Shidan", "2=Kikaika Dai-%d Shidan", "3=Kikaika Dai-%d Shidan", "4=Kikaika Dai-%d Shidan", "5=Kikaika Dai-%d Shidan", "6=Kikaika Dai-%d Shidan", "7=Kikaika Dai-%d Shidan", "8=Kikaika Dai-%d Shidan",
    "9=Kikaika Dai-%d Shidan", "10=Kikaika Dai-%d Shidan", "11=Kikaika Dai-%d Shidan", "12=Kikaika Dai-%d Shidan", "13=Kikaika Dai-%d Shidan", "14=Kikaika Dai-%d Shidan", "15=Kikaika Dai-%d Shidan", "16=Kikaika Dai-%d Shidan",
    "17=Kikaika Dai-%d Shidan", "18=Kikaika Dai-%d Shidan", "19=Kikaika Dai-%d Shidan", "20=Kikaika Dai-%d Shidan", "21=Kikaika Dai-%d Shidan", "22=Kikaika Dai-%d Shidan", "23=Kikaika Dai-%d Shidan", "24=Kikaika Dai-%d Shidan",
    "25=Kikaika Dai-%d Shidan", "26=Kikaika Dai-%d Shidan", "27=Kikaika Dai-%d Shidan", "28=Kikaika Dai-%d Shidan", "29=Kikaika Dai-%d Shidan", "30=Kikaika Dai-%d Shidan", "31=Kikaika Dai-%d Shidan", "32=Kikaika Dai-%d Shidan",
    "33=Kikaika Dai-%d Shidan", "34=Kikaika Dai-%d Shidan", "35=Kikaika Dai-%d Shidan", "36=Kikaika Dai-%d Shidan", "37=Kikaika Dai-%d Shidan", "38=Kikaika Dai-%d Shidan", "39=Kikaika Dai-%d Shidan", "40=Kikaika Dai-%d Shidan",
    "41=Kikaika Dai-%d Shidan", "42=Kikaika Dai-%d Shidan", "43=Kikaika Dai-%d Shidan", "44=Kikaika Dai-%d Shidan", "46=Kikaika Dai-%d Shidan", "47=Kikaika Dai-%d Shidan", "48=Kikaika Dai-%d Shidan", "49=Kikaika Dai-%d Shidan",
    "50=Kikaika Dai-%d Shidan", "51=Kikaika Dai-%d Shidan", "52=Kikaika Dai-%d Shidan", "53=Kikaika Dai-%d Shidan", "54=Kikaika Dai-%d Shidan", "55=Kikaika Dai-%d Shidan", "56=Kikaika Dai-%d Shidan", "57=Kikaika Dai-%d Shidan",
    "58=Kikaika Dai-%d Shidan", "59=Kikaika Dai-%d Shidan", "60=Kikaika Dai-%d Shidan", "61=Kikaika Dai-%d Shidan", "62=Kikaika Dai-%d Shidan", "63=Kikaika Dai-%d Shidan", "64=Kikaika Dai-%d Shidan", "65=Kikaika Dai-%d Shidan",
    "66=Kikaika Dai-%d Shidan", "68=Kikaika Dai-%d Shidan", "69=Kikaika Dai-%d Shidan", "70=Kikaika Dai-%d Shidan", "71=Kikaika Dai-%d Shidan", "72=Kikaika Dai-%d Shidan", "73=Kikaika Dai-%d Shidan", "77=Kikaika Dai-%d Shidan",
    "79=Kikaika Dai-%d Shidan", "81=Kikaika Dai-%d Shidan", "84=Kikaika Dai-%d Shidan", "86=Kikaika Dai-%d Shidan", "88=Kikaika Dai-%d Shidan", "89=Kikaika Dai-%d Shidan", "91=Kikaika Dai-%d Shidan", "93=Kikaika Dai-%d Shidan",
    "94=Kikaika Dai-%d Shidan", "96=Kikaika Dai-%d Shidan", "100=Kikaika Dai-%d Shidan", "101=Kikaika Dai-%d Shidan", "102=Kikaika Dai-%d Shidan", "103=Kikaika Dai-%d Shidan", "104=Kikaika Dai-%d Shidan", "105=Kikaika Dai-%d Shidan",
    "106=Kikaika Dai-%d Shidan", "107=Kikaika Dai-%d Shidan", "108=Kikaika Dai-%d Shidan", "109=Kikaika Dai-%d Shidan", "110=Kikaika Dai-%d Shidan", "111=Kikaika Dai-%d Shidan", "112=Kikaika Dai-%d Shidan", "114=Kikaika Dai-%d Shidan",
    "115=Kikaika Dai-%d Shidan", "116=Kikaika Dai-%d Shidan", "117=Kikaika Dai-%d Shidan", "118=Kikaika Dai-%d Shidan", "119=Kikaika Dai-%d Shidan", "120=Kikaika Dai-%d Shidan", "121=Kikaika Dai-%d Shidan", "122=Kikaika Dai-%d Shidan",
    "123=Kikaika Dai-%d Shidan", "124=Kikaika Dai-%d Shidan", "125=Kikaika Dai-%d Shidan", "127=Kikaika Dai-%d Shidan", "128=Kikaika Dai-%d Shidan", "129=Kikaika Dai-%d Shidan", "130=Kikaika Dai-%d Shidan", "131=Kikaika Dai-%d Shidan",
    "132=Kikaika Dai-%d Shidan", "133=Kikaika Dai-%d Shidan", "134=Kikaika Dai-%d Shidan", "135=Kikaika Dai-%d Shidan", "136=Kikaika Dai-%d Shidan", "137=Kikaika Dai-%d Shidan", "138=Kikaika Dai-%d Shidan", "139=Kikaika Dai-%d Shidan",
    "140=Kikaika Dai-%d Shidan", "142=Kikaika Dai-%d Shidan", "143=Kikaika Dai-%d Shidan", "144=Kikaika Dai-%d Shidan", "145=Kikaika Dai-%d Shidan", "146=Kikaika Dai-%d Shidan", "147=Kikaika Dai-%d Shidan", "148=Kikaika Dai-%d Shidan",
    "149=Kikaika Dai-%d Shidan", "150=Kikaika Dai-%d Shidan", "151=Kikaika Dai-%d Shidan", "152=Kikaika Dai-%d Shidan", "153=Kikaika Dai-%d Shidan", "154=Kikaika Dai-%d Shidan", "155=Kikaika Dai-%d Shidan", "156=Kikaika Dai-%d Shidan",
    "157=Kikaika Dai-%d Shidan", "158=Kikaika Dai-%d Shidan", "160=Kikaika Dai-%d Shidan", "161=Kikaika Dai-%d Shidan", "167=Kikaika Dai-%d Shidan", "201=Kikaika Dai-%d Shidan", "202=Kikaika Dai-%d Shidan", "205=Kikaika Dai-%d Shidan",
    "206=Kikaika Dai-%d Shidan", "209=Kikaika Dai-%d Shidan", "212=Kikaika Dai-%d Shidan", "214=Kikaika Dai-%d Shidan", "216=Kikaika Dai-%d Shidan", "221=Kikaika Dai-%d Shidan", "222=Kikaika Dai-%d Shidan", "224=Kikaika Dai-%d Shidan",
    "225=Kikaika Dai-%d Shidan", "229=Kikaika Dai-%d Shidan", "230=Kikaika Dai-%d Shidan", "231=Kikaika Dai-%d Shidan", "234=Kikaika Dai-%d Shidan", "303=Kikaika Dai-%d Shidan", "308=Kikaika Dai-%d Shidan", "312=Kikaika Dai-%d Shidan",
    "316=Kikaika Dai-%d Shidan", "320=Kikaika Dai-%d Shidan"
  ] }
```

```json batch
{ "group": "ARM_01", "comment": "Plain variant; vanilla JAP_ARM_01 merges in, so keys 1-4 are written again (vanilla's nicknames live on in\\nJAP_ARM_02). The branch comes first: Sensha Dai-N Shidan. Tank-division numbering is independent of the\\ninfantry family.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "1=Sensha Dai-%d Shidan", "2=Sensha Dai-%d Shidan", "3=Sensha Dai-%d Shidan", "4=Sensha Dai-%d Shidan"
  ] }
```

```json batch
{ "group": "PAR_01", "comment": "Vanilla JAP_PAR_01 merges in; its '%d Kutei Shidan' stubs (keys 9-20, no macron, never an IJA form) are\\nwritten again with the fallback. The Army's airborne arm was the Teishin Shudan (Raiding Group); Teishin = raiding.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "9=Teishin Dai-%d Dan", "10=Teishin Dai-%d Dan", "11=Teishin Dai-%d Dan", "12=Teishin Dai-%d Dan", "13=Teishin Dai-%d Dan", "14=Teishin Dai-%d Dan", "15=Teishin Dai-%d Dan", "16=Teishin Dai-%d Dan",
    "17=Teishin Dai-%d Dan", "18=Teishin Dai-%d Dan", "19=Teishin Dai-%d Dan", "20=Teishin Dai-%d Dan"
  ] }
```

```json batch
{ "group": "MNT_01", "comment": "Vanilla JAP_MNT_01 merges in; the vanilla keys INEX does not name are written again with the fallback.\\nThe IJA fielded no mountain divisions; the names are extrapolated from the cold-region garrison cities\\n(7th Asahikawa, 8th Hirosaki, 2nd Sendai) and the Japanese Alps.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "27=Sangaku Dai-%d Shidan", "29=Sangaku Dai-%d Shidan", "32=Sangaku Dai-%d Shidan", "33=Sangaku Dai-%d Shidan", "34=Sangaku Dai-%d Shidan", "35=Sangaku Dai-%d Shidan", "36=Sangaku Dai-%d Shidan", "37=Sangaku Dai-%d Shidan",
    "38=Sangaku Dai-%d Shidan", "39=Sangaku Dai-%d Shidan", "40=Sangaku Dai-%d Shidan", "41=Sangaku Dai-%d Shidan", "52=Sangaku Dai-%d Shidan", "104=Sangaku Dai-%d Shidan"
  ] }
```

```json batch
{ "group": "GAR_01", "comment": "Vanilla JAP_GAR_01 merges in; its 'Tokubetsu Keibitai' keys (form not attested) are written again with the\\nfallback. Shubitai = garrison unit; the regional list follows the army districts and overseas commands\\n(extrapolated).", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "30=Dai-%d Shubitai", "31=Dai-%d Shubitai", "46=Dai-%d Shubitai", "47=Dai-%d Shubitai", "49=Dai-%d Shubitai", "61=Dai-%d Shubitai", "62=Dai-%d Shubitai", "63=Dai-%d Shubitai",
    "64=Dai-%d Shubitai", "65=Dai-%d Shubitai", "66=Dai-%d Shubitai", "68=Dai-%d Shubitai", "69=Dai-%d Shubitai", "70=Dai-%d Shubitai", "71=Dai-%d Shubitai", "72=Dai-%d Shubitai",
    "73=Dai-%d Shubitai", "77=Dai-%d Shubitai", "81=Dai-%d Shubitai", "84=Dai-%d Shubitai", "86=Dai-%d Shubitai", "91=Dai-%d Shubitai", "93=Dai-%d Shubitai", "94=Dai-%d Shubitai",
    "96=Dai-%d Shubitai", "100=Dai-%d Shubitai", "102=Dai-%d Shubitai", "103=Dai-%d Shubitai", "105=Dai-%d Shubitai", "107=Dai-%d Shubitai", "108=Dai-%d Shubitai", "109=Dai-%d Shubitai",
    "111=Dai-%d Shubitai", "112=Dai-%d Shubitai", "114=Dai-%d Shubitai", "115=Dai-%d Shubitai", "117=Dai-%d Shubitai", "118=Dai-%d Shubitai", "119=Dai-%d Shubitai", "120=Dai-%d Shubitai",
    "167=Dai-%d Shubitai"
  ] }
```

```json batch
{ "group": "IMB_01", "comment": "Vanilla JAP_IMB_01 merges in. Dokuritsu Konsei Ryodan were numbered only (126 brigades, 1937-45), so every\\nvanilla key, its named 201-204 included, is written again with the historical numbered form.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "1=Dokuritsu Konsei Dai-%d Ryodan", "2=Dokuritsu Konsei Dai-%d Ryodan", "3=Dokuritsu Konsei Dai-%d Ryodan", "4=Dokuritsu Konsei Dai-%d Ryodan", "5=Dokuritsu Konsei Dai-%d Ryodan", "6=Dokuritsu Konsei Dai-%d Ryodan", "7=Dokuritsu Konsei Dai-%d Ryodan", "8=Dokuritsu Konsei Dai-%d Ryodan",
    "9=Dokuritsu Konsei Dai-%d Ryodan", "10=Dokuritsu Konsei Dai-%d Ryodan", "11=Dokuritsu Konsei Dai-%d Ryodan", "12=Dokuritsu Konsei Dai-%d Ryodan", "13=Dokuritsu Konsei Dai-%d Ryodan", "14=Dokuritsu Konsei Dai-%d Ryodan", "15=Dokuritsu Konsei Dai-%d Ryodan", "16=Dokuritsu Konsei Dai-%d Ryodan",
    "17=Dokuritsu Konsei Dai-%d Ryodan", "18=Dokuritsu Konsei Dai-%d Ryodan", "19=Dokuritsu Konsei Dai-%d Ryodan", "20=Dokuritsu Konsei Dai-%d Ryodan", "21=Dokuritsu Konsei Dai-%d Ryodan", "22=Dokuritsu Konsei Dai-%d Ryodan", "23=Dokuritsu Konsei Dai-%d Ryodan", "24=Dokuritsu Konsei Dai-%d Ryodan",
    "25=Dokuritsu Konsei Dai-%d Ryodan", "26=Dokuritsu Konsei Dai-%d Ryodan", "27=Dokuritsu Konsei Dai-%d Ryodan", "28=Dokuritsu Konsei Dai-%d Ryodan", "29=Dokuritsu Konsei Dai-%d Ryodan", "30=Dokuritsu Konsei Dai-%d Ryodan", "31=Dokuritsu Konsei Dai-%d Ryodan", "32=Dokuritsu Konsei Dai-%d Ryodan",
    "33=Dokuritsu Konsei Dai-%d Ryodan", "34=Dokuritsu Konsei Dai-%d Ryodan", "35=Dokuritsu Konsei Dai-%d Ryodan", "36=Dokuritsu Konsei Dai-%d Ryodan", "37=Dokuritsu Konsei Dai-%d Ryodan", "38=Dokuritsu Konsei Dai-%d Ryodan", "39=Dokuritsu Konsei Dai-%d Ryodan", "40=Dokuritsu Konsei Dai-%d Ryodan",
    "43=Dokuritsu Konsei Dai-%d Ryodan", "44=Dokuritsu Konsei Dai-%d Ryodan", "45=Dokuritsu Konsei Dai-%d Ryodan", "46=Dokuritsu Konsei Dai-%d Ryodan", "47=Dokuritsu Konsei Dai-%d Ryodan", "48=Dokuritsu Konsei Dai-%d Ryodan", "49=Dokuritsu Konsei Dai-%d Ryodan", "50=Dokuritsu Konsei Dai-%d Ryodan",
    "51=Dokuritsu Konsei Dai-%d Ryodan", "52=Dokuritsu Konsei Dai-%d Ryodan", "53=Dokuritsu Konsei Dai-%d Ryodan", "54=Dokuritsu Konsei Dai-%d Ryodan", "55=Dokuritsu Konsei Dai-%d Ryodan", "56=Dokuritsu Konsei Dai-%d Ryodan", "57=Dokuritsu Konsei Dai-%d Ryodan", "58=Dokuritsu Konsei Dai-%d Ryodan",
    "59=Dokuritsu Konsei Dai-%d Ryodan", "60=Dokuritsu Konsei Dai-%d Ryodan", "61=Dokuritsu Konsei Dai-%d Ryodan", "62=Dokuritsu Konsei Dai-%d Ryodan", "64=Dokuritsu Konsei Dai-%d Ryodan", "65=Dokuritsu Konsei Dai-%d Ryodan", "66=Dokuritsu Konsei Dai-%d Ryodan", "67=Dokuritsu Konsei Dai-%d Ryodan",
    "68=Dokuritsu Konsei Dai-%d Ryodan", "69=Dokuritsu Konsei Dai-%d Ryodan", "70=Dokuritsu Konsei Dai-%d Ryodan", "71=Dokuritsu Konsei Dai-%d Ryodan", "72=Dokuritsu Konsei Dai-%d Ryodan", "73=Dokuritsu Konsei Dai-%d Ryodan", "75=Dokuritsu Konsei Dai-%d Ryodan", "76=Dokuritsu Konsei Dai-%d Ryodan",
    "77=Dokuritsu Konsei Dai-%d Ryodan", "78=Dokuritsu Konsei Dai-%d Ryodan", "79=Dokuritsu Konsei Dai-%d Ryodan", "80=Dokuritsu Konsei Dai-%d Ryodan", "81=Dokuritsu Konsei Dai-%d Ryodan", "82=Dokuritsu Konsei Dai-%d Ryodan", "83=Dokuritsu Konsei Dai-%d Ryodan", "84=Dokuritsu Konsei Dai-%d Ryodan",
    "85=Dokuritsu Konsei Dai-%d Ryodan", "86=Dokuritsu Konsei Dai-%d Ryodan", "87=Dokuritsu Konsei Dai-%d Ryodan", "88=Dokuritsu Konsei Dai-%d Ryodan", "89=Dokuritsu Konsei Dai-%d Ryodan", "90=Dokuritsu Konsei Dai-%d Ryodan", "91=Dokuritsu Konsei Dai-%d Ryodan", "92=Dokuritsu Konsei Dai-%d Ryodan",
    "95=Dokuritsu Konsei Dai-%d Ryodan", "96=Dokuritsu Konsei Dai-%d Ryodan", "97=Dokuritsu Konsei Dai-%d Ryodan", "98=Dokuritsu Konsei Dai-%d Ryodan", "100=Dokuritsu Konsei Dai-%d Ryodan", "101=Dokuritsu Konsei Dai-%d Ryodan", "102=Dokuritsu Konsei Dai-%d Ryodan", "103=Dokuritsu Konsei Dai-%d Ryodan",
    "105=Dokuritsu Konsei Dai-%d Ryodan", "107=Dokuritsu Konsei Dai-%d Ryodan", "108=Dokuritsu Konsei Dai-%d Ryodan", "109=Dokuritsu Konsei Dai-%d Ryodan", "112=Dokuritsu Konsei Dai-%d Ryodan", "113=Dokuritsu Konsei Dai-%d Ryodan", "114=Dokuritsu Konsei Dai-%d Ryodan", "115=Dokuritsu Konsei Dai-%d Ryodan",
    "116=Dokuritsu Konsei Dai-%d Ryodan", "117=Dokuritsu Konsei Dai-%d Ryodan", "118=Dokuritsu Konsei Dai-%d Ryodan", "119=Dokuritsu Konsei Dai-%d Ryodan", "120=Dokuritsu Konsei Dai-%d Ryodan", "121=Dokuritsu Konsei Dai-%d Ryodan", "122=Dokuritsu Konsei Dai-%d Ryodan", "123=Dokuritsu Konsei Dai-%d Ryodan",
    "124=Dokuritsu Konsei Dai-%d Ryodan", "125=Dokuritsu Konsei Dai-%d Ryodan", "126=Dokuritsu Konsei Dai-%d Ryodan", "127=Dokuritsu Konsei Dai-%d Ryodan", "128=Dokuritsu Konsei Dai-%d Ryodan", "129=Dokuritsu Konsei Dai-%d Ryodan", "130=Dokuritsu Konsei Dai-%d Ryodan", "131=Dokuritsu Konsei Dai-%d Ryodan",
    "132=Dokuritsu Konsei Dai-%d Ryodan", "133=Dokuritsu Konsei Dai-%d Ryodan", "134=Dokuritsu Konsei Dai-%d Ryodan", "135=Dokuritsu Konsei Dai-%d Ryodan", "136=Dokuritsu Konsei Dai-%d Ryodan", "201=Dokuritsu Konsei Dai-%d Ryodan", "202=Dokuritsu Konsei Dai-%d Ryodan", "203=Dokuritsu Konsei Dai-%d Ryodan",
    "204=Dokuritsu Konsei Dai-%d Ryodan"
  ] }
```

```json batch
{ "group": "RGR_01", "comment": "Vanilla JAP_RGR_01 merges in; its generic Betsudotai stubs (keys 15-20) are written again with the fallback.\\nGokyotai were the Okinawa home-guerilla units; Yugekitai = guerilla/raiding unit. Regional pairings are\\nextrapolated.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "15=Dai-%d Yūgekitai", "16=Dai-%d Yūgekitai", "17=Dai-%d Yūgekitai", "18=Dai-%d Yūgekitai", "19=Dai-%d Yūgekitai", "20=Dai-%d Yūgekitai"
  ] }
```

```json batch
{ "group": "BIC_01", "comment": "Vanilla JAP_BIC_01 merges in; its Ginrinbutai stubs (keys 16-20) are written again with the fallback.\\nGinrin Butai ('silver wheel' units) were the bicycle infantry of the Malaya campaign (Konoe, 5th and 18th\\nDivisions); the other divisions are extrapolated.", "section": "Vanilla keys written again with the fallback (vanilla group merges in)",
  "add": [
    "16=Dai-%d Ginrin Daitai", "17=Dai-%d Ginrin Daitai", "18=Dai-%d Ginrin Daitai", "19=Dai-%d Ginrin Daitai", "20=Dai-%d Ginrin Daitai"
  ] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 0 -> 168 | Dai-%d Shidan (x168) | - | - |
| MOT_01 | 0 -> 162 | Jidōsha Dai-%d Shidan (x162) | - | - |
| MEC_01 | 0 -> 162 | Kikaika Dai-%d Shidan (x162) | - | - |
| ARM_01 | 0 -> 4 | Sensha Dai-%d Shidan (x4) | - | - |
| PAR_01 | 8 -> 20 | Teishin Dai-%d Dan (x12) | - | - |
| MNT_01 | 24 -> 38 | Sangaku Dai-%d Shidan (x14) | - | - |
| GAR_01 | 21 -> 62 | Dai-%d Shubitai (x41) | - | - |
| IMB_01 | 0 -> 129 | Dokuritsu Konsei Dai-%d Ryodan (x129) | - | - |
| RGR_01 | 14 -> 20 | Dai-%d Yūgekitai (x6) | - | - |
| BIC_01 | 15 -> 20 | Dai-%d Ginrin Daitai (x5) | - | - |

Unchanged: INF_02, MOT_02, MEC_02, ARM_02, CAV_01, PAR_02, MAR_01, AMP_01, GAR_02, FOR_01, BDR_01, GUA_01, KEN_01, MIL_01, FAS_01, FAS_02, DEM_01, DEM_02, DEM_03, DEM_04, RED_01, COM_01
<!-- END CHANGE TABLE -->
