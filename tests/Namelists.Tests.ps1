<#
.SYNOPSIS
    Pester unit and invariant tests for Hearts of Iron IV division namelist files.
#>

BeforeAll {
    $script:RepoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
    $script:NamelistDir = Join-Path $script:RepoRoot "common\units\names_divisions"

    $script:ValidSubunitTokens = @(
        'infantry', 'cavalry', 'motorized', 'mechanized', 'marine', 'mountaineers', 'paratrooper',
        'light_armor', 'medium_armor', 'heavy_armor', 'super_heavy_armor', 'modern_armor',
        'amphibious_armor', 'amphibious_mechanized', 'artillery', 'anti_air', 'anti_tank',
        'rocket_artillery', 'motorized_rocket_artillery', 'irregular_infantry', 'militia',
        'camelry', 'ranger_battalion', 'penal_battalion'
    )

    $script:NamelistFiles = Get-ChildItem -Path $script:NamelistDir -Filter "INEX_*.txt"
}

Describe "Division Namelist Files: Global Invariants" {
    It "Should find namelist files in common/units/names_divisions" {
        $script:NamelistFiles.Count | Should -BeGreaterThan 0
    }

    It "All root group tags across all files must be globally unique" {
        $allGroups = @{}
        $duplicates = [System.Collections.Generic.List[string]]::new()

        foreach ($file in $script:NamelistFiles) {
            $lines = [System.IO.File]::ReadAllLines($file.FullName, [System.Text.Encoding]::UTF8)
            $depth = 0
            for ($i = 0; $i -lt $lines.Length; $i++) {
                $clean = ($lines[$i] -replace '#.*$', '').Trim()
                if ([string]::IsNullOrWhiteSpace($clean)) { continue }

                if ($depth -eq 0) {
                    $m = [regex]::Match($clean, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
                    if ($m.Success -and $clean -notmatch '^(ordered|division_types|for_countries|can_use|link_numbering_with)\b') {
                        $gtag = $m.Groups[1].Value
                        if ($allGroups.ContainsKey($gtag)) {
                            $duplicates.Add("Duplicate '$gtag' in $($file.Name) (first defined in $($allGroups[$gtag]))")
                        } else {
                            $allGroups[$gtag] = $file.Name
                        }
                    }
                }

                $openB = ([regex]::Matches($clean, '\{')).Count
                $closeB = ([regex]::Matches($clean, '\}')).Count
                $depth += ($openB - $closeB)
            }
        }

        $duplicates | Should -BeNullOrEmpty
    }
}

Describe "Division Namelist Files: Per-File Invariants" {
    BeforeAll {
        $files = Get-ChildItem -Path (Join-Path (Resolve-Path (Join-Path $PSScriptRoot "..")) "common\units\names_divisions") -Filter "INEX_*.txt"
    }

    Context "File: <_.Name>" -ForEach (Get-ChildItem -Path (Join-Path (Resolve-Path (Join-Path $PSScriptRoot "..")) "common\units\names_divisions") -Filter "INEX_*.txt") {
        BeforeAll {
            $script:CurrentFile = $_
            $script:RawBytes = [System.IO.File]::ReadAllBytes($script:CurrentFile.FullName)
            $script:FileText = [System.IO.File]::ReadAllText($script:CurrentFile.FullName, [System.Text.Encoding]::UTF8)
            $script:CleanText = ($script:FileText -replace '(?m)#.*$', '')
        }

        It "Must be saved as UTF-8 without BOM" {
            $hasBom = ($script:RawBytes.Length -ge 3 -and $script:RawBytes[0] -eq 0xEF -and $script:RawBytes[1] -eq 0xBB -and $script:RawBytes[2] -eq 0xBF)
            $hasBom | Should -BeFalse
        }

        It "Must have strictly balanced curly braces" {
            $openB = ([regex]::Matches($script:CleanText, '\{')).Count
            $closeB = ([regex]::Matches($script:CleanText, '\}')).Count
            $openB | Should -Be $closeB
        }

        It "Must have balanced double quotes" {
            $quoteCount = ([regex]::Matches($script:CleanText, '"')).Count
            ($quoteCount % 2) | Should -Be 0
        }

        It "Must not contain empty ordered blocks" {
            $emptyOrdered = [regex]::Matches($script:CleanText, 'ordered\s*=\s*\{\s*\}')
            $emptyOrdered.Count | Should -Be 0
        }

        It "All integer keys in ordered blocks must be unique within their group" {
            $orderedBlocks = [regex]::Matches($script:CleanText, 'ordered\s*=\s*\{(?<content>(?:[^{}]*|\{[^{}]*\})*)\}')
            foreach ($ob in $orderedBlocks) {
                $block = $ob.Groups['content'].Value
                $keys = [regex]::Matches($block, '(?m)^\s*(\d+)\s*=') | ForEach-Object { $_.Groups[1].Value }
                $duplicateKeys = $keys | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name }
                $duplicateKeys | Should -BeNullOrEmpty
            }
        }

        It "Every fallback_name must include an ordinal placeholder (%d or %s)" {
            $fallbacks = [regex]::Matches($script:CleanText, 'fallback_name\s*=\s*"([^"]+)"')
            foreach ($fb in $fallbacks) {
                $name = $fb.Groups[1].Value
                $name | Should -Match '(%d|%s)'
            }
        }

        It "All tokens in division_types must be recognized line combat subunits" {
            $typeBlocks = [regex]::Matches($script:CleanText, 'division_types\s*=\s*\{([^}]*)\}')
            foreach ($tb in $typeBlocks) {
                $tokens = [regex]::Matches($tb.Groups[1].Value, '"([^"]+)"') | ForEach-Object { $_.Groups[1].Value }
                foreach ($token in $tokens) {
                    $script:ValidSubunitTokens -contains $token | Should -BeTrue -Because "'$token' must be an approved line combat subunit"
                }
            }
        }

        It "link_numbering_with must not be self-referential" {
            $lines = [System.IO.File]::ReadAllLines($script:CurrentFile.FullName, [System.Text.Encoding]::UTF8)
            $currentGroup = $null
            $depth = 0
            for ($i = 0; $i -lt $lines.Length; $i++) {
                $clean = ($lines[$i] -replace '#.*$', '').Trim()
                if ([string]::IsNullOrWhiteSpace($clean)) { continue }

                if ($depth -eq 0) {
                    $gm = [regex]::Match($clean, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
                    if ($gm.Success -and $clean -notmatch '^(ordered|division_types|for_countries|can_use|link_numbering_with)\b') {
                        $currentGroup = $gm.Groups[1].Value
                    }
                }

                $lm = [regex]::Match($clean, 'link_numbering_with\s*=\s*\{([^}]*)\}')
                if ($lm.Success) {
                    $targets = [regex]::Matches($lm.Groups[1].Value, '([A-Za-z0-9_]+)') | ForEach-Object { $_.Groups[1].Value }
                    foreach ($target in $targets) {
                        $target | Should -Not -Be $currentGroup -Because "group '$currentGroup' cannot link to itself"
                    }
                }

                $depth += (([regex]::Matches($clean, '\{')).Count - ([regex]::Matches($clean, '\}')).Count)
            }
        }

        It "All root group tags must follow the <TAG>_<CATEGORY>_<NUMBER> naming convention" {
            $lines = [System.IO.File]::ReadAllLines($script:CurrentFile.FullName, [System.Text.Encoding]::UTF8)
            $depth = 0
            for ($i = 0; $i -lt $lines.Length; $i++) {
                $clean = ($lines[$i] -replace '#.*$', '').Trim()
                if ([string]::IsNullOrWhiteSpace($clean)) { continue }

                if ($depth -eq 0) {
                    $gm = [regex]::Match($clean, '^([A-Za-z][A-Za-z0-9_]*)\s*=\s*\{?')
                    if ($gm.Success -and $clean -notmatch '^(ordered|division_types|for_countries|can_use|link_numbering_with)\b') {
                        $tag = $gm.Groups[1].Value
                        $tag | Should -Match '^[A-Z0-9]{3}_[A-Z0-9_]+$' -Because "group tag '$tag' in $($script:CurrentFile.Name) should match standard pattern"
                    }
                }

                $depth += (([regex]::Matches($clean, '\{')).Count - ([regex]::Matches($clean, '\}')).Count)
            }
        }
    }
}
