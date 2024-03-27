local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Twilight (base16)'

-- https://github.com/romkatv/powerlevel10k/blob/master/README.md#meslo-nerd-font-patched-for-powerlevel10k
config.font = wezterm.font('MesloLGS NF')

return config
