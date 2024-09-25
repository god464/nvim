return {

  {
    "folke/tokyonight.nvim",
    event = "UIEnter",
    opts = { style = storm },
    config = function(opts)
      require("tokyonight").setup(opts)
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
}
