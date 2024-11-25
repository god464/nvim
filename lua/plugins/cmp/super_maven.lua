return {
  "supermaven-inc/supermaven-nvim",
  event = { "InsertEnter", "LspAttach" },
  opts = {
    keymaps = {
      accept_suggestion = "<C-a>",
      clear_suggestion = "<C-j>",
    },
  },
}
