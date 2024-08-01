return {
  {
    "williamboman/mason.nvim",
    keys = {
      { "<leader>M", "<Cmd>Mason<CR>", desc = "Exec Mason" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "williamboman/mason.nvim",
    },
    event = "LspAttach",
    opts = {
      automatic_installation = true,
    },
  },
}
