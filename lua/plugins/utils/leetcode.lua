---@type LazyPluginSpec
return {
  "kawre/leetcode.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  enabled = false,
  cmd = "Leet",
  opts = { lang = "rust", cn = { enabled = false, translator = true, translate_problems = true } },
}
