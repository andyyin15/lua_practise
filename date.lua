print(os.date("%a"))
print(os.date("today is %H"))

local x = os.clock()
local s = 0

for i=1,10000000 do
	s=s+i
end
print(string.format("�˶δ�������ʱ�䣺%.3f\n",os.clock()-x))
