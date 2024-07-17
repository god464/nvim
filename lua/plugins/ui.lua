local highlight = {
    "RainbowDelimiterRed",
    "RainbowDelimiterYellow",
    "RainbowDelimiterBlue",
    "RainbowDelimiterOrange",
    "RainbowDelimiterGreen",
    "RainbowDelimiterViolet",
    "RainbowDelimiterCyan",
}
return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
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
                highlight = highlight,
            },
            exclude = {
                filetypes = {
                    "help",
                    "lazy",
                },
            },
        },
        config = function(_, opts) require("ibl").setup() end,
    },
}
