return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "stevearc/dressing.nvim", { "b0o/SchemaStore.nvim", ft = { "json", "yaml" } } },
    event = "FileType",
    opts = function()
      return {
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                diagnostics = { workspaceEvent = "OnChange" },
                hint = { enable = true, setType = true },
                completion = { callSnippet = "Both", keywordSnippet = "Both", displayContext = 5 },
                codeLens = { enable = true },
              },
            },
          },
          clangd = {},
          jsonls = {
            settings = { json = { schemas = require("schemastore").json.schemas(), validate = { enable = true } } },
          },
          yamlls = {
            settings = {
              yaml = {
                schemas = require("schemastore").yaml.schemas(),
                validate = { enable = true },
                yamlVersion = 1.2,
                format = { enable = true },
                hover = true,
                completion = true,
              },
              redhat = { telemetry = { enabled = false } },
            },
          },
          nixd = {},
          taplo = {},
          basedpyright = {},
          neocmake = {},
          bashls = {},
        },
      }
    end,
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("preset.capabilities")

      for server, config in pairs(opts.servers) do
        lspconfig[server].setup(vim.tbl_extend("force", { capabilities = capabilities }, config))
      end
    end,
  },
  {
    "folke/lazydev.nvim",
    dependencies = { "Bilal2453/luvit-meta" },
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
        { path = "lazy.nvim", words = { "LazyPluginSpec" } },
      },
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    opts = { inlay_hints = { inline = true } },
  },
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    ft = { "c", "cpp", "cmake" },
    opts = {},
  },
  {
    "mrcjkb/rustaceanvim",
    dependencies = { "neovim/nvim-lspconfig" },
    ft = "rust",
    opts = {},
  },
  {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    opts = {},
  },
}
