f = 4
function a()
    f = 3
    print(getfenv(0).f, getfenv(1).f, getfenv(2).f, getfenv(3).f)
end
A = {}
setmetatable(A, {__index = _G})
setfenv(a, A)

function b()
    f = 2
    A.a()
end
B = {}
setmetatable(B, {__index = _G})
setfenv(b, B)

function c()
    f = 1
    B.b()
end
C = {}
setmetatable(C, {__index = _G})
setfenv(c, C)
c()
