function status()
    print("co1's status :"..coroutine.status(co1).." ,co2's status: "..coroutine.status(co2))
end

-- 协程1
co1 = coroutine.create(function ( a )
    print("co1 arg is :"..a)
    status()

	-- 唤醒协程2
	local stat,rere = coroutine.resume(co2,"2")
    print("111 co2 resume's return is "..rere)
    status()

	-- 再次唤醒协程2
	local stat2,rere2 = coroutine.resume(co2,"4")
    print("222 co2 resume's return is "..rere2)
    local arg = coroutine.yield("6")
end)

-- 协程2
co2 = coroutine.create(function ( a )
    print("co2 arg is :"..a)
    status()
    local rey = coroutine.yield("3")
    print("co2 yeild's return is " .. rey)
    status()
    coroutine.yield("5")
end)

--主线程执行协程co1,传入字符串“main thread arg”
stat,mainre = coroutine.resume(co1,"main thread arg")
status()
print("last return is "..mainre)
