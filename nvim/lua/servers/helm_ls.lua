-- =============================================================================
-- LSP: helm_ls
-- ABOUT : Helm Chart Language Server
-- Install: brew install helm-ls
-- =============================================================================

return function(capabilities)
  vim.lsp.config("helm_ls", {
    capabilities = capabilities,
    cmd = { "helm_ls", "serve" },
    filetypes = { "helm" },
    root_markers = { "Chart.yaml", "Chart.lock" },
    settings = {
      ["helm-ls"] = {
        yamlls = { path = "yaml-language-server" },
      },
    },
  })
end
