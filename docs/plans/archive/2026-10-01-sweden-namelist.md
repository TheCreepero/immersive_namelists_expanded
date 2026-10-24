# Sweden (SWE) Comprehensive Namelist Update

## Context
`INEX_SWE_names_divisions.txt` was authored 2026-09-29 and audited the same day. It holds 12 **brigade-level** groups (IB_01, PB_01, CYC_01, CAV_02, MNT_02, KA_01, HV_01, ART_01, AA_01, PAR_02, ROYAL_01, VOL_01; 209/214 authored, one flag `UNGATED_POLITICAL` on HV_01, one `Docs:` warning: workshop block has 1 `[i]` example, 2 needed).

The **division layer is entirely vanilla**: SWE_INF_01, MOT_01, MEC_01, ARM_01, CAV_01, PAR_01, MAR_01, MNT_01, GAR_01 and SWE_BS_01 are untouched, so a player building a Swedish division template gets numbered placeholders (`%s. Arméfördelningen` with Roman numerals, the same fallback repeated 10-16 times) and no plain/named pairs, no cavalry/marine/mountain/paratrooper/garrison identity, and no ideology suites. Sweden also has no fascist/communist/democratic paths and ROYAL_01 is only blocked for communism.

Goal: add the division layer, three ideology suites and a reworked royal guard, deepen the thin brigade lists, and sync all docs. Brigade lists stay as the audit left them except for the targeted fixes below.

## User decisions (Phase 0, 2026-10-01)
- Scope: **division layer + keep brigades**.
- Names: **verified + plausible extension**; every extrapolation is listed under "Author confirmation" in the plan before authoring is declared done.
- Ideology suites: **fascist, communist, democratic defense, royal-guard rework**.
- Plain/named pairs: **infantry, motorized, mechanized, armor**.

## Vanilla findings (`-InspectVanilla SWE`)
| Tag | Vanilla state | Action |
|---|---|---|
| SWE_INF_01 | `%s. Arméfördelningen` x16, Roman fallback; focus-referenced (`sweden.txt:8178`) | override as **plain** (fallback only); fix numeral format if dossier confirms Arabic `%d.` |
| SWE_MOT_01 / MEC_01 / ARM_01 | numbered stubs, link to INF_01 | override as **plain**, keep link |
| SWE_CAV_01 | 10 stubs | author real entries (distinct from brigade list CAV_02) |
| SWE_MAR_01 / MNT_01 / PAR_01 | 10-12 numbered stubs (keys 21-31, 31-42, 11-20) | author real entries |
| SWE_GAR_01 | 25 regiment-code entries (`I1 Garnison`, `K1 Garnison`, `Ing1 Garnison`) | keep as-is unless dossier shows errors; consider only a fallback fix |
| SWE_BS_01 | `can_use = { always = no }`, 12 `%s. Stormtrupper` stubs; **referenced by focus scripts** (sweden.txt:7887, afghanistan/argentina/brazil trees) | override, keep tag, gate `has_government = fascism` |

Never copy empty vanilla stubs; plain variants have no `ordered` block (CLAUDE.md §6).

## Target group suite
Existing 12 brigade groups remain. New/overridden groups (categories 02+ are unused repo-wide; verified by grep, 13 SWE_ tags all in this file):

**Field divisions (plain/named)**
| Tag | Selector | Types | Notes |
|---|---|---|---|
| SWE_INF_01 | Infantry Divisions | infantry | plain, fallback only |
| SWE_INF_02 | Infantry Divisions (Named) | infantry | `link_numbering_with = { SWE_INF_01 }`, regional/regiment identity names |
| SWE_MOT_01 / MOT_02 | Motorized Divisions (+ Named) | motorized | MOT_01 keeps vanilla link to INF_01; MOT_02 links to MOT_01 |
| SWE_MEC_01 / MEC_02 | Mechanized Divisions (+ Named) | mechanized | same pattern |
| SWE_ARM_01 / ARM_02 | Armored Divisions (+ Named) | light/medium/heavy/modern armor | same pattern; draws on Pansarbrigad/Skaraborg/Skånska/Södermanland traditions |

