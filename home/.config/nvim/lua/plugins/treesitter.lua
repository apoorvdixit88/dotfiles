-- ============================================================================
-- lua/plugins/treesitter.lua — modern, accurate syntax highlighting
-- ============================================================================
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",    -- stable API; the newer "main" branch is a different rewrite
  build = ":TSUpdate",  -- compile/update language parsers after install
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "rust", "toml", "bash", "json", "markdown" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
