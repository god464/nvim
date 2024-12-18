local function build_plugin()
  if vim.uv.fs_stat("/etc/nixos") then
    return "nix run .#build-plugin"
  else
    return "cargo build --release"
  end
end

return {
  "saghen/blink.cmp",
  build = build_plugin(),
  dependencies = "rafamadriz/friendly-snippets",
  opts = {
    keymap = { preset = "enter", cmdline = { preset = "default" } },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = {
        auto_show = true,
        window = { border = "rounded", scrollbar = false },
        auto_show_delay_ms = 0,
        update_delay_ms = 0,
      },
    },
    signature = { enabled = true, window = { border = "rounded" } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
      providers = {
        lsp = { name = "LSP", fallbacks = { "lazydev" } },
        lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
      },
    },
  },
}
