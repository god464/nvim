return {
  "supermaven-inc/supermaven-nvim",
  enabled = false,
  event = { "InsertEnter", "LspAttach" },
  opts = { keymaps = { accept_suggestion = "<C-a>", clear_suggestion = "<C-j>" } },
}
