

local arr={1,2,3,4,5,6,7,8,9,10,11}
local a=22
for i=1,11 do
	for j=2,11 do
		if arr[i]+arr[j] == a then
			print(arr[i] .. "+" .. arr[j])
		else
			--print("none")
		end
	end
end
