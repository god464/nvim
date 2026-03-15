---@type LazyPluginSpec
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  ---@module 'trouble'
  ---@type trouble.Config
  opts = { auto_close = true, auto_jump = true, force = true },
  keys = {
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>xD", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
  },
}
