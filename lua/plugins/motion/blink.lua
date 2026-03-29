---@type LazyPluginSpec
return {
  "saghen/blink.pairs",
  event = "VeryLazy",
  build = function() return require("lib").build_blink_plugin() end,
  ---@module 'blink.pairs'
  ---@type blink.pairs.Config
  opts = {
    highlights = {
      groups = {
        "BlinkPairsRed",
        "BlinkPairsYellow",
        "BlinkPairsBlue",
        "BlinkPairsOrange",
        "BlinkPairsGreen",
        "BlinkPairsPurple",
        "BlinkPairsCyan",
      },
    },
  },
}
