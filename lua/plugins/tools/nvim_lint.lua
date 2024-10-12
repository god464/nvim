return {
  "mfussenegger/nvim-lint",
  event = "LspAttach",
  opts = {
    c = { "clangtidy" },
    cpp = { "clangtidy" },
    rust = { "clippy" },
    lua = { "selene" },
    yaml = { "yamllint" },
    python = { "ruff", "mypy", "pylint" },
    sh = { "shellCheck" },
    nix = { "statix", "deadnix" },
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
