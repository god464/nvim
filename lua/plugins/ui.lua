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
      { "<leader>q", function() require("trouble").toggle("quickfix") end, desc = "Quickfix" },
      { "<leader>p", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    },
    opts = { auto_close = true, auto_jump = true },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "UIEnter",
    opts = {},
    keys = { { "<Leader>op", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" } },
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
    event = "UIEnter",
  },
}
