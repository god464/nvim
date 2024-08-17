return {
  {
    "catppuccin/nvim",
    event = "UIEnter",
    name = "catppuccin",
    opts = {
      term_colors = true,
      integrations = {
        mini = { indentscope_color = "lavender" },
        mason = true,
        noice = true,
        nvim_surround = true,
        lsp_trouble = true,
        which_key = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "echasnovski/mini.indentscope",
    event = "VeryLazy",
    opts = {
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lazy", "trouble", "notify", "NvimTree", "mason", "help" },
        callback = function() vim.b.miniindentscope_disable = true end,
      })
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "folke/trouble.nvim" },
    event = "VeryLazy",
    opts = {},
  },
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    event = "VeryLazy",
    keys = {
      { "<leader>Q", function() require("trouble").toggle("quickfix") end, desc = "Quickfix" },
      { "<leader>P", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    },
    opts = { auto_close = true, auto_jump = true },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "VeryLazy",
    opts = {},
    keys = { { "<Leader>op", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" } },
  },
  {
    "stevearc/dressing.nvim",
    lazy = false,
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { extensions = { "lazy", "nvim-tree", "trouble", "mason", "quickfix" } },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "UIEnter",
    opts = {
      options = {
        mode = "tabs",
        hover = {
          enabled = true,
          delay = 0,
          reveal = { "close" },
        },
        show_close_icon = false,
        buffer_close_icon = "",
        sort_by = "tabs",
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count) return "(" .. count .. ")" end,
        show_duplicate_prefix = false,
        always_show_bufferline = false,
      },
    },
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
  },
}
