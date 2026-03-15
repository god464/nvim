---@type LazyPluginSpec
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "mfussenegger/nvim-dap-python",
    "jbyuki/one-small-step-for-vimkind",
    "leoluz/nvim-dap-go",
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>dB",
      function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
      desc = "Breakpoint Condition",
    },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },
  config = function()
    local dap = require("dap")

    local function prompt_path(prompt, default_path)
      return function() return vim.fn.input(prompt, vim.fn.getcwd() .. default_path, "file") end
    end

    vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")
    vscode.json_decode = function(str) return vim.json.decode(json.json_strip_comments(str)) end

    require("dap-python").setup("python")

    for name, adapter in pairs({
      codelldb = {
        type = "server",
        port = "${port}",
        executable = { command = "codelldb", args = { "--port", "${port}" } },
      },
      haskell = { type = "executable", command = "haskell-debug-adapter" },
      coreclr = {
        type = "executable",
        command = "netcoredbg",
        args = { "--interpreter=vscode" },
      },
    }) do
      dap.adapters[name] = adapter
    end

    dap.adapters.nlua = function(callback, config)
      callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
    end

    local configurations = {
      cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = prompt_path("Path to executable: ", "/"),
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      },
      lua = {
        {
          type = "nlua",
          request = "attach",
          name = "Attach to running Neovim instance",
        },
      },
      java = {
        {
          type = "java",
          request = "attach",
          name = "Debug (Attach) - Remote",
          hostName = "127.0.0.1",
          port = 5005,
        },
      },
      haskell = {
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
      },
      cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = prompt_path("Path to dll", "/bin/Debug/"),
        },
      },
    }

    configurations.c = configurations.cpp

    for filetype, config in pairs(configurations) do
      dap.configurations[filetype] = config
    end
  end,
}
