-- =============================================================================
-- LSP: terraform-ls
-- ABOUT : Terraform Language Server
-- Install: brew install hashicorp/tap/terraform-ls
-- =============================================================================

return function(capabilities)
  vim.lsp.config("terraformls", {
    capabilities = capabilities,
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "terraform-vars", "tf" },
    root_markers = { ".terraform", "*.tf", "terraform.tfvars" },
  })
end
