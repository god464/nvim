return {
  "L3MON4D3/LuaSnip",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = { "rafamadriz/friendly-snippets" },
  keys = { { "<C-l>", function() require("luasnip").expand() end, mode = "i" }, { "<Tab>", mode = "x" } },
  build = "make install_jsregexp",
  opts = {
    store_selection_keys = "<Tab>",
    update_events = { "TextChanged", "TextChangedI" },
    history = true,
    delete_check_events = "TextChanged",
  },
  config = function(_, opts)
    require("luasnip").setup(opts)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
