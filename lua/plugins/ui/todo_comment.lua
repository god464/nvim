---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  cmd = "TodoFzfLua",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
  opts = {},
}
