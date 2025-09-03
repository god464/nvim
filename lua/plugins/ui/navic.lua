---@type LazyPluginSpec
return {
  "SmiteshP/nvim-navic",
  event = "LspAttach",
  opts = {
    lsp = { auto_attach = true },
    lazy_update_context = true,
    hightlight = true,
  },
}
