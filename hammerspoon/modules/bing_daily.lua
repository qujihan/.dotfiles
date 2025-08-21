local obj={}

obj.__index = obj
obj.uhd_resolution = false

local function curl_callback(exitCode, stdOut, stdErr)
    if exitCode == 0 then
        obj.task = nil
        obj.last_pic = obj.file_name
        local localpath = os.getenv("HOME") .. "/.Trash/" .. obj.file_name

        -- set wallpaper for all screens
        allScreen = hs.screen.allScreens()
        for _,screen in ipairs(allScreen) do
            screen:desktopImageURL("file://" .. localpath)
        end
    else
        print(stdOut, stdErr)
    end
end

local function bingRequest()
    hs.notify.new({title="Bing Daily", informativeText="Bing每日壁纸"}):send()
    local user_agent_str = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_5) AppleWebKit/603.2.4 (KHTML, like Gecko) Version/10.1.1 Safari/603.2.4"
    local json_req_url = "http://www.bing.com/HPImageArchive.aspx?format=js&idx=0&n=1"
    hs.http.asyncGet(json_req_url, {["User-Agent"]=user_agent_str}, function(stat,body,header)
        if stat == 200 then
            if pcall(function() hs.json.decode(body) end) then
                local decode_data = hs.json.decode(body)
                local pic_url = decode_data.images[1].url
                if obj.uhd_resolution then
                    pic_url = pic_url:gsub("1920x1080", "UHD")
                end
                local pic_name = "pic-temp-spoon.jpg"
                for k, v in pairs(hs.http.urlParts(pic_url).queryItems) do
                    if v.id then
                        pic_name = v.id
                        break
                    end
                end
                if obj.last_pic ~= pic_name then
                    obj.file_name = pic_name
                    obj.full_url = "https://www.bing.com" .. pic_url
                    if obj.task then
                        obj.task:terminate()
                        obj.task = nil
                    end
                    local localpath = os.getenv("HOME") .. "/.Trash/" .. obj.file_name
                    obj.task = hs.task.new("/usr/bin/curl", curl_callback, {"-A", user_agent_str, obj.full_url, "-o", localpath})
                    obj.task:start()
                end
            end
        else
            print("Bing URL request failed!")
        end
    end)
end

function obj:init()
    if obj.timer == nil then
        obj.timer = hs.timer.doEvery(6*60*60, function() bingRequest() end)
        obj.timer:setNextTrigger(5)
    else
        obj.timer:start()
    end
end

return obj
