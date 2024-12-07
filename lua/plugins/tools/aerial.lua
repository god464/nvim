return {
  "stevearc/aerial.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  cmd = "AerialToggle",
  keys = { { "<leader>ol", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" } },
  opts = {
    layout = { default_direction = "prefer_left" },
    highlight_on_hover = true,
    filter_kind = false,
    close_on_select = true,
    nav = { autojump = true, preview = true },
    lsp = { diagnostics_trigger_update = true },
  },
}
