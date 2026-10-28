# Germany (GER) Namelist Audit - 2026-10-28

Status: DONE

File: `common/units/names_divisions/zz_INEX_GER_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit GER`)
- AUDIT SUMMARY GER: GROUPS=33 AUTHORED=1125/1733 FLAGS=4
- File: IDENTITY_REPEAT: 'Augsburg' (GER_INF_02, GER_MOT_02, GER_MEC_02, GER_Arm_02); 'Bayerischer Wald' (GER_LTINF_01, GER_BORDER_01); 'Darmstadt' (GER_INF_02, GER_MOT_02, GER_MEC_02, GER_Arm_02); 'Dresden' (GER_INF_02, GER_MOT_02, GER_MEC_02, GER_Arm_02); 'Fichtelgebirge' (GER_LTINF_01, GER_BORDER_01); 'Insterburg' (GER_Arm_02, GER_Cav_01); 'Johannisburger Heide' (GER_LTINF_01, GER_BORDER_01); 'Kaiser Franz Joseph' (GER_MONINF_01, GER_MONMOB_01); 'König' (GER_MONINF_01, GER_MONMOB_01); 'König Friedrich III.' (GER_MONINF_01, GER_MONMOB_01); 'König Karl' (GER_MONINF_01, GER_MONMOB_01); 'König Wilhelm I.' (GER_MONINF_01, GER_MONMOB_01); 'Königin' (GER_MONINF_01, GER_MONMOB_01); 'Potsdam' (GER_INF_02, GER_MOT_02, GER_MEC_02, GER_Arm_02); 'Prinz Albrecht von Preußen' (GER_MONINF_01, GER_MONMOB_01); 'Prinz Karl von Bayern' (GER_MONINF_01, GER_MONMOB_01); 'Stettin' (GER_INF_02, GER_MOT_02, GER_MEC_02, GER_Arm_02); 'Windhund' (GER_MOT_02, GER_MEC_02, GER_Arm_02)
- [GER_LTARM_01] flags: KEY_NUMBER_MISMATCH
- [GER_MONINF_01] flags: NAME_LONG
- [GER_MONMOB_01] flags: NAME_LONG
- Found on manual review: the automatic name-list pick for new mobile and armoured templates lands on the wrong group (see Rationale). Scope of this plan is that pick only; the rest of the file was audited on 2026-10-25 and is unchanged.

## User decisions
- 2026-10-28, German gap review: the user approved all recommendations, including "fix Kampfgruppen now and add a small GER plan that makes the plain lists the largest". This plan is that GER plan.
- Ship order across the three German plans: this plan (GER) first, then `docs/plans/2026-10-28-germany-additional-audit.md`, then `docs/plans/2026-10-28-germany-waffen-ss-audit.md`. One plan at a time.

## Research
None: no names are added beyond the groups' own fallback text. Engine facts from the knowledge register: NAM-018 (a template without a chosen group takes, among the available groups whose `division_types` list one of its line battalions, the one with the most `ordered` names; first of equals), NAM-020 (vanilla's group of the same tag merges in: its `ordered` numbers and `division_types` are added), NAM-021 (first free `ordered` entry in file order, then the fallback), NAM-026 (line battalions only).

## Rationale
**Problem.** A new motorized, mechanized or armoured German template takes the matching group with the most names (NAM-018). Today that is `GER_KAMPFGRUPPE_01` (GER_ADDITIONAL, 166 names, ungated, lists motorized, mechanized and armour), so new Panzer templates come out as "Kampfgruppe N" under every government. The GER_ADDITIONAL plan reduces that group to `infantry`. After that, a fascist Germany's mobile templates would fall to `GER_SS_01` "SS Divisions" (105 names after the vanilla merge; its `infantry motorized medium_armor mechanized` types come from vanilla's group of the same tag and cannot be removed, NAM-020), and motorized or mechanized templates that carry a StuG battalion would fall to `GER_STUG_01` (66) under some governments once it lists `medium_tank_destroyer_brigade`.

**Fix.** The plain lists `GER_Arm_01`, `GER_MOT_01` and `GER_MEC_01` each grow to 110 `ordered` entries with their own fallback text, the way the plain `GER_Inf_01` (308) is the default for infantry. 110 is chosen against the merged counts of the competing groups (computed 2026-10-28 from the INEX and vanilla files):

