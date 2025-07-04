local bytedance_kinit = {}
local command = "kinit --keychain qujihan.qjh@BYTEDANCE.COM"

function bytedance_kinit:init()
    local KinitOnwakeTask = hs.caffeinate.watcher.new(
        function()
            if eventType == hs.caffeinate.watcher.systemDidWask then
                hs.execute(command)
            end
        end
    )
    KinitOnwakeTask:start()

    local KinitTimerTask = hs.timer.doEvery(
        1 * 60 * 60 * 3, -- 3 hours
        function()
            hs.execute(command)
        end
    )
    KinitTimerTask:start()
end

return bytedance_kinit
