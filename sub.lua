a="{1,88888,60级职业套装}&<R{30023},{40013},{50013},{60013}&>"
b= string.find(a,"&<")
c = string.sub(a,1,b-1)
print(c)
d = string.find(c,",",1)
print(string.sub(c,2,d-1))

e = string.find(c,",",4)
print("e="..e)
print(string.sub(c,d+1,e-1))
print(string.sub(c,e+1,-2))

f,g= string.find(a,"<R(.-)&>")
print(f)
print(g)
H = string.sub(a,26,56)
print(string.sub(a,26,56))
print(H)
print(string.gsub(H,","," "))


arr = {}
for item in string.gmatch(H,"%{(.-)%}") do
	table.insert(arr,item)
end

print(unpack(arr))
--print(#arr)
