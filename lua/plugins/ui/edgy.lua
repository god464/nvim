---@type LazyPluginSpec
return {
  "folke/edgy.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>ue", function() require("edgy").toggle() end, desc = "Edgy Toggle" },
    { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
  },
  opts = {
    bottom = {
      {
        ft = "toggleterm",
        size = { height = 0.4 },
        filter = function(_, win) return vim.api.nvim_win_get_config(win).relative == "" end,
      },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        filter = function(buf) return vim.bo[buf].buftype == "help" end,
      },
    },
    left = {
      {
        title = "Outline",
        ft = "Outline",
        pinned = true,
        open = "Outline",
      },
    },
    right = {
      {
        ft = "noice",
        size = { height = 0.4 },
        filter = function(_, win) return vim.api.nvim_win_get_config(win).relative == "" end,
      },
    },
  },
}
