-- ================================================================================================
-- TITLE : pyright (Python Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/microsoft/pyright
-- FEATURES:
--   > Maximum Autocomplete für DevOps/SRE Python
--   > Auto-Import, Type Inference, Stub Files
-- ================================================================================================

--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
  vim.lsp.config('pyright', {
    capabilities = capabilities,
    filetypes = { "python" },
    settings = {
      pyright = {
        disableOrganizeImports = false,
        disableTaggedHints = false,
      },
      python = {
        analysis = {
          -- Autocomplete Settings (MAXIMUM!)
          autoImportCompletions = true,
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,

          -- Type Checking
          typeCheckingMode = "basic",  -- "off", "basic", "standard", "strict"
          diagnosticMode = "openFilesOnly",

          -- Inlay Hints
          inlayHints = {
            functionReturnTypes = true,
            variableTypes = true,
            callArgumentNames = true,
            pytestParameters = true,
          },

          -- Extra Paths (für Custom Modules)
          extraPaths = {},

          -- Stub Files für bessere Completion
          stubPath = "",

          -- DevOps Libraries auto-erkennen
          diagnosticSeverityOverrides = {
            reportMissingImports = "warning",
            reportMissingModuleSource = "none",
            reportOptionalMemberAccess = "none",
          },
        },
      },
    },
  })
end
