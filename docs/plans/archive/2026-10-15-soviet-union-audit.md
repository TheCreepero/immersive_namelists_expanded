# Soviet Union (SOV) Namelist Audit - 2026-10-15

Status: DONE

File: `common/units/names_divisions/zz_INEX_SOV_names_divisions.txt`

## For the implementer
Planning and research are finished once Status is READY. Run this plan with the `hoi4-inex-namelist-implement` skill: start at the first unticked box under "Implementation steps" and read no further than `## Edit batch`. Do not research, re-decide, dispatch a researcher or invoke the audit skill. When a stop condition applies, stop and report.

## Initial report (`-Audit SOV`)
- AUDIT SUMMARY SOV: GROUPS=20 AUTHORED=285/361 FLAGS=18
- [SOV_MEC_01] flags: NAME_LONG
- [SOV_ARM_01] flags: LOW_DEPTH
- [SOV_ARM_02] flags: LOW_DEPTH
- [SOV_ARM_03] flags: LOW_DEPTH
- [SOV_ARM_04] flags: LOW_DEPTH
- [SOV_PAR_01] flags: NAME_LONG
- [SOV_MNT_01] flags: LOW_DEPTH
- [SOV_GAR_01] flags: NAME_LONG
- [SOV_GRD_01] flags: NAME_LONG
- [SOV_GMC_01] flags: LOW_DEPTH, NAME_LONG
- [SOV_GTC_01] flags: LOW_DEPTH
- [SOV_CAV_02] flags: NAME_LONG
- [SOV_PEN_01] flags: LOW_DEPTH
- [SOV_AIR_01] flags: LOW_DEPTH, NAME_LONG
- [SOV_ART_01] flags: NAME_LONG
- [File] IDENTITY_REPEAT (Chernigovskaya, Leningradskaya, Moskovskaya, Zvenigorodskaya)
- Vanilla: SOV_INF_01 leaves out 361 numbered keys and 1 name; SOV_CAV_01 75 keys; SOV_CAV_02 82 keys and 11 names (307-317 Guards Cossack); SOV_MOT_01 5 keys and 6 names (NKVD 804-823); SOV_MEC_01 23 keys; SOV_MNT_01 8 keys; SOV_ARM_01-04 10 keys each (101-112); SOV_PAR_01 11 names (Guards airborne 11-16, 21, 31, 103, 104, 114); SOV_GAR_01 38 names (garbled NKVD category stubs); SOV_PEN_01 4 names (1..N stubs).
- Found on manual review:
  - SOV_INF_01: the 2026-10-01 audit shifted vanilla's honorifics onto wrong numbers: 9 'Ulyanovskaya' (vanilla and history: 16th), 11 'Permskaya' (21st), 16 'Krasnodarskaya' (22nd); 21 and 22 are missing. 20 'Stalingradskaya' duplicates the 31st. Keys 9 and 20 take mountain-division numbers (SOV_MNT_01 9, 20) out of the shared pool.
  - Honorifics invented on real numbers: SOV_MOT_01 81-221 (21 entries) and NKVD 802/803/808/821; SOV_MEC_01 69, 84, 103, 109; SOV_CAV_01 2, 17, 30, 33, 41, 57, 75, 83; SOV_NKVD_01 all regional adjectives on keys 1-30; SOV_GAR_01 1, 2, 14, 18, 41, 57; SOV_MAR_01 55, 66, 83; SOV_ARM_02 25.
  - Wrong honorifics: SOV_GRD_01 22, 29, 30, 41, 50, 53, 90, 100; SOV_ARM_02 5, 9, 18; SOV_ART_01 keys 6-21 mostly shifted, 7th Guards never existed; SOV_MNT_01 20 'Proletariata Donbassa' belongs to the 80th Rifle Division (vanilla error).
  - Awards quoted as honorifics: 'Krasnoznamennaya' in SOV_GRD_01 9, SOV_MOT_01/MEC_01 109, SOV_NKVD_01 4, 11, SOV_MAR_01 66, SOV_ART_01 6.
  - Duplicate groups: SOV_ARM_03 and SOV_GTC_01 hold the same 12 Guards Tank Corps; SOV_PAR_01 101-110 repeats SOV_AIR_01 1-10.
  - SOV_CAV_02 Guards entries render "9-ya (9-ya Gv.) ..."; only the 9th-12th Guards cavalry divisions were Cossack; 13, 15 and 17 Gv contradict SOV_CAV_01 301-317.
  - Selectors: "Guard Tank Corps", "Guards Tanks", "Guards Rifles", "Guards Mechanized" are unclear or ungrammatical.
  - Orthography: Kiyev- and Kiev- mixed; soft signs kept only in SOV_CAV_02 and SOV_PEN_01 (Kazach'ya, Stavropol'skaya, Chast'); 'Krasnoznamyonnyy' against 'Krasnoznamennaya' everywhere else.
  - SOV_ART_01 uses `division_types = { "artillery" }`, the support-company id (tooling backlog, Validation).

## User decisions
Policy answers before research (2026-10-15):
- Scope: audit the file and expand it with new groups. Chosen (8, one over the "5 to 7" asked for): National Rifle Divisions, Fortified Regions, Naval Rifle Brigades, Mechanized Corps (regular army); Partisan Formations (communism), Imperial Guard (neutrality), White Volunteer Divisions (fascism), Republican Shock Divisions (democratic).
- Honorifics, strict: a real division number keeps an honorific only if research verifies it; vanilla's own honorifics count as sourced. Everything else goes back to the plain number. Invented titles may stand only on numbers that never existed, named as extrapolated in the Rationale.
- Vanilla numbering: restore vanilla's historical numbered keys as plain entries in `SOV_INF_01`, `SOV_CAV_01`, `SOV_MNT_01` and `SOV_MOT_01`. `SOV_ARM_01`-`SOV_ARM_04`, `SOV_MEC_01` and `SOV_CAV_02` keep a plain count, because vanilla copy-pasted those keys.

Checkpoint answers (2026-10-15):
- The audit report is approved as presented, with the 8 new groups (SOV_MEC_02 included although it holds only three honorifics).
- Every "Author confirmation" entry is kept.
- The user asked to continue to implementation once the plan is READY.

## Research
- `inex-audit-researcher` run 1 (25 web calls): motorized and mechanized, Guards Rifle, cavalry, tank corps, breakthrough artillery. Tank corps and artillery settled; most other entries came back unverified (bdsa.ru 403, rkka.wiki timeouts).
- `inex-audit-researcher` run 2 (25 web calls): Guards Rifle 7-100, Guards cavalry, NKVD 70th Army, artillery recheck, rifle 80/84. Sources: ru.wikipedia per-division articles; ru.wikipedia "Артиллерийская дивизия прорыва". Cavalry and NKVD stayed mostly unverified.
- `inex-historical-researcher` army dossier (37 web calls), `scratch/sov_dossier_army.md`: national divisions (ru.wikipedia "Национальные воинские формирования РККА"), fortified regions (istmat.org "Укрепленные районы приграничных военных округов на 22.06.1941", ru.wikipedia "Укреплённый район"), naval infantry (ru.wikipedia "Морская пехота СССР" and its brigade category; balagan.info), mechanized corps (en.wikipedia "Mechanised corps (Soviet Union)", aukedevlieger.nl honorifics).
- `inex-historical-researcher` politics dossier (33 web calls), `scratch/sov_dossier_politics.md`: partisans (ru.wikipedia "Советские партизаны в ВОВ", archives.gov.by, ESU), Imperial Guard (ru.wikipedia "Гвардия (Российская империя)"), White armies (ru.wikipedia "Русская армия Врангеля", pygmywars.com orders of battle), Komuch (ru.wikipedia "Народная армия Комуча"), 1917 shock units (en.wikipedia).

## Rationale
Policy (User decisions): strict honorifics, vanilla honorifics count as sourced unless research shows them wrong; historical numbering restored in INF_01, CAV_01, MNT_01, MOT_01.

Existing groups:
- SOV_INF_01: rewritten in vanilla's 413 keys. Vanilla honorifics stay (respelled to the file's BGN form); the shifted ones go back to 16, 21, 22; 9 and 20 leave the group (mountain numbers); 80 'imeni Proletariata Donbassa' and 84 'imeni Tulskogo Proletariata' (ru.wikipedia). The other 361 keys are plain `%d-ya Strelkovaya Diviziya`, so rifle, mountain and motor rifle divisions keep vanilla's historical numbers in the shared pool. No plain/named pair: vanilla itself nicknames this group (R10 exemption).
- SOV_CAV_01: vanilla's 115 keys. Vanilla honorifics stay (1 'Chernigovskaya', 5 'imeni Blinova'); INEX additions without a source go plain. 13 goes plain: vanilla's 'Kubanskaya' repeats 12 and the 13th was most likely the Don Cossack division. Added from the national-formations list: 17 'Armyanskaya' and 19 'Uzbekskaya' mountain cavalry, and the national cavalry divisions 97-115. Guards 301-317: verified honorifics only (1 Gv 'Stavropolskaya', 11 Gv 'Volnovakhskaya', 12 Gv 'Korsunskaya', 13 Gv 'Rovenskaya', 17 Gv 'Mozyrskaya').
- SOV_MOT_01: vanilla's keys. Vanilla's six honorifics and 801 OMSDON stay, 84 'imeni Tulskogo Proletariata'; the 21 invented ones go plain; the NKVD 802-823 series is restored as plain NKVD motor rifle divisions.
- SOV_MEC_01: no restore (vanilla copy-pasted these keys). Keeps the lineage names of 1, 7, 15, 29, 36, 57 and 84 (extrapolated: the Red Army fielded no mechanized divisions with these numbers); 69, 103, 109 removed.
- SOV_ARM_02: research corrections (5 'Dvinskiy', 9 'Bobruysko-Berlinskiy', 18 'Znamensko-Budapeshtskiy'), 25 removed, 11 'Radomsko-Berlinskiy' and 19 'Perekopskiy' added: every non-Guards tank corps that held an honorific in 1945.
- SOV_ARM_03 / SOV_GTC_01: one list in two groups. ARM_03 becomes the plain "Guards Tank Corps" (fallback only, vanilla's `has_war` gate kept); GTC_01 becomes "Guards Tank Corps (Named)" and links its numbering to ARM_03 (R10).
- SOV_PAR_01 / SOV_AIR_01: PAR_01 becomes the plain "Airborne Divisions" (fallback only; its Guards entries live on in AIR_01). AIR_01 carries the whole Guards airborne series in vanilla's numbers: 1-10 with their honorifics, 11-16, 21, 31, 103, 104, 114 plain, 76 'Chernigovskaya', 98 'Svirskaya', 106 'Tulskaya'.
- SOV_MAR_01: 1 becomes the real 1st 'Mozyrskaya' Naval Infantry Division (Baltic Fleet, 1944-48); 'Baltiyskaya' moves to 11. The fleet titles 2-11 are extrapolated (the Red Army formed naval infantry brigades, not divisions). 55, 66 and 83 removed (83 'Novorossiysko-Dunayskaya' goes to SOV_MAR_02 as the brigade it was).
- SOV_MNT_01: vanilla's 8 missing keys restored plain; 20 goes plain (no Donbass title on the 20th Mountain Rifle Division).
- SOV_GAR_01: the regional adjectives on 1, 2, 14, 18, 41, 57 are removed, so vanilla's categories remain (border, railway protection, NKVD rifle). The Moscow and Leningrad Opolcheniye and Communist divisions stay as verified on 2026-10-01. Vanilla's garbled stubs ("NKVD SU Otdel", "BZ Otdel", "Zashchite Zheleznykh") are not restored.
- SOV_GRD_01: research corrections (7 kept, 9 plain, 22 'Rizhskaya', 29 'Yelninskaya', 30 'Rizhskaya', 41 'Korsunsko-Dunayskaya', 50 'Stalinskaya', 53 'Tartuskaya', 90 'Vitebsko-Novgorodskaya', 100 'Svirskaya'); national Guards added: 43 'Rizhskaya' Latvian, 118 'Tallinnskaya' and 122 Estonian.
- SOV_CAV_02: keys 1-8 keep the host titles (extrapolated: a numbered Cossack series of these hosts never existed). The Guards entries become the four real Guards Cossack divisions as fixed names at 309-312 (9 and 10 Kuban, 11 and 12 Don); vanilla's 307, 308 and 313-317 are dropped on purpose, because those Guards divisions were not Cossack (they are in SOV_CAV_01). Soft signs dropped.
- SOV_NKVD_01: every keyed title was invented. The group keeps its fallback and holds the six named NKVD rifle divisions of the 70th Army as fixed names (see Author confirmation).
- SOV_ART_01: rewritten from ru.wikipedia's list: 26 non-Guards breakthrough artillery divisions with place honorifics on their own numbers, and the six Guards divisions as fixed names at 101-106 (the 4th Guards was a heavy gun division). The `artillery` token stays until the backlog entry is settled.
- Selectors: ARM_03 "Guards Tank Corps", GTC_01 "Guards Tank Corps (Named)", GRD_01 "Guards Rifle Divisions", GMC_01 "Guards Mechanized Corps", PAR_01 "Airborne Divisions".
- Orthography: Kiyev- throughout; no soft signs (Kazachya, Chast). An award (Krasnoznamennaya, Krasnoznamyonnyy) is never quoted as an honorific, so SOV_CAV_01 22, SOV_GRD_01 9 and SOV_GTC_01 8 are plain.
- File header (R1) rewritten for the new groups; banners kept above SOV_INF_01, SOV_CAV_01, SOV_PAR_01, SOV_NKVD_01 and SOV_ART_01, and a new "Ideology-Gated Groups" banner above SOV_PRT_01.

New groups (8):
- SOV_NAT_01 "National Rifle Divisions" (infantry, links SOV_INF_01): 23 national divisions on their real numbers: Latvian, Lithuanian, Estonian, Armenian, Azerbaijani, Georgian, Kazakh, Karelo-Finnish. An honorific is quoted, and the nationality follows it unquoted.
- SOV_UR_01 "Fortified Regions" (infantry): the Stalin Line, Molotov Line, Leningrad, Karelian, Transcaucasian and Far Eastern URs, plus the 1941 Moscow field URs, each on its 22 June 1941 number. The place name is the real designation.
- SOV_MAR_02 "Naval Rifle Brigades" (marine): naval infantry brigades by fleet with their honorifics (Pechengskaya, Kirkenesskaya, Novorossiysko-Dunayskaya, Tamanskaya) and the numbered naval rifle brigades of 1941-42.
- SOV_MEC_02 "Mechanized Corps" (mechanized, motorized): the non-Guards corps of 1942-45 that held honorifics (1st, 7th, 9th); the 1940-41 series 1-30 had none, so the fallback carries it.
- SOV_PRT_01 "Partisan Formations" (communism; militia, infantry): Kovpak's 1st Ukrainian Partisan Division, the Ukrainian formations, Belarusian and Leningrad brigades, Crimean formations.
- SOV_IMP_01 "Imperial Guard Divisions" (neutrality): the three 1914 Guards infantry divisions named after their senior regiments (1 Preobrazhenskaya, 2 Moskovskaya, 3 Litovskaya). The other Leib-Guard infantry and rifle regiments give the further divisions their names. This is extrapolated onto real regiment names.
- SOV_WHT_01 "White Volunteer Divisions" (fascism): the four colored divisions, Kolchak's named divisions (Izhevsk, Votkinsk, Sarapul, Siberian, Steppe, Ural, Shock). The North-Western Army's regiment towns as division titles are extrapolated.
- SOV_REP_01 "Republican Shock Divisions" (democratic): the Komuch People's Army (2nd 'Syzranskaya', 3rd), its Volga town titles extrapolated onto further divisions, and the 1917 shock and women's battalions.

## Verified formations & commanders
- Vanilla honorifics kept in SOV_INF_01, SOV_CAV_01, SOV_MOT_01, SOV_MNT_01 (Paradox's list; counted as sourced by the user's policy).
- Rifle: 80th 'imeni Proletariata Donbassa', 84th 'imeni Tulskogo Proletariata' (ru.wikipedia per-division articles); 1st 'Moskovskaya Proletarskaya' (well documented).
- Guards Rifle (ru.wikipedia per-division articles, run 2): 1 Moskovsko-Minskaya, 7 Rezhitskaya, 20 Krivorozhskaya, 22 Rizhskaya (2nd formation), 29 Yelninskaya, 30 Rizhskaya, 41 Korsunsko-Dunayskaya, 50 Stalinskaya, 53 Tartuskaya, 64 Krasnoselskaya, 90 Vitebsko-Novgorodskaya, 100 Svirskaya; 3 Volnovakhskaya (honorifics page). Kept from 2026-10-01 without recheck: 2, 4, 5, 6, 8, 10, 11, 13, 15, 24, 25, 27, 32, 33, 35, 39, 45, 51, 63, 70, 72, 75, 82. National Guards: 43rd 'Rizhskaya' Latvian (en.wikipedia 43rd Guards RD), 118th 'Tallinnskaya' and 122nd Estonian (ru.wikipedia national formations).
- Guards cavalry: 1 Gv Stavropolskaya (ru.wikipedia snippet), 11 Gv Volnovakhskaya (honorifics page), 12 Gv Korsunskaya, Don Cossack (ru.wikipedia title), 13 Gv Rovenskaya, 17 Gv Mozyrskaya (ru.wikipedia articles). The 9th and 10th Guards (Kuban) and 11th and 12th Guards (Don) were the Guards Cossack divisions, from the 17th (4th Guards) Cossack Cavalry Corps: ru.wikipedia "Гвардейские дивизии", well documented.
- National cavalry 97-115 and mountain cavalry 17 Armenian, 19 Uzbek, 20 Tajik: ru.wikipedia "Национальные воинские формирования РККА".
- Tank corps (ru.wikipedia "Танковый корпус РККА", 1945 table, and per-corps articles): 1 Insterburgskiy, 5 Dvinskiy, 9 Bobruysko-Berlinskiy, 10 Dneprovskiy, 11 Radomsko-Berlinskiy, 18 Znamensko-Budapeshtskiy, 19 Perekopskiy, 20 Zvenigorodskiy, 23 Budapeshtskiy, 29 Znamenskiy, 31 Vislenskiy.
- Guards Tank Corps 1-12, Guards Mechanized Corps 1-9: verified 2026-10-01 (tankfront.ru).
- Guards Airborne 1-10 (2026-10-01); 76, 98, 106 and the series numbers 11-16, 21, 31, 103, 104, 114 from vanilla.
- Breakthrough artillery (ru.wikipedia "Артиллерийская дивизия прорыва", run 2): non-Guards 1 Pomeranskaya, 2 Ostrovskaya, 3 Zhitomirskaya, 4 Berlinskaya, 5 Kalinkovichskaya, 6 Mozyrskaya, 7 Zaporozhskaya, 9 Zaporozhskaya, 10 Gumbinnenskaya, 11 Kirovogradskaya, 13 Kiyevskaya, 14 Berlinskaya, 15 Leningradskaya, 16 Kirovogradskaya, 17 Kiyevsko-Zhitomirskaya, 18 Gatchinskaya, 19 Venskaya, 20 Orshanskaya, 21 Dukhovshchinskaya, 22 Gomelskaya, 23 Krasnoselskaya, 25 Berlinskaya, 26 Sivashsko-Shtettinskaya, 27 Rezhitskaya, 30 Venskaya, 31 Drezdenskaya; Guards 1 Glukhovskaya, 2 Perekopskaya, 3 Vitebsko-Khinganskaya, 4 Smolenskaya (heavy gun), 5 Stalingradskaya, 6 Rizhsko-Khinganskaya.
- Opolcheniye and Moscow Communist divisions in SOV_GAR_01: verified 2026-10-01 (13dno.ru, mosopolchenie.ru, 3mksd.ru).
- 1st 'Mozyrskaya' Naval Infantry Division (ru.wikipedia "Морская пехота СССР").
- National rifle divisions (ru.wikipedia national formations; en.wikipedia per-division): 7, 16 Klaypedskaya, 71, 77 Simferopolskaya, 89 Tamanskaya, 150, 201, 223 Belgradskaya, 227 Temryukskaya, 249, 261, 271 Gorlovskaya, 276 Temryukskaya, 308, 316, 390, 392, 396, 402, 408, 409, 414 Anapskaya, 416 Taganrogskaya.
- Fortified regions: istmat.org 22 June 1941 table and ru.wikipedia "Укреплённый район" (numbers and names as listed in the batch; MED rows: 11, 12, 15, 17, 21, 41, 45, 51, 55, 81, 83, 109, 113 and the field URs 16, 90, 152, 154-157).
- Naval infantry brigades: 1st Special, 2-6 and 260 Baltic, 7-9 Black Sea, 12 Pechengskaya, 13 Guards Pacific, 63 Kirkenesskaya, 83 Novorossiysko-Dunayskaya, 254 Northern, 255 Tamanskaya; naval rifle brigades 61, 62, 64-77, 80, 81, 85, 116, 154 (ru.wikipedia "Морская пехота СССР" and category, balagan.info).
- Mechanized corps: 1 Krasnogradskiy (aukedevlieger.nl honorifics, MED), 7 Novoukrainsko-Khinganskiy (en.wikipedia 7th Mechanized Corps), 9 Kiyevsko-Zhitomirskiy (en.wikipedia 9th Mechanized Corps, MED).
- Partisans: 1st Ukrainian Partisan Division imeni Kovpaka (ESU), Sumskoye, Chernigovsko-Volynskoye, Chernigovskoye, imeni Mikhaylova formations (ru.wikipedia), 1st and 2nd Belorusskaya, 1st Minskaya, 1st Vitebskaya, 'Chekist', 'Zheleznyak', imeni Chapayeva, imeni Lenina brigades (en.wikipedia, archives.gov.by, libr.msu.by), 1st, 2nd, 3rd imeni Germana, 5th, 6th Leningrad brigades (ru.wikipedia), Severnoye Crimean formation (mc.rgo.ru), 'Pobediteli' detachment (en.wikipedia).
- Imperial Guard: the 1914 Guards Corps, its 12 infantry and 4 rifle regiments (ru.wikipedia "Гвардия (Российская империя)").
- Whites: Kornilov, Markov, Drozdov divisions (ru.wikipedia); 15th Votkinsk, 16th Sarapul, 4th Steppe, 7th Ural Mountain Rifle, 1st Siberian, 1st and 2nd Shock divisions (pygmywars.com), Izhevsk division (ru.wikipedia snippet); North-Western Army regiment towns (pygmywars.com).
- Komuch and 1917: 2nd Syzran and 3rd rifle divisions, the 9th-12th Volga regiments and the Volga front groups (ru.wikipedia "Народная армия Комуча"); 1st Russian (Slavic) Shock Regiment, the women's battalions of Bochkareva (1st Russian), Petrograd, Moscow, Kuban and Saratov (en.wikipedia).

## Author confirmation
Proposed at the checkpoint; each stays in the batch only if the user approves it:
- SOV_NKVD_01: the 70th Army's NKVD rifle divisions as fixed names, 'Dalnevostochnaya' (ru.wikipedia snippet, 102nd RD), 'Zabaykalskaya', 'Sibirskaya', 'Uralskaya', 'Sredneaziatskaya', 'Stalingradskaya' (researcher's city list agrees with the first four; Stalingradskaya unconfirmed).
- SOV_CAV_01 316: 16 Gv 'Chernigovskaya' (cyclowiki: the 112th Bashkir CD, which became the 16th Guards, received Chernigov in Sept 1943; one weak source).
- SOV_PRT_01: 'Rovenskoye' (Begma) and 'Zhitomirskoye' (Saburov) formations, 'Yuzhnoye' and 'Vostochnoye' Crimean formations, 7th Leningrad brigade, 100th 'imeni Kirova' brigade (one non-academic source).
- SOV_WHT_01: 'Alekseyevskaya' Pekhotnaya Diviziya (the regiment is certain, the division form is not).

