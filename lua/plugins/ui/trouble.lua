---@type LazyPluginSpec
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  opts = { auto_close = true, auto_jump = true, force = true },
  keys = {
    { "<leader>oTq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>oTp", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>oTP", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>oTl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
  },
}
