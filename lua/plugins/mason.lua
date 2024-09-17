return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason" },
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
        handlers = {
          function(server) lspconfig[server].setup({ capabilities = capabilities }) end,
          neocmake = function()
            lspconfig.neocmake.setup({
              capabilities = capabilities,
            })
          end,
          basedpyright = function()
            lspconfig.basedpyright.setup({
              capabilities = capabilities,
            })
          end,
        },
      }
    end,
  },
}
