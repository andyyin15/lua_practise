local a,t,s
s=0
a=io.read("*n")
if a/10<1 then
	print("��λ��")

elseif a/100<1 then
	print("ʮλ��")

elseif a/1000<1 then
    print("��λ��")

elseif a/10000<1 then
	print("ǧλ��")

elseif a/100000<1 then
	print("��λ��")

else
	print("error")

end
arr={}
for i=1,#a do
	arr[i]=string.sub(a,i,i)
end
s=1+arr[#a]
for i=1,#a do
	t=arr[i]
	arr[i]=arr[s-i]
	arr[s-i]=t
	print(arr[i])
end

