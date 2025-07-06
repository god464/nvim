---@type LazyPluginSpec
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    extensions = {
      "lazy",
      "trouble",
      "mason",
      "quickfix",
      "overseer",
      "fzf",
      "toggleterm",
      "nvim-dap-ui",
      "symbols-outline",
    },
  },
}
