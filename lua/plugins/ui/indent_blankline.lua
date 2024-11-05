return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = function()
    local highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    }
    local ws_hightlight = { "CursorColumn", "Whitespace" }

    vim.g.rainbow_delimiters = {
      highlight = highlight,
      query = {
        latex = "rainbow-blocks",
        lua = "rainbow-blocks",
        query = "rainbow-blocks",
        verilog = "rainbow-blocks",
      },
    }

    if vim.fn.expand("%:p") ~= "" then vim.cmd.edit({ bang = true }) end

    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    return {
      scope = { highlight = highlight },
      whitespace = { highlight = ws_hightlight },
      exclude = { filetypes = { "help", "neo-tree", "trouble", "Trouble", "lazy", "toggleterm", "notify" } },
    }
  end,
}
