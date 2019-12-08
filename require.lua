--print(package.path)
--package.path ="G:/Program Files/a.lua"..";.\?.lua"
--print(a)
--package.path = package.path ..";G:\Program Files\a.lua"
--print(package.path)
--table.insert(package.path,1,"G:\Program Files\a.lua;")

--package.path = package.path ..";G:\Program Files\a.lua"
--print(package.path)

--package.path = "G:/Program Files/a.lua"..";..\\?.lua"
--print(package.path)
--require "a"
--print(a)
--print(package.path)

package.path = "G:/Program Files/a.lua" ..";..\\?.lua"
require "a"
print(a)
