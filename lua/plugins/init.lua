local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	{
		"folke/tokyonight.nvim",
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter", "VeryLazy" },
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "VeryLazy" },
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
		},
	},
	{
		"stevearc/conform.nvim",
		lazy = true,
		cmd = "ConformInfo",
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
	{
		"mfussenegger/nvim-lint",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-omni",
			"f3fora/cmp-spell",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
			"hrsh7th/cmp-cmdline",
			--"Exafunction/codeium.nvim",
		},
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"numToStr/Comment.nvim",
	},
	{
		"kylechui/nvim-surround",
	},
	{
		"nvim-tree/nvim-web-devicons",
	},
	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		config = function()
			vim.g.startuptime_tries = 10
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
	},
})
require("plugins.ui")
require("plugins.motion")
require("plugins.utils")
require("plugins.ts")
require("plugins.lsp")
require("plugins.format")
require("plugins.lint")
require("plugins.cmp")