## Kept on judgment
After all steps `-Audit SOV` shows 28 groups and 31 flags (test-applied on a scratch copy). Each is expected:
- File IDENTITY_REPEAT ('Belorusskaya' INF_01/PRT_01, 'Kubanskaya' CAV_01/CAV_02, 'Leningradskaya' GAR_01/ART_01/PRT_01): Soviet honorifics were given to many formations of different arms.
- PLACEHOLDER_ENTRIES (8): SOV_INF_01, SOV_CAV_01, SOV_MOT_01, SOV_MNT_01, SOV_AIR_01, SOV_MAR_02, SOV_MEC_02 hold vanilla's or history's numbered keys as plain entries (user decision; tooling backlog, Lints); SOV_NAT_01 repeats real national labels ('Armyanskaya' four times).
- LOW_DEPTH (12): SOV_MOT_01, SOV_MEC_01, SOV_MEC_02, SOV_MNT_01, SOV_MAR_02, SOV_NKVD_01 (strict policy: only verified honorifics); SOV_ARM_01, SOV_ARM_04, SOV_PAR_01, SOV_PEN_01 (plain fallback-only lists); SOV_GMC_01, SOV_GTC_01 (complete orders of battle: 9 and 12 corps).
- NAME_LONG (9): SOV_MEC_01, SOV_GAR_01, SOV_GRD_01, SOV_NAT_01, SOV_GMC_01, SOV_CAV_02, SOV_AIR_01, SOV_ART_01, SOV_IMP_01: full Russian designations with honorifics.
- UNLINKED_MOBILE: SOV_MEC_02. Mechanized corps had their own series and never shared rifle division numbers.
- Vanilla lines that stay on purpose: SOV_CAV_02 307, 308, 313-317 (not Cossack; in SOV_CAV_01); SOV_GAR_01's garbled stubs; SOV_ARM_01-04, SOV_MEC_01, SOV_CAV_02 numbered keys (plain count); SOV_PEN_01 1-4 (1..N stubs); SOV_PAR_01's Guards entries (in SOV_AIR_01).

## Implementation steps
All commands run from the repository root. Steps 1-5 were test-run in this order on a scratch copy of the repository.
- [x] 1. Set `Status: IN PROGRESS`, then apply the batch: `powershell -File .\build.ps1 -EditNames SOV -Batch docs/superpowers/plans/2026-10-15-soviet-union-audit.md`. Expect 18 `Edited SOV_...` lines, 8 `Added SOV_...` lines (MEC_02, MAR_02, UR_01, NAT_01, PRT_01, IMP_01, WHT_01, REP_01) and no `[ERROR]`.
- [x] 2. Link SOV_GTC_01 to SOV_ARM_03 (the batch cannot; tooling backlog, Editing, "`-Link` works only with `-AddGroup`"). Run this exact command; expect the output `1`:
  ```powershell
  $f = (Resolve-Path 'common/units/names_divisions/zz_INEX_SOV_names_divisions.txt').Path; $t = [IO.File]::ReadAllText($f); $re = [regex]'(?s)(SOV_GTC_01\s*=\s*\{(?:(?!\n\}).)*?)\t#link_numbering_with = \{ SOV_INF_01 \}'; if (-not $re.IsMatch($t)) { throw 'SOV_GTC_01: dead link comment not found' }; [IO.File]::WriteAllText($f, $re.Replace($t, '$1' + "`tlink_numbering_with = { SOV_ARM_03 }", 1), (New-Object Text.UTF8Encoding $false)); (Select-String -Path $f -Pattern 'link_numbering_with = \{ SOV_ARM_03 \}').Count
  ```
- [x] 3. Header (R1). Run this exact command; expect `Header of zz_INEX_SOV_names_divisions.txt replaced`:
  ```powershell
  powershell -File .\build.ps1 -SetHeader SOV -HeaderText 'Immersive Namelists Expanded: Soviet Union (SOV)\n\nRed Army formations of 1936-45 across all arms, and four ideology-gated suites:\n- Infantry: Strelkovye Divizii, national divisions, Narodnoye Opolcheniye, fortified regions (UR)\n- Mobile: Motostrelkovye and Mekhanizirovannye Divizii, Mekhanizirovannye Korpusa\n- Cavalry: Red Army, national and Cossack cavalry divisions\n- Armor: Tankovye Divizii, Korpusa and Brigady\n- Guards: rifle divisions, mechanized corps (1-9), tank corps (1-12), airborne divisions\n- Specialized: naval infantry and naval rifle brigades, mountain rifle, breakthrough artillery, NKVD, penal units\n- Ideology: partisans (communism), Imperial Guard (neutrality), Whites (fascism), republican shock divisions (democratic)\n\nOrthography: simplified BGN transliteration without soft signs; masculine agreement for korpus and rayon.\nHonorifics are verified battle honours; titles on numbers that never existed are marked extrapolated above their group.\nOverrides vanilla SOV_INF_01, CAV_01/02, MOT_01, MEC_01, ARM_01-04, PAR_01, MAR_01, MNT_01, GAR_01, GRD_01, GMC_01, GTC_01, PEN_01.'
  ```
- [x] 4. Docs: the command below writes the five blocks of "Docs payload" into the wiki page and the workshop guidelines. Run it exactly; expect `wiki/Soviet-Union.md: 3 block(s) replaced` and `WORKSHOP_DESCRIPTION_GUIDELINES.md: 2 block(s) replaced`:
  ```powershell
  $plan = [IO.File]::ReadAllText((Resolve-Path 'docs/superpowers/plans/2026-10-15-soviet-union-audit.md').Path); $utf8 = New-Object Text.UTF8Encoding $false; $get = { param($id) $m = [regex]::Match($plan, '(?s)```' + $id + '\r?\n(.*?)\r?\n```'); if (-not $m.Success) { throw "payload block $id not found" }; $m.Groups[1].Value }; $put = { param($path, $pairs) $p = (Resolve-Path $path).Path; $t = [IO.File]::ReadAllText($p); $nl = if ($t.Contains("`r`n")) { "`r`n" } else { "`n" }; $n = 0; foreach ($pair in $pairs) { $rx = [regex]$pair[0]; if ($rx.Matches($t).Count -ne 1) { throw "$path`: pattern did not match exactly once: $($pair[0])" }; $new = ($pair[1] -replace "`r?`n", $nl).TrimEnd(); $t = $rx.Replace($t, [Text.RegularExpressions.MatchEvaluator]{ param($m) $new }, 1); $n++ }; [IO.File]::WriteAllText($p, $t, $utf8); "$path`: $n block(s) replaced" }; & $put 'wiki/Soviet-Union.md' @(@('(?m)^The Red Army underwent[^\r\n]*', (& $get 'markdown wiki-overview')), @('(?s)\| Group Tag \|.*?> All groups override[^\r\n]*', (& $get 'markdown wiki-table')), @('(?s)## Group Details.*\z', ((& $get 'markdown wiki-details') + "`n"))); & $put 'WORKSHOP_DESCRIPTION_GUIDELINES.md' @(@('(?m)^\| `zz_INEX_SOV_names_divisions\.txt` \|[^\r\n]*', (& $get 'text workshop-row')), @('(?s)\[b\]USSR\[/b\].*?(?=\r?\n\r?\n\[b\]Mexico)', (& $get 'text workshop-ussr')))
  ```
- [x] 5. `powershell -File .\build.ps1 -SyncWiki SOV`. Expect `Soviet-Union.md: 0 row(s) updated` and `wiki/Home.md: SOV group count 20 -> 28`, with no `no row in wiki table` and no `stale row` line. Prose lines it lists are the step 4 text: no action.
- [x] 6. `powershell -File .\build.ps1 -Check SOV`. Expect `Check passed`; the flags must be the 31 listed in "Kept on judgment".
- [x] 7. Fill "Outcome", set `Status: DONE`, report the `-Check` result.
- [x] 8. Ship, on the user's word. The working tree holds unrelated tooling changes, so stage only this plan's files: `git add common/units/names_divisions/zz_INEX_SOV_names_divisions.txt wiki/Soviet-Union.md wiki/Home.md WORKSHOP_DESCRIPTION_GUIDELINES.md docs/superpowers/plans/2026-10-15-soviet-union-audit.md`, commit with the message `Audit and expand SOV division namelists`, then `powershell -File .\wiki\push-wiki.ps1 -CommitMessage "Audit and expand SOV division namelists"`.

## Docs payload
The step 4 command writes these blocks verbatim; nothing here is typed by hand. README.md has no change beyond what `-SyncWiki` writes (`wiki/Home.md` group count).

wiki/Soviet-Union.md, the overview paragraph (the line that starts "The Red Army underwent"):
```markdown wiki-overview
The Red Army underwent the most radical organizational transformation of any belligerent in WWII — from the pre-war rifle divisions numbered in the hundreds, through the catastrophic 1941 losses, to the rebuilt Guards formations and large armored corps of 1943–45. INEX keeps vanilla's historical division numbers and gives a division only the battle honour it actually held. It adds national divisions, fortified regions, naval brigades and mechanized corps, and four government-gated suites: partisans (communism), the Imperial Guard (neutrality), White volunteer divisions (fascism) and republican shock divisions (democratic).
```

wiki/Soviet-Union.md, the group table and the note below it (from the "| Group Tag |" header line through the line "> All groups override ..."):
```markdown wiki-table
| Group Tag | UI Name | Division Types | Fallback Name |
|:---|:---|:---|:---|
| `SOV_INF_01` | Rifle Divisions | infantry | `%d-ya Strelkovaya Diviziya` |
| `SOV_CAV_01` | Cavalry Divisions | cavalry | `%d-ya Kavaleriyskaya Diviziya` |
| `SOV_MOT_01` | Motor Rifle Divisions | motorized | `%d-ya Motostrelkovaya Diviziya` |
| `SOV_MEC_01` | Mechanized Divisions | mechanized, motorized | `%d-ya Mekhanizirovannaya Diviziya` |
| `SOV_MEC_02` | Mechanized Corps | mechanized, motorized | `%d-y Mekhanizirovannyy Korpus` |
| `SOV_ARM_01` | Tank Divisions | light_armor, medium_armor, heavy_armor, modern_armor | `%d-ya Tankovaya Diviziya` |
| `SOV_ARM_02` | Tank Corps | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Tankovyy Korpus` |
| `SOV_ARM_03` | Guards Tank Corps | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Gvardeyskiy Tankovyy Korpus` |
| `SOV_ARM_04` | Tank Brigades | light_armor, medium_armor, heavy_armor, modern_armor | `%d-ya Tankovaya Brigada` |
| `SOV_PAR_01` | Airborne Divisions | paratrooper | `%d-ya Vozdushno-Desantnaya Diviziya` |
| `SOV_MAR_01` | Naval Infantry Divisions | marine | `%d-ya Diviziya Morskoy Pekhoty` |
| `SOV_MAR_02` | Naval Rifle Brigades | marine | `%d-ya Morskaya Strelkovaya Brigada` |
| `SOV_MNT_01` | Mountain Rifle Divisions | mountaineers | `%d-ya Gornostrelkovaya Diviziya` |
| `SOV_GAR_01` | Garrison Divisions | infantry | `%d-ya Pogranichnaya Diviziya Voisk NKVD` |
| `SOV_UR_01` | Fortified Regions | infantry | `%d-y Ukreplennyy Rayon` |
| `SOV_GRD_01` | Guards Rifle Divisions | infantry | `%d-ya Gvardeyskaya Strelkovaya Diviziya` |
| `SOV_NAT_01` | National Rifle Divisions | infantry | `%d-ya Natsionalnaya Strelkovaya Diviziya` |
| `SOV_GMC_01` | Guards Mechanized Corps | mechanized, motorized | `%d-y Gvardeyskiy Mekhanizirovannyy Korpus` |
| `SOV_GTC_01` | Guards Tank Corps (Named) | light_armor, medium_armor, heavy_armor, modern_armor | `%d-y Gvardeyskiy Tankovyy Korpus` |
| `SOV_CAV_02` | Cossack Cavalry Divisions | cavalry | `%d-ya Kazachya Kavaleriyskaya Diviziya` |
| `SOV_PEN_01` | Penal Units | infantry | `%d-ya Shtrafnaya Chast` |
| `SOV_NKVD_01` | NKVD Security Divisions | infantry | `%d-ya Diviziya Voisk NKVD` |
| `SOV_AIR_01` | Guards Airborne Divisions | paratrooper | `%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya` |
| `SOV_ART_01` | Artillery Divisions | artillery | `%d-ya Artilleriyskaya Diviziya` |
| `SOV_PRT_01` | Partisan Formations | militia, infantry | `%d-ya Partizanskaya Brigada` |
| `SOV_IMP_01` | Imperial Guard Divisions | infantry | `%d-ya Gvardeyskaya Pekhotnaya Diviziya` |
| `SOV_WHT_01` | White Volunteer Divisions | infantry | `%d-ya Dobrovolcheskaya Diviziya` |
| `SOV_REP_01` | Republican Shock Divisions | infantry | `%d-ya Udarnaya Diviziya` |

> Groups on vanilla tags replace the vanilla group whole. `SOV_MEC_02`, `SOV_MAR_02`, `SOV_UR_01`, `SOV_NAT_01`, `SOV_NKVD_01`, `SOV_AIR_01`, `SOV_ART_01` and the four government-gated groups are new tags. Vanilla's `SOV_INF_02`, `SOV_INF_03` and `SOV_JAP_INF`, which focuses and scripted effects use, stay as vanilla defines them.
```

wiki/Soviet-Union.md, everything from "## Group Details" to the end of the page:
```markdown wiki-details
## Group Details

### `SOV_INF_01` — Rifle Divisions (*Strelkovaya Diviziya*)
The backbone of the Red Army, in vanilla's historical numbering: the list skips the numbers of the mountain and motorized divisions that share its pool, so they keep theirs. Pre-war and Civil War honorifics sit on their own divisions (*Moskovskaya Proletarskaya*, *Chapayevskaya*, *Samaro-Ulyanovskaya*, *imeni Proletariata Donbassa*); every other number is plain.

### `SOV_CAV_01` — Cavalry Divisions (*Kavaleriyskaya Diviziya*)
Red Army cavalry in vanilla's historical numbering (*Chernigovskaya*, *Bessarabskaya*, *imeni Blinova*), the Central Asian and Transcaucasian mountain cavalry, the national cavalry divisions of 1941–42 (*Kalmytskaya*, *Bashkirskaya*, *Kabardino-Balkarskaya*) and the 1st–17th Guards Cavalry Divisions (*Rovenskaya*, *Mozyrskaya*).

### `SOV_MOT_01` / `SOV_MEC_01` — Motor Rifle / Mechanized Divisions
The motorized divisions of 1939–41 on their historical numbers, sharing numbering with the rifle divisions, and the NKVD motor rifle divisions with OMSDON *imeni Dzerzhinskogo*. The mechanized divisions carry the titles of their motorized predecessors.

### `SOV_MEC_02` — Mechanized Corps (*Mekhanizirovannyy Korpus*)
The mechanized corps of 1940–45. Only three stayed non-Guards and earned an honorific (*Krasnogradskiy*, *Novoukrainsko-Khinganskiy*, *Kiyevsko-Zhitomirskiy*); the other numbers take the fallback, and the Guards corps are in `SOV_GMC_01`.

### `SOV_ARM_01` / `SOV_ARM_02` / `SOV_ARM_04` — Tank Formations
- **Tank Divisions (`SOV_ARM_01`)** — the 1940–41 tank divisions, a plain fallback-only list.
- **Tank Corps (`SOV_ARM_02`)** — every non-Guards tank corps that held a battle honour in 1945 (*Insterburgskiy*, *Dvinskiy*, *Bobruysko-Berlinskiy*, *Vislenskiy*).
- **Tank Brigades (`SOV_ARM_04`)** — independent tank brigades, a plain fallback-only list.

### `SOV_ARM_03` — Guards Tank Corps (*Gvardeyskiy Tankovyy Korpus*)
The plain variant, numbers only and available at war as in vanilla. `SOV_GTC_01` is the named variant and shares its numbering.

### `SOV_GTC_01` — Guards Tank Corps (Named)
All twelve Guards Tank Corps with their battle honours (*Donskoy*, *Tatsinskiy*, *Kantemirovskiy*, *Uralsko-Lvovskiy*); the 8th held none.

