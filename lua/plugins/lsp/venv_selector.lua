---@type LazyPluginSpec
return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "mfussenegger/nvim-dap",
    "mfussenegger/nvim-dap-python",
    "ibhagwan/fzf-lua",
  },
  cmd = "VenvSelect",
  branch = "regexp",
  opts = { settings = { options = { notify_user_on_venv_activation = true } } },
  keys = { { "<Leader>v", "<cmd>VenvSelect<cr>", desc = "Select Virtual Environment", ft = "python" } },
}
