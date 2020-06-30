local file = io.open("aa.txt","r+")
--file:write(1234124)
io.output(file)
arr= {}
for line in file:lines() do
	arr[#arr+1] = line .. "\n"
end

print(arr[2])

local a = "qwe123 hello rwe238d8dc9d9"
print(string.match(a,"%d+"))
print(string.gmatch(a,"%d+"))

func = string.gmatch(a,"%d+")
print(func())

for v in string.gmatch(a,"%a+") do
	print(v)
end
