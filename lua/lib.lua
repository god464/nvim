---@class lib
local M = {}

---@param exe string
---@param rel_path string
---@param fallback string
---@return string
local function resolve_path(exe, rel_path, fallback)
  local path = vim.fs.root(vim.fn.exepath(exe), "bin") .. rel_path
  return vim.uv.fs_stat(path) and path or fallback
end

---@return string
function M.get_vue_ts_plugin()
  return resolve_path(
    "vue-language-server",
    "/lib/language-tools/packages/language-server/",
    "/usr/lib/language-tools/packages/language-server"
  )
end

---@return string
function M.get_astro_ts_plugin()
  return resolve_path(
    "astro-ls",
    "/lib/node_modules/astro-language-server/packages/language-tools/ts-plugin/dist/",
    "/usr/lib/node_modules/@astrojs/ts-plugin/dist/"
  )
end

---@return string
function M.get_astro_tsdk()
  return resolve_path("tsc", "/lib/node_modules/typescript/lib", "/usr/lib/node_modules/typescript/lib/")
end

return M
