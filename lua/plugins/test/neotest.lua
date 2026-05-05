---@type LazyPluginSpec
---@module 'neotest'
return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "alfaix/neotest-gtest",
    "nvim-neotest/neotest-python",
    "marilari88/neotest-vitest",
    "fredrikaverpil/neotest-golang",
    "mrcjkb/neotest-haskell",
  },
  opts = function()
    ---@type neotest.Config
    return {
      adapters = {
        require("neotest-gtest")(),
        require("neotest-python")({ runner = "unittest" }),
        require("rustaceanvim.neotest")(),
        require("neotest-vitest")(),
        require("neotest-golang")(),
        require("neotest-haskell")(),
      },
      consumers = { overseer = require("neotest.consumers.overseer") },
    }
  end,
  keys = function()
    local function neotest_action(callback)
      return function() callback(require("neotest")) end
    end

    local current_file = function() return vim.fn.expand("%") end

    local mappings = {
      { "<leader>tt", function(neotest) neotest.run.run(current_file()) end, "Run File (Neotest)" },
      { "<leader>tT", function(neotest) neotest.run.run(vim.uv.cwd()) end, "Run All Test Files (Neotest)" },
      { "<leader>tr", function(neotest) neotest.run.run() end, "Run Nearest (Neotest)" },
      { "<leader>tl", function(neotest) neotest.run.run_last() end, "Run Last (Neotest)" },
      { "<leader>ts", function(neotest) neotest.summary.toggle() end, "Toggle Summary (Neotest)" },
      {
        "<leader>to",
        function(neotest) neotest.output.open({ enter = true, auto_close = true }) end,
        "Show Output (Neotest)",
      },
      { "<leader>tO", function(neotest) neotest.output_panel.toggle() end, "Toggle Output Panel (Neotest)" },
      { "<leader>tS", function(neotest) neotest.run.stop() end, "Stop (Neotest)" },
      { "<leader>tw", function(neotest) neotest.watch.toggle(current_file()) end, "Toggle Watch (Neotest)" },
    }

    return vim.tbl_map(
      function(mapping) return { mapping[1], neotest_action(mapping[2]), desc = mapping[3] } end,
      mappings
    )
  end,
}
