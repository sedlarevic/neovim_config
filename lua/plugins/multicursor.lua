return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",

  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local map = vim.keymap.set

    -- Add cursor to matches
    map({ "n", "x" }, "<leader>mn", function()
      mc.matchAddCursor(1)
    end, { desc = "MC add next match" })

    map({ "n", "x" }, "<leader>mN", function()
      mc.matchAddCursor(-1)
    end, { desc = "MC add previous match" })

    -- Skip matches
    map({ "n", "x" }, "<leader>ms", function()
      mc.matchSkipCursor(1)
    end, { desc = "MC skip next match" })

    map({ "n", "x" }, "<leader>mS", function()
      mc.matchSkipCursor(-1)
    end, { desc = "MC skip previous match" })

    -- Vertical cursors
    map({ "n", "x" }, "<leader>mj", function()
      mc.lineAddCursor(1)
    end, { desc = "MC add cursor below" })

    map({ "n", "x" }, "<leader>mk", function()
      mc.lineAddCursor(-1)
    end, { desc = "MC add cursor above" })

    -- Add cursors to every match
    map({ "n", "x" }, "<leader>ma", mc.matchAllAddCursors, {
      desc = "MC add all matches",
    })

    mc.addKeymapLayer(function(layer_set)
      layer_set({ "n", "x" }, "<Esc>", mc.clearCursors)
    end)

    vim.api.nvim_set_hl(0, "MultiCursorCursor", { reverse = true })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorMatchPreview", { link = "Search" })
  end,
}
