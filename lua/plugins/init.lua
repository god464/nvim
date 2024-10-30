local M = {
  "lsp",
  "cmp",
  "motion",
  "telescope",
  "treesitter",
  "ui",
  "tools",
  "term",
  "quickfix",
  "test",
  "dap",
  "task",
  "git",
}

M = vim.tbl_map(function(name) return { import = "plugins." .. name } end, M)

return M
