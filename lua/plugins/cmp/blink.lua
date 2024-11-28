local function build_plugin()
  if vim.uv.fs_stat("/etc/nixos") then
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
    windows = {
      scrollbar = false,
      border = "rounded",
      signature_help = { border = "rounded" },
      documentation = {
        auto_show = true,
        border = "rounded",
        scrollbar = false,
        auto_show_delay_ms = 0,
        update_delay_ms = 0,
      },
    },
    sources = {
      completion = { enabled_providers = { "lsp", "path", "snippets", "buffer", "lazydev" } },
      providers = {
        lsp = { name = "LSP", fallback_for = { "lazydev" } },
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
      },
    },
  },
}
