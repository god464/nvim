---@type LazyPluginSpec
return {
  "tpope/vim-fugitive",
  cmd = "Git",
  keys = { { "<leader>og", mode = "n", "<cmd>Git<cr>", desc = "Open fugitive" } },
}
