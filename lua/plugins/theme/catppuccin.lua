---@type LazyPluginSpec
return {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  event = "UIEnter",
  opts = {
    transparent_background = true,
    float = { transparent = true },
    auto_integrations = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
}
