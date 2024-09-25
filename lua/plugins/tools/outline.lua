return {
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline" },
    keys = { { "<leader>ol", "<Cmd>Outline<CR>", desc = "Outline" } },
    opts = { preview_window = { live = true }, symbols = { icon_source = "lspkind" } },
  },
}
