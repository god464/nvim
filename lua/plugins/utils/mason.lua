return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = "Mason Update",
  opts = { ui = { border = "rounded" } },
  keys = { { "<Leader>M", "<Cmd>Mason<CR>", desc = "Mason" } },
}
