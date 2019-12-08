local file1,file2,file3,a,b,c,i
file1=io.open("A.txt","w+")
file1:write("qweasdZXC")
file1:close()
file1=io.open("A.txt","r+")
for line in io.lines("A.txt") do
	a=line
end
file1:close()

file2=io.open("B.txt","w+")
b=file2:write("poiLKJMNBHU")

file2:close()
file2=io.open("B.txt","r+")
for line in io.lines("B.txt") do
	b=line
end
file2:close()


c=a..b
arr={}
for i=1,#c do
	arr[i]=string.sub(c,i,i)
	print(arr[i])
end
table.sort(arr)
file3=io.open("C.txt","w+")
for i=1,#arr do

	file3:write(arr[i])
end
