local i,k
arr={}
arr1={}
for k=1,100 do
	arr[k]=k
end
for i=2,99 do
	for j=2,99 do
		if i~=j and i%j==0  then
			arr1[i]=print(i)
			break
		end
	end
end

for i=#arr1,1,-1 do
	for j=#arr,1,-1 do
		if arr1[i]==arr[j] then
			table.remove(arr,j)
		end
	end
end

for k,v in pairs(arr) do
	print(arr[k])
end
