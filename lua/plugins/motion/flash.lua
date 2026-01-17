---@type LazyPluginSpec
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@module 'Flash'
  ---@type Flash.Config
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
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
  },
}
