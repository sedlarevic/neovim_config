return {
  "stevearc/oil.nvim",
  opts = {},
  config = function()
    require("oil").setup()

    local map = vim.keymap.set
    map('n', '<leader>-', ":Oil<CR>", { desc = "Oil" })
  end,
}
