return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "nvim-lua/plenary.nvim" },
  event = "VimEnter",
  opts = function()
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
      dashboard.button("n", "󰈔  New file", "<cmd>ene <BAR> startinsert <cr>"),
      dashboard.button("f", "󰈞  Find file", "<cmd>FzfLua files<cr>"),
      dashboard.button("g", "󰊄  Live grep", "<cmd>FzfLua live_grep_native<cr>"),
      dashboard.button("r", "  Recent files", "<cmd>FzfLua oldfiles<cr>"),
      dashboard.button("o", "  Browser files", "<cmd>Oil<cr>"),
      dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<cr>"),
      dashboard.button("q", "󰅚  Quit", "<cmd>qa<cr>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end

    dashboard_config.header.opts.hl = "AlphaHeader"
    dashboard_config.buttons.opts.hl = "AlphaButtons"
    dashboard_config.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8

    return dashboard.config
  end,
}
