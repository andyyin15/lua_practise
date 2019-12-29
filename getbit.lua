function getIntPart(x)
	if x <= 0 then
   		return math.ceil(x);
	end

	if math.ceil(x) == x then
   		x = math.ceil(x);
	else
   		x = math.ceil(x) - 1;
	end
	return x;
end


math.GetBit = function(value, bit)
	if(not bit) then
		return
	end
	value = value or 0
	local temp = math.pow(2,bit)
	value = math.mod(value, temp)
	print(getIntPart(value*2/temp))
	return getIntPart(value*2/temp)
end

math.GetBit(27262976,31)
