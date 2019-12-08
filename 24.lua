local a
local arr={}
for i=1,3 do
	--if not arr[i] then
		arr[i]={}
	--end
	for j=1,3 do

		arr[i][j]="*"
		--print(arr[i][j])
	end
end
for i=1,3 do
	for j=1,4-i do
		print('a')
	end
end
