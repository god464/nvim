return {
  "pmizio/typescript-tools.nvim",
  enabled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  ft = { "vue", "ts", "tsx" },
  opts = {
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
    settings = { tsserver_plugins = { "@vue/typescript-plugin" } },
  },
}
