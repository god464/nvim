---@type LazyPluginSpec
return {
  "stevearc/aerial.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  cmd = "AerialToggle",
  keys = { { "<leader>ol", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial" } },
  opts = {
    layout = { default_direction = "prefer_left", placement = "edge" },
    highlight_on_hover = true,
    close_on_select = true,
    filter_kind = false,
    manage_folds = true,
    show_guides = true,
    autojump = true,
    nav = { autojump = true, preview = true },
    lsp = { diagnostics_trigger_update = true },
  },
}
