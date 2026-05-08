return {
  "NStefan002/visual-surround.nvim",

  config = function()
    local vs = require("visual-surround")

    vs.setup({
      use_default_keymaps = false,
    })

    local surround = vs.surround

    local surround_chars = {
      "{",
      "[",
      "(",
      "<",
      '"',
      "'",
    }

    for _, char in ipairs(surround_chars) do
      vim.keymap.set("x", "S" .. char, function()
        surround(char)
      end, {
        desc = "[visual-surround] Surround with " .. char,
      })
    end
  end,
}
