<#
.SYNOPSIS
    Pester tests for documentation synchronization and mod metadata integrity.
#>

BeforeAll {
    $script:RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    $script:DescriptorPath = Join-Path $script:RepoRoot "descriptor.mod"
    $script:ThumbnailPath = Join-Path $script:RepoRoot "thumbnail.png"
    $script:ReadmePath = Join-Path $script:RepoRoot "README.md"
    $script:WorkshopGuidePath = Join-Path $script:RepoRoot "WORKSHOP_DESCRIPTION_GUIDELINES.md"
    $script:NamelistDir = Join-Path $script:RepoRoot "common\units\names_divisions"

    # Extract all distinct TAGs from INEX_<TAG>_*.txt
    $files = Get-ChildItem -Path $script:NamelistDir -Filter "INEX_*.txt"
    $script:ImplementedTags = [System.Collections.Generic.HashSet[string]]::new()
    foreach ($f in $files) {
        if ($f.Name -match '^INEX_([A-Z0-9]{3})_') {
            [void]$script:ImplementedTags.Add($matches[1])
        }
    }
}

Describe "Mod Metadata & Assets" {
    It "descriptor.mod must exist and define required attributes" {
        (Test-Path $script:DescriptorPath) | Should -BeTrue

        $content = [System.IO.File]::ReadAllText($script:DescriptorPath, [System.Text.Encoding]::UTF8)
        $content | Should -Match 'name\s*=\s*"[^"]+"'
        $content | Should -Match 'version\s*=\s*"[^"]+"'
        $content | Should -Match 'supported_version\s*=\s*"[^"]+"'
        $content | Should -Match 'tags\s*=\s*\{'
    }

    It "thumbnail.png must exist and be under 1MB for Steam Workshop compliance" {
        (Test-Path $script:ThumbnailPath) | Should -BeTrue

        $item = Get-Item $script:ThumbnailPath
        $item.Length | Should -BeLessThan 1048576 -Because "Steam Workshop limits thumbnail file size to 1MB"
    }
}

Describe "Documentation Synchronization: README.md" {
    BeforeAll {
        $script:ReadmeContent = [System.IO.File]::ReadAllText($script:ReadmePath, [System.Text.Encoding]::UTF8)
    }

    It "README.md must exist" {
        (Test-Path $script:ReadmePath) | Should -BeTrue
    }

    It "Every implemented nation tag must be listed in README.md" {
        foreach ($tag in $script:ImplementedTags) {
            # Single-quoted so the backtick stays a literal "optional markdown-code backtick" in the
            # regex, and [ \t]* (not \s*) so this can't bridge across a newline into an unrelated table row.
            $pattern = '\|[ \t]*`?' + [regex]::Escape($tag) + '`?[ \t]*\|'
            $script:ReadmeContent | Should -Match $pattern -Because "Tag '$tag' must be documented in the README Included Nations table"
        }
    }
}

Describe "Documentation Synchronization: WORKSHOP_DESCRIPTION_GUIDELINES.md" {
    BeforeAll {
        $script:GuideContent = [System.IO.File]::ReadAllText($script:WorkshopGuidePath, [System.Text.Encoding]::UTF8)
    }

    It "WORKSHOP_DESCRIPTION_GUIDELINES.md must exist" {
        (Test-Path $script:WorkshopGuidePath) | Should -BeTrue
    }

    It "Every implemented nation tag must be listed in the repository cross-reference table" {
        foreach ($tag in $script:ImplementedTags) {
            $pattern = '\|[ \t]*`?' + [regex]::Escape($tag) + '`?[ \t]*\|'
            $script:GuideContent | Should -Match $pattern -Because "Tag '$tag' must be present in the cross-reference table"
        }
    }

    It "Planned section should not be present in the active workshop description" {
        $script:GuideContent | Should -Not -Match '\[h1\]Planned:\[/h1\]' -Because "Planned section was removed to conserve character limit"
    }

    It "Active workshop description must stay within Steam's 17,000 character limit" {
        $bbcode = [regex]::Match($script:GuideContent, '(?s)```bbcode\r?\n(.*?)\r?\n```')
        $bbcode.Success | Should -BeTrue -Because "the guide holds the active description in a bbcode block"
        ($bbcode.Groups[1].Value -replace "`r`n", "`n").Length | Should -BeLessOrEqual 17000
    }

    It "Active workshop description must not contain emojis" {
        $bbcode = [regex]::Match($script:GuideContent, '(?s)```bbcode\r?\n(.*?)\r?\n```')
        # Surrogate pairs plus the symbol, dingbat and variation-selector ranges (same pattern as build.ps1 -Audit)
        $symbols = '[' + [char]0x2600 + '-' + [char]0x27BF + [char]0x2B50 + [char]0x2B55 + [char]0xFE0F + ']'
        $found = @([regex]::Matches($bbcode.Groups[1].Value, '\p{Cs}\p{Cs}|' + $symbols) | ForEach-Object { $_.Value })
        $found.Count | Should -Be 0 -Because "the workshop description must not contain emojis (found: $($found -join ' '))"
    }
}

