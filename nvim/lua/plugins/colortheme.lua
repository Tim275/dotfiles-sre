-- =============================================================================
-- TITLE : Colorscheme
-- ABOUT : Duskfox - ein schönes Theme aus dem nightfox.nvim Paket
-- REPO  : https://github.com/EdenEast/nightfox.nvim
-- =============================================================================

return {
  {
    "xiyaowong/nvim-transparent",
    lazy = false,
    priority = 999,
  },

  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local palette = require("nightfox.palette").load("duskfox")

      require("nightfox").setup({
        options = {
          transparent = true,
        },
        groups = {
          duskfox = {
            Visual = { bg = palette.bg1 },
          },
        },
      })

      vim.cmd("colorscheme duskfox")
    end,
  },
}
