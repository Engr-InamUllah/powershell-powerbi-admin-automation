BeforeAll { $script = Join-Path $PSScriptRoot '../scripts/Get-PowerBIInventory.ps1' }
Describe 'Power BI inventory script' {
 It 'parses as valid PowerShell' { $errors=$null;[System.Management.Automation.Language.Parser]::ParseFile($script,[ref]$null,[ref]$errors)|Out-Null;$errors.Count|Should -Be 0 }
 It 'does not contain a literal bearer token' { (Get-Content $script -Raw)|Should -Not -Match 'eyJ[a-zA-Z0-9_-]+' }
}