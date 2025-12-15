-- =============================================================================
-- TITLE : NeoVim Options
-- ABOUT : Grundeinstellungen (wie im Tutorial)
-- =============================================================================

local opt = vim.opt

-- Basic Settings
opt.number = true
opt.relativenumber = false  -- true = relative, false = normale Zeilennummern
opt.cursorline = true
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.wrap = false
opt.cmdheight = 1
opt.laststatus = 3                -- Global statusline

-- Reduce "Press ENTER" messages
opt.shortmess:append("WIcC")

-- Tabbing / Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.smartindent = true
opt.autoindent = true

-- Search Settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Grep (ripgrep)
opt.grepprg = "rg --vimgrep"
opt.grepformat = "%f:%l:%c:%m"

-- Visual Settings
opt.termguicolors = true
opt.signcolumn = "yes"
-- opt.colorcolumn = "100"  -- Deaktiviert (lila Linie)
opt.showmatch = true
opt.showmode = false
opt.pumheight = 10
opt.pumblend = 10
opt.completeopt = "menuone,noinsert,noselect"

-- File Handling
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.expand("~/.local/share/nvim/undodir")
opt.updatetime = 300
opt.timeoutlen = 500
opt.ttimeoutlen = 0
opt.autoread = true

-- Behavior
opt.errorbells = false
opt.backspace = "indent,eol,start"
opt.mouse = "a"
opt.clipboard:append("unnamedplus")
opt.encoding = "UTF-8"
opt.iskeyword:append("-")

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Cursor
opt.guicursor = {
  "n-v-c:block",
  "i-ci-ve:block",
  "r-cr:hor20",
  "o:hor50",
  "a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
  "sm:block-blinkwait175-blinkoff150-blinkon175",
}

-- Folding (Treesitter)
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldlevel = 99
