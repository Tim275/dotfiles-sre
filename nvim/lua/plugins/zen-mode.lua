-- =============================================================================
-- TITLE : zen-mode.nvim
-- ABOUT : Fokussiertes Arbeiten - blendet alles aus
-- REPO  : https://github.com/folke/zen-mode.nvim
-- =============================================================================

return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  keys = {
    { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" },
  },
  opts = {
    window = {
      width = 0.85,
      options = {
        number = false,
        relativenumber = false,
        signcolumn = "no",
        cursorline = false,
      },
    },
    plugins = {
      gitsigns = { enabled = false },
      tmux = { enabled = true },
    },
  },
}
