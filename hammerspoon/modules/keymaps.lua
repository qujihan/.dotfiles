local keymaps = {}

local function pressFn(mods, key)
	if key == nil then
		key = mods
		mods = {}
	end

	return function() hs.eventtap.keyStroke(mods, key, 1000) end
end

local function remap(mods, key, pressFn)
	hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end

local function baseMove(x, y, w, h)
	return function()
		local win = hs.window.focusedWindow()
		local f = win:frame()
		local screen = win:screen()
		local max = screen:frame()

		-- add max.x so it stays on the same screen, works with my second screen
		f.x = max.w * x + max.x -- 水平位置
		f.y = max.h * y + max.y -- 垂直位置
		f.w = max.w * w   -- 宽度
		f.h = max.h * h   -- 高度
		win:setFrame(f, 0)
	end
end

-- 移动窗口到目标显示器并保持相对位置
local function moveWindowToScreen(window, targetScreen)
	local currentFrame = window:frame()
	local currentScreen = window:screen()
	local targetFrame = targetScreen:frame()

	-- 计算当前窗口在原屏幕中的相对位置比例
	local xRatio = (currentFrame.x - currentScreen:frame().x) / currentScreen:frame().w
	local yRatio = (currentFrame.y - currentScreen:frame().y) / currentScreen:frame().h
	local wRatio = currentFrame.w / currentScreen:frame().w
	local hRatio = currentFrame.h / currentScreen:frame().h

	-- 计算目标屏幕中的新位置和大小
	local newFrame = {
		x = targetFrame.x + (targetFrame.w * xRatio),
		y = targetFrame.y + (targetFrame.h * yRatio),
		w = targetFrame.w * wRatio,
		h = targetFrame.h * hRatio
	}

	window:setFrame(newFrame)
end

-- 通用方向移动函数 (支持 left/right/up/down)
local function moveWindowToDirection(direction)
	local currentWindow = hs.window.focusedWindow()
	if not currentWindow then return end

	local currentScreen = currentWindow:screen()
	local currentFrame = currentScreen:frame()
	local allScreens = hs.screen.allScreens()
	local targetScreen = nil

	for _, screen in ipairs(allScreens) do
		local screenFrame = screen:frame()
		local isMatch = false

		-- 根据方向判断匹配的显示器
		if direction == "left" then
			-- 目标屏幕右边界 <= 当前屏幕左边界 (无重叠)
			isMatch = (screenFrame.x + screenFrame.w) <= currentFrame.x
		elseif direction == "right" then
			-- 目标屏幕左边界 >= 当前屏幕右边界 (无重叠)
			isMatch = screenFrame.x >= (currentFrame.x + currentFrame.w)
		elseif direction == "up" then
			-- 目标屏幕下边界 <= 当前屏幕上边界 (无重叠)
			isMatch = (screenFrame.y + screenFrame.h) <= currentFrame.y
		elseif direction == "down" then
			-- 目标屏幕上边界 >= 当前屏幕下边界 (无重叠)
			isMatch = screenFrame.y >= (currentFrame.y + currentFrame.h)
		end

		-- 找到最近的目标显示器
		if isMatch then
			if not targetScreen then
				targetScreen = screen
			else
				local currentDist = (direction == "left" or direction == "right") and
					math.abs(screenFrame.x - currentFrame.x) or
					math.abs(screenFrame.y - currentFrame.y)
				local targetDist = (direction == "left" or direction == "right") and
					math.abs(targetScreen:frame().x - currentFrame.x) or
					math.abs(targetScreen:frame().y - currentFrame.y)
				if currentDist < targetDist then
					targetScreen = screen
				end
			end
		end
	end

	if targetScreen then
		moveWindowToScreen(currentWindow, targetScreen)
	end
end

