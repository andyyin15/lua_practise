local s = "hello lua nihao"
print(string.match(s,"%a+"))
--print(string.gmatch(s,"%a+"))
words={}
local w
for w in string.gmatch(s,"%a+") do
	if w == nil then
	return
	end
	words[#words+1]=w
end
print(#words)
