arr={}
arr.pro = {a=1,b=12,c=122,d=543}
arr.mt = {}
function arr.new(o)
	o = o or {}
	setmetatable(o,arr.mt)
	return o
end

arr.mt.__index = arr.pro
--w = arr.new()
--print(w.c)

arr.mt.__newindex = arr.pro
	--if k == "qwe" then
		--rawset(arr.mt,qwe,"")
	--end
	--rawset(arr.mt,k,v)



w = arr.new()
w.qwe = 654
print(w.qwe)
print(arr.mt.qwe)
print(arr.pro.qwe)
print(w.a)
print("hh")
