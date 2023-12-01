require("nvim-treesitter.configs").setup({
	auto_install = true,
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	config = {
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				include_surrounding_whitespace = true,
			},
			swap = {
				enable = true,
			},
			move = {
				enable = true,
				set_jumps = true,
			},
			lsp_interop = {
				enable = true,
			},
		},
	},
})
require("treesitter-context").setup({
	enable = true,
	line_number = true,
})
