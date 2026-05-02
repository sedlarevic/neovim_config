return {
  "echasnovski/mini.pick",
  version = false,

  keys = {
    { "<leader>ff", "<cmd>Pick files<cr>", desc = "Pick Find files" },
    { "<leader>fg", "<cmd>Pick grep_live<cr>", desc = "Pick Live grep" },
    { "<leader>fb", "<cmd>Pick buffers<cr>", desc = "Pick Buffers" },
    { "<leader>fh", "<cmd>Pick help<cr>", desc = "Pick Help" },
  },

  config = function()
    require("mini.pick").setup({
      mappings = {
        move_down = "<C-j>",
        move_up = "<C-k>",

        choose = "<CR>",
        stop = "<Esc>",

        scroll_down = "<S-j>",
        scroll_up = "<S-k>",
      },

      window = {
        config = {
          border = "single",
        },
      },
    })
  end,
}
