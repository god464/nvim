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

    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
    end)
    vim.g.rainbow_delimiters = { highlight = highlight }
    if vim.fn.expand("%:p") ~= "" then vim.cmd.edit({ bang = true }) end
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    return {
      scope = { highlight = highlight },
      whitespace = { highlight = ws_hightlight },
      exclude = { filetypes = { "help", "NvimTree", "trouble", "Trouble", "lazy", "mason", "notify" } },
    }
  end,
}
