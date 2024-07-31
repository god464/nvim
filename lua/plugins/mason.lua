return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {},
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
    opts = {
      automatic_installation = true,
    },
  },
}
