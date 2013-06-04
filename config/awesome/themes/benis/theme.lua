---------------------------
-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "lemon 7"
--theme.font_alt      = "-*-lime.se-*-*-*-*-*-*-*-*-*-*-*-*"

theme.bg_normal     = "#20202f"
theme.bg_focus      = "#20202f"
theme.bg_urgent     = "#20202f"
theme.bg_minimize   = "#20202f"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#b4b4b4"
theme.fg_focus      = "#eeeeee"
theme.fg_urgent     = "#646464"
theme.fg_minimize   = "#eeeeee"
theme.fg_systray    = "#b4b4b4"
theme.tasklist_fg_focus = "#dadada"
theme.taglist_fg_normal = "#a2a2a2"

theme.border_width  = 2
theme.border_normal = "#20202f"
theme.border_focus  = "#30303a"
theme.border_marked = "#646464"
theme.border_feh    = "#30303a"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Display the taglist squares
theme.taglist_squares_sel   = "/home/phallus/.config/awesome/themes/benis/taglist/squarefw-g.png"
theme.taglist_squares_unsel = "/home/phallus/.config/awesome/themes/benis/taglist/squarew-g.png"

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = "/home/phallus/.config/awesome/themes/benis/submenu.png"
theme.menu_height = 11
theme.menu_width  = 70

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

theme.useless_gap_width = "43"
theme.lower_window_height = "72"
theme.vertical_resolution = "900"
theme.vertical_border = "3"
theme.outer_padding = "0"

theme.layout_txt_tile       = "⮘ "
theme.layout_txt_floating   = "⮛ "

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

--theme.wallpaper = "/home/phallus/img/wallpapers/scenery/bokeh - winter.jpg"

-- You can use your own layout icons like this:
theme.layout_fairh = "/home/phallus/.config/awesome/themes/benis/layouts/fairhw.png"
theme.layout_fairv = "/home/phallus/.config/awesome/themes/benis/layouts/fairvw.png"
--theme.layout_floating  = "⮛"
theme.layout_magnifier = "/home/phallus/.config/awesome/themes/benis/layouts/magnifierw.png"
theme.layout_max = "/home/phallus/.config/awesome/themes/benis/layouts/maxw.png"
theme.layout_fullscreen = "/home/phallus/.config/awesome/themes/benis/layouts/fullscreenw.png"
theme.layout_tilebottom = "/home/phallus/.config/awesome/themes/benis/layouts/tilebottomw.png"
theme.layout_tileleft   = "/home/phallus/.config/awesome/themes/benis/layouts/tileleftw.png"
theme.layout_tile = "/home/phallus/.config/awesome/themes/benis/layouts/tilew.png"
theme.layout_tiletop = "/home/phallus/.config/awesome/themes/benis/layouts/tiletopw.png"
theme.layout_spiral  = "/home/phallus/.config/awesome/themes/benis/layouts/spiralw.png"
theme.layout_dwindle = "/home/phallus/.config/awesome/themes/benis/layouts/dwindlew.png"

theme.awesome_icon = "/home/phallus/.config/awesome/icons/awesome16.png"

-- {{{ Widgets
theme.widget_netdown = "/home/phallus/.config/awesome/themes/benis/icons/down.png"
theme.widget_netup = "/home/phallus/.config/awesome/themes/benis/icons/up.png"
theme.widget_mpd = "/home/phallus/.config/awesome/themes/benis/icons/mpd.png"
theme.widget_separator = "/home/phallus/.config/awesome/themes/benis/icons/separator.png"
theme.widget_cpu = "/home/phallus/.config/awesome/themes/benis/icons/cpu.png"
theme.widget_mem = "/home/phallus/.config/awesome/themes/benis/icons/mem.png"
-- }}}

-- Define the icon theme for application icons. If not set then the icons 
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
