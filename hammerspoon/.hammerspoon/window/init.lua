-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Windows Management                                                          │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
local function winresize(operation)
   local win = hs.window.focusedWindow()
   local newrect

   if operation == "left" then
      newrect = hs.layout.left50
   elseif operation == "right" then
      newrect = hs.layout.right50
   elseif operation == "up" then
      newrect = {0,0,1,0.5}
   elseif operation == "down" then
      newrect = {0,0.5,1,0.5}
   elseif operation == "max" then
      newrect = hs.layout.maximized
   end
   win:move(newrect)
end

local function winmovescreen(operation)
   local win = hs.window.focusedWindow()
   if operation == "left" then
      win:moveOneScreenWest()
   elseif operation == "right" then
      win:moveOneScreenEast()
   end
end

-- ╭──────────────────────────────────────────────────────────────────────────────╮
-- │  Key bindings                                                                │
-- ╰──────────────────────────────────────────────────────────────────────────────╯
-- Halves of the screen
hs.hotkey.bind({"ctrl","cmd"}, "a",  hs.fnutils.partial(winresize, "left"))
hs.hotkey.bind({"ctrl","cmd"}, "d", hs.fnutils.partial(winresize, "right"))
hs.hotkey.bind({"ctrl","cmd"}, "w",    hs.fnutils.partial(winresize, "up"))
hs.hotkey.bind({"ctrl","cmd"}, "s",  hs.fnutils.partial(winresize, "down"))
-- Move between screens
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Left",  hs.fnutils.partial(winmovescreen, "left"))
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "Right", hs.fnutils.partial(winmovescreen, "right"))
