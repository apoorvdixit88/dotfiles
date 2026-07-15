-- ~/.config/wezterm/wezterm.lua
-- WezTerm configuration.  Docs: https://wezfurlong.org/wezterm/config/files.html

local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- ── Font ─────────────────────────────────────────────────────────────────────
-- Toggle the font by swapping which line is first (top one wins):
config.font = wezterm.font_with_fallback({
  "MesloLGS Nerd Font Mono",       -- <- currently active
  -- "JetBrainsMono Nerd Font Mono", -- <- uncomment this (and comment the line above) to switch back
  "Symbols Nerd Font Mono",
})
config.font_size = 16.0
-- JetBrains Mono ligatures (=> != >= === etc.) are on by default.
-- To turn them OFF, uncomment the next line:
-- config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" }

-- ── Appearance ───────────────────────────────────────────────────────────────
-- Try others: "Tokyo Night", "Gruvbox Dark", "Dracula", "Nord"
config.color_scheme = "Catppuccin Mocha"
-- To use Catppuccin's true Mocha base (#1e1e2e), we let the color_scheme drive
-- the background. Uncomment below to override it to a near-black canvas instead
-- (#11111b is Catppuccin's darkest shade, "crust") — keeps all the Mocha accents.
-- config.colors = {
--   background = "#11111b",
-- }
config.window_decorations = "TITLE | RESIZE"
config.window_background_opacity = 0.95        -- subtle transparency
config.macos_window_background_blur = 20       -- frosted-glass blur (macOS only)
config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }

-- ── Pane focus: dim inactive panes so the active one stands out ───────────────
-- NOTE: only affects WezTerm-native splits (Cmd+d / Cmd+Shift+d), not tmux splits.
config.inactive_pane_hsb = {
  saturation = 0.8,
  brightness = 0.7,
}

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
  -- Cmd+K = run the real `clear` command, so it wipes the screen AND scrollback
  -- exactly like typing `clear` — and works inside tmux (clears tmux's history too).
  -- Ctrl-U first discards anything half-typed at the prompt.
  {
    key = "k",
    mods = "CMD",
    action = wezterm.action.Multiple({
      wezterm.action.SendKey({ key = "u", mods = "CTRL" }),
      wezterm.action.SendString("clear\r"),
    }),
  },
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
