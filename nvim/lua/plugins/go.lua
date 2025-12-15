-- =============================================================================
-- PLUGIN: go.nvim
-- ABOUT : Enhanced Go development (wie rustaceanvim für Rust)
-- =============================================================================

return {
  "ray-x/go.nvim",
  dependencies = {
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  ft = { "go", "gomod", "gowork", "gotmpl" },
  build = ':lua require("go.install").update_all_sync()',
  config = function()
    require("go").setup({
      -- LSP
      lsp_cfg = false,  -- Wir nutzen unseren eigenen gopls Server
      lsp_gofumpt = true,
      lsp_keymaps = false,

      -- Formatting
      lsp_document_formatting = true,
      gofmt = "gofumpt",
      goimports = "gopls",

      -- Testing
      test_runner = "go",
      run_in_floaterm = true,

      -- Diagnostics
      diagnostic = {
        hdlr = true,
        underline = true,
        virtual_text = { space = 0, prefix = "■" },
        signs = true,
        update_in_insert = false,
      },

      -- Icons
      icons = { breakpoint = "🔴", currentpos = "👉" },

      -- DAP Debugging
      dap_debug = true,
      dap_debug_gui = true,
    })
  end,
  keys = {
    -- Run & Test
    { "<leader>gr", "<cmd>GoRun<cr>", desc = "Go Run", ft = "go" },
    { "<leader>gt", "<cmd>GoTest<cr>", desc = "Go Test", ft = "go" },
    { "<leader>gtf", "<cmd>GoTestFunc<cr>", desc = "Go Test Function", ft = "go" },
    { "<leader>gtc", "<cmd>GoCoverage<cr>", desc = "Go Coverage", ft = "go" },

    -- Code Actions
    { "<leader>gie", "<cmd>GoIfErr<cr>", desc = "Go If Err", ft = "go" },
    { "<leader>gfs", "<cmd>GoFillStruct<cr>", desc = "Go Fill Struct", ft = "go" },
    { "<leader>gat", "<cmd>GoAddTag<cr>", desc = "Go Add Tags", ft = "go" },
    { "<leader>grt", "<cmd>GoRmTag<cr>", desc = "Go Remove Tags", ft = "go" },

    -- Generate
    { "<leader>gim", "<cmd>GoImpl<cr>", desc = "Go Implement Interface", ft = "go" },
    { "<leader>gcm", "<cmd>GoCmt<cr>", desc = "Go Generate Comment", ft = "go" },

    -- Debug
    { "<leader>gdb", "<cmd>GoDebug<cr>", desc = "Go Debug", ft = "go" },
    { "<leader>gdt", "<cmd>GoDebug -t<cr>", desc = "Go Debug Test", ft = "go" },
  },
}
