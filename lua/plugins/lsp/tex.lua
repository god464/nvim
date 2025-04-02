---@type LazyPluginSpec
return {
  "lervag/vimtex",
  ft = "tex",
  config = function() vim.g.vimtex_view_general_viewer = "okular" end,
}
