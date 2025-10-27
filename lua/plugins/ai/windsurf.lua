---@type LazyPluginSpec
return {
  "Exafunction/windsurf.nvim",
  main = "codeium",
  enabled = false,
  cmd = "Codeium",
  event = "InsertEnter",
  build = ":Codeium Auth",
  opts = {
    enable_cmp_source = false,
    virtual_text = { enabled = true, key_bindings = { next = "<M-]>", prev = "<M-[>" } },
  },
}