### `SOV_GMC_01` — Guards Mechanized Corps (*Gvardeyskiy Mekhanizirovannyy Korpus*)
All nine Guards Mechanized Corps with their battle honours (*Venskiy*, *Nikolayevsko-Budapeshtskiy*, *Stalingradskiy*, *Zimovnikovskiy*).

### `SOV_PAR_01` — Airborne Divisions (*Vozdushno-Desantnaya Diviziya*)
A plain fallback-only list; the Guards airborne divisions are in `SOV_AIR_01`.

### `SOV_AIR_01` — Guards Airborne Divisions (*Gvardeyskaya Vozdushno-Desantnaya Diviziya*)
The 1st–10th Guards Airborne Divisions of December 1942 with their battle honours (*Zvenigorodskaya*, *Proskurovskaya*, *Cherkasskaya*), the 11th–16th of 1944, and the divisions of 1944–46 in vanilla's numbers (*76-ya Chernigovskaya*, *98-ya Svirskaya*, *106-ya Tulskaya*).

### `SOV_MAR_01` — Naval Infantry Divisions (*Diviziya Morskoy Pekhoty*)
The 1st *Mozyrskaya* Naval Infantry Division of the Baltic Fleet (1944–48), then divisions named after the fleets and flotillas. These are extrapolated: the wartime naval infantry fought as brigades (`SOV_MAR_02`).

### `SOV_MAR_02` — Naval Rifle Brigades (*Morskaya Strelkovaya Brigada*)
The fleets' naval infantry brigades (*Pechengskaya*, *Kirkenesskaya*, *Novorossiysko-Dunayskaya*, *Tamanskaya*) and the numbered naval rifle brigades of 1941–42, sailors who fought on the land fronts.

### `SOV_MNT_01` — Mountain Rifle Divisions (*Gornostrelkovaya Diviziya*)
Mountain infantry for the Caucasus and Central Asia in vanilla's historical numbering (*Kavkazskaya*, *Gruzinskaya*, *Armyanskaya*, *Azerbaydzhanskaya*, *Turkestanskaya*).

### `SOV_GAR_01` — Garrison Divisions
NKVD border, railway protection and rifle divisions, the 1941 volunteer *Narodnoye Opolcheniye* divisions of Moscow and Leningrad (*Kirovskaya*, *Krasnopresnenskaya*, *Rostokinskaya*) and the Moscow Communist divisions.

### `SOV_UR_01` — Fortified Regions (*Ukreplennyy Rayon*)
The fortified regions of the Stalin Line, the 1940–41 frontier (Molotov Line), Leningrad and Karelia, the Transcaucasus and the Far East on their June 1941 numbers (*Karelskiy*, *Kiyevskiy*, *Brestskiy*, *Grodekovskiy*), and the field fortified regions of 1941 (*Mozhayskiy*, *Volokolamskiy*).

### `SOV_GRD_01` — Guards Rifle Divisions (*Gvardeyskaya Strelkovaya Diviziya*)
Guards rifle divisions with the battle honour each held (*Panfilovskaya*, *Poltavskaya*, *Yelninskaya*, *Svirskaya*), including the Latvian 43rd *Rizhskaya* and the Estonian 118th *Tallinnskaya*.

### `SOV_NAT_01` — National Rifle Divisions
Rifle divisions raised in the Union republics in 1941–45, on their real numbers and sharing numbering with `SOV_INF_01`: Latvian, Lithuanian (*16-ya Klaypedskaya*), Estonian, Armenian (*89-ya Tamanskaya*), Azerbaijani (*416-ya Taganrogskaya*), Georgian, Karelo-Finnish and Kazakh.

### `SOV_CAV_02` — Cossack Cavalry Divisions (*Kazachya Kavaleriyskaya Diviziya*)
Divisions named after the Cossack hosts (Don, Kuban, Terek, Stavropol, Ural, Orenburg, Transbaikal, Amur; extrapolated) and the four Guards Cossack divisions: the 9th and 10th Kuban, the 11th *Volnovakhskaya* and the 12th *Korsunskaya* Don. Usable by SOV and UKR, as in vanilla.

### `SOV_PEN_01` — Penal Units (*Shtrafnaya Chast*)
*Shtrafnyye chasti* (penal units) formed per Order № 227 ("Not One Step Back!"), a fallback-only list available during war.

### `SOV_NKVD_01` — NKVD Security Divisions (*Diviziya Voisk NKVD*)
The six named NKVD rifle divisions that formed the Separate NKVD Army in 1942 (*Dalnevostochnaya*, *Zabaykalskaya*, *Sibirskaya*, *Uralskaya*, *Sredneaziatskaya*, *Stalingradskaya*); numbered divisions take the fallback. Gated to communist governments.

### `SOV_ART_01` — Artillery Divisions (*Artilleriyskaya Diviziya*)
Breakthrough artillery divisions of the Supreme Command Reserve (RVGK) on their own numbers (*Gumbinnenskaya*, *Sivashsko-Shtettinskaya*, *Drezdenskaya*) and the six Guards artillery divisions (*Glukhovskaya*, *Rizhsko-Khinganskaya*).

### `SOV_PRT_01` — Partisan Formations
Communist only. Kovpak's 1st Ukrainian Partisan Division, the Ukrainian raiding formations (*Sumskoye*, *Chernigovsko-Volynskoye*), Belarusian brigades (*Chekist*, *Zheleznyak*), the Leningrad brigades and the Crimean formations.

### `SOV_IMP_01` — Imperial Guard Divisions
Neutrality only, for a monarchist restoration. The three Guards infantry divisions of 1914 carry the names of their senior regiments (*Preobrazhenskaya*, *Moskovskaya*, *Litovskaya*); further divisions take the other Leib-Guard regiments (*Semyonovskaya*, *Izmaylovskaya*, *Tsarskoselskaya*).

### `SOV_WHT_01` — White Volunteer Divisions
Fascist only. The colored divisions of the Volunteer Army (*Kornilovskaya*, *Markovskaya*, *Drozdovskaya*, *Alekseyevskaya*), Kolchak's named divisions (*Izhevskaya*, *15-ya Votkinskaya*) and the North-Western Army's regiment towns as division titles (*Talabskaya*; extrapolated).

