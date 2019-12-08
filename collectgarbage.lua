arr = {"apple","banana","tamato","bear"}
print(collectgarbage("count"))
print(collectgarbage("count")*1024)
arr = nil
print(collectgarbage("collect"))
print(collectgarbage("count")*1024)
