local M = {}

M.on_attach = function(event)
  local client = vim.lsp.get_client_by_id(event.data.client_id)
  if not client then
    return
  end
  local bufnr = event.buf
  local keymap = vim.keymap.set
  local opts = {
    noremap = true,
    silent = true,
    buffer = bufnr,
  }

  -- Lspsaga keymaps
  keymap("n", "<leader>gd", "<cmd>Lspsaga peek_definition<CR>", opts)
  keymap("n", "<leader>gD", "<cmd>Lspsaga goto_definition<CR>", opts)
  keymap("n", "<leader>gS", "<cmd>vsplit | Lspsaga goto_definition<CR>", opts)
  keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opts)
  keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
  keymap("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)
  keymap("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", opts)
  keymap("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
  keymap("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
  keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)

  -- fzf-lua keymaps
  keymap("n", "<leader>fd", "<cmd>FzfLua lsp_finder<CR>", opts)
  keymap("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>", opts)
  keymap("n", "<leader>ft", "<cmd>FzfLua lsp_typedefs<CR>", opts)
  keymap("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", opts)
  keymap("n", "<leader>fS", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts)
  keymap("n", "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", opts)

  -- Order Imports (if supported)
  if client:supports_method("textDocument/codeAction", bufnr) then
    keymap("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        context = {
          only = { "source.organizeImports" },
          diagnostics = {},
        },
        apply = true,
        bufnr = bufnr,
      })
      vim.defer_fn(function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, 50)
    end, opts)
  end
end

return M
