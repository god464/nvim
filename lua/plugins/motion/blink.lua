---@type LazyPluginSpec
return {
  "saghen/blink.pairs",
  event = "VeryLazy",
  version = "*",
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
