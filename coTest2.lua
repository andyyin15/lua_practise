vo = coroutine.create(function()
	for i=1,10 do
		print("vo",i)
		print(coroutine.yield(),"handsome")
	end


end
)

coroutine.resume(vo)
coroutine.resume(vo,2)
