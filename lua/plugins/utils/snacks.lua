---@type LazyPluginSpec
return {
  "folke/snacks.nvim",
  event = "VeryLazy",
  opts = {
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    scroll = { enabled = true },
    input = { enabled = true },
    rename = { enabled = true },
  },
}
