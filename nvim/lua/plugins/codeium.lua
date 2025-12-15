-- ================================================================================================
-- TITLE : windsurf.nvim (Codeium)
-- ABOUT : AI Code Completion (Inline Autocomplete wie GitHub Copilot)
-- REPO  : https://github.com/Exafunction/windsurf.nvim
-- AUTH  : Nach Installation :Codeium Auth ausführen
-- ================================================================================================

return {
  "Exafunction/windsurf.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("codeium").setup({
      enable_cmp_source = true,
      virtual_text = {
        enabled = true,
        idle_delay = 75,
        default_filetype_enabled = true,
      },
    })
  end,
}
