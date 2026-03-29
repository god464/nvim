---@type LazyPluginSpec[]
return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    opts = function()
      ---@type vim.lsp.Config
      return {
        ---@module 'lspconfig'
        servers = {
          lua_ls = {
            ---@type lspconfig.settings.lua_ls
            settings = {
              Lua = {
                diagnostics = { workspaceEvent = "OnChange" },
                hint = { setType = true },
                completion = { callSnippet = "Both", keywordSnippet = "Both", displayContext = 5 },
              },
            },
          },
          emmylua_ls = {},
          clangd = {},
          jsonls = {
            ---@type lspconfig.settings.jsonls
            settings = { json = { schemas = require("schemastore").json.schemas(), validate = { enable = true } } },
          },
          yamlls = {
            capabilities = {
              textDocument = {
                foldingRange = {
                  dynamicRegistration = false,
                  lineFoldingOnly = true,
                },
              },
            },
            ---@type lspconfig.settings.yamlls
            settings = {
              yaml = {
                schemaStore = { enabled = false, url = "" },
                schemas = require("schemastore").yaml.schemas(),
                validate = false,
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
                  nixos = { expr = '(builtins.getFlake "/home/cl/persist/flake").nixosConfigurations.laptop.options' },
                },
              },
            },
          },
          nil_ls = {},
          taplo = {},
          tombi = {},
          ty = {},
          basedpyright = {
            ---@type lspconfig.settings.basedpyright
            settings = { basedpyright = { analysis = { typeCheckingMode = "recommended" } } },
          },
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
            ---@type lspconfig.settings.vtsls
            settings = {
              complete_function_calls = true,
              vtsls = {
                enableMoveToFileCodeAction = true,
                autoUseWorkspaceTsdk = true,
                experimental = {
                  maxInlayHintLength = 30,
                  completion = { enableServerSideFuzzyMatch = true },
                },
                typescript = {
                  updateImportsOnFileMove = { enabled = "always" },
                  suggest = {
                    completeFunctionCalls = true,
                  },
                  inlayHints = {
                    enumMemberValues = { enabled = true },
                    functionLikeReturnTypes = { enabled = true },
                    parameterNames = { enabled = "literals" },
                    parameterTypes = { enabled = true },
                    propertyDeclarationTypes = { enabled = true },
                  },
                },
                tsserver = {
                  globalPlugins = {
                    {
                      name = "@vue/typescript-plugin",
                      location = require("lib").get_vue_ts_plugin(),
                      languages = { "vue" },
                      configNamespace = "typescript",
                    },
                    {
                      name = "@astrojs/ts-plugin",
                      location = require("lib").get_astro_ts_plugin(),
                      languages = { "astro" },
                      configNamespace = "typescript",
                    },
                    {
                      name = "@angular/language-server",
                      location = vim.fs.root(vim.fn.exepath("ngserver"), "bin")
                        .. "/lib/language-tools/packages/language-server/",
                    },
                  },
                },
              },
            },
          },
          tsgo = {},
          texlab = {},
          tinymist = {},
          marksman = {},
          sqruff = {},
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
          fish_lsp = {},
          copilot = {},
          angularls = {},
          just = {},
          muon = {},
        },
      }
    end,
    config = function(_, opts)
      require("basic.lsp").setup()
      require("lspkind").init({ mode = "symbol_text", preset = "default" })

      for server, config in pairs(opts.servers) do
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end
    end,
  },
  { "onsails/lspkind.nvim" },
  { "b0o/SchemaStore.nvim" },
}
