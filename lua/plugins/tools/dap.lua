---@type LazyPluginSpec
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "LiadOz/nvim-dap-repl-highlights",
    "theHamsta/nvim-dap-virtual-text",
    "igorlfs/nvim-dap-view",
    "rcarriga/nvim-dap-ui",
    "mfussenegger/nvim-dap-python",
    "jbyuki/one-small-step-for-vimkind",
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

    dap.adapters.delve = function(callback, config)
      if config.mode == "remote" and config.request == "attach" then
        callback({
          type = "server",
          host = config.host or "127.0.0.1",
          port = config.port or "38697",
        })
      else
        callback({
          type = "server",
          port = "${port}",
          executable = {
            command = "dlv",
            args = { "dap", "-l", "127.0.0.1:${port}", "--log", "--log-output=dap" },
            detached = vim.fn.has("win32") == 0,
          },
        })
      end
    end

    dap.adapters.haskell = { type = "executable", command = "haskell-debug-adapter" }

    dap.configurations.lua = {
      {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
      },
    }

    dap.configurations.javascript = {
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

    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end

    dap.configurations.go = {
      {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}",
      },
      {
        type = "delve",
        name = "Debug test",
        request = "launch",
        mode = "test",
        program = "${file}",
      },
      {
        type = "delve",
        name = "Debug test (go.mod)",
        request = "launch",
        mode = "test",
        program = "./${relativeFileDirname}",
      },
    }

    dap.configurations.haskell = {
      {
        type = "haskell",
        request = "launch",
        name = "Debug",
        workspace = "${workspaceFolder}",
        startup = "${file}",
        stopOnEntry = true,
        logFile = vim.fn.stdpath("data") .. "/haskell-dap.log",
        logLevel = "WARNING",
        ghciEnv = vim.empty_dict(),
        ghciPrompt = "λ: ",
        ghciInitialPrompt = "λ: ",
        ghciCmd = "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
      },
    }
  end,
}
