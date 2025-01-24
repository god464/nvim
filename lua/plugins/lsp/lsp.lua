return {
  "neovim/nvim-lspconfig",
  dependencies = { { "b0o/SchemaStore.nvim", ft = { "json", "yaml" } }, "onsails/lspkind.nvim" },
  event = "FileType",
  opts = function()
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
          nixpkgs = { expr = "import <nixpkgs> { }" },
          formatting = { command = { "nixfmt" } },
          options = {
            nixos = {
              exp = 'let names = ["server","desktop","vm-deploy"]; flake = builtins.getFlake ("/home/cl/persist/flake"); in map (name: flake.nixosConfigurations.${name}.options) names',
            },
            flake_parts = {
              expr = 'let flake = builtins.getFlake ("/home/cl/persist/flake"); in flake.debug.options // flake.currentSystem.options',
            },
          },
        },
        taplo = {},
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                diagnosticSeverityOverrides = {
                  reportUnusedImport = "information",
                  reportUnusedFunction = "information",
                  reportUnusedVariable = "information",
                  reportGeneralTypeIssues = "none",
                  reportOptionalMemberAccess = "none",
                  reportOptionalSubscript = "none",
                  reportPrivateImportUsage = "none",
                },
              },
            },
          },
        },
        neocmake = {},
        bashls = {},
        dockerls = {},
        cssls = {},
        tailwindcss = {},
        denols = {},
        superhtml = {},
        html = {},
        volar = { init_options = { vue = { hybridMode = true } } },
        texlab = {},
        tinymist = {},
        marksman = {},
      },
    }
  end,
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local capabilities = require("preset.capabilities")

    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(vim.tbl_extend("force", { capabilities = capabilities }, config))
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
      require("lspkind").init({ mode = "symbol_text", preset = "default" })
    end
  end,
}
