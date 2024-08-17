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
                hint = { enable = true, paramType = true, setType = true },
                completion = { callSnippet = "Both", keywordSnippet = "Both" },
                codeLens = { enable = true },
              },
            },
          },
          clangd = {},
          cmake = {},
          jsonls = {
            settings = { json = { schemas = require("schemastore").json.schemas(), validate = { enable = true } } },
          },
        },
      }
    end,
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local capabilities = require("perset.capabilities")
      vim.lsp.inlay_hint.enable(true)
      for server, config in pairs(opts.servers) do
        lspconfig[server].setup(vim.tbl_extend("force", { capabilities = capabilities }, config))
      end
      vim.lsp.codelens.refresh()
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
    dependencies = { "nvim/nvim-lspconfig" },
    lazy = false,
    ft = "rust",
  },
  { "b0o/SchemaStore.nvim", ft = { "json", "yaml" } },
}