| Competitor | Names (merged) | Governments | Types it shares | Result with 110 |
|---|---|---|---|---|
| `GER_SS_01` SS Divisions | 105 | fascism | motorized, mechanized, medium_armor | plain list wins |
| `GER_SS_05` / `_04` / `_03` | 71 / 78 / 68 | fascism | armour / mechanized / motorized | plain list wins |
| `GER_Arm_02` / `GER_MOT_02` / `GER_MEC_02` (Named) | 81 / 43 / 43 | all | same | plain list wins (Named stays a manual choice) |
| `GER_STUG_01` after retype | 66 | all | medium_tank_destroyer_brigade (mixed templates) | plain list wins |
| `GER_MONMOB_01` Imperial Mobile | 111 | neutrality, democratic | cavalry, armour | imperial list still wins: imperial Germany keeps its default |
| `GER_MONINF_01` Imperial Infantry | 209 | neutrality, democratic | mechanized | imperial list still wins |
| Guard 40, Republican 33, Volkswehr 22, Republican Panzer 36, Red Army 36, Red Panzer 30, Elite 17 | | gated | mixed | plain list wins, as before Kampfgruppen existed |

The margin over `GER_SS_01` is 5 names; a later change that grows `GER_SS_01` past 109 entries, or `GER_MONMOB_01` below 111, changes these defaults. Saved templates are not affected: a template keeps the group the player chose while that group's `can_use` holds (NAM-018).

**Numbering.** Entries are added after the existing (historical) ones, so the historical numbers are still handed out first (NAM-021): Panzer 1-27, 116, 232, 60, 61, 85, 88, 130, 233, 693; motorized and Panzergrenadier their vanilla keys. The new entries are the lowest unused keys from 1 upward: Panzer 28-59, 62-84, 86, 87, 89-105 (74); motorized 96 keys up to 109; Panzergrenadier 95 keys up to 105. `GER_MOT_01` and `GER_MEC_01` share the `GER_Inf_01` pool, so a key an infantry division holds is skipped, as the fallback would; the next free number differs little from today's "highest in use plus one". The entries repeat the fallback text, so no name changes at any key the game already shows.

## Verified formations & commanders
None added. The existing entries are unchanged.

## Author confirmation
None.

## Kept on judgment
- IDENTITY_REPEAT (file): the shared identities between the Named lists, the border and Jäger lists and the imperial lists are the file's one-identity-per-division scheme (2026-10-25 audit).
- KEY_NUMBER_MISMATCH on `GER_LTARM_01`: the 1.-4. leichte Divisionen sit at keys 6-9 and the 5. at 21, the numbers of the Panzer divisions they became, in the pool shared with `GER_Arm_01`. Intended.
- NAME_LONG on `GER_MONINF_01` and `GER_MONMOB_01`: full regimental honour titles, kept from the 2026-10-25 audit.

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames GER -Batch docs/plans/2026-10-28-germany-audit.md`. Expect one green line per group (3 groups) and no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki GER`, then make the edit listed under "Docs payload".
- [x] 3. `powershell -File .\build.ps1 -AuditPlan GER` to refresh the change table (the other two German plans are live, so `-Check` may skip the refresh and say so; that line is expected). Expect the table to list `GER_Arm_01`, `GER_MOT_01` and `GER_MEC_01`.
- [x] 4. `powershell -File .\build.ps1 -Check GER`. Expect `Check passed`; remaining flags must match "Kept on judgment". `-Audit GER` should show `GER_Arm_01`, `GER_MOT_01` and `GER_MEC_01` with 110 entries each.
- [x] 5. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 6. Ship, on the user's word: commit with the message `Make the plain German Panzer, motorized and Panzergrenadier lists the default for new templates`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Make the plain German mobile lists the default for new templates"`. Then the GER_ADDITIONAL plan is next.

## Docs payload
`wiki/Germany.md`, line 14 ("Historical Overview"). Replace:

```
- **Plain list** (vanilla tag): numbers only, in historical raising order.
```

with:

```
- **Plain list** (vanilla tag): numbers only, in historical raising order. The plain motorized, Panzergrenadier and Panzer lists then run on in plain numbers to 110 entries, so a new template of those types takes the plain list unless you choose another.
```

No other docs change beyond `-SyncWiki`. README and Workshop text are unchanged.

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check: no authored names are added; every added entry is the group's own fallback text at a key the group did not write (keys computed 2026-10-28 against the INEX and vanilla key sets). Nothing extrapolated. Proofreader not needed.

