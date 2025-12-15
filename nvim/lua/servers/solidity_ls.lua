-- ================================================================================================
-- TITLE : solidity_ls (Solidity Language Server)
-- ABOUT : LSP für Solidity/Blockchain Development (Ethereum Smart Contracts)
-- REPO  : https://github.com/NomicFoundation/hardhat-vscode
-- INSTALL: npm install -g @nomicfoundation/solidity-language-server
-- ================================================================================================

return function(capabilities)
  vim.lsp.config("solidity_ls_nomicfoundation", {
    capabilities = capabilities,
    cmd = { "nomicfoundation-solidity-language-server", "--stdio" },
    filetypes = { "solidity" },
    root_markers = { ".git", "hardhat.config.js", "hardhat.config.ts", "foundry.toml" },
    single_file_support = true,
  })
end
