function g()
    --[[ ��ʱ����"g"�����õ���δִ����ɣ��ǻ���������������ȡ���Ǻ���"g"����Ϣ��
         "debug.getinfo(2)"��ȡ�Ĳ��Ǻ���"f"����Ϣ��]]
    local x = debug.getinfo(1, "n")
    for k, v in pairs(x) do
        print(k, v)
    end
end

function f()
    -- ��ʱ����"f"�����õ���δִ����ɣ��ǻ���������������ȡ���Ǻ���"f"����Ϣ��
    local x = debug.getinfo(1, "n")
    for k, v in pairs(x) do
        print(k, v)
    end
    print()

    g()
end

f()

