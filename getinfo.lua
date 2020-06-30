function g()
    --[[ 此时函数"g"被调用但还未执行完成，是活动函数。所以这里获取的是函数"g"的信息。
         "debug.getinfo(2)"获取的才是函数"f"的信息。]]
    local x = debug.getinfo(1, "n")
    for k, v in pairs(x) do
        print(k, v)
    end
end

function f()
    -- 此时函数"f"被调用但还未执行完成，是活动函数。所以这里获取的是函数"f"的信息。
    local x = debug.getinfo(1, "n")
    for k, v in pairs(x) do
        print(k, v)
    end
    print()

    g()
end

f()

