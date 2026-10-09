---
name: hoi4-inex-release
description: >-
  Use when publishing Immersive Namelists Expanded (INEX) to the Steam Workshop or preparing a release:
  "release", "publish", "upload to Steam", "update the Workshop". Covers the preflight, the in-game check with
  -GameLog, the change note and the upload. Namelist changes themselves belong to the planning skills and
  hoi4-inex-namelist-implement.
---

# INEX Release

Publishes what is committed. Two steps need the user: starting the game, and running the upload (SteamCMD may ask for a password or a Steam Guard code, which only the user's own terminal can answer). Everything else is commands with a stated result.

## 1. Preflight
1. `git status --short` prints nothing. Uncommitted work means a plan has not shipped: stop and say which files.
2. `powershell -File .\build.ps1 -ValidateOnly` ends with `Validation succeeded`, and `powershell -File .\build.ps1 -Test` reports 0 failed.
3. Find the last release: `git tag --list "workshop-*" --sort=-creatordate`, first line. With no such tag, ask the user which commit was published last.

## 2. In-game check
The tests cannot see what the game does with a file; the game's own log can.
1. `powershell -File .\build.ps1` deploys the mod to the launcher's mod directory.
2. Ask the user to start the game with INEX enabled and go as far as the main menu (namelists are read at load). For each nation changed since the last release, ask them to load it, open a division template, and open its name list. Wait for their answer.
3. `powershell -File .\build.ps1 -GameLog` prints `0 line(s) name INEX files` and no `[WARN]`.
   - A listed line is a defect in a namelist file: stop the release and report the lines. The fix goes through `-EditNames`, then this skill starts again.
   - `[WARN] The log is older than ...` means the game ran before the last change: repeat from 1.
4. Report anything the user saw that looked wrong (a list missing from the dropdown, a wrong name). That is a stop too.

## 3. Change note
1. `git log <last tag>..HEAD --format=%s -- common/` lists what changed.
2. Write the note from it: one or two sentences that name the nations and what was done (`Audit the German namelists; add Romania`). Show it to the user and take their wording if they give one.

## 4. Publish
1. `powershell -File .\build.ps1 -PublishSteam -DryRun -ChangeNote "<note>"` previews the upload. Show the user the change note and the staged file list.
2. The user runs the upload in their own terminal: `powershell -File .\build.ps1 -PublishSteam -ChangeNote "<note>"`. Give them the command with the note filled in and wait for the result.
3. After a successful upload: `git tag workshop-YYYY-MM-DD` (today's date). Pushing the tag is the user's call.
4. When `git diff <last tag>..HEAD --stat -- WORKSHOP_DESCRIPTION_GUIDELINES.md` shows a change, print the guide's `bbcode` block for the user to paste into the Workshop page (`CLAUDE.md` §4.5; Antigravity: `GEMINI.md`).
