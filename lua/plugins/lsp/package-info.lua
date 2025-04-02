---@type LazyPluginSpec
return {
  "vuki656/package-info.nvim",
  event = "BufRead package.json",
  dependencies = "MunifTanjim/nui.nvim",
  opts = { package_manager = "pnpm" },
}
