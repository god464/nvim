---@type LazyPluginSpec
return {
  "saghen/blink.pairs",
  event = "LazyFile",
  build = require("lib").build_blink_plugin(),
  ---@module 'blink.pairs'
  ---@type blink.pairs.Config
  opts = {},
}
