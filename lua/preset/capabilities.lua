local M = vim.lsp.protocol.make_client_capabilities()

M.textDocument = {
  completion = {
    completionItem = {
      dynamicRegistration = false,
      documentationFormat = { "markdown", "plaintext", "asciidoc" },
      snippetSupport = true,
      preselectSupport = true,
      insertReplaceSupport = true,
      labelDetailsSupport = true,
      deprecatedSupport = true,
      contextSupport = true,
      commitCharactersSupport = true,
      insertTextModeSupport = { valueSet = { 1, 2 } },
      tagSupport = { valueSet = { 1 } },
      completionList = {
        itemDefaults = { "commitCharacters", "editRange", "insertTextFormat", "insertTextMode", "data" },
      },
      resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
          "sortText",
          "filterText",
          "insertText",
          "textEdit",
          "insertTextFormat",
          "insertTextMode",
        },
      },
    },
  },
  foldingRange = { dynamicRegistration = false, lineFoldingOnly = true },
}
return M
