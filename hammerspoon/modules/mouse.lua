-- 中键(滚轮键)
local changSpaceByMouse = hs.eventtap.new({ hs.eventtap.event.types.otherMouseDragged }, function(e)
    local mouseButton = e:getProperty(hs.eventtap.event.properties['mouseEventButtonNumber'])
    local scrollMouseButton = 2
    if scrollMouseButton == mouseButton then 
        -- hs.alert.show("scroll")
    end
end)
changSpaceByMouse:start()