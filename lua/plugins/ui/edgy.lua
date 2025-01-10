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
        filter = function(win) return vim.api.nvim_win_get_config(win).relative == "" end,
      },
      "Trouble",
      { ft = "qf", title = "QuickFix" },
      {
        ft = "help",
        size = { height = 20 },
        -- only show help buffers
        filter = function(buf) return vim.bo[buf].buftype == "help" end,
      },
    },
    left = {
      {
        title = function()
          local buf_name = vim.api.nvim_buf_get_name(0) or "[No Name]"
          return vim.fn.fnamemodify(buf_name, ":t")
        end,
        ft = "trouble",
        pinned = true,
        size = { width = 20 },
        open = "Trouble symbols toggle",
      },
    },
  },
}
