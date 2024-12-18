return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  main = "nvim-treesitter.configs",
  event = "VeryLazy",
  cmd = { "TSUpdateSync", "TSUpdate", "TSInstallFromGrammar", "TSInstall" },
  opts = {
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    incremental_selection = { enable = true },
    indent = { enable = true },
    textobjects = { enable = true },
    auto_install = true,
  },
}
