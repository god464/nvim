return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("load_neo_tree", {}),
      desc = "Loads neo-tree when openning a directory",
      callback = function(args)
        local stats = vim.uv.fs_stat(args.file)

        if not stats or stats.type ~= "directory" then return end
        require("neo-tree")
        return true
      end,
    })
  end,
  opts = {
    close_if_last_window = true,
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    source_selector = {
      winbar = true,
      sources = {
        { source = "filesystem" },
        { source = "buffers", display_name = "  Bufs" },
        { source = "git_status", display_name = "  Git" },
        { source = "document_symbols", display_name = "  Symbols" },
      },
    },
    filesystem = { follow_current_file = { enabled = true }, use_libuv_file_watcher = true },
    default_component_configs = {
      symlink_target = { enabled = true },
      indent = { with_expanders = true, expander_highlight = "NeoTreeExpander" },
    },
    window = {
      width = math.max(math.floor(vim.go.columns * 0.2), 30),
      mappings = { ["<Space>"] = "none", ["/"] = "none", ["l"] = "open", ["<Tab>"] = "open", ["h"] = "close_node" },
    },
  },
  keys = { { "<leader>op", "<cmd>Neotree toggle<cr>", desc = "File Explorer" } },
}
