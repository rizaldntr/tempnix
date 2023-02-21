{colors}:
with colors.base; ''
  # Eye Friendly Colors
  # Created by https://github.com/decaycs
  # Special
  background ${backgroundDarker}
  foreground ${foreground}
  # Black
  color0 ${black}
  color8 ${dimblack}
  # Red
  color1 ${red}
  color9 ${red}
  # Green
  color2  ${green}
  color10 ${green}
  # Yellow
  color3  ${yellow}
  color11 ${yellow}
  # Blue
  color4  ${blue}
  color12 ${blue}
  # Magenta
  color5  ${magenta}
  color13 ${magenta}
  # Cyan
  color6  ${cyan}
  color14 ${cyan}
  # White
  color7  ${white}
  color15 ${white}
  # Cursor
  cursor ${white}
  cursor_text_color ${background}
  # Selection highlight
  selection_foreground ${foreground}
  selection_background ${dimblack}

  # Tab
  tab_bar_edge top
  tab_bar_style powerline
  tab_powerline_style slanted
  tab_title_template "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{title}"

  active_tab_foreground   ${black}
  active_tab_background   ${blue}
  active_tab_font_style   bold-italic
  inactive_tab_foreground ${white}
  inactive_tab_background ${background}
  tab_bar_background ${backgroundLighter}
  tab_bar_margin_color ${blue}

  modify_font underline_position +3
  modify_font underline_thickness 130%
''
