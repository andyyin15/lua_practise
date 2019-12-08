local a
file =io.open("aa.txt","w+")
file:write("qwe")
file:close()
file=io.open("aa.txt","r")
for line in io.lines("aa.txt") do
	print(line)
end
