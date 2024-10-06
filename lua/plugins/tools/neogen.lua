return {
  {
    "danymat/neogen",
    opts = { snippet_engine = "luasnip" },
    keys = { { "<leader>g", function() require("neogen").generate() end, desc = "Generate annotation" } },
  },
}
