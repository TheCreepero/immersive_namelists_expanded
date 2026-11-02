@{
    Deny  = @(
        @{ Name = 'Edit of a namelist file'; Tool = 'Edit'; ToolInput = @{ file_path = 'common\units\names_divisions\zz_INEX_TST_names_divisions.txt' }; Reason = 'EditNames' }
        @{ Name = 'Write of a namelist file by relative path'; Tool = 'Write'; ToolInput = @{ file_path = 'common/units/names_divisions/zz_INEX_NEW_names_divisions.txt' }; Reason = 'EditNames' }
        @{ Name = 'Write of the synced build engine'; Tool = 'Write'; ToolInput = @{ file_path = 'tools\HoiModBuild.ps1' }; Reason = 'synced from the Modding Manager' }
        @{ Name = 'Edit of the synced knowledge tests'; Tool = 'Edit'; ToolInput = @{ file_path = 'tests\Knowledge.Tests.ps1' }; Reason = 'synced from the Modding Manager' }
        @{ Name = 'Edit of the synced engine tests'; Tool = 'MultiEdit'; ToolInput = @{ file_path = 'tests\BuildEngine.Tests.ps1' }; Reason = 'synced from the Modding Manager' }
        @{ Name = 'Edit of the synced test runner'; Tool = 'Edit'; ToolInput = @{ file_path = 'tests\Run-Tests.ps1' }; Reason = 'synced from the Modding Manager' }
        @{ Name = 'Edit of the synced CI workflow'; Tool = 'Edit'; ToolInput = @{ file_path = '.github\workflows\ci.yml' }; Reason = 'synced from the Modding Manager' }
        @{ Name = 'Edit of an Antigravity skill mirror'; Tool = 'Edit'; ToolInput = @{ file_path = '.agents\skills\hoi4-inex-release\SKILL.md' }; Reason = 'SyncMirrors' }
        @{ Name = 'Set-Content on a namelist file'; Tool = 'PowerShell'; ToolInput = @{ command = 'Set-Content -Path common\units\names_divisions\zz_INEX_TST_names_divisions.txt -Value $text' }; Reason = 'shell write' }
        @{ Name = 'sed -i on a namelist file'; Tool = 'Bash'; ToolInput = @{ command = 'sed -i ''s/Old/New/'' common/units/names_divisions/zz_INEX_TST_names_divisions.txt' }; Reason = 'shell write' }
        @{ Name = 'a redirect into the namelist folder'; Tool = 'Bash'; ToolInput = @{ command = 'cat scratch/new.txt > common/units/names_divisions/zz_INEX_TST_names_divisions.txt' }; Reason = 'shell write' }
        @{ Name = 'WriteAllText on a namelist file'; Tool = 'PowerShell'; ToolInput = @{ command = '[System.IO.File]::WriteAllText("$root\common\units\names_divisions\zz_INEX_TST_names_divisions.txt", $text)' }; Reason = 'shell write' }
        @{ Name = 'a Copy-Item into the namelist folder after a harmless command'; Tool = 'PowerShell'; ToolInput = @{ command = 'git status; Copy-Item scratch\x.txt common\units\names_divisions\zz_INEX_TST_names_divisions.txt' }; Reason = 'shell write' }
        @{ Name = 'a Remove-Item of a namelist file by its absolute path'; Tool = 'PowerShell'; ToolInput = @{ command = 'Remove-Item "<repo>\common\units\names_divisions\zz_INEX_TST_names_divisions.txt"' }; Reason = 'shell write' }
    )
    Allow = @(
        @{ Name = 'Edit of a plan'; Tool = 'Edit'; ToolInput = @{ file_path = 'docs\plans\2026-10-25-testland-audit.md' } }
        @{ Name = 'Edit of a Claude Code skill'; Tool = 'Edit'; ToolInput = @{ file_path = '.claude\skills\hoi4-inex-release\SKILL.md' } }
        @{ Name = 'Edit of the mod''s own tests'; Tool = 'Edit'; ToolInput = @{ file_path = 'tests\Documentation.Tests.ps1' } }
        @{ Name = 'Write into scratch'; Tool = 'Write'; ToolInput = @{ file_path = 'scratch\tst_dossier.md' } }
        @{ Name = 'a namelist path outside the repository'; Tool = 'Edit'; ToolInput = @{ file_path = 'C:\elsewhere\common\units\names_divisions\zz_INEX_TST_names_divisions.txt' } }
        @{ Name = 'the -EditNames batch command'; Tool = 'PowerShell'; ToolInput = @{ command = 'powershell -File .\build.ps1 -EditNames TST -Batch docs\plans\2026-10-25-testland-audit.md -DryRun' } }
        @{ Name = 'a read of the namelist folder'; Tool = 'Bash'; ToolInput = @{ command = 'git status --short -- common/units/names_divisions 2>$null' } }
        @{ Name = 'the -Audit command'; Tool = 'PowerShell'; ToolInput = @{ command = 'powershell -File .\build.ps1 -Audit TST -NamesOnly' } }
        @{ Name = 'a Read of a namelist file'; Tool = 'Read'; ToolInput = @{ file_path = 'common\units\names_divisions\zz_INEX_TST_names_divisions.txt' } }
        @{ Name = 'git mv of a plan beside git add of a namelist file'; Tool = 'PowerShell'; ToolInput = @{ command = 'git mv docs/plans/a.md docs/plans/archive/; git add common/units/names_divisions/zz_INEX_TST_names_divisions.txt' } }
        @{ Name = 'git add of a namelist file'; Tool = 'Bash'; ToolInput = @{ command = 'git add -- common/units/names_divisions/zz_INEX_TST_names_divisions.txt' } }
        @{ Name = 'a Remove-Item in a rehearsal export outside the repository'; Tool = 'PowerShell'; ToolInput = @{ command = 'Remove-Item C:\Users\x\scratchpad\rehearsal\common\units\names_divisions\zz_INEX_HUN_names_divisions.txt' } }
        @{ Name = 'an rm in a rehearsal export outside the repository, Git Bash path'; Tool = 'Bash'; ToolInput = @{ command = 'rm -f "/c/Users/x/scratchpad/rehearsal/common/units/names_divisions/zz_INEX_HUN_names_divisions.txt"' } }
    )
}
