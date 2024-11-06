return {
  "saghen/blink.cmp",
  lazy = false,
  build = "nix run .#build-plugin",
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
