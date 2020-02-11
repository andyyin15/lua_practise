set ={}
mt ={}
function set.new(o)
	o = o or {}
	setmetatable(o,mt)
	return o
end

mt.__add = function(x,y)
	return "abc"
end

a= set.new()
b= set.new()
print(a+b)
print(type(a))
