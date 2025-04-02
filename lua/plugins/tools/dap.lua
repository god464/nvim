---@type LazyPluginSpec
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "LiadOz/nvim-dap-repl-highlights",
    "theHamsta/nvim-dap-virtual-text",
    "igorlfs/nvim-dap-view",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
  },
  keys = {
    { "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
    { "<F17>", function() require("dap").terminate() end, desc = "Debug: Terminate" },
    { "<F10>", function() require("dap").step_over() end, desc = "Debug: Step over" },
    { "<F11>", function() require("dap").step_into() end, desc = "Debug: Step into" },
    -- - Shift + <F11>
    { "<F23>", function() require("dap").step_out() end, desc = "Debug: Step out" },
    { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle breakpoint" },
    {
      "<leader>dp",
      function()
        local condition = vim.fn.input("Breakpoint condition: ")
        if condition == "" then return end
        require("dap").set_breakpoint(condition)
      end,
      desc = "Set condition breakpoint",
    },
    {
      "<leader>dP",
      function()
        local message = vim.fn.input("Log point message: ")
        if message == "" then return end
        require("dap").set_breakpoint(nil, nil, message)
      end,
      desc = "Set log point",
    },
    { "<leader>dR", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run last" },
  },
  config = function()
    local dap = require("dap")

    require("dap-python").setup("python")

    dap.adapters.codelldb = {
      type = "executable",
      command = "codelldb",
      name = "codelldb",
    }

    dap.configurations.typescript = {
      {
        name = "Debug with Firefox",
        type = "firefox",
        request = "launch",
        reAttach = true,
        url = "http://localhost:3000",
        webRoot = "${workspaceFolder}",
        firefoxExecutable = "firefox",
      },
    }

    dap.configurations.java = {
      {
        type = "java",
        request = "attach",
        name = "Debug (Attach) - Remote",
        hostName = "127.0.0.1",
        port = 5005,
      },
    }
  end,
}
