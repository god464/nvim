return {
  "rcarriga/nvim-notify",
  opts = { timeout = 1500 },
  config = function(_, opts)
    local nvim_notify = require("notify")
    nvim_notify.setup(opts)

    vim.notify = nvim_notify
  end,
}
