return {
  {
    "stevearc/conform.nvim",
    event = "LspAttach",
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
      format_on_save = {
        timeout_ms = 100,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "LspAttach",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        lua = { "selene" },
        c = { "clangtidy" },
        cpp = { "clangtidy" },
      }
    end,
  },
}
