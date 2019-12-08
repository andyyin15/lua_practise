local shape={area=0}
function shape:new(o,side)
	o=o or {}
	setmetatable(o,self)
	self.__index = self
	self.area = side*side
    return o
end

function  shape:printarea()
	print(self.area)
end

a= shape:new(nil,10)
a:printarea(10)

