local map = vim.keymap.set

-- disabled
map({ 'n', 'v', 'x', 'i' }, "<PageUp>", "<Nop>")
map({ 'n', 'v', 'x', 'i' }, "<PageDown>", "<Nop>")
map({ 'n', 'v', 'x', 'i' }, "<S-Right>", "<Nop>")

map({ 'n', 'v', 'x', 'i' }, "<S-PageUp>", "<Nop>")
map({ 'n', 'v', 'x', 'i' }, "<S-PageDown>", "<Nop>")

-- basic commands
map('n', '<leader>o', ':update<CR> :source<CR>', { desc = "Update and source" })
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>', { desc = "Copy to clipboard" })
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = "Delete without yanking" })
map('n', 'U', '<C-r>', { noremap = true, desc = "Redo" })

-- movement
map({ "n", "v" }, "gh", "0", { desc = "Line begin" })
map({ "n", "v" }, "gl", "$", { desc = "Line end" })
map({ "n", "v" }, "gk", "gg", { desc = "Buffer top" })
map({ "n", "v" }, "gj", "G", { desc = "Buffer bottom" })
map({ "n", "v" }, "gs", "^", { desc = "First char of line" })
map({ "n", "v" }, "gn", "%", { desc = "Match next (){}[] in line" })
--map({ "n", "v" }, "ga", "<C-^>", { desc = "Goto previous buffer" })
map('n', '<C-d>', '<C-d>zz', { desc = "Traverse downwards, cursor on half page" })
map('n', '<C-u>', '<C-u>zz', { desc = "Traverse upwards, cursor on half page" })
map('n', 'n', 'nzzzv', { desc = "Next iteration of a word on cursor" })
map('n', 'N', 'Nzzzv', { desc = "Previous iteration of a word on cursor" })


-- useful commands
map('n', 'Y', 'y$', { desc = "Yank to EOL" })
map('v', '<', '<gv', { desc = "Indent selected chunk of text" })
map('v', '>', '>gv', { desc = "Outdent selected chunk of text" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected chunk of text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected chunk of text up" })
map("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end, { desc = "Copy filepath to clipboard" })
-- plugins
-- oil
map('n', '<leader>-', ":Oil<CR>", { desc = "Oil" })
