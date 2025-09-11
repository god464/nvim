---@type LazyPluginSpec
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  keys = {
    { "<leader>oq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>op", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
  },
  ---@module 'trouble'
  ---@type trouble.Config
  opts = { auto_close = true, auto_jump = true, force = true },
}
