---@type vim.diff.Opts
vim.diagnostic.config({
  virtual_lines = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚",
      [vim.diagnostic.severity.WARN] = "󰀪",
      [vim.diagnostic.severity.INFO] = "󰋽",
      [vim.diagnostic.severity.HINT] = "󰌶",
    },
  },
  underline = true,
  update_in_insert = false,
  float = { severity_sort = true, source = "if_many" },
  severity_sort = true,
})

vim.lsp.inlay_hint.enable()

if vim.lsp.document_highlight then vim.lsp.document_highlight.enable() end

vim.lsp.buf.signature_help()

local tmp = vim.lsp.util.open_floating_preview

function vim.lsp.util.open_floating_preview(contents, syntax, opts)
  opts = opts or {}
  opts.border = opts.border or "rounded"
  return tmp(contents, syntax, opts)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    vim.api.nvim_create_autocmd(
      { "BufEnter", "CursorHold", "InsertLeave" },
      { buffer = bufnr, callback = function() vim.lsp.codelens.refresh() end }
    )

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Type definition" })
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Implementation" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "List references" })
    vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
    vim.keymap.set("n", "<leader>li", vim.lsp.buf.incoming_calls, { buffer = bufnr, desc = "Incoming calls" })
    vim.keymap.set("n", "<leader>lo", vim.lsp.buf.outgoing_calls, { buffer = bufnr, desc = "Outgoing calls" })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code code_action" })
  end,
})
