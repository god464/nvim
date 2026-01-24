---@type LazyPluginSpec
return {
  "mistweaverco/kulala.nvim",
  ft = { "http", "rest" },
  keys = {
    { "<leader>Hs", desc = "Send request" },
    { "<leader>Ha", desc = "Send all requests" },
    { "<leader>Hb", desc = "Open scratchpad" },
  },
  opts = {
    global_keymaps = true,
    global_keymaps_prefix = "<leader>H",
    kulala_keymaps_prefix = "",
  },
}
