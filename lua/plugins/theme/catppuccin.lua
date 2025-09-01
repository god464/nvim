---@type LazyPluginSpec
return {
  "catppuccin/nvim",
  name = "catppuccin.nvim",
  event = "UIEnter",
  opts = {
    integrations = {
      fidget = true,
      grug_far = true,
      mason = true,
      neotest = true,
      diffview = true,
      noice = true,
      notify = true,
      nvim_surround = true,
      overseer = true,
      snacks = { enable = true },
      lsp_trouble = true,
      dadbod_ui = true,
      which_key = true,
      navic = { enabled = true },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)

    vim.cmd.colorscheme("catppuccin")
  end,
}
