return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    routes = {
      {
        filter = {
          event = "msg_show",
          any = { { find = "%d+L, %d+B" }, { find = "; after #%d+" }, { find = "; before #%d+" } },
        },
        view = "notify",
      },
    },
    presets = { bottom_search = true, command_palette = true, long_message_to_split = true },
    views = {
      cmdline_popup = { border = { style = "rounded" } },
      hover = {
        border = { style = "rounded", padding = { 0, "rounded" == "none" and 2 or 0 } },
        position = { row = "rounded" == "none" and 1 or 2 },
      },
    },
  },
}
