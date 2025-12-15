-- =============================================================================
-- PLUGIN: Python Development Tools
-- ABOUT : Venv Selector + Python DAP Debugging
-- =============================================================================

return {
  -- Virtual Environment Selector
  {
    "linux-cultist/venv-selector.nvim",
    branch = "regexp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    ft = "python",
    keys = {
      { "<leader>pv", "<cmd>VenvSelect<cr>", desc = "Python Venv Select", ft = "python" },
      { "<leader>pc", "<cmd>VenvSelectCached<cr>", desc = "Python Venv Cached", ft = "python" },
    },
    config = function()
      require("venv-selector").setup({
        name = { "venv", ".venv", "env", ".env" },
        auto_refresh = true,
      })
    end,
  },

  -- Python Debug Adapter
  {
    "mfussenegger/nvim-dap-python",
    dependencies = { "mfussenegger/nvim-dap" },
    ft = "python",
    config = function()
      -- Versuche debugpy zu finden
      local debugpy_path = vim.fn.exepath("python3")
      if debugpy_path ~= "" then
        require("dap-python").setup(debugpy_path)
      end

      -- Test Runner
      require("dap-python").test_runner = "pytest"
    end,
    keys = {
      { "<leader>ptm", function() require("dap-python").test_method() end, desc = "Python Test Method", ft = "python" },
      { "<leader>ptc", function() require("dap-python").test_class() end, desc = "Python Test Class", ft = "python" },
      { "<leader>pds", function() require("dap-python").debug_selection() end, desc = "Python Debug Selection", ft = "python", mode = "v" },
    },
  },
}
