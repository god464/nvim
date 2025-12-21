---@type LazyPluginSpec
return {
  "saghen/blink.pairs",
  event = "UIEnter",
  build = require("lib").build_blink_plugin(),
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
