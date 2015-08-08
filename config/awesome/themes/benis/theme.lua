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

theme.menu_height = 11
theme.menu_width  = 75
theme.menu_border_color = "#595961"
theme.menu_bg_focus = "#30303a"

-- daze {{{
theme.useless_gap_width = "42"
theme.lower_window_height = "0"
theme.vertical_resolution = "900"
theme.vertical_border = "2"
theme.outer_padding = "6"
theme.padding = "23"
---}}}

theme.layout = {

floating  = " ⮛ ",
tile      = " ⮘ ",
tileleft  = " ⮙ ",
dtile     = " ⮨ ",

}

theme.icon_theme = nil
theme.tasklist_disable_icon = true


return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
