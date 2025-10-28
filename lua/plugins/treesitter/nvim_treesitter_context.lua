---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "UIEnter",
  opts = { max_lines = 5, mode = "topline" },
  keys = { { "<leader>tc", "<Cmd>TSContext toggle<CR>", desc = "Treesitter Context" } },
}
