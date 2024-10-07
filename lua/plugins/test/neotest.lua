return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "alfaix/neotest-gtest",
      "nvim-neotest/neotest-python",
    },
    opts = function()
      return {
        adapters = {
          require("neotest-gtest")(),
          require("neotest-python")({ runner = "unittest" }),
        },
        consumers = { overseer = require("neotest.consumers.overseer") },
      }
    end,
    keys = {
      {
        "<leader>Tr",
        function() require("neotest").run.run() end,
        desc = "Run",
      },
      {
        "<leader>Ts",
        function() require("neotest").run.stop() end,
        desc = "Stop",
      },
      {
        "<leader>Ta",
        function() require("neotest").run.attach() end,
        desc = "Attach",
      },
      {
        "<leader>Tm",
        function() require("neotest").summary.toggle() end,
        desc = "Summary",
      },
      {
        "<leader>Tw",
        function() require("neotest").watch.toggle() end,
        desc = "Watch",
      },
      {
        "<leader>To",
        function() require("neotest").output_panel.toggle() end,
        desc = "Output panel",
      },
    },
  },
}
