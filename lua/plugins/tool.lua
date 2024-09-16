return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
      default_format_opts = { timeout_ms = 500, lsp_format = "fallback" },
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        cmake = { "cmake_format" },
        rust = { "rustfmt" },
        nix = { "nixfmt" },
        yaml = { "yamlfmt" },
        toml = { "taplo" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
      },
      format_on_save = { timeout_ms = 100 },
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "LspAttach",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        c = { "clangtidy" },
        cpp = { "clangtidy" },
        rust = { "clippy" },
        lua = { "selene" },
        yaml = { "yamllint" },
        python = { "ruff" },
      }
    end,
  },
  {
    "folke/which-key.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
    "kevinhwang91/nvim-ufo",
    event = "VeryLazy",
    dependencies = "kevinhwang91/promise-async",
    opts = { close_fold_kinds_for_ft = { default = { "imports" } } },
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline" },
    keys = { { "<leader>ol", "<Cmd>Outline<CR>", desc = "Outline" } },
    opts = { preview_window = { live = true }, symbols = { icon_source = "lspkind" } },
  },
  {
    "danymat/neogen",
    opts = { snippet_engine = "luasnip" },
    keys = {
      {
        "<leader>gf",
        function() require("neogen").generate({ type = "func" }) end,
        desc = "Generate function annotation",
      },
      {
        "<leader>gc",
        function() require("neogen").generate({ type = "class" }) end,
        desc = "Generate class annotation",
      },
      { "<leader>gt", function() require("neogen").generate({ type = "type" }) end, desc = "Generate type annotation" },
      { "<leader>gp", function() require("neogen").generate({ type = "file" }) end, desc = "Generate file annotation" },
    },
  },
}
