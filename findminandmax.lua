如何在未排序整数数组中找到最大值和最小值?
先自己设一个min 和max，然后遍历整数组
arr={4,3,5,55,2,44,1,6,4,7,77,45,3,55}
local min=0
local max=0
for i=1,#arr do
	if min<arr[i] then
		min=arr[i]
	end
	if max>arr[i] then
		max=arr[i]
	end
end
print(min)
print(max)
