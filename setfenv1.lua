a=1
setfenv(a,{g=_G})
g.print(g.a)
