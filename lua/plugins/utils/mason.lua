return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonUpdate"},
  build = "MasonUpdate",
  opts = { ui = { border = "rounded" } },
  keys = { { "<Leader>M", "<Cmd>Mason<CR>", desc = "Mason" } },
}
