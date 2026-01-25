---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "LazyFile",
  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      group = vim.api.nvim_create_augroup("ts_setup", {}),
      callback = function(event)
        local buf = event.buf
        local ft = event.match
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then return end

        local ts_config = require("nvim-treesitter.config")

        if not vim.tbl_contains(ts_config.get_available(), lang) then return end

        local function start_ts()
          if not vim.treesitter.language.add(lang) then return end
          vim.wo.foldmethod = "expr"
          vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          vim.treesitter.start(buf, lang)
        end

        if not vim.tbl_contains(ts_config.get_installed("parsers"), lang) then
          require("nvim-treesitter").install(lang):await(start_ts)
        else
          start_ts()
        end
      end,
    })
  end,
}
