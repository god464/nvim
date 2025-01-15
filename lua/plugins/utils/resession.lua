return {
  "stevearc/resession.nvim",
  event = "VeryLazy",
  opts = { autosave = { enabled = true } },
  config = function(_, opts)
    local resession = require("resession")
    resession.setup(opts)

    vim.api.nvim_create_autocmd("VimLeavePre", { callback = function() resession.save("last") end })
  end,
}
