-- ================================================================================================
-- TITLE : bashls (Bash Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/bash-lsp/bash-language-server
-- FEATURES:
--   > Autocomplete für Bash/Zsh Scripts
--   > Shellcheck Integration
--   > Linux Commands, Environment Variables
-- ================================================================================================

--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
  vim.lsp.config('bashls', {
    capabilities = capabilities,
    filetypes = { "sh", "bash", "zsh", "shell" },
    settings = {
      bashIde = {
        -- Globbing Pattern für Shell Files
        globPattern = "*@(.sh|.inc|.bash|.command|.zsh|.zshrc|.bashrc|.bash_profile|.profile)",

        -- Include Paths für Completion
        includeAllWorkspaceSymbols = true,

        -- Shellcheck Integration
        shellcheckPath = "shellcheck",
        shellcheckArguments = {
          "--external-sources",
          "--source-path=SCRIPTDIR",
        },

        -- Background Analysis
        backgroundAnalysisMaxFiles = 500,

        -- Explainshell (optional - für Hover Docs)
        explainshellEndpoint = "",

        -- Logging
        logLevel = "warning",
      },
    },
    -- Root Directory Pattern
    root_markers = { ".git", ".bashrc", "Makefile" },
  })
end
