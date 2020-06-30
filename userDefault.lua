
  cc.UserDefault:getInstance():setIntegerForKey("integer", 10)
local i = cc.UserDefault:getInstance():getIntegerForKey("integer")
print(i)
