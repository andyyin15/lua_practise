local tab ={}
local ver = 1
function tab.func(self)
	self.ver = 2
	print(ver)
	print(self.ver)
end
tab:func()