## Outcome
Date: 2026-10-28. Batch applied: `GER_Arm_01` +74 -0, `GER_MOT_01` +96 -0, `GER_MEC_01` +95 -0 (all three now 110 entries, no `[ERROR]`). Docs: `wiki/Germany.md` line 14 replaced as the plan gives; `-SyncWiki GER` reported 0 rows updated and `GER` group count 33 (unchanged).

`-Check GER`: Validate OK; Tests 513 Passed, 0 Failed; AUDIT SUMMARY GER: GROUPS=33 AUTHORED=1125/1998 FLAGS=4; Flags: NAME_LONG x2 (`GER_MONINF_01`, `GER_MONMOB_01`), IDENTITY_REPEAT x1 (file), KEY_NUMBER_MISMATCH x1 (`GER_LTARM_01`). All four are listed under "Kept on judgment". Diff vs HEAD: 3 group(s) changed. Check passed.

Deviations: none from the plan's steps. Two notes: the first `Read` of the plan had no `limit` and returned the whole file, including the batch blocks below `## Edit batch`; no action was taken from them. Step 4's `-Audit GER` was run to confirm the 110-entry counts; it reports `GER_Arm_01`, `GER_MOT_01` and `GER_MEC_01` at 110 each. The `-Check` summary still lists one unfilled TODO until this section was filled (step 5).

