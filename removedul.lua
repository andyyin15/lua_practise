local n = 1
nums = {0,0,1,1,1,2,2,3,3,4,5,5}
arr ={}

print(nums[#nums])

for j=0,nums[#nums] do
	for i=0,#nums do
		if nums[i] == j then
			arr[j] = nums[i]
			break
		end
	end
end

--print(n)
for i =1 ,5 do
	print(arr[i])
end
