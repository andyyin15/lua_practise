--a= "<{(qwesrwef1243sdfasd)}>"
--print(string.find(a,"<{("))

a="qwe123asd123"
count = select(2,string.gsub(a,"123","789"))
print(count)

function func(...)
	for i=1,select("#",...) do
		local arg = select(i,...)
		print("i" .. arg)
	end
end
func(1,2,3,4)

local words = {}
arr="<qwe+rew@word}>"
for w in string.gmatch(arr,"%a+") do
	words[#words+1] = w
	print(w)
end
for k,v in pairs(words) do
	print("k" .."=" .. v )
end
