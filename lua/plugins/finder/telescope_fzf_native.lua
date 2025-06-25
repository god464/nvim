---@type LazyPluginSpec
return {
  "nvim-telescope/telescope-fzf-native.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  enabled = false,
  build = "make",
  event = "VeryLazy",
  config = function() require("telescope").load_extension("fzf") end,
}
