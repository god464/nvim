---@type LazyPluginSpec
return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  opts = {
    settings = {
      java = {
        eclipse = { downloadSources = true },
        configuration = { updateBuildConfiguration = "interactive" },
        maven = { downloadSources = true },
        implementationsCodeLens = { enabled = true },
        referencesCodeLens = { enabled = true },
        inlayHints = { parameterNames = { enabled = "all" } },
        signatureHelp = { enabled = true },
      },
    },
  },
}
