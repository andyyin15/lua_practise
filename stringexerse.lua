a = 16
print(string.format("%X",a))
print(string.format("%f",a))
b = -15.23
print(string.format("%u",b))
print(string.format("%u",b))


print(string.format("%6f", 13.1))
v = "qwresadf"
print(string.sub(v,2,-2))
print(string.find(v,"re"))
--print(string.gsub(v,"%w+",))
print(string.sub(v,3,4))

cha = "lua is greatlua is greatlua is greatlua is great"
print(string.gsub(cha,"great","easy"))

print(string.format("%5.3s", "monkey") )

aa="qwer234tya546sf"
str = string.gmatch(aa,"%d+")
print(str())
print(str())
print(string.find(aa,"%d+"))
print(string.sub(aa,5,7))
print(string.match(aa,"%d+"))
print(string.match(aa,"%d+"))

print(string.format("%10.2s", b) )


local time = timeNow
os.date("*t", time)
print(os.date("*t", time))
