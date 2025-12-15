-- ================================================================================================
-- TITLE : clangd (C/C++ Language Server)
-- ABOUT : LSP für C und C++ Development
-- REPO  : https://clangd.llvm.org/
-- INSTALL: brew install llvm (enthält clangd)
-- ================================================================================================

return function(capabilities)
  vim.lsp.config("clangd", {
    capabilities = capabilities,
    cmd = { "clangd", "--offset-encoding=utf-16" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  })
end
