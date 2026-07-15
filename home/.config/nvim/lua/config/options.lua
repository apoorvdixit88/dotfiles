-- ============================================================================
-- lua/config/options.lua — editor settings (vim.opt)
-- ============================================================================
local opt = vim.opt

-- Line numbers
opt.number = true          -- absolute number on the current line
opt.relativenumber = true  -- relative numbers on other lines (fast j/k jumps)

-- Indentation
opt.tabstop = 4            -- a <Tab> looks 4 columns wide
opt.shiftwidth = 4         -- >> / << indent by 4
opt.expandtab = true       -- <Tab> inserts spaces, not a tab char
opt.smartindent = true     -- auto-indent new lines based on syntax

-- Search
opt.ignorecase = true      -- case-insensitive search...
opt.smartcase = true       -- ...unless you type an uppercase letter
opt.hlsearch = true        -- highlight all matches
opt.incsearch = true       -- jump to matches as you type

-- UI / behaviour
opt.wrap = false           -- don't wrap long lines
opt.scrolloff = 8          -- keep 8 lines above/below the cursor
opt.signcolumn = "yes"     -- always show the left gutter (no text jitter)
opt.termguicolors = true   -- 24-bit colors (needed by modern themes)
opt.cursorline = true      -- highlight the current line
opt.mouse = "a"            -- enable mouse in all modes

-- Share the OS clipboard (Cmd+C / Cmd+V)
opt.clipboard = "unnamedplus"

-- Files
opt.swapfile = false       -- no .swp files
opt.undofile = true        -- persist undo history across sessions
