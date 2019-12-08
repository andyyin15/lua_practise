
local mt = require"1000"
mt.hotupdate(10)


function reload_module(module_name)
    local old_module = _G[module_name]

    package.loaded[module_name] = nil
    require (module_name)

    local new_module = _G[module_name]
    for k, v in pairs(new_module) do
        old_module[k] = v
    end

    package.loaded[module_name] = old_module
end

function reload()
    local mt = {"1000"}
    for k, v in pairs(mt) do
        reload_module(v)
    end
end
