---@type LazyPluginSpec
return {
  "folke/lazydev.nvim",
  enabled = false,
  ft = "lua",
  ---@module 'lazydev'
  ---@type lazydev.Config
  opts = { library = { { path = "${3rd}/luv/library", words = { "vim%.uv" } }, "lazy.nvim" } },
}
