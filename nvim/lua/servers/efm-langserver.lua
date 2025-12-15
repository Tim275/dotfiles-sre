-- ================================================================================================
-- TITLE : efm-langserver
-- ABOUT : a general purpose language server protocol implemented here for linters/formatters
-- LINKS :
--   > github : https://github.com/mattn/efm-langserver
--   > configs: https://github.com/creativenull/efmls-configs-nvim/tree/main
-- ================================================================================================

--- @param capabilities table LSP client capabilities (from nvim-cmp)
--- @return nil
return function(capabilities)
  local luacheck = require("efmls-configs.linters.luacheck")
  local stylua = require("efmls-configs.formatters.stylua")
  local flake8 = require("efmls-configs.linters.flake8")
  local black = require("efmls-configs.formatters.black")
  local prettier_d = require("efmls-configs.formatters.prettier_d")
  local eslint_d = require("efmls-configs.linters.eslint_d")
  local fixjson = require("efmls-configs.formatters.fixjson")
  local shellcheck = require("efmls-configs.linters.shellcheck")
  local shfmt = require("efmls-configs.formatters.shfmt")
  local hadolint = require("efmls-configs.linters.hadolint")

  vim.lsp.config("efm", {
    capabilities = capabilities,
    filetypes = {
      "css",
      "docker",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "python",
      "sh",
      "svelte",
      "typescript",
      "typescriptreact",
      "vue",
      "yaml",
    },
    init_options = {
      documentFormatting = true,
      documentRangeFormatting = true,
      hover = true,
      documentSymbol = true,
      codeAction = true,
      completion = true,
    },
    settings = {
      languages = {
        css = { prettier_d },
        docker = { hadolint, prettier_d },
        html = { prettier_d },
        javascript = { eslint_d, prettier_d },
        javascriptreact = { eslint_d, prettier_d },
        json = { eslint_d, fixjson },
        jsonc = { eslint_d, fixjson },
        lua = { luacheck, stylua },
        markdown = { prettier_d },
        python = { flake8, black },
        sh = { shellcheck, shfmt },
        svelte = { eslint_d, prettier_d },
        typescript = { eslint_d, prettier_d },
        typescriptreact = { eslint_d, prettier_d },
        vue = { eslint_d, prettier_d },
        yaml = { prettier_d },
      },
    },
  })
end
