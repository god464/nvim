---@type LazyPluginSpec
return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" },
  opts = {},
  keys = {
    {
      "<leader>ri",
      function() require("refactoring").refactor("Inline Variable") end,
      mode = { "n", "v" },
      desc = "Inline Variable",
    },
    { "<leader>rb", function() require("refactoring").refactor("Extract Block") end, desc = "Extract Block" },
    {
      "<leader>rf",
      function() require("refactoring").refactor("Extract Block To File") end,
      desc = "Extract Block To File",
    },
    {
      "<leader>rf",
      function() require("refactoring").refactor("Extract Function") end,
      mode = "v",
      desc = "Extract Function",
    },
    {
      "<leader>rF",
      function() require("refactoring").refactor("Extract Function To File") end,
      mode = "v",
      desc = "Extract Function To File",
    },
    {
      "<leader>rx",
      function() require("refactoring").refactor("Extract Variable") end,
      mode = "v",
      desc = "Extract Variable",
    },
  },
}
