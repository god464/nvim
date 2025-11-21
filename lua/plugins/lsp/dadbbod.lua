---@type LazyPluginSpec
return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = { "tpope/vim-dadbod", "kristijanhusak/vim-dadbod-completion" },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },

  keys = { { "<leader>oD", mode = "n", "<cmd>DBUI<cr>", desc = "Open DBUI" } },
  init = function() vim.g.db_ui_use_nerd_fonts = 1 end,
}
