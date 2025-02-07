local M = {
  "ai",
  "cmp",
  "dap",
  "finder",
  "git",
  "lsp",
  "motion",
  "picker",
  "quickfix",
  "term",
  "test",
  "theme",
  "tools",
  "treesitter",
  "ui",
  "utils",
}

M = vim.tbl_map(function(name) return { import = "plugins." .. name } end, M)

return M
