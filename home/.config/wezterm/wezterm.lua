-- ~/.config/wezterm/wezterm.lua
-- WezTerm configuration.  Docs: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ── Font ─────────────────────────────────────────────────────────────────────
config.font = wezterm.font_with_fallback({
  "MesloLGS Nerd Font Mono",
  "Symbols Nerd Font Mono",
})
config.font_size = 19.0

-- ── Appearance ───────────────────────────────────────────────────────────────
-- Try others: "Tokyo Night", "Gruvbox Dark", "Dracula", "Nord"
config.color_scheme = "Catppuccin Mocha"
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.95        -- subtle transparency
config.macos_window_background_blur = 20       -- frosted-glass blur (macOS only)
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }

-- ── Tab bar ──────────────────────────────────────────────────────────────────
-- Keeps your clean single-window look, but shows tabs only when you have >1.
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true

-- ── Behaviour ────────────────────────────────────────────────────────────────
config.scrollback_lines = 10000
config.default_cursor_style = "BlinkingBar"
config.audible_bell = "Disabled"
config.adjust_window_size_when_changing_font_size = false

-- Left Option acts as Alt (so Alt-based CLI/tmux bindings work);
-- right Option still types special characters.
config.send_composed_key_when_left_alt_is_pressed = false
config.send_composed_key_when_right_alt_is_pressed = true

-- ── Keybindings (macOS CMD-based; complements tmux, doesn't replace it) ───────
config.keys = {
  -- Clear the screen AND scrollback (like Terminal.app / iTerm)
  { key = "k", mods = "CMD", action = wezterm.action.ClearScrollback("ScrollbackAndViewport") },
  -- Splits
  { key = "d", mods = "CMD",       action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  -- Move between panes (Cmd+Alt+h/j/k/l)
  { key = "h", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "l", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "k", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "j", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Down") },
  -- Close current pane
  { key = "w", mods = "CMD", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
}

return config
