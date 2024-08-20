return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstallFromGrammar" },
    opts = {
      hightlight = { enable = true, additional_vim_regex_highlighting = false },
      indent = { enable = true },
      auto_install = true,
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    opts = { select = { lookahead = true, include_surrounding_whitespace = true }, move = { set_jumps = true } },
    -- TODO Adding more options
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    keys = {
      { "gJ", function() require("treesj").join() end, desc = "Join lines" },
      { "gS", function() require("treesj").split() end, desc = "Split lines" },
    },
    opts = { use_default_keymaps = false },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = { mode = "topline" },
    keys = { { "<leader>tc", "<Cmd>TSContextToggle<CR>", desc = "Treesitter Context" } },
  },
}
