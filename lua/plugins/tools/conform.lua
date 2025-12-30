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
      yaml = { "prettier", "dprint", "biome", "biome-organize-imports", "oxfmt" },
      json = { "prettier", "dprint", "biome", "biome-organize-imports", "oxfmt" },
      toml = { "taplo", "dprint", stop_after_first = true },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      sh = { "shfmt" },
      makrdown = {
        "prettier",
        "dprint",
        "biome",
        "biome-organize-imports",
        "injected",
      },
      html = { "prettier", "dprint", "biome", "biome-organize-imports", "oxfmt" },
      css = { "prettier", "dprint", "biome", "biome-organize-imports" },
      javascript = { "prettier", "dprint", "biome", "biome-organize-imports", "oxfmt" },
      typescript = { "prettier", "dprint", "biome", "biome-organize-imports", "oxfmt" },
      tex = { "latexindent" },
      sql = { "sqruff" },
      typst = { "typstyle" },
      java = { "google-java-format" },
      fish = { "fish_indent" },
      vue = { "prettier", "dprint", "biome", "biome-organize-imports", "oxfmt" },
      astro = { "prettier", "dprint", "biome", "biome-organize-imports", "oxfmt" },
      terraform = { "terraform_fmt" },
      go = { "golines", "gofrumpt", "goimports-reviser" },
      haskell = { "ormolu" },
    },
    format_on_save = {},
  },
}
