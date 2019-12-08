arr={}
local str,cha,num,oth,i,j
cha=0
num=0
oth=0
print("enter a string")
str=io.read("*l")



local long
for i=1,#str do
--print(string.byte(string.sub(str,i,i)))
	if (string.byte(string.sub(str,i,i))>string.byte('a') and string.byte(string.sub(str,i,i))<string.byte('z')) or (string.byte(string.sub(str,i,i))>string.byte('A') and string.byte(string.sub(str,i,i))<string.byte('Z')) then
		cha=cha+1

	elseif
		string.sub(str,i,i)>='0' and string.sub(str,i,i)<='9' then
		num=num+1
		--print(string.sub(str,i,i))
	else
		oth=oth+1
		--print(oth)
	end
end
print(cha)
print(num)
print(oth)