**Specialist divisions (override vanilla stubs)**
| Tag | Selector | Types |
|---|---|---|
| SWE_CAV_01 | Cavalry Divisions | cavalry |
| SWE_MAR_01 | Marine Divisions | marine (Kustjägare / Kustartilleri heritage; avoid duplicating KA_01 brigade names) |
| SWE_MNT_01 | Mountain Divisions | mountaineers, ranger_battalion (Norrland, Jämtland, Lappland) |
| SWE_PAR_01 | Paratrooper Divisions | paratrooper (Karlsborg Fallskärmsjägarskolan, F 7, K 3/K 4 airborne rangers) |

**Ideology suites (all `has_government`, never focus-locked)**
| Tag | Selector | Gate | Content (to be sourced) |
|---|---|---|---|
| SWE_BS_01 | Stormtroopers | `has_government = fascism` | override vanilla; 1920s-40s Swedish fascist movement structures (SFKO/SNSP/NSAP/SSS-style party formations) with `fallback_name` retained |
| SWE_FAS_01 | Fascist Legions | `has_government = fascism` | infantry/motorized fascist-era units, Carolean-revival rhetoric from the interwar right |
| SWE_RG_01 | Red Guards | `has_government = communism` | 1917-20 Röda gardet/arbetarkårer, SKP worker-militia tradition, Norrland labour history |
| SWE_HV_01 | Home Guard Districts | `OR = { has_government = democratic has_government = neutrality }` | existing 36 entries; fixes `UNGATED_POLITICAL` |
| SWE_LS_01 | Landstorm Brigades | same democratic/neutrality gate | Landstorm / Frivilliga skytterörelsen / folkförsvar tradition (dossier decides final form) |
| SWE_ROYAL_01 | Royal Guards | `OR = { has_government = democratic has_government = neutrality }` | keep Livgardet, Livdrabanter, Svea/Göta, royal regiments |
| SWE_CAR_01 | Carolean Guards | `OR = { has_government = neutrality has_government = fascism }` | split from ROYAL_01: the Karolinska/Stormakt entries (Carolus Rex, Gustavus Adolphus, Narva, Livland, Pommern, Finland, Estonia) as an imperial-tradition list |

ROYAL_01/CAR_01 gating is my proposed default; Democratic and Neutrality in HOI4 both cover a constitutional-monarchy Sweden, while Carolean imperial pride is the fascist/neutral-authoritarian reading. Flagged for confirmation at the review step.

**Brigade-list touch-ups** (small, via `-EditNames`)
- CYC_01: 16 entries is shallow for a list with fallback; extend with verified 1942 bicycle companies.
- PAR_02, VOL_01: LOW_DEPTH earlier; recheck after dossier.
- HV_01 gate (above).

## Workflow
1. **Save plan** to `docs/superpowers/plans/2026-10-01-sweden-namelist.md` (CLAUDE.md §1 path), copying this content and the Phase 0 decisions.
2. **Phase 1 research**: dispatch `inex-historical-researcher` with country, TAG, vanilla findings above, the user's policy answers and the `-Audit SWE -NamesOnly` lines (already in session) pasted in. Dossier to `scratch/swe_dossier.md`, one `##` per directive:
   - Swedish Army 1942-1945 war organization: arméfördelningar (1.-?), kårer, regiment codes (I/K/A/Lv/Ing/T/F), nicknames and garrison/cadre structure.
   - Whether `Arméfördelningen` should be Arabic or Roman numeral, nominative vs definite form (vanilla grammar audit).
   - Motorized/mechanized/armored lineage (Skaraborg P 4, Skånska dragonerna K 2/K 6, Norrlands dragoner, Södermanland P 10, Pansarregementen).
   - Cavalry, Kustjägare, Fjälljägare/Norrland, Fallskärmsjägare divisions.
   - Fascist, communist, democratic movements and their paramilitaries (Nysvenska rörelsen, SFKO, SSS, SKP, Folkets hus/Reichsbanner-style Arbetarskydd, Landstormen); factual and non-glorifying names only.
   - Royal/Carolean sources and suggested split.
   Clear point: after the dossier exists, tell the user it is safe to `/clear` and continue with "author the SWE namelist".
