local wezterm = require("wezterm")

local padding = {
	left   = "1cell",
	right  = "0",
	top    = "0",
	bottom = "0"
}

wezterm.time.call_after(600, function()
	wezterm.reload_configuration()
end)


return {
	bidi_enabled = true,
	bidi_direction = "LeftToRight",
	color_scheme = "Catppuccin Mocha",
	initial_cols = 128,
	initial_rows = 32,
	window_padding = padding,
	window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	selection_word_boundary = " \t\n{}[]()\"'`,;:@",
	line_height = 1.25,
	font_size = 13,
	window_background_opacity = 0.95,
	use_fancy_tab_bar = true,
	tab_bar_at_bottom=true,
	show_tab_index_in_tab_bar=false,
	scrollback_lines=30000,
	native_macos_fullscreen_mode=true,
	font = wezterm.font("Geist Mono")
}
