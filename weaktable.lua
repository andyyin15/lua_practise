t1, t2 = {}, {}
local a=1

arr = {}
arr[a] = t1
arr[2] = t2
setmetatable(arr, {__mode = "kv"})
--t1 = nil --��ʱ���ǽ�t1��ֵΪnil��������һ���ֵ��������ǲ���Ҫ��ʹ�ã����Ա�����
table.remove(arr,1)
collectgarbage()    --  �ֶ�ִ��gc���ղ���

for k, v in pairs(arr) do
    print(k, v)
end
