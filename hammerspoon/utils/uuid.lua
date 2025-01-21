local uuid_helper = {}

local command = "system_profiler SPHardwareDataType | awk '/Hardware UUID:/ { print $3 }' "

function uuid_helper:get_uuid()
  local uuid = hs.execute(command)
  return uuid:sub(1,36)
end

return uuid_helper
