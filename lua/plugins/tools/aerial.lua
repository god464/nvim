return {
  "stevearc/aerial.nvim",
  enabled = false,
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  cmd = "AerialToggle",
  keys = { { "<leader>ol", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" } },
  opts = {
    layout = { default_direction = "prefer_left" },
    highlight_on_hover = true,
    filter_kind = false,
    close_on_select = true,
    manage_folds = true,
    show_guides = true,
    autojump = true,
    nav = { autojump = true, preview = true },
    lsp = { diagnostics_trigger_update = true },
  },
}
