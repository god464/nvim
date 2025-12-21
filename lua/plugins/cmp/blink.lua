---@type LazyPluginSpec
return {
  "saghen/blink.cmp",
  build = require("lib").build_blink_plugin(),
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = "rafamadriz/friendly-snippets",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },
    appearance = { nerd_font_variant = "mono" },
    cmdline = {
      keymap = { preset = "enter", ["<CR>"] = { "accept_and_enter", "fallback" }, ["<Tab>"] = { "accept" } },
      completion = { menu = { auto_show = true }, ghost_text = { enabled = false } },
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = {
        auto_show = true,
        window = { border = "rounded", scrollbar = false },
        auto_show_delay_ms = 0,
        update_delay_ms = 50,
      },
      list = { selection = { auto_insert = true, preselect = function(ctx) return ctx.mode ~= "cmdline" end } },
      menu = {
        winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,CursorLine:BlinkCmpDocCursorLine,Search:None",
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
      default = { "lsp", "path", "snippets", "buffer", "markdown" },
      providers = {
        markdown = { name = "RenderMarkdown", module = "render-markdown.integ.blink", fallbacks = { "lsp" } },
      },
    },
  },
}
