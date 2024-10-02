return {
  {
    "stevearc/overseer.nvim",
    opts = {},
    keys = {
      { "<leader>rr", "<cmd>OverseerRun<CR>", desc = "Run" },
      { "<leader>rl", "<cmd>OverseerToggle<CR>", desc = "List" },
      { "<leader>rn", "<cmd>OverseerBuild<CR>", desc = "New" },
      { "<leader>ra", "<cmd>OverseerTaskAction<CR>", desc = "Action" },
      { "<leader>ri", "<cmd>OverseerInfo<CR>", desc = "Info" },
      { "<leader>rc", "<cmd>OverseerClearCache<CR>", desc = "Clear cache" },
    },
  },
}
