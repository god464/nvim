---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    preset = "modern",
    win = { border = "rounded" },
    spec = {
      { "<leader><leader>", group = "search" },
      { "<leader>R", group = "task" },
      { "<leader>o", group = "toggle" },
      { "<leader>d", group = "debug" },
      { "<leader>T", group = "test" },
      { "<leader>r", group = "refactor" },
      { "<leader>u", group = "edgy" },
      { "<leader>a", group = "sidekick" },
      { "<leader>l", group = "lsp" },
      { "<leader>H", group = "kulala" },
    },
  },
  keys = {
    {
      "<leader>?",
      function() require("which-key").show({ global = false }) end,
      desc = "Buffer Keymaps (which-key)",
    },
  },
}
