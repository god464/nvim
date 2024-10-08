return {
  "nvim-lualine/lualine.nvim",
  event = "UIEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = { extensions = { "lazy", "nvim-tree", "trouble", "mason", "quickfix" } },
}
