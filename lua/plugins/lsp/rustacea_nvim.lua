return {
  "mrcjkb/rustaceanvim",
  dependencies = { "neovim/nvim-lspconfig" },
  ft = { "rust" },
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true, loadOutDirsFromCheck = true, buildScripts = { enable = true } },
          checkOnSave = true,
          procMarco = { enable = true },
        },
      },
    },
  },
  config = function(opts) vim.g.rustaceanvim = opts end,
}
