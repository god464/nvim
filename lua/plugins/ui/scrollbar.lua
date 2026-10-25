---@type LazyPluginSpec
return {
  "petertriho/nvim-scrollbar",
  branch = "refactor/v2",
  dependencies = "lewis6991/gitsigns.nvim",
  opts = { providers = { gitsigns = true } },
}
