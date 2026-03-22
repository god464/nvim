local cc_linters = { "clangtidy", "cppcheck" }
local web_linters = { "eslint", "oxlint" }
local asm_linters = { "verilator" }

---@type LazyPluginSpec
return {
  "mfussenegger/nvim-lint",
  event = "LazyFile",
  opts = {
    c = cc_linters,
    cpp = cc_linters,
    cmake = { "cmakelint" },
    rust = { "clippy" },
    lua = { "selene", "luacheck" },
    yaml = { "yamllint", "actionlint" },
    python = { "ruff", "bandit" },
    sh = { "shellcheck", "dotenv_linter" },
    nix = { "statix", "deadnix" },
    markdown = { "markdownlint", "rumdl" },
    dockerfile = { "hadolint" },
    javascript = web_linters,
    typescript = web_linters,
    html = { "htmlhint" },
    css = { "stylelint" },
    tex = { "chktex" },
    sql = { "sqruff" },
    java = { "checkstyle" },
    fish = { "fish" },
    terraform = { "tflint" },
    ansible = { "ansible_lint" },
    haskell = { "hlint" },
    verilog = asm_linters,
    systemverilog = asm_linters,
    go = { "golangcilint" },
    toml = { "tombi" },
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
