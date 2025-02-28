return {
  "EdenEast/nightfox.nvim",
  enabled = false,
  event = "UIEnter",
  opts = {},
  config = function(opts)
    require("nightfox").setup(opts)
    vim.cmd([[colorscheme nightfox]])
  end,
}
