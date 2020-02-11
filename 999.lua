local A
A="a=b b=c"
print(string.gfind(A,"[^%s+]=[^%s+]"))

local iter = string.gfind("a=b c=d", "[^%s+]=[^%s+]")
print(iter())

local s
s="<qwe><tgh>"
local iter
iter = string.gfind(s,"<(.-)><(.-)>")
--iter = string.match(s,"<^%s+><^%s+>")
print(iter())