3. **Phase 2 authoring** (after `/clear`, read plan + dossier by section):
   - Edit only through `build.ps1`: `-EditNames SWE -AddGroup ...` for new groups (`-Link` for named variants), `-ClearOrdered -Comment` to make the plain variants, `-Batch scratch\swe_edits.json` for batched entry edits (apostrophes in Swedish names), `-SetHeader` for the file header.
   - Vanilla overrides (INF_01, MOT_01, MEC_01, ARM_01, CAV_01, MAR_01, MNT_01, PAR_01, BS_01) are added to the INEX file with the same tag; they are not new tags.
   - Keep selectors <= 28 characters, plural, no demonyms; `(Named)` suffix only on the named variants.
4. **Docs sync (CLAUDE.md §4)**:
   - `WORKSHOP_DESCRIPTION_GUIDELINES.md`: cross-reference row (line 62) and the `[b]Sweden[/b]` block (line 109) with 2-3 bullets and 2+ `[i]` examples (clears the current `Docs:` warning); no emojis, stay under 17k chars (currently 6.2k).
   - `README.md`: Included Nations Summary row (line 92) with updated tags/source.
   - `wiki/Sweden.md`: rewrite the historical overview and group tables; `wiki/Home.md` group count (line 24: 12 -> new total); `wiki/_Sidebar.md` unchanged. Use `build.ps1 -SyncWiki SWE`.
   - Push wiki with `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document SWE division namelists"` only after user confirmation (outward-facing).
5. **Phase 3 proofread**: `-DiffNames SWE` will add well over 25 Swedish names, so dispatch `inex-code-reviewer` with the added names, language (Swedish) and the plan's author-confirmation list; fix findings via `-EditNames`, rerun `-Check`, record outcome. No second dispatch for data-only fixes.

## Author confirmation (to fill during authoring)
- Extrapolated names (formations Sweden never fielded) and the ROYAL_01/CAR_01 split gating.
- Any ideology-suite names the dossier could not source.

## Verification
- `powershell -File .\build.ps1 -Check SWE` passes (validation, Pester, audit flags, docs warnings, `-DiffNames` counts); each remaining flag explained in the plan.
- `powershell -File .\build.ps1 -AuditPlan SWE` / `-SyncWiki SWE` clean (no stale tags, no PlanTodo).
- `-InspectVanilla SWE` scripted references still resolve (SWE_INF_01, SWE_BS_01 tags retained).
- Checklist in the authoring skill §5: language/diacritics, grounding, depth (20-30+ on main lists), gating, plain/named pairs link correctly, docs updated.
- `git status` shows only intended files (namelist, plan, workshop guide, README, wiki). `CLAUDE.md`/skills untouched, so no mirror sync needed.

