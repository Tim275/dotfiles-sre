-- =============================================================================
-- TITLE : noice.nvim
-- ABOUT : Nur für schöne LSP Docs - Cmdline/Messages klassisch
-- REPO  : https://github.com/folke/noice.nvim
-- =============================================================================

return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- Cmdline & Messages DEAKTIVIERT (klassisch unten)
    cmdline = { enabled = false },
    messages = { enabled = false },
    popupmenu = { enabled = false },

    -- Nur LSP Verbesserungen behalten
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = { enabled = true },
      signature = { enabled = true },
    },
    presets = {
      lsp_doc_border = true,
    },
  },
}
