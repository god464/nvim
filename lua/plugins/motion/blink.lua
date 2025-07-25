---@type LazyPluginSpec
---@module 'blink.pairs'
return {
  "saghen/blink.pairs",
  event = "UIEnter",
  build = require("lib").build_plugin(),
  ---@type blink.pairs.Config
  opts = {},
}
