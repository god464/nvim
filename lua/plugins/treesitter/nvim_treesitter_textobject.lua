return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  dependencies = "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  opts = { select = { lookahead = true, include_surrounding_whitespace = true }, move = { set_jumps = true } },
  keys = function()
    local ts = vim._defer_require("nvim-treesitter-textobjects", {
      repeatable_move = {},
      select = {},
      move = {},
    })

    return {
      {
        "f",
        function() return ts.repeatable_move.builtin_f_expr() end,
        expr = true,
        mode = { "n", "x", "o" },
        desc = "Move to next char",
      },
      {
        "F",
        function() return ts.repeatable_move.builtin_F_expr() end,
        expr = true,
        mode = { "n", "x", "o" },
        desc = "Move to prev char",
      },
      {
        "t",
        function() return ts.repeatable_move.builtin_t_expr() end,
        expr = true,
        mode = { "n", "x", "o" },
        desc = "Move before next char",
      },
      {
        "T",
        function() return ts.repeatable_move.builtin_T_expr() end,
        expr = true,
        mode = { "n", "x", "o" },
        desc = "Move before prev char",
      },
    }
  end,
}
