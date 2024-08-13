return {
  {
    "stevearc/conform.nvim",
    event = "LspAttach",
    opts = {
      default_format_opts = { timeout_ms = 3000 },
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        rust = { "rustfmt", lsp_format = "fallback" },
      },
      format_on_save = { timeout_ms = 100 },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "LspAttach",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = { lua = { "selene" }, c = { "clangtidy" }, cpp = { "clangtidy" }, rust = { "clippy" } }
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", "echasnovski/mini.icons" },
    opts_extend = { "spec" },
    opts = { preset = "modern" },
    keys = {
      {
        "<leader>?",
        function() require("which-key").show({ global = false }) end,
        desc = "Buffer Keymaps (which-key)",
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = { { find = "%d+L, %d+B" }, { find = "; after #%d+" }, { find = "; before #%d+" } },
          },
          view = "notify",
        },
      },
      presets = { bottom_search = true, command_palette = true, long_message_to_split = true },
    },
  },
  {
    "stevearc/resession.nvim",
    event = "VeryLazy",
    opts = { autosave = { enabled = true } },
  },
}
