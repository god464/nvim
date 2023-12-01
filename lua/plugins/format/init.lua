local format = require("conform")
format.setup({
	formatters = {
		clang_format = {
			args = { "-style", "google" },
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		cpp = { "clang_format" },
		js = { "standardjs" },
		html = { "prettier" },
		css = { "prettier" },
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
})
