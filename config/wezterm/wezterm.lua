-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
-- This is where you actually apply your config choices
-- Spawn a fish shell in login mode
config.default_prog = { '/run/current-system/sw/bin/zsh' }
config.enable_tab_bar = false
-- hide_tab_bar_if_only_one_tab = true
config.disable_default_key_bindings = true
config.enable_wayland = false
-- For example, changing the color scheme:
-- config.font = wezterm.font 'JetBrains Mono'
config.font = wezterm.font 'Hack Nerd Font'
--config.font_with_fallback = wezterm.font_with_fallback { 'Hack Nerd Font', 'Noto' }
warn_about_missing_glyphs = false
config.font_size = 13.0
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'
-- config.color_scheme = 'BlueBerryPie'
-- config.color_scheme = 'Tokyo Night Storm'
config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte
config.window_background_opacity = .85
-- Removes Titlebar
config.window_decorations = "RESIZE"
-- config.text_background_opacity = 0.3
config.keys = {
  -- Turn off the default CMD-m Hide action, allowing CMD-m to
  -- be potentially recognized and handled by the tab
  {
    key = 'Enter',
    mods = 'ALT',
    action = wezterm.action.ToggleFullScreen,
  },
  {
      key = 'V',
      mods = 'CTRL',
      action = wezterm.action.PasteFrom 'Clipboard',
  },
  {
      key = 'C',
      mods = 'CTRL',
      action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
  },
}



config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

warn_about_missing_glyphs = false
--config.window_background_gradient = {
 --     orientation = 'Vertical',
      -- Specifies the set of colors that are interpolated in the gradient.
      -- Accepts CSS style color specs, from named colors, through rgb
      -- strings and more
      -- colors = {
      --   '#0f0c29',
      --   '#302b63',
      --   '#24243e',
      -- },

      -- A list of presets is shown in a section below.
  --    preset = "RdYlBu",

      -- Specifies the interpolation style to be used.
      -- "Linear", "Basis" and "CatmullRom" as supported.
      -- The default is "Linear".
    --  interpolation = 'Linear',

      -- How the colors are blended in the gradient.
      -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
      -- The default is "Rgb".
      --blend = 'Rgb',

      -- To avoid vertical color banding for horizontal gradients, the
      -- gradient position is randomly shifted by up to the `noise` value
      -- for each pixel.
      -- Smaller values, or 0, will make bands more prominent.
      -- The default value is 64 which gives decent looking results
      -- on a retina macbook pro display.
      -- noise = 64,

      -- By default, the gradient smoothly transitions between the colors.
      -- You can adjust the sharpness by specifying the segment_size and
      -- segment_smoothness parameters.
      -- segment_size configures how many segments are present.
      -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
      -- 1.0 is a soft edge.

      -- segment_size = 11,
      -- segment_smoothness = 0.0,
--}

-- and finally, return the configuration to wezterm
return config

