local A,B,C
local num
print("Please enter your grade:")
num =io.read("*n")
if num>90 and num==90 then
	print("A")
elseif num<=89 and num>=60 then
	print("B")
else
	print("C")
end
