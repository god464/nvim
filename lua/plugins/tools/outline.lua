---@type LazyPluginSpec
return {
  "hedyhli/outline.nvim",
  dependencies = "onsails/lspkind.nvim",
  cmd = "Outline",
  keys = { { "<leader>ol", "<Cmd>Outline<CR>", desc = "Outline" } },
  opts = {
    outline_window = { position = "left", width = 20 },

    preview_window = { live = true, border = "rounded" },
    symbols = { icon_source = "lspkind" },
  },
}
