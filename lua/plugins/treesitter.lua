return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "c",
        "cpp",
        "c_sharp",
        "cmake",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "python",
        "bash",
        "json",
        "markdown",
        "markdown_inline",
      },

      sync_install = false,
      auto_install = false,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = false,
      },
    })
  end,
}
