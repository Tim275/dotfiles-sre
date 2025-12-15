-- =============================================================================
-- LSP: ansible-language-server
-- ABOUT : Ansible Language Server
-- Install: npm install -g @ansible/ansible-language-server
-- =============================================================================

return function(capabilities)
  vim.lsp.config("ansiblels", {
    capabilities = capabilities,
    cmd = { "ansible-language-server", "--stdio" },
    filetypes = { "yaml.ansible" },
    root_markers = { "ansible.cfg", ".ansible-lint", "playbooks/", "roles/" },
    settings = {
      ansible = {
        python = { interpreterPath = "python3" },
        ansible = { path = "ansible" },
        validation = { enabled = true, lint = { enabled = true } },
      },
    },
  })
end
