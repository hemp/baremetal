Write-Host "win11-shard: core"

# TODO: boxstarter / chocolately with unigetui. See unigetui and ..\chocolately.ubundle

winget install --exact --id 7zip.7zip
winget install --exact --id BurntSushi.ripgrep.MSVC
winget install --exact --id dandavison.delta
winget install --exact --id eza-community.eza
winget install --exact --id JanDeDobbeleer.OhMyPosh --source winget
# TODO: oh-my-posh font install meslo
winget install --exact --id jqlang.jq
winget install --exact --id junegunn.fzf
winget install --exact --id lsd-rs.lsd
winget install --exact --id MartiCliment.UniGetUI --source winget
winget install --exact --id Microsoft.PowerShell
winget install --exact --id Microsoft.PowerToys
winget install --exact --id Microsoft.Sysinternals
winget install --exact --id sharkdp.bat
winget install --exact --id sharkdp.fd
winget install --exact --id voidtools.Everything
winget install --exact --id Mozilla.Firefox
winget install --exact --id PuTTY.PuTTY
winget install --exact --id Rufus.Rufus
winget install --exact --id wez.wezterm
winget install --exact --id WinSCP.WinSCP
