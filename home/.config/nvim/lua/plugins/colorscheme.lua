-- ============================================================================
-- lua/plugins/colorscheme.lua — theme
-- Each plugin file returns a table that lazy.nvim reads.
-- ============================================================================
return {
  "folke/tokyonight.nvim",
  priority = 1000,  -- load before other plugins so UI colors are set early
  config = function()
    vim.cmd.colorscheme("tokyonight-night")
  end,
}
