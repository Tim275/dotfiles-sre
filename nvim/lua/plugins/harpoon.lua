-- =============================================================================
-- PLUGIN: harpoon
-- ABOUT : Quick file navigation - spring zwischen 4 Dateien INSTANT
-- =============================================================================
-- DAS ist der Productivity-Boost für DevOps:
-- Du arbeitest immer mit den gleichen 3-4 Dateien:
--   1. main.go / main.py
--   2. Dockerfile
--   3. deployment.yaml
--   4. values.yaml
-- Mit Harpoon: Ctrl+1/2/3/4 = INSTANT switch!

return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")
    harpoon:setup({
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    })

    -- Keymaps
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end,
      { desc = "Harpoon Add File" })
    vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = "Harpoon Menu" })

    -- Quick Jump zu File 1-4 (OHNE Leader!)
    vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end,
      { desc = "Harpoon File 1" })
    vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end,
      { desc = "Harpoon File 2" })
    vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end,
      { desc = "Harpoon File 3" })
    vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end,
      { desc = "Harpoon File 4" })

    -- Alternative mit Leader
    vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end,
      { desc = "Harpoon File 1" })
    vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end,
      { desc = "Harpoon File 2" })
    vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end,
      { desc = "Harpoon File 3" })
    vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end,
      { desc = "Harpoon File 4" })

    -- Next/Previous (]h / [h = vim-style navigation)
    vim.keymap.set("n", "]h", function() harpoon:list():next() end,
      { desc = "Harpoon Next" })
    vim.keymap.set("n", "[h", function() harpoon:list():prev() end,
      { desc = "Harpoon Previous" })
  end,
}
