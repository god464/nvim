---@type LazyPluginSpec
return {
  "kndndrj/nvim-dbee",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "Dbee",
  build = function() require("dbee").install() end,
  opts = {},
  keys = { { "<leader>od", "<cmd>Dbee<cr>", desc = "Open Dbee" } },
}
