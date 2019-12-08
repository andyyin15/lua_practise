local a,n,s,i,t
s=0
a=2
t=a
print("please enter a number")
n=io.read("*n")
for i=1,n do
     s=s+a
     a=a+(10^i)*t

end
print(s)
