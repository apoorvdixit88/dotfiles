-- ============================================================================
-- lua/plugins/telescope.lua — fuzzy finder (files, grep, buffers)
-- ============================================================================
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },  -- required helper library
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Grep in project" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "List open buffers" })
  end,
}
