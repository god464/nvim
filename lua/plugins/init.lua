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
	defaults = {
		lazy = true,
	},
	checker = {
		enabled = true,
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter", "VeryLazy" },
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context",
			"nvim-treesitter/nvim-treesitter-textobjects",
			"windwp/nvim-ts-autotag",
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"williamboman/mason.nvim",
		},
	},
	{
		"stevearc/conform.nvim",
		cmd = "ConformInfo",
		event = "VeryLazy",
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
		event = { "InsertEnter", "CmdlineEnter", "VeryLazy" },
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		event = { "InsertEnter", "CmdlineEnter", "VeryLazy" },
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
			"saadparwaiz1/cmp_luasnip",
			--"Exafunction/codeium.nvim",
		},
	},
	{
		"nvim-lua/plenary.nvim",
		event = "VeryLazy",
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
	},
	{
		"kylechui/nvim-surround",
		event = { "InsertEnter", "VeryLazy" },
	},
	{
		"nvim-tree/nvim-web-devicons",
		event = "VeryLazy",
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
	{ "folke/neodev.nvim", opts = {} },
	{ "folke/neoconf.nvim", opts = {} },
})
local sub = { "ui", "motion", "utils", "ts", "lsp", "format", "lint", "cmp" }
for _, v in ipairs(sub) do
	require("plugins." .. v)
end
