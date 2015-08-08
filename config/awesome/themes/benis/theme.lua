---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "lemon 7"
theme.font_alt      = "-*-lemon-*-*-*-*-*-*-*-*-*-*-*-*"

theme.bg_normal     = "#20202f"
theme.bg_focus      = "#20202f"
theme.bg_urgent     = "#20202f"
theme.bg_minimize   = "#20202f"
theme.bg_special    = "#30303a"
theme.bg_systray    = theme.bg_normal
theme.taglist_bg_focus = "#30303a"

theme.fg_normal     = "#b4b4b4"
theme.fg_focus      = "#eeeeee"
theme.fg_urgent     = "#646464"
theme.fg_minimize   = "#777777"
theme.fg_systray    = "#b4b4b4"
theme.tasklist_fg_focus = "#dadada"
theme.taglist_fg_normal = "#a2a2a2"

theme.border_width  = 2
theme.border_normal = "#20202f"
theme.border_focus  = "#30303a"
theme.border_marked = "#646464"
theme.border_feh    = "#30303a"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/phallus/.config/awesome/themes/benis/taglist/squarefw-g.png"
theme.taglist_squares_unsel = "/home/phallus/.config/awesome/themes/benis/taglist/squarew-g.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/phallus/.config/awesome/themes/benis/submenu3.png"
theme.menu_height = 11
theme.menu_width  = 75
theme.menu_border_color = "#595961"
theme.menu_bg_focus = "#30303a"

-- daze {{{
--theme.useless_gap_width = "94"
theme.useless_gap_width = "42"
--theme.lower_window_height = "124"
theme.lower_window_height = "0"
theme.vertical_resolution = "900"
theme.vertical_border = "2"
theme.outer_padding = "6"
theme.padding = "23"
---}}}

-- Define the image to load
theme.titlebar_close_button_normal = "/home/phallus/.config/awesome/themes/benis/titlebar/close_normal.png"
theme.titlebar_close_button_focus  = "/home/phallus/.config/awesome/themes/benis/titlebar/close_focus.png"

theme.titlebar_ontop_button_normal_inactive = "/home/phallus/.config/awesome/themes/benis/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = "/home/phallus/.config/awesome/themes/benis/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = "/home/phallus/.config/awesome/themes/benis/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = "/home/phallus/.config/awesome/themes/benis/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = "/home/phallus/.config/awesome/themes/benis/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = "/home/phallus/.config/awesome/themes/benis/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = "/home/phallus/.config/awesome/themes/benis/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = "/home/phallus/.config/awesome/themes/benis/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = "/home/phallus/.config/awesome/themes/benis/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = "/home/phallus/.config/awesome/themes/benis/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = "/home/phallus/.config/awesome/themes/benis/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = "/home/phallus/.config/awesome/themes/benis/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = "/home/phallus/.config/awesome/themes/benis/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = "/home/phallus/.config/awesome/themes/benis/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = "/home/phallus/.config/awesome/themes/benis/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = "/home/phallus/.config/awesome/themes/benis/titlebar/maximized_focus_active.png"

-- You can use your own layout icons like this:

-- {{{ Widgets
theme.widget_netdown = "/home/phallus/.config/awesome/themes/benis/icons/down.png"
theme.widget_netup = "/home/phallus/.config/awesome/themes/benis/icons/up.png"
theme.widget_mpd = "/home/phallus/.config/awesome/themes/benis/icons/mpd.png"
theme.widget_separator = "/home/phallus/.config/awesome/themes/benis/icons/separator.png"
theme.widget_cpu = "/home/phallus/.config/awesome/themes/benis/icons/cpu.png"
theme.widget_mem = "/home/phallus/.config/awesome/themes/benis/icons/mem.png"
-- }}}

theme.layout = {

floating  = " ⮛ ",
tile      = " ⮘ ",
tileleft  = " ⮙ ",
dtile     = " ⮨ ",

}
-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil
theme.tasklist_disable_icon = true


return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
