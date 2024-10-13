return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "NvimTreeToggle",
  opts = {
    renderer = {
      highlight_git = "icon",
      highlight_opened_files = "icon",
      highlight_diagnostics = "icon",
      highlight_modified = "icon",
      highlight_hidden = "icon",
      highlight_bookmarks = "icon",
      highlight_clipboard = "icon",
    },
    actions = { open_file = { quit_on_open = true } },
    update_focused_file = { enable = true, update_root = true },
    view = { float = { open_win_config = { border = "rounded" } } },
  },
  keys = { { "<Leader>op", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" } },
}
