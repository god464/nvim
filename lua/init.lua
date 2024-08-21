local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  defaults = { lazy = true, version = false },
  spec = { { import = "plugins" } },
  install = { missing = true, colorscheme = { "catppuccin" } },
  rocks = { root = vim.fn.stdpath("data") .. "/lazy-rocks", server = "https://nvim-neorocks.github.io/rocks-binaries/" },
  checker = { enabled = true },
  performance = {
    rtp = {
      reset = true,
      disabled_plugins = {
        "osc52",
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
vim.keymap.set("n", "<leader>L", "<Cmd>Lazy<CR>", { desc = "Lazy" })
