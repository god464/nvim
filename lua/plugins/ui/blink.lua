---@type LazyPluginSpec
return {
  "saghen/blink.indent",
  event = "LazyFile",
  ---@module 'blink.indent'
  ---@type blink.indent.Config
  opts = {
    static = { char = "│" },
    scope = {
      char = "│",
      highlights = {
        "BlinkIndentOrange",
        "BlinkIndentViolet",
        "BlinkIndentBlue",
        "BlinkIndentRed",
        "BlinkIndentCyan",
        "BlinkIndentYellow",
        "BlinkIndentGreen",
      },
    },
  },
}