Describe "Agent Skill Mirrors: .claude/skills and .agents/skills" {
    BeforeAll {
        $script:ClaudeSkillsDir = Join-Path $script:RepoRoot ".claude\skills"
        $script:AgentsSkillsDir = Join-Path $script:RepoRoot ".agents\skills"
        $script:SkillNames = @(
            @(Get-ChildItem -Path $script:ClaudeSkillsDir -Directory -ErrorAction SilentlyContinue) +
            @(Get-ChildItem -Path $script:AgentsSkillsDir -Directory -ErrorAction SilentlyContinue) |
                ForEach-Object { $_.Name } | Sort-Object -Unique
        )
    }

    It "At least one skill must be defined" {
        $script:SkillNames.Count | Should -BeGreaterThan 0
    }

    It "Every skill must have byte-identical SKILL.md copies for Claude Code and Antigravity" {
        foreach ($name in $script:SkillNames) {
            $claudeCopy = Join-Path $script:ClaudeSkillsDir "$name\SKILL.md"
            $agentsCopy = Join-Path $script:AgentsSkillsDir "$name\SKILL.md"
            (Test-Path $claudeCopy) | Should -BeTrue -Because "skill '$name' must exist under .claude/skills"
            (Test-Path $agentsCopy) | Should -BeTrue -Because "skill '$name' must exist under .agents/skills"
            (Get-FileHash $claudeCopy).Hash | Should -Be (Get-FileHash $agentsCopy).Hash -Because "skill '$name' copies must stay in sync"
        }
    }
}

Describe "Agent Rule Files: CLAUDE.md and GEMINI.md" {
    It "CLAUDE.md and GEMINI.md must exist and be byte-identical" {
        $claudePath = Join-Path $script:RepoRoot "CLAUDE.md"
        $geminiPath = Join-Path $script:RepoRoot "GEMINI.md"
        (Test-Path $claudePath) | Should -BeTrue -Because "CLAUDE.md must exist at repo root"
        (Test-Path $geminiPath) | Should -BeTrue -Because "GEMINI.md must exist at repo root"
        (Get-FileHash $claudePath).Hash | Should -Be (Get-FileHash $geminiPath).Hash -Because "CLAUDE.md and GEMINI.md must remain byte-identical"
    }
}

Describe "Subagent Config & Budgeting" {
    It "Subagent briefs exist in .claude/agents" {
        $requiredAgents = @('inex-audit-researcher.md', 'inex-historical-researcher.md', 'inex-code-reviewer.md')
        foreach ($agent in $requiredAgents) {
            $path = Join-Path $script:RepoRoot ".claude\agents\$agent"
            (Test-Path $path) | Should -BeTrue -Because "subagent brief '$agent' must exist in .claude/agents/"
        }
    }

    It "Audit researcher stays budgeted (effort, maxTurns, web-only tools, stated call budget)" {
        $text = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot '.claude\agents\inex-audit-researcher.md'), [System.Text.Encoding]::UTF8)
        $front = [regex]::Match($text, '(?s)^---\r?\n(.*?)\r?\n---').Groups[1].Value
        $front | Should -Match '(?m)^effort:\s*(low|medium)\s*$' -Because "audit research is lookup work; high effort multiplies thinking tokens"
        $turns = [regex]::Match($front, '(?m)^maxTurns:\s*(\d+)\s*$')
        $turns.Success | Should -BeTrue -Because "a hard turn cap stops runaway research"
        [int]$turns.Groups[1].Value | Should -BeLessOrEqual 40
        $tools = [regex]::Match($front, '(?m)^tools:\s*(.+)$').Groups[1].Value
        $tools | Should -Not -Match '\b(Read|Grep|Glob|Bash|PowerShell|Write|Edit)\b' -Because "group names are pasted into the prompt; the namelist is never opened"
        $text | Should -Match 'at most \d+ web calls'
    }

    It "Proofreader stays narrow (web-only tools, turn cap, no project rules, small call budget, problems-only output)" {
        # inex-code-reviewer.md keeps its file name, but is a proofreader of pasted names: mechanical checks are lints
        $text = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot '.claude\agents\inex-code-reviewer.md'), [System.Text.Encoding]::UTF8)
        $front = [regex]::Match($text, '(?s)^---\r?\n(.*?)\r?\n---').Groups[1].Value
        $front | Should -Match '(?m)^effort:\s*(low|medium)\s*$'
        $turns = [regex]::Match($front, '(?m)^maxTurns:\s*(\d+)\s*$')
        $turns.Success | Should -BeTrue -Because "a hard turn cap keeps the proofread to a few lookups"
        [int]$turns.Groups[1].Value | Should -BeLessOrEqual 12
        $tools = [regex]::Match($front, '(?m)^tools:\s*(.+)$').Groups[1].Value
        $tools | Should -Not -Match '\b(Read|Grep|Glob|Bash|PowerShell|Write|Edit)\b' -Because "the added names are pasted into the prompt; the proofreader has no file access"
        $front | Should -Match '(?m)^omitClaudeMd:\s*true\s*$' -Because "the brief carries everything the proofreader needs"
        $calls = [regex]::Match($text, 'at most (\d+) web calls')
        $calls.Success | Should -BeTrue
        [int]$calls.Groups[1].Value | Should -BeLessOrEqual 10
        $text | Should -Match 'No issues found' -Because "a clean proofread is one line, with no list of what was verified"
    }

    It "Historical researcher has a turn cap and a stated call budget" {
        $text = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot '.claude\agents\inex-historical-researcher.md'), [System.Text.Encoding]::UTF8)
        $front = [regex]::Match($text, '(?s)^---\r?\n(.*?)\r?\n---').Groups[1].Value
        $turns = [regex]::Match($front, '(?m)^maxTurns:\s*(\d+)\s*$')
        $turns.Success | Should -BeTrue -Because "dossier runs made 43-91 fetches before the brief had a cap"
        [int]$turns.Groups[1].Value | Should -BeLessOrEqual 60
        $front | Should -Match '(?m)^omitClaudeMd:\s*true\s*$'
        $text | Should -Match 'about \d+ web calls'
    }

    It "Historical researcher writes its dossier to a file and returns a short summary" {
        $text = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot '.claude\agents\inex-historical-researcher.md'), [System.Text.Encoding]::UTF8)
        $front = [regex]::Match($text, '(?s)^---\r?\n(.*?)\r?\n---').Groups[1].Value
        $tools = [regex]::Match($front, '(?m)^tools:\s*(.+)$').Groups[1].Value
        $tools | Should -Not -Match '\b(Read|Grep|Glob|Bash|PowerShell|Edit)\b' -Because "the caller pastes the vanilla and current names; whole-file reads in a subagent cost tokens too"
        $tools | Should -Match '\bWrite\b' -Because "the dossier goes to scratch/ so the planner can read it by section"
        $text | Should -Match 'scratch/<tag>_dossier\.md'
        $text | Should -Match 'at most 200 words'
    }
}

