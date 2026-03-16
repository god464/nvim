---@type LazyPluginSpec
return {
  "dnlhc/glance.nvim",
  cmd = "Glance",
  opts = {},
  keys = {
    { "gd", mode = "n", "<CMD>Glance definitions<CR>", "Glance definitions" },
    { "gr", mode = "n", "<CMD>Glance references<CR>", "Glance references" },
    { "gy", mode = "n", "<CMD>Glance type_definitions<CR>", "Glance type_definitions" },
    { "gi", mode = "n", "<CMD>Glance implementations<CR>", "Glance implementation" },
  },
}
