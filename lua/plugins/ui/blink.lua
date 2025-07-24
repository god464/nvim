---@type LazyPluginSpec
---@module 'blink.indent'
return {
  "saghen/blink.indent",
  event = "UIEnter",
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
