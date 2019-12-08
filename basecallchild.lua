arr ={}
arr.proto = {a=12,b=321,c=444}
mt = {}
function arr.new(o)
	o = o or {}
	setmetatable(o,mt)
	--o.__index = arr.proto
	return o
end
mt.__index = arr.proto

aaa = arr.new()
print(aaa.a)
