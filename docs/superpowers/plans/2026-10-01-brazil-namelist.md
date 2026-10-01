# Brazil (BRA) Namelist Plan

## Context
Brazil has no INEX file. Vanilla ships 9 `BRA_*` groups in `BRA_names_divisions.txt`. Each is a stub of identical `%da Divisão de ...` entries (20 for INF and GAR, 10 for the rest) with grammar slips: `Mecânizada`, `Divisão de Blindada`, `Pára-Quedistas`, and `%da` instead of the ordinal `%dª`. The only scripted reference, `BRA_FL_01` in `common/national_focus/brazil.txt:2397`, is commented out (`#division_names_group = BRA_FL_01`), so no vanilla tag is focus-locked. This is a new-nation authoring task per `hoi4-inex-namelist-authoring`. Goal: override and expand all nine vanilla groups, and add a full suite of new lists.

## Phase 0 decisions (user-confirmed)
- **Vanilla scope**: all 9 vanilla groups (INF, CAV, MOT, MEC, ARM, PAR, MAR, MNT, GAR) are overridden and expanded.
- **Naming policy**: verified Exército/Marinha/FAB names plus plausible extrapolation in the Brazilian pattern. Every extrapolated name goes on an "Author confirmation" list in this plan. Nothing is invented to reach a count.
- **Ideology suites** (gated only by `can_use = { has_government = ... }`): fascism (Integralist), communism, democratic, neutrality/monarchy.
- **New lists**: territorial and state forces; expeditionary and foreign legion; jungle, frontier and Amazon troops; naval and air-ground. Plain/named pairs for infantry, motorized, mechanized and armor.
- **Language**: Brazilian Portuguese under the post-1990 orthography (`Paraquedista`, `Mecanizada`, `Blindada`). Ordinals use the indicators `ª` (Divisão, Brigada, Legião) and `º` (Regimento, Batalhão, Corpo), nominative forms, native word order.

## Vanilla findings (`-InspectVanilla BRA`)
| Tag | Vanilla state | Action |
|---|---|---|
| BRA_INF_01 | 20 stubs, `%da Divisão de Infantaria` | plain, `-ClearOrdered`, fallback `%dª Divisão de Infantaria` |
| BRA_MOT_01 / MEC_01 | 10 stubs each, link INF_01 | plain, keep link; fix `Mecânizada` |
| BRA_ARM_01 | 10 stubs, `Divisão de Blindada` | plain, fallback `%dª Divisão Blindada` |
| BRA_CAV_01 | 10 stubs | override with real entries |
| BRA_PAR_01 / MAR_01 / MNT_01 | 10 stubs each (MNT links INF_01) | override with real entries, fix `Pára-Quedistas` |
| BRA_GAR_01 | 20 stubs, links INF_01 | override with real entries |
| BRA_FL_01 | commented out in vanilla | INEX defines it as a live group |

The tags for the new groups below must not collide with vanilla. `-AddGroup` refuses an existing tag, and `-InspectVanilla` confirms.

