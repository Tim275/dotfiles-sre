-- =============================================================================
-- PLUGIN: flash.nvim
-- ABOUT : Spring zu jedem Wort mit 2-3 Tasten
-- =============================================================================
-- Drück 's', tippe 2 Buchstaben, spring dahin.
-- VIEL schneller als h/j/k/l spam!

return {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    labels = "asdfghjklqwertyuiopzxcvbnm",
    search = {
      multi_window = true,
      forward = true,
      wrap = true,
    },
    jump = {
      jumplist = true,
      pos = "start",
      autojump = false,
    },
    label = {
      uppercase = false,
      rainbow = { enabled = true, shade = 5 },
    },
    modes = {
      search = { enabled = true },
      char = { enabled = true },
      treesitter = { labels = "asdfghjklqwertyuiopzxcvbnm" },
    },
  },
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash Jump" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Flash Remote" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Flash Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
