local a,b,s,t,i
a=1
b=2
s=0
t=b

for i=1,20 do
	t=b
	s=s+b/a
	b=a+b
	a=t
end
print(s)
