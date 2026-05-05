---@type LazyPluginSpec
return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  opts = function()
    local function styled_button(dashboard, shortcut, label, command)
      local button = dashboard.button(shortcut, label, command)
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      return button
    end

    local dashboard = require("alpha.themes.dashboard")
    local dashboard_config = dashboard.section

    dashboard_config.header.val = {
      [[                                                     ]],
      [[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  ]],
      [[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  ]],
      [[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  ]],
      [[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  ]],
      [[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  ]],
      [[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  ]],
      [[                                                     ]],
    }

    dashboard_config.buttons.val = {
      styled_button(dashboard, "n", "󰈔  New file", "<cmd>ene <BAR> startinsert <cr>"),
      styled_button(dashboard, "f", "󰈞  Find file", "<cmd>FzfLua files<cr>"),
      styled_button(dashboard, "g", "󰊄  Live grep", "<cmd>FzfLua live_grep_native<cr>"),
      styled_button(dashboard, "r", "  Recent files", "<cmd>FzfLua oldfiles<cr>"),
      styled_button(dashboard, "o", "  Browser files", "<cmd>Oil<cr>"),
      styled_button(dashboard, "u", "  Update plugins", "<cmd>Lazy sync<cr>"),
      styled_button(dashboard, "q", "󰅚  Quit", "<cmd>qa<cr>"),
    }

    dashboard_config.header.opts.hl = "AlphaHeader"
    dashboard_config.buttons.opts.hl = "AlphaButtons"
    dashboard_config.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8

    return dashboard.config
  end,
}
