-- Libraries {{{
-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
local monkfish = require("monkfish")
local benis = require("benis")
local vicious = require("vicious")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
--}}}

-- {{{ Things to do

-- remove dependencies to daze-based widgets
--  move functions to call dzen scripts from monkfish widget to the rc.lua
--  move stile script to main awful library
-- convert dzen scripts to use naughty
-- resolve issue in which album art popup intermittently disobeys defined rules
-- resolve issue in which defined submenus fail to appear in root menu
-- continue general refactoring following a current towards improving my current setup's lack of sanity and a future adaption to awesome 4.0
--  refactor time widget to use less power -- adapt to inbuilt vicious/awful clock widgets??

-- }}}

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
  naughty.notify({ preset = naughty.config.presets.critical,
    title = "Oops, there were errors during startup!",
    text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
  local in_error = false
  awesome.connect_signal("debug::error", function (err)
    -- Make sure we don't go into an endless error loop
    if in_error then
       return
    end
    in_error = true
    naughty.notify({ 
      preset = naughty.config.presets.critical,
      title = "Oops, an error happened!",
      text = err })
    in_error = false
  end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, and wallpapers
beautiful.init("/home/phallus/.config/awesome/themes/benis/theme.lua")
--beautiful.init("/usr/share/awesome/themes/default/theme.lua")

terminal   = "urxvt"
browser    = os.getenv("BROWSER") or "firefox"
editor     = os.getenv("EDITOR") or "vim"
editor_cmd = terminal .. " -e " .. editor
modkey     = "Mod1"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
  awful.layout.suit.floating,
  awful.layout.suit.tile,
  monkfish.layout.stile
}

-- colorizing fxns
local function colorizen(s, fg)
  return "<span color='"..fg.."'>"..s.."</span>"
end

local function colorizeb(s1, fg1, s2, fg2)
  return "<span color='"..fg1.."'>"..s1.."</span><span color='"..fg2.."'>"..s2.."</span>"
end

local function colorizei(s, fg, bg)
  return "<span color='"..fg.."' background='"..bg.."'>"..s.."</span>"
end

-- colors to use in the colorizing fxns
fgr = theme.colorize_fg
bgr = theme.colorize_bg
bfg = theme.colorize_bfg
bbg = theme.colorize_bbg
wfg = theme.colorize_fgw

red    = theme.colorize_red
blue   = theme.colorize_blue
green  = theme.colorize_green
yellow = theme.colorize_yellow
cyan   = theme.colorize_cyan
purple = theme.colorize_purple
npurp  = theme.colorize_npurp

-- movement fxns
-- test if given client floats
local function floats(c) 
  local layout = awful.layout.get(c.screen)
  return awful.layout.getname(layout) == "floating" or awful.client.floating.get(c)
end

-- test if given client is the mw
local function master(c)
  return awful.client.getmaster(c.screen) == c
end

-- move client according to its state
-- to remove confusion: 
-- a only affects a tiled windows and determines whether or not to adjust the size of the master or slave windows
-- b affects floating windows and determines whether to move or resize the window
local function move(c, x, y, mw, a, b) 
  -- tests if client is floating or tiled
  if floats(c) then
    -- tests if moving or resizing
    if b == "n" then
      awful.client.moveresize( x, y, 0, 0 )  
    elseif b == "y" then
      awful.client.moveresize( 0, 0, x, y )
    end
  else
    -- tests if changing master or slave wfact
    if a == "f" then
      awful.tag.incmwfact(mw) 
    elseif a == "t" then
      awful.client.incwfact(mw)
    end
  end
end
-- }}}

-- {{{ Tag
-- Define a tag table which hold all screen tags.
tags = {
  names = { "⮫", "⮬", "⮭", "⮮", "⮯" },
  layouts = { layouts[3], layouts[3], layouts[1], layouts[1], layouts[1] },
  mwfact = .53
}

for s = 1, screen.count() do
  tags[s] = awful.tag(tags.names, s, tags.layouts)
  -- it's a shitty loop but it works
  for i = 1, 5 do
    awful.tag.setmwfact(tags.mwfact, tags[1][i])
  end
end

-- }}}

