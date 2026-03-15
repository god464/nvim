---@type LazyPluginSpec
return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = {
    { "<leader>hs", desc = "Send request" },
    { "<leader>ha", desc = "Send all requests" },
    { "<leader>hb", desc = "Open scratchpad" },
  },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = "<leader>h",
    kulala_keymaps_prefix = "",
  },
}
