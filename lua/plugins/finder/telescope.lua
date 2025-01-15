return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "folke/snacks.nvim" },
  enabled = false,
  cmd = "Telescope",
  opts = {},
  keys = {
    { "<Leader><Leader>f", "<cmd>Telescope find_files<CR>", desc = "Search File" },
    { "<Leader><Leader>g", "<cmd>Telescope git_files<CR>", desc = "Search Git File" },
    { "<Leader><Leader>B", "<cmd>Telescope buffer<CR>", desc = "Search Buffer" },
    { "<Leader><Leader>k", "<cmd>Telescope keymaps<CR>", desc = "Search Keymaps" },
    { "<Leader><Leader>d", "<cmd>Telescope diagnostics<CR>", desc = "Search Diagnostics" },
    { "<Leader><Leader>t", "<cmd>TodoTelescope<CR>", desc = "Search TODO" },
    { "<Leader><Leader>r", "<cmd>Telescope live_grep<CR>", desc = "Grep string" },
    { "<Leader><Leader>b", "<cmd>Telescope file_browser<CR>", desc = "File browser" },
  },
}
