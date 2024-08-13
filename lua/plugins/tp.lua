return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    cmd = "Telescope",
    event = "UIEnter",
    opts = {},
    keys = {
      { "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Search File" },
      { "<Leader>fr", "<cmd>Telescope live_grep<CR>", desc = "Grep String" },
      { "<Leader>fg", "<cmd>Telescope git_status<CR>", desc = "Git status" },
    },
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    build = "make",
    event = "VeryLazy",
    config = function() require("telescope").load_extension("fzf") end,
  },
}
