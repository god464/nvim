---@type LazyPluginSpec
return {
  "stevearc/oil.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = "Oil",
  keys = { { "<Leader>o-", "<cmd>Oil<cr>", desc = "Oil" } },
  opts = {
    columns = { "permissions", "size", "icon", "mtime" },
    win_options = { signcolumn = "yes" },
    skip_confirm_for_simple_edits = true,
    cleanup_delay_ms = false,
    float = { border = "rounded" },
    preview = { border = "rounded" },
    progress = { border = "rounded" },
    lsp_file_methods = { autosave_changes = "unmodified" },
    keymaps = { ["l"] = "actions.select", ["h"] = "actions.parent" },
  },
  config = function(_, opts)
    require("oil").setup(opts)
    vim.api.nvim_create_autocmd("User", {
      pattern = "OilActionsPost",
      callback = function(event)
        if event.data.actions.type == "move" then
          require("snacks").rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
        end
      end,
    })
  end,
}
