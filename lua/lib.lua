local M = {}

---@return string
function M.build_plugin() return vim.uv.fs_stat("/etc/nixos") and "nix run .#build-plugin" or "cargo build --release" end

---@return string
function M.get_vue_ts_plugin()
  local local_path = vim.fn.resolve(
    vim.fn.simplify(
      vim.fn.fnamemodify(vim.fn.exepath("vue-language-server"), ":h")
        .. "/../lib/language-tools/packages/typescript-plugin/"
    )
  )

  return vim.uv.fs_stat(local_path) and local_path
    or "/usr/lib/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin"
end

return M
