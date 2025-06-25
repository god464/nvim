---@type LazyPluginSpec
return {
  "Exafunction/windsurf.nvim",
  main = "codeium",
  cmd = "Codeium",
  event = "InsertEnter",
  build = ":Codeium Auth",
  opts = {
    enable_cmp_source = false,
    virtual_text = { enabled = true, key_bindings = { accept = false, next = "<M-]>", prev = "<M-[>" } },
  },
}
