local mouse_volume = {}

local adject_size = 3

function mouse_volume:init()
    hs.hotkey.bind({ "ctrl", "shift" }, "v",
        function()
            self.scrollWatcher = hs.eventtap.new({ hs.eventtap.event.types.scrollWheel }, function(event)
                local currentMods = hs.eventtap.checkKeyboardModifiers()
                if currentMods['ctrl'] and currentMods['shift'] then
                    local direction = event:getProperty(hs.eventtap.event.properties.scrollWheelEventFixedPtDeltaAxis2)
                    local device = hs.audiodevice.defaultOutputDevice()
                    local currentVolume = device:volume()

                    if direction > 0 then
                        if currentVolume < 100 then
                            device:setVolume(math.min(100, currentVolume + adject_size))
                        end
                    elseif direction < 0 then
                        if currentVolume > 0 then
                            device:setVolume(math.max(0, currentVolume - adject_size))
                        end
                    end
                    return true
                end
                return false
            end)
            self.scrollWatcher:start()
        end,
        function()
            if self.scrollWatcher then
                self.scrollWatcher:stop()
                self.scrollWatcher = nil
            end
        end
    )
end

return mouse_volume
