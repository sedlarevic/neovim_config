return {
  "monaqa/dial.nvim",
  keys = {
    { "+", function() require("dial.map").manipulate("increment", "normal") end, mode = "n", desc = "Increment" },
    { "-", function() require("dial.map").manipulate("decrement", "normal") end, mode = "n", desc = "Decrement" },
    { "+", function() require("dial.map").manipulate("increment", "visual") end, mode = "v", desc = "Increment (Visual)" },
    { "-", function() require("dial.map").manipulate("decrement", "visual") end, mode = "v", desc = "Decrement (Visual)" },
  },
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,  -- 1, 2, 3...
        augend.integer.alias.hex,      -- 0x1a, 0x0f...
        augend.date.alias["%Y/%m/%d"], -- 2026/08/14
        augend.constant.alias.bool,    -- true <-> false
        augend.semver.alias.semver,    -- 1.0.0 <-> 1.0.1
      },
    })
  end,
}
