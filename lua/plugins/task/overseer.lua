return {
  "stevearc/overseer.nvim",
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
  config = function()
    local overseer = require("overseer")
    overseer.setup()

    local templates = {
      {
        name = "compile single c file",
        builder = function()
          return {
            cmd = { "gcc" },
            args = { "-g", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:t:r") },
          }
        end,
        condition = { filetype = { "c" } },
      },
      {
        name = "compile single c file",
        builder = function()
          return {
            cmd = { "g++" },
            args = { "-g", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:t:r") },
          }
        end,
        condition = { filetype = { "cpp" } },
      },
    }

    for _, template in ipairs(templates) do
      overseer.register_template(template)
    end
  end,
}
