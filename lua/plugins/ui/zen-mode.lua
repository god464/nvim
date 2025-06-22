---@type LazyPluginSpec
return {
  "folke/zen-mode.nvim",
  dependencies = "folke/twilight.nvim",
  cmd = "ZenMode",
  opts = { kitty = true },
  keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Enter Zen Mode" } },
}
