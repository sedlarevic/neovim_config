local map = vim.keymap.set

-- disabled
map({'n', 'v', 'x', 'i'}, "<PageUp>", "<Nop>")
map({'n', 'v', 'x', 'i'}, "<PageDown>", "<Nop>")
map({'n', 'v', 'x', 'i'}, "<S-Right>", "<Nop>")

map({'n', 'v', 'x', 'i'}, "<S-PageUp>", "<Nop>")
map({'n', 'v', 'x', 'i'}, "<S-PageDown>", "<Nop>")

-- basic commands
map('n', '<leader>o', ':update<CR> :source<CR>', { desc = "Update and source" })
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>', { desc = "Copy to clipboard" })
map({ 'n', 'v' }, '<leader>d', '"_d', { desc = "Delete without yanking" })

-- useful commands
map('n', 'J', 'mzJ`z', { desc = "Join lines and keep cursor position" })
map('n', 'Y', 'y$', { desc = "Yank to EOL" })
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', '<C-d>', '<C-d>zz', { desc = "Traverse downwards, cursor on half page" })
map('n', '<C-u>', '<C-u>zz', { desc = "Traverse upwards, cursor on half page" })
map('v', '<', '<gv')
map('v', '>', '>gv')
map("n", "<leader>pa", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  print("file:", path)
end, { desc = "Copy filepath to clipboard" })
-- plugins
map('n', '<leader>f', ":Pick files<CR>", { desc = "Pick file" })
map('n', '<leader>h', ":Pick help<CR>", { desc = "Pick help" })
map('n', '<leader>-', ":Oil<CR>", { desc = "Oil" })
map("n", "H", require("arrow.persist").previous)
map("n", "L", require("arrow.persist").next)

