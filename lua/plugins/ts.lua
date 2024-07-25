return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstallFromGrammar" },
    opts = {
      hightlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      auto_install = true,
    },
  },
}
