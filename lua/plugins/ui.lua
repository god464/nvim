return {
  {
    "catppuccin/nvim",
    dependencies = {
      "lukas-reineke/indent-blankline.nvim",
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
    dependencies = "HiPhish/rainbow-delimiters.nvim",
    main = "ibl",
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
      local ws_hightlight = { "CursorColumn", "Whitespace" }

      local hooks = require("ibl.hooks")
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)
      vim.g.rainbow_delimiters = { highlight = highlight }
      if vim.fn.expand("%:p") ~= "" then vim.cmd.edit({ bang = true }) end
      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

      return {
        scope = { highlight = highlight },
        whitespace = { highlight = ws_hightlight },
        exclude = { filetypes = { "help", "NvimTree", "trouble", "Trouble", "lazy", "mason", "notify" } },
      }
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
  {
    "lewis6991/gitsigns.nvim",
    dependencies = "petertriho/nvim-scrollbar",
    event = "UIEnter",
    opts = { word_diff = true, attach_to_untracked = true, current_line_blame = true },
    config = function(opts)
      require("gitsigns").setup(opts)
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
}
