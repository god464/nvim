return {
  "sindrets/diffview.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>odo", "<Cmd>DiffviewOpen<CR>", desc = "Open" },
    { "<leader>odc", "<Cmd>DiffviewClose<CR>", desc = "Close" },
    { "<leader>odh", "<Cmd>DiffviewFileHistory<CR>", desc = "Open History" },
  },
  opts = {
    enhanced_diff_hl = true,
    file_panel = {
      win_config = { width = math.floor(vim.go.columns * 0.2) > 25 and math.floor(vim.go.columns * 0.2) or 25 },
    },
  },
}
