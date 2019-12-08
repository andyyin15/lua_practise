local v1 = 10
local v2 = 20
local i
for i=1,30 do
	--do return end
	if i+2 == v1 then
		return print(i)
	elseif i+2 == v2 then
		break
	elseif i > 30 then
		print(hello)
	else
		--print(i)
	end

end
