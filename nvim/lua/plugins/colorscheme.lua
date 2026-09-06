return {
  "miikanissi/modus-themes.nvim",
  priority = 1000,

  config = function()
    require("modus-themes").setup({
      style = "auto",

      on_highlights = function(hl, c)
        hl.cDefine = { fg = c.magenta }
        hl["@lsp.type.macro.cpp"] = { fg = "#7db0ff" }
        hl["@lsp.typemod.macro.declaration.cpp"] = { fg = "#7db0ff" }
        hl["@lsp.typemod.macro.globalScope.cpp"] = { fg = "#7db0ff" }
      end,
    })

    vim.cmd.colorscheme("modus")
  end,
}


--[[return {
  "ficcdaf/ashen.nvim",
  -- optional but recommended,
  -- pin to the latest stable release:
  tag = "*",
  lazy = false,
  priority = 1000,
  -- configuration is optional!
  opts = {
    -- your settings here
  },
  config = function()
    vim.cmd("colorscheme ashen")
  end
}--]]

--[[return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    -- wave / lotus / dragon
    vim.cmd("colorscheme kanagawa-wave")
  end,
}--]]
