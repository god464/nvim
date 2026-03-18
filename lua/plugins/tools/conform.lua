local web_formatters = { "prettier", "dprint", "biome", "biome-organize-imports", "oxfmt" }
local markdown_formatters = vim.list_extend({ unpack(web_formatters) }, { "injected" })

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
      yaml = web_formatters,
      json = web_formatters,
      toml = { "tombi", "taplo" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      sh = { "shfmt" },
      markdown = markdown_formatters,
      html = web_formatters,
      css = web_formatters,
      javascript = web_formatters,
      typescript = web_formatters,
      tex = { "latexindent" },
      sql = { "sqruff" },
      typst = { "typstyle" },
      java = { "google-java-format" },
      fish = { "fish_indent" },
      vue = web_formatters,
      astro = web_formatters,
      terraform = { "terraform_fmt" },
      go = { "golines", "gofrumpt", "goimports-reviser" },
      haskell = { "ormolu" },
      nix = { "nixfmt" },
      ["_"] = { "trim_whitespace" },
    },
    format_on_save = {},
  },
}
