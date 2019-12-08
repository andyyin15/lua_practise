arr={}
local n=1
local m=1
local tamp=0
for i=1,10000,1 do
	arr[i]=math.random(1,100000)

end

function bubble_sort(arr)
local start = os.clock()
for n=1,#arr-1 do
	for m=1,#arr-n do

		if arr[m]>arr[m+1] then
			temp=arr[m]
			arr[m]=arr[m+1]
			arr[m+1]=temp

		end
	end


end
local end1 = os.clock()
print(tostring(end1 - start))
end
bubble_sort(arr)
