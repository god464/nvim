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
    keymap = { preset = "enter" },
    appearance = { nerd_font_variant = "mono" },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = {
        auto_show = true,
        window = { border = "rounded", scrollbar = false },
        auto_show_delay_ms = 0,
        update_delay_ms = 0,
      },
      list = { selection = { auto_insert = true, preselect = function(ctx) return ctx.mode ~= "cmdline" end } },
      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if ctx.item.source_name == "LSP" then
                  local color_item =
                    require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr then icon = color_item.abbr end
                end
                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local highlight = "BlinkCmpKind" .. ctx.kind
                if ctx.item.source_name == "LSP" then
                  local color_item =
                    require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
                  if color_item and color_item.abbr_hl_group then highlight = color_item.abbr_hl_group end
                end
                return highlight
              end,
            },
          },
        },
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
