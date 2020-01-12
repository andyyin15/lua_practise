arr = {}
function setDefault(t,d)
	arr = {__index = function () return d end}
	t = t or {}
	setmetatable(t,arr)
end

ar = {}
setDefault(ar,3)
print(ar.rt2s)
