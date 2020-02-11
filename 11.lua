arr={1,2,3,3,2,4,5,6,7,7}
a={}
b={}
function unique(arr)
for k,v in pairs(arr) do

	if not a[v] then
		a[v]=1
		b[v]=1
	end

	--return a

end

end
unique(arr)
for k,v in pairs(a) do
	print(a[k])

end
print(unpack(a))
print(#a)
