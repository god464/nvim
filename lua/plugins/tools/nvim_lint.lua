return {
  {
    "mfussenegger/nvim-lint",
    event = "LspAttach",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        c = { "clangtidy" },
        cpp = { "clangtidy" },
        rust = { "clippy" },
        lua = { "selene" },
        yaml = { "yamllint" },
        python = { "ruff" },
        sh = { "shellCheck" },
        nix = { "statix_check", "deadnix" },
      }
    end,
  },
}
