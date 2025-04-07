local M = {
  "cmp",
  "file",
  "finder",
  "git",
  "lsp",
  "motion",
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
