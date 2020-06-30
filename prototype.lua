
Window = {}

Window.prototype = {x = 0 ,y = 0 ,width = 100 ,height = 100,}

Window.mt = {}

function Window.new(o)
	setmetatable(o ,Window.mt)
	return o
end

Window.mt.__index = Window.prototype

Window.mt.__newindex = function (table ,key ,value)
	if key == "wangbin" then
		rawset(table ,"wangbin" ,"yes,i am")
	end
end

w = Window.new{x = 10 ,y = 20}
w.wangbin = "55"
print(w.wangbin)
print(Window.prototype.wangbin)
