return {
  "p00f/clangd_extensions.nvim",
  ft = { "c", "cpp" },
  opts = {
    inlay_hints = { inline = true },
    memory_usage = { border = "rounded" },
    symbol_info = { border = "rounded" },
  },
  config = function(opts)
    require("clangd_extensions").setup(opts)

    local group = vim.api.nvim_create_augroup("clangd_extesnion", { clear = true })

    vim.api.nvim_create_autocmd("Filetype", {
      group = group,
      desc = "Setup clangd_extension scores for cmp",
      pattern = "c,cpp",
      callback = function()
        local cmp = require("cmp")
        cmp.setup.buffer({
          sorting = {
            comparators = {
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.recently_used,
              require("clangd_extensions.cmp_scores"),
              cmp.config.compare.kind,
              cmp.config.compare.sort_text,
              cmp.config.compare.length,
              cmp.config.compare.order,
            },
          },
        })
      end,
    })
  end,
}
