return {
  {
    "catppuccin/nvim",
    dependencies = {
      "lukas-reineke/indent-blankline.nvim",
      "williamboman/mason.nvim",
      "folke/which-key.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-tree/nvim-tree.lua",
      "kylechui/nvim-surround",
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "folke/flash.nvim",
    },
    name = "catppuccin",
    opts = {
      term_colors = true,
      integrations = {
        mason = true,
        noice = true,
        notify = true,
        nvim_surround = true,
        lsp_trouble = true,
        which_key = true,
        indent_blankline = { colored_indent_levels = true },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = { "HiPhish/rainbow-delimiters.nvim" },
    opts = function()
      local highlight = {
        "RainbowDelimiterRed",
        "RainbowDelimiterYellow",
        "RainbowDelimiterBlue",
        "RainbowDelimiterOrange",
        "RainbowDelimiterGreen",
        "RainbowDelimiterViolet",
        "RainbowDelimiterCyan",
      }
      return {
        scope = { show_exact_scope = true, highlight = highlight },
        whitespace = { highlight = highlight },
        exclude = { filetypes = { "help", "NvimTree", "trouble", "Trouble", "lazy", "mason", "notify" } },
      }
    end,
    config = function(_, opts)
      local rainbow_delimiters = require("rainbow-delimiters")
      local ibl = require("ibl")
      local hooks = require("ibl.hooks")
      if vim.fn.expand("%:p") ~= "" then vim.cmd.edit({ bang = true }) end
      ibl.setup(opts)
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
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
    cmd = "NvimTreeToggle",
    opts = {
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      renderer = {
        highlight_git = "icon",
        highlight_opened_files = "icon",
        highlight_diagnostics = "icon",
        highlight_modified = "icon",
        highlight_hidden = "icon",
        highlight_bookmarks = "icon",
        highlight_clipboard = "icon",
      },
      actions = { open_file = { quit_on_open = true } },
      update_focused_file = { enable = true, update_root = true },
    },
    keys = { { "<Leader>op", "<cmd>NvimTreeToggle<CR>", desc = "File Explorer" } },
  },
  {
    "stevearc/dressing.nvim",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "UIEnter",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    opts = { options = { theme = "catppuccin" }, extensions = { "lazy", "nvim-tree", "trouble", "mason", "quickfix" } },
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "catppuccin/nvim" },
    event = "UIEnter",
    opts = function()
      return {
        options = {
          hightlights = require("catppuccin.groups.integrations.bufferline").get(),
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
  },
}
