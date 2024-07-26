return {
  {
    "folke/tokyonight.nvim",
    event = "VeryLazy",
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function() vim.cmd([[colorscheme tokyonight-storm]]) end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
    },
    main = "ibl",
    opts = {},
  },
}
