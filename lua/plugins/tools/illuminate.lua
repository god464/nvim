---@type LazyPluginSpec
return {
  "RRethy/vim-illuminate",
  enabled = false,
  event = "VeryLazy",
  opts = { filetypes_denylist = { "xxd", "floggraph" } },
  keys = {
    { "]r", function() require("illuminate").goto_next_reference() end, desc = "Next reference" },
    { "[r", function() require("illuminate").goto_prev_reference() end, desc = "Prev reference" },
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
