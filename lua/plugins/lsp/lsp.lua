---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "b0o/SchemaStore.nvim", ft = { "json", "yaml" } },
    "onsails/lspkind.nvim",
    { "nanotee/sqls.nvim", ft = "sql" },
  },
  event = "FileType",
  opts = function()
    ---@type vim.lsp.Config
    return {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { workspaceEvent = "OnChange" },
              hint = { enable = true, setType = true },
              completion = { callSnippet = "Both", keywordSnippet = "Both", displayContext = 5 },
              codeLens = { enable = true },
            },
          },
        },
        emmylua_ls = {},
        clangd = {},
        jsonls = {
          settings = { json = { schemas = require("schemastore").json.schemas(), validate = { enable = true } } },
        },
        yamlls = {
          settings = {
            yaml = {
              schemaStore = { enabled = false, url = "" },
              schemas = require("schemastore").yaml.schemas(),
              validate = { enable = true },
              yamlVersion = 1.2,
              format = { enable = true },
              hover = true,
              completion = true,
            },
            redhat = { telemetry = { enabled = false } },
          },
        },
        nixd = {
          settings = {
            nixd = {
              formatting = { command = { "nixfmt" } },
              options = {
                flake_parts = {
                  expr = 'let flake = builtins.getFlake ("/home/cl/persist/flake"); in flake.debug.options // flake.currentSystem.options',
                },
              },
            },
          },
        },
        nil_ls = {},
        taplo = {},
        ty = {},
        basedpyright = { settings = { basedpyright = { analysis = { typeCheckingMode = "recommended" } } } },
        neocmake = {},
        bashls = {},
        dockerls = {},
        cssls = {},
        tailwindcss = {},
        superhtml = {},
        html = {},
        vue_ls = {},
        vtsls = {
          filetypes = {
            "typescript",
            "typescriptreact",
            "typescript.tsx",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "vue",
            "astro",
          },
          settings = {
            vtsls = {
              tsserver = {
                globalPlugins = {
                  {
                    name = "@vue/typescript-plugin",
                    location = require("lib").get_vue_ts_plugin(),
                    languages = { "vue" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                  {
                    name = "@astrojs/ts-plugin",
                    location = require("lib").get_astro_ts_plugin(),
                    languages = { "astro" },
                    configNamespace = "typescript",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
          },
        },
        texlab = {},
        tinymist = {},
        marksman = {},
        sqls = { on_attach = function(client, bufnr) require("sqls").on_attach(client, bufnr) end },
        lemminx = {},
        gradle_ls = {},
        verible = {},
        astro = {},
        terraformls = {},
        ansiblels = {},
        gopls = {
          settings = {
            gopls = {
              analyses = {
                ST1003 = true,
                ST1005 = true,
                ST1019 = true,
                ST1017 = true,
                ST1012 = true,
                ST1011 = true,
                ST1006 = true,
              },
              codelenses = { vulncheck = true, test = true, vendor = true },
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
              diagnosticsDelay = "500ms",
              gofumpt = true,
              semanticTokens = true,
              staticcheck = true,
              usePlaceholders = true,
            },
          },
        },
        ccls = {},
        mdx_analyzer = {},
        nushell = {},
      },
    }
  end,
  config = function(_, opts)
    for server, config in pairs(opts.servers) do
      vim.lsp.config(server, config)
      vim.lsp.enable(server)
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      require("lspkind").init({ mode = "symbol_text", preset = "default" })
    end
  end,
}
