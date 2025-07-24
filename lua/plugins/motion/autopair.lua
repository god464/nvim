---@type LazyPluginSpec
return {
  "altermo/ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  enabled = false,
  opts = { tabout = { enable = true, map = "<Tab>", cmap = "<Tab>", hopout = true, do_nothing_if_fail = false } },
}
