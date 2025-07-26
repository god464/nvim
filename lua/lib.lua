local M = {}

---@return string
function M.build_plugin()
  if vim.uv.fs_stat("/etc/nixos") then
    return "nix run .#build-plugin"
  else
    return "cargo build --release"
  end
end

return M
