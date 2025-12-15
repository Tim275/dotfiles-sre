-- =============================================================================
-- PLUGIN: diffview.nvim
-- ABOUT : Bessere Git Diff Ansicht (wie in VS Code/IntelliJ)
-- =============================================================================

return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
    { "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git File History" },
    { "<leader>gH", "<cmd>DiffviewFileHistory<cr>", desc = "Git Branch History" },
    { "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Close Diff View" },
  },
  opts = {
    enhanced_diff_hl = true,
    view = {
      default = { layout = "diff2_horizontal" },
      merge_tool = { layout = "diff3_mixed" },
    },
    file_panel = {
      win_config = { position = "left", width = 35 },
    },
  },
}
