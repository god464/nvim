return {
  "ellisonleao/gruvbox.nvim",
  enabled = false,
  event = "UIEnter",
  opts = { contrast = "hard" },
  config = function(opts)
    require("gruvbox").setup(opts)
    vim.cmd([[colorscheme gruvbox]])
  end,
}
