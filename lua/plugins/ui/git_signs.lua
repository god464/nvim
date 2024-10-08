return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "petertriho/nvim-scrollbar", "stevearc/dressing.nvim" },
  event = "UIEnter",
  opts = { word_diff = true, attach_to_untracked = true, current_line_blame = true },
  on_attach = function(opts)
    require("gitsigns").setup(opts)
    require("scrollbar.handlers.gitsigns").setup()
  end,
}
