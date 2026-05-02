return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",

  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Match cursors
    set({ "n", "x" }, "<C-n>", function()
      mc.matchAddCursor(1)
    end, { desc = "MC next match" })

    set({ "n", "x" }, "<C-p>", function()
      mc.matchAddCursor(-1)
    end, { desc = "MC previous match" })

    -- Skip matches
    set({ "n", "x" }, "<C-s>", function()
      mc.matchSkipCursor(1)
    end, { desc = "MC skip next" })

    set({ "n", "x" }, "<C-S-s>", function()
      mc.matchSkipCursor(-1)
    end, { desc = "MC skip previous" })

    -- Vertical cursors
    set({ "n", "x" }, "<C-j>", function()
      mc.lineAddCursor(1)
    end, { desc = "MC cursor below" })

    set({ "n", "x" }, "<C-k>", function()
      mc.lineAddCursor(-1)
    end, { desc = "MC cursor above" })

    -- Clear cursors
    mc.addKeymapLayer(function(layerSet)
      layerSet("n", "<Esc>", mc.clearCursors)
    end)

    -- Highlight
    local hl = vim.api.nvim_set_hl
    hl(0, "MultiCursorCursor", { reverse = true })
    hl(0, "MultiCursorVisual", { link = "Visual" })
    hl(0, "MultiCursorMatchPreview", { link = "Search" })
  end,
}
