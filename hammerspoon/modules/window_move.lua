
local windows_move = {}

local changSpaceByMouse = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDragged }, function(e)
    local mouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])
    -- 2 == 中键(滚轮键)
    local scrollMouseButton = 2
    if scrollMouseButton == mouseButton then 
        -- hs.alert.show("scroll")
    end
end)

function windows_move:init()
    changSpaceByMouse:start()
end

return windows_move