return {
  "EdenEast/nightfox.nvim",
  enabled = false,
  event = "UIEnter",
  opts = {},
  config = function(_, opts)
    require("nightfox").setup(opts)
    vim.cmd([[colorscheme nightfox]])
  end,
}
