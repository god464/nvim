return {
  "mfussenegger/nvim-lint",
  event = "BufWritePre",
  opts = {
    c = { "clangtidy", "cppcheck" },
    cpp = { "clangtidy", "cppcheck" },
    cmake = { "cmakelint" },
    rust = { "clippy" },
    lua = { "selene", "luacheck" },
    yaml = { "yamllint", "actionlint" },
    python = { "ruff", "mypy", "pylint" },
    sh = { "shellCheck", "dotenv_linter" },
    nix = { "statix", "deadnix" },
    markdown = { "markdownlint" },
    docerfile = { "hadolint" },
    javascript = { "oxlint", "deno", "eslint" },
    typescript = { "oxlint", "deno", "eslint" },
    html = { "htmlhint" },
    css = { "stylelint" },
    tex = { "chktex" },
  },
  config = function(_, opts)
    local lint = require("lint")
    lint.linters_by_ft = opts

    vim.api.nvim_create_autocmd(
      { "BufReadPost", "BufWritePost", "InsertLeave" },
      { desc = "Lint", callback = function() lint.try_lint() end }
    )
  end,
}
