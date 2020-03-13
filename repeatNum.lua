arr= {1,4,3,5,3,6,1}
arr1={}
for i=1,#arr do
	arr1[arr[i]]=0
end

for j=1,#arr do
	arr1[arr[j]]=arr1[arr[j]]+1
end
print(unpack(arr1))