### `SOV_REP_01` — Republican Shock Divisions
Democratic only. The People's Army of the Komuch of 1918 (*2-ya Syzranskaya*) with Volga town titles (extrapolated), and the shock and women's battalions of 1917 (*1-y Russkiy Zhenskiy Batalyon Smerti*).
```

WORKSHOP_DESCRIPTION_GUIDELINES.md, the cross-reference row of the SOV file:
```text workshop-row
| `zz_INEX_SOV_names_divisions.txt` | USSR | `SOV` | Included (Rifle & Guards honors on historical numbers, National divisions, Fortified regions, Guards Tank & Mech Corps, Airborne, Naval brigades, Breakthrough Artillery, Opolcheniye, Cossacks, NKVD, Penal units, Partisans, Imperial Guard, Whites, Republican shock units) |
```

WORKSHOP_DESCRIPTION_GUIDELINES.md, the `[b]USSR[/b]` block (up to the blank line before `[b]Mexico[/b]`):
```text workshop-ussr
[b]USSR[/b]
- Red Army rifle divisions on their historical numbers, each with the honour it held ([i]1-ya 'Moskovskaya Proletarskaya'[/i], [i]25-ya 'Chapayevskaya'[/i]), Guards Rifles ([i]8-ya 'Panfilovskaya'[/i]), national divisions ([i]16-ya 'Klaypedskaya' Litovskaya[/i]), Opolcheniye and Stalin Line fortified regions
- Armor & Mechanized Corps with WWII battle honors: Guards Tank Corps ([i]4-y 'Kantemirovskiy'[/i]), all 9 Guards Mechanized Corps ([i]1-y 'Venskiy'[/i]), Guards Airborne, Breakthrough Artillery, naval infantry brigades ([i]63-ya 'Kirkenesskaya'[/i]), Cossack cavalry and penal units
- Government-gated suites: NKVD troops and partisans ([i]1-ya 'imeni Kovpaka' Ukrainskaya Partizanskaya Diviziya[/i]) for communists, the Imperial Guard ([i]'Preobrazhenskaya'[/i]) for monarchists, White volunteer divisions ([i]'Kornilovskaya' Udarnaya Diviziya[/i]) for fascists, and republican shock divisions for democrats
```

## Stop conditions
Stop and report to the user, without researching or improvising, when: the batch fails; `-Check` fails after one retry of a fix this plan describes; a step has no command for what it asks; a name in the output looks wrong; a flag appears that "Kept on judgment" does not list.

## Review
- `inex-code-reviewer` (proofread of every added and changed name, grammar and transliteration): No issues found.
- Test run on a scratch copy of the repository: steps 1-5 as written, then `-ValidateOnly` ("Validation succeeded", 21 files) and `-Audit SOV` (28 groups, 31 flags, all in "Kept on judgment"); SyncWiki found the new table consistent; workshop block 3 bullets, 10 `[i]` examples, 11,396 of 17,000 characters.

## Outcome
Date: 2026-10-15

-Check SOV: Validate OK; Tests 432 Passed, 0 Failed, 0 Skipped; AUDIT SUMMARY SOV: GROUPS=28 AUTHORED=374/1007 FLAGS=31; Flags: LOW_DEPTH x12, NAME_LONG x9, PLACEHOLDER_ENTRIES x8, UNLINKED_MOBILE x1, IDENTITY_REPEAT x1; Check passed. Every flag is listed in "Kept on judgment".

Deviations from the plan: none. The `-Check` run also refreshed the "Per-group changes" table at the end of this file (26 groups changed vs HEAD, +797 -152 names); that is the tool's own output, not a plan change.

## Edit batch
Applied by `build.ps1 -EditNames SOV -Batch <this file>`: every fenced block whose opening line is `` ```json batch ``, in order. Never typed out again or read back.
```json batch
{
    "group":  "INF_01",
    "removeAll":  true,
    "comment":  "# ===== Rifle Formations =====\nOverrides vanilla SOV_INF_01 and keeps its historical numbers, which skip the mountain and motorized\ndivisions of SOV_MNT_01 and SOV_MOT_01 (shared numbering). Vanilla already nicknames this list, so it has no plain twin.",
    "add":  [
                "# Rifle divisions in vanilla's historical numbering; honorifics where the division held one",
                "1=%d-ya 'Moskovskaya Proletarskaya' Strelkovaya Diviziya",
                "2=%d-ya 'Belorusskaya' Strelkovaya Diviziya",
                "3=%d-ya 'Tikhookeanskaya' Strelkovaya Diviziya",
                "4=%d-ya 'Smolenskaya' Strelkovaya Diviziya",
                "5=%d-ya 'Vitebskaya' Strelkovaya Diviziya",
                "6=%d-ya 'Orlovskaya' Strelkovaya Diviziya",
                "7=%d-ya 'Chernigovskaya' Strelkovaya Diviziya",
                "8=%d-ya 'Minskaya' Strelkovaya Diviziya",
                "10=%d-ya 'Severnogo Kraya' Strelkovaya Diviziya",
                "11=%d-ya Strelkovaya Diviziya",
                "12=%d-ya 'Amurskaya' Strelkovaya Diviziya",
                "13=%d-ya 'Dagestanskaya' Strelkovaya Diviziya",
                "14=%d-ya 'Krivorozhskaya' Strelkovaya Diviziya",
                "15=%d-ya 'Sivashskaya' Strelkovaya Diviziya",
                "16=%d-ya 'Ulyanovskaya' Strelkovaya Diviziya",
                "17=%d-ya 'Gorkovskaya' Strelkovaya Diviziya",
                "18=%d-ya Strelkovaya Diviziya",
                "19=%d-ya 'Voronezhskaya' Strelkovaya Diviziya",
                "21=%d-ya 'Permskaya' Strelkovaya Diviziya",
                "22=%d-ya 'Krasnodarskaya' Strelkovaya Diviziya",
                "23=%d-ya 'Kharkovskaya' Strelkovaya Diviziya",
                "24=%d-ya 'Samaro-Ulyanovskaya' Strelkovaya Diviziya",
                "25=%d-ya 'Chapayevskaya' Strelkovaya Diviziya",
                "26=%d-ya 'Zlatoustovskaya' Strelkovaya Diviziya",
                "27=%d-ya 'Omskaya' Strelkovaya Diviziya",
                "29=%d-ya 'Sibirskaya' Strelkovaya Diviziya",
                "31=%d-ya 'Stalingradskaya' Strelkovaya Diviziya",
                "32=%d-ya 'Saratovskaya' Strelkovaya Diviziya",
                "33=%d-ya 'Belorusskaya' Strelkovaya Diviziya",
                "34=%d-ya 'Srednevolzhskaya' Strelkovaya Diviziya",
                "35=%d-ya 'Sibirskaya' Strelkovaya Diviziya",
                "36=%d-ya 'Zabaykalskaya' Strelkovaya Diviziya",
                "37=%d-ya Strelkovaya Diviziya",
                "38=%d-ya Strelkovaya Diviziya",
                "39=%d-ya 'Tikhookeanskaya' Strelkovaya Diviziya",
                "40=%d-ya 'Bogucharskaya' Strelkovaya Diviziya",
                "41=%d-ya Strelkovaya Diviziya",
                "42=%d-ya Strelkovaya Diviziya",
                "43=%d-ya Strelkovaya Diviziya",
                "45=%d-ya 'Volynskaya' Strelkovaya Diviziya",
                "46=%d-ya 'Dnepropetrovskaya' Strelkovaya Diviziya",
                "48=%d-ya 'Kashino-Tverskaya' Strelkovaya Diviziya",
                "49=%d-ya Strelkovaya Diviziya",
                "50=%d-ya 'Tamanskaya' Strelkovaya Diviziya",
                "51=%d-ya 'Perekopskaya' Strelkovaya Diviziya",
                "52=%d-ya Strelkovaya Diviziya",
                "53=%d-ya Strelkovaya Diviziya",
                "54=%d-ya Strelkovaya Diviziya",
                "55=%d-ya 'Kurskaya' Strelkovaya Diviziya",
                "56=%d-ya 'Moskovskaya' Strelkovaya Diviziya",
                "57=%d-ya 'Uralskaya' Strelkovaya Diviziya",
                "59=%d-ya Strelkovaya Diviziya",
                "61=%d-ya 'Turkestanskaya' Strelkovaya Diviziya",
                "62=%d-ya 'Turkestanskaya' Strelkovaya Diviziya",
                "64=%d-ya Strelkovaya Diviziya",
                "65=%d-ya Strelkovaya Diviziya",
                "66=%d-ya Strelkovaya Diviziya",
                "67=%d-ya Strelkovaya Diviziya",
                "69=%d-ya Strelkovaya Diviziya",
                "70=%d-ya Strelkovaya Diviziya",
                "71=%d-ya Strelkovaya Diviziya",
                "73=%d-ya Strelkovaya Diviziya",
                "74=%d-ya 'Tamanskaya' Strelkovaya Diviziya",
                "75=%d-ya Strelkovaya Diviziya",
                "78=%d-ya Strelkovaya Diviziya",
                "80=%d-ya 'imeni Proletariata Donbassa' Strelkovaya Diviziya",
                "81=%d-ya Strelkovaya Diviziya",
                "82=%d-ya Strelkovaya Diviziya",
                "84=%d-ya 'imeni Tulskogo Proletariata' Strelkovaya Diviziya",
                "85=%d-ya Strelkovaya Diviziya",
                "86=%d-ya 'Kazanskaya' Strelkovaya Diviziya",
                "87=%d-ya Strelkovaya Diviziya",
                "88=%d-ya Strelkovaya Diviziya",
                "89=%d-ya Strelkovaya Diviziya",
                "90=%d-ya Strelkovaya Diviziya",
                "91=%d-ya Strelkovaya Diviziya",
                "92=%d-ya Strelkovaya Diviziya",
                "93=%d-ya 'Vostochno-Sibirskaya' Strelkovaya Diviziya",
                "94=%d-ya Strelkovaya Diviziya",
                "95=%d-ya 'Moldavskaya' Strelkovaya Diviziya",
                "97=%d-ya Strelkovaya Diviziya",
                "98=%d-ya Strelkovaya Diviziya",
                "99=%d-ya Strelkovaya Diviziya",
                "100=%d-ya Strelkovaya Diviziya",
                "102=%d-ya Strelkovaya Diviziya",
                "104=%d-ya Strelkovaya Diviziya",
                "105=%d-ya Strelkovaya Diviziya",
                "106=%d-ya Strelkovaya Diviziya",
                "107=%d-ya Strelkovaya Diviziya",
                "108=%d-ya Strelkovaya Diviziya",
                "110=%d-ya Strelkovaya Diviziya",
                "111=%d-ya Strelkovaya Diviziya",
                "112=%d-ya Strelkovaya Diviziya",
                "113=%d-ya Strelkovaya Diviziya",
                "114=%d-ya Strelkovaya Diviziya",
                "115=%d-ya Strelkovaya Diviziya",
                "116=%d-ya Strelkovaya Diviziya",
                "117=%d-ya Strelkovaya Diviziya",
                "118=%d-ya Strelkovaya Diviziya",
                "119=%d-ya Strelkovaya Diviziya",
                "120=%d-ya Strelkovaya Diviziya",
                "121=%d-ya Strelkovaya Diviziya",
                "122=%d-ya Strelkovaya Diviziya",
                "123=%d-ya Strelkovaya Diviziya",
                "124=%d-ya Strelkovaya Diviziya",
                "125=%d-ya Strelkovaya Diviziya",
                "126=%d-ya Strelkovaya Diviziya",
                "127=%d-ya Strelkovaya Diviziya",
                "128=%d-ya Strelkovaya Diviziya",
                "129=%d-ya Strelkovaya Diviziya",
                "130=%d-ya Strelkovaya Diviziya",
                "132=%d-ya Strelkovaya Diviziya",
                "133=%d-ya Strelkovaya Diviziya",
                "134=%d-ya Strelkovaya Diviziya",
                "135=%d-ya Strelkovaya Diviziya",
                "136=%d-ya Strelkovaya Diviziya",
                "137=%d-ya Strelkovaya Diviziya",
                "139=%d-ya Strelkovaya Diviziya",
                "140=%d-ya Strelkovaya Diviziya",
                "141=%d-ya Strelkovaya Diviziya",
                "142=%d-ya Strelkovaya Diviziya",
                "143=%d-ya Strelkovaya Diviziya",
                "144=%d-ya Strelkovaya Diviziya",
                "145=%d-ya Strelkovaya Diviziya",
                "146=%d-ya Strelkovaya Diviziya",
                "148=%d-ya Strelkovaya Diviziya",
                "149=%d-ya Strelkovaya Diviziya",
                "150=%d-ya Strelkovaya Diviziya",
                "151=%d-ya Strelkovaya Diviziya",
                "152=%d-ya Strelkovaya Diviziya",
                "153=%d-ya Strelkovaya Diviziya",
                "154=%d-ya Strelkovaya Diviziya",
                "155=%d-ya Strelkovaya Diviziya",
                "156=%d-ya Strelkovaya Diviziya",
                "157=%d-ya Strelkovaya Diviziya",
                "158=%d-ya Strelkovaya Diviziya",
                "159=%d-ya Strelkovaya Diviziya",
                "160=%d-ya Strelkovaya Diviziya",
                "161=%d-ya Strelkovaya Diviziya",
                "162=%d-ya Strelkovaya Diviziya",
                "164=%d-ya Strelkovaya Diviziya",
                "165=%d-ya Strelkovaya Diviziya",
                "166=%d-ya Strelkovaya Diviziya",
                "167=%d-ya Strelkovaya Diviziya",
                "168=%d-ya Strelkovaya Diviziya",
                "169=%d-ya Strelkovaya Diviziya",
                "170=%d-ya Strelkovaya Diviziya",
                "171=%d-ya Strelkovaya Diviziya",
                "172=%d-ya Strelkovaya Diviziya",
                "173=%d-ya Strelkovaya Diviziya",
                "174=%d-ya Strelkovaya Diviziya",
                "175=%d-ya Strelkovaya Diviziya",
                "176=%d-ya Strelkovaya Diviziya",
                "177=%d-ya Strelkovaya Diviziya",
                "178=%d-ya Strelkovaya Diviziya",
                "179=%d-ya Strelkovaya Diviziya",
                "180=%d-ya Strelkovaya Diviziya",
                "181=%d-ya Strelkovaya Diviziya",
                "182=%d-ya Strelkovaya Diviziya",
                "183=%d-ya Strelkovaya Diviziya",
                "184=%d-ya Strelkovaya Diviziya",
                "186=%d-ya Strelkovaya Diviziya",
                "187=%d-ya Strelkovaya Diviziya",
                "188=%d-ya Strelkovaya Diviziya",
                "189=%d-ya Strelkovaya Diviziya",
                "190=%d-ya Strelkovaya Diviziya",
                "191=%d-ya Strelkovaya Diviziya",
                "193=%d-ya Strelkovaya Diviziya",
                "195=%d-ya Strelkovaya Diviziya",
                "196=%d-ya 'Dnepropetrovskaya' Strelkovaya Diviziya",
                "197=%d-ya 'Kiyevskaya' Strelkovaya Diviziya",
                "199=%d-ya Strelkovaya Diviziya",
                "200=%d-ya Strelkovaya Diviziya",
                "201=%d-ya Strelkovaya Diviziya",
                "203=%d-ya Strelkovaya Diviziya",
                "206=%d-ya Strelkovaya Diviziya",
                "207=%d-ya Strelkovaya Diviziya",
                "211=%d-ya Strelkovaya Diviziya",
                "214=%d-ya Strelkovaya Diviziya",
                "217=%d-ya Strelkovaya Diviziya",
                "222=%d-ya Strelkovaya Diviziya",
                "223=%d-ya Strelkovaya Diviziya",
                "224=%d-ya Strelkovaya Diviziya",
                "225=%d-ya Strelkovaya Diviziya",
                "226=%d-ya Strelkovaya Diviziya",
                "227=%d-ya Strelkovaya Diviziya",
                "228=%d-ya Strelkovaya Diviziya",
                "229=%d-ya Strelkovaya Diviziya",
                "230=%d-ya Strelkovaya Diviziya",
                "231=%d-ya Strelkovaya Diviziya",
                "232=%d-ya Strelkovaya Diviziya",
                "233=%d-ya Strelkovaya Diviziya",
                "234=%d-ya Strelkovaya Diviziya",
                "235=%d-ya Strelkovaya Diviziya",
                "237=%d-ya Strelkovaya Diviziya",
                "238=%d-ya Strelkovaya Diviziya",
                "241=%d-ya Strelkovaya Diviziya",
                "243=%d-ya Strelkovaya Diviziya",
                "244=%d-ya Strelkovaya Diviziya",
                "245=%d-ya Strelkovaya Diviziya",
                "246=%d-ya Strelkovaya Diviziya",
                "247=%d-ya Strelkovaya Diviziya",
                "248=%d-ya Strelkovaya Diviziya",
                "249=%d-ya Strelkovaya Diviziya",
                "250=%d-ya Strelkovaya Diviziya",
                "251=%d-ya Strelkovaya Diviziya",
                "252=%d-ya Strelkovaya Diviziya",
                "253=%d-ya Strelkovaya Diviziya",
                "254=%d-ya Strelkovaya Diviziya",
                "255=%d-ya Strelkovaya Diviziya",
                "256=%d-ya Strelkovaya Diviziya",
                "257=%d-ya Strelkovaya Diviziya",
                "258=%d-ya Strelkovaya Diviziya",
                "259=%d-ya Strelkovaya Diviziya",
                "260=%d-ya Strelkovaya Diviziya",
                "261=%d-ya Strelkovaya Diviziya",
                "262=%d-ya Strelkovaya Diviziya",
                "263=%d-ya Strelkovaya Diviziya",
                "264=%d-ya Strelkovaya Diviziya",
                "265=%d-ya Strelkovaya Diviziya",
                "266=%d-ya Strelkovaya Diviziya",
                "267=%d-ya Strelkovaya Diviziya",
                "268=%d-ya Strelkovaya Diviziya",
                "269=%d-ya Strelkovaya Diviziya",
                "270=%d-ya Strelkovaya Diviziya",
                "271=%d-ya Strelkovaya Diviziya",
                "272=%d-ya Strelkovaya Diviziya",
                "273=%d-ya Strelkovaya Diviziya",
                "274=%d-ya Strelkovaya Diviziya",
                "275=%d-ya Strelkovaya Diviziya",
                "276=%d-ya Strelkovaya Diviziya",
                "277=%d-ya Strelkovaya Diviziya",
                "278=%d-ya Strelkovaya Diviziya",
                "279=%d-ya Strelkovaya Diviziya",
                "280=%d-ya Strelkovaya Diviziya",
                "281=%d-ya Strelkovaya Diviziya",
                "282=%d-ya Strelkovaya Diviziya",
                "283=%d-ya Strelkovaya Diviziya",
                "284=%d-ya Strelkovaya Diviziya",
                "285=%d-ya Strelkovaya Diviziya",
                "286=%d-ya Strelkovaya Diviziya",
                "287=%d-ya Strelkovaya Diviziya",
                "288=%d-ya Strelkovaya Diviziya",
                "289=%d-ya Strelkovaya Diviziya",
                "290=%d-ya Strelkovaya Diviziya",
                "291=%d-ya Strelkovaya Diviziya",
                "292=%d-ya Strelkovaya Diviziya",
                "293=%d-ya Strelkovaya Diviziya",
                "294=%d-ya Strelkovaya Diviziya",
                "295=%d-ya Strelkovaya Diviziya",
                "296=%d-ya Strelkovaya Diviziya",
                "297=%d-ya Strelkovaya Diviziya",
                "298=%d-ya Strelkovaya Diviziya",
                "299=%d-ya Strelkovaya Diviziya",
                "300=%d-ya Strelkovaya Diviziya",
                "301=%d-ya Strelkovaya Diviziya",
                "303=%d-ya Strelkovaya Diviziya",
                "304=%d-ya Strelkovaya Diviziya",
                "305=%d-ya Strelkovaya Diviziya",
                "306=%d-ya Strelkovaya Diviziya",
                "307=%d-ya Strelkovaya Diviziya",
                "308=%d-ya Strelkovaya Diviziya",
                "310=%d-ya Strelkovaya Diviziya",
                "311=%d-ya Strelkovaya Diviziya",
                "312=%d-ya Strelkovaya Diviziya",
                "313=%d-ya Strelkovaya Diviziya",
                "314=%d-ya Strelkovaya Diviziya",
                "315=%d-ya Strelkovaya Diviziya",
                "316=%d-ya Strelkovaya Diviziya",
                "317=%d-ya Strelkovaya Diviziya",
                "318=%d-ya Strelkovaya Diviziya",
                "319=%d-ya Strelkovaya Diviziya",
                "320=%d-ya Strelkovaya Diviziya",
                "321=%d-ya Strelkovaya Diviziya",
                "322=%d-ya Strelkovaya Diviziya",
                "323=%d-ya Strelkovaya Diviziya",
                "324=%d-ya Strelkovaya Diviziya",
                "325=%d-ya Strelkovaya Diviziya",
                "326=%d-ya Strelkovaya Diviziya",
                "327=%d-ya Strelkovaya Diviziya",
                "328=%d-ya Strelkovaya Diviziya",
                "329=%d-ya Strelkovaya Diviziya",
                "330=%d-ya Strelkovaya Diviziya",
                "332=%d-ya Strelkovaya Diviziya",
                "333=%d-ya Strelkovaya Diviziya",
                "334=%d-ya Strelkovaya Diviziya",
                "335=%d-ya Strelkovaya Diviziya",
                "336=%d-ya Strelkovaya Diviziya",
                "337=%d-ya Strelkovaya Diviziya",
                "339=%d-ya Strelkovaya Diviziya",
                "340=%d-ya Strelkovaya Diviziya",
                "341=%d-ya Strelkovaya Diviziya",
                "342=%d-ya Strelkovaya Diviziya",
                "343=%d-ya Strelkovaya Diviziya",
                "344=%d-ya Strelkovaya Diviziya",
                "345=%d-ya Strelkovaya Diviziya",
                "346=%d-ya Strelkovaya Diviziya",
                "348=%d-ya Strelkovaya Diviziya",
                "349=%d-ya Strelkovaya Diviziya",
                "350=%d-ya Strelkovaya Diviziya",
                "351=%d-ya Strelkovaya Diviziya",
                "352=%d-ya Strelkovaya Diviziya",
                "353=%d-ya Strelkovaya Diviziya",
                "354=%d-ya Strelkovaya Diviziya",
                "355=%d-ya Strelkovaya Diviziya",
                "356=%d-ya Strelkovaya Diviziya",
                "357=%d-ya Strelkovaya Diviziya",
                "358=%d-ya Strelkovaya Diviziya",
                "359=%d-ya Strelkovaya Diviziya",
                "360=%d-ya Strelkovaya Diviziya",
                "361=%d-ya Strelkovaya Diviziya",
                "362=%d-ya Strelkovaya Diviziya",
                "364=%d-ya Strelkovaya Diviziya",
                "365=%d-ya Strelkovaya Diviziya",
                "366=%d-ya Strelkovaya Diviziya",
                "367=%d-ya Strelkovaya Diviziya",
                "368=%d-ya Strelkovaya Diviziya",
                "369=%d-ya Strelkovaya Diviziya",
                "370=%d-ya Strelkovaya Diviziya",
                "371=%d-ya Strelkovaya Diviziya",
                "372=%d-ya Strelkovaya Diviziya",
                "373=%d-ya Strelkovaya Diviziya",
                "374=%d-ya Strelkovaya Diviziya",
                "375=%d-ya Strelkovaya Diviziya",
                "376=%d-ya Strelkovaya Diviziya",
                "377=%d-ya Strelkovaya Diviziya",
                "378=%d-ya Strelkovaya Diviziya",
                "379=%d-ya Strelkovaya Diviziya",
                "380=%d-ya Strelkovaya Diviziya",
                "381=%d-ya Strelkovaya Diviziya",
                "382=%d-ya Strelkovaya Diviziya",
                "383=%d-ya Strelkovaya Diviziya",
                "384=%d-ya Strelkovaya Diviziya",
                "386=%d-ya Strelkovaya Diviziya",
                "387=%d-ya Strelkovaya Diviziya",
                "388=%d-ya Strelkovaya Diviziya",
                "389=%d-ya Strelkovaya Diviziya",
                "390=%d-ya Strelkovaya Diviziya",
                "391=%d-ya Strelkovaya Diviziya",
                "393=%d-ya Strelkovaya Diviziya",
                "395=%d-ya Strelkovaya Diviziya",
                "396=%d-ya Strelkovaya Diviziya",
                "397=%d-ya Strelkovaya Diviziya",
                "399=%d-ya Strelkovaya Diviziya",
                "400=%d-ya Strelkovaya Diviziya",
                "402=%d-ya Strelkovaya Diviziya",
                "404=%d-ya Strelkovaya Diviziya",
                "405=%d-ya Strelkovaya Diviziya",
                "406=%d-ya Strelkovaya Diviziya",
                "407=%d-ya Strelkovaya Diviziya",
                "408=%d-ya Strelkovaya Diviziya",
                "409=%d-ya Strelkovaya Diviziya",
                "410=%d-ya Strelkovaya Diviziya",
                "411=%d-ya Strelkovaya Diviziya",
                "412=%d-ya Strelkovaya Diviziya",
                "413=%d-ya Strelkovaya Diviziya",
                "414=%d-ya Strelkovaya Diviziya",
                "415=%d-ya Strelkovaya Diviziya",
                "416=%d-ya Strelkovaya Diviziya",
                "417=%d-ya Strelkovaya Diviziya",
                "418=%d-ya Strelkovaya Diviziya",
                "419=%d-ya Strelkovaya Diviziya",
                "420=%d-ya Strelkovaya Diviziya",
                "421=%d-ya Strelkovaya Diviziya",
                "422=%d-ya Strelkovaya Diviziya",
                "423=%d-ya Strelkovaya Diviziya",
                "424=%d-ya Strelkovaya Diviziya",
                "425=%d-ya Strelkovaya Diviziya",
                "426=%d-ya Strelkovaya Diviziya",
                "427=%d-ya Strelkovaya Diviziya",
                "428=%d-ya Strelkovaya Diviziya",
                "429=%d-ya Strelkovaya Diviziya",
                "430=%d-ya Strelkovaya Diviziya",
                "432=%d-ya Strelkovaya Diviziya",
                "433=%d-ya Strelkovaya Diviziya",
                "434=%d-ya Strelkovaya Diviziya",
                "435=%d-ya Strelkovaya Diviziya",
                "436=%d-ya Strelkovaya Diviziya",
                "437=%d-ya Strelkovaya Diviziya",
                "439=%d-ya Strelkovaya Diviziya",
                "440=%d-ya Strelkovaya Diviziya",
                "441=%d-ya Strelkovaya Diviziya",
                "442=%d-ya Strelkovaya Diviziya",
                "443=%d-ya Strelkovaya Diviziya",
                "444=%d-ya Strelkovaya Diviziya",
                "445=%d-ya Strelkovaya Diviziya",
                "446=%d-ya Strelkovaya Diviziya",
                "448=%d-ya Strelkovaya Diviziya",
                "449=%d-ya Strelkovaya Diviziya",
                "450=%d-ya Strelkovaya Diviziya",
                "451=%d-ya Strelkovaya Diviziya",
                "452=%d-ya Strelkovaya Diviziya",
                "453=%d-ya Strelkovaya Diviziya",
                "454=%d-ya Strelkovaya Diviziya",
                "455=%d-ya Strelkovaya Diviziya",
                "456=%d-ya Strelkovaya Diviziya",
                "457=%d-ya Strelkovaya Diviziya",
                "458=%d-ya Strelkovaya Diviziya",
                "459=%d-ya Strelkovaya Diviziya",
                "460=%d-ya Strelkovaya Diviziya",
                "461=%d-ya Strelkovaya Diviziya",
                "462=%d-ya Strelkovaya Diviziya",
                "464=%d-ya Strelkovaya Diviziya",
                "465=%d-ya Strelkovaya Diviziya",
                "466=%d-ya Strelkovaya Diviziya",
                "467=%d-ya Strelkovaya Diviziya",
                "468=%d-ya Strelkovaya Diviziya",
                "469=%d-ya Strelkovaya Diviziya",
                "470=%d-ya Strelkovaya Diviziya",
                "471=%d-ya Strelkovaya Diviziya",
                "472=%d-ya Strelkovaya Diviziya",
                "473=%d-ya Strelkovaya Diviziya",
                "474=%d-ya Strelkovaya Diviziya"
            ]
}
```

```json batch
{
    "group":  "CAV_01",
    "removeAll":  true,
    "comment":  "# ===== Cavalry Formations =====\nOverrides vanilla SOV_CAV_01 and keeps its historical numbers. National cavalry divisions sit on their real numbers;\nthe Guards Cossack divisions are also in SOV_CAV_02.",
    "add":  [
                "# Red Army cavalry divisions in vanilla's historical numbering",
                "1=%d-ya 'Chernigovskaya' Kavaleriyskaya Diviziya",
                "3=%d-ya 'Bessarabskaya' Kavaleriyskaya Diviziya",
                "4=%d-ya Kavaleriyskaya Diviziya",
                "5=%d-ya 'imeni Blinova' Kavaleriyskaya Diviziya",
                "6=%d-ya 'Chongarskaya' Kavaleriyskaya Diviziya",
                "7=%d-ya Kavaleriyskaya Diviziya",
                "8=%d-ya 'Dalnevostochnaya' Kavaleriyskaya Diviziya",
                "9=%d-ya 'Krymskaya' Kavaleriyskaya Diviziya",
                "10=%d-ya Kavaleriyskaya Diviziya",
                "11=%d-ya Kavaleriyskaya Diviziya",
                "12=%d-ya 'Kubanskaya' Kavaleriyskaya Diviziya",
                "13=%d-ya Kavaleriyskaya Diviziya",
                "14=%d-ya 'Bessarabskaya' Kavaleriyskaya Diviziya",
                "15=%d-ya 'Donskaya' Kavaleriyskaya Diviziya",
                "16=%d-ya Kavaleriyskaya Diviziya",
                "17=%d-ya 'Armyanskaya' Gorno-Kavaleriyskaya Diviziya",
                "18=%d-ya 'Turkestanskaya' Gorno-Kavaleriyskaya Diviziya",
                "19=%d-ya 'Uzbekskaya' Gorno-Kavaleriyskaya Diviziya",
                "20=%d-ya 'Tadzhikskaya' Gorno-Kavaleriyskaya Diviziya",
                "21=%d-ya 'Ferganskaya' Gorno-Kavaleriyskaya Diviziya",
                "22=%d-ya Kavaleriyskaya Diviziya",
                "23=%d-ya Kavaleriyskaya Diviziya",
                "24=%d-ya Kavaleriyskaya Diviziya",
                "25=%d-ya Kavaleriyskaya Diviziya",
                "26=%d-ya Kavaleriyskaya Diviziya",
                "27=%d-ya Kavaleriyskaya Diviziya",
                "28=%d-ya Kavaleriyskaya Diviziya",
                "29=%d-ya Kavaleriyskaya Diviziya",
                "30=%d-ya Kavaleriyskaya Diviziya",
                "31=%d-ya Kavaleriyskaya Diviziya",
                "32=%d-ya Kavaleriyskaya Diviziya",
                "33=%d-ya Kavaleriyskaya Diviziya",
                "34=%d-ya Kavaleriyskaya Diviziya",
                "35=%d-ya Kavaleriyskaya Diviziya",
                "36=%d-ya 'Chongarskaya' Kavaleriyskaya Diviziya",
                "38=%d-ya Kavaleriyskaya Diviziya",
                "40=%d-ya Kavaleriyskaya Diviziya",
                "41=%d-ya Kavaleriyskaya Diviziya",
                "43=%d-ya Kavaleriyskaya Diviziya",
                "44=%d-ya Kavaleriyskaya Diviziya",
                "46=%d-ya Kavaleriyskaya Diviziya",
                "47=%d-ya Kavaleriyskaya Diviziya",
                "48=%d-ya Kavaleriyskaya Diviziya",
                "49=%d-ya Kavaleriyskaya Diviziya",
                "50=%d-ya Kavaleriyskaya Diviziya",
                "51=%d-ya Kavaleriyskaya Diviziya",
                "52=%d-ya Kavaleriyskaya Diviziya",
                "53=%d-ya Kavaleriyskaya Diviziya",
                "54=%d-ya Kavaleriyskaya Diviziya",
                "55=%d-ya Kavaleriyskaya Diviziya",
                "56=%d-ya Kavaleriyskaya Diviziya",
                "57=%d-ya Kavaleriyskaya Diviziya",
                "59=%d-ya Kavaleriyskaya Diviziya",
                "60=%d-ya Kavaleriyskaya Diviziya",
                "61=%d-ya Kavaleriyskaya Diviziya",
                "62=%d-ya Kavaleriyskaya Diviziya",
                "63=%d-ya Kavaleriyskaya Diviziya",
                "64=%d-ya Kavaleriyskaya Diviziya",
                "66=%d-ya Kavaleriyskaya Diviziya",
                "67=%d-ya Kavaleriyskaya Diviziya",
                "68=%d-ya Kavaleriyskaya Diviziya",
                "70=%d-ya Kavaleriyskaya Diviziya",
                "72=%d-ya Kavaleriyskaya Diviziya",
                "73=%d-ya Kavaleriyskaya Diviziya",
                "74=%d-ya Kavaleriyskaya Diviziya",
                "75=%d-ya Kavaleriyskaya Diviziya",
                "76=%d-ya Kavaleriyskaya Diviziya",
                "77=%d-ya Kavaleriyskaya Diviziya",
                "78=%d-ya Kavaleriyskaya Diviziya",
                "79=%d-ya Kavaleriyskaya Diviziya",
                "80=%d-ya Kavaleriyskaya Diviziya",
                "81=%d-ya Kavaleriyskaya Diviziya",
                "82=%d-ya Kavaleriyskaya Diviziya",
                "83=%d-ya Kavaleriyskaya Diviziya",
                "84=%d-ya Kavaleriyskaya Diviziya",
                "87=%d-ya Kavaleriyskaya Diviziya",
                "91=%d-ya Kavaleriyskaya Diviziya",
                "94=%d-ya Kavaleriyskaya Diviziya",
                "# National cavalry divisions of 1941-42 (Turkmen, Uzbek, Tajik, Kazakh, Kyrgyz, Kalmyk, Bashkir, North Caucasian)",
                "97=%d-ya 'Turkmenskaya' Kavaleriyskaya Diviziya",
                "98=%d-ya 'Turkmenskaya' Kavaleriyskaya Diviziya",
                "99=%d-ya 'Uzbekskaya' Kavaleriyskaya Diviziya",
                "100=%d-ya 'Uzbekskaya' Kavaleriyskaya Diviziya",
                "101=%d-ya 'Uzbekskaya' Kavaleriyskaya Diviziya",
                "102=%d-ya 'Uzbekskaya' Kavaleriyskaya Diviziya",
                "103=%d-ya 'Uzbekskaya' Kavaleriyskaya Diviziya",
                "104=%d-ya 'Tadzhikskaya' Kavaleriyskaya Diviziya",
                "105=%d-ya 'Kazakhskaya' Kavaleriyskaya Diviziya",
                "106=%d-ya 'Kazakhskaya' Kavaleriyskaya Diviziya",
                "107=%d-ya 'Kirgizskaya' Kavaleriyskaya Diviziya",
                "108=%d-ya 'Kirgizskaya' Kavaleriyskaya Diviziya",
                "109=%d-ya 'Kirgizskaya' Kavaleriyskaya Diviziya",
                "110=%d-ya 'Kalmytskaya' Kavaleriyskaya Diviziya",
                "111=%d-ya 'Kalmytskaya' Kavaleriyskaya Diviziya",
                "112=%d-ya 'Bashkirskaya' Kavaleriyskaya Diviziya",
                "113=%d-ya 'Bashkirskaya' Kavaleriyskaya Diviziya",
                "114=%d-ya 'Checheno-Ingushskaya' Kavaleriyskaya Diviziya",
                "115=%d-ya 'Kabardino-Balkarskaya' Kavaleriyskaya Diviziya",
                "116=%d-ya Kavaleriyskaya Diviziya",
                "# Guards cavalry divisions",
                "301=1-ya Gvardeyskaya 'Stavropolskaya' Kavaleriyskaya Diviziya",
                "302=2-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "303=3-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "304=4-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "305=5-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "306=6-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "307=7-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "308=8-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "309=9-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "310=10-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "311=11-ya Gvardeyskaya 'Volnovakhskaya' Kavaleriyskaya Diviziya",
                "312=12-ya Gvardeyskaya 'Korsunskaya' Kavaleriyskaya Diviziya",
                "313=13-ya Gvardeyskaya 'Rovenskaya' Kavaleriyskaya Diviziya",
                "314=14-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "315=15-ya Gvardeyskaya Kavaleriyskaya Diviziya",
                "316=16-ya Gvardeyskaya 'Chernigovskaya' Kavaleriyskaya Diviziya",
                "317=17-ya Gvardeyskaya 'Mozyrskaya' Kavaleriyskaya Diviziya"
            ]
}
```

