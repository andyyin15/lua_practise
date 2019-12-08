local n = 10
function func(n)
	if n>0 then
	return func(n-1) end
end
func(10)
