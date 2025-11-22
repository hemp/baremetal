local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Tomorrow Night Bright'

-- https://github.com/romkatv/powerlevel10k/blob/master/README.md#meslo-nerd-font-patched-for-powerlevel10k
config.font = wezterm.font('MesloLGM Nerd Font')

return config
