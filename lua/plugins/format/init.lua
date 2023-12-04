local format = require("conform")
format.setup({
	formatters = {
		clang_format = {
			args = { "-style", "google" },
		},
	},
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "clang_format" },
		cpp = { "clang_format" },
		js = { "standardjs" },
		html = { "prettier", "prettierd" },
		css = { "prettier", "prettierd" },
		rust = { "rustfmt" },
		tex = { "latexindent" },
	},
	format_on_save = {
		lsp_fallback = true,
		timeout_ms = 500,
	},
})
