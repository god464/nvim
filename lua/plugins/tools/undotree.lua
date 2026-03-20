---@type LazyPluginSpec
return {
  "jiaoshijie/undotree",
  name = "undotree.nvim",
  opts = {},
  keys = { { "<leader>ou", function() require("undotree").toggle() end, desc = "Open Undo Tree" } },
}
