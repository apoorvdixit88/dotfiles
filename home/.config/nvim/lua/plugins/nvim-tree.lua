-- ============================================================================
-- lua/plugins/nvim-tree.lua — file explorer sidebar
-- ============================================================================
return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup()
    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
  end,
}
