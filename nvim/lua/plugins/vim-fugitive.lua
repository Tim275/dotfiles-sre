-- =============================================================================
-- TITLE : vim-fugitive
-- ABOUT : Git Wrapper - vollständige Git-Integration in Neovim
-- REPO  : https://github.com/tpope/vim-fugitive
-- =============================================================================

return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G", "Gdiff", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse" },
  keys = {
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git Status" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git Commit" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git Push" },
    { "<leader>gl", "<cmd>Git pull<cr>", desc = "Git Pull" },
    { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git Blame" },
    { "<leader>gd", "<cmd>Git diff<cr>", desc = "Git Diff" },
    { "<leader>gD", "<cmd>Git diff --staged<cr>", desc = "Git Diff Staged" },
  },
}
