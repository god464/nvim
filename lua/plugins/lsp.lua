return {
    {
        "neovim/nvim-lspconfig",
        event = "FileType",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.clangd.setup({})
        end,
    },
    {
        "folke/lazydev.nvim",
        dependencies = {
            "Bilal2453/luvit-meta",
        },
        ft = "lua",
        opts = {
            library = {
                {
                    path = "luvit-meta/library",
                    words = { "vim%.uv" },
                },
                {
                    path = "lazy.nvim",
                    words = { "LazyPluginSpec" },
                },
            },
        },
    },
}
