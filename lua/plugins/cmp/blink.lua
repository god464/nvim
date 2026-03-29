---@type LazyPluginSpec
return {
  "saghen/blink.cmp",
  build = function() return require("lib").build_blink_plugin() end,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = "rafamadriz/friendly-snippets",
  opts = function()
    local function get_color_item(ctx)
      if ctx.item.source_name ~= "LSP" then return nil end
      return require("nvim-highlight-colors").format(ctx.item.documentation, { kind = ctx.kind })
    end

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    return {
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
                  local color_item = get_color_item(ctx)
                  return (color_item and color_item.abbr or ctx.kind_icon) .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local color_item = get_color_item(ctx)
                  return color_item and color_item.abbr_hl_group or "BlinkCmpKind" .. ctx.kind
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
    }
  end,
}
