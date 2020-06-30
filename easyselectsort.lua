arr = {2,1,4,33,2,12,55,34,123,4,22,5}

local n = 1
local temp =-1
for i=1,#arr-1 do
	n=n+1
	for j=n,#arr do
		if arr[i]>arr[j] then
			temp = arr[i]
			arr[i] = arr[j]
			arr[j] = temp

		end
	end

end

print(unpack(arr))
for z=1,#arr do
	print(arr[z])
end

