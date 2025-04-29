---@type LazyPluginSpec
return {
  "brenoprata10/nvim-highlight-colors",
  event = "VeryLazy",
  opts = {
    render = "virtual",
    enable_tailwind = true,
    exclude_filetypes = { "Trouble", "alpha", "help", "lazy", "mason", "notify", "toggleterm", "trouble" },
  },
}
