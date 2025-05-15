local mouseButton = {}

local threshold = 5
local coefficient = 2
local offset = 3
IsRightDrag = false

-- ctrl
local function CtrlPressed(modifiers)
    return modifiers.ctrl and not (modifiers.alt or modifiers.shift or modifiers.cmd or modifiers.fn)
end

-- cmd
local function CmdPressed(modifiers)
    return modifiers.cmd and not (modifiers.alt or modifiers.shift or modifiers.ctrl or modifiers.fn)
end

-- ctrl + cmd
local function CtrlCmdPressed(modifiers)
    return modifiers.ctrl and modifiers.cmd and not (modifiers.alt or modifiers.shift or modifiers.fn)
end

-- 向上滚动
local function ScroolUp(direction)
    return (direction > 0)
end

-- 向下滚动
local function ScroolDown(direction)
    return (direction < 0)
end

local function CtrlWithRight()
    hs.task.new("/usr/bin/osascript", nil,
        { "-e", 'tell application "System Events" to key code 123 using control down' }):start()
end

local function CtrlWithLeft()
    hs.task.new("/usr/bin/osascript", nil,
        { "-e", 'tell application "System Events" to key code 124 using control down' }):start()
end

local function CtrlWithDown()
    hs.task.new("/usr/bin/osascript", nil,
        { "-e", 'tell application "System Events" to key code 125 using control down' }):start()
end

local function CtrlWithUp()
    hs.task.new("/usr/bin/osascript", nil,
        { "-e", 'tell application "System Events" to key code 126 using control down' }):start()
end

local function StopThenStartWithTime(Event)
    Event:stop()
    os.execute("sleep 0.15")
    Event:start()
end

local function StopThenStartWithFunc(Event, func)
    Event:stop()
    func()
    Event:start()
end


local function middleButtonScrollEventFunc(event)
    local keyboardModifiers = hs.eventtap.checkKeyboardModifiers()
    local direction = event:getProperty(hs.eventtap.event.properties.scrollWheelEventFixedPtDeltaAxis1)

    local updateVolume = function(oft)
        local currentVolume = hs.audiodevice.defaultOutputDevice():volume()
        hs.audiodevice.defaultOutputDevice():setVolume(currentVolume + oft)
    end

    if ScroolUp(direction) then
        if CmdPressed(keyboardModifiers) then
            hs.eventtap.keyStroke("cmd", "=", 0) -- up + cmd = cmd + '+'
        elseif CtrlPressed(keyboardModifiers) then
            hs.eventtap.keyStroke("cmd", "=", 0) -- up + ctrl = cmd + '+'
        elseif CtrlCmdPressed(keyboardModifiers) then
            updateVolume(offset)                 -- up + ctrl + cmd = 调节音量升高
        else
            return false
        end
        return true
    elseif ScroolDown(direction) then
        if CmdPressed(keyboardModifiers) then
            hs.eventtap.keyStroke("cmd", "-", 0) -- down + cmd
        elseif CtrlPressed(keyboardModifiers) then
            hs.eventtap.keyStroke("cmd", "-", 0) -- down + ctrl
        elseif CtrlCmdPressed(keyboardModifiers) then
            updateVolume(-offset)                -- down + ctrl + cmd = 调节音量降低
        else
            return false
        end
        return true
    end
    return false
end

local function MiddleButtonDragEventFunc(event)
    local dx = event:getProperty(hs.eventtap.event.properties.mouseEventDeltaX)
    local dy = event:getProperty(hs.eventtap.event.properties.mouseEventDeltaY)
    if dx > threshold then
        CtrlWithRight()
    elseif dx < -threshold then
        CtrlWithLeft()
    elseif dy > threshold * coefficient then
        CtrlWithDown()
    elseif dy < -threshold * coefficient then
        CtrlWithUp()
    else
        return false
    end
    StopThenStartWithTime(MiddleClickWatch)
    return true
end

