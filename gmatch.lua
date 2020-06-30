a = "qwe asd zxc"
pos1,pos2 = string.find(a,"qwe")
print(pos1,pos2)
print(string.sub(a,1,3))
local b = string.gsub(a,"qwe","iop")
print(b)
local str = string.match(a,"asd")
print(str)

for w in string.gmatch(a,"%a+") do
	print(w)
end
