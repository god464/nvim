local M = {
  "ai",
  "cmp",
  "dap",
  "file",
  "finder",
  "git",
  "lsp",
  "motion",
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
