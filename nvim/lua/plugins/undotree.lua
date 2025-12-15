-- =============================================================================
-- PLUGIN: undotree
-- ABOUT : Visualisiere deine Undo-History als Baum
-- =============================================================================
-- Nie wieder "Mist, ich hab zu viel ge-undone!"
-- Sieh ALLE Änderungen und spring zu jedem Punkt.

return {
  "mbbill/undotree",
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Undo Tree" },
  },
  config = function()
    vim.g.undotree_WindowLayout = 2
    vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SetFocusWhenToggle = 1
  end,
}
