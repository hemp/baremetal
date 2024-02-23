lvim.plugins = {
  {
    "ggandor/leap.nvim",
    name = "leap",
    config = function()
      require("leap").add_default_mappings()
    end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_bw_enable = 1
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_hide_gitignore = 1
      vim.g.rnvimr_pick_enable = 1
    end,
  },
}

vim.opt.wrap = true
