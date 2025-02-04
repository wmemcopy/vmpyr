--[[

        vmpyr.vip

        with 💖 by marshall

        sophia is cute asf

]]

-- helper functions
local unpack, insert, remove, clear = table.unpack, table.insert, table.remove, table.clear
local f, u, l = string.format, string.upper, string.lower
local wait, spawn = task.wait, task.spawn
local str, int, bool = tostring, tonumber, function(o)
    if type(o) == "string" then
        return (o == "true") and true or false
    end
    if type(o) == "number" then
        return (o == 1) and true or false
    end
    return nil
end

-- dummy functions
local retself = function(...) return ... end
local retnil = function(...) return nil end

-- call protection
local x = {}
local clonef = clonefunction and clonefunction or retself
local cloner = cloneref and cloneref or retself
setmetatable(x, {
    __index = function(self, index)
        local obj = getgenv()[index]
        if typeof(obj) == "table" then
            warn(f("%s was called!", index))
            return cloner(obj)
        end
        if typeof(obj) == "function" then
            warn(f("%s was called!", index))
            return clonef(obj)
        end
    end
})

-- make framework
local vmpyr = {
    version = "1.00b";
    revision = "preview";
    executor = x.identifyexecutor and l(x.identifyexecutor()) or "unknown";

    debug = true;

    url = "https://raw.githubusercontent.com/wmemcopy/vmpyr/refs/heads/main/modules/%s.lua?token=GHSAT0AAAAAAC5IXIITEBLN7GFKVAINSIWGZ5CKZRQ";
}

function vmpyr:import(name)
    return loadstring(game:HttpGet(f("%s%s", self.url, name)))()
end


-- import modules
for _, module in next, {
    "signal"; "instance"; "loop";
} do
    print(f("importing module %s...", module))
    x[module] = vmpyr:import(module)
end

