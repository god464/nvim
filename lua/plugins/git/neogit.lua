---@type LazyPluginSpec
return {
  "NeogitOrg/neogit",
  dependencies = { "esmuellert/codediff.nvim", "m00qek/baleia.nvim", "ibhagwan/fzf-lua" },
  cmd = "Neogit",
  opts = { graph_style = "kitty", integrations = { diffview = true, fzf_lua = true } },
  keys = { { "<leader>og", "<Cmd>Neogit<CR>", desc = "Open Neogit" } },
}
