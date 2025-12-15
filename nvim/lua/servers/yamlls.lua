-- ================================================================================================
-- TITLE : yamlls (YAML Language Server) LSP Setup
-- LINKS :
--   > github: https://github.com/redhat-developer/yaml-language-server
-- FEATURES:
--   > Kubernetes Schema Autocomplete (Deployments, Services, etc.)
--   > Docker Compose, GitHub Actions, Helm, Ansible
--   > GitLab CI, ArgoCD, Prometheus, Grafana
-- ================================================================================================

--- @param capabilities table LSP client capabilities (typically from nvim-cmp or similar)
--- @return nil
return function(capabilities)
  vim.lsp.config('yamlls', {
    capabilities = capabilities,
    filetypes = { "yaml", "yaml.docker-compose", "yaml.ansible" },
    settings = {
      yaml = {
        -- ═══════════════════════════════════════════════════════════════════
        -- SCHEMAS für DevOps/SRE Autocomplete
        -- ═══════════════════════════════════════════════════════════════════
        schemas = {
          -- Kubernetes (ALLE Ressourcen!)
          ["https://raw.githubusercontent.com/instrumenta/kubernetes-json-schema/master/v1.28.0-standalone-strict/all.json"] = {
            "/*.yaml",
            "/*.yml",
            "/deploy/*.yaml",
            "/deploy/*.yml",
            "/k8s/*.yaml",
            "/k8s/*.yml",
            "/kubernetes/*.yaml",
            "/kubernetes/*.yml",
            "/manifests/*.yaml",
            "/manifests/*.yml",
          },

          -- Docker Compose
          ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
            "docker-compose*.yml",
            "docker-compose*.yaml",
            "compose*.yml",
            "compose*.yaml",
          },

          -- GitHub Actions
          ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.yml",
          ["https://json.schemastore.org/github-action.json"] = ".github/actions/*/action.yml",

          -- GitLab CI
          ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
            ".gitlab-ci.yml",
            ".gitlab-ci.yaml",
            "/.gitlab/*.yml",
          },

          -- ArgoCD
          ["https://raw.githubusercontent.com/argoproj/argo-cd/master/pkg/apis/application/v1alpha1/types.go"] = {
            "argocd/*.yaml",
            "argocd/*.yml",
          },

          -- Helm (values.yaml)
          ["https://json.schemastore.org/chart.json"] = "Chart.yaml",

          -- Ansible
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/playbook"] = {
            "playbook*.yml",
            "playbook*.yaml",
            "site.yml",
            "site.yaml",
          },
          ["https://raw.githubusercontent.com/ansible/ansible-lint/main/src/ansiblelint/schemas/ansible.json#/$defs/tasks"] = {
            "tasks/*.yml",
            "tasks/*.yaml",
            "handlers/*.yml",
            "handlers/*.yaml",
          },

          -- Prometheus
          ["https://json.schemastore.org/prometheus.json"] = {
            "prometheus.yml",
            "prometheus.yaml",
          },

          -- Grafana Dashboards
          ["https://raw.githubusercontent.com/grafana/grafana/main/public/app/plugins/dashboards/plugin.json"] = {
            "dashboards/*.json",
          },

          -- Kustomization
          ["https://json.schemastore.org/kustomization.json"] = {
            "kustomization.yaml",
            "kustomization.yml",
          },

          -- Taskfile
          ["https://json.schemastore.org/taskfile.json"] = {
            "Taskfile.yml",
            "Taskfile.yaml",
          },

          -- pre-commit
          ["https://json.schemastore.org/pre-commit-config.json"] = ".pre-commit-config.yaml",

          -- Dependabot
          ["https://json.schemastore.org/dependabot-2.0.json"] = ".github/dependabot.yml",

          -- Renovate
          ["https://docs.renovatebot.com/renovate-schema.json"] = {
            "renovate.json",
            ".renovaterc",
            ".renovaterc.json",
          },
        },

        -- ═══════════════════════════════════════════════════════════════════
        -- Validation & Completion
        -- ═══════════════════════════════════════════════════════════════════
        validate = true,
        completion = true,
        hover = true,

        -- Format
        format = {
          enable = true,
          singleQuote = false,
          bracketSpacing = true,
          proseWrap = "preserve",
          printWidth = 120,
        },

        -- Schema Store (Auto-detect mehr Schemas)
        schemaStore = {
          enable = true,
          url = "https://www.schemastore.org/api/json/catalog.json",
        },

        -- Custom Tags (für Helm templates, Ansible)
        customTags = {
          "!reference sequence",
          "!vault scalar",
          "!include scalar",
          "!include_raw scalar",
        },
      },

      -- Red Hat YAML Extension
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
    },
  })
end
