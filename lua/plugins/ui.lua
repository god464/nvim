return {
  {
    "folke/tokyonight.nvim",
    event = "UIEnter",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function() vim.cmd([[colorscheme tokyonight]]) end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    dependencies = {
      "HiPhish/rainbow-delimiters.nvim",
    },
    main = "ibl",
    opts = {
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    event = "VeryLazy",
    keys = {
      {
        "<leader>q",
        function() require("trouble").toggle("quickfix") end,
        desc = "Quickfix",
      },
      {
        "<leader>p",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
    },
    opts = {
      auto_close = true,
      auto_jump = true,
    },
  },
}
