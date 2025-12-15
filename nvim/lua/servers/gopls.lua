-- ================================================================================================
-- TITLE : gopls (Golang Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/golang/tools/tree/master/gopls
-- FEATURES:
--   > Staticcheck Integration
--   > Inlay Hints (Parameter Names, Types)
--   > All Analyses enabled
--   > Code Lenses
-- ================================================================================================

--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
  vim.lsp.config('gopls', {
    capabilities = capabilities,
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
      gopls = {
        -- Formatting
        gofumpt = true,

        -- Staticcheck (bessere Linter als go vet)
        staticcheck = true,

        -- Code Analyses
        analyses = {
          unusedparams = true,
          unusedwrite = true,
          useany = true,
          shadow = true,
          nilness = true,
          fieldalignment = true,
        },

        -- Completion
        usePlaceholders = true,
        completeUnimported = true,
        experimentalPostfixCompletions = true,

        -- Inlay Hints (zeigt Typen/Parameter inline)
        hints = {
          assignVariableTypes = true,
          compositeLiteralFields = true,
          compositeLiteralTypes = true,
          constantValues = true,
          functionTypeParameters = true,
          parameterNames = true,
          rangeVariableTypes = true,
        },

        -- Code Lenses
        codelenses = {
          gc_details = true,
          generate = true,
          regenerate_cgo = true,
          run_govulncheck = true,
          tidy = true,
          upgrade_dependency = true,
          vendor = true,
        },

        -- Semantic Tokens
        semanticTokens = true,

        -- Diagnostics
        diagnosticsDelay = "500ms",
        diagnosticsTrigger = "Edit",
      },
    },
  })
end
