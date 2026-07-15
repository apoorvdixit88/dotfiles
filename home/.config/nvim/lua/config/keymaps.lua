-- ============================================================================
-- lua/config/keymaps.lua — key mappings
-- vim.keymap.set(mode, keys, action, opts)   "n"=normal "v"=visual "i"=insert
-- ============================================================================
local map = vim.keymap.set

-- Clear search highlight with <Esc>
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Leave Insert mode by typing "jk" quickly (an alternative to reaching for <Esc>)
map("i", "jk", "<Esc>", { desc = "Escape to Normal mode" })

-- Save / quit
map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>quit<CR>",  { desc = "Quit window" })

-- Move between splits with Ctrl + h/j/k/l
map("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower split" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })

-- Keep selection when indenting in visual mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move highlighted lines up/down in visual mode
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
