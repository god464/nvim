---@type LazyPluginSpec
return {
  "mikavilpas/yazi.nvim",
  enabled = false,
  event = "VeryLazy",
  dependencies = "folke/snacks.nvim",
  init = function() vim.g.loaded_netrwPlugin = 1 end,
  keys = { { "<leader>o-", mode = "n", "<cmd>Yazi<cr>", desc = "Open yazi at the current file" } },
  opts = { open_for_directories = true },
}
