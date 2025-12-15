-- =============================================================================
-- TITLE : Claude Code Integration
-- ABOUT : Claude AI direkt in Neovim Terminal
-- CLI   : claude (bereits installiert v2.0.69)
-- =============================================================================

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>ac", function()
      local Terminal = require("toggleterm.terminal").Terminal
      local claude = Terminal:new({
        cmd = "claude",
        direction = "vertical",
        size = function() return vim.o.columns * 0.4 end,
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })
      claude:toggle()
    end, desc = "Claude Code öffnen" },

    { "<leader>ar", function()
      local Terminal = require("toggleterm.terminal").Terminal
      local claude = Terminal:new({
        cmd = "claude --continue",
        direction = "vertical",
        size = function() return vim.o.columns * 0.4 end,
      })
      claude:toggle()
    end, desc = "Claude fortsetzen" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-\>]],
    direction = "vertical",
    float_opts = {
      border = "rounded",
    },
  },
}
