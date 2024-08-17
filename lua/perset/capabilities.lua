local M = vim.lsp.protocol.make_client_capabilities()
local cmp = require("cmp_nvim_lsp")
M = cmp.default_capabilities(M)
M.textDocument.completion.completionItem.snippetSupport = true
return M
