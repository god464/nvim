return {
  "stevearc/oil.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = "Oil",
  keys = { { "<Leader>o-", "<cmd>Oil<cr>", desc = "Oil" } },
  opts = {
    columns = { "permissions", "size", "icon", "mtime" },
    win_options = { signcolumn = "yes" },
    skip_confirm_for_simple_edits = true,
    cleanup_delay_ms = false,
    float = { border = "rounded" },
    preview = { border = "rounded" },
    progress = { border = "rounded" },
    keymaps = { ["l"] = "actions.select", ["h"] = "actions.parent" },
  },
}
