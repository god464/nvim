local lint = require("lint")
lint.linters_by_ft = {
	linters_by_ft = {
		lua = { "selene" },
		c = { "cpplint" },
		cpp = { "cpplint" },
		js = { "standardjs" },
		css = { "stylecss" },
	},
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
