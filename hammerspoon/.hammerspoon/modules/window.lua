hs.window.animationDuration = 0

-- move application between screen
hs.hotkey.bind({"ctrl","cmd"}, "d", function()
  screen = hs.screen.mainScreen():next()
  hs.window.focusedWindow():moveToScreen(screen)
end)