--n = io.read()
--assert(tonumber(n),"n .. not a number")

print("enter a number:")
n = assert(io.read("*number"), "invalid input")
