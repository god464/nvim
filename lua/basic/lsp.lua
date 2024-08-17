vim.lsp.inlay_hint.enable()
vim.diagnostic.config({
  virtual_text = {
    spacing = 4,
    prefix = "●",
    severity = vim.diagnostic.severity.ERROR,
  },
  float = {
    severity_sort = true,
    source = "if_many",
  },
  severity_sort = true,
})
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "General LSP Attach",
  callback = function(args)
    local bufnr = args.buf
    vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      buffer = bufnr,
      callback = function() vim.lsp.codelens.refresh() end,
    })
  end,
})
