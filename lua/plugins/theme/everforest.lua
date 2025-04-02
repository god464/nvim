---@type LazyPluginSpec
return {
  "neanias/everforest-nvim",
  event = "UIEnter",
  opts = {
    background = "hard",
    transparent_background_level = 2,
    italics = true,
    ui_contrast = "high",
    spell_foreground = true,
    diagnostic_text_highlight = true,
    diagnostic_line_highlight = true,
  },
  config = function(_, opts)
    require("everforest").setup(opts)
    vim.cmd([[colorscheme everforest]])
  end,
}
