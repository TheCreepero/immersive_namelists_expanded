# Japan (JAP) Namelist

## Context
Japan has no INEX file yet. Vanilla ships 14 `JAP_*` groups, romanized without macrons, with generic fallbacks and some English text (`JAP_MNT_01` fallback `%d Mountain Division`). Vanilla focuses and scripted effects reference `JAP_INF_01`, `JAP_CAV_01`, `JAP_MIL_01` and `JAP_MIL_02`; those tags stay as fallbacks if left alone. New-nation authoring task per the `hoi4-inex-namelist-authoring` runbook.

## Phase 0 decisions (user-confirmed)
- **Script**: romaji in Hepburn with macrons (Shōwa, Rikusentai, Kōkūtai), nominative forms, native word order (`Dai-%d Sensha Shidan`).
- **Extrapolation**: verified IJA/IJN names plus plausible extension in the Japanese pattern; every extrapolated name is marked in "Author confirmation"; nothing is invented to hit a count.
- **Ideologies**: neutrality keeps the general IJA lists; separate gated suites for fascism (Kokutai/Imperial-way), democratic (Taishō-democracy / Jieitai-style defense force) and communism (people's-army/Red-guard style). Gate by `can_use = { has_government = ... }` only.
- **Scope**: full set, with plain/named pairs.

## Vanilla findings (`-InspectVanilla JAP`)
| Tag | Vanilla state | Action |
|---|---|---|
| JAP_INF_01 | 168 entries, `%d Hohei Shidan` fallback; focus-referenced | plain, `-ClearOrdered`, fix fallback |
| JAP_MOT_01 / MEC_01 | 162 entries each, link INF_01 | plain, keep link |
| JAP_ARM_01 | 30 entries, `Sensha Dai-%d Shidan` | plain |
| JAP_CAV_01 | 20 stubs, focus-referenced | override with real entries |
| JAP_PAR_01 / MAR_01 / MNT_01 | stubs / Sasebo etc. / English fallback | override |
| JAP_GAR_01 / IMB_01 | 41 / 129 entries | override with corrected lists |
| JAP_MIL_01 / MIL_02 | 10 / 2 entries, focus-referenced (MIL_02 is communist-themed: Nosaka, Tokuda) | override, keep tags |
| JAP_RGR_01 / BIC_01 | 20 stubs each | override |

## Target group suite (as authored, 32 groups)
| Section | Tags | Notes |
|---|---|---|
| Field divisions | INF_01/02, MOT_01/02, MEC_01/02, ARM_01/02 | plain (vanilla tag, fallback only) + Named; MOT_01 and MEC_01 link to INF_01/MOT_01, MOT_02/MEC_02 to MOT_01, INF_02 to INF_01, ARM_02 to ARM_01 |
| Specialist | CAV_01, PAR_01, PAR_02, MAR_01, AMP_01, MNT_01 | CAV/PAR_01/MAR/MNT override vanilla; PAR_02 (naval airborne) and AMP_01 (army amphibious) are new |
| Garrison/territorial | GAR_01, GAR_02, FOR_01, IMB_01, BDR_01, GUA_01, KEN_01, MIL_01, RGR_01, BIC_01 | GUA_01 gated `NOT communism`, KEN_01 `OR fascism/neutrality`, others ungated |
| Fascist (`fascism`) | FAS_01 Kokutai Divisions, FAS_02 Yokusan Corps | |
| Democratic (`democratic`) | DEM_01 divisions, DEM_02 brigades, DEM_03 airborne, DEM_04 volunteer corps | Jieitai-style |
| Communist (`communism`) | RED_01 Red Guards, COM_01 People's Army Divisions | |

## Workflow
1. Plan file (this).
2. Research: `inex-historical-researcher` -> `scratch/jap_dossier.md`.
3. Author: Write seed file, then `-AddGroup` and `-EditNames JAP -Batch scratch\jap_edits.json` only.
4. Docs sync (CLAUDE.md §4); wiki push only after user confirmation.
5. `-Check JAP`.
6. Proofread with `inex-code-reviewer` (25+ non-English names).
7. Mirror check (no rule/skill change expected).

## Author confirmation
Held for the user (dossier flags `[M]`/UNVERIFIED, not re-fetched):
- Tsūshōgō readings: kun readings used (Tama, Isamu, Take); 3rd Division `Kō` (vs Sachi), 6th `Mei`, 4th Tank Division `Hagane` (vs Kō); the dossier did not obtain the table for divisions 22, 25-32, 34-42 and others, so those keys fall back to the plain numbered name.
- Memory-sourced entries: Teishin Renshū Butai, Kaoru Kūteitai, Ran Heidan (1st Raiding), Akatsuki Butai, Senpaku Kōhei Rentai, Kaijō Kihon Daitai, Nigitsu/Mayasan/Kumano Maru Butai, Konoe Yasen Hōhei Rentai, Konoe Kōhei Daitai, border garrison district readings (Kotō, Tōnei, Suifunka, Konshun, Manshūri, Kokka, Sonugo, Aikun, Hairaru, Arushan), the Yōsai place list (Chinkai, Ryojun, Takao, Mako, Maizuru, Hakodate), Keibufu names, `Konkyochitai` fallback.
- Extrapolated (no such unit existed): motorized and mechanized divisions and their fallbacks (`Jidōsha`/`Kikaika Dai-N Shidan`), all of MNT_01, CAV_01 regiments `<tsūshōgō> Kihei Rentai`, Kantōgun Kihei Ryodan, PAR_02 air-group pairings, regional GAR_01/KEN_01/RGR_01/MIL_01 pairings, BIC_01 divisions other than Konoe/5th/18th, Kōkyo Keibitai, ARM_02 keys 5-10, and every ideology-suite formation (FAS, DEM, RED, COM). Real JCP organs inside RED_01: Chūkaku Jieitai, Dokuritsu Yūgekitai, Sanson Kōsakutai.
- Not used (UNVERIFIED in the dossier): Yamamura Kōsakutai, Kōrigumi, Jinmu-kai, `Kantei`, 88th Division tsūshōgō, Kikōgun commander.

## Outcome (2026-10-01)

### Decisions taken during authoring (deviations from the plan)
- **General lists are ungated** (`always = yes`), not neutrality-only: vanilla Japan runs on fascism, so gating the IJA lists by neutrality would have emptied them for the default government. Fascist, democratic and communist suites are gated by `has_government` as planned.
- **Word order**: armor uses the verified IJA form `Sensha Dai-%d Shidan` (branch first), not `Dai-%d Sensha Shidan`; motorized and mechanized follow it (`Jidōsha`/`Kikaika Dai-%d Shidan`).
- **JAP_MIL_02 left to vanilla**: it is shared by the communist-uprising `Sanson Kōsakutai` template and the non-communist `Ashigaru Levy` template, so no single gated list fits; the real JCP organs live in the gated RED_01. JAP_MIL_01 is overridden ungated (used by the Bōeitai and fifth-column focuses).
- **SNLF folded into JAP_MAR_01** (vanilla's Rikusentai tag) instead of a separate group; JAP_AMP_01 carries the Army amphibious forces. Kempeitai, border garrison and Konoe groups are new as planned; "Kōkūtai airborne cadres" became PAR_02 (Navy parachute units paired with real air-group bases, extrapolated).
- **ARM_01/02 not linked to the infantry family** (real tank-division numbering is independent); MOT/MEC/INF share numbering through MOT_01.
- `JAP_IMB_01` is fallback-only: IMBs were numbered only; vanilla's 129 stub entries are dropped.
- `bicycle_battalion` is not a valid token, so BIC_01 uses `infantry`.
- Tooling note: `-Comment` with a banner on an existing group added a second banner above CAV_01; removed once by hand (cosmetic, no content changed).

### Flags kept (`-Check JAP`)
- LOW_DEPTH: PAR_01 (8; the Army airborne arm was one group), GAR_02 (9), IMB_01 (fallback-only by design), GUA_01 (8; one guard division and its regiments), DEM_03 (3 authored; small airborne arm), MAR_01 (also PLACEHOLDER_ENTRIES: official SNLF designations are `<district> Dai-N Tokubetsu Rikusentai`, so entries share a pattern by design).
- UNGATED_POLITICAL: MIL_01, focus-referenced by two paths, so it cannot be gated.

### Phase 3 proofread (inex-code-reviewer, 502 added names)
`No issues found`. It made one web call, so treat it as a light pass; the author-confirmation list above is the real open item.

### Docs synced
`WORKSHOP_DESCRIPTION_GUIDELINES.md` (cross-reference row and `[b]Japan[/b]` block), `README.md`, `wiki/Japan.md` (generated from the file by `scratch/gen_jap_wiki.py`), `wiki/Home.md` (32 groups), `wiki/_Sidebar.md`. Wiki push pending the user's confirmation.
