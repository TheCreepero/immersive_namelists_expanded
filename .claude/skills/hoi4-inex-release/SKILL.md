---
name: hoi4-inex-release
description: >-
  Use when publishing Immersive Namelists Expanded (INEX) to the Steam Workshop or preparing a release:
  "release", "publish", "upload to Steam", "update the Workshop". Adds the INEX in-game check with -GameLog
  and the INEX change note to the shared hoi4-mod-release skill. Namelist changes themselves belong to the
  planning skills and hoi4-inex-namelist-implement.
---

# INEX Release

INEX releases through the shared `hoi4-mod-release` skill and its command, `Publish-Mod.ps1 "Immersive Namelists Expanded"`. Follow that skill step by step; the sections below replace or extend its steps for INEX. As there, the upload is previewed first with `Publish-Mod.ps1 "Immersive Namelists Expanded" -DryRun -ChangeNote "<note>"`, and the user runs the upload in their own terminal.

## 1. Preflight (extends shared step 1)
The knowledge audit row must also show an empty sweep queue: a WARN for doc files to sweep is a stop for INEX. Sweep what is queued with the `hoi4-modding-knowledge` skill, then run the preflight again.

## 2. In-game check (replaces shared step 2)
1. `powershell -File .\build.ps1` deploys the mod to the launcher's mod directory.
2. Ask the user to start the game with INEX enabled and go as far as the main menu (namelists are read at load). For each nation changed since the last release, ask them to load it, open a division template, and open its name list. Wait for their answer.
3. `powershell -File .\build.ps1 -GameLog` prints `0 line(s) name INEX files` and no `[WARN]`.
   - A listed line is a defect in a namelist file: stop the release and report the lines. The fix goes through `-EditNames`, then this skill starts again.
   - `[WARN] The log is older than ...` means the game ran before the last change: repeat from 1.
4. Report anything the user saw that looked wrong (a list missing from the dropdown, a wrong name). That is a stop too.

## 3. Change note (extends shared step 3)
The note names the nations and what was done (`Audit the German namelists; add Romania`).

## 4. Workshop description (extends shared step 4)
When `WORKSHOP_DESCRIPTION_GUIDELINES.md` changed since the last tag, either add `-UpdateDescription` to the upload, or print the guide's `bbcode` block for the user to paste into the Workshop page (`CLAUDE.md` §4.5; Antigravity: `GEMINI.md`). Ask the user which.
