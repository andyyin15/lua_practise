
local atals = io.open("atlas.txt", "r")
local newtxt = io.open("out.lua","w")
newtxt:write("a = {}\n")

for line in atals:lines() do
	tempTable = {}

	for i in string.gmatch(line,"%S+") do
		tempTable[#tempTable+1] = i
	end

	local name = tempTable[1]
    local width = tempTable[2]
    local height = tempTable[3]
	local x = math.floor(1024 * (tonumber(tempTable[4])) + 0.1)
	local y = math.floor(1024 * (tonumber(tempTable[5])) + 0.1)

	newtxt:write(string.format("a[\"%s\"]={width=%s, height=%s, x=%s, y=%s}\n", name, width, height, x, y))


end
newtxt:close()

