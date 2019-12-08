print("create a file and lua will help you saved")
local file=io.open("D:\Lua\5.1\lua","w+")
local a,b
print("please enter a string")
a=io.read()
b=#a
arr={}
for i=1,b do
	arr[i]=string.sub(a,i,i)
	if arr[i]=="#" then
		break
	end
	print(arr[i])
end
