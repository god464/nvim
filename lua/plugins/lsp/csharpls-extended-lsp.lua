---@type LazyPluginSpec
return {
  "Decodetalkers/csharpls-extended-lsp.nvim",
  ft = "cs",
  config = function() require("csharpls_extended").buf_read_cmd_bind() end,
}
