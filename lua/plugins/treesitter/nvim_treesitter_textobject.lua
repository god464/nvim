---@type LazyPluginSpec
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  opts = { select = { lookahead = true, include_surrounding_whitespace = true }, move = { set_jumps = true } },
  keys = {
    goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
    goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
    goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
    goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
  },
}
