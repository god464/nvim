return {
  "RRethy/vim-illuminate",
  event = "VeryLazy",
  opts = { filetypes_denylist = { "xxd", "floggraph" } },
  keys = {
    { "]]", function() require("illuminate").goto_next_reference() end, desc = "Next reference" },
    { "[[", function() require("illuminate").goto_prev_reference() end, desc = "Prev reference" },
  },
  config = function(_, opts) require("illuminate").configure(opts) end,
}
