---@type LazyPluginSpec
---@module 'blink.pairs'
return {
  "saghen/blink.pairs",
  event = "UIEnter",
  build = function()
    if vim.uv.fs_stat("/etc/nixos") then
      return "nix run .#build-plugin "
    else
      return "cargo build --release"
    end
  end,
  ---@type blink.pairs.Config
  opts = {},
}