Describe "Plan hand-off: planning skills stop, the implement skill only executes" {
    BeforeAll {
        $script:ReadSkill = {
            param([string]$Name)
            [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot ".claude\skills\$Name\SKILL.md"), [System.Text.Encoding]::UTF8)
        }
    }

    It "Planning skills end at the hand-off and gate it with a dry run" {
        foreach ($name in 'hoi4-inex-namelist-authoring', 'hoi4-inex-namelist-audit') {
            $text = & $script:ReadSkill $name
            $text | Should -Match 'hoi4-inex-namelist-implement' -Because "$name hands a READY plan to the implement skill"
            $text | Should -Match '-DryRun' -Because "$name proves the batch applies before hand-off"
            $text | Should -Match 'Status: READY'
            $text | Should -Not -Match 'push-wiki\.ps1' -Because "$name writes the plan; applying and pushing belong to the implement skill"
            $text | Should -Not -Match 'safe to `/clear`' -Because "the old mid-workflow clear point made fresh sessions repeat finished phases"
        }
    }

    It "Implement skill names no researcher and no web tool" {
        $text = & $script:ReadSkill 'hoi4-inex-namelist-implement'
        $text | Should -Not -Match 'inex-(historical|audit)-researcher' -Because "a cheaper model follows what it reads; research must not be on the page"
        $text | Should -Not -Match 'WebSearch|WebFetch|-InspectVanilla'
        $text | Should -Match '## Edit batch'
        $text | Should -Match 'IN PROGRESS'
    }

    It "Authoring template and audit skeleton share the hand-off sections" {
        $template = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot 'docs\superpowers\plans\TEMPLATE-namelist.md'), [System.Text.Encoding]::UTF8)
        $build = [System.IO.File]::ReadAllText((Join-Path $script:RepoRoot 'build.ps1'), [System.Text.Encoding]::UTF8)
        $template | Should -Match '(?m)^Status: PLANNING\r?$'
        foreach ($h in 'For the implementer', 'Author confirmation', 'Kept on judgment', 'Implementation steps', 'Docs payload', 'Stop conditions', 'Review', 'Outcome', 'Edit batch') {
            $template | Should -Match "(?m)^## $h" -Because "TEMPLATE-namelist.md needs the '$h' section"
            $build | Should -Match "'## $h" -Because "New-AuditPlanText needs the '$h' section"
        }
        $headings = @([regex]::Matches($template, '(?m)^## (.+?)\r?$') | ForEach-Object { $_.Groups[1].Value })
        $headings[-1] | Should -Be 'Edit batch' -Because "the implementer reads the plan only up to this heading"
        $template | Should -Match '(?m)^```json batch\r?$'
    }
}


