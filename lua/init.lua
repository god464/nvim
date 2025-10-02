local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo(
      { { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" }, { "\nPress any key to exit..." } },
      true,
      {}
    )
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  defaults = { lazy = true, version = false },
  spec = { { import = "plugins" } },
  install = { missing = true, colorscheme = { "catppuccin" } },
  rocks = { enabled = false },
  checker = { enabled = true },
  ui = { border = "rounded" },
  performance = {
    rtp = {
      reset = true,
      disabled_plugins = {
        "osc52",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "rplugin",
      },
    },
  },
})

vim.keymap.set("n", "<leader>L", "<Cmd>Lazy<CR>", { desc = "Lazy" })
