return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  enabled = false,
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
    default_sources = "last",
    popup_border_style = "rounded",
    sources = { "git_status", "document_symbols" },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function() require("neo-tree.command").execute({ action = "close" }) end,
      },
    },
    close_if_last_window = true,
    open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
    source_selector = {
      winbar = true,
      sources = {
        { source = "document_symbols", display_name = " Symbols" },
        { source = "git_status", display_name = "  Git" },
      },
    },
    default_component_configs = {
      symlink_target = { enabled = true },
      indent = { with_expanders = true, expander_highlight = "NeoTreeExpander" },
    },
    window = {
      width = math.max(math.floor(vim.go.columns * 0.2), 30),
      mappings = {
        ["<Space>"] = "none",
        ["/"] = "none",
        ["l"] = "open",
        ["h"] = "close_node",
        ["<Tab>"] = { "toggle_preview", config = { use_image_vim = true } },
      },
    },
  },
  keys = { { "<leader>op", "<cmd>Neotree toggle<cr>", desc = "File Explorer" } },
}
