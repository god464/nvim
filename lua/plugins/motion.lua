return {
  {
    "folke/flash.nvim",
    opt = {
      modes = { search = { enabled = true, highlight = { backdrop = true } } },
      treesitter = { highlight = { backdrop = true } },
    },
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
      {
        "S",
        mode = { "n", "o", "x" },
        function() require("flash").treesitter_search() end,
        desc = "Flash Treesitter Search",
      },
    },
  },
  {
    "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = { tabout = { enable = true, map = "<Tab>", cmap = "<Tab>", hopout = true, do_nothing_if_fail = false } },
  },
  {
    "numToStr/Comment.nvim",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
      { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
    },
    opts = {},
  },
  {
    "kylechui/nvim-surround",
    opts = {},
  },
}
