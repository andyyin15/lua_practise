table1 = {
	a = 12,
	b = "string",
	c = "string12",
	d = 98
}

--setmetatable(table1,{__index = {tostring1 = "hhhhh"}})
setmetatable(table1,{__tostring = function()  return "sdafs" end})

print(tostring(table1.a))
print(tostring(table1.b))
print(tostring(table1.c))
print(tostring(table1.d))
--print(tostring(table1.tostring1))
print(tostring(table1))
