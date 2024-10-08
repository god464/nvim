return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "UIEnter",
  opts = function()
    return {
      options = {
        mode = "tabs",
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
        show_close_icon = true,
        buffer_close_icon = "",
        sort_by = "tabs",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count) return "(" .. count .. ")" end,
        show_duplicate_prefix = false,
        always_show_bufferline = false,
      },
    }
  end,
  keys = {
    { "<M-1>", "<Cmd>BufferLineGoToBuffer 1<CR>", desc = "Go to tab 1" },
    { "<M-2>", "<Cmd>BufferLineGoToBuffer 2<CR>", desc = "Go to tab 2" },
    { "<M-3>", "<Cmd>BufferLineGoToBuffer 3<CR>", desc = "Go to tab 3" },
    { "<M-4>", "<Cmd>BufferLineGoToBuffer 4<CR>", desc = "Go to tab 4" },
    { "<M-5>", "<Cmd>BufferLineGoToBuffer 5<CR>", desc = "Go to tab 5" },
    { "<M-6>", "<Cmd>BufferLineGoToBuffer 6<CR>", desc = "Go to tab 6" },
    { "<M-7>", "<Cmd>BufferLineGoToBuffer 7<CR>", desc = "Go to tab 7" },
    { "<M-8>", "<Cmd>BufferLineGoToBuffer 8<CR>", desc = "Go to tab 8" },
    { "<M-9>", "<Cmd>BufferLineGoToBuffer 9<CR>", desc = "Go to tab 9" },
    { "<M-S-Left>", "<Cmd>-tabmove<CR>", desc = "Move tab to previous" },
    { "<M-S-Right>", "<Cmd>+tabmove<CR>", desc = "Move tab to next" },
    { "<leader>bk", "<cmd>BufferLinePickClose<CR>", desc = "Close" },
  },
}
