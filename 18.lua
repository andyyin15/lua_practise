local a,b,t,i,s
a=1
b=2
s=0
for i=1,20 do
	s=s+b/a
	t=b
	b=a+b
	a=t
end
print(s)
