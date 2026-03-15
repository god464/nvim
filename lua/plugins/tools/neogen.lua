---@type LazyPluginSpec
return {
  "danymat/neogen",
  opts = { snippet_engine = "nvim" },
  keys = { { "<leader>cg", function() require("neogen").generate() end, desc = "Generate annotation" } },
}
