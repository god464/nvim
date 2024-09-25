return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "stevearc/dressing.nvim" },
    cmd = "Telescope",
    opts = {},
    keys = {
      { "<Leader><space>f", "<cmd>Telescope find_files<CR>", desc = "Search File" },
      { "<Leader><space>r", "<cmd>Telescope live_grep<CR>", desc = "Grep string" },
      { "<Leader><space>b", "<cmd>Telescope file_browser<CR>", desc = "File browser" },
    },
  },
}
