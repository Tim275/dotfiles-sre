-- ================================================================================================
-- TITLE : nvim-cmp
-- ABOUT : MAXIMUM Autocompletion für DevOps/SRE (Python, Go, YAML, Linux)
-- REPO  : https://github.com/hrsh7th/nvim-cmp
-- ================================================================================================

return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    -- Snippet Engine
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {
        -- Snippet Collections (VSCode-style)
        "rafamadriz/friendly-snippets",
      },
    },
    "saadparwaiz1/cmp_luasnip",

    -- Completion Sources
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",              -- Neovim Lua API

    -- Icons
    "onsails/lspkind.nvim",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local lspkind = require("lspkind")

    -- ═══════════════════════════════════════════════════════════════════
    -- SNIPPETS LADEN
    -- ═══════════════════════════════════════════════════════════════════
    -- VSCode-style snippets (friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Custom DevOps Snippets (K8s, Terraform, Docker, Python, Go, Bash)
    require("luasnip.loaders.from_vscode").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/snippets" },
    })

    -- Snippet Optionen
    luasnip.config.setup({
      history = true,
      updateevents = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })

    -- ═══════════════════════════════════════════════════════════════════
    -- CMP SETUP
    -- ═══════════════════════════════════════════════════════════════════
    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      -- Completion Window Style
      window = {
        completion = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        }),
      },

      -- Formatting mit Icons
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
          mode = "symbol_text",
          maxwidth = 50,
          ellipsis_char = "...",
          symbol_map = {
            Codeium = "",
            Copilot = "",
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
          },
          menu = {
            codeium = "[AI]",
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            nvim_lua = "[Lua]",
            buffer = "[Buf]",
            path = "[Path]",
            cmdline = "[Cmd]",
          },
        }),
      },

      -- Keymaps
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),

        -- Tab für Completion UND Snippet Jump
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- ═══════════════════════════════════════════════════════════════════
      -- SOURCES (Priorität = wichtiger kommt zuerst)
      -- ═══════════════════════════════════════════════════════════════════
      sources = cmp.config.sources({
        { name = "codeium", priority = 1100, max_item_count = 5 },
        { name = "nvim_lsp", priority = 1000, max_item_count = 30 },
        { name = "luasnip", priority = 900, max_item_count = 10 },
        { name = "nvim_lsp_signature_help", priority = 850 },
        { name = "nvim_lua", priority = 800 },
        { name = "path", priority = 700 },
        { name = "buffer", priority = 500, max_item_count = 10,
          option = {
            -- Nur aus sichtbaren Buffers
            get_bufnrs = function()
              local bufs = {}
              for _, win in ipairs(vim.api.nvim_list_wins()) do
                bufs[vim.api.nvim_win_get_buf(win)] = true
              end
              return vim.tbl_keys(bufs)
            end,
          },
        },
      }),

      -- ═══════════════════════════════════════════════════════════════════
      -- SORTING (bessere Vorschläge zuerst)
      -- ═══════════════════════════════════════════════════════════════════
      sorting = {
        priority_weight = 2,
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },

      -- Performance
      performance = {
        debounce = 60,
        throttle = 30,
        fetching_timeout = 500,
        max_view_entries = 50,
      },

      -- Ghost Text (inline preview)
      experimental = {
        ghost_text = {
          hl_group = "Comment",
        },
      },
    })

    -- ═══════════════════════════════════════════════════════════════════
    -- FILETYPE SPECIFIC
    -- ═══════════════════════════════════════════════════════════════════
    -- Git Commit Messages
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "buffer" },
      }),
    })

    -- YAML (mehr LSP, weniger Buffer)
    cmp.setup.filetype({ "yaml", "yml" }, {
      sources = cmp.config.sources({
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 900 },
        { name = "path", priority = 700 },
        { name = "buffer", priority = 300, max_item_count = 5 },
      }),
    })

    -- ═══════════════════════════════════════════════════════════════════
    -- CMDLINE COMPLETION
    -- ═══════════════════════════════════════════════════════════════════
    -- : Commands
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    -- / und ? (Search)
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
  end,
}
