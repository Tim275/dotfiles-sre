-- =============================================================================
-- PLUGIN: rustaceanvim
-- ABOUT : Enhanced Rust development (Tutorial 31:39)
-- =============================================================================

return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      -- LSP
      server = {
        on_attach = function(client, bufnr)
          -- Keymaps für Rust
          local opts = { buffer = bufnr, silent = true }

          vim.keymap.set("n", "<leader>ra", function()
            vim.cmd.RustLsp("codeAction")
          end, vim.tbl_extend("force", opts, { desc = "Rust Code Action" }))

          vim.keymap.set("n", "<leader>rd", function()
            vim.cmd.RustLsp("debuggables")
          end, vim.tbl_extend("force", opts, { desc = "Rust Debuggables" }))

          vim.keymap.set("n", "<leader>rr", function()
            vim.cmd.RustLsp("runnables")
          end, vim.tbl_extend("force", opts, { desc = "Rust Runnables" }))

          vim.keymap.set("n", "<leader>rt", function()
            vim.cmd.RustLsp("testables")
          end, vim.tbl_extend("force", opts, { desc = "Rust Testables" }))

          vim.keymap.set("n", "<leader>rm", function()
            vim.cmd.RustLsp("expandMacro")
          end, vim.tbl_extend("force", opts, { desc = "Rust Expand Macro" }))

          vim.keymap.set("n", "<leader>rc", function()
            vim.cmd.RustLsp("openCargo")
          end, vim.tbl_extend("force", opts, { desc = "Rust Open Cargo.toml" }))

          vim.keymap.set("n", "<leader>rp", function()
            vim.cmd.RustLsp("parentModule")
          end, vim.tbl_extend("force", opts, { desc = "Rust Parent Module" }))

          vim.keymap.set("n", "K", function()
            vim.cmd.RustLsp({ "hover", "actions" })
          end, vim.tbl_extend("force", opts, { desc = "Rust Hover" }))

          vim.keymap.set("n", "<leader>re", function()
            vim.cmd.RustLsp("explainError")
          end, vim.tbl_extend("force", opts, { desc = "Rust Explain Error" }))
        end,
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
            },
            checkOnSave = {
              command = "clippy",
            },
            procMacro = {
              enable = true,
            },
          },
        },
      },

      -- DAP
      dap = {
        adapter = {
          type = "executable",
          command = "lldb-vscode",
          name = "rt_lldb",
        },
      },
    }
  end,
}
