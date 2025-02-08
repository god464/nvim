return {
  "NMAC427/guess-indent.nvim",
  event = "FileType",
  config = function()
    require("guess-indent").setup({})

    vim.api.nvim_create_autocmd({ "InsertLeave" }, { desc = "Guess Indent", command = "GuessIndent" })
  end,
}
