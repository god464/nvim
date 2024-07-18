return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "storm",
        },
        config = function() vim.cmd([[colorscheme tokyonight-storm]]) end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        opts = {
            indent = {
                char = "│",
                tab_char = "│",
            },
            scope = {
                show_start = false,
                show_end = false,
            },
            exclude = {
                filetypes = {
                    "help",
                    "lazy",
                },
            },
        },
        config = function() require("ibl").setup() end,
    },
}
