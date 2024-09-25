return {
  {
    "danymat/neogen",
    opts = { snippet_engine = "luasnip" },
    keys = {
      {
        "<leader>gf",
        function() require("neogen").generate({ type = "func" }) end,
        desc = "Generate function annotation",
      },
      {
        "<leader>gc",
        function() require("neogen").generate({ type = "class" }) end,
        desc = "Generate class annotation",
      },
      { "<leader>gt", function() require("neogen").generate({ type = "type" }) end, desc = "Generate type annotation" },
      { "<leader>gp", function() require("neogen").generate({ type = "file" }) end, desc = "Generate file annotation" },
    },
  },
}
