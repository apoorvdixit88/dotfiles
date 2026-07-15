-- ============================================================================
-- lua/plugins/lualine.lua — statusline (info bar at the bottom)
-- ============================================================================
return {
  "nvim-lualine/lualine.nvim",
  config = function()
    require("lualine").setup({ options = { theme = "tokyonight" } })
  end,
}
