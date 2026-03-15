local terminals = {}
local repls = {
  { "<leader>otp", "python", "Python REPL" },
  { "<leader>otn", "nix repl", "Nix REPL" },
  { "<leader>otl", "lua", "Lua REPL" },
  { "<leader>otg", "ghci", "Haskell REPL (GHCI)" },
}

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
      local sizes = { horizontal = 15, vertical = vim.o.columns * 0.4 }
      return sizes[term.direction]
    end,
    autochdir = true,
    open_mapping = [[<C-\>]],
    shell = vim.uv.os_uname().sysname == "Windows_NT" and "pwsh" or "fish",
    float_opts = { border = "rounded" },
    winbar = { enabled = true },
  },
  keys = function()
    local keys = { { "<C-\\>" } }

    for _, spec in ipairs(repls) do
      keys[#keys + 1] = {
        spec[1],
        function() repl(spec[2]) end,
        mode = "n",
        desc = spec[3],
      }
    end

    return keys
  end,
}
