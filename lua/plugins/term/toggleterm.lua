return {
  "akinsho/toggleterm.nvim",
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    autochdir = true,
    open_mapping = [[<C-\>]],
    shell = vim.uv.os_uname().sysname == "Windows_NT" and "pwsh" or "fish",
    float_opts = { border = "rounded" },
    winbar = { enabled = true },
  },
  keys = {
    { "<C-\\>" },
    {
      "<leader>otp",
      function()
        local python
        if not python then
          python = require("toggleterm.terminal").Terminal:new({ cmd = "python", hidden = true, direction = "float" })
        end
        python:toggle()
      end,
      mode = "n",
      desc = "Python REPL",
    },
    {
      "<leader>otn",
      function()
        local nix
        if not nix then
          nix = require("toggleterm.terminal").Terminal:new({ cmd = "nix repl", hidden = true, direction = "float" })
        end
        nix:toggle()
      end,
      mode = "n",
      desc = "Nix REPL",
    },
    {
      "<leader>otl",
      function()
        local lua
        if not lua then
          lua = require("toggleterm.terminal").Terminal:new({ cmd = "lua", hidden = true, direction = "float" })
        end
        lua:toggle()
      end,
      mode = "n",
      desc = "Lua REPL",
    },
  },
}
