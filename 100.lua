print("please enter data")
local i,j,s
arr={}
ave=0
for i=1,5 do
	for j=1,5 do
		arr[i][j]=io.read("*a")
		--print(arr[i][j])
	end
end

for i=1,5 do
	for j=3,5 do
		ave=ave+arr[i][j]
	end
	ave=ave/3
	arr[i][6]=
end

for i=1,5 do
	for j=1,6 do
		print(arr[i][j])
	end
end
