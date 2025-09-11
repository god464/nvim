---@type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    default_format_opts = { timeout_ms = 500, lsp_format = "fallback" },
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      cmake = { "cmake_format" },
      rust = { "rustfmt" },
      yaml = { "prettier", "dprint", stop_after_first = true },
      json = { "prettier", "dprint", stop_after_first = true },
      toml = { "taplo", "dprint", stop_after_first = true },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      sh = { "shfmt" },
      makrdown = { "prettier", "dprint", stop_after_first = true },
      html = { "prettier", "dprint", stop_after_first = true },
      css = { "prettier", "dprint", stop_after_first = true },
      javascript = { "prettier", "dprint", stop_after_first = true },
      typescript = { "prettier", "dprint", stop_after_first = true },
      tex = { "latexindent" },
      sql = { "sqlfluff" },
      typst = { "typstyle" },
      java = { "google-java-format" },
      fish = { "fish_indent" },
      vue = { "prettier", "dprint", stop_after_first = true },
      astro = { "prettier", "dprint", stop_after_first = true },
      terraform = { "terraform_fmt" },
      go = { "golines" },
      haskell = { "ormolu" },
    },
    format_on_save = {},
  },
}
