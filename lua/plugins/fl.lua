return {
  {
    "stevearc/conform.nvim",
    event = "FileType",
    opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      format_on_save = {
        timeout_ms = 100,
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "FileType",
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