local function otherButtonEventFunc(event)
    if event:getProperty(hs.eventtap.event.properties.mouseEventButtonNumber) == 2 then
        return MiddleButtonDragEventFunc(event)
    end
    return false
end


local function rightButtonDragEventFunc(event)
    local direction = event:getProperty(hs.eventtap.event.properties.mouseEventDeltaX)
    if direction > 0 and direction < threshold then
        return false
    end
    if direction < 0 and direction > -threshold then
        return false
    end
    IsRightDrag = true

    local mousePoint = hs.mouse.absolutePosition()
    local allScreens = hs.screen.allScreens()
    local currScreen = nil

    for _, screen in ipairs(allScreens) do
        local screenFrame = screen:frame()
        if mousePoint.x >= screenFrame.x and mousePoint.x <= (screenFrame.x + screenFrame.w) and
            mousePoint.y >= screenFrame.y and mousePoint.y <= (screenFrame.y + screenFrame.h) then
            -- 鼠标在当前窗口中 记录下来
            currScreen = screen
        end
    end

    if currScreen == nil then
        return false
    end

    hs.window.animationDuration = 0.3
    if direction > 0 then
        hs.window.focusedWindow():moveToScreen(currScreen:next())
        StopThenStartWithTime(RightButtonDragForMoveAppWatcher)
        return true
    else
        hs.window.focusedWindow():moveToScreen(currScreen:previous())
        StopThenStartWithTime(RightButtonDragForMoveAppWatcher)
        return true
    end
end

-- return true: 表示我这里处理了, 不要触发系统的按键了
-- 表示信号到我这就结束了, 不接着往下传了
-- return false: 表示我这里处理不了, 原来咋处理就咋处理吧
-- 表示我处理不了, 信号接着往下传
function mouseButton:init()
    -- 当滚轮滚动时触发事件
    ScrollWatch = hs.eventtap.new(
        {
            hs.eventtap.event.types.scrollWheel
        },
        middleButtonScrollEventFunc
    )
    ScrollWatch:start()

    -- 当其他按键被点击以及拖拽时
    MiddleClickWatch = hs.eventtap.new(
        {
            hs.eventtap.event.types.otherMouseDown,
            hs.eventtap.event.types.otherMouseUp,
            hs.eventtap.event.types.otherMouseDragged
        },
        otherButtonEventFunc
    )
    MiddleClickWatch:start()

    -- 左键被点击时触发事件
    RIME_ID = "im.rime.inputmethod.Squirrel.Hans"
    LeftButtonForInputWatcher = hs.eventtap.new(
        {
            hs.eventtap.event.types.leftMouseDown
        },
        function(event)
            local source_id = hs.keycodes.currentSourceID()
            if source_id ~= RIME_ID then
                hs.keycodes.currentSourceID(RIME_ID)
            end
            return false
        end)
    LeftButtonForInputWatcher:start()

    -- 右键将窗口移动到另一个屏幕
    RightButtonDragForMoveAppWatcher = hs.eventtap.new(
        {
            hs.eventtap.event.types.rightMouseDragged,
            -- hs.eventtap.event.types.rightMouseUp,
            -- hs.eventtap.event.types.rightMouseDown,
        },
        rightButtonDragEventFunc
    )
    RightButtonDragForMoveAppWatcher:start()

    RightButtonUpWatcher = hs.eventtap.new(
        {
            hs.eventtap.event.types.rightMouseUp,
        },
        function(event)
            if not IsRightDrag then
                StopThenStartWithFunc(RightButtonDownWatcher, function()
                    hs.eventtap.event.newMouseEvent(
                        hs.eventtap.event.types.rightMouseDown,
                        hs.mouse.absolutePosition()
                    ):post()
                end)
            end
            return false
        end
    )
    RightButtonUpWatcher:start()

    RightButtonDownWatcher = hs.eventtap.new(
        {
            hs.eventtap.event.types.rightMouseDown,
        },
        function(event)
            IsRightDrag = false
            return true
        end
    )
    RightButtonDownWatcher:start()
end

return mouseButton