## Target group suite (about 31 groups)
| Section | Tags | Notes |
|---|---|---|
| Field divisions | INF_01/02, MOT_01/02, MEC_01/02, ARM_01/02 | Plain keeps the vanilla tag (fallback only, no `ordered`). Named gets a new tag, selector `"<Plain> (Named)"`, `-Link <plain>`. MOT_01 and MEC_01 keep their vanilla link to INF_01. MOT_02, MEC_02 link to MOT_01. INF_02 to INF_01. ARM_02 to ARM_01. |
| Specialist | CAV_01, PAR_01, PAR_02, MAR_01, MNT_01, FOR_01 | CAV, PAR_01, MAR, MNT override vanilla. PAR_02 (Aeronáutica ground and air-assault units) and FOR_01 (coastal fortresses: Copacabana, Imbuí, Leme, São João) are new. |
| Territorial and state | GAR_01, GNA_01, FPU_01, RES_01, GUA_01 | GAR_01 overrides vanilla (Regiões Militares garrisons). New: Guarda Nacional, state Forças Públicas and Polícias Militares (São Paulo, Brigada Militar RS, Minas), Tiro de Guerra and reserve battalions, Presidential Guard. |
| Frontier and jungle | FRO_01, SEL_01 | Batalhões de Fronteira and Amazon jungle infantry, with Soldados da Borracha and river flotilla traditions. |
| Expeditionary | EXP_01, FL_01 | EXP_01: FEB-style expeditionary divisions and regiments (Sampaio, Ipiranga, Tiradentes). FL_01: Legião Estrangeira, the tag vanilla left commented out. |
| Fascist (`fascism`) | FAS_01 Integralist Divisions, FAS_02 Integralist Militia | AIB: Camisas-Verdes, Legiões, núcleos, Anauê tradition. |
| Communist (`communism`) | RED_01 Red Guards, COM_01 People's Army Divisions | Coluna Prestes, ANL, 1935 Intentona units, peasant leagues. |
| Democratic (`democratic`) | DEM_01 Constitutionalist Divisions, DEM_02 Volunteer Corps | 1932 Revolução Constitucionalista (MMDC, Legião Negra, Piratininga). |
| Neutrality/Monarchy (`neutrality`) | IMP_01 Imperial Guard Divisions, IMP_02 Voluntários da Pátria | Empire-era traditions (Dragões da Independência, Paraguayan War volunteers). |

Group-tag count and per-group `can_use` triggers get finalized once the dossier lands. Lists with thin, unverifiable history are merged rather than padded. FL_01 gating (ungated versus democratic/neutrality, which is what the commented vanilla focus used) is decided from the dossier.

**Risk to settle in the dossier**: in HOI4, Brazil's `neutrality` government is Vargas's Estado Novo, which is not monarchist. The Imperial lists therefore stay gated on `neutrality` but are named and populated as an Empire-restoration tradition, while Estado Novo style names (Vargas-era units) go in the ungated general lists.

## Workflow (phases)
1. **Plan file in repo**: after plan approval, copy this to `docs/superpowers/plans/2026-10-01-brazil-namelist.md` (Phase 0 decisions, vanilla table, suite table, empty "Author confirmation" list). `-AuditPlan` is only for audits.
2. **Research**: dispatch `inex-historical-researcher` with the country, tag, Phase 0 answers and the vanilla table above. It writes `scratch/bra_dossier.md` (one `##` section per group family) and returns at most 200 words. Dossier must cover:
   - Exército divisions and Regiões Militares as of 1930s-40s (1ª-7ª DI, 1ª-3ª DC at Santana do Livramento, Alegrete, Bagé, Uruguaiana), regimental numbers and patron names (Regimento Sampaio, Ipiranga, Tiradentes, Dragões da Independência).
   - Mountain troops (11º BI Montanha, São João del-Rei, Monte Castelo), the Marine Corps (Fuzileiros Navais, Riachuelo, Humaitá, Tonelero) and Brazilian airborne (Brigada Paraquedista, BINFAE).
   - Regional and hero naming (Caxias, Osório, Deodoro, Floriano, Rondon, Tamandaré; bandeirante and Farroupilha motifs).
   - Ideological material for the four suites.
3. **Clear point**: with the dossier written and the plan holding the decisions, tell the user it is safe to `/clear`, then resume with "author the BRA namelist".
4. **Author** `common/units/names_divisions/INEX_BRA_names_divisions.txt`:
   - Seed with the Write tool, using the template in the skill §4 (UTF-8 without BOM, balanced braces).
   - Add groups only via `build.ps1 -EditNames BRA -AddGroup -Group <TAG> -Selector ... -AddType ... -Fallback ... [-CanUse ...] [-Link ...]`.
   - Fill them with `-EditNames BRA -Batch scratch\bra_edits.json`. Use the batch for apostrophes and quotes, and for all-or-nothing edits.
   - Turn vanilla groups into plain variants with `-ClearOrdered -Comment "<override note>"`.
   - Selectors: plural, at most 28 chars, no demonym (`"Infantry Divisions"`, `"Infantry Divisions (Named)"`, `"Expeditionary Divisions"`).
   - Depth target: 20-30+ entries on the main lines. Fallbacks use `%dª` or `%dº` with no suffix tricks (`%d` or `%s` only).
