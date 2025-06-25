---@type LazyPluginSpec
return {
  "ellisonleao/gruvbox.nvim",
  enabled = false,
  event = "UIEnter",
  opts = { contrast = "hard", italic = { operators = true } },
  config = function(_, opts)
    require("gruvbox").setup(opts)
    vim.cmd([[colorscheme gruvbox]])
  end,
}
