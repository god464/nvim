return {
  {
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
      shell = "fish",
      winbar = { enabled = true },
    },
    keys = {
      { "<C-\\>" },
      {
        "<leader>otp",
        function()
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
          if not nix then
            nix = require("toggleterm.terminal").Terminal:new({ cmd = "nix repl", hidden = true, direction = "float" })
          end
          nix:toggle()
        end,
        mode = "n",
        desc = "Nix REPL",
      },
    },
  },
}
