---@type LazyPluginSpec
return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = "HiPhish/rainbow-delimiters.nvim",
  event = "VeryLazy",
  main = "ibl",
  opts = function()
    local hooks = require("ibl.hooks")

    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    return {
      indent = { char = "│", tab_char = "│" },
      scope = { show_start = false, show_end = false },
      exclude = { filetypes = { "help", "trouble", "Trouble", "lazy", "toggleterm", "notify", "alpha", "mason" } },
    }
  end,
}
