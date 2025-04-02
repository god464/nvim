---@type LazyPluginSpec
return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  build = ":MasonUpdate",
  opts = { ui = { border = "rounded" } },
  keys = { { "<Leader>M", "<Cmd>Mason<CR>", desc = "Mason" } },
}