-- {{{ menu
-- create a laucher widget and a main menu
-- submenus don't fucking work

myawesomemenu = {
  { "manual", terminal .. " -e man awesome" },
  { "edit config", editor_cmd .. " " .. awesome.conffile },
  { "restart", awesome.restart },
  { "quit", awesome.quit }
}
myscriptsmenu = {
  { "shimeji", "/home/phallus/bin/shimeji-run" },
  { "scrot", "/home/phallus/bin/scr" },
  { "set wall", "/home/phallus/bin/nr" },
  { "get cover", "/home/phallus/bin/cover_fetcher" }
}

mymainmenu = awful.menu({
  --{ "games", mygamesmenu },
  --{ "awesome", myawesomemenu },
  --{ "scripts", myscriptsmenu },
  --{ "⮶⮶⮶⮶⮶⮶⮶⮶⮶⮶⮶", }, --seperator, if desired
  items = {
    { "awesome", myawesomemenu },
    { "scripts", myscriptsmenu },
    { "⮩      term", terminal },
    { "⮷      wifi", terminal .. " -e sudo wifi-menu" },
    { "❤   shimeji", "/home/phallus/bin/shimeji-run" },
    { "⯉     scrot", "/home/phallus/bin/scr" },
    { "⮤    ranger", terminal .. " -e ranger" },
    --{ "⮤    thunar", "thunar"},
    { "⮼  nitrogen", "nitrogen" },
    { "⮗   restart", awesome.restart },
    { "⮪      lock", "/home/phallus/bin/i3lock-w" }
  }
})

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- menubar configuration
-- }}}

-- {{{ Tasklist
-- to center text, add tb:set_align("center") under tb = wibox.widget.textbox() in common.lua
tasklist = {}
tasklist.buttons = awful.util.table.join(
  awful.button({ }, 1, function (c)
    if c == client.focus then
      c.minimized = true
    else 
      if not c:isvisible() then
        awful.tag.viewonly(c:tags()[1])
      end
    client.focus = c
    c:raise()
    end
  end),
  awful.button({ }, 4, function ()
    awful.client.focus.byidx(1)
    if client.focus then 
      client.focus:raise() 
    end
  end),
  awful.button({ }, 5, function ()
    awful.client.focus.byidx(-1)
    if client.focus then
      client.focus:raise() 
    end
  end)
)

--}}}

-- {{{ Wibox
-- bat widget {{{
batwidget = wibox.widget.textbox()
monkfish.widgets.bat.register(batwidget)
vicious.register(batwidget, vicious.widgets.bat,
  function (widget, args)
    local bat = math.floor(args[2] / 10)
    if args[1] == "⌁" then
      batico = colorizei(" ⮎ ", fgr, blue)
    elseif args[1] == "↯" then
      batico = colorizei(" ⮎ ", fgr, blue)
    elseif args[1] == "+" then
      batico = colorizei(" ⮒ ", fgr, blue)
    else
      if args[2] > 59 then
        batico = colorizei(" ⮏ ", fgr, blue)
      elseif args[2] < 60 and args[2] > 20 then
        batico = colorizei(" ⮑ ", fgr, blue)
      else
        batico = colorizei(" ⮐ ", red, blue)
      end
    end
    return batico
  end, 2, "BAT0")
--}}}

-- time widget {{{
mytextclock = wibox.widget.textbox()
monkfish.widgets.calendar.register(mytextclock)
function myclock()
  local minute = tonumber(os.date("%M"))
  local clockicon = ""
  if minute > 52 or minute < 7 then
    clockicon = colorizei(" ⯊ ", fgr, purple)
  elseif minute > 6 and minute < 24 then
    clockicon = colorizei(" ⮖ ", fgr, purple)
  elseif minute > 23 and minute < 38 then
    clockicon = colorizei(" ⯋ ", fgr, purple)
  elseif minute > 37 and minute < 53 then
    clockicon = colorizei(" ⯌ ", fgr, purple)
  end
  mytextclock:set_markup(''..clockicon..' ')
end
clock_timer = timer({timeout = 1})
clock_timer:connect_signal("timeout", function() myclock() end)
clock_timer:start()
--}}}

-- net widget {{{
netwidget = wibox.widget.textbox()
monkfish.widgets.net.register(netwidget)
vicious.register(netwidget, vicious.widgets.wifi,
function (widget, args)
  local qual = tonumber(args["{link}"])
  if qual > 66 then
    neticon = colorizei(" ⮷ ", fgr, purple)
  elseif qual > 33 then
    neticon = colorizei(" ⮸ ", fgr, purple)
  elseif qual > 0 then
    neticon = colorizei(" ⮹ ", fgr, purple)
  else
    neticon = colorizei(" … ", fgr, purple)
  end
  return ''..neticon..''
end, 1, 'wlan0')
--}}}

-- mpd widget {{{
mpdwidget = wibox.widget.textbox()
monkfish.widgets.mpd.register(mpdwidget)
vicious.register(mpdwidget, vicious.widgets.mpd,
function (widget, args)
  if args["{state}"] == "Stop" then 
    muicon = colorizei(" ⮕ ", fgr, blue)
    return ''..muicon..''
  else
    if args["{state}"] == "Pause" then
      muicon = colorizei(" ⮔ ", fgr, blue)
    elseif args["{state}"] == "Play" then
      muicon = colorizei(" ⮓ ", fgr, blue)
    else
      muicon = colorizei(" ⮕ ", fgr, blue)
      return ''..muicon..''
    end
      return ''..muicon..''
  end
end, 1)
--}}}

-- vol widget {{{
volwidget = wibox.widget.textbox()
monkfish.widgets.vol.register(volwidget)
vicious.register(volwidget, vicious.widgets.volume,
  function (widget, args)
    if args[2] == "♩" or args[1] == 0 then
      volicon = colorizei(" ⮠ ", fgr, red)
    else
      if args[1] > 64 then
        volicon = colorizei(" ⮟ ", fgr, red)
      elseif args[1] > 35 and args[1] < 65 then
        volicon = colorizei(" ⮞ ", fgr, red)
      else
        volicon = colorizei(" ⮝ ", fgr, red)
      end
    end
  return ''..volicon..''
end, 1, "Master")
--}}}

-- spacers {{{
separator = wibox.widget.textbox()
spacer = wibox.widget.textbox(" ")
separator:set_text("")
--}}}

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                    )

mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = false
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function(c)
                                              c.minimized = true
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- create a text layout widget
    mylayoutbox[s] = benis.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
            awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
            awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
            awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
            awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))

    -- Create a tag list
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)
    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)
    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s, height = 11 })

    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mytaglist[s])
    left_layout:add(spacer)
    left_layout:add(mylayoutbox[s])
    left_layout:add(spacer)
    left_layout:add(spacer)
    left_layout:add(spacer)
    --left_layout:add(spacer)

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    right_layout:add(separator)
    right_layout:add(mpdwidget)
    right_layout:add(spacer)
    right_layout:add(netwidget)
    right_layout:add(spacer)
    right_layout:add(volwidget)
    right_layout:add(spacer)
    right_layout:add(batwidget)
    right_layout:add(spacer)
    right_layout:add(mytextclock)

-- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)
    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
  awful.button({ }, 3, function () mymainmenu:toggle() end)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
  awful.key({ modkey, }, "j",  awful.tag.viewprev ),
  awful.key({ modkey, }, "k",  awful.tag.viewnext ),
  awful.key({ modkey, }, "Escape", awful.tag.history.restore),
  
  -- shift focused/swap client
  awful.key({ modkey, }, "l",
    function ()
      awful.client.focus.byidx( 1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey, }, "h",
    function ()
      awful.client.focus.byidx(-1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey, "Shift" }, "o",
    function ()
      awful.client.swap.byidx( 1)
      if client.focus then client.focus:raise() end
    end),
  awful.key({ modkey, "Shift" }, "i",
    function ()
      awful.client.swap.byidx(-1)
      if client.focus then client.focus:raise() end
    end),
  
  -- Layout manipulation
  awful.key({ "Mod4", }, "space", function () awful.layout.inc(layouts,  1) end),
  awful.key({ "Mod4", "Shift" }, "space", function () awful.layout.inc(layouts, -1) end),
  
  -- Standard program
  awful.key({ modkey, "Shift" }, "q", awesome.quit),
  awful.key({ modkey, }, "Return", function () awful.util.spawn(terminal) end),
  awful.key({ modkey, }, "r", awesome.restart),
  
  -- dmenu
  awful.key({ modkey }, "d", function ()
    awful.util.spawn("dmenu_run -i -x 700 -y 400 -w 200 -h 15 -dim 0.05 -l 4 -nb '" .. 
      beautiful.bg_normal .. "' -nf '" .. beautiful.fg_normal ..
      "' -fn '" .. beautiful.font_alt ..
      "' -sb '" .. beautiful.bg_special .. 
      "' -sf '" .. beautiful.fg_focus .. "'") 
  end),
  
  -- Personal hotkeys
  awful.key({ modkey, }, "n", function () awful.util.spawn("firefox") end),
  awful.key({ "Control" }, "l", function () awful.util.spawn("mpc next") end), 
  awful.key({ "Control" }, "j", function () awful.util.spawn("amixer -q set Master 3%- unmute") end),
  awful.key({ "Control" }, "k", function () awful.util.spawn("amixer -q set Master 3%+ unmute") end),
  awful.key({ "Control" }, "h",  function () awful.util.spawn("mpc prev") end),
  awful.key({ modkey, }, "p", function () awful.util.spawn("mpc toggle") end),
  awful.key({ "Mod4" }, "k", function () awful.util.spawn("xbacklight -inc 5") end),
  awful.key({ "Mod4" }, "j", function () awful.util.spawn("xbacklight -dec 5") end)
)

