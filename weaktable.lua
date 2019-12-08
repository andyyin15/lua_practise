t1, t2 = {}, {}
local a=1

arr = {}
arr[a] = t1
arr[2] = t2
setmetatable(arr, {__mode = "kv"})
--t1 = nil --此时我们将t1赋值为nil，表明这一部分的内容我们不需要再使用，可以被回收
table.remove(arr,1)
collectgarbage()    --  手动执行gc回收操作

for k, v in pairs(arr) do
    print(k, v)
end
