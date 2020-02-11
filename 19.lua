local i,j
arr={}
for i=1,3 do
	if not arr[i] then
		arr[i]={}
		for j=1,3 do
			if not arr[i][j] then
				arr[i][j]=1
			end
		end
   end
end
