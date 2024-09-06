local function on_supports_method(method, fn)
  return vim.api.nvim_create_autocmd("User", {
    pattern = "LspSupportsMethod",
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      local buffer = args.data.buffer ---@type number
      if client and method == args.data.method then return fn(client, buffer) end
    end,
  })
end

on_supports_method("textDocument/inlayHint", function(buffer)
  if
    vim.api.nvim_buf_is_valid(buffer)
    and vim.bo[buffer].buftype == ""
    and not vim.tbl_contains(vim.bo[buffer].filetype)
  then
    vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
  end
end)

vim.diagnostic.config({
  virtual_text = { spacing = 4, prefix = "●", severity = vim.diagnostic.severity.ERROR },
  float = { severity_sort = true, source = "if_many" },
  severity_sort = true,
})

on_supports_method("textDocument/codeLens", function(client, buffer)
  vim.lsp.codelens.refresh()
  vim.api.nvim_create_autocmd(
    { "BufEnter", "CursorHold", "InsertLeave" },
    { buffer = buffer, callback = vim.lsp.codelens.refresh }
  )
end)
