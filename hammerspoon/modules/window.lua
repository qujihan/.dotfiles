hs.window.animationDuration = 0.3

hs.hotkey.bind({"ctrl","cmd"}, "d", function()
  screen = hs.screen.mainScreen()
  hs.window.focusedWindow():moveToScreen(screen:next())
end)