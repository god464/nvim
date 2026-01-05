---@type LazyPluginSpec
return {
  "folke/todo-comments.nvim",
  cmd = { "TodoFzfLua", "TodoTrubole" },
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  keys = {
    { "<Leader><Leader>t", "<cmd>TodoFzfLua<CR>", desc = "Search TODO" },
    { "<leader><leader>T", "<cmd>TodoFzfLua keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
    { "<leader>oTt", "<cmd>Trouble todo toggle<cr>", desc = "Todo (sTrouble)" },
    {
      "<leader>oTT",
      "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
      desc = "Todo/Fix/Fixme (Trouble)",
    },
  },
}
