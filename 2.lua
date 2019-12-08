local arr={2,4,1,6,3,44,25,66}
local brr={7,77,777,7777}

t=setmetatable(brr,{__index=arr})
a=brr[3]
print(a)
print(brr[8])
