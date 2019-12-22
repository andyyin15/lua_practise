a="{[=wersdf12sdf=]}"
local str = string.match(a,"%{%[%=(.-)%=%]%}")
print(str)

b= 100000
c = tostring(b)
for i =1,#c do
	print("i="..string.sub(b,i,i))
end

str ="{1,88888,60级职业套装}&<R{30023},{40013},{50013},{60013}&>"
--print(string.format(str,"%{(.-)%}&<"))
print(string.find(str,"{(.-)}"))
print(string.sub(str,1,22))


print(string.find(str,"<R(.-)&>"))

