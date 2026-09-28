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

