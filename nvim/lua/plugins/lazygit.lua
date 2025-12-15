-- =============================================================================
-- PLUGIN: lazygit.nvim
-- ABOUT : Git UI popup in Neovim (<leader>lg)
-- =============================================================================

return {
  "kdheepak/lazygit.nvim",
  cmd = "LazyGit",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
  },
}
