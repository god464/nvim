return {
  "mrcjkb/rustaceanvim",
  dependencies = "neovim/nvim-lspconfig",
  ft = "rust",
  opts = {
    server = {
      default_settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true, loadOutDirsFromCheck = true, buildScripts = { enable = true } },
          procMarco = { enable = true },
        },
      },
    },
    dap = {
      type = "server",
      port = "${port}",
      host = "127.0.0.1",
      executable = {
        command = "codelldb",
        args = { "--port", "${port}", "--settings", vim.json.encode({ showDisassembly = "never" }) },
      },
    },
  },
  config = function(_, opts) vim.g.rustaceanvim = opts end,
}
