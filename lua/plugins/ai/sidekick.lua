---@type LazyPluginSpec
return {
  "folke/sidekick.nvim",
  dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" }, "folke/snacks.nvim" },
  event = "VeryLazy",
  ---@module 'sidekick'
  ---@type sidekick.Config
  opts = { nes = { enabled = true }, cli = { picker = "fzf-lua", mux = { backend = "tmux", enabled = true } } },
  keys = {
    {
      "<tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
      end,
      expr = true,
      desc = "Goto/Apply Next Edit Suggestion",
    },
    {
      "<c-.>",
      function() require("sidekick.cli").focus() end,
      desc = "Sidekick Switch Focus",
      mode = { "n", "v" },
    },
    {
      "<leader>aa",
      function() require("sidekick.cli").toggle({ focus = true }) end,
      desc = "Sidekick Toggle CLI",
      mode = { "n", "v" },
    },
    {
      "<leader>ag",
      function() require("sidekick.cli").toggle({ name = "gemini", focus = true }) end,
      desc = "Sidekick Gemini Toggle",
      mode = { "n", "v" },
    },
    {
      "<leader>aq",
      function() require("sidekick.cli").toggle({ name = "qwen", focus = true }) end,
      desc = "Sidekick Qwen Toggle",
      mode = { "n", "v" },
    },
    {
      "<leader>ap",
      function() require("sidekick.cli").prompt() end,
      desc = "Sidekick Ask Prompt",
      mode = { "n", "v" },
    },
  },
}
