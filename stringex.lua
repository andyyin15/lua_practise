local a = "wqeWER1234sdfgt"
print(string.len(a))
print(string.rep(a,2))
print(string.lower(a))
local b = "123ertw1234dsag2019/12/12qwer"
print(string.match(b,"%d+/%d+/%d+"))

print(string.format("PI=%.5f",3.1415926))

d = 5; m = 11; y = 190

print(string.format("%02d/%02d/%04d", d, m, y))

tag, title = "h1", "a title"


print(string.format("<%s>%s</%s>",tag,title,tag))

   --> <h1>a title</h1>
