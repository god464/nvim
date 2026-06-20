---@type LazyPluginSpec
return {
  "saghen/blink.pairs",
  version = "*",
  dependencies = "saghen/blink.lib",
  build = function() require("blink.pairs").download():pwait(60000) end,
  event = "VeryLazy",
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
