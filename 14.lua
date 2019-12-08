local a,b,c,i,n
n=0

for i=100,999 do

	a=i%10
	b=i/10%10
	c=i/100%10
	if (i==(a*a*a+b*b*b+c*c*c)) then
		print(i)
	else

		n=n+1

	end

end

print(n)
