am={"aa","cc","dd","ll","gg"}
arr=function()
	local i
	for i=1,#am,1 do
		print(i..":"..am[i])
	end
end

table.sort(am)
arr()
