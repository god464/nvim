return {
  {
    "williamboman/mason.nvim",
    keys = { { "<leader>M", "<Cmd>Mason<CR>", desc = "Exec Mason" } },
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "neovim/nvim-lspconfig", "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = { automatic_installation = true },
  },
}
