return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    event = "UIEnter",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstallFromGrammar" },
    opts = {
      hightlight = { enable = true, additional_vim_regex_highlighting = false },
      incremental_selection = { enable = true },
      indent = { enable = true },
      textobjects = { enable = true },
      auto_install = true,
    },
  },
  --[[ {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    opts = { select = { lookahead = true, include_surrounding_whitespace = true }, move = { set_jumps = true } },
    config = function(opts) require("nvim-treesitter.configs").setup(opts) end,
  }, ]]
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "gJ", function() require("treesj").join() end, desc = "Join lines" },
      { "gS", function() require("treesj").split() end, desc = "Split lines" },
    },
    opts = { use_default_keymaps = false },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmds = "TSContextToggle",
    opts = { mode = "topline" },
    keys = { { "<leader>tc", "<Cmd>TSContextToggle<CR>", desc = "Treesitter Context" } },
  },
}
