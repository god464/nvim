local M = {}

local group = vim.api.nvim_create_augroup("cat-lsp", { clear = true })
local did_setup = false

function M.setup()
  if did_setup then
    return
  end

  did_setup = true

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

  if vim.lsp.document_highlight then
    vim.lsp.document_highlight.enable()
  end

  ---@type vim.lsp.util.open_floating_preview.Opts
  local preview_opts = {
    border = "rounded",
    title_pos = "center",
  }

  local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

  ---@diagnostic disable-next-line: duplicate-set-field
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = vim.tbl_deep_extend("keep", opts, preview_opts)
    return orig_util_open_floating_preview(contents, syntax, opts, ...)
  end

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(args)
      local bufnr = args.buf
      local map = vim.keymap.set

      if not vim.b[bufnr].cat_lsp_codelens_refresh then
        vim.b[bufnr].cat_lsp_codelens_refresh = true
        vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
          group = group,
          buffer = bufnr,
          callback = function() vim.lsp.codelens.refresh() end,
        })
      end

      map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Declaration" })
      map("n", "<leader>cr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
      map("n", "<leader>li", vim.lsp.buf.incoming_calls, { buffer = bufnr, desc = "Incoming calls" })
      map("n", "<leader>lo", vim.lsp.buf.outgoing_calls, { buffer = bufnr, desc = "Outgoing calls" })
      map("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code code_action" })
    end,
  })
end

return M
