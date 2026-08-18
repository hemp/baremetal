# @see darwin / linux: .chezmoiscripts/run_chrome_profile.sh.tmpl

$ErrorActionPreference = "Stop"

Write-Output "chrome-profile:"

$PolicySource = Join-Path $HOME ".config\chrome\policies.json"
$Policies = Get-Content -Raw -Path $PolicySource | ConvertFrom-Json
$PolicyRoots = @(
    "HKLM:\Software\Policies\Google\Chrome",
    "HKLM:\Software\Policies\Chromium"
)

function Set-ChromePolicy {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Root,

        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        $Value
    )

    Remove-ItemProperty -Path $Root -Name $Name -ErrorAction SilentlyContinue
    Remove-Item -Path (Join-Path $Root $Name) -Recurse -Force -ErrorAction SilentlyContinue

    if ($Value -is [bool]) {
        New-ItemProperty -Path $Root -Name $Name -PropertyType DWord -Value ([int]$Value) -Force | Out-Null
        return
    }

    if ($Value -is [byte] -or
        $Value -is [int16] -or
        $Value -is [int32] -or
        $Value -is [int64]) {
        New-ItemProperty -Path $Root -Name $Name -PropertyType DWord -Value ([int]$Value) -Force | Out-Null
        return
    }

    if ($Value -is [string]) {
        New-ItemProperty -Path $Root -Name $Name -PropertyType String -Value $Value -Force | Out-Null
        return
    }

    if ($Value -is [array]) {
        $ListRoot = Join-Path $Root $Name
        New-Item -Path $ListRoot -Force | Out-Null

        for ($Index = 0; $Index -lt $Value.Count; $Index++) {
            New-ItemProperty `
                -Path $ListRoot `
                -Name ($Index + 1).ToString() `
                -PropertyType String `
                -Value ([string]$Value[$Index]) `
                -Force | Out-Null
        }
        return
    }

    $JsonValue = $Value | ConvertTo-Json -Depth 100 -Compress
    New-ItemProperty -Path $Root -Name $Name -PropertyType String -Value $JsonValue -Force | Out-Null
}

foreach ($PolicyRoot in $PolicyRoots) {
    Write-Output "run_chrome_profile from: $PolicySource"
    Write-Output "run_chrome_profile to  : $PolicyRoot"
    New-Item -Path $PolicyRoot -Force | Out-Null

    foreach ($Policy in $Policies.PSObject.Properties) {
        Set-ChromePolicy -Root $PolicyRoot -Name $Policy.Name -Value $Policy.Value
    }
}
