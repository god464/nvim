return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = { "ConformInfo" },
  opts = {
    default_format_opts = { timeout_ms = 500, lsp_format = "fallback" },
    formatters_by_ft = {
      lua = { "stylua" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      cmake = { "cmake_format" },
      rust = { "rustfmt" },
      nix = { "nixfmt" },
      yaml = { "yamlfmt" },
      toml = { "taplo" },
      python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      sh = { "shfmt" },
      makrdown = { "mdformat" },
    },
    format_on_save = { timeout_ms = 100 },
  },
}
