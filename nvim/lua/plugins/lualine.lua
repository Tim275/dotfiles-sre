-- =============================================================================
-- TITLE : lualine.nvim
-- ABOUT : Statusline mit Git, Diagnostics, LSP, Harpoon Status
-- LINKS :
--   > github : https://github.com/nvim-lualine/lualine.nvim
-- =============================================================================

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    -- Harpoon Status (zeigt aktuelle Position)
    local function harpoon_status()
      local ok, harpoon = pcall(require, "harpoon")
      if not ok then return "" end
      local list = harpoon:list()
      local current_file = vim.fn.expand("%:p")
      for i, item in ipairs(list.items) do
        if item.value == current_file or vim.fn.expand("%:.") == item.value then
          return "󱡀 " .. i
        end
      end
      return ""
    end

    -- LSP Server Name
    local function lsp_status()
      local clients = vim.lsp.get_clients({ bufnr = 0 })
      if #clients == 0 then return "" end
      local names = {}
      for _, client in ipairs(clients) do
        if client.name ~= "null-ls" and client.name ~= "efm" then
          table.insert(names, client.name)
        end
      end
      if #names == 0 then return "" end
      return " " .. table.concat(names, ", ")
    end

    require("lualine").setup({
      options = {
        theme = "nightfox",
        icons_enabled = true,
        globalstatus = true,
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = { "NvimTree", "trouble", "aerial" },
        },
      },
      sections = {
        lualine_a = {
          { "mode", fmt = function(str) return str:sub(1, 1) end },
        },
        lualine_b = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
          },
        },
        lualine_c = {
          { "filename", path = 1, symbols = { modified = " ●", readonly = " " } },
          { harpoon_status, color = { fg = "#ea9a97" } },
        },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          { lsp_status, color = { fg = "#569fba" } },
        },
        lualine_y = {
          { "filetype", icon_only = true },
          { "encoding", fmt = function(str) return str:upper() end },
          { "fileformat", symbols = { unix = "", dos = "", mac = "" } },
        },
        lualine_z = {
          { "progress" },
          { "location" },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      extensions = { "nvim-tree", "lazy", "trouble", "fugitive" },
    })
  end,
}
