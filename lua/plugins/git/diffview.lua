---@type LazyPluginSpec
return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    enhanced_diff_hl = true,
    file_panel = {
      win_config = { width = math.floor(vim.go.columns * 0.2) > 25 and math.floor(vim.go.columns * 0.2) or 25 },
    },
  },
}
