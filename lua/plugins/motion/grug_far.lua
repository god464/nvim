---@type LazyPluginSpec
return {
  "MagicDuck/grug-far.nvim",
  enabled = false,
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = { headerMaxWidth = 80 },
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")

        grug.open({ transient = true, prefills = { filesFilter = ext and ext ~= "" and "*." .. ext or nil } })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace",
    },
  },
}
