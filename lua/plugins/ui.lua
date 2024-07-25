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
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = {
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = {
          "help",
          "lazy",
        },
      },
    },
    config = function() require("ibl").setup() end,
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
  },
}
