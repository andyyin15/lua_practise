--goodsList={goods={goodsId=30025},goods={goodsId=40014},goods={goodsId=50014},goods={goodsId=60014}}
--print(goodsList[1].goodsId)

print(math.mod(30,4))

time = os.date("*t",os.time())
for i,v in pairs(time) do
	print(i,v)
end


print(os.date("today is %c, in %A"))
print(math.pi)

print(os.date("*t")["day"])
print(os.date("*t")["year"])

print(os.date("*t")["year"].."Äê"..os.date("*t")["day"])

print(math.fmod(15, 4))
print(math.fmod((27  - 1),7 ))
