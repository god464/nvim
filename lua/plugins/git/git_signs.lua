---@type LazyPluginSpec
return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "petertriho/nvim-scrollbar", "folke/snacks.nvim" },
  event = "UIEnter",
  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "▎" },
    },
    signs_staged = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
    },
    attach_to_untracked = true,
    linehl = false,
    current_line_blame = true,
    preview_config = { border = "rounded" },
  },
  on_attach = function(_, opts)
    require("gitsigns").setup(opts)
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
