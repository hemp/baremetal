Write-Host "win11: enable chezmoi"

winget upgrade --all --include-unknown --accept-source-agreements --accept-package-agreements

winget install --exact --id git.git
winget install --exact --id twpayne.chezmoi
