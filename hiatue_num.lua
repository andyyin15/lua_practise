arr={1,2,3,4,5,6,8,9,10}
sum=0
for i=1,#arr do
	sum= sum+arr[i]
end

sum2=(arr[1]+arr[#arr])*(#arr+1)/2
hiatue_num = sum2-sum
print(hiatue_num)
--print(sum)
