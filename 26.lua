local i,n,s,j
s=1
i=1
for j=2,20 do
	repeat i=i*j
		j=j-1
		--print(i)
	until j==1

	s=s+i
	i=1
end
print(s)
