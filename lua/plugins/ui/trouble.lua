return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  keys = {
    { "<leader>Q", function() require("trouble").toggle("quickfix") end, desc = "Quickfix" },
    { "<leader>P", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
  },
  opts = { auto_close = true, auto_jump = true },
}
