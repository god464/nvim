return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
      },
      scope = { show_start = false, show_end = false },
      exclude = {
        filetypes = {
          "help",
        },
      },
    },
    main = "ibl",
  },
}
