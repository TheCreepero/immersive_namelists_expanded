# United Kingdom (ENG) Namelist Audit - 2026-10-25

Status: DONE

File: `common/units/names_divisions/zz_INEX_ENG_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit ENG`)
- AUDIT SUMMARY ENG: GROUPS=28 AUTHORED=271/561 FLAGS=31
- [ENG_INF_01] flags: PLACEHOLDER_ENTRIES
- [ENG_INF_02] flags: LOW_DEPTH
- [ENG_INF_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_CAV_01] flags: LOW_DEPTH
- [ENG_CAV_02] flags: LOW_DEPTH
- [ENG_MOT_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_ARM_01] flags: LOW_DEPTH
- [ENG_ARM_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_ARM_03] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_PAR_01] flags: LOW_DEPTH
- [ENG_PAR_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_MAR_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_MNT_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_MNT_02] flags: LOW_DEPTH
- [ENG_GAR_01] flags: PLACEHOLDER_ENTRIES
- [ENG_COL_01] flags: PLACEHOLDER_ENTRIES
- [ENG_DEM_01] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_INDEPENDENT_BRIGADES_01] flags: LOW_DEPTH
- [ENG_SSB_01] flags: LOW_DEPTH
- [ENG_FAS_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- [ENG_COM_02] flags: PLACEHOLDER_ENTRIES, LOW_DEPTH
- Found on manual review:
  - R10: nicknames sit in the main groups although vanilla gives British divisions none: `ENG_INF_01` (3 'Iron Division', 49 'Polar Bears', 51 'Highway Decorators', 56 'Black Cats', 78 'Battleaxe'), `ENG_ARM_01` (6 'Mailed Fist', 7 'Desert Rats', 11 'Black Bull', 79 'Hobart's Funnies'), `ENG_MOT_01` and `ENG_MEC_01` (78 'Battleaxe').
  - Invented or wrong entries: `ENG_CAV_01` 18 "18th Hussars Division" and 19 "Household Cavalry Composite Division" (no such formations); `ENG_CAV_02` 8-10 are regiments written as brigades (North Somerset Yeomanry, Cheshire Yeomanry, Yorkshire Dragoons) and 7 "Household Cavalry Brigade" is unattested; `ENG_COL_01` 12 "12th (East Africa) Division" (it was the 12th (African) Division) and 83 "Tanganyika Rifles" (formed 1961); `ENG_AIR_01` area labels of the 3rd, 4th, 5th, 8th and 9th AA Divisions are wrong or incomplete; `ENG_INDEPENDENT_BRIGADES_01` holds ten invented names ("No. 1 Independent Brigade Group", "1st Highland Brigade" and so on); `ENG_INF_02` 231 writes the Malta title in quotes ("231st ('Malta') Infantry Brigade").
  - Roadmap item 5: deepen the British groups only; the Dominions get files of their own.

## User decisions
- 2026-10-25, before research:
  - R10 split for infantry and armour. `ENG_INF_01` and `ENG_ARM_01` become plain (nicknames removed, regional designations kept). The new `ENG_INF_04` "Infantry Divisions (Named)" (types infantry, motorized, mechanized; linked to `ENG_INF_01`) and `ENG_ARM_04` "Armoured Divisions (Named)" (linked to `ENG_ARM_01`) carry the nicknames. `ENG_MOT_01` and `ENG_MEC_01` drop 'Battleaxe'.
  - Depth: extrapolation allowed. Plausible formations Britain never fielded may be added, each named as extrapolated in the Rationale.
  - `ENG_ARM_03` stays as vanilla's numbered stubs.
- 2026-10-25, checkpoint:
  - Report approved in full, including every name under "Author confirmation".
  - Named groups may use verified nicknames and formation signs that read as a name: 'Crossed Keys', 'Tyne-Tees', 'Red Rose', 'Rhino', 'Mailed Fist', 'Panda', 'Fox's Mask', 'Ever-Open Eye'.

## Research
- Run 1, `inex-audit-researcher`, 25 web calls: TA brigade titles, cavalry and mounted formations, Royal Marines, colonial forces, 1939 motor divisions. About 70 entries verified.
- Run 2, `inex-audit-researcher`, 25 web calls: division nicknames, deception formations, AA division areas, armoured brigades, independent brigades. About 40 entries verified; most nicknames unverified.
- Run 3, `inex-audit-researcher`, 15 web calls: follow-up on the unverified nicknames, Mobile Division titles, 32nd Guards Brigade.
- Main sources: Wikipedia division and brigade articles, *List of British infantry brigades of the Second World War (101-308 and named)*, *List of British mobile brigades during the Second World War*, *List of British deception formations in WWII*, *British Army Order of Battle (September 1939)*, *Anti-Aircraft Command*, *List of divisions of the British Territorial Force 1914-18*; Long Long Trail, "The Territorial Force Mounted Brigades"; britishmilitaryhistory.co.uk OOB snippets; Delaforce, *The Black Bull*; IWM catalogue snippets.

## Rationale
- **R10 split.** The plain groups keep the vanilla tags that a focus (`uk.txt`: `ENG_INF_01`; `india_goe.txt`: `ENG_ARM_01`) and saved templates use. Each loses only its nicknames; regional designations are part of the official titles and stay. The named groups repeat every authored key of their plain group with the nickname added where one is attested. A fallback number is one above the highest number in use [NAM-021], so the named groups need no stubs for the gaps.
- **`ENG_INF_01` depth (extrapolated by precedent).** Numbers Britain did not use in 1939-45 get the regional title the same number carried in 1914-18: 10th and 16th (Irish), 13th and 19th (Western), 17th (Northern), and the second-line TF titles 60th (2/2nd London), 62nd (2nd West Riding), 64th (2nd Highland), 65th (2nd Lowland), 67th (2nd Home Counties), 68th (2nd Welsh), 69th (2nd East Anglian), and 74th (Yeomanry). They are written in the WWII form ("Infantry Division"). These are extrapolated: they assume the Army would revive the old titles when re-raising the numbers. Key 11 stays the write-over, because `ENG_COL_01` (linked to `ENG_INF_01`) holds 11th (East Africa).
- **`ENG_ARM_01` depth.** It adds the 1937 Mobile Division and the 1938 Mobile Division (Egypt) at keys 3 and 4, numbers no British armoured division ever had, and the notional 15th Armoured Division (1942-43) at 15. The 12th, 13th and 14th (Yeomanry) Armoured Divisions are extrapolated: the 10th Armoured came from the yeomanry 1st Cavalry Division, and "(Yeomanry)" follows the 74th (Yeomanry) Division of 1917.
- **Cavalry.** `ENG_CAV_01` drops two invented entries (vanilla's stubs "18th/19th Cavalry Division" show again) and takes the 1914-18 cavalry and mounted divisions: 3rd and 5th Cavalry Division, Yeomanry Mounted Division and the 1st-4th Mounted Divisions (literal names at keys 6-10). `ENG_CAV_02` drops the three regiments and the unattested Household Cavalry Brigade (vanilla's numbered stubs show at 7-10) and takes the fourteen Territorial Force mounted brigades of 1908 and the Scottish Horse Mounted Brigade at keys 11-25.
- **`ENG_INF_02` depth.** It adds the regional titles of the TA infantry brigades, each in its attested form: interwar titles where sourced (125th-127th, 143rd-145th, 149th-151st, 155th-157th, 164th, 165th, 167th-169th), otherwise the 1915 title (128th-130th, 137th-138th, 146th-148th, 152nd-154th, 158th-159th, 161st-163rd), the WWII forms 131st (Queen's) and 139th (Nottinghamshire and Derbyshire), and 133rd (Kent and Sussex) from 1947. Each is written as "<n> (<title>) Infantry Brigade", or "Brigade" alone where the title already ends in "Infantry". It also adds 32nd Guards Brigade, 38th (Irish) Infantry Brigade and 201st Guards Motor Brigade (22nd Guards Brigade is the same formation earlier, so it is left out). 231 loses its quotes.
- **`ENG_INDEPENDENT_BRIGADES_01`.** None of its ten names existed. It is rewritten as the 1st Independent Brigade Group (Guards), the 20th Independent Infantry Brigade (Guards), and the static coastal-defence series 201st-225th Independent Infantry Brigade (Home) of 1940-41. The tag and selector stay.
- **`ENG_MAR_01`.** It adds the Royal Marine Division's 101st-103rd Royal Marine Brigades, MNBDO I and II, the 116th and 117th Infantry Brigade Royal Marines of 1945, and the 63rd (Royal Naval) Division of 1914-18. The 4th Special Service Brigade stays in `ENG_SSB_01` only.
- **`ENG_MOT_02`.** It adds the four Motor Divisions of the September 1939 order of battle: 50th (Northumbrian), 55th (West Lancashire), and 1st and 2nd London (keys 56 and 47, the numbers they took in 1940).
- **`ENG_COL_01`.** It fixes 12 to "(African)". 83 becomes the group's ordinal stub, like 84-89. It adds the Palestine Regiment and the Aden Protectorate Levies, and a new section with the Cyprus Regiment, the King's Own Malta Regiment, the Caribbean Regiment and the Fiji Infantry Regiment.
- **`ENG_AIR_01`.** The area labels follow AA Command's areas: 3rd covered Scotland and Northern Ireland, 4th North West England (HQ Chester), 5th southern England (HQ Reading), 8th South West England (HQ Bristol) and 9th South Wales (HQ Cardiff).
- **Smaller fixes.** `ENG_ARM_02` 5 becomes the 5th Guards Armoured Brigade, and the 35th and 36th Army Tank Brigades are added (10 and 11 already read "10th/11th Armoured Brigade", which is correct). `ENG_PAR_02` 2 becomes the 2nd Independent Parachute Brigade and 16 the 16th Independent Parachute Brigade Group (1948).

## Verified formations & commanders
- Nicknames, verified: 3rd 'Iron Division' (Montgomery, 1939; Delaforce); 5th 'Globetrotters'; 43rd 'Wyverns'; 49th 'Polar Bears'; 51st 'Highway Decorators'; 78th 'Battleaxe' (Wikipedia, secondary); 7th Armoured 'Desert Rats'; 11th Armoured 'Black Bull' (Delaforce, *The Black Bull*); 79th Armoured 'Hobart's Funnies'. 56th 'Black Cats': taken from the sign, secondary only.
- Signs only, no nickname attested: 1st Armoured (rhino), 2nd (crossed keys), 6th Armoured (mailed fist), 9th Armoured (panda), 10th Armoured (fox's mask), 15th (Scottish) (lion rampant in an O), 50th (TT, Tyne-Tees), 55th (red rose), 59th (pithead), Guards Armoured (open eye, from the WWI Guards Division).
- Deception formations (*List of British deception formations in WWII*): 40th, 57th and 58th Infantry Divisions; 5th and 15th Armoured Divisions; 2nd, 4th and 5th Airborne Divisions.
- Armour: Mobile Division (24 November 1937, became 1st Armoured Division); Mobile Division (Egypt) (27 September 1938, became 7th Armoured); 5th Guards Armoured Brigade; 10th and 11th Armoured Brigade; 35th and 36th Army Tank Brigade.
- Cavalry: 4th and 5th Cavalry Division (from the 1st and 2nd Indian Cavalry Divisions, 1916); Yeomanry Mounted Division (1917); 1st, 2nd, 3rd and 4th Mounted Division; 74th (Yeomanry) Division; 1st Cavalry Division (1939) with its 4th, 5th and 6th Cavalry Brigades; the 1908 TF mounted brigades: Highland, Lowland, Yorkshire, Welsh Border, Notts and Derby, North Midland, 1st and 2nd South Midland, South Wales, Eastern, London, South Eastern, 1st and 2nd South Western; Scottish Horse Mounted Brigade (snippet, secondary).
- Brigades: TA titles as listed in the Rationale; 32nd Guards Brigade; 38th (Irish) Infantry Brigade (common form); 201st Guards Motor Brigade; 231st (Malta) Infantry Brigade; 1st Independent Brigade Group (Guards); 20th Independent Infantry Brigade (Guards); 201st-225th Independent Infantry Brigade (Home).
- Royal Marines: Royal Marine(s) Division and its 101st-103rd Brigades; MNBDO (I); 116th and 117th Infantry Brigade Royal Marines.
- Colonial forces: 11th and 12th (African) Division; 11th (East Africa) Division (1943); Tanganyika Rifles formed 1961 (so it is removed); Caribbean Regiment (1944), Cyprus Regiment (1940), Palestine Regiment (1942), King's Own Malta Regiment, Fiji Infantry Regiment, Aden Protectorate Levies.
- Motor divisions: 50th (Northumbrian), 55th (West Lancashire), 1st London and 2nd London Motor Division (September 1939).
- AA divisions: areas and HQs as in the Rationale (*Anti-Aircraft Command*; britishmilitaryhistory.co.uk).
- Airborne: 2nd Independent Parachute Brigade; 16th Independent Parachute Brigade Group (1948).
- Legacy entries the batch does not touch: see the 2026-10-01 plan (`docs/plans/archive/2026-10-01-united-kingdom-audit.md`).

## Author confirmation
Well documented, but the researchers did not reach them:
- `ENG_INF_01`/`ENG_INF_04`: the 1914-18 titles 10th and 16th (Irish), 13th and 19th (Western), 17th (Northern), 60th (2/2nd London), 62nd (2nd West Riding), 64th (2nd Highland), 65th (2nd Lowland), 67th (2nd Home Counties), 68th (2nd Welsh), 69th (2nd East Anglian).
- `ENG_CAV_01`: 1st, 2nd and 3rd Cavalry Division (BEF, 1914-18).
- `ENG_MAR_01`: 63rd (Royal Naval) Division; MNBDO II.
- `ENG_AIR_01`: 5th AA Division "(Southern England)": the HQ at Reading and its place in I AA Corps (South) are verified, the area is not; 1st AA Division "(London)" is kept as is.

## Kept on judgment
Expected `-Check ENG` flags after the batch: 32 (16 `LOW_DEPTH`, 16 `PLACEHOLDER_ENTRIES`), measured by applying the batch to a scratch copy of the mod. Before: 31.
- `ENG_INF_01` PLACEHOLDER_ENTRIES; `ENG_ARM_01` PLACEHOLDER_ENTRIES, LOW_DEPTH: the plain variants (R10). They keep the regional titles, so `-Audit` does not mark them `Variant: plain`. Their depth is in `ENG_INF_04` and `ENG_ARM_04`, which carry no flag.
- `ENG_CAV_01` PLACEHOLDER_ENTRIES, LOW_DEPTH (new): the 1st-5th Cavalry Divisions are real numbered formations, and Britain fielded no more cavalry divisions.
- `ENG_INDEPENDENT_BRIGADES_01` PLACEHOLDER_ENTRIES, LOW_DEPTH (PLACEHOLDER new): the 201st-225th Independent Infantry Brigades (Home) are a real numbered series, which the lint counts as placeholders.
- `ENG_MOT_02`, `ENG_ARM_02`, `ENG_PAR_02`, `ENG_MAR_01` PLACEHOLDER_ENTRIES, LOW_DEPTH: real formations under their real numbers, plus vanilla write-overs (2026-10-17).
- `ENG_ARM_03` PLACEHOLDER_ENTRIES, LOW_DEPTH: user decision, vanilla stubs kept.
- `ENG_INF_03` PLACEHOLDER_ENTRIES, LOW_DEPTH: vanilla's light divisions; 14th and 20th (Light) are the 1914-18 titles.
- `ENG_MNT_01` PLACEHOLDER_ENTRIES, LOW_DEPTH: only the 52nd (Lowland) trained for mountains; the rest are 2026-10-17 write-overs.
- `ENG_GAR_01`, `ENG_COL_01` PLACEHOLDER_ENTRIES: vanilla write-overs (2026-10-17).
- `ENG_DEM_01`, `ENG_FAS_02`, `ENG_COM_02` PLACEHOLDER_ENTRIES, LOW_DEPTH: alternate-history ideology suites, outside the roadmap item.
- `ENG_PAR_01`, `ENG_MNT_02`, `ENG_SSB_01` LOW_DEPTH: historical strength (`ENG_MNT_02` is shared with RAJ).
- `error.log` gets an `Adding a duplicate ORDERED division name` line for each vanilla key the batch writes again. This is expected under the merge rule [NAM-020].

## Implementation steps
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames ENG -Batch docs/plans/2026-10-25-united-kingdom-audit.md`. Expect 24 lines, 22 `Edited ENG_...` and 2 `Added ...` (`ENG_INF_04` with 55 names, `ENG_ARM_04` with 17), and no `[ERROR]`.
- [x] 2. `powershell -File .\build.ps1 -SyncWiki ENG`, then make the edits listed under "Docs payload" (wiki table rows, wiki prose and the Workshop block). Expect `United-Kingdom.md: 0 row(s) updated`, `no row in wiki table (add by hand): ENG_INF_04, ENG_ARM_04` (payload edit 0 adds them) and `wiki/Home.md: ENG group count 28 -> 30`. If `-SyncWiki` already ran (`wiki/Home.md` modified), run it again; the output is the same apart from the Home.md line.
- [x] 3. `powershell -File .\build.ps1 -Check ENG`. Expect `Check passed` and `AUDIT SUMMARY ENG: GROUPS=30 AUTHORED=358/741 FLAGS=32`, with the flags listed under "Kept on judgment".
- [x] 4. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 5. Ship, on the user's word: commit with the message `Deepen ENG namelists and add named infantry and armour variants`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Deepen ENG namelists and add named infantry and armour variants"`.

## Docs payload
README: no change.

### `WORKSHOP_DESCRIPTION_GUIDELINES.md`, the `[b]United Kingdom[/b]` block
Replace:
```
- Regular & Territorial divisions on authentic titles ([i]7th Armoured Division 'Desert Rats'[/i], [i]51st (Highland) Infantry Division[/i], [i]3rd 'Iron Division'[/i], [i]Guards Armoured[/i])
```
with:
```
- Regular & Territorial divisions on authentic titles, in plain and nicknamed lists ([i]7th Armoured Division 'Desert Rats'[/i], [i]51st (Highland) Infantry Division[/i], [i]3rd 'Iron Division'[/i], [i]Guards Armoured[/i])
```

### `wiki/United-Kingdom.md` (after `-SyncWiki ENG`)
0. In the "Namelist Groups" table, insert directly after the row that starts ``| `ENG_INF_01` |``:
```
| `ENG_INF_04` | Infantry Divisions (Named) | infantry, motorized, mechanized | `%d Infantry Division` |
```
and directly after the row that starts ``| `ENG_ARM_01` |``:
```
| `ENG_ARM_04` | Armoured Divisions (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d Armoured Division` |
```
1. Replace the heading `` ### `ENG_INF_01` — Infantry Divisions `` and everything under it up to (not including) `` ### `ENG_INF_02` / `ENG_INF_03` — Infantry Brigade & Light Division `` with:
```
### `ENG_INF_01` / `ENG_INF_04` — Infantry Divisions (plain and named)
`ENG_INF_01` is the plain series: the Regular Army (1st–8th), the first-line Territorial Army (42nd–56th), the second-line and wartime divisions (9th (Highland) to 80th (Reserve)), the deception divisions (40th, 57th, 58th) and the Guards Division, each under its regional title and without nicknames. Numbers the Army left unused in 1939–45 revive the titles they carried in 1914–18: 10th and 16th (Irish), 13th and 19th (Western), 17th (Northern), 60th (2/2nd London) to 69th (2nd East Anglian), and 74th (Yeomanry). Vanilla's numbered entries fill the gaps.

`ENG_INF_04` (Named) holds the same divisions with their nicknames and formation signs, shares numbering with `ENG_INF_01`, and also serves motorised and mechanised templates. Examples:
- 3rd Infantry Division (*Iron Division*)
- 5th Infantry Division (*Globetrotters*)
- 43rd (Wessex) Infantry Division (*Wyverns*)
- 49th (West Riding) Infantry Division (*Polar Bears*)
- 50th (Northumbrian) Infantry Division (*Tyne-Tees*)
- 51st (Highland) Infantry Division (*Highway Decorators*)
- 56th (London) Infantry Division (*Black Cats*)
- 78th Infantry Division (*Battleaxe*)

```
2. Replace the line `Brigade-sized and light division formations for players using smaller templates.` with:
```
Brigade-sized formations for smaller templates. `ENG_INF_02` carries the Territorial Army brigades under their regional titles (*125th (Lancashire Fusiliers)*, *150th (York and Durham)*, *152nd (1st Highland)*, *167th (1st London)*), the Guards brigades and the *231st (Malta) Infantry Brigade*. `ENG_INF_03` keeps vanilla's light divisions, whose 14th and 20th (Light) match the 1914–18 titles.
```
3. Replace the line `British cavalry divisions and brigades. By WWII most had converted to armour, but the lists include historic cavalry designations for the early war period and alternate-history paths.` with:
```
British cavalry divisions and brigades. By 1939 only the yeomanry 1st Cavalry Division in Palestine remained, so the lists draw on the First World War: the 1st–5th Cavalry Divisions, the Yeomanry Mounted Division and the 1st–4th Mounted Divisions in `ENG_CAV_01`, and the fourteen Territorial Force mounted brigades of 1908 (*Highland*, *Notts and Derby*, *1st South Western*) and the Scottish Horse in `ENG_CAV_02`.
```
4. Replace the line ``British motorized infantry. `ENG_MOT_01` and `ENG_MOT_02` share numbering with `ENG_INF_01` via `link_numbering_with` to preserve consistent divisional numbering across infantry and motorized types.`` with:
```
British motorized infantry. `ENG_MOT_01` and `ENG_MOT_02` share numbering with `ENG_INF_01` via `link_numbering_with` to preserve consistent divisional numbering across infantry and motorized types. `ENG_MOT_02` holds the four Motor Divisions of September 1939: 50th (Northumbrian), 55th (West Lancashire), and 1st and 2nd London.
```
5. Replace the heading `` ### `ENG_ARM_01` — Armoured Divisions `` and everything under it up to (not including) `` ### `ENG_ARM_02` / `ENG_ARM_03` — Tank Brigades / Heavy Armoured Brigades `` with:
```
### `ENG_ARM_01` / `ENG_ARM_04` — Armoured Divisions (plain and named)
`ENG_ARM_01` is the plain series: the 1st, 2nd and 6th to 11th Armoured Divisions, the 42nd, 79th and Guards Armoured Divisions, the notional 5th Armoured of Operation Fortitude, the 1937 *Mobile Division*, the 1938 *Mobile Division (Egypt)*, and three extrapolated (Yeomanry) armoured divisions. `ENG_ARM_04` (Named) holds the same divisions with their nicknames and formation signs and shares numbering with `ENG_ARM_01`:
- 1st Armoured Division (*Rhino*)
- 6th Armoured Division (*Mailed Fist*)
- 7th Armoured Division (*Desert Rats*)
- 9th Armoured Division (*Panda*) and 10th Armoured Division (*Fox's Mask*)
- 11th Armoured Division (*Black Bull*)
- 79th Armoured Division (*Hobart's Funnies*)
- Guards Armoured Division (*Ever-Open Eye*)

```
6. Replace the line `Independent tank brigades and army tank brigades used for infantry support.` with:
```
Armoured brigades and army tank brigades under their real numbers (*4th Armoured Brigade 'Black Rats'*, *5th Guards Armoured Brigade*, *6th Guards Tank Brigade*, the 35th and 36th Army Tank Brigades). `ENG_ARM_03` keeps vanilla's numbered heavy brigades.
```
7. Replace the line `Parachute and airlanding brigade formations: 1st through 5th Parachute Brigades, plus 1st and 6th Airlanding Brigades.` with:
```
Parachute and airlanding brigade formations: 1st through 5th Parachute Brigades (the 2nd as the *2nd Independent Parachute Brigade* of Italy and Greece), the 1st and 6th Airlanding Brigades, and the *16th Independent Parachute Brigade Group* of 1948.
```
8. Replace the line `Royal Marines formations, covering the historical Royal Marine Division and Royal Marine Commandos (Nos. 40 through 48 RM Commando).` with:
```
Royal Marines formations: the Royal Marine Division and its 101st–103rd Royal Marine Brigades, the Mobile Naval Base Defence Organisations I and II, the 116th and 117th Infantry Brigades Royal Marines of 1945, the Royal Marine Commandos (Nos. 40 through 48), and the *63rd (Royal Naval) Division* of 1914–18.
```
9. Replace the line `Formations from British colonial territories and protectorates: East Africa, West Africa, Sudan, Somaliland, Transjordan, Burma, Malaya, and Hong Kong, including the King's African Rifles (KAR) and the Royal West African Frontier Force (RWAFF).` with:
```
Formations from British colonial territories and protectorates: the 11th (East Africa), 12th (African), 81st and 82nd (West Africa) Divisions; the King's African Rifles (KAR) and the Royal West African Frontier Force (RWAFF); the Sudan Defence Force, Somaliland Camel Corps, Arab Legion, Transjordan Frontier Force, Palestine Regiment and Aden Protectorate Levies; the Burma Rifles, Malay Regiment and Hong Kong Volunteer Defence Corps; and the Cyprus, King's Own Malta, Caribbean and Fiji regiments.
```
10. Insert directly before the heading `` ### `ENG_SSB_01` — Special Service Brigades (Commandos / SAS) ``:
```
### `ENG_AIR_01` — Anti-Aircraft Divisions
The twelve divisions of Anti-Aircraft Command (1939–1942), each with the area it defended (*1st (London)*, *3rd (Scotland & Northern Ireland)*, *8th (South West England)*).

### `ENG_INDEPENDENT_BRIGADES_01` — Independent Brigades
The 1st Independent Brigade Group (Guards), the 20th Independent Infantry Brigade (Guards), and the 201st–225th Independent Infantry Brigades (Home), raised for static coastal defence in 1940–41.

```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
Self-check (no proofreader: the names are English):
- Every added name is in "Verified formations & commanders" or "Author confirmation". The named groups' nicknames are verified or are formation signs the user approved.
- The extrapolated names are named as such in the Rationale: the re-raised 1914-18 titles in `ENG_INF_01`/`ENG_INF_04` and the 12th-14th (Yeomanry) Armoured Divisions.
- Ordinal suffixes were checked by key (st/nd/rd/th, th for 11-13 and 211-213).
- Scratch-copy preview: the batch applied cleanly, `-ValidateOnly` passed, and `-Audit ENG` gave `GROUPS=30 AUTHORED=358/741 FLAGS=32` with the flags listed under "Kept on judgment".

## Outcome
- Date: 2026-10-25.
- `-Check ENG`: Validate OK; Tests 475 Passed, 0 Failed, 0 Skipped; `AUDIT SUMMARY ENG: GROUPS=30 AUTHORED=358/741 FLAGS=32`; Flags: LOW_DEPTH x16, PLACEHOLDER_ENTRIES x16 (all listed under "Kept on judgment"); diff vs HEAD 16 group(s) changed, +209 -35 name(s); `Check passed`.
- Deviations: none in the batch or the docs text. The `-SyncWiki ENG` run printed `wiki/Home.md: ENG group count 30 (unchanged)` instead of `28 -> 30`, because an earlier run had already updated `wiki/Home.md`; the step's own note predicts this case. The Workshop guidelines file was modified on disk during the run; the planned edit applied to its exact current text.

## Edit batch
Applied by `build.ps1 -EditNames ENG -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
[
  { "group": "INF_01", "set": ["3=%drd Infantry Division", "49=%dth (West Riding) Infantry Division", "51=%dst (Highland) Infantry Division", "56=%dth (London) Infantry Division", "78=%dth Infantry Division"] },
  { "group": "INF_01", "add": ["# Re-raised First World War Designations",
    "10=%dth (Irish) Infantry Division", "13=%dth (Western) Infantry Division", "16=%dth (Irish) Infantry Division",
    "17=%dth (Northern) Infantry Division", "19=%dth (Western) Infantry Division", "60=%dth (2/2nd London) Infantry Division",
    "62=%dnd (2nd West Riding) Infantry Division", "64=%dth (2nd Highland) Infantry Division", "65=%dth (2nd Lowland) Infantry Division",
    "67=%dth (2nd Home Counties) Infantry Division", "68=%dth (2nd Welsh) Infantry Division", "69=%dth (2nd East Anglian) Infantry Division",
    "74=%dth (Yeomanry) Infantry Division"] }
]
```

```json batch
{ "addGroup": true, "group": "INF_04", "selector": "Infantry Divisions (Named)", "addType": ["infantry", "motorized", "mechanized"],
  "fallback": "%d Infantry Division", "link": "INF_01", "after": "INF_01",
  "comment": "Named variant of ENG_INF_01: the same divisions with their nicknames and formation signs; shares numbering with ENG_INF_01.",
  "add": ["# Regular Army Divisions",
    "1=%dst Infantry Division", "2=%dnd Infantry Division 'Crossed Keys'", "3=%drd Infantry Division 'Iron Division'",
    "4=%dth Infantry Division", "5=%dth Infantry Division 'Globetrotters'", "6=%dth Infantry Division", "7=%dth Infantry Division", "8=%dth Infantry Division",
    "# 1st-Line Territorial Army Divisions",
    "42=%dnd (East Lancashire) Infantry Division", "43=%drd (Wessex) Infantry Division 'Wyverns'", "44=%dth (Home Counties) Infantry Division",
    "48=%dth (South Midland) Infantry Division", "49=%dth (West Riding) Infantry Division 'Polar Bears'", "50=%dth (Northumbrian) Infantry Division 'Tyne-Tees'",
    "51=%dst (Highland) Infantry Division 'Highway Decorators'", "52=%dnd (Lowland) Infantry Division", "53=%drd (Welsh) Infantry Division",
    "54=%dth (East Anglian) Infantry Division", "55=%dth (West Lancashire) Infantry Division 'Red Rose'", "56=%dth (London) Infantry Division 'Black Cats'",
    "# 2nd-Line Territorial Army & Wartime Divisions",
    "9=%dth (Highland) Infantry Division", "12=%dth (Eastern) Infantry Division", "15=%dth (Scottish) Infantry Division",
    "18=%dth (East Anglian) Infantry Division", "23=%drd (Northumbrian) Infantry Division", "36=%dth Infantry Division",
    "38=%dth (Welsh) Infantry Division", "45=%dth Infantry Division", "46=%dth Infantry Division", "47=%dth (London) Infantry Division",
    "59=%dth (Staffordshire) Infantry Division", "61=%dst Infantry Division", "66=%dth Infantry Division", "70=%dth Infantry Division",
    "76=%dth Infantry Division", "77=%dth Infantry Division", "78=%dth Infantry Division 'Battleaxe'", "80=%dth Infantry (Reserve) Division",
    "# Deception Divisions",
    "40=%dth Infantry Division", "57=%dth Infantry Division", "58=%dth (2/1st London) Infantry Division",
    "# Guards Division",
    "31=Guards Infantry Division",
    "# Re-raised First World War Designations",
    "10=%dth (Irish) Infantry Division", "13=%dth (Western) Infantry Division", "16=%dth (Irish) Infantry Division",
    "17=%dth (Northern) Infantry Division", "19=%dth (Western) Infantry Division", "60=%dth (2/2nd London) Infantry Division",
    "62=%dnd (2nd West Riding) Infantry Division", "64=%dth (2nd Highland) Infantry Division", "65=%dth (2nd Lowland) Infantry Division",
    "67=%dth (2nd Home Counties) Infantry Division", "68=%dth (2nd Welsh) Infantry Division", "69=%dth (2nd East Anglian) Infantry Division",
    "74=%dth (Yeomanry) Infantry Division"] }
```

```json batch
[
  { "group": "MOT_01", "set": ["78=%dth Motorised Division"] },
  { "group": "MEC_01", "set": ["78=%dth Mechanised Division"] }
]
```

```json batch
[
  { "group": "ARM_01", "set": ["6=%dth Armoured Division", "7=%dth Armoured Division", "11=%dth Armoured Division", "79=%dth Armoured Division"] },
  { "group": "ARM_01", "add": ["3=Mobile Division", "4=Mobile Division (Egypt)",
    "12=%dth (Yeomanry) Armoured Division", "13=%dth (Yeomanry) Armoured Division", "14=%dth (Yeomanry) Armoured Division"] }
]
```

```json batch
{ "addGroup": true, "group": "ARM_04", "selector": "Armoured Divisions (Named)", "addType": ["light_armor", "medium_armor", "heavy_armor", "modern_armor"],
  "fallback": "%d Armoured Division", "link": "ARM_01", "after": "ARM_01",
  "comment": "Named variant of ENG_ARM_01: the same divisions with their nicknames and formation signs; shares numbering with ENG_ARM_01.",
  "add": ["1=%dst Armoured Division 'Rhino'", "2=%dnd Armoured Division", "3=Mobile Division", "4=Mobile Division (Egypt)",
    "5=%dth Armoured Division", "6=%dth Armoured Division 'Mailed Fist'", "7=%dth Armoured Division 'Desert Rats'", "8=%dth Armoured Division",
    "9=%dth Armoured Division 'Panda'", "10=%dth Armoured Division 'Fox's Mask'", "11=%dth Armoured Division 'Black Bull'",
    "12=%dth (Yeomanry) Armoured Division", "13=%dth (Yeomanry) Armoured Division", "14=%dth (Yeomanry) Armoured Division",
    "42=%dnd Armoured Division", "79=%dth Armoured Division 'Hobart's Funnies'", "31=Guards Armoured Division 'Ever-Open Eye'"] }
```

```json batch
[
  { "group": "CAV_01", "remove": ["18", "19"] },
  { "group": "CAV_01", "add": ["3=%drd Cavalry Division", "5=%dth Cavalry Division", "6=Yeomanry Mounted Division",
    "7=1st Mounted Division", "8=2nd Mounted Division", "9=3rd Mounted Division", "10=4th Mounted Division"] }
]
```

```json batch
[
  { "group": "CAV_02", "remove": ["7", "8", "9", "10"] },
  { "group": "CAV_02", "add": ["# Territorial Force Mounted Brigades (1908)",
    "11=Highland Mounted Brigade", "12=Lowland Mounted Brigade", "13=Yorkshire Mounted Brigade", "14=Welsh Border Mounted Brigade",
    "15=Notts and Derby Mounted Brigade", "16=North Midland Mounted Brigade", "17=1st South Midland Mounted Brigade",
    "18=2nd South Midland Mounted Brigade", "19=South Wales Mounted Brigade", "20=Eastern Mounted Brigade", "21=London Mounted Brigade",
    "22=South Eastern Mounted Brigade", "23=1st South Western Mounted Brigade", "24=2nd South Western Mounted Brigade",
    "25=Scottish Horse Mounted Brigade"] }
]
```

```json batch
[
  { "group": "INF_02", "set": ["147=147th (2nd West Riding) Infantry Brigade", "151=151st (Durham Light Infantry) Brigade", "231=231st (Malta) Infantry Brigade"] },
  { "group": "INF_02", "add": ["32=32nd Guards Brigade", "38=38th (Irish) Infantry Brigade",
    "125=125th (Lancashire Fusiliers) Infantry Brigade", "126=126th (East Lancashire) Infantry Brigade", "127=127th (Manchester) Infantry Brigade",
    "128=128th (Hampshire) Infantry Brigade", "129=129th (South Western) Infantry Brigade", "130=130th (Devon and Cornwall) Infantry Brigade",
    "131=131st (Queen's) Infantry Brigade", "133=133rd (Kent and Sussex) Infantry Brigade",
    "137=137th (Staffordshire) Infantry Brigade", "138=138th (Lincoln and Leicester) Infantry Brigade", "139=139th (Nottinghamshire and Derbyshire) Infantry Brigade",
    "143=143rd (Warwickshire) Infantry Brigade", "144=144th (Gloucestershire and Worcestershire) Infantry Brigade", "145=145th (South Midland) Infantry Brigade",
    "146=146th (1st West Riding) Infantry Brigade", "148=148th (3rd West Riding) Infantry Brigade",
    "149=149th (Northumberland) Infantry Brigade", "150=150th (York and Durham) Infantry Brigade",
    "152=152nd (1st Highland) Infantry Brigade", "153=153rd (2nd Highland) Infantry Brigade", "154=154th (3rd Highland) Infantry Brigade",
    "155=155th (South Scottish) Infantry Brigade", "156=156th (Scottish Rifles) Infantry Brigade", "157=157th (Highland Light Infantry) Brigade",
    "158=158th (North Wales) Infantry Brigade", "159=159th (Cheshire) Infantry Brigade",
    "161=161st (Essex) Infantry Brigade", "162=162nd (East Midland) Infantry Brigade", "163=163rd (Norfolk and Suffolk) Infantry Brigade",
    "164=164th (North Lancashire) Infantry Brigade", "165=165th (Liverpool) Infantry Brigade",
    "167=167th (1st London) Infantry Brigade", "168=168th (2nd London) Infantry Brigade", "169=169th (3rd London) Infantry Brigade",
    "201=201st Guards Motor Brigade"] }
]
```

```json batch
{ "group": "INDEPENDENT_BRIGADES_01", "removeAll": true, "add": ["# Guards Independent Brigades",
  "1=1st Independent Brigade Group (Guards)", "20=20th Independent Infantry Brigade (Guards)",
  "# Independent Infantry Brigades (Home), 1940-41",
  "201=%dst Independent Infantry Brigade (Home)", "202=%dnd Independent Infantry Brigade (Home)", "203=%drd Independent Infantry Brigade (Home)",
  "204=%dth Independent Infantry Brigade (Home)", "205=%dth Independent Infantry Brigade (Home)", "206=%dth Independent Infantry Brigade (Home)",
  "207=%dth Independent Infantry Brigade (Home)", "208=%dth Independent Infantry Brigade (Home)", "209=%dth Independent Infantry Brigade (Home)",
  "210=%dth Independent Infantry Brigade (Home)", "211=%dth Independent Infantry Brigade (Home)", "212=%dth Independent Infantry Brigade (Home)",
  "213=%dth Independent Infantry Brigade (Home)", "214=%dth Independent Infantry Brigade (Home)", "215=%dth Independent Infantry Brigade (Home)",
  "216=%dth Independent Infantry Brigade (Home)", "217=%dth Independent Infantry Brigade (Home)", "218=%dth Independent Infantry Brigade (Home)",
  "219=%dth Independent Infantry Brigade (Home)", "220=%dth Independent Infantry Brigade (Home)", "221=%dst Independent Infantry Brigade (Home)",
  "222=%dnd Independent Infantry Brigade (Home)", "223=%drd Independent Infantry Brigade (Home)", "224=%dth Independent Infantry Brigade (Home)",
  "225=%dth Independent Infantry Brigade (Home)"] }
```

```json batch
[
  { "group": "ARM_02", "set": ["5=5th Guards Armoured Brigade"] },
  { "group": "ARM_02", "add": ["# Army Tank Brigades (1941)", "35=35th Army Tank Brigade", "36=36th Army Tank Brigade"] }
]
```

```json batch
{ "group": "PAR_02", "set": ["2=2nd Independent Parachute Brigade", "16=16th Independent Parachute Brigade Group"] }
```

```json batch
{ "group": "MAR_01", "add": ["2=Mobile Naval Base Defence Organisation I", "3=Mobile Naval Base Defence Organisation II",
  "63=63rd (Royal Naval) Division", "101=101st Royal Marine Brigade", "102=102nd Royal Marine Brigade", "103=103rd Royal Marine Brigade",
  "116=116th Infantry Brigade Royal Marines", "117=117th Infantry Brigade Royal Marines"] }
```

```json batch
{ "group": "MOT_02", "add": ["47=2nd London Motor Division", "50=%dth (Northumbrian) Motor Division",
  "55=%dth (West Lancashire) Motor Division", "56=1st London Motor Division"] }
```

```json batch
[
  { "group": "COL_01", "set": ["12=%dth (African) Division", "83=%drd (Colonial) Division"] },
  { "group": "COL_01", "section": "Middle Eastern & Asian Forces", "add": ["113=Palestine Regiment", "114=Aden Protectorate Levies"] },
  { "group": "COL_01", "add": ["# Mediterranean, Caribbean & Pacific Forces",
    "151=Cyprus Regiment", "152=King's Own Malta Regiment", "153=Caribbean Regiment", "154=Fiji Infantry Regiment"] }
]
```

```json batch
{ "group": "AIR_01", "set": ["3=%drd Anti-Aircraft Division (Scotland & Northern Ireland)", "4=%dth Anti-Aircraft Division (North West England)",
  "5=%dth Anti-Aircraft Division (Southern England)", "8=%dth Anti-Aircraft Division (South West England)", "9=%dth Anti-Aircraft Division (South Wales)"] }
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 47 -> 60 | %drd Infantry Division, %dth (West Riding) Infantry Division, %dst (Highland) Infantry Division, %dth (Irish) Infantry Division (x2), %dth (Western) Infantry Division (x2), %dth (Northern) Infantry Division, %dth (2/2nd London) Infantry Division, %dnd (2nd West Riding) Infantry Division, %dth (2nd Highland) Infantry Division, %dth (2nd Lowland) Infantry Division, %dth (2nd Home Counties) Infantry Division, %dth (2nd Welsh) Infantry Division, %dth (2nd East Anglian) Infantry Division, %dth (Yeomanry) Infantry Division | %drd Infantry Division 'Iron Division' (to INF_04), %dth (West Riding) Infantry Division 'Polar Bears' (to INF_04), %dst (Highland) Infantry Division 'Highway Decorators' (to INF_04), %dth (London) Infantry Division 'Black Cats' (to INF_04), %dth Infantry Division 'Battleaxe' (to INF_04) | - |
| INF_02 | 14 -> 51 | 147th (2nd West Riding) Infantry Brigade, 151st (Durham Light Infantry) Brigade, 231st (Malta) Infantry Brigade, 32nd Guards Brigade, 38th (Irish) Infantry Brigade, 125th (Lancashire Fusiliers) Infantry Brigade, 126th (East Lancashire) Infantry Brigade, 127th (Manchester) Infantry Brigade, 128th (Hampshire) Infantry Brigade, 129th (South Western) Infantry Brigade, 130th (Devon and Cornwall) Infantry Brigade, 131st (Queen's) Infantry Brigade, 133rd (Kent and Sussex) Infantry Brigade, 137th (Staffordshire) Infantry Brigade, 138th (Lincoln and Leicester) Infantry Brigade, 139th (Nottinghamshire and Derbyshire) Infantry Brigade, 143rd (Warwickshire) Infantry Brigade, 144th (Gloucestershire and Worcestershire) Infantry Brigade, 145th (South Midland) Infantry Brigade, 146th (1st West Riding) Infantry Brigade, 148th (3rd West Riding) Infantry Brigade, 149th (Northumberland) Infantry Brigade, 150th (York and Durham) Infantry Brigade, 152nd (1st Highland) Infantry Brigade, 153rd (2nd Highland) Infantry Brigade, 154th (3rd Highland) Infantry Brigade, 155th (South Scottish) Infantry Brigade, 156th (Scottish Rifles) Infantry Brigade, 157th (Highland Light Infantry) Brigade, 158th (North Wales) Infantry Brigade, 159th (Cheshire) Infantry Brigade, 161st (Essex) Infantry Brigade, 162nd (East Midland) Infantry Brigade, 163rd (Norfolk and Suffolk) Infantry Brigade, 164th (North Lancashire) Infantry Brigade, 165th (Liverpool) Infantry Brigade, 167th (1st London) Infantry Brigade, 168th (2nd London) Infantry Brigade, 169th (3rd London) Infantry Brigade, 201st Guards Motor Brigade | 147th Infantry Brigade, 151st Infantry Brigade, 231st ('Malta') Infantry Brigade | - |
| CAV_01 | 5 -> 10 | %drd Cavalry Division, Yeomanry Mounted Division, 1st Mounted Division, 2nd Mounted Division, 3rd Mounted Division, 4th Mounted Division | %dth Hussars Division, Household Cavalry Composite Division | - |
| CAV_02 | 10 -> 21 | Highland Mounted Brigade, Lowland Mounted Brigade, Yorkshire Mounted Brigade, Welsh Border Mounted Brigade, Notts and Derby Mounted Brigade, North Midland Mounted Brigade, 1st South Midland Mounted Brigade, 2nd South Midland Mounted Brigade, South Wales Mounted Brigade, Eastern Mounted Brigade, London Mounted Brigade, South Eastern Mounted Brigade, 1st South Western Mounted Brigade, 2nd South Western Mounted Brigade, Scottish Horse Mounted Brigade | Household Cavalry Brigade, North Somerset Yeomanry Brigade, Cheshire Yeomanry Brigade, Yorkshire Dragoons Brigade | - |
| MOT_01 | 29 -> 29 | - | %dth Motorised Division 'Battleaxe' | - |
| MOT_02 | 10 -> 14 | 2nd London Motor Division, %dth (Northumbrian) Motor Division, %dth (West Lancashire) Motor Division, 1st London Motor Division | - | - |
| MEC_01 | 29 -> 29 | - | %dth Mechanised Division 'Battleaxe' | - |
| ARM_01 | 12 -> 17 | Mobile Division, Mobile Division (Egypt), %dth (Yeomanry) Armoured Division (x3) | %dth Armoured Division 'Mailed Fist' (to ARM_04), %dth Armoured Division 'Desert Rats' (to ARM_04), %dth Armoured Division 'Black Bull' (to ARM_04), %dth Armoured Division 'Hobart's Funnies' (to ARM_04) | - |
| ARM_02 | 34 -> 36 | 5th Guards Armoured Brigade, 35th Army Tank Brigade, 36th Army Tank Brigade | - | - |
| PAR_02 | 30 -> 30 | 2nd Independent Parachute Brigade, 16th Independent Parachute Brigade Group | - | - |
| MAR_01 | 10 -> 18 | Mobile Naval Base Defence Organisation I, Mobile Naval Base Defence Organisation II, 63rd (Royal Naval) Division, 101st Royal Marine Brigade, 102nd Royal Marine Brigade, 103rd Royal Marine Brigade, 116th Infantry Brigade Royal Marines, 117th Infantry Brigade Royal Marines | - | - |
| COL_01 | 71 -> 77 | %dth (African) Division, Palestine Regiment, Aden Protectorate Levies, Cyprus Regiment, King's Own Malta Regiment, Caribbean Regiment, Fiji Infantry Regiment | Tanganyika Rifles | - |
| AIR_01 | 12 -> 12 | %drd Anti-Aircraft Division (Scotland & Northern Ireland), %dth Anti-Aircraft Division (North West England), %dth Anti-Aircraft Division (Southern England), %dth Anti-Aircraft Division (South Wales) | %drd Anti-Aircraft Division (Scotland), %dth Anti-Aircraft Division (Western England), %dth Anti-Aircraft Division (South Wales & Severn), %dth Anti-Aircraft Division (South Midlands) | - |
| INDEPENDENT_BRIGADES_01 | 10 -> 27 | 1st Independent Brigade Group (Guards), 20th Independent Infantry Brigade (Guards), %dst Independent Infantry Brigade (Home) (x2), %dnd Independent Infantry Brigade (Home) (x2), %drd Independent Infantry Brigade (Home) (x2), %dth Independent Infantry Brigade (Home) (x19) | No. 1 Independent Brigade Group, No. 2 Independent Brigade Group, No. 3 Independent Brigade Group, No. 4 Independent Brigade Group, No. 5 Independent Brigade Group, 1st Highland Brigade, 1st Lowland Brigade, 1st Welsh Brigade, 1st London Brigade, 1st Midland Brigade | - |
| INF_04 | new, 55 | %dst Infantry Division (x2), %dnd Infantry Division 'Crossed Keys', %drd Infantry Division 'Iron Division' (from INF_01), %dth Infantry Division (x13), %dth Infantry Division 'Globetrotters', %dnd (East Lancashire) Infantry Division, %drd (Wessex) Infantry Division 'Wyverns', %dth (Home Counties) Infantry Division, %dth (South Midland) Infantry Division, %dth (West Riding) Infantry Division 'Polar Bears' (from INF_01), %dth (Northumbrian) Infantry Division 'Tyne-Tees', %dst (Highland) Infantry Division 'Highway Decorators' (from INF_01), %dnd (Lowland) Infantry Division, %drd (Welsh) Infantry Division, %dth (East Anglian) Infantry Division (x2), %dth (West Lancashire) Infantry Division 'Red Rose', %dth (London) Infantry Division 'Black Cats' (from INF_01), %dth (Highland) Infantry Division, %dth (Eastern) Infantry Division, %dth (Scottish) Infantry Division, %drd (Northumbrian) Infantry Division, %dth (Welsh) Infantry Division, %dth (London) Infantry Division, %dth (Staffordshire) Infantry Division, %dth Infantry Division 'Battleaxe' (from INF_01), %dth Infantry (Reserve) Division, %dth (2/1st London) Infantry Division, Guards Infantry Division, %dth (Irish) Infantry Division (x2), %dth (Western) Infantry Division (x2), %dth (Northern) Infantry Division, %dth (2/2nd London) Infantry Division, %dnd (2nd West Riding) Infantry Division, %dth (2nd Highland) Infantry Division, %dth (2nd Lowland) Infantry Division, %dth (2nd Home Counties) Infantry Division, %dth (2nd Welsh) Infantry Division, %dth (2nd East Anglian) Infantry Division, %dth (Yeomanry) Infantry Division | - | - |
| ARM_04 | new, 17 | %dst Armoured Division 'Rhino', %dnd Armoured Division (x2), Mobile Division, Mobile Division (Egypt), %dth Armoured Division (x2), %dth Armoured Division 'Mailed Fist' (from ARM_01), %dth Armoured Division 'Desert Rats' (from ARM_01), %dth Armoured Division 'Panda', %dth Armoured Division 'Fox's Mask', %dth Armoured Division 'Black Bull' (from ARM_01), %dth (Yeomanry) Armoured Division (x3), %dth Armoured Division 'Hobart's Funnies' (from ARM_01), Guards Armoured Division 'Ever-Open Eye' | - | - |

Unchanged: INF_03, ARM_03, PAR_01, MNT_01, MNT_02, GAR_01, DEM_01, FAS_01, HOMEGUARD_01, ROYAL_GUARD_01, SSB_01, FAS_02, COM_01, COM_02
<!-- END CHANGE TABLE -->
