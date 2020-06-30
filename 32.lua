local file,a,b,c,i,d
file = io.open("test.txt","w+")

print("please enter a string")
a=io.read()
b=string.upper(a)
arr={}
for i=1,#b do
	arr[i]=string.sub(b,i,i)
end

arr[#b+1]="!"
c=arr[#b+1]

for i=1,#arr do
	print(arr[i])
end


d=b.."!"
file:write(d)


print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk")
for k,v in pairs(package.loaded) do
	print(k)
end
