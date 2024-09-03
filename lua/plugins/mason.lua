return {
  {
    "williamboman/mason.nvim",
    keys = { { "<leader>M", "<Cmd>Mason<CR>", desc = "Exec Mason" } },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    event = "FileType",
    opts = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("preset.capabilities")
      return {
        automatic_installation = true,
        handlers = {
          function(server) lspconfig[server].setup({ capabilities = capabilities }) end,
          neocmake = function() end,
          pylyzer = function()
            lspconfig.pylyzer.setup({
              capabilities = capabilities,
              settings = {
                python = {
                  checkOnType = true,
                  diagnostics = true,
                  inlayHints = true,
                  smartCompletion = true,
                },
              },
            })
          end,
        },
      }
    end,
  },
}
