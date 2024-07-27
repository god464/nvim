return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function() require("telescope").load_extension("fzf") end,
      },
    },
    cmd = "Telescope",
    event = "VeryLazy",
    opts = {
      pickers = {
        find_files = {
          theme = "ivy",
        },
        oldfiles = {
          theme = "ivy",
        },
        jumplist = {
          theme = "dropdown",
        },
      },
    },
  },
}
