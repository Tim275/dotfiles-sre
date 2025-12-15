-- ================================================================================================
-- TITLE : vim-tmux-navigator
-- ABOUT : Seamless Navigation zwischen Neovim und TMUX Panes
-- REPO  : https://github.com/christoomey/vim-tmux-navigator
-- ================================================================================================

return {
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
  },
  keys = {
    { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate Left" },
    { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate Down" },
    { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate Up" },
    { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate Right" },
  },
}
