---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "LazyFile",
  config = function()
    local nvim_treesitter = require("nvim-treesitter")
    local ts_config = require("nvim-treesitter.config")

    --- Starting Tree Sitter
    ---@param buf integer
    ---@param lang string
    local function start_treesitter(buf, lang)
      if not vim.treesitter.language.add(lang) then return end
      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      vim.treesitter.start(buf, lang)
    end

    --- Check Parser
    ---@param buf integer
    ---@param lang string
    local function ensure_parser(buf, lang)
      if vim.tbl_contains(ts_config.get_installed("parsers"), lang) then
        start_treesitter(buf, lang)
        return
      end

      nvim_treesitter.install(lang):await(function() start_treesitter(buf, lang) end)
    end

    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("ts_setup", {}),
      callback = function(event)
        local buf = event.buf
        local ft = event.match
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then return end

        if not vim.tbl_contains(ts_config.get_available(), lang) then return end
        ensure_parser(buf, lang)
      end,
    })
  end,
}
