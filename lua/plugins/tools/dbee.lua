---@type LazyPluginSpec
return {
  "kndndrj/nvim-dbee",
  enabled = false,
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "Dbee",
  build = function() require("plugins.tools.dbee").install() end,
  opts = {},
  keys = { { "<leader>od", "<cmd>Dbee<cr>", desc = "Open Dbee" } },
}