5. **Docs sync** (`CLAUDE.md` §4):
   - `WORKSHOP_DESCRIPTION_GUIDELINES.md`: cross-reference row plus a `[b]Brazil[/b]` block with 2-3 bullets and `[i]...[/i]` examples. The description is about 14.5k of 17k chars now, so the block stays at about 500-600 chars. No emojis.
   - `README.md` summary-table row, with tags and source file.
   - `wiki/Brazil.md`, `wiki/Home.md` row and `wiki/_Sidebar.md` entry. Keep group rows in step with `-SyncWiki BRA`.
   - The wiki push, `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Document BRA division namelists"`, is outward-facing and runs only after the user confirms.
6. **Verify**: `powershell -File .\build.ps1 -Check BRA`, plus `-DiffNames BRA` for counts. Every audit flag still showing needs a written reason in the plan.
7. **Proofread**: authored Portuguese names will far exceed 25, so dispatch `inex-code-reviewer` with the `-DiffNames BRA` added names, the language (Brazilian Portuguese), and the Author-confirmation list. Fix what it finds via `-EditNames`, then run `-Check BRA` again. Record the findings in the plan.
8. **Completion**: report the `-Check` result. On request, output the ready-to-copy Steam BBCode description and a change summary.

## Critical files
- New: `common/units/names_divisions/INEX_BRA_names_divisions.txt`, `wiki/Brazil.md`, `docs/superpowers/plans/2026-10-01-brazil-namelist.md`, `scratch/bra_dossier.md`, `scratch/bra_edits.json`.
- Edited: `WORKSHOP_DESCRIPTION_GUIDELINES.md`, `README.md`, `wiki/Home.md`, `wiki/_Sidebar.md`.
- Reused: the Japan plan `docs/superpowers/plans/2026-10-01-japan-namelist.md` as the structure template, and `build.ps1` (`-InspectVanilla`, `-AddGroup`, `-EditNames -Batch`, `-SyncWiki`, `-Check`) as the only editing path after seeding. Nothing in `build.ps1`, tests or skills is edited.

## Verification
- `-Check BRA` passes (`-ValidateOnly`, Pester suite, audit, `Docs:` checks, diff counts).
- `-InspectVanilla BRA` tag list is a subset of the INEX file's tags: all 9 vanilla tags are overridden, so none falls back to vanilla stubs.
- `-Audit BRA -NamesOnly` spot check: plain groups show `Variant: plain`, gated groups show `can_use`, no `DUPLICATE_NAME`, `POLITICAL_ENTRY` or `PLACEHOLDER_ENTRIES`.
- No `has_completed_focus`, decision, idea or flag gates.
- `git status` shows only the intended files changed (no `CLAUDE.md`/`GEMINI.md` edits, so no mirror sync).

## Author confirmation
(extrapolated names and entries held for the author; filled during authoring)

## Progress
- [x] Phase 0 decisions and vanilla inspection
- [x] Dossier: scratch/bra_dossier.md (about 28 web calls; about 12 UNVERIFIED items listed at its end)
  - Corrections: 1ª DC HQ was Santiago in 1921, not Santana do Livramento; airborne units are 25º/26º/27º BI Pqdt, no 1º BI Pqdt.
  - Dossier advises gating IMP lists on a monarchy/restoration flag. Rejected: `CLAUDE.md` §6 bans flag/focus locks, so IMP stays `has_government = neutrality`, worded as an Empire tradition.
- [ ] Authoring
- [ ] Docs sync
- [ ] -Check BRA
- [ ] Proofread
