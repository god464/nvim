---@type LazyPluginSpec
---@module 'trouble'
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  keys = {
    { "<leader>oq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>op", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
  },
  ---@type trouble.Config
  opts = { auto_close = true, auto_jump = true, force = true },
}
