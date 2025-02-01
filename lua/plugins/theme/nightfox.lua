return {
  "EdenEast/nightfox.nvim",
  event = "UIEnter",
  opts = {},
  config = function(opts)
    require("nightfox").setup(opts)
    vim.cmd([[colorscheme nightfox]])
  end,
}
