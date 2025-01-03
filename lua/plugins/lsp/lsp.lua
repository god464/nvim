return {
  "neovim/nvim-lspconfig",
  dependencies = { "b0o/SchemaStore.nvim", ft = { "json", "yaml" } },
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
        nixd = {},
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
      },
    }
  end,
  config = function(_, opts)
    local lspconfig = require("lspconfig")
    local capabilities = require("preset.capabilities")

    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(vim.tbl_extend("force", { capabilities = capabilities }, config))
      config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
    end
  end,
}