```json batch
{
    "group":  "MOT_01",
    "removeAll":  true,
    "add":  [
                "# Motorized divisions of 1939-41 in vanilla's historical numbering",
                "1=%d-ya 'Moskovskaya Proletarskaya' Motostrelkovaya Diviziya",
                "7=%d-ya 'Chernigovskaya' Motostrelkovaya Diviziya",
                "15=%d-ya 'Sivashskaya' Motostrelkovaya Diviziya",
                "29=%d-ya 'Sibirskaya' Motostrelkovaya Diviziya",
                "36=%d-ya 'Zabaykalskaya' Motostrelkovaya Diviziya",
                "57=%d-ya 'Uralskaya' Motostrelkovaya Diviziya",
                "69=%d-ya Motostrelkovaya Diviziya",
                "81=%d-ya Motostrelkovaya Diviziya",
                "82=%d-ya Motostrelkovaya Diviziya",
                "84=%d-ya 'imeni Tulskogo Proletariata' Motostrelkovaya Diviziya",
                "103=%d-ya Motostrelkovaya Diviziya",
                "109=%d-ya Motostrelkovaya Diviziya",
                "131=%d-ya Motostrelkovaya Diviziya",
                "163=%d-ya Motostrelkovaya Diviziya",
                "185=%d-ya Motostrelkovaya Diviziya",
                "198=%d-ya Motostrelkovaya Diviziya",
                "202=%d-ya Motostrelkovaya Diviziya",
                "204=%d-ya Motostrelkovaya Diviziya",
                "205=%d-ya Motostrelkovaya Diviziya",
                "208=%d-ya Motostrelkovaya Diviziya",
                "209=%d-ya Motostrelkovaya Diviziya",
                "210=%d-ya Motostrelkovaya Diviziya",
                "212=%d-ya Motostrelkovaya Diviziya",
                "213=%d-ya Motostrelkovaya Diviziya",
                "215=%d-ya Motostrelkovaya Diviziya",
                "216=%d-ya Motostrelkovaya Diviziya",
                "218=%d-ya Motostrelkovaya Diviziya",
                "219=%d-ya Motostrelkovaya Diviziya",
                "220=%d-ya Motostrelkovaya Diviziya",
                "221=%d-ya Motostrelkovaya Diviziya",
                "236=%d-ya Motostrelkovaya Diviziya",
                "239=%d-ya Motostrelkovaya Diviziya",
                "# NKVD motor rifle divisions",
                "801=OMSDON 'imeni Dzerzhinskogo'",
                "802=2-ya Motostrelkovaya Diviziya Voisk NKVD",
                "803=3-ya Motostrelkovaya Diviziya Voisk NKVD",
                "804=4-ya Motostrelkovaya Diviziya Voisk NKVD",
                "806=6-ya Motostrelkovaya Diviziya Voisk NKVD",
                "807=7-ya Motostrelkovaya Diviziya Voisk NKVD",
                "808=8-ya Motostrelkovaya Diviziya Voisk NKVD",
                "809=9-ya Motostrelkovaya Diviziya Voisk NKVD",
                "821=21-ya Motostrelkovaya Diviziya Voisk NKVD",
                "822=22-ya Motostrelkovaya Diviziya Voisk NKVD",
                "823=23-ya Motostrelkovaya Diviziya Voisk NKVD"
            ]
}
```

```json batch
{
    "group":  "MEC_01",
    "removeAll":  true,
    "add":  [
                "# Mechanized divisions with the titles of their motorized predecessors (extrapolated)",
                "1=%d-ya 'Moskovskaya Proletarskaya' Mekhanizirovannaya Diviziya",
                "7=%d-ya 'Chernigovskaya' Mekhanizirovannaya Diviziya",
                "15=%d-ya 'Sivashskaya' Mekhanizirovannaya Diviziya",
                "29=%d-ya 'Sibirskaya' Mekhanizirovannaya Diviziya",
                "36=%d-ya 'Zabaykalskaya' Mekhanizirovannaya Diviziya",
                "57=%d-ya 'Uralskaya' Mekhanizirovannaya Diviziya",
                "84=%d-ya 'imeni Tulskogo Proletariata' Mekhanizirovannaya Diviziya"
            ]
}
```

