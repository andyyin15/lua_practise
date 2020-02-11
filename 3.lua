local shape ={area=0}
function shape:new(o,side)
	o=o or {}
	setmetatable(o,self)
	self.__index=self
	side= side or 0
	self.area =side * side
	return o

end

function shape:printarea()
	print(self.area)
end

square = shape:new()
function square:new(o,side)
	o= o or shape:new(o,side)
	setmetatable(o,self)
	self.__index= self
	return o
end

function square:printarea()
	print(self.area)
end

rectanger=shape:new()
function rectanger:new(o,width,height)
	o=o or shape:new(o)
	setmetatable(o,self)
	self.__index=self
	self.area= width * height
	return o
end

function rectanger:printarea()
	print(self.area)
end

a= shape:new(nil,10)
a.printarea(a)
b=square:new(nil,20)
b:printarea()
c=rectanger:new(nil,10,20)
c:printarea()