-- Client control keys
clientkeys = awful.util.table.join(
  awful.key({ modkey, }, "c", function (c) c:kill() end),
  awful.key({ modkey, }, "t", awful.client.floating.toggle ),
  awful.key({ modkey, }, "m", function (c) c:swap(awful.client.getmaster()) end),
  awful.key({ modkey, "Shift"}, "j", function(c) move(c, 0, 10, 0.011, "t", "n") end),
  awful.key({ modkey, "Shift"}, "k", function(c) move(c, 0, -10, -0.011, "t", "n") end),
  awful.key({ modkey, "Shift"}, "h", function(c) move(c, -10, 0, -.010, "f", "n") end),
  awful.key({ modkey, "Shift"}, "l", function(c) move(c, 10, 0, .010, "f", "n") end),
  awful.key({ modkey, "Shift" }, "s", function (c) move(c, 0, -10, -.011, "t", "y") end),
  awful.key({ modkey, "Shift" }, "d", function (c) move(c, 0, 10, .011, "t", "y") end),
  awful.key({ modkey, "Shift" }, "a", function (c) move(c, -10, 0, -.01, "f", "y") end),
  awful.key({ modkey, "Shift" }, "f", function (c) move(c, 10, 0, .01, "f", "y") end),
  awful.key({ modkey, "Shift" }, "m",
    function (c)
      c.maximized_horizontal = not c.maximized_horizontal
      c.maximized_vertical   = not c.maximized_vertical
    end)
)

-- Compute the maximum number of digit we need, limited to 9
keynumber = 0
for s = 1, screen.count() do
  keynumber = math.min(9, math.max(#tags[s], keynumber))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, keynumber do
  globalkeys = awful.util.table.join(globalkeys,
    awful.key({ modkey }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        if tags[screen][i] then
          awful.tag.viewonly(tags[screen][i])
        end
      end),
    awful.key({ modkey, "Control" }, "#" .. i + 9,
      function ()
        local screen = mouse.screen
        if tags[screen][i] then
          awful.tag.viewtoggle(tags[screen][i])
        end
      end),
    awful.key({ modkey, "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.movetotag(tags[client.focus.screen][i])
        end
      end),
    awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
      function ()
        if client.focus and tags[client.focus.screen][i] then
          awful.client.toggletag(tags[client.focus.screen][i])
        end
      end)
  )
end

clientbuttons = awful.util.table.join(
  awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
  awful.button({ modkey }, 1, awful.mouse.client.move),
  awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
  { rule = { },
    properties = { 
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      keys = clientkeys,
      buttons = clientbuttons,
      size_hints_honor = false
    }, 
    callback = awful.client.setslave
  },
  --album art popup
  { rule = { name = "aart" },
    properties = { 
      border_color = beautiful.border_normal,
      focus = false,
      floating = true,
      raise = true,
      ontop = true,
      sticky = true,
      skip_taskbar = true } },
  { rule = { instance = "sun-awt-X11-XWindowPeer"},
    properties = { floating = true, border_width = 0 } },
  { rule = { instance = "Download" },
    properties = { floating = true } },
  { rule = { name = "Firefox Preferences" },
    properties = { floating = true } },
  { rule = { instance = "Devtools" },
    properties = { floating = true } },
  { rule = { name = "ImageMagick:" },
    properties = { floating = true } },
  { rule = { class = "mpv" },
    properties = { floating = true },},
  --{ rule = { class = "mpv" },
    --properties = { 
      --floating = true, 
      --maximized_horizontal = true, 
      --maximized_vertical = true },},
  { rule_any = { class = { "feh" } },
    properties = { floating = true } },
  { rule_any = { class = { "Steam" } },
    properties = { 
      floating = true,
      tag = tags[1][2] } },
  --these break with 3.5.9
  { rule = { name = "llpp" },
    callback = function (c) c:swap(awful.client.getmaster()) end, },
  { rule_any = { instance = { "Navigator" } },
    callback = function (c) c:swap(awful.client.getmaster()) end, }
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.center_horizontal(c)
            awful.placement.center_vertical(c)
        end
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}
