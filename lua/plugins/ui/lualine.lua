---@type LazyPluginSpec
return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    sections = {
      lualine_a = { { "mode", icon = "" } },
      lualine_b = {
        { "branch", icon = " " },
        { "diff", symbols = { added = " ", modified = " ", removed = " " } },
      },
      lualine_x = {
        { "encoding", show_bomb = true },
        { "diagnostics", symbols = { error = " ", warn = " ", info = "󰛩 ", hint = "󰋼 " } },
        "fileformat",
        "filetype",
      },
      lualine_y = { { "progress", icon = "" } },
      lualine_z = { { "location", icon = " " } },
    },
    options = { section_separators = { left = "", right = "" }, component_separators = { left = "", right = "" } },
    extensions = {
      "lazy",
      "trouble",
      "mason",
      "quickfix",
      "overseer",
      "fzf",
      "toggleterm",
      "nvim-dap-ui",
      "symbols-outline",
    },
  },
}
