-- =============================================================================
-- PLUGIN: todo-comments.nvim
-- ABOUT : Highlight TODOs, FIXMEs, HACKs im Code
-- =============================================================================

return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = {
    signs = true,
    keywords = {
      FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
      TODO = { icon = " ", color = "info" },
      HACK = { icon = " ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "󰅒 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
      TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
  },
  keys = {
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "Find TODOs" },
    { "<leader>fT", "<cmd>TodoTrouble<cr>", desc = "TODOs in Trouble" },
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next TODO" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev TODO" },
  },
}
