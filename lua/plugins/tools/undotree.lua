---@type LazyPluginSpec
return {
  "jiaoshijie/undotree",
  name = "undotree.nvim",
  opts = {},
  keys = {
    { "<leader>ou", function() require("undotree").toggle() end, "Open Undo Tree" },
  },
}
