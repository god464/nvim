local lsp = require("lspconfig")
local lsp_ls = { "lua_ls", "clangd", "denols", "html", "cssls" }
local capabilities = require("cmp_nvim_lsp").default_capabilities()
for _, v in ipairs(lsp_ls) do
	lsp[v].setup({
		capabilities = capabilities,
	})
end
