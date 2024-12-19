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
  "utils",
  "tree",
  "ai",
}

M = vim.tbl_map(function(name) return { import = "plugins." .. name } end, M)

return M
