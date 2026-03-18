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
      { "<leader>t", group = "test" },
      { "<leader>r", group = "refactor" },
      { "<leader>u", group = "edgy" },
      { "<leader>a", group = "sidekick" },
      { "<leader>l", group = "lsp" },
      { "<leader>c", group = "code" },
      { "<leader>h", group = "http" },
      { "<leader>x", group = "diagnostics" },
      { "<leader>ot", group = "REPL" },
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
