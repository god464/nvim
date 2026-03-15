local map = vim.keymap.set

for _, mapping in ipairs({
  { "<C-Down>", "<cmd>resize -2<cr>", "Decrease Window Height" },
  { "<C-Left>", "<cmd>vertical resize -2<cr>", "Decrease Window Width" },
  { "<C-Right>", "<cmd>vertical resize +2<cr>", "Increase Window Width" },
  { "<C-Up>", "<cmd>resize +2<cr>", "Increase Window Height" },
}) do
  map("n", mapping[1], mapping[2], { desc = mapping[3] })
end

for _, mapping in ipairs({
  { "<C-h>", "<C-w>h", "Go to Left Window" },
  { "<C-j>", "<C-w>j", "Go to Lower Window" },
  { "<C-k>", "<C-w>k", "Go to Upper Window" },
  { "<C-l>", "<C-w>l", "Go to Right Window" },
}) do
  map("n", mapping[1], mapping[2], { desc = mapping[3], remap = true })
end

for _, mapping in ipairs({
  { { "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", "Down" },
  { { "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", "Up" },
}) do
  map(mapping[1], mapping[2], mapping[3], { desc = mapping[4], expr = true, silent = true })
end

for _, mapping in ipairs({
  { "n", "n", "'Nn'[v:searchforward].'zv'", "Next Search Result" },
  { "n", "N", "'nN'[v:searchforward].'zv'", "Prev Search Result" },
  { "o", "n", "'Nn'[v:searchforward]", "Next Search Result" },
  { "o", "N", "'nN'[v:searchforward]", "Prev Search Result" },
  { "x", "n", "'Nn'[v:searchforward]", "Next Search Result" },
  { "x", "N", "'nN'[v:searchforward]", "Prev Search Result" },
}) do
  map(mapping[1], mapping[2], mapping[3], { expr = true, desc = mapping[4] })
end
