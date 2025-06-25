---@type LazyPluginSpec
return {
  "folke/tokyonight.nvim",
  enabled = false,
  event = "UIEnter",
  opts = { style = "storm" },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd([[colorscheme tokyonight]])
  end,
}
