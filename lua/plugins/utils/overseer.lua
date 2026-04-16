local function register_template(name, filetype, cmd, args)
  return {
    name = name,
    builder = function()
      return {
        cmd = { cmd },
        args = args(),
      }
    end,
    condition = { filetype = { filetype } },
  }
end

---@type LazyPluginSpec
return {
  "stevearc/overseer.nvim",
  dependencies = { "ibhagwan/fzf-lua", "rcarriga/nvim-notify" },
  cmd = {
    "OverseerToggle",
    "OverseerRun",
    "OverseerBuild",
    "OverseerInfo",
    "OverseerTaskAction",
    "OverseerClearCache",
  },
  keys = {
    { "<leader>Rr", "<cmd>OverseerRun<CR>", desc = "Run" },
    { "<leader>Rl", "<cmd>OverseerToggle<CR>", desc = "List" },
    { "<leader>Rn", "<cmd>OverseerBuild<CR>", desc = "New" },
    { "<leader>Ra", "<cmd>OverseerTaskAction<CR>", desc = "Action" },
    { "<leader>Ri", "<cmd>OverseerInfo<CR>", desc = "Info" },
    { "<leader>Rc", "<cmd>OverseerClearCache<CR>", desc = "Clear cache" },
  },
  ---@module 'overseer'
  ---@type overseer.Config
  opts = {
    dap = false,
    strategy = "toggleterm",
  },
  config = function(_, opts)
    local overseer = require("overseer")
    overseer.setup(opts)

    local templates = {
      register_template(
        "compile single c file",
        "c",
        "cc",
        function() return { "-g", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:t:r") } end
      ),
      register_template(
        "compile single cpp file",
        "cpp",
        "c++",
        function() return { "-g", vim.fn.expand("%:p"), "-o", vim.fn.expand("%:p:t:r") } end
      ),
      register_template(
        "compile typst to pdf",
        "typst",
        "typst",
        function() return { "compile", vim.fn.expand("%:p") } end
      ),
    }

    for _, template in ipairs(templates) do
      overseer.register_template(template)
    end
  end,
}
