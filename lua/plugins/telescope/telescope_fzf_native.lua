return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
    event = "VeryLazy",
    config = function() require("telescope").load_extension("fzf") end,
  },
}
