
for n=1,9 do
	s=""
	local start = os.clock()
	for m=1,9 do
		if n <= m then
		s=m.."*"..n.."="..m*n.."|"
		end
		print(s)
	end
	local end1 = os.clock()
	print(tostring(end1 - start))
end
