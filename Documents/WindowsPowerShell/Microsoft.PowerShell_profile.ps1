oh-my-posh init pwsh | Invoke-Expression

function ll {
    eza --long $args
}
function lt {
    eza --tree $args
}
function la {
    eza --all $args
}

Set-Alias -Name cat -Value bat -Option AllScope
Set-Alias -Name find -Value fd -Option AllScope
Set-Alias -Name grep -Value rg -Option AllScope
Set-Alias -Name ls -Value eza -Option AllScope
