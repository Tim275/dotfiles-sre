-- =============================================================================
-- TITLE : nvim-tree.lua
-- ABOUT : A file explorer tree for Neovim, written in Lua.
-- LINKS :
--   > github : https://github.com/nvim-tree/nvim-tree.lua
-- =============================================================================

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",  -- Icons für Dateitypen
  },
  config = function()
    -- Setup devicons
    require("nvim-web-devicons").setup({
      default = true,
    })

    -- Remove background color from the NvimTree window (ui fix)
    vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])

    require("nvim-tree").setup({
      filters = {
        dotfiles = false,
      },
      view = {
        adaptive_size = true,
      },
    })
  end,
}
