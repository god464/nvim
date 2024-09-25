return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
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
}
