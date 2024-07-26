return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstallFromGrammar" },
    opts = {
      hightlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      auto_install = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    -- TODO Adding more options
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    opts = {},
  },
  {
    "Wansmer/treesj",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    event = "VeryLazy",
    keys = {
      {
        "gJ",
        function() require("treesj").join() end,
        desc = "Join lines",
      },
      {
        "gS",
        function() require("treesj").split() end,
        desc = "Split lines",
      },
    },
    opts = {
      use_default_keymaps = false,
    },
  },
}