## Edit batch
Applied by `build.ps1 -EditNames GER -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.

```json batch
{"add":["# Plain numbers in order, so new templates default to this list","28=%d. Panzer-Division","29=%d. Panzer-Division","30=%d. Panzer-Division","31=%d. Panzer-Division","32=%d. Panzer-Division","33=%d. Panzer-Division","34=%d. Panzer-Division","35=%d. Panzer-Division","36=%d. Panzer-Division","37=%d. Panzer-Division","38=%d. Panzer-Division","39=%d. Panzer-Division","40=%d. Panzer-Division","41=%d. Panzer-Division","42=%d. Panzer-Division","43=%d. Panzer-Division","44=%d. Panzer-Division","45=%d. Panzer-Division","46=%d. Panzer-Division","47=%d. Panzer-Division","48=%d. Panzer-Division","49=%d. Panzer-Division","50=%d. Panzer-Division","51=%d. Panzer-Division","52=%d. Panzer-Division","53=%d. Panzer-Division","54=%d. Panzer-Division","55=%d. Panzer-Division","56=%d. Panzer-Division","57=%d. Panzer-Division","58=%d. Panzer-Division","59=%d. Panzer-Division","62=%d. Panzer-Division","63=%d. Panzer-Division","64=%d. Panzer-Division","65=%d. Panzer-Division","66=%d. Panzer-Division","67=%d. Panzer-Division","68=%d. Panzer-Division","69=%d. Panzer-Division","70=%d. Panzer-Division","71=%d. Panzer-Division","72=%d. Panzer-Division","73=%d. Panzer-Division","74=%d. Panzer-Division","75=%d. Panzer-Division","76=%d. Panzer-Division","77=%d. Panzer-Division","78=%d. Panzer-Division","79=%d. Panzer-Division","80=%d. Panzer-Division","81=%d. Panzer-Division","82=%d. Panzer-Division","83=%d. Panzer-Division","84=%d. Panzer-Division","86=%d. Panzer-Division","87=%d. Panzer-Division","89=%d. Panzer-Division","90=%d. Panzer-Division","91=%d. Panzer-Division","92=%d. Panzer-Division","93=%d. Panzer-Division","94=%d. Panzer-Division","95=%d. Panzer-Division","96=%d. Panzer-Division","97=%d. Panzer-Division","98=%d. Panzer-Division","99=%d. Panzer-Division","100=%d. Panzer-Division","101=%d. Panzer-Division","102=%d. Panzer-Division","103=%d. Panzer-Division","104=%d. Panzer-Division","105=%d. Panzer-Division"],"group":"GER_Arm_01"}
```

```json batch
{"add":["# Plain numbers in order, so new templates default to this list","1=%d. Infanterie-Division (mot.)","4=%d. Infanterie-Division (mot.)","5=%d. Infanterie-Division (mot.)","6=%d. Infanterie-Division (mot.)","7=%d. Infanterie-Division (mot.)","8=%d. Infanterie-Division (mot.)","9=%d. Infanterie-Division (mot.)","11=%d. Infanterie-Division (mot.)","12=%d. Infanterie-Division (mot.)","15=%d. Infanterie-Division (mot.)","17=%d. Infanterie-Division (mot.)","19=%d. Infanterie-Division (mot.)","21=%d. Infanterie-Division (mot.)","22=%d. Infanterie-Division (mot.)","23=%d. Infanterie-Division (mot.)","24=%d. Infanterie-Division (mot.)","26=%d. Infanterie-Division (mot.)","27=%d. Infanterie-Division (mot.)","28=%d. Infanterie-Division (mot.)","30=%d. Infanterie-Division (mot.)","31=%d. Infanterie-Division (mot.)","32=%d. Infanterie-Division (mot.)","33=%d. Infanterie-Division (mot.)","34=%d. Infanterie-Division (mot.)","35=%d. Infanterie-Division (mot.)","37=%d. Infanterie-Division (mot.)","38=%d. Infanterie-Division (mot.)","39=%d. Infanterie-Division (mot.)","40=%d. Infanterie-Division (mot.)","41=%d. Infanterie-Division (mot.)","42=%d. Infanterie-Division (mot.)","43=%d. Infanterie-Division (mot.)","44=%d. Infanterie-Division (mot.)","45=%d. Infanterie-Division (mot.)","46=%d. Infanterie-Division (mot.)","47=%d. Infanterie-Division (mot.)","48=%d. Infanterie-Division (mot.)","49=%d. Infanterie-Division (mot.)","50=%d. Infanterie-Division (mot.)","51=%d. Infanterie-Division (mot.)","52=%d. Infanterie-Division (mot.)","53=%d. Infanterie-Division (mot.)","54=%d. Infanterie-Division (mot.)","55=%d. Infanterie-Division (mot.)","56=%d. Infanterie-Division (mot.)","57=%d. Infanterie-Division (mot.)","58=%d. Infanterie-Division (mot.)","59=%d. Infanterie-Division (mot.)","61=%d. Infanterie-Division (mot.)","62=%d. Infanterie-Division (mot.)","63=%d. Infanterie-Division (mot.)","64=%d. Infanterie-Division (mot.)","65=%d. Infanterie-Division (mot.)","66=%d. Infanterie-Division (mot.)","67=%d. Infanterie-Division (mot.)","68=%d. Infanterie-Division (mot.)","69=%d. Infanterie-Division (mot.)","70=%d. Infanterie-Division (mot.)","71=%d. Infanterie-Division (mot.)","72=%d. Infanterie-Division (mot.)","73=%d. Infanterie-Division (mot.)","74=%d. Infanterie-Division (mot.)","75=%d. Infanterie-Division (mot.)","76=%d. Infanterie-Division (mot.)","77=%d. Infanterie-Division (mot.)","78=%d. Infanterie-Division (mot.)","79=%d. Infanterie-Division (mot.)","80=%d. Infanterie-Division (mot.)","81=%d. Infanterie-Division (mot.)","82=%d. Infanterie-Division (mot.)","83=%d. Infanterie-Division (mot.)","84=%d. Infanterie-Division (mot.)","85=%d. Infanterie-Division (mot.)","86=%d. Infanterie-Division (mot.)","87=%d. Infanterie-Division (mot.)","88=%d. Infanterie-Division (mot.)","89=%d. Infanterie-Division (mot.)","91=%d. Infanterie-Division (mot.)","92=%d. Infanterie-Division (mot.)","93=%d. Infanterie-Division (mot.)","94=%d. Infanterie-Division (mot.)","95=%d. Infanterie-Division (mot.)","96=%d. Infanterie-Division (mot.)","97=%d. Infanterie-Division (mot.)","98=%d. Infanterie-Division (mot.)","99=%d. Infanterie-Division (mot.)","100=%d. Infanterie-Division (mot.)","101=%d. Infanterie-Division (mot.)","102=%d. Infanterie-Division (mot.)","103=%d. Infanterie-Division (mot.)","104=%d. Infanterie-Division (mot.)","105=%d. Infanterie-Division (mot.)","106=%d. Infanterie-Division (mot.)","107=%d. Infanterie-Division (mot.)","108=%d. Infanterie-Division (mot.)","109=%d. Infanterie-Division (mot.)"],"group":"GER_MOT_01"}
```

```json batch
{"add":["# Plain numbers in order, so new templates default to this list","1=%d. Panzergrenadier-Division","2=%d. Panzergrenadier-Division","4=%d. Panzergrenadier-Division","5=%d. Panzergrenadier-Division","6=%d. Panzergrenadier-Division","7=%d. Panzergrenadier-Division","8=%d. Panzergrenadier-Division","9=%d. Panzergrenadier-Division","11=%d. Panzergrenadier-Division","12=%d. Panzergrenadier-Division","13=%d. Panzergrenadier-Division","14=%d. Panzergrenadier-Division","17=%d. Panzergrenadier-Division","19=%d. Panzergrenadier-Division","21=%d. Panzergrenadier-Division","22=%d. Panzergrenadier-Division","23=%d. Panzergrenadier-Division","24=%d. Panzergrenadier-Division","26=%d. Panzergrenadier-Division","27=%d. Panzergrenadier-Division","28=%d. Panzergrenadier-Division","30=%d. Panzergrenadier-Division","31=%d. Panzergrenadier-Division","32=%d. Panzergrenadier-Division","33=%d. Panzergrenadier-Division","34=%d. Panzergrenadier-Division","35=%d. Panzergrenadier-Division","36=%d. Panzergrenadier-Division","37=%d. Panzergrenadier-Division","38=%d. Panzergrenadier-Division","39=%d. Panzergrenadier-Division","40=%d. Panzergrenadier-Division","41=%d. Panzergrenadier-Division","42=%d. Panzergrenadier-Division","43=%d. Panzergrenadier-Division","44=%d. Panzergrenadier-Division","45=%d. Panzergrenadier-Division","46=%d. Panzergrenadier-Division","47=%d. Panzergrenadier-Division","48=%d. Panzergrenadier-Division","49=%d. Panzergrenadier-Division","50=%d. Panzergrenadier-Division","51=%d. Panzergrenadier-Division","52=%d. Panzergrenadier-Division","53=%d. Panzergrenadier-Division","54=%d. Panzergrenadier-Division","55=%d. Panzergrenadier-Division","56=%d. Panzergrenadier-Division","57=%d. Panzergrenadier-Division","58=%d. Panzergrenadier-Division","59=%d. Panzergrenadier-Division","61=%d. Panzergrenadier-Division","62=%d. Panzergrenadier-Division","63=%d. Panzergrenadier-Division","64=%d. Panzergrenadier-Division","65=%d. Panzergrenadier-Division","66=%d. Panzergrenadier-Division","67=%d. Panzergrenadier-Division","68=%d. Panzergrenadier-Division","69=%d. Panzergrenadier-Division","70=%d. Panzergrenadier-Division","71=%d. Panzergrenadier-Division","72=%d. Panzergrenadier-Division","73=%d. Panzergrenadier-Division","74=%d. Panzergrenadier-Division","75=%d. Panzergrenadier-Division","76=%d. Panzergrenadier-Division","77=%d. Panzergrenadier-Division","78=%d. Panzergrenadier-Division","79=%d. Panzergrenadier-Division","80=%d. Panzergrenadier-Division","81=%d. Panzergrenadier-Division","82=%d. Panzergrenadier-Division","83=%d. Panzergrenadier-Division","84=%d. Panzergrenadier-Division","85=%d. Panzergrenadier-Division","86=%d. Panzergrenadier-Division","87=%d. Panzergrenadier-Division","88=%d. Panzergrenadier-Division","89=%d. Panzergrenadier-Division","91=%d. Panzergrenadier-Division","92=%d. Panzergrenadier-Division","93=%d. Panzergrenadier-Division","94=%d. Panzergrenadier-Division","95=%d. Panzergrenadier-Division","96=%d. Panzergrenadier-Division","97=%d. Panzergrenadier-Division","98=%d. Panzergrenadier-Division","99=%d. Panzergrenadier-Division","100=%d. Panzergrenadier-Division","101=%d. Panzergrenadier-Division","102=%d. Panzergrenadier-Division","103=%d. Panzergrenadier-Division","104=%d. Panzergrenadier-Division","105=%d. Panzergrenadier-Division"],"group":"GER_MEC_01"}
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| MOT_01 | 14 -> 110 | - | - | - |
| MEC_01 | 15 -> 110 | - | - | - |
| Arm_01 | 36 -> 110 | - | - | - |

Unchanged: Inf_01, INF_02, ALTINF_01, LTINF_01, MOT_02, MEC_02, Arm_02, LTARM_01, Cav_01, Mnt_01, PAR_01, MAR_01, GAR_01, COAST_01, BORDER_01, ELI_01, MEC_01_MONARNCHIST, MONINF_01, MONMOB_01, MONJAG_01, MONPZ_01, MONMAR_01, Arm_01_ANTIFASCIST, REPINF_01, REPDEF_01, REPPZ_01, MEC_01_COMMUNIST, REDINF_01, REDPZ_01, REDMAR_01
<!-- END CHANGE TABLE -->
