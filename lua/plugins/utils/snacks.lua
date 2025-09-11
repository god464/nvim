---@type LazyPluginSpec
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  ---@module "snacks"
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    words = { enabled = true },
    statuscolumn = { enabled = true },
    scroll = { enabled = true },
    input = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
  },
}
