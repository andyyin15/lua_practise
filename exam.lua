local arr= {2,3,9,6,5}
table.sort(arr)
local t=0
local zero=0
local y = 0



for i=1,5 do
	if arr[i]~=0 then
		t=i
	else
		zero =zero +1
	end
end

for i=t,4 do
	if t==5 then
		print("yes")
	end
	if arr[t]+1==arr[t+1] then
		break

	else
		print("no")
	end
end

��Ŀ�����ǣ���һ����������5������[0-13]֮�䣬0���Ա�ʾ������
�ж�������Ƿ�����������
