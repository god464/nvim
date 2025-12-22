---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  dependencies = "LiadOz/nvim-dap-repl-highlights",
  event = "LazyFile",
  config = function()
    local enable_ts = function(buf, lang)
      if not vim.tbl_contains(require("nvim-treesitter.config").get_available(), lang) then return end
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      if not vim.g.vscode then vim.treesitter.start(buf, lang) end
    end
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("ts_setup", {}),
      callback = function(event)
        local filetype = event.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if not vim.tbl_contains(require("nvim-treesitter.config").get_installed("parsers"), lang) then
          require("nvim-treesitter").install(lang):await(function() enable_ts(event.buf, lang) end)
        else
          enable_ts(event.buf, lang)
        end
      end,
    })
  end,
}
