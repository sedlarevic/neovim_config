return {
  "christoomey/vim-tmux-navigator",

  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
    "TmuxNavigatorProcessList",
  },

  keys = {
    { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<CR>", desc = "Navigate left" },
    { "<C-j>", "<cmd><C-U>TmuxNavigateDown<CR>", desc = "Navigate down" },
    { "<C-k>", "<cmd><C-U>TmuxNavigateUp<CR>", desc = "Navigate up" },
    { "<C-l>", "<cmd><C-U>TmuxNavigateRight<CR>", desc = "Navigate right" },
    { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<CR>", desc = "Navigate previous" },
  },
}
