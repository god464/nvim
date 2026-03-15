local terminals = {}

---@param cmd string
local function repl(cmd)
  if not terminals[cmd] then
    terminals[cmd] = require("toggleterm.terminal").Terminal:new({ cmd = cmd, hidden = true, direction = "float" })
  end
  terminals[cmd]:toggle()
end

---@type LazyPluginSpec
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
    { "<leader>otp", function() repl("python") end, mode = "n", desc = "Python REPL" },
    { "<leader>otn", function() repl("nix repl") end, mode = "n", desc = "Nix REPL" },
    { "<leader>otl", function() repl("lua") end, mode = "n", desc = "Lua REPL" },
    { "<leader>otg", function() repl("ghci") end, mode = "n", desc = "Haskell REPL (GHCI)" },
  },
}