## Critical files
- `common/units/names_divisions/INEX_SWE_names_divisions.txt`
- `docs/superpowers/plans/2026-10-01-sweden-namelist.md` (new)
- `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `README.md`, `wiki/Sweden.md`, `wiki/Home.md`
- `scratch/swe_dossier.md`, `scratch/swe_edits.json` (temp, in `scratch/`)

## Outcome (2026-10-01)

Authored via `scratch/swe_edits.json` (+ `swe_edits2.json`, `swe_edits3.json`); dossier in `scratch/swe_dossier.md`. File now has 29 groups (12 brigade + 17 new/overridden).

### Decisions taken during authoring
- **Mobile numbering anchor**: `SWE_MOT_01` keeps vanilla's link to `SWE_INF_01`; MEC_01, ARM_01 and every Named variant link to `SWE_MOT_01` (authoring skill: one anchor for the mobile family). Vanilla linked MEC/ARM/PAR/MAR to INF_01; PAR_01 and MAR_01 are now unlinked (own Roman counters).
- **Numerals**: Roman `%s.` for the whole division layer (dossier: Roman until 1 Oct 1966). Adjective lowercase in `Motoriserade arméfördelningen`; `Mekaniserade fördelningen`.
- **Mountain fallback**: `Jägarfördelningen` -> `Fältjägarfördelningen` (Jämtlands fältjägarregemente I 5).
- **SWE_GAR_01 left as vanilla**: its 25 code stubs (`I1 Garnison`) were not inspected entry by entry; dossier flags the code format (`I 1`) but offers no verified replacement list. Not touched.
- **Brigade touch-ups**: CYC_01 +6 provincial entries (extrapolated; the dossier found no verified 1942 bicycle companies). PAR_02 and VOL_01 not extended (no dossier sources); ROYAL_01 reworked (16 entries, Carolean and unsourced entries removed or moved to CAR_01, "Kungliga Majestäts Livgarde" and the `Ryttare` entries dropped as unsourced). HV_01 now gated democratic/neutrality (clears `UNGATED_POLITICAL`).
- **Red Guards**: no source for a Swedish "Röda gardet" (hits were Finnish); RG_01 uses `Arbetarkår` titles built on the 1917 Soldat- och arbetarföreningen, SSV and SKP. BS_01 uses `Stormavdelning` (no sourced Swedish "Stormtrupper").

### Author confirmation (extrapolated or held for the user)
1. All Named division pairings (INF_02, MOT_02, MEC_02, ARM_02): identities are real regiments/provinces, but real divisions carried no names before 1966.
2. CAV_01, MAR_01, PAR_01 in full: Sweden fielded no cavalry, marine or airborne divisions (Fallskärmsjägarskolan dates from 1952). Marine pool avoids KA_01 stations; paratrooper pool avoids PAR_02 bases.
3. BS_01, FAS_01, RG_01 formation titles (party names verified; titles extrapolated). FAS_01 is party-based only: the plan's "Carolean-revival rhetoric" lives in CAR_01.
4. All 16 CAR_01 entries (no sourced units under those names; Lützen/Breitenfeld swapped for Charles XII's Fraustadt/Klissow after review).
5. LS_01 brigade form and regional pairing (Landstormen 1885-1942 existed as battalions).
6. **Gating**: ROYAL_01 and LS_01 and HV_01 = democratic or neutrality; CAR_01 = neutrality or fascism; BS_01/FAS_01 = fascism; RG_01 = communism. This is the proposed default and needs the user's confirmation.
7. UNVERIFIED in the dossier and deliberately not used: I 11-I 22 / I 31-I 51 code-to-name mappings, armékårer, KA coast artillery codes.

### Phase 3 proofread (inex-code-reviewer, 224 added names)
Fixed: `Livgrenadjär` -> `Livgrenadjärregementets` (3 groups); river names to one word (`Torneälven`...); missing genitive `Malmös`, `Gällivares`; `Sveriges Kommunistiska Partis Arbetarkår`; `Södra/Norra skånska` lowercase; ARM_02 town names uniform bare; FAS_01 `Sveriges Fascistiska Folkpartis Kamplegion`; Lützen/Breitenfeld -> Fraustadt/Klissow. Kept with reason: `Skånska pansarregementet` (P 2's real definite name), `Göta pansarlivgarde` (P 1, dossier-verified), `Livregementets dragoner` (dossier-verified K 2 to 1927).

### Docs synced
`WORKSHOP_DESCRIPTION_GUIDELINES.md` (cross-reference row, `[b]Sweden[/b]` block with 2 `[i]` examples), `wiki/Sweden.md` (overview, 29-row table, detail sections), `wiki/Home.md` (12 -> 29). `README.md` row needs no change (tag, nation, same file). Wiki push pending user confirmation.
