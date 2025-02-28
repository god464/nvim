return {
  "ellisonleao/gruvbox.nvim",
  event = "UIEnter",
  opts = { contrast = "hard", italic = { operators = true } },
  config = function(opts)
    require("gruvbox").setup(opts)
    vim.cmd([[colorscheme gruvbox]])
  end,
}
