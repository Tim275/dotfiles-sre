-- =============================================================================
-- TITLE : which-key.nvim
-- ABOUT : Zeigt verfügbare Keymaps während du tippst
-- REPO  : https://github.com/folke/which-key.nvim
-- =============================================================================

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps",
    },
  },
}
