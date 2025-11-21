---@type LazyPluginSpec
return {
  "NeogitOrg/neogit",
  dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "ibhagwan/fzf-lua" },
  enabled = false,
  cmd = "Neogit",
  opts = { graph_style = "kitty", integrations = { diffview = true, fzf_lua = true } },
  keys = { { "<leader>og", "<Cmd>Neogit<CR>", desc = "Open Neogit" } },
}
