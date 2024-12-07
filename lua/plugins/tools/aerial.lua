return {
  "stevearc/aerial.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  cmd = "AerialToggle",
  keys = { { "<leader>ol", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" } },
  opts = {
    layout = {
      default_direction = "prefer_left",
      auto_jump = true,
    },
    filter_kind = false,
  },
}
