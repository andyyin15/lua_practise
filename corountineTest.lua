print("123")
co = coroutine.create(function (a,b)
	print("qwe")
 print("111co",a+b)
 print("asd")
 end)

print("0000")
coroutine.resume(co,1,2)
print("test")

print("****************************")
print("firsrt")
co1 = coroutine.create(
	function (a,b)
		print(coroutine.status(co1),"222")
		print(coroutine.yield(a+b,a-b),"5555")

		print(coroutine.status(co1),"333")
	end
)

print("second")
print(coroutine.status(co1),"111")
print(coroutine.resume(co1,2,3))
print(coroutine.resume(co1))
--coroutine.wrap(co1,2,3)

print("****************************")

co2 = coroutine.create(
	function()
		print("co2",coroutine.yield())
	end
)
coroutine.resume(co2)
coroutine.resume(co2,1,4)
print("****************************")

co3 = coroutine.create (function ()
print(coroutine.status(co3),"1111")
print("co3", coroutine.yield())
print(coroutine.status(co3),"22222")
end)

print(coroutine.status(co3),"3333")
print(coroutine.resume(co3),"qqqq")
print(coroutine.status(co3),"5555")
coroutine.resume(co3, 4, 5)

print("########################")

co4 = coroutine.create(function ()
return 6, 7
end)
print(coroutine.resume(co4))
