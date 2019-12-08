arr={1,2,3,4,5,6,7}
s=0
function biggest()

	for i=1,#arr-1,1 do
		if arr[i]<arr[i+1] then
		s=arr[i+1]
		else
		s=arr[i]
		end


	end
	print(s)
	return s



end


biggest(arr)

