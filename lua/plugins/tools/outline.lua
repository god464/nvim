return {
  "hedyhli/outline.nvim",
  enabled = true,
  dependencies = "onsails/lspkind.nvim",
  cmd = "Outline",
  keys = { { "<leader>ol", "<Cmd>Outline<CR>", desc = "Outline" } },
  opts = {
    outline_window = { position = "left" },
    preview_window = { live = true, border = "rounded" },
    symbols = { icon_source = "lspkind" },
  },
}