```json batch
{
    "group":  "ARM_02",
    "removeAll":  true,
    "add":  [
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

```json batch
{
    "group":  "ARM_03",
    "selector":  "Guards Tank Corps",
    "clearOrdered":  true,
    "comment":  "Overrides vanilla SOV_ARM_03 as the plain variant (war-gated as in vanilla). SOV_GTC_01 is the named variant\nand shares this numbering."
}
```

```json batch
{
    "group":  "GTC_01",
    "selector":  "Guards Tank Corps (Named)",
    "removeAll":  true,
    "comment":  "Overrides vanilla SOV_GTC_01 as the named variant of SOV_ARM_03 and shares its numbering. All twelve Guards tank corps;\nthe 8th held no place honorific.",
    "add":  [
                "# Guards tank corps 1-12",
                "1=%d-y 'Donskoy' Gvardeyskiy Tankovyy Korpus",
                "2=%d-y 'Tatsinskiy' Gvardeyskiy Tankovyy Korpus",
                "3=%d-y 'Kotelnikovskiy' Gvardeyskiy Tankovyy Korpus",
                "4=%d-y 'Kantemirovskiy' Gvardeyskiy Tankovyy Korpus",
                "5=%d-y 'Stalingradsko-Kiyevskiy' Gvardeyskiy Tankovyy Korpus",
                "6=%d-y 'Kiyevsko-Berlinskiy' Gvardeyskiy Tankovyy Korpus",
                "7=%d-y 'Kiyevsko-Berlinskiy' Gvardeyskiy Tankovyy Korpus",
                "8=%d-y Gvardeyskiy Tankovyy Korpus",
                "9=%d-y 'Umanskiy' Gvardeyskiy Tankovyy Korpus",
                "10=%d-y 'Uralsko-Lvovskiy' Gvardeyskiy Tankovyy Korpus",
                "11=%d-y 'Prikarpatsko-Berlinskiy' Gvardeyskiy Tankovyy Korpus",
                "12=%d-y 'Umanskiy' Gvardeyskiy Tankovyy Korpus"
            ]
}
```

```json batch
{
    "group":  "PAR_01",
    "selector":  "Airborne Divisions",
    "clearOrdered":  true,
    "comment":  "# ===== Specialized \u0026 Airborne =====\nOverrides vanilla SOV_PAR_01 as a plain list. The Guards airborne divisions vanilla kept here are in SOV_AIR_01."
}
```

```json batch
{
    "group":  "AIR_01",
    "removeAll":  true,
    "comment":  "Guards airborne divisions on their own numbers (vanilla kept them in SOV_PAR_01 as keys 101-131 and 203-214).",
    "add":  [
                "# Guards airborne divisions of December 1942 and 1944",
                "1=%d-ya 'Zvenigorodskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "2=%d-ya 'Proskurovskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "3=%d-ya 'Umanskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "4=%d-ya 'Ovruchskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "5=%d-ya 'Zvenigorodskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "6=%d-ya 'Kremenchugsko-Znamenskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "7=%d-ya 'Cherkasskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "8=%d-ya 'Pervomayskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "9=%d-ya 'Poltavskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "10=%d-ya 'Krivorozhskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "11=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "12=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "13=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "14=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "15=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "16=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "# Guards airborne divisions of 1944-46",
                "21=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "31=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "76=%d-ya 'Chernigovskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "98=%d-ya 'Svirskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "103=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "104=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "106=%d-ya 'Tulskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya",
                "114=%d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya"
            ]
}
```

```json batch
{
    "group":  "MAR_01",
    "removeAll":  true,
    "comment":  "Overrides vanilla SOV_MAR_01. The Red Army formed naval infantry brigades (SOV_MAR_02), not divisions, so after\nthe 1st Mozyrskaya the fleet and flotilla titles are extrapolated.",
    "add":  [
                "# 1st Mozyr Naval Infantry Division (Baltic Fleet, 1944-48)",
                "1=%d-ya 'Mozyrskaya' Diviziya Morskoy Pekhoty",
                "# Fleet and flotilla divisions (extrapolated)",
                "2=%d-ya 'Chernomorskaya' Diviziya Morskoy Pekhoty",
                "3=%d-ya 'Severnaya' Diviziya Morskoy Pekhoty",
                "4=%d-ya 'Tikhookeanskaya' Diviziya Morskoy Pekhoty",
                "5=%d-ya 'Dunayskaya' Diviziya Morskoy Pekhoty",
                "6=%d-ya 'Volzhskaya' Diviziya Morskoy Pekhoty",
                "7=%d-ya 'Kaspiyskaya' Diviziya Morskoy Pekhoty",
                "8=%d-ya 'Azovskaya' Diviziya Morskoy Pekhoty",
                "9=%d-ya 'Amurskaya' Diviziya Morskoy Pekhoty",
                "10=%d-ya 'Ladozhskaya' Diviziya Morskoy Pekhoty",
                "11=%d-ya 'Baltiyskaya' Diviziya Morskoy Pekhoty"
            ]
}
```

```json batch
{
    "group":  "MNT_01",
    "removeAll":  true,
    "add":  [
                "# Mountain rifle divisions in vanilla's historical numbering",
                "9=%d-ya 'Kavkazskaya' Gornostrelkovaya Diviziya",
                "20=%d-ya Gornostrelkovaya Diviziya",
                "28=%d-ya 'Gorskaya' Gornostrelkovaya Diviziya",
                "30=%d-ya 'Irkutskaya' Gornostrelkovaya Diviziya",
                "44=%d-ya 'Kiyevskaya' Gornostrelkovaya Diviziya",
                "47=%d-ya 'Gruzinskaya' Gornostrelkovaya Diviziya",
                "58=%d-ya Gornostrelkovaya Diviziya",
                "60=%d-ya 'Kavkazskaya' Gornostrelkovaya Diviziya",
                "63=%d-ya 'Gruzinskaya' Gornostrelkovaya Diviziya",
                "68=%d-ya 'Turkestanskaya' Gornostrelkovaya Diviziya",
                "72=%d-ya 'Turkestanskaya' Gornostrelkovaya Diviziya",
                "76=%d-ya 'Armyanskaya' Gornostrelkovaya Diviziya",
                "77=%d-ya 'Azerbaydzhanskaya' Gornostrelkovaya Diviziya",
                "79=%d-ya Gornostrelkovaya Diviziya",
                "83=%d-ya 'Turkestanskaya' Gornostrelkovaya Diviziya",
                "96=%d-ya 'Vinnitskaya' Gornostrelkovaya Diviziya",
                "101=%d-ya Gornostrelkovaya Diviziya",
                "138=%d-ya Gornostrelkovaya Diviziya",
                "192=%d-ya Gornostrelkovaya Diviziya",
                "194=%d-ya Gornostrelkovaya Diviziya",
                "232=%d-ya Gornostrelkovaya Diviziya",
                "302=%d-ya Gornostrelkovaya Diviziya"
            ]
}
```

```json batch
{
    "group":  "GAR_01",
    "removeAll":  true,
    "add":  [
                "# NKVD border, railway protection and rifle divisions",
                "1=%d-ya Pogranichnaya Diviziya Voisk NKVD",
                "2=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog",
                "14=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog",
                "18=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog",
                "41=%d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog",
                "57=%d-ya Strelkovaya Diviziya Voisk NKVD",
                "# Leningrad People's Militia Divisions",
                "101=1-ya 'Kirovskaya' (Leningrad) Diviziya Narodnogo Opolcheniya",
                "102=2-ya 'Moskovskaya' (Leningrad) Diviziya Narodnogo Opolcheniya",
                "103=3-ya 'Frunzenskaya' (Leningrad) Diviziya Narodnogo Opolcheniya",
                "104=4-ya 'Dzerzhinskaya' (Leningrad) Diviziya Narodnogo Opolcheniya",
                "105=5-ya 'Kuybyshevskaya' (Leningrad) Diviziya Narodnogo Opolcheniya",
                "106=6-ya 'Oktyabrskaya' (Leningrad) Diviziya Narodnogo Opolcheniya",
                "107=7-ya 'Vasileostrovskaya' (Leningrad) Diviziya Narodnogo Opolcheniya",
                "# Moscow People's Militia Divisions",
                "108=1-ya 'Leninskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "109=2-ya 'Stalinskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "110=4-ya 'Kuybyshevskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "111=5-ya 'Frunzenskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "112=6-ya 'Dzerzhinskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "113=7-ya 'Baumanskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "114=8-ya 'Krasnopresnenskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "115=9-ya 'Kirovskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "116=13-ya 'Rostokinskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "117=17-ya 'Moskvoretskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "118=18-ya 'Leningradskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "119=21-ya 'Kiyevskaya' (Moskva) Diviziya Narodnogo Opolcheniya",
                "# Moscow Communist Rifle Divisions",
                "120=1-ya 'Moskovskaya Kommunisticheskaya' Diviziya",
                "121=2-ya 'Moskovskaya Kommunisticheskaya' Diviziya",
                "122=3-ya 'Moskovskaya Kommunisticheskaya' Diviziya",
                "123=4-ya 'Moskovskaya Kommunisticheskaya' Diviziya"
            ]
}
```

```json batch
{
    "group":  "GRD_01",
    "selector":  "Guards Rifle Divisions",
    "removeAll":  true,
    "add":  [
                "# Guards rifle divisions",
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
                "13=%d-ya 'Poltavskaya' Gvardeyskaya Strelkovaya Diviziya",
                "15=%d-ya 'Kharkovsko-Prazhskaya' Gvardeyskaya Strelkovaya Diviziya",
                "20=%d-ya 'Krivorozhskaya' Gvardeyskaya Strelkovaya Diviziya",
                "22=%d-ya 'Rizhskaya' Gvardeyskaya Strelkovaya Diviziya",
                "24=%d-ya 'Yevpatoriyskaya' Gvardeyskaya Strelkovaya Diviziya",
                "25=%d-ya 'Sinelnikovskaya' Gvardeyskaya Strelkovaya Diviziya",
                "27=%d-ya 'Novobugskaya' Gvardeyskaya Strelkovaya Diviziya",
                "29=%d-ya 'Yelninskaya' Gvardeyskaya Strelkovaya Diviziya",
                "30=%d-ya 'Rizhskaya' Gvardeyskaya Strelkovaya Diviziya",
                "32=%d-ya 'Tamanskaya' Gvardeyskaya Strelkovaya Diviziya",
                "33=%d-ya 'Sevastopolskaya' Gvardeyskaya Strelkovaya Diviziya",
                "35=%d-ya 'Lozovskaya' Gvardeyskaya Strelkovaya Diviziya",
                "39=%d-ya 'Barvenkovskaya' Gvardeyskaya Strelkovaya Diviziya",
                "41=%d-ya 'Korsunsko-Dunayskaya' Gvardeyskaya Strelkovaya Diviziya",
                "43=%d-ya 'Rizhskaya' Latyshskaya Gvardeyskaya Strelkovaya Diviziya",
                "45=%d-ya 'Krasnoselskaya' Gvardeyskaya Strelkovaya Diviziya",
                "50=%d-ya 'Stalinskaya' Gvardeyskaya Strelkovaya Diviziya",
                "51=%d-ya 'Vitebskaya' Gvardeyskaya Strelkovaya Diviziya",
                "53=%d-ya 'Tartuskaya' Gvardeyskaya Strelkovaya Diviziya",
                "63=%d-ya 'Krasnoselskaya' Gvardeyskaya Strelkovaya Diviziya",
                "64=%d-ya 'Krasnoselskaya' Gvardeyskaya Strelkovaya Diviziya",
                "70=%d-ya 'Glukhovskaya' Gvardeyskaya Strelkovaya Diviziya",
                "72=%d-ya 'Krasnogradskaya' Gvardeyskaya Strelkovaya Diviziya",
                "75=%d-ya 'Bakhmachskaya' Gvardeyskaya Strelkovaya Diviziya",
                "82=%d-ya 'Zaporozhskaya' Gvardeyskaya Strelkovaya Diviziya",
                "90=%d-ya 'Vitebsko-Novgorodskaya' Gvardeyskaya Strelkovaya Diviziya",
                "100=%d-ya 'Svirskaya' Gvardeyskaya Strelkovaya Diviziya",
                "# Estonian Guards rifle divisions",
                "118=%d-ya 'Tallinnskaya' Estonskaya Gvardeyskaya Strelkovaya Diviziya",
                "122=%d-ya 'Estonskaya' Gvardeyskaya Strelkovaya Diviziya"
            ]
}
```

```json batch
{
    "group":  "GMC_01",
    "selector":  "Guards Mechanized Corps"
}
```

```json batch
{
    "group":  "CAV_02",
    "fallback":  "%d-ya Kazachya Kavaleriyskaya Diviziya",
    "removeAll":  true,
    "comment":  "Overrides vanilla SOV_CAV_02 (SOV and UKR, as in vanilla). The host titles are extrapolated; the four Guards\nCossack divisions (9th and 10th Kuban, 11th and 12th Don) are real.",
    "add":  [
                "# Cossack host divisions (extrapolated)",
                "1=%d-ya 'Donskaya' Kazachya Kavaleriyskaya Diviziya",
                "2=%d-ya 'Kubanskaya' Kazachya Kavaleriyskaya Diviziya",
                "3=%d-ya 'Terskaya' Kazachya Kavaleriyskaya Diviziya",
                "4=%d-ya 'Stavropolskaya' Kazachya Kavaleriyskaya Diviziya",
                "5=%d-ya 'Uralskaya' Kazachya Kavaleriyskaya Diviziya",
                "6=%d-ya 'Orenburgskaya' Kazachya Kavaleriyskaya Diviziya",
                "7=%d-ya 'Zabaykalskaya' Kazachya Kavaleriyskaya Diviziya",
                "8=%d-ya 'Amurskaya' Kazachya Kavaleriyskaya Diviziya",
                "# Guards Cossack cavalry divisions (4th Guards Cossack Cavalry Corps)",
                "309=9-ya Gvardeyskaya 'Kubanskaya' Kazachya Kavaleriyskaya Diviziya",
                "310=10-ya Gvardeyskaya 'Kubanskaya' Kazachya Kavaleriyskaya Diviziya",
                "311=11-ya Gvardeyskaya 'Volnovakhskaya' Kazachya Kavaleriyskaya Diviziya",
                "312=12-ya Gvardeyskaya 'Korsunskaya' Kazachya Kavaleriyskaya Diviziya"
            ]
}
```

```json batch
{
    "group":  "PEN_01",
    "fallback":  "%d-ya Shtrafnaya Chast"
}
```

```json batch
{
    "group":  "NKVD_01",
    "removeAll":  true,
    "comment":  "# ===== NKVD Security Divisions =====\nCommunist only. The six named NKVD rifle divisions that formed the 70th Army; numbered NKVD divisions take the fallback.",
    "add":  [
                "# NKVD rifle divisions of the Separate NKVD Army (70th Army, 1942-43)",
                "1='Dalnevostochnaya' Strelkovaya Diviziya Voisk NKVD",
                "2='Zabaykalskaya' Strelkovaya Diviziya Voisk NKVD",
                "3='Sibirskaya' Strelkovaya Diviziya Voisk NKVD",
                "4='Uralskaya' Strelkovaya Diviziya Voisk NKVD",
                "5='Sredneaziatskaya' Strelkovaya Diviziya Voisk NKVD",
                "6='Stalingradskaya' Strelkovaya Diviziya Voisk NKVD"
            ]
}
```

```json batch
{
    "group":  "ART_01",
    "removeAll":  true,
    "comment":  "# ===== Artillery Formations =====\nBreakthrough artillery divisions of the Supreme Command Reserve (RVGK) on their own numbers, and the six Guards\nartillery divisions. Shares numbering with SOV_INF_01.",
    "add":  [
                "# Breakthrough artillery divisions of the RVGK",
                "1=%d-ya 'Pomeranskaya' Artilleriyskaya Diviziya Proryva",
                "2=%d-ya 'Ostrovskaya' Artilleriyskaya Diviziya Proryva",
                "3=%d-ya 'Zhitomirskaya' Artilleriyskaya Diviziya Proryva",
                "4=%d-ya 'Berlinskaya' Artilleriyskaya Diviziya Proryva",
                "5=%d-ya 'Kalinkovichskaya' Artilleriyskaya Diviziya Proryva",
                "6=%d-ya 'Mozyrskaya' Artilleriyskaya Diviziya Proryva",
                "7=%d-ya 'Zaporozhskaya' Artilleriyskaya Diviziya Proryva",
                "8=%d-ya Artilleriyskaya Diviziya",
                "9=%d-ya 'Zaporozhskaya' Artilleriyskaya Diviziya Proryva",
                "10=%d-ya 'Gumbinnenskaya' Artilleriyskaya Diviziya Proryva",
                "11=%d-ya 'Kirovogradskaya' Artilleriyskaya Diviziya Proryva",
                "12=%d-ya Artilleriyskaya Diviziya Proryva",
                "13=%d-ya 'Kiyevskaya' Artilleriyskaya Diviziya Proryva",
                "14=%d-ya 'Berlinskaya' Artilleriyskaya Diviziya Proryva",
                "15=%d-ya 'Leningradskaya' Artilleriyskaya Diviziya Proryva",
                "16=%d-ya 'Kirovogradskaya' Artilleriyskaya Diviziya Proryva",
                "17=%d-ya 'Kiyevsko-Zhitomirskaya' Artilleriyskaya Diviziya Proryva",
                "18=%d-ya 'Gatchinskaya' Artilleriyskaya Diviziya Proryva",
                "19=%d-ya 'Venskaya' Artilleriyskaya Diviziya Proryva",
                "20=%d-ya 'Orshanskaya' Artilleriyskaya Diviziya Proryva",
                "21=%d-ya 'Dukhovshchinskaya' Artilleriyskaya Diviziya Proryva",
                "22=%d-ya 'Gomelskaya' Artilleriyskaya Diviziya Proryva",
                "23=%d-ya 'Krasnoselskaya' Artilleriyskaya Diviziya Proryva",
                "24=%d-ya Artilleriyskaya Diviziya Proryva",
                "25=%d-ya 'Berlinskaya' Artilleriyskaya Diviziya Proryva",
                "26=%d-ya 'Sivashsko-Shtettinskaya' Artilleriyskaya Diviziya Proryva",
                "27=%d-ya 'Rezhitskaya' Artilleriyskaya Diviziya Proryva",
                "28=%d-ya Artilleriyskaya Diviziya Proryva",
                "29=%d-ya Artilleriyskaya Diviziya Proryva",
                "30=%d-ya 'Venskaya' Artilleriyskaya Diviziya Proryva",
                "31=%d-ya 'Drezdenskaya' Artilleriyskaya Diviziya Proryva",
                "# Guards artillery divisions",
                "101=1-ya Gvardeyskaya 'Glukhovskaya' Artilleriyskaya Diviziya Proryva",
                "102=2-ya Gvardeyskaya 'Perekopskaya' Artilleriyskaya Diviziya Proryva",
                "103=3-ya Gvardeyskaya 'Vitebsko-Khinganskaya' Artilleriyskaya Diviziya Proryva",
                "104=4-ya Gvardeyskaya 'Smolenskaya' Tyazhelaya Pushechnaya Artilleriyskaya Diviziya",
                "105=5-ya Gvardeyskaya 'Stalingradskaya' Artilleriyskaya Diviziya Proryva",
                "106=6-ya Gvardeyskaya 'Rizhsko-Khinganskaya' Artilleriyskaya Diviziya Proryva"
            ]
}
```

```json batch
{
    "addGroup":  true,
    "group":  "MEC_02",
    "selector":  "Mechanized Corps",
    "addType":  "mechanized motorized",
    "fallback":  "%d-y Mekhanizirovannyy Korpus",
    "after":  "MEC_01",
    "comment":  "Mechanized corps. The 1940-41 series (1-30) held no honorifics; of the 1942-45 corps only the 1st, 7th and 9th\nstayed non-Guards and earned one. The Guards corps are in SOV_GMC_01.",
    "add":  [
                "# Mechanized corps of 1942-45 (2-6 and 8 hold the numbers of the corps that became Guards)",
                "1=%d-y 'Krasnogradskiy' Mekhanizirovannyy Korpus",
                "2=%d-y Mekhanizirovannyy Korpus",
                "3=%d-y Mekhanizirovannyy Korpus",
                "4=%d-y Mekhanizirovannyy Korpus",
                "5=%d-y Mekhanizirovannyy Korpus",
                "6=%d-y Mekhanizirovannyy Korpus",
                "7=%d-y 'Novoukrainsko-Khinganskiy' Mekhanizirovannyy Korpus",
                "8=%d-y Mekhanizirovannyy Korpus",
                "9=%d-y 'Kiyevsko-Zhitomirskiy' Mekhanizirovannyy Korpus"
            ]
}
```

```json batch
{
    "addGroup":  true,
    "group":  "MAR_02",
    "selector":  "Naval Rifle Brigades",
    "addType":  "marine",
    "fallback":  "%d-ya Morskaya Strelkovaya Brigada",
    "after":  "MAR_01",
    "comment":  "Naval infantry brigades of the fleets and the naval rifle brigades of 1941-42, sailors fighting on land fronts,\non their real numbers (ru.wikipedia, Morskaya pekhota SSSR).",
    "add":  [
                "# Naval infantry brigades of the fleets",
                "1=%d-ya Osobaya Brigada Morskoy Pekhoty",
                "2=%d-ya Brigada Morskoy Pekhoty Baltiyskogo Flota",
                "3=%d-ya Brigada Morskoy Pekhoty Baltiyskogo Flota",
                "4=%d-ya Brigada Morskoy Pekhoty Baltiyskogo Flota",
                "5=%d-ya Brigada Morskoy Pekhoty Baltiyskogo Flota",
                "6=%d-ya Brigada Morskoy Pekhoty Baltiyskogo Flota",
                "7=%d-ya Brigada Morskoy Pekhoty Chernomorskogo Flota",
                "8=%d-ya Brigada Morskoy Pekhoty Chernomorskogo Flota",
                "9=%d-ya Brigada Morskoy Pekhoty Chernomorskogo Flota",
                "12=%d-ya 'Pechengskaya' Brigada Morskoy Pekhoty",
                "13=%d-ya Gvardeyskaya Brigada Morskoy Pekhoty",
                "# Naval rifle brigades of 1941-42 and the later naval infantry brigades",
                "61=%d-ya Morskaya Strelkovaya Brigada",
                "62=%d-ya Morskaya Strelkovaya Brigada",
                "63=%d-ya 'Kirkenesskaya' Brigada Morskoy Pekhoty",
                "64=%d-ya Morskaya Strelkovaya Brigada",
                "65=%d-ya Morskaya Strelkovaya Brigada",
                "66=%d-ya Morskaya Strelkovaya Brigada",
                "67=%d-ya Morskaya Strelkovaya Brigada",
                "68=%d-ya Morskaya Strelkovaya Brigada",
                "69=%d-ya Morskaya Strelkovaya Brigada",
                "70=%d-ya Morskaya Strelkovaya Brigada",
                "71=%d-ya Morskaya Strelkovaya Brigada",
                "72=%d-ya Morskaya Strelkovaya Brigada",
                "73=%d-ya Morskaya Strelkovaya Brigada",
                "74=%d-ya Morskaya Strelkovaya Brigada",
                "75=%d-ya Morskaya Strelkovaya Brigada",
                "76=%d-ya Morskaya Strelkovaya Brigada",
                "77=%d-ya Morskaya Strelkovaya Brigada",
                "80=%d-ya Morskaya Strelkovaya Brigada",
                "81=%d-ya Morskaya Strelkovaya Brigada",
                "83=%d-ya 'Novorossiysko-Dunayskaya' Brigada Morskoy Pekhoty",
                "85=%d-ya Morskaya Strelkovaya Brigada",
                "116=%d-ya Morskaya Strelkovaya Brigada",
                "154=%d-ya Morskaya Strelkovaya Brigada",
                "254=%d-ya Brigada Morskoy Pekhoty Severnogo Flota",
                "255=%d-ya 'Tamanskaya' Brigada Morskoy Pekhoty",
                "260=%d-ya Brigada Morskoy Pekhoty Baltiyskogo Flota"
            ]
}
```

```json batch
{
    "addGroup":  true,
    "group":  "UR_01",
    "selector":  "Fortified Regions",
    "addType":  "infantry",
    "fallback":  "%d-y Ukreplennyy Rayon",
    "after":  "GAR_01",
    "comment":  "Fortified regions (ukreplennyye rayony) on their 22 June 1941 numbers (istmat.org order of battle; ru.wikipedia).\nThe place name is the real designation; the field URs of the Moscow and Leningrad battles follow.",
    "add":  [
                "# Stalin Line: Kiev, Odessa and Western districts",
                "1=%d-y 'Kiyevskiy' Ukreplennyy Rayon",
                "3=%d-y 'Letichevskiy' Ukreplennyy Rayon",
                "5=%d-y 'Korostenskiy' Ukreplennyy Rayon",
                "7=%d-y 'Novograd-Volynskiy' Ukreplennyy Rayon",
                "10=%d-y 'Kamenets-Podolskiy' Ukreplennyy Rayon",
                "12=%d-y 'Mogilev-Yampolskiy' Ukreplennyy Rayon",
                "13=%d-y 'Izyaslavskiy' Ukreplennyy Rayon",
                "14=%d-y 'Starokonstantinovskiy' Ukreplennyy Rayon",
                "15=%d-y 'Shepetovskiy' Ukreplennyy Rayon",
                "17=%d-y 'Ostropolskiy' Ukreplennyy Rayon",
                "58=%d-y 'Sebezhskiy' Ukreplennyy Rayon",
                "61=%d-y 'Polotskiy' Ukreplennyy Rayon",
                "63=%d-y 'Minskiy' Ukreplennyy Rayon",
                "65=%d-y 'Mozyrskiy' Ukreplennyy Rayon",
                "67=%d-y 'Slutskiy' Ukreplennyy Rayon",
                "80=%d-y 'Rybnitskiy' Ukreplennyy Rayon",
                "82=%d-y 'Tiraspolskiy' Ukreplennyy Rayon",
                "# Leningrad and Karelia",
                "21=%d-y 'Kingiseppskiy' Ukreplennyy Rayon",
                "22=%d-y 'Karelskiy' Ukreplennyy Rayon",
                "23=%d-y 'Murmanskiy' Ukreplennyy Rayon",
                "25=%d-y 'Pskovskiy' Ukreplennyy Rayon",
                "26=%d-y 'Sortavalskiy' Ukreplennyy Rayon",
                "27=%d-y 'Keksgolmskiy' Ukreplennyy Rayon",
                "28=%d-y 'Vyborgskiy' Ukreplennyy Rayon",
                "# New western frontier, 1940-41 (Molotov Line)",
                "2=%d-y 'Vladimir-Volynskiy' Ukreplennyy Rayon",
                "4=%d-y 'Strumilovskiy' Ukreplennyy Rayon",
                "6=%d-y 'Rava-Russkiy' Ukreplennyy Rayon",
                "8=%d-y 'Peremyshlskiy' Ukreplennyy Rayon",
                "9=%d-y 'Kovelskiy' Ukreplennyy Rayon",
                "11=%d-y 'Chernovitskiy' Ukreplennyy Rayon",
                "41=%d-y 'Libavskiy' Ukreplennyy Rayon",
                "42=%d-y 'Shyaulyayskiy' Ukreplennyy Rayon",
                "44=%d-y 'Kaunasskiy' Ukreplennyy Rayon",
                "45=%d-y 'Rizhskiy' Ukreplennyy Rayon",
                "46=%d-y 'Telshyayskiy' Ukreplennyy Rayon",
                "48=%d-y 'Alitusskiy' Ukreplennyy Rayon",
                "62=%d-y 'Brestskiy' Ukreplennyy Rayon",
                "64=%d-y 'Zambrovskiy' Ukreplennyy Rayon",
                "66=%d-y 'Osovetskiy' Ukreplennyy Rayon",
                "68=%d-y 'Grodnenskiy' Ukreplennyy Rayon",
                "81=%d-y 'Dunayskiy' Ukreplennyy Rayon",
                "83=%d-y 'Odesskiy' Ukreplennyy Rayon",
                "84=%d-y 'Verkhneprutskiy' Ukreplennyy Rayon",
                "86=%d-y 'Nizhneprutskiy' Ukreplennyy Rayon",
                "# Transcaucasus, Transbaikal and Far East",
                "31=%d-y 'Daurskiy' Ukreplennyy Rayon",
                "32=%d-y 'Borzinskiy' Ukreplennyy Rayon",
                "51=%d-y 'Batumskiy' Ukreplennyy Rayon",
                "55=%d-y 'Lenkoranskiy' Ukreplennyy Rayon",
                "101=%d-y 'Blagoveshchenskiy' Ukreplennyy Rayon",
                "102=%d-y 'Ust-Sungariyskiy' Ukreplennyy Rayon",
                "103=%d-y 'Nizhne-Amurskiy' Ukreplennyy Rayon",
                "104=%d-y 'De-Kastrinskiy' Ukreplennyy Rayon",
                "105=%d-y 'Grodekovskiy' Ukreplennyy Rayon",
                "106=%d-y 'Poltavskiy' Ukreplennyy Rayon",
                "107=%d-y 'Barabashskiy' Ukreplennyy Rayon",
                "108=%d-y 'Posyetskiy' Ukreplennyy Rayon",
                "109=%d-y 'Imanskiy' Ukreplennyy Rayon",
                "110=%d-y 'Slavyanskiy' Ukreplennyy Rayon",
                "111=%d-y 'Shufanskiy' Ukreplennyy Rayon",
                "112=%d-y 'Khorolskiy' Ukreplennyy Rayon",
                "113=%d-y 'Khasanskiy' Ukreplennyy Rayon",
                "# Field fortified regions of 1941",
                "16=%d-y 'Nevskiy' Ukreplennyy Rayon",
                "90=%d-y 'Lovatskiy' Ukreplennyy Rayon",
                "152=%d-y 'Mozhayskiy' Ukreplennyy Rayon",
                "154=%d-y 'Maloyaroslavetskiy' Ukreplennyy Rayon",
                "155=%d-y 'Volokolamskiy' Ukreplennyy Rayon",
                "156=%d-y 'Odintsovskiy' Ukreplennyy Rayon",
                "157=%d-y 'Moskovskiy' Ukreplennyy Rayon"
            ]
}
```

```json batch
{
    "addGroup":  true,
    "group":  "NAT_01",
    "selector":  "National Rifle Divisions",
    "addType":  "infantry",
    "fallback":  "%d-ya Natsionalnaya Strelkovaya Diviziya",
    "link":  "INF_01",
    "after":  "GRD_01",
    "comment":  "National rifle divisions raised in the Union republics, 1941-45, on their real numbers (ru.wikipedia, national\nformations of the Red Army). Shares numbering with SOV_INF_01; the Latvian and Estonian Guards are in SOV_GRD_01.",
    "add":  [
                "# Baltic national divisions",
                "7=%d-ya 'Estonskaya' Strelkovaya Diviziya",
                "16=%d-ya 'Klaypedskaya' Litovskaya Strelkovaya Diviziya",
                "201=%d-ya 'Latyshskaya' Strelkovaya Diviziya",
                "249=%d-ya 'Estonskaya' Strelkovaya Diviziya",
                "308=%d-ya 'Latyshskaya' Strelkovaya Diviziya",
                "# Transcaucasian national divisions",
                "77=%d-ya 'Simferopolskaya' Azerbaydzhanskaya Strelkovaya Diviziya",
                "89=%d-ya 'Tamanskaya' Armyanskaya Strelkovaya Diviziya",
                "223=%d-ya 'Belgradskaya' Azerbaydzhanskaya Strelkovaya Diviziya",
                "227=%d-ya 'Temryukskaya' Azerbaydzhanskaya Strelkovaya Diviziya",
                "261=%d-ya 'Armyanskaya' Strelkovaya Diviziya",
                "271=%d-ya 'Gorlovskaya' Azerbaydzhanskaya Strelkovaya Diviziya",
                "276=%d-ya 'Temryukskaya' Gruzinskaya Strelkovaya Diviziya",
                "390=%d-ya 'Armyanskaya' Strelkovaya Diviziya",
                "392=%d-ya 'Gruzinskaya' Strelkovaya Diviziya",
                "396=%d-ya 'Azerbaydzhanskaya' Strelkovaya Diviziya",
                "402=%d-ya 'Azerbaydzhanskaya' Strelkovaya Diviziya",
                "408=%d-ya 'Armyanskaya' Strelkovaya Diviziya",
                "409=%d-ya 'Armyanskaya' Strelkovaya Diviziya",
                "414=%d-ya 'Anapskaya' Gruzinskaya Strelkovaya Diviziya",
                "416=%d-ya 'Taganrogskaya' Azerbaydzhanskaya Strelkovaya Diviziya",
                "# Karelo-Finnish and Kazakh national divisions",
                "71=%d-ya 'Karelo-Finskaya' Strelkovaya Diviziya",
                "150=%d-ya 'Kazakhskaya' Strelkovaya Diviziya",
                "316=%d-ya 'Kazakhskaya' Strelkovaya Diviziya"
            ]
}
```

```json batch
{
    "addGroup":  true,
    "group":  "PRT_01",
    "selector":  "Partisan Formations",
    "addType":  "militia infantry",
    "fallback":  "%d-ya Partizanskaya Brigada",
    "canUse":  "has_government = communism",
    "after":  "ART_01",
    "comment":  "# ===== Ideology-Gated Groups =====\nCommunist only. Soviet partisan formations of 1941-44: Kovpak's 1st Ukrainian Partisan Division, the Ukrainian\nraiding formations, Belarusian and Leningrad brigades and the Crimean formations. Numbered brigades past the list are extrapolated.",
    "add":  [
                "# Partisan division and formations",
                "1=1-ya 'imeni Kovpaka' Ukrainskaya Partizanskaya Diviziya",
                "2='Sumskoye' Partizanskoye Soyedineniye",
                "3='Chernigovsko-Volynskoye' Partizanskoye Soyedineniye",
                "4='Chernigovskoye' Partizanskoye Soyedineniye",
                "5='Rovenskoye' Partizanskoye Soyedineniye",
                "6='Zhitomirskoye' Partizanskoye Soyedineniye",
                "7='imeni Mikhaylova' Partizanskoye Soyedineniye",
                "8='Severnoye' Krymskoye Partizanskoye Soyedineniye",
                "9='Yuzhnoye' Krymskoye Partizanskoye Soyedineniye",
                "10='Vostochnoye' Krymskoye Partizanskoye Soyedineniye",
                "# Belarusian brigades",
                "11=1-ya 'Belorusskaya' Partizanskaya Brigada",
                "12=2-ya 'Belorusskaya' Partizanskaya Brigada",
                "13=1-ya 'Minskaya' Partizanskaya Brigada",
                "14=1-ya 'Vitebskaya' Partizanskaya Brigada",
                "15='Chekist' Partizanskaya Brigada",
                "16='Zheleznyak' Partizanskaya Brigada",
                "17='imeni Chapayeva' Partizanskaya Brigada",
                "18='imeni Lenina' Diversionnaya Brigada",
                "19=100-ya 'imeni Kirova' Partizanskaya Brigada",
                "# Leningrad brigades",
                "20=1-ya 'Leningradskaya' Partizanskaya Brigada",
                "21=2-ya 'Leningradskaya' Partizanskaya Brigada",
                "22=3-ya 'imeni Germana' Leningradskaya Partizanskaya Brigada",
                "23=5-ya 'Leningradskaya' Partizanskaya Brigada",
                "24=6-ya 'Leningradskaya' Partizanskaya Brigada",
                "25=7-ya 'Leningradskaya' Partizanskaya Brigada",
                "# Detachments",
                "26='Pobediteli' Partizanskiy Otryad"
            ]
}
```

```json batch
{
    "addGroup":  true,
    "group":  "IMP_01",
    "selector":  "Imperial Guard Divisions",
    "addType":  "infantry",
    "fallback":  "%d-ya Gvardeyskaya Pekhotnaya Diviziya",
    "canUse":  "has_government = neutrality",
    "after":  "PRT_01",
    "comment":  "Neutrality only (monarchist restoration). The Guards Corps of 1914: the 1st-3rd Guards Infantry Divisions bear the names of their\nsenior regiments, further divisions those of the other Leib-Guard regiments (extrapolated onto real regiment names).",
    "add":  [
                "# Guards infantry divisions of 1914, named after their senior regiments",
                "1=%d-ya 'Preobrazhenskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "2=%d-ya 'Moskovskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "3=%d-ya 'Litovskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "# Further divisions named after the Leib-Guard infantry regiments",
                "4=%d-ya 'Semyonovskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "5=%d-ya 'Izmaylovskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "6=%d-ya 'Yegerskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "7=%d-ya 'Grenaderskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "8=%d-ya 'Pavlovskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "9=%d-ya 'Finlyandskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "10=%d-ya 'Keksgolmskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "11=%d-ya 'Petrogradskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "12=%d-ya 'Volynskaya' Gvardeyskaya Pekhotnaya Diviziya",
                "# Guards rifle divisions named after the Imperial Guard rifle regiments",
                "13=%d-ya 'Yego Velichestva' Gvardeyskaya Strelkovaya Diviziya",
                "14=%d-ya 'Tsarskoselskaya' Gvardeyskaya Strelkovaya Diviziya",
                "15=%d-ya 'Imperatorskoy Familii' Gvardeyskaya Strelkovaya Diviziya"
            ]
}
```

```json batch
{
    "addGroup":  true,
    "group":  "WHT_01",
    "selector":  "White Volunteer Divisions",
    "addType":  "infantry",
    "fallback":  "%d-ya Dobrovolcheskaya Diviziya",
    "canUse":  "has_government = fascism",
    "after":  "IMP_01",
    "comment":  "Fascist only (nationalist anti-Bolshevik Russia). The colored divisions and the named divisions of the Eastern Front\nare real (ru.wikipedia; pygmywars.com); the North-Western Army's regiment towns as division titles are extrapolated.",
    "add":  [
                "# Colored divisions of the Volunteer Army and the Russian Army (1919-20)",
                "1='Kornilovskaya' Udarnaya Diviziya",
                "2='Markovskaya' Pekhotnaya Diviziya",
                "3='Drozdovskaya' Strelkovaya Diviziya",
                "4='Alekseyevskaya' Pekhotnaya Diviziya",
                "# Eastern Front divisions (1919)",
                "5='Izhevskaya' Strelkovaya Diviziya",
                "6=15-ya 'Votkinskaya' Strelkovaya Diviziya",
                "7=16-ya 'Sarapulskaya' Strelkovaya Diviziya",
                "8=1-ya 'Sibirskaya' Strelkovaya Diviziya",
                "9=4-ya 'Stepnaya' Strelkovaya Diviziya",
                "10=7-ya 'Uralskaya' Gornostrelkovaya Diviziya",
                "11=1-ya Udarnaya Diviziya",
                "12=2-ya Udarnaya Diviziya",
                "# North-Western Army regiment towns as division titles (extrapolated)",
                "13='Talabskaya' Pekhotnaya Diviziya",
                "14='Gdovskaya' Pekhotnaya Diviziya",
                "15='Pskovskaya' Pekhotnaya Diviziya",
                "16='Revelskaya' Pekhotnaya Diviziya",
                "17='Narvskaya' Pekhotnaya Diviziya",
                "18='Kolyvanskaya' Pekhotnaya Diviziya",
                "19='Chudskaya' Pekhotnaya Diviziya",
                "20='Pechorskaya' Pekhotnaya Diviziya"
            ]
}
```

```json batch
{
    "addGroup":  true,
    "group":  "REP_01",
    "selector":  "Republican Shock Divisions",
    "addType":  "infantry",
    "fallback":  "%d-ya Udarnaya Diviziya",
    "canUse":  "has_government = democratic",
    "after":  "WHT_01",
    "comment":  "Democratic only (the Russian Republic of 1917 and the SR Komuch of 1918). The 2nd and 3rd divisions, the Volga regiments and\ngroups and the 1917 battalions are real; the Volga town titles on the other divisions are extrapolated.",
    "add":  [
                "# People's Army of the Komuch (1918)",
                "1=%d-ya 'Samarskaya' Strelkovaya Diviziya",
                "2=%d-ya 'Syzranskaya' Strelkovaya Diviziya",
                "3=%d-ya Strelkovaya Diviziya Narodnoy Armii",
                "4=%d-ya 'Simbirskaya' Strelkovaya Diviziya",
                "5=%d-ya 'Kazanskaya' Strelkovaya Diviziya",
                "6=%d-ya 'Stavropolskaya' Strelkovaya Diviziya",
                "7=%d-ya 'Buzulukskaya' Strelkovaya Diviziya",
                "8=%d-ya 'Buguruslanskaya' Strelkovaya Diviziya",
                "9=%d-ya 'Bugulminskaya' Strelkovaya Diviziya",
                "10=%d-ya 'Khvalynskaya' Strelkovaya Diviziya",
                "11=%d-ya 'Ufimskaya' Strelkovaya Diviziya",
                "12=%d-ya 'Nikolayevskaya' Strelkovaya Diviziya",
                "# Shock and women's battalions of 1917",
                "13=1-y 'Slavyanskiy' Udarnyy Polk",
                "14=1-y 'Russkiy' Zhenskiy Batalyon Smerti",
                "15=1-y 'Petrogradskiy' Zhenskiy Batalyon",
                "16=2-y 'Moskovskiy' Zhenskiy Batalyon Smerti",
                "17=3-y 'Kubanskiy' Zhenskiy Udarnyy Batalyon",
                "18='Saratovskiy' Zhenskiy Udarnyy Batalyon"
            ]
}
```

## Per-group changes
<!-- BEGIN CHANGE TABLE: generated by build.ps1 -AuditPlan; rerun it to refresh, never edit by hand -->
| Group | Count | Added | Removed | Other |
|---|---|---|---|---|
| INF_01 | 51 -> 413 | %d-ya Strelkovaya Diviziya (x363), %d-ya 'imeni Proletariata Donbassa' Strelkovaya Diviziya, %d-ya 'imeni Tulskogo Proletariata' Strelkovaya Diviziya, %d-ya 'Kiyevskaya' Strelkovaya Diviziya | %d-ya 'Donbassa' Strelkovaya Diviziya, %d-ya 'Tulskaya' Strelkovaya Diviziya, %d-ya 'Kievskaya' Strelkovaya Diviziya | - |
| CAV_01 | 40 -> 115 | %d-ya Kavaleriyskaya Diviziya (x64), %d-ya 'Armyanskaya' Gorno-Kavaleriyskaya Diviziya, %d-ya 'Turkmenskaya' Kavaleriyskaya Diviziya (x2), %d-ya 'Uzbekskaya' Kavaleriyskaya Diviziya (x5), %d-ya 'Tadzhikskaya' Kavaleriyskaya Diviziya, %d-ya 'Kazakhskaya' Kavaleriyskaya Diviziya (x2), %d-ya 'Kirgizskaya' Kavaleriyskaya Diviziya (x3), %d-ya 'Kalmytskaya' Kavaleriyskaya Diviziya (x2), %d-ya 'Bashkirskaya' Kavaleriyskaya Diviziya (x2), %d-ya 'Checheno-Ingushskaya' Kavaleriyskaya Diviziya, %d-ya 'Kabardino-Balkarskaya' Kavaleriyskaya Diviziya, 1-ya Gvardeyskaya 'Stavropolskaya' Kavaleriyskaya Diviziya, 11-ya Gvardeyskaya 'Volnovakhskaya' Kavaleriyskaya Diviziya, 12-ya Gvardeyskaya 'Korsunskaya' Kavaleriyskaya Diviziya | %d-ya 'Zaporozhskaya' Kavaleriyskaya Diviziya, %d-ya 'Kavkazskaya' Gorno-Kavaleriyskaya Diviziya, %d-ya 'Krasnoznamennaya' Kavaleriyskaya Diviziya, %d-ya 'Krasnodarskaya' Kavaleriyskaya Diviziya, %d-ya 'Stavropolskaya' Kavaleriyskaya Diviziya, %d-ya 'Ural-Kavkazskaya' Kavaleriyskaya Diviziya, %d-ya 'Zabaykalskaya' Kavaleriyskaya Diviziya, %d-ya 'Altayskaya' Kavaleriyskaya Diviziya, 1-ya Gvardeyskaya Kavaleriyskaya Diviziya, 11-ya Gvardeyskaya Kavaleriyskaya Diviziya, 12-ya Gvardeyskaya Kavaleriyskaya Diviziya | - |
| MOT_01 | 32 -> 43 | %d-ya Motostrelkovaya Diviziya (x25), %d-ya 'imeni Tulskogo Proletariata' Motostrelkovaya Diviziya, OMSDON 'imeni Dzerzhinskogo', 2-ya Motostrelkovaya Diviziya Voisk NKVD, 3-ya Motostrelkovaya Diviziya Voisk NKVD, 4-ya Motostrelkovaya Diviziya Voisk NKVD, 6-ya Motostrelkovaya Diviziya Voisk NKVD, 7-ya Motostrelkovaya Diviziya Voisk NKVD, 8-ya Motostrelkovaya Diviziya Voisk NKVD, 9-ya Motostrelkovaya Diviziya Voisk NKVD, 21-ya Motostrelkovaya Diviziya Voisk NKVD, 22-ya Motostrelkovaya Diviziya Voisk NKVD, 23-ya Motostrelkovaya Diviziya Voisk NKVD | %d-ya 'Kalininskaya' Motostrelkovaya Diviziya, %d-ya 'Yartsevskaya' Motostrelkovaya Diviziya, %d-ya 'Krasnokutskaya' Motostrelkovaya Diviziya, %d-ya 'Krasnoznamennaya' Motostrelkovaya Diviziya, %d-ya 'Ropshinskaya' Motostrelkovaya Diviziya, %d-ya 'Novgorodskaya' Motostrelkovaya Diviziya, %d-ya 'Pankovskaya' Motostrelkovaya Diviziya, %d-ya 'Leningradskaya' Motostrelkovaya Diviziya, %d-ya 'Khabarovskaya' Motostrelkovaya Diviziya, %d-ya 'Vladivostokskaya' Motostrelkovaya Diviziya, %d-ya 'Dalnevostochnaya' Motostrelkovaya Diviziya, %d-ya 'Volochayevskaya' Motostrelkovaya Diviziya, %d-ya 'Ussuriyskaya' Motostrelkovaya Diviziya, %d-ya 'Prikaspiyskaya' Motostrelkovaya Diviziya, %d-ya 'Brestskaya' Motostrelkovaya Diviziya, %d-ya 'Poltavskaya' Motostrelkovaya Diviziya, %d-ya 'Smolenskaya' Motostrelkovaya Diviziya, %d-ya 'Minskaya' Motostrelkovaya Diviziya, %d-ya 'Vitebskaya' Motostrelkovaya Diviziya, %d-ya 'Orshanskaya' Motostrelkovaya Diviziya, %d-ya 'Mogilevskaya' Motostrelkovaya Diviziya, OMSDON 'Dzerzhinskogo' Diviziya, 2-ya 'Khabarovskaya' Motostrelkovaya Diviziya Voisk NKVD, 3-ya 'Leningradskaya' Motostrelkovaya Diviziya Voisk NKVD, 8-ya 'Moskovskaya' Motostrelkovaya Diviziya Voisk NKVD, 21-ya 'Leningradskaya' Motostrelkovaya Diviziya Voisk NKVD | - |
| MEC_01 | 10 -> 7 | %d-ya 'imeni Tulskogo Proletariata' Mekhanizirovannaya Diviziya | %d-ya 'Sevastopolskaya' Mekhanizirovannaya Diviziya, %d-ya 'Krasnokutskaya' Mekhanizirovannaya Diviziya, %d-ya 'Vitebskaya' Mekhanizirovannaya Diviziya, %d-ya 'Krasnoznamennaya' Mekhanizirovannaya Diviziya | - |
| ARM_02 | 10 -> 11 | %d-y 'Dvinskiy' Tankovyy Korpus, %d-y 'Bobruysko-Berlinskiy' Tankovyy Korpus, %d-y 'Radomsko-Berlinskiy' Tankovyy Korpus, %d-y 'Znamensko-Budapeshtskiy' Tankovyy Korpus, %d-y 'Perekopskiy' Tankovyy Korpus | %d-y 'Daugavpilsskiy' Tankovyy Korpus, %d-y 'Bobruyskiy' Tankovyy Korpus, %d-y 'Novograd-Volynskiy' Tankovyy Korpus | - |
| ARM_03 | 12 -> 0 | - | %d-y 'Donskoy' Gvardeyskiy Tankovyy Korpus, %d-y 'Tatsinskiy' Gvardeyskiy Tankovyy Korpus, %d-y 'Kotelnikovskiy' Gvardeyskiy Tankovyy Korpus, %d-y 'Kantemirovskiy' Gvardeyskiy Tankovyy Korpus, %d-y 'Stalingradsko-Kievskiy' Gvardeyskiy Tankovyy Korpus, %d-y 'Kievsko-Berlinskiy' Gvardeyskiy Tankovyy Korpus (x2), %d-y 'Krasnoznamyonnyy' Gvardeyskiy Tankovyy Korpus, %d-y 'Umanskiy' Gvardeyskiy Tankovyy Korpus (x2), %d-y 'Uralsko-Lvovskiy' Gvardeyskiy Tankovyy Korpus, %d-y 'Prikarpatsko-Berlinskiy' Gvardeyskiy Tankovyy Korpus | selector: 'Guard Tank Corps' -> 'Guards Tank Corps' |
| PAR_01 | 13 -> 0 | - | 1-ya Gvardeyskaya 'Zvenigorodskaya' Vozdushno-Desantnaya Diviziya, 2-ya Gvardeyskaya 'Proskurovskaya' Vozdushno-Desantnaya Diviziya, 3-ya Gvardeyskaya 'Umanskaya' Vozdushno-Desantnaya Diviziya, 4-ya Gvardeyskaya 'Ovruchskaya' Vozdushno-Desantnaya Diviziya, 5-ya Gvardeyskaya 'Zvenigorodskaya' Vozdushno-Desantnaya Diviziya, 6-ya Gvardeyskaya 'Kremenchugsko-Znamenskaya' Vozdushno-Desantnaya Diviziya, 7-ya Gvardeyskaya 'Cherkasskaya' Vozdushno-Desantnaya Diviziya, 8-ya Gvardeyskaya 'Pervomayskaya' Vozdushno-Desantnaya Diviziya, 9-ya Gvardeyskaya 'Poltavskaya' Vozdushno-Desantnaya Diviziya, 10-ya Gvardeyskaya 'Krivorozhskaya' Vozdushno-Desantnaya Diviziya, 76-ya Gvardeyskaya 'Chernigovskaya' Vozdushno-Desantnaya Diviziya, 98-ya Gvardeyskaya 'Svirskaya' Vozdushno-Desantnaya Diviziya, 106-ya Gvardeyskaya 'Tulskaya' Vozdushno-Desantnaya Diviziya | selector: 'Paratrooper Divisions' -> 'Airborne Divisions' |
| MAR_01 | 13 -> 11 | - | %d-ya 'Krasnoznamennaya' Diviziya Morskoy Pekhoty, %d-ya 'Novorossiyskaya' Diviziya Morskoy Pekhoty | - |
| MNT_01 | 14 -> 22 | %d-ya Gornostrelkovaya Diviziya (x9), %d-ya 'Kiyevskaya' Gornostrelkovaya Diviziya | %d-ya 'Proletariata Donbassa' Gornostrelkovaya Diviziya, %d-ya 'Kievskaya' Gornostrelkovaya Diviziya | - |
| GAR_01 | 29 -> 29 | %d-ya Pogranichnaya Diviziya Voisk NKVD, %d-ya Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog (x4), %d-ya Strelkovaya Diviziya Voisk NKVD | %d-ya 'Leningradskaya' Pogranichnaya Diviziya Voisk NKVD, %d-ya 'Moskovskaya' Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog, %d-ya 'Ukrainskaya' Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog, %d-ya 'Kavkazskaya' Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog, %d-ya 'Povolzhskaya' Diviziya Voisk NKVD po Okhrane Zheleznykh Dorog, %d-ya 'Uralskaya' Strelkovaya Diviziya Voisk NKVD | - |
| GRD_01 | 37 -> 40 | %d-ya Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Rizhskaya' Gvardeyskaya Strelkovaya Diviziya (x2), %d-ya 'Yelninskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Korsunsko-Dunayskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Rizhskaya' Latyshskaya Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Stalinskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Tartuskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Vitebsko-Novgorodskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Svirskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Tallinnskaya' Estonskaya Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Estonskaya' Gvardeyskaya Strelkovaya Diviziya | %d-ya 'Krasnoznamennaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Nikolayevskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Polotskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Leningradskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Korsunskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Tartusskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Rozhdestvenskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Brestskaya' Gvardeyskaya Strelkovaya Diviziya | selector: 'Guards Rifles' -> 'Guards Rifle Divisions' |
| GMC_01 | 9 -> 9 | - | - | selector: 'Guards Mechanized' -> 'Guards Mechanized Corps' |
| GTC_01 | 12 -> 12 | %d-y 'Stalingradsko-Kiyevskiy' Gvardeyskiy Tankovyy Korpus, %d-y 'Kiyevsko-Berlinskiy' Gvardeyskiy Tankovyy Korpus (x2), %d-y Gvardeyskiy Tankovyy Korpus | %d-y 'Stalingradsko-Kievskiy' Gvardeyskiy Tankovyy Korpus, %d-y 'Kievsko-Berlinskiy' Gvardeyskiy Tankovyy Korpus (x2), %d-y 'Krasnoznamyonnyy' Gvardeyskiy Tankovyy Korpus | selector: 'Guards Tanks' -> 'Guards Tank Corps (Named)'; links: [] -> [SOV_ARM_03] |
| CAV_02 | 17 -> 12 | %d-ya 'Donskaya' Kazachya Kavaleriyskaya Diviziya, %d-ya 'Kubanskaya' Kazachya Kavaleriyskaya Diviziya, %d-ya 'Terskaya' Kazachya Kavaleriyskaya Diviziya, %d-ya 'Stavropolskaya' Kazachya Kavaleriyskaya Diviziya, %d-ya 'Uralskaya' Kazachya Kavaleriyskaya Diviziya, %d-ya 'Orenburgskaya' Kazachya Kavaleriyskaya Diviziya, %d-ya 'Zabaykalskaya' Kazachya Kavaleriyskaya Diviziya, %d-ya 'Amurskaya' Kazachya Kavaleriyskaya Diviziya, 9-ya Gvardeyskaya 'Kubanskaya' Kazachya Kavaleriyskaya Diviziya, 10-ya Gvardeyskaya 'Kubanskaya' Kazachya Kavaleriyskaya Diviziya, 11-ya Gvardeyskaya 'Volnovakhskaya' Kazachya Kavaleriyskaya Diviziya, 12-ya Gvardeyskaya 'Korsunskaya' Kazachya Kavaleriyskaya Diviziya | %d-ya 'Donskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya 'Kubanskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya 'Terskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya 'Stavropol'skaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya 'Ural'skaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya 'Orenburgskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya 'Zabaykal'skaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya 'Amurskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (9-ya Gv.) 'Kubanskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (10-ya Gv.) 'Kubansko-Slonimskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (11-ya Gv.) 'Donskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (12-ya Gv.) 'Donsko-Korsunskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (13-ya Gv.) 'Donsko-Debaltsevskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (14-ya Gv.) 'Gneznenskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (15-ya Gv.) 'Mozyrskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (16-ya Gv.) 'Chernigovskaya' Kazach'ya Kavaleriyskaya Diviziya, %d-ya (17-ya Gv.) 'Mozyrskaya' Kazach'ya Kavaleriyskaya Diviziya | fallback: '%d-ya Kazach'ya Kavaleriyskaya Diviziya' -> '%d-ya Kazachya Kavaleriyskaya Diviziya' |
| PEN_01 | 0 -> 0 | - | - | fallback: '%d-ya Shtrafnaya Chast'' -> '%d-ya Shtrafnaya Chast' |
| NKVD_01 | 30 -> 6 | 'Dalnevostochnaya' Strelkovaya Diviziya Voisk NKVD, 'Zabaykalskaya' Strelkovaya Diviziya Voisk NKVD, 'Sibirskaya' Strelkovaya Diviziya Voisk NKVD, 'Uralskaya' Strelkovaya Diviziya Voisk NKVD, 'Sredneaziatskaya' Strelkovaya Diviziya Voisk NKVD, 'Stalingradskaya' Strelkovaya Diviziya Voisk NKVD | %d-ya 'Leningradskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Krymskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Kiyevskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Krasnoznamennaya' Strelkovaya Diviziya Voisk NKVD (x2), %d-ya 'Belorusskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Kavkazskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Zabaykalskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Tbilisskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Rostovskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Stalingradskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Saratovskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Voronezhskaya' Strelkovaya Diviziya Voisk NKVD, %d-ya 'Severnaya' Diviziya Voisk NKVD, %d-ya 'Dalnevostochnaya' Diviziya Voisk NKVD, %d-ya 'Pribaltiyskaya' Diviziya Voisk NKVD, %d-ya 'Gorkovskaya' Diviziya Voisk NKVD, %d-ya 'Yuzhnaya' Diviziya Voisk NKVD, %d-ya 'Zapadnaya' Diviziya Voisk NKVD, %d-ya 'Moskovskaya' Diviziya Voisk NKVD, %d-ya 'Leningradskaya' Motostrelkovaya Diviziya Voisk NKVD, %d-ya 'Khabarovskaya' Motostrelkovaya Diviziya Voisk NKVD, %d-ya 'Vladivostokskaya' Motostrelkovaya Diviziya Voisk NKVD, %d-ya 'Uralskaya' Diviziya Voisk NKVD, %d-ya 'Sibirskaya' Diviziya Voisk NKVD, %d-ya 'Sredneaziatskaya' Diviziya Voisk NKVD, %d-ya 'Povolzhskaya' Diviziya Voisk NKVD, %d-ya 'Dneprovskaya' Diviziya Voisk NKVD, %d-ya 'Donetskaya' Diviziya Voisk NKVD, %d-ya 'Kazakhskaya' Diviziya Voisk NKVD | - |
| AIR_01 | 10 -> 24 | %d-ya Gvardeyskaya Vozdushno-Desantnaya Diviziya (x11), %d-ya 'Chernigovskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya, %d-ya 'Svirskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya, %d-ya 'Tulskaya' Gvardeyskaya Vozdushno-Desantnaya Diviziya | - | - |
| ART_01 | 22 -> 37 | %d-ya 'Pomeranskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Ostrovskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Zhitomirskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Kalinkovichskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Mozyrskaya' Artilleriyskaya Diviziya Proryva, %d-ya Artilleriyskaya Diviziya, %d-ya Artilleriyskaya Diviziya Proryva (x4), %d-ya 'Kiyevskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Gatchinskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Dukhovshchinskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Rezhitskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Drezdenskaya' Artilleriyskaya Diviziya Proryva, 1-ya Gvardeyskaya 'Glukhovskaya' Artilleriyskaya Diviziya Proryva, 2-ya Gvardeyskaya 'Perekopskaya' Artilleriyskaya Diviziya Proryva, 3-ya Gvardeyskaya 'Vitebsko-Khinganskaya' Artilleriyskaya Diviziya Proryva, 4-ya Gvardeyskaya 'Smolenskaya' Tyazhelaya Pushechnaya Artilleriyskaya Diviziya, 5-ya Gvardeyskaya 'Stalingradskaya' Artilleriyskaya Diviziya Proryva, 6-ya Gvardeyskaya 'Rizhsko-Khinganskaya' Artilleriyskaya Diviziya Proryva | %d-ya (1-ya Gv.) 'Glukhovskaya' Artilleriyskaya Diviziya Proryva, %d-ya (2-ya Gv.) 'Perekopskaya' Artilleriyskaya Diviziya Proryva, %d-ya (3-ya Gv.) 'Vitebskaya' Artilleriyskaya Diviziya Proryva, %d-ya (4-ya Gv.) 'Smolenskaya' Artilleriyskaya Diviziya Proryva, %d-ya (5-ya Gv.) 'Stalingradskaya' Artilleriyskaya Diviziya Proryva, %d-ya (6-ya Gv.) 'Krasnoznamennaya' Artilleriyskaya Diviziya Proryva, %d-ya (7-ya Gv.) 'Kovelskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Perekopskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Pochinkovskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Klaipedskaya' Artilleriyskaya Diviziya Proryva, %d-ya 'Terskaya' Artilleriyskaya Diviziya Proryva | - |
| MEC_02 | new, 9 | %d-y 'Krasnogradskiy' Mekhanizirovannyy Korpus, %d-y Mekhanizirovannyy Korpus (x6), %d-y 'Novoukrainsko-Khinganskiy' Mekhanizirovannyy Korpus, %d-y 'Kiyevsko-Zhitomirskiy' Mekhanizirovannyy Korpus | - | - |
| MAR_02 | new, 37 | %d-ya Osobaya Brigada Morskoy Pekhoty, %d-ya Brigada Morskoy Pekhoty Baltiyskogo Flota (x6), %d-ya Brigada Morskoy Pekhoty Chernomorskogo Flota (x3), %d-ya 'Pechengskaya' Brigada Morskoy Pekhoty, %d-ya Gvardeyskaya Brigada Morskoy Pekhoty, %d-ya Morskaya Strelkovaya Brigada (x21), %d-ya 'Kirkenesskaya' Brigada Morskoy Pekhoty, %d-ya 'Novorossiysko-Dunayskaya' Brigada Morskoy Pekhoty, %d-ya Brigada Morskoy Pekhoty Severnogo Flota, %d-ya 'Tamanskaya' Brigada Morskoy Pekhoty | - | - |
| UR_01 | new, 68 | %d-y 'Kiyevskiy' Ukreplennyy Rayon, %d-y 'Letichevskiy' Ukreplennyy Rayon, %d-y 'Korostenskiy' Ukreplennyy Rayon, %d-y 'Novograd-Volynskiy' Ukreplennyy Rayon, %d-y 'Kamenets-Podolskiy' Ukreplennyy Rayon, %d-y 'Mogilev-Yampolskiy' Ukreplennyy Rayon, %d-y 'Izyaslavskiy' Ukreplennyy Rayon, %d-y 'Starokonstantinovskiy' Ukreplennyy Rayon, %d-y 'Shepetovskiy' Ukreplennyy Rayon, %d-y 'Ostropolskiy' Ukreplennyy Rayon, %d-y 'Sebezhskiy' Ukreplennyy Rayon, %d-y 'Polotskiy' Ukreplennyy Rayon, %d-y 'Minskiy' Ukreplennyy Rayon, %d-y 'Mozyrskiy' Ukreplennyy Rayon, %d-y 'Slutskiy' Ukreplennyy Rayon, %d-y 'Rybnitskiy' Ukreplennyy Rayon, %d-y 'Tiraspolskiy' Ukreplennyy Rayon, %d-y 'Kingiseppskiy' Ukreplennyy Rayon, %d-y 'Karelskiy' Ukreplennyy Rayon, %d-y 'Murmanskiy' Ukreplennyy Rayon, %d-y 'Pskovskiy' Ukreplennyy Rayon, %d-y 'Sortavalskiy' Ukreplennyy Rayon, %d-y 'Keksgolmskiy' Ukreplennyy Rayon, %d-y 'Vyborgskiy' Ukreplennyy Rayon, %d-y 'Vladimir-Volynskiy' Ukreplennyy Rayon, %d-y 'Strumilovskiy' Ukreplennyy Rayon, %d-y 'Rava-Russkiy' Ukreplennyy Rayon, %d-y 'Peremyshlskiy' Ukreplennyy Rayon, %d-y 'Kovelskiy' Ukreplennyy Rayon, %d-y 'Chernovitskiy' Ukreplennyy Rayon, %d-y 'Libavskiy' Ukreplennyy Rayon, %d-y 'Shyaulyayskiy' Ukreplennyy Rayon, %d-y 'Kaunasskiy' Ukreplennyy Rayon, %d-y 'Rizhskiy' Ukreplennyy Rayon, %d-y 'Telshyayskiy' Ukreplennyy Rayon, %d-y 'Alitusskiy' Ukreplennyy Rayon, %d-y 'Brestskiy' Ukreplennyy Rayon, %d-y 'Zambrovskiy' Ukreplennyy Rayon, %d-y 'Osovetskiy' Ukreplennyy Rayon, %d-y 'Grodnenskiy' Ukreplennyy Rayon, %d-y 'Dunayskiy' Ukreplennyy Rayon, %d-y 'Odesskiy' Ukreplennyy Rayon, %d-y 'Verkhneprutskiy' Ukreplennyy Rayon, %d-y 'Nizhneprutskiy' Ukreplennyy Rayon, %d-y 'Daurskiy' Ukreplennyy Rayon, %d-y 'Borzinskiy' Ukreplennyy Rayon, %d-y 'Batumskiy' Ukreplennyy Rayon, %d-y 'Lenkoranskiy' Ukreplennyy Rayon, %d-y 'Blagoveshchenskiy' Ukreplennyy Rayon, %d-y 'Ust-Sungariyskiy' Ukreplennyy Rayon, %d-y 'Nizhne-Amurskiy' Ukreplennyy Rayon, %d-y 'De-Kastrinskiy' Ukreplennyy Rayon, %d-y 'Grodekovskiy' Ukreplennyy Rayon, %d-y 'Poltavskiy' Ukreplennyy Rayon, %d-y 'Barabashskiy' Ukreplennyy Rayon, %d-y 'Posyetskiy' Ukreplennyy Rayon, %d-y 'Imanskiy' Ukreplennyy Rayon, %d-y 'Slavyanskiy' Ukreplennyy Rayon, %d-y 'Shufanskiy' Ukreplennyy Rayon, %d-y 'Khorolskiy' Ukreplennyy Rayon, %d-y 'Khasanskiy' Ukreplennyy Rayon, %d-y 'Nevskiy' Ukreplennyy Rayon, %d-y 'Lovatskiy' Ukreplennyy Rayon, %d-y 'Mozhayskiy' Ukreplennyy Rayon, %d-y 'Maloyaroslavetskiy' Ukreplennyy Rayon, %d-y 'Volokolamskiy' Ukreplennyy Rayon, %d-y 'Odintsovskiy' Ukreplennyy Rayon, %d-y 'Moskovskiy' Ukreplennyy Rayon | - | - |
| NAT_01 | new, 23 | %d-ya 'Estonskaya' Strelkovaya Diviziya (x2), %d-ya 'Klaypedskaya' Litovskaya Strelkovaya Diviziya, %d-ya 'Latyshskaya' Strelkovaya Diviziya (x2), %d-ya 'Simferopolskaya' Azerbaydzhanskaya Strelkovaya Diviziya, %d-ya 'Tamanskaya' Armyanskaya Strelkovaya Diviziya, %d-ya 'Belgradskaya' Azerbaydzhanskaya Strelkovaya Diviziya, %d-ya 'Temryukskaya' Azerbaydzhanskaya Strelkovaya Diviziya, %d-ya 'Armyanskaya' Strelkovaya Diviziya (x4), %d-ya 'Gorlovskaya' Azerbaydzhanskaya Strelkovaya Diviziya, %d-ya 'Temryukskaya' Gruzinskaya Strelkovaya Diviziya, %d-ya 'Gruzinskaya' Strelkovaya Diviziya, %d-ya 'Azerbaydzhanskaya' Strelkovaya Diviziya (x2), %d-ya 'Anapskaya' Gruzinskaya Strelkovaya Diviziya, %d-ya 'Taganrogskaya' Azerbaydzhanskaya Strelkovaya Diviziya, %d-ya 'Karelo-Finskaya' Strelkovaya Diviziya, %d-ya 'Kazakhskaya' Strelkovaya Diviziya (x2) | - | - |
| PRT_01 | new, 26 | 1-ya 'imeni Kovpaka' Ukrainskaya Partizanskaya Diviziya, 'Sumskoye' Partizanskoye Soyedineniye, 'Chernigovsko-Volynskoye' Partizanskoye Soyedineniye, 'Chernigovskoye' Partizanskoye Soyedineniye, 'Rovenskoye' Partizanskoye Soyedineniye, 'Zhitomirskoye' Partizanskoye Soyedineniye, 'imeni Mikhaylova' Partizanskoye Soyedineniye, 'Severnoye' Krymskoye Partizanskoye Soyedineniye, 'Yuzhnoye' Krymskoye Partizanskoye Soyedineniye, 'Vostochnoye' Krymskoye Partizanskoye Soyedineniye, 1-ya 'Belorusskaya' Partizanskaya Brigada, 2-ya 'Belorusskaya' Partizanskaya Brigada, 1-ya 'Minskaya' Partizanskaya Brigada, 1-ya 'Vitebskaya' Partizanskaya Brigada, 'Chekist' Partizanskaya Brigada, 'Zheleznyak' Partizanskaya Brigada, 'imeni Chapayeva' Partizanskaya Brigada, 'imeni Lenina' Diversionnaya Brigada, 100-ya 'imeni Kirova' Partizanskaya Brigada, 1-ya 'Leningradskaya' Partizanskaya Brigada, 2-ya 'Leningradskaya' Partizanskaya Brigada, 3-ya 'imeni Germana' Leningradskaya Partizanskaya Brigada, 5-ya 'Leningradskaya' Partizanskaya Brigada, 6-ya 'Leningradskaya' Partizanskaya Brigada, 7-ya 'Leningradskaya' Partizanskaya Brigada, 'Pobediteli' Partizanskiy Otryad | - | - |
| IMP_01 | new, 15 | %d-ya 'Preobrazhenskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Moskovskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Litovskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Semyonovskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Izmaylovskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Yegerskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Grenaderskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Pavlovskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Finlyandskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Keksgolmskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Petrogradskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Volynskaya' Gvardeyskaya Pekhotnaya Diviziya, %d-ya 'Yego Velichestva' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Tsarskoselskaya' Gvardeyskaya Strelkovaya Diviziya, %d-ya 'Imperatorskoy Familii' Gvardeyskaya Strelkovaya Diviziya | - | - |
| WHT_01 | new, 20 | 'Kornilovskaya' Udarnaya Diviziya, 'Markovskaya' Pekhotnaya Diviziya, 'Drozdovskaya' Strelkovaya Diviziya, 'Alekseyevskaya' Pekhotnaya Diviziya, 'Izhevskaya' Strelkovaya Diviziya, 15-ya 'Votkinskaya' Strelkovaya Diviziya, 16-ya 'Sarapulskaya' Strelkovaya Diviziya, 1-ya 'Sibirskaya' Strelkovaya Diviziya, 4-ya 'Stepnaya' Strelkovaya Diviziya, 7-ya 'Uralskaya' Gornostrelkovaya Diviziya, 1-ya Udarnaya Diviziya, 2-ya Udarnaya Diviziya, 'Talabskaya' Pekhotnaya Diviziya, 'Gdovskaya' Pekhotnaya Diviziya, 'Pskovskaya' Pekhotnaya Diviziya, 'Revelskaya' Pekhotnaya Diviziya, 'Narvskaya' Pekhotnaya Diviziya, 'Kolyvanskaya' Pekhotnaya Diviziya, 'Chudskaya' Pekhotnaya Diviziya, 'Pechorskaya' Pekhotnaya Diviziya | - | - |
| REP_01 | new, 18 | %d-ya 'Samarskaya' Strelkovaya Diviziya, %d-ya 'Syzranskaya' Strelkovaya Diviziya, %d-ya Strelkovaya Diviziya Narodnoy Armii, %d-ya 'Simbirskaya' Strelkovaya Diviziya, %d-ya 'Kazanskaya' Strelkovaya Diviziya, %d-ya 'Stavropolskaya' Strelkovaya Diviziya, %d-ya 'Buzulukskaya' Strelkovaya Diviziya, %d-ya 'Buguruslanskaya' Strelkovaya Diviziya, %d-ya 'Bugulminskaya' Strelkovaya Diviziya, %d-ya 'Khvalynskaya' Strelkovaya Diviziya, %d-ya 'Ufimskaya' Strelkovaya Diviziya, %d-ya 'Nikolayevskaya' Strelkovaya Diviziya, 1-y 'Slavyanskiy' Udarnyy Polk, 1-y 'Russkiy' Zhenskiy Batalyon Smerti, 1-y 'Petrogradskiy' Zhenskiy Batalyon, 2-y 'Moskovskiy' Zhenskiy Batalyon Smerti, 3-y 'Kubanskiy' Zhenskiy Udarnyy Batalyon, 'Saratovskiy' Zhenskiy Udarnyy Batalyon | - | - |

Unchanged: ARM_01, ARM_04
<!-- END CHANGE TABLE -->