function keymaps:init()
	-- vim 模式
	remap({ 'ctrl' }, 'h', pressFn('left'))
	remap({ 'ctrl' }, 'j', pressFn('down'))
	remap({ 'ctrl' }, 'k', pressFn('up'))
	remap({ 'ctrl' }, 'l', pressFn('right'))

	remap({ 'ctrl', 'shift' }, 'h', pressFn({ 'shift' }, 'left'))
	remap({ 'ctrl', 'shift' }, 'j', pressFn({ 'shift' }, 'down'))
	remap({ 'ctrl', 'shift' }, 'k', pressFn({ 'shift' }, 'up'))
	remap({ 'ctrl', 'shift' }, 'l', pressFn({ 'shift' }, 'right'))

	remap({ 'ctrl', 'cmd' }, 'h', pressFn({ 'cmd' }, 'left'))
	remap({ 'ctrl', 'cmd' }, 'j', pressFn({ 'cmd' }, 'down'))
	remap({ 'ctrl', 'cmd' }, 'k', pressFn({ 'cmd' }, 'up'))
	remap({ 'ctrl', 'cmd' }, 'l', pressFn({ 'cmd' }, 'right'))

	remap({ 'ctrl', 'alt' }, 'h', pressFn({ 'alt' }, 'left'))
	remap({ 'ctrl', 'alt' }, 'j', pressFn({ 'alt' }, 'down'))
	remap({ 'ctrl', 'alt' }, 'k', pressFn({ 'alt' }, 'up'))
	remap({ 'ctrl', 'alt' }, 'l', pressFn({ 'alt' }, 'right'))

	remap({ 'ctrl', 'shift', 'cmd' }, 'h', pressFn({ 'shift', 'cmd' }, 'left'))
	remap({ 'ctrl', 'shift', 'cmd' }, 'j', pressFn({ 'shift', 'cmd' }, 'down'))
	remap({ 'ctrl', 'shift', 'cmd' }, 'k', pressFn({ 'shift', 'cmd' }, 'up'))
	remap({ 'ctrl', 'shift', 'cmd' }, 'l', pressFn({ 'shift', 'cmd' }, 'right'))

	remap({ 'ctrl', 'shift', 'alt' }, 'h', pressFn({ 'shift', 'alt' }, 'left'))
	remap({ 'ctrl', 'shift', 'alt' }, 'j', pressFn({ 'shift', 'alt' }, 'down'))
	remap({ 'ctrl', 'shift', 'alt' }, 'k', pressFn({ 'shift', 'alt' }, 'up'))
	remap({ 'ctrl', 'shift', 'alt' }, 'l', pressFn({ 'shift', 'alt' }, 'right'))

	remap({ 'ctrl', 'cmd', 'alt' }, 'h', pressFn({ 'cmd', 'alt' }, 'left'))
	remap({ 'ctrl', 'cmd', 'alt' }, 'j', pressFn({ 'cmd', 'alt' }, 'down'))
	remap({ 'ctrl', 'cmd', 'alt' }, 'k', pressFn({ 'cmd', 'alt' }, 'up'))
	remap({ 'ctrl', 'cmd', 'alt' }, 'l', pressFn({ 'cmd', 'alt' }, 'right'))

	remap({ 'ctrl', 'cmd', 'alt', 'shift' }, 'h', pressFn({ 'cmd', 'alt', 'shift' }, 'left'))
	remap({ 'ctrl', 'cmd', 'alt', 'shift' }, 'j', pressFn({ 'cmd', 'alt', 'shift' }, 'down'))
	remap({ 'ctrl', 'cmd', 'alt', 'shift' }, 'k', pressFn({ 'cmd', 'alt', 'shift' }, 'up'))
	remap({ 'ctrl', 'cmd', 'alt', 'shift' }, 'l', pressFn({ 'cmd', 'alt', 'shift' }, 'right'))


	-- ctrl + shift + cmd + wasd/c 窗口布局
	hs.hotkey.bind({ 'ctrl', 'shift', 'cmd' }, 'w', baseMove(0, 0, 1, 0.5))
	hs.hotkey.bind({ 'ctrl', 'shift', 'cmd' }, 'a', baseMove(0, 0, 0.5, 1))
	hs.hotkey.bind({ 'ctrl', 'shift', 'cmd' }, 's', baseMove(0, 0.5, 1, 0.5))
	hs.hotkey.bind({ 'ctrl', 'shift', 'cmd' }, 'd', baseMove(0.5, 0, 0.5, 1))

	hs.hotkey.bind({ 'ctrl', 'shift', 'cmd' }, 'c', baseMove(0.2, 0.1, 0.7, 0.8))

	-- alt + wasd 移动窗口
	hs.hotkey.bind({ "alt" }, 'w', function() moveWindowToDirection("up") end)
	hs.hotkey.bind({ "alt" }, 'a', function() moveWindowToDirection("left") end)
	hs.hotkey.bind({ "alt" }, 's', function() moveWindowToDirection("down") end)
	hs.hotkey.bind({ "alt" }, 'd', function() moveWindowToDirection("right") end)


	-- ctrl + 0: 句首
	-- ctrl + $: 句尾
	remap({ 'ctrl' }, '0', pressFn({ 'cmd' }, 'left'))
	remap({ 'ctrl', 'shift' }, '4', pressFn({ 'cmd' }, 'right'))

	-- ctrl + shift + esc 打开活动监视器
	remap({ 'ctrl', 'shift' }, 'escape', function()
		hs.application.launchOrFocus("/System/Applications/Utilities/Activity Monitor.app")
	end)
end

return keymaps
