local input_set = {}

rime_source_id = "im.rime.inputmethod.Squirrel.Hans"

function input_set:init()
    mouseWatcher = hs.eventtap.new({ hs.eventtap.event.types.leftMouseDown }, function(event)
        source_id = hs.keycodes.currentSourceID()
        if source_id ~= rime_source_id then
            hs.keycodes.currentSourceID(rime_source_id)
        end
        return false
    end)
    mouseWatcher:start()
end

return input_set
