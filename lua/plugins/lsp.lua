return {
  {
    "neovim/nvim-lspconfig",
    event = "FileType",
    opts = function()
      return {
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                hint = {
                  enable = true,
                  paramType = true,
                  setType = true,
                },
                completion = {
                  callSnippet = "Both",
                  keywordSnippet = "Both",
                },
                codeLens = { enable = true },
              },
            },
          },
          clangd = {},
          cmake = {},
        },
      }
    end,
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig.ui.windows").default_options.border = "rounded"
      vim.lsp.inlay_hint.enable(true)
      for server, config in pairs(opts.servers) do
        lspconfig[server].setup(vim.tbl_extend("force", {
          capabilities = capabilities,
        }, config))
      end
      vim.lsp.codelens.refresh()
    end,
  },
  {
    "folke/lazydev.nvim",
    dependencies = {
      "Bilal2453/luvit-meta",
    },
    ft = "lua",
    opts = {
      library = {
        {
          path = "luvit-meta/library",
          words = { "vim%.uv" },
        },
        {
          path = "lazy.nvim",
          words = { "LazyPluginSpec" },
        },
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    opts = {
      inlay_hints = {
        inline = true,
      },
      memory_usage = {
        border = "rounded",
      },
      symbol_info = {
        border = "rounded",
      },
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    ft = { "c", "cpp", "cmake" },
    opts = {},
  },
  {
    "mrcjkb/rustaceanvim",
    lazy = false,
    dependencies = { "nvim/nvim-lspconfig" },
    ft = "rust",
  },
}
