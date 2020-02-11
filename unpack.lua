arr= {1,12,343,34}
--print(unpack(arr,2))

function unpackfunc(t,i)
	i = i or 1
	if t[i] then
		print(t[i])
		return t[i] , unpackfunc(t,i+1)
	end
end
unpackfunc(arr)
