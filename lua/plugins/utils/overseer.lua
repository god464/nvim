---@type LazyPluginSpec
return {
  "stevearc/overseer.nvim",
  dependencies = { "ibhagwan/fzf-lua", "rcarriga/nvim-notify" },
  cmd = {
    "OverseerToggle",
    "OverseerRun",
    "Overseerbuild",
    "OverseerInfo",
    "OverseerTaskAction",
    "OverseerClearCache",
  },
  keys = {
    { "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Run" },
    { "<leader>rl", "<cmd>OverseerToggle<CR>", desc = "List" },
    { "<leader>rn", "<cmd>OverseerBuild<CR>", desc = "New" },
    { "<leader>ra", "<cmd>OverseerTaskAction<CR>", desc = "Action" },
    { "<leader>ri", "<cmd>OverseerInfo<CR>", desc = "Info" },
    { "<leader>rc", "<cmd>OverseerClearCache<CR>", desc = "Clear cache" },
  },
  opts = {
    dap = false,
    form = { border = "rounded" },
    confirm = { border = "rounded" },
    task_win = { border = "rounded" },
    strategy = "toggleterm",
  },
  config = function(_, opts)
    local overseer = require("overseer")
    overseer.setup(opts)

    local templates = {
      {
        name = "compile single c file",
        builder = function()
          return {
            cmd = { "cc" },
            args = { "-g", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:t:r") },
          }
        end,
        condition = { filetype = { "c" } },
      },
      {
        name = "compile single cpp file",
        builder = function()
          return {
            cmd = { "c++" },
            args = { "-g", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:t:r") },
          }
        end,
        condition = { filetype = { "cpp" } },
      },
      {
        name = "compile typst to pdf",
        builder = function()
          return {
            cmd = { "typst" },
            args = { "compile", vim.fn.expand("%:p") },
          }
        end,
        condition = { filetype = { "typst" } },
      },
    }

    for _, template in ipairs(templates) do
      overseer.register_template(template)
    end
  end,
}
