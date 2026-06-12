---@type LazyPluginSpec
return {
  "saghen/blink.pairs",
  version = "*",
  dependencies = "saghen/blink.lib",
  event = "VeryLazy",
  build = function() require("blink.pairs").download():pwait(60000) end,
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
