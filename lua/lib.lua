---@class lib
local M = {}

---@return string
function M.build_blink_plugin()
  return vim.uv.fs_stat("/etc/nixos") and "nix run .#build-plugin" or "cargo build --release"
end

---@return string
function M.get_vue_ts_plugin()
  local local_path = vim.fs.root(vim.fn.exepath("vue-language-server"), "bin")
    .. "/lib/language-tools/packages/language-server/"

  return vim.uv.fs_stat(local_path) and local_path or "/usr/lib/language-tools/packages/language-server"
end

---@return string
function M.get_astro_ts_plugin()
  local local_path = vim.fs.root(vim.fn.exepath("astro-ls"), "bin")
    .. "/lib/node_modules/astro-language-server/packages/language-tools/ts-plugin/dist/"

  return vim.uv.fs_stat(local_path) and local_path or "/usr/lib/node_modules/@astrojs/ts-plugin/dist/"
end

return M
