-- =============================================================================
-- TITLE : nvim-treesitter
-- ABOUT : Besseres Syntax Highlighting & Code Parsing
-- REPO  : https://github.com/nvim-treesitter/nvim-treesitter
-- =============================================================================

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,  -- Nicht lazy laden, damit :TSUpdate immer funktioniert
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Sprachen die automatisch installiert werden
      ensure_installed = {
        -- Core Languages
        "bash",
        "c",
        "cpp",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "lua",
        "python",
        "rust",

        -- Web
        "css",
        "html",
        "javascript",
        "json",
        "jsonc",
        "svelte",
        "tsx",
        "typescript",
        "vue",

        -- DevOps / SRE (NEU!)
        "dockerfile",
        "yaml",
        "toml",
        "terraform",
        "hcl",
        "helm",
        "sql",
        "graphql",
        "proto",
        "nginx",
        "make",
        "cmake",

        -- Config Files
        "ini",
        "ssh_config",
        "gitignore",
        "gitcommit",
        "git_rebase",
        "diff",

        -- Documentation
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "regex",
        "query",
      },

      -- Automatisch Parser installieren
      auto_install = true,

      -- Syntax Highlighting
      highlight = {
        enable = true,
      },

      -- Indentation
      indent = {
        enable = true,
      },

      -- Incremental Selection
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
    })
  end,
}
