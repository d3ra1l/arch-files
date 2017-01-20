---------------------------

-- Default awesome theme --
---------------------------

theme = {}

theme.font          = "lemon 7"
theme.font_alt      = "-*-lemon-*-*-*-*-*-*-*-*-*-*-*-*"

theme.colorize_fg    = "#dfdfdf"
theme.colorize_bfg   = "#b4b4b4"
theme.colorize_bg    = "#30303a"
theme.colorize_bbg   = "#66666a"
theme.colorize_fgw   = "#f0a3a3"

theme.colorize_red    = "#da637e"
theme.colorize_blue   = "#7787a3"
theme.colorize_green  = "#b1b782"
theme.colorize_yellow = "#e5cb64"
theme.colorize_cyan   = "#83a29e"
theme.colorize_purple = "#ac8ac1"
theme.colorize_npurp  = "#ab93b9"

theme.bg_normal     = "#20202f"
theme.bg_focus      = "#20202f"
theme.bg_urgent     = "#20202f"
theme.bg_minimize   = "#20202f"
theme.bg_special    = "#30303a"
theme.bg_systray    = theme.bg_normal

theme.fg_normal     = "#b4b4b4"
theme.fg_focus      = "#eeeeee"
theme.fg_urgent     = "#646464"
theme.fg_minimize   = "#777777"
theme.fg_systray    = "#b4b4b4"
theme.tasklist_fg_focus = "#dadada"
theme.taglist_fg_normal = "#a2a2a2"

theme.taglist_bg_focus    = theme.colorize_red
theme.taglist_bg_occupied = theme.colorize_blue
theme.taglist_fg_occupied = theme.fg_focus
theme.taglist_bg_urget    = theme.colorize_purple

theme.border_width  = 2
theme.border_normal = "#30303a"
theme.border_focus  = "#595961"
theme.border_marked = "#646464"
theme.border_custom = "#a2a2a2"

--theme.taglist_squares_sel   = "/home/phallus/.config/awesome/themes/benis/taglist/squarefw-g.png"
--theme.taglist_squares_unsel = "/home/phallus/.config/awesome/themes/benis/taglist/squarew-g.png"

theme.menu_submenu_icon = "/home/phallus/.config/awesome/themes/benis/submenu3.png"
theme.menu_height = 12
theme.menu_width  = 82
theme.menu_border_color = "#595961"
theme.menu_bg_focus = "#30303a"

theme.tasklist_maximized_horizontal = ""
theme.tasklist_maximized_vertical   = ""

--gaps work best if the padding is 7 + 10x
theme.padding = "67"

theme.tasklist_floating = ""
theme.layout = {
    floating  = " ⮛ ",
    tile      = " ⮘ ",
    tileleft  = " ⮙ ",
    dtile     = " ⮨ ",
    stile     = " ⮨ ",
}

theme.icon_theme = nil
theme.tasklist_disable_icon = true


return theme
-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
