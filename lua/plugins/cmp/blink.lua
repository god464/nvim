local function build_plugin()
  if vim.uv.fs_stat("/etc/NIXOS") then
    return "nix run .#build-plugin"
  else
    return "cargo build --release"
  end
end

return {
  "saghen/blink.cmp",
  lazy = false,
  build = build_plugin(),
  dependencies = "rafamadriz/friendly-snippets",
  opts = {
    keymap = { preset = "enter" },
    nerd_font_variant = "mono",
    trigger = { signature_help = { enabled = true } },
    accept = { auto_brackets = { enabled = true } },
    windows = { border = "rounded" },
    sources = {
      completion = { enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" } },
      providers = {
        lsp = { fallback_for = { "lazydev" } },
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
      },
    },
  },
}
