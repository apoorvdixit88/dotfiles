-- ============================================================================
-- init.lua — entry point
-- Keep this file small. Real config lives under lua/config and lua/plugins.
-- ============================================================================

-- Leader key MUST be set before lazy.nvim loads so plugin mappings pick it up.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core editor settings and keymaps (files under lua/config/)
require("config.options")
require("config.keymaps")

-- ---------------------------------------------------------------------------
-- Bootstrap lazy.nvim (auto-install on first launch), then load plugins.
-- vim.uv is the current name on Neovim 0.10+ (older configs used vim.loop).
-- ---------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- { import = "plugins" } auto-loads every file in lua/plugins/.
-- To add a plugin later, just drop a new file in that folder.
require("lazy").setup({ { import = "plugins" } })
