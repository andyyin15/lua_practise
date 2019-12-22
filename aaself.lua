arr={}
arr = {a=12,b=321,c=444}
brr={d=333}
function arr:new(o)
	o = o or {}
	setmetatable(o,self)
	self.__index = self
	return o
end

aa = arr:new(o)
print(aa.a)
