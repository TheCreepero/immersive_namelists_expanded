---
name: hoi4-inex-namelist-implement
description: >-
  Use when carrying out a finished Immersive Namelists Expanded (INEX) plan file from docs/plans
  (Status READY or IN PROGRESS): "implement", "apply", "continue" or "ship" a namelist or audit plan, or a plan
  path given as the argument. Dispatches the inex-implementer subagent, verifies its result and ships on the
  user's word. Does no research and makes no naming decisions; for those use hoi4-inex-namelist-authoring or
  hoi4-inex-namelist-audit.
---

# INEX Namelist Plan Implementation

Carries out one plan file written by `hoi4-inex-namelist-authoring` or `hoi4-inex-namelist-audit`. The planning is done: the plan holds every decision, every name and every docs text, so the work is mechanical. The `inex-implementer` subagent does it in a fresh context on a cheap model; this session dispatches it, verifies what it reports, and ships.

## Rules
- **The plan is the only source.** This skill decides nothing and composes nothing: no new names, no respellings, no regrouping, no rewording of docs text, no research. A plan that looks wrong or incomplete goes back to its planner (§4).
- **The namelist file changes only through the `build.ps1` commands the plan gives**, run by the implementer.
- **Read the plan only up to `## Edit batch`.** The batch is applied by the script from the file.
- `build.ps1`, the tests, the skill files, `AGENTS.md`, `CLAUDE.md`, `GEMINI.md` and `docs/inex-agent-guide.md` are not edited.
- Commit and wiki push are outward-facing: they run only in §5, on the user's word.

## 1. Find the plan
1. Take the plan path from the request. With no path, `Grep -n '^Status:'` across `docs/plans/` for `READY` or `IN PROGRESS`; with more than one or none, ask the user which plan to run.
2. Act on its `Status:` line:
   - `PLANNING`: stop. Tell the user the plan is unfinished and belongs back with the planning skill.
   - `READY` or `IN PROGRESS`: continue with §2. The implementer starts at the first unticked step.
   - `DONE`: skip to §3. Only the ship step may remain.

## 2. Dispatch the implementer
Dispatch `inex-implementer` (`.claude/agents/inex-implementer.md`; the brief sets its model and holds the whole runbook). The prompt is the plan path and nothing else: `Carry out docs/plans/<file>.md`. One plan per dispatch. Wait for its report.

Antigravity: pass the brief's path to `invoke_subagent`. Where no subagent can be dispatched, read the brief and follow it yourself.

## 3. Verify
The implementer's report is a claim. Check it yourself before telling the user anything:
1. `powershell -File .\build.ps1 -Check <TAG>` ends with `Check passed`.
2. Every flag on its `Flags:` line is listed in the plan's "Kept on judgment" (`Grep -n '^## '` the plan, then `Read` that section).
3. `git status --short` lists only the namelist file, the docs files the plan's "Docs payload" and steps name, and the plan itself.
4. The plan's `Status:` is `DONE` and every box is ticked except the ship step.

All four hold: go to §5. Otherwise §4.

## 4. When it stops
The implementer reported `STOPPED`, or a check in §3 does not hold. Leave the files as they are and report to the user: the step, the exact output, and what the plan would need. The planner corrects the plan (the planning skill that wrote it, or the user); this skill does not fix names, plan text or tooling, and does not work around. Once the plan is corrected, dispatch again: the implementer resumes at the first unticked step.

## 5. Report and ship
Report to the user: the `-Check` summary, the files changed, any deviation the implementer recorded, and that the plan is ready to ship. Then stop.

On the user's word, one confirmation covers the plan's whole ship step:
1. Tick the ship box in the plan, so the commit carries the finished plan.
2. Move the plan into `docs/plans/archive/` and stage it at its archived path: `git mv` when the plan is tracked, `Move-Item` and `git add` when it is new (an authoring plan is usually first committed here). Finished plans live in the archive, and `docs/plans/` holds only the template and the plans in progress.
3. Commit the files from §3.3, with the plan at its archived path, with the commit message the ship step gives.
4. Run the ship step's wiki push command. If it fails, report the output; the commit stands.

Publishing to the Steam Workshop is a separate decision: `hoi4-inex-release`.
