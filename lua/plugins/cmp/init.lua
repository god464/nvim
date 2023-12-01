local cmp = require("cmp")
require("luasnip.loaders.from_vscode").lazy_load()
cmp.setup({
	sources = cmp.config.sources({
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
		{ name = "nvim_lsp" },
		{ name = "buffer" },
		{ name = "calc" },
		{
			name = "omni",
			option = {
				disable_omnifuncs = { "v:lua.vim.lsp.omnifunc" },
			},
		},
		{
			name = "spell",
			option = {
				keep_all_entries = false,
				enable_in_context = function()
					return true
				end,
			},
		},
		{ name = "nvim_lsp_document_symbol" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "treesitter" },
		{ name = "nvim_lua" },
		{ name = "path" },
	}),
})
-- require("codeium").setup({})
cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})
