local string = string
local tostring = tostring
local os = os
local capi = {
    mouse = mouse,
    screen = screen
}
local awful = require("awful")
local naughty = require("naughty")
module("monkfish.widgets.vol")

function register(mywidget)
    mywidget:buttons(awful.util.table.join(
    awful.button({ }, 1, 
      function()
          awful.util.spawn_with_shell("/home/phallus/.config/awesome/monkfish/widgets/scripts/d-vol")
      end),
    awful.button({ }, 3,
      function()
          awful.util.spawn_with_shell("urxvt -e alsamixer")
      end)
   ))
end

