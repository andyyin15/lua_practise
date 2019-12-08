arr={}
local a,i,s,t
s=15
a="www.runoob.com"
for i=1,#a do
	arr[i]=string.sub(a,i,i)
end


for i=1,7 do
	t=arr[i]
	arr[i]=arr[15-i]
	arr[15-i]=t

end

for i=1,14 do
	print(arr[i])
end
