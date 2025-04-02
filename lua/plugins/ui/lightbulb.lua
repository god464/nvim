---@type LazyPluginSpec
return {
  "kosayoda/nvim-lightbulb",
  event = "VeryLazy",
  opts = { autocmd = { enabled = true }, code_lenses = true },
}
