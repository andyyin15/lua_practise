function Split(szFullString, szSeparator)
local nFindStartIndex = 1
local nSplitIndex = 1
local nSplitArray = {}
while true do
   local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
   if not nFindLastIndex then
    nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
    break
   end
   nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
   nFindStartIndex = nFindLastIndex + string.len(szSeparator)
   nSplitIndex = nSplitIndex + 1
end
return nSplitArray
end


arr={}
arr={1,a,100,100,100,2,b,99,99,99,3,c,98,98,98,4,d,97,97,97,5,e,96,96,96}
local list
list=Split("1,a,100,50,50,2,b,99,99,99,3,c,98,98,98,4,d,97,97,97,5,e,96,96,96",",")
--table.insert(list,6,100)
--print(unpack(list))
for i=1,#arr+4 do
	if i%5==0 then
		print(list[i].."\n"..((list[i-2]+list[i-1]+list[i])/3))
	else
		print(list[i])
	end
end
