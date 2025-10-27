---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  cmd = "TodoFzfLua",
  dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
  event = "LazyFile",
  opts = {},
}
