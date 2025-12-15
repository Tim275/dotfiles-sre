-- ================================================================================================
-- TITLE : lspsaga.nvim
-- ABOUT : Bessere LSP UI (Hover, Rename, Code Actions)
-- REPO  : https://github.com/glepnir/lspsaga.nvim
-- ================================================================================================

return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    ui = {
      border = "rounded",
      code_action = "💡",
    },
    lightbulb = {
      enable = false,
    },
    symbol_in_winbar = {
      enable = false,
    },
    finder = {
      keys = {
        toggle_or_open = "<CR>",
        quit = "q",
      },
    },
    definition = {
      keys = {
        edit = "<CR>",
        vsplit = "<C-v>",
        split = "<C-s>",
        quit = "q",
      },
    },
    rename = {
      in_select = false,
      keys = {
        quit = "<C-c>",
        exec = "<CR>",
      },
    },
  },
  keys = {
    { "gh", "<cmd>Lspsaga finder<cr>", desc = "LSP Finder" },
    { "gp", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek Definition" },
    { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition" },
    { "<leader>rn", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
    { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
    { "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<cr>", desc = "Line Diagnostics" },
    { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover Doc" },
    { "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev Diagnostic" },
    { "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic" },
    { "<leader>o", "<cmd>Lspsaga outline<cr>", desc = "Outline" },
  },
}
