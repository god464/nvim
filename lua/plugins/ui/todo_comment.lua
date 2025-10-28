---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  cmd = "TodoFzfLua",
  event = "UIEnter",
  dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
  opts = {},
}
