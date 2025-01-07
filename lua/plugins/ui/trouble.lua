return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  keys = {
    { "<leader>oq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
    { "<leader>op", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>ol", "<cmd>Trouble symbols toggle focus=fals<cr>", desc = "Symbols (Trouble)" },
    {
      "<leader>oL",
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      desc = "LSP Definitions / references / ... (Trouble)",
    },
  },
  opts = { auto_close = true, auto_jump = true, force = true, modes = { symbols = { win = { position = "left" } } } },
}
