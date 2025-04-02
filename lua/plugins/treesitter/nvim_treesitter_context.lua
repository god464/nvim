---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = "nvim-treesitter/nvim-treesitter",
  cmds = "TSContextToggle",
  opts = { mode = "topline" },
  keys = { { "<leader>tc", "<Cmd>TSContextToggle<CR>", desc = "Treesitter Context" } },
}
