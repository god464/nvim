---@type vim.diagnostic.Opts
vim.diagnostic.config({
  virtual_lines = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
  },
  underline = true,
  update_in_insert = false,
  float = { severity_sort = true, source = "if_many" },
  severity_sort = true,
})

vim.lsp.inlay_hint.enable()

if vim.lsp.document_highlight then vim.lsp.document_highlight.enable() end

---@type vim.lsp.util.open_floating_preview.Opts
local preview_opts = {
  border = "rounded",
  title_pos = "center",
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
local map = vim.keymap.set

local function set_lsp_keymaps(bufnr)
  local mappings = {
    { "gd", vim.lsp.buf.definition, "Definition" },
    { "gD", vim.lsp.buf.declaration, "Declaration" },
    { "gI", vim.lsp.buf.implementation, "Implementation" },
    { "gr", vim.lsp.buf.references, "List references" },
    { "gy", vim.lsp.buf.type_definition, "Goto T[y]pe Definition" },
    { "<leader>cr", vim.lsp.buf.rename, "Rename symbol" },
    { "<leader>li", vim.lsp.buf.incoming_calls, "Incoming calls" },
    { "<leader>lo", vim.lsp.buf.outgoing_calls, "Outgoing calls" },
    { "<leader>ca", vim.lsp.buf.code_action, "Code Action" },
  }

  for _, mapping in ipairs(mappings) do
    map("n", mapping[1], mapping[2], { buffer = bufnr, desc = mapping[3] })
  end
end

---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = vim.tbl_deep_extend("keep", opts, preview_opts)
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local bufnr = args.buf

    vim.api.nvim_create_autocmd(
      { "BufEnter", "CursorHold", "InsertLeave" },
      { buffer = bufnr, callback = function() vim.lsp.codelens.refresh() end }
    )

    set_lsp_keymaps(bufnr)
  end,
})
