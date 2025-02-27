return {
  "ibhagwan/fzf-lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = "FzfLua",
  opts = {
    winOpts = "rounded",
    files = { formatter = "path.filename_first" },
    hls = {
      normal = "NormalFloat",
      border = "FloatBorder",
      title = "FloatTitle",
      preview_normal = "NormalFloat",
      preview_border = "FloatBorder",
      preview_title = "FloatTitle",
    },
  },
  keys = {
    { "<Leader><Leader>f", "<cmd>FzfLua files<CR>", desc = "Search File" },
    { "<Leader><Leader>B", "<cmd>FzfLua buffers<CR>", desc = "Search Buffer" },
    { "<Leader><Leader>k", "<cmd>FzfLua keymaps<CR>", desc = "Search Keymaps" },
    { "<Leader><Leader>t", "<cmd>TodoFzfLua<CR>", desc = "Search TODO" },
    { "<Leader><Leader>m", "<cmd>Noice pick<CR>", desc = "Search messages" },
    { "<Leader><Leader>g", "<cmd>FzfLua live_grep_native<CR>", desc = "Grep string" },
    { "<Leader><Leader>s", "<cmd>FzfLua lsp_document_symbols<CR>", desc = "Search Document Symbols" },
    { "<Leader><Leader>r", "<cmd>FzfLua zoxide<CR>", desc = "Search recent directories" },
  },
}
