---@type LazyPluginSpec
return {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  event = "UIEnter",
  opts = {
    transparent_background = true,
    float = { transparent = true },
    auto_integrations = true,
    term_color = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
  specs = {
    {
      "akinsho/bufferline.nvim",
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin") then
          opts.highlights = require("catppuccin.groups.integrations.bufferline").get_theme()
        end
      end,
    },
  },
}
