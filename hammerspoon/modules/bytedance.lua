local bytedance_kinit={}

-- for test
-- local command = "date | tee -a /Users/bytedance/test.txt"
local command = "kinit --keychain qujihan@BYTEDANCE.COM"



local KinitOnwakeTask = hs.caffeinate.watcher.new(
    function()
        if eventType == hs.caffeinate.watcher.systemDidWask then
            hs.execute(command)  
        end
    end
)

local KinitTimerTask = hs.timer.doEvery(
    -- 3 hours
    1 * 60 * 60 * 3, 
    function()
        hs.execute(command)
    end
)

function bytedance_kinit:init()
    KinitOnwakeTask:start()
    KinitTimerTask:start()
end


return bytedance_kinit