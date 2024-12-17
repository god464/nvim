return {
  "mfussenegger/nvim-lint",
  event = "LspAttach",
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
